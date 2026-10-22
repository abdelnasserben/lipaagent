import '../../api/api_client.dart';
import '../../api/generated/export.dart';
import '../../api/operation_key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../agent/agent_providers.dart';
import '../../l10n/l10n.dart';

enum CashInStep { lookup, amount, submitting, done, error }

class CashInState {
  const CashInState({
    this.step = CashInStep.lookup,
    this.looking = false,
    this.customer,
    this.amount = 0,
    this.result,
    this.errorMessage,
  });

  final CashInStep step;
  final bool looking;
  final CustomerLookupResponse? customer;
  final int amount;
  final AgentCashResponse? result;
  final String? errorMessage;

  CashInState copyWith({
    CashInStep? step,
    bool? looking,
    CustomerLookupResponse? customer,
    int? amount,
    AgentCashResponse? result,
    String? errorMessage,
    bool clearError = false,
  }) => CashInState(
    step: step ?? this.step,
    looking: looking ?? this.looking,
    customer: customer ?? this.customer,
    amount: amount ?? this.amount,
    result: result ?? this.result,
    errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
  );
}

/// Drives the cash-in flow: customer lookup → amount → submit. One controller
/// instance owns a single idempotency key for the financial submit (spec §11.2).
class CashInController extends Notifier<CashInState> {
  @override
  CashInState build() => const CashInState();
  static const _countryCode = '269';
  final _operationKey = OperationKey();

  ApiClient get _api => ref.read(apiClientProvider);

  Future<void> lookup(String phoneNumber) async {
    state = state.copyWith(looking: true, clearError: true);
    try {
      final answer = await _api.send(
        (api) => api.agentTransactionController.lookupCustomer(
          phoneCountryCode: _countryCode,
          phoneNumber: phoneNumber.replaceAll(RegExp(r'\D'), ''),
        ),
      );
      final c = requireData(answer.data);
      if (!ref.mounted) return;
      state = state.copyWith(
        looking: false,
        customer: c,
        step: CashInStep.amount,
      );
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(looking: false, errorMessage: apiErrorMessage(e));
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        looking: false,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }

  void setAmount(int amount) => state = state.copyWith(amount: amount);

  void backToLookup() =>
      state = state.copyWith(step: CashInStep.lookup, clearError: true);

  Future<void> submit() async {
    final customerId = state.customer?.customerId;
    if (customerId == null || state.amount <= 0) return;
    state = state.copyWith(step: CashInStep.submitting, clearError: true);
    try {
      final answer = await _api.send(
        (api) => api.agentTransactionController.cashIn(
          idempotencyKey: _operationKey.forIntent(
            '$customerId|${state.amount}',
          ),
          body: AgentCashInRequest(
            customerId: customerId,
            amount: state.amount,
          ),
        ),
      );
      final res = requireData(answer.data);
      if (!ref.mounted) return;
      // The float moved — refresh balance / dashboard.
      ref.invalidate(balanceProvider);
      ref.invalidate(dailySummaryProvider);
      ref.invalidate(transactionsProvider);
      ref.invalidate(statementsProvider);
      state = state.copyWith(step: CashInStep.done, result: res);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        step: CashInStep.amount,
        errorMessage: apiErrorMessage(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        step: CashInStep.amount,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }
}

final cashInControllerProvider =
    NotifierProvider.autoDispose<CashInController, CashInState>(
      CashInController.new,
    );
