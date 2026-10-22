import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../../data/models/cash_result.dart';
import '../../data/models/lookup.dart';
import '../../data/repositories/agent_repository.dart';
import '../agent/agent_providers.dart';

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
  final CustomerLookup? customer;
  final int amount;
  final AgentCashInResult? result;
  final String? errorMessage;

  CashInState copyWith({
    CashInStep? step,
    bool? looking,
    CustomerLookup? customer,
    int? amount,
    AgentCashInResult? result,
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

  AgentRepository get _repo => ref.read(agentRepositoryProvider);

  Future<void> lookup(String phoneNumber) async {
    state = state.copyWith(looking: true, clearError: true);
    try {
      final c = await _repo.lookupCustomer(
        phoneCountryCode: _countryCode,
        phoneNumber: phoneNumber.replaceAll(RegExp(r'\D'), ''),
      );
      if (!ref.mounted) return;
      state = state.copyWith(
        looking: false,
        customer: c,
        step: CashInStep.amount,
      );
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        looking: false,
        errorMessage: frenchMessageForError(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        looking: false,
        errorMessage: 'Une erreur est survenue.',
      );
    }
  }

  void setAmount(int amount) => state = state.copyWith(amount: amount);

  void backToLookup() =>
      state = state.copyWith(step: CashInStep.lookup, clearError: true);

  Future<void> submit() async {
    final customer = state.customer;
    if (customer == null || state.amount <= 0) return;
    state = state.copyWith(step: CashInStep.submitting, clearError: true);
    try {
      final res = await _repo.cashIn(
        idempotencyKey: _operationKey.forIntent(
          '${customer.customerId}|${state.amount}',
        ),
        customerId: customer.customerId,
        amount: state.amount,
      );
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
        errorMessage: frenchMessageForError(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        step: CashInStep.amount,
        errorMessage: 'Une erreur est survenue.',
      );
    }
  }
}

final cashInControllerProvider =
    NotifierProvider.autoDispose<CashInController, CashInState>(
      CashInController.new,
    );
