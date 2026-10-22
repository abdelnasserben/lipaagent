import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/api_client.dart';
import '../../api/generated/export.dart';
import '../../api/operation_key.dart';
import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../agent/agent_providers.dart';

/// State shared by the card screens: one request at a time, its error, and
/// what the server answered.
class CardActionState<T> {
  const CardActionState({this.busy = false, this.error, this.result});

  final bool busy;

  /// The [ApiError] (or another failure) of the last request.
  final Object? error;
  final T? result;
}

// ── Card sale ────────────────────────────────────────────────────────────

class CardSaleState {
  const CardSaleState({
    this.busy = false,
    this.error,
    this.customer,
    this.result,
  });

  final bool busy;
  final Object? error;
  final CustomerLookupResponse? customer;
  final AgentCardSaleResponse? result;

  CardSaleState copyWith({
    bool? busy,
    Object? error,
    bool clearError = false,
    CustomerLookupResponse? customer,
    bool clearCustomer = false,
    AgentCardSaleResponse? result,
  }) => CardSaleState(
    busy: busy ?? this.busy,
    error: clearError ? null : (error ?? this.error),
    customer: clearCustomer ? null : (customer ?? this.customer),
    result: result ?? this.result,
  );
}

/// Card sale: confirm the customer, scan a card of the agent's stock, sell.
class CardSaleController extends Notifier<CardSaleState> {
  @override
  CardSaleState build() => const CardSaleState();

  final _operationKey = OperationKey();
  ApiClient get _api => ref.read(apiClientProvider);

  Future<void> lookup(String phoneNumber) async {
    state = state.copyWith(busy: true, clearError: true);
    try {
      final answer = await _api.send(
        (api) => api.agentTransactionController.lookupCustomer(
          phoneCountryCode: '269',
          phoneNumber: phoneNumber.replaceAll(RegExp(r'\D'), ''),
        ),
      );
      if (!ref.mounted) return;
      state = state.copyWith(busy: false, customer: requireData(answer.data));
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(busy: false, error: e);
    }
  }

  void clearCustomer() =>
      state = state.copyWith(clearCustomer: true, clearError: true);

  Future<void> sell({required String nfcUid, required int price}) async {
    final customerId = state.customer?.customerId;
    if (customerId == null || price <= 0) return;
    state = state.copyWith(busy: true, clearError: true);
    try {
      final answer = await _api.send(
        (api) => api.agentTransactionController.sellCard(
          idempotencyKey: _operationKey.forIntent('$customerId|$nfcUid|$price'),
          body: AgentCardSaleRequest(
            customerId: customerId,
            nfcUid: nfcUid,
            cardPrice: price,
          ),
        ),
      );
      if (!ref.mounted) return;
      ref.invalidate(balanceProvider);
      ref.invalidate(cardStockProvider);
      ref.invalidate(transactionsProvider);
      state = state.copyWith(busy: false, result: requireData(answer.data));
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(busy: false, error: e);
    }
  }
}

final cardSaleControllerProvider =
    NotifierProvider.autoDispose<CardSaleController, CardSaleState>(
      CardSaleController.new,
    );

// ── Card replacement ─────────────────────────────────────────────────────

/// Replaces a customer's reported card by a card of the agent's stock.
class CardReplaceController
    extends Notifier<CardActionState<AgentCardReplacementResponse>> {
  @override
  CardActionState<AgentCardReplacementResponse> build() =>
      const CardActionState();

  final _operationKey = OperationKey();

  Future<void> replace({
    required CardLookupResponse card,
    required String stockId,
    required int fee,
  }) async {
    final customerId = card.customerId;
    final cardId = card.cardId;
    if (customerId == null || cardId == null || fee <= 0) return;
    state = const CardActionState(busy: true);
    try {
      final answer = await ref
          .read(apiClientProvider)
          .send(
            (api) => api.agentCardReplacementController.replace(
              customerId: customerId,
              cardId: cardId,
              idempotencyKey: _operationKey.forIntent('$stockId|$fee'),
              body: AgentCardReplaceRequest(
                stockId: stockId,
                replacementFee: fee,
              ),
            ),
          );
      if (!ref.mounted) return;
      ref.invalidate(balanceProvider);
      ref.invalidate(cardStockProvider);
      ref.invalidate(transactionsProvider);
      state = CardActionState(result: requireData(answer.data));
    } catch (e) {
      if (!ref.mounted) return;
      state = CardActionState(error: e);
    }
  }
}

final cardReplaceControllerProvider =
    NotifierProvider.autoDispose<
      CardReplaceController,
      CardActionState<AgentCardReplacementResponse>
    >(CardReplaceController.new);

// ── Card lookup, lost / stolen ───────────────────────────────────────────

/// Finds a card by its NFC UID, then reports it lost or stolen.
class CardLookupController
    extends Notifier<CardActionState<CardLookupResponse>> {
  @override
  CardActionState<CardLookupResponse> build() => const CardActionState();

  ApiClient get _api => ref.read(apiClientProvider);

  Future<void> lookup(String nfcUid) async {
    state = CardActionState(busy: true, result: state.result);
    try {
      final answer = await _api.send(
        (api) => api.agentTransactionController.lookupCard(nfcUid: nfcUid),
      );
      if (!ref.mounted) return;
      state = CardActionState(result: requireData(answer.data));
    } catch (e) {
      if (!ref.mounted) return;
      state = CardActionState(error: e);
    }
  }

  /// Blocks the card at once. Returns the failure, if any, for a message.
  Future<Object?> report({required bool stolen}) async {
    final card = state.result;
    final customerId = card?.customerId;
    final cardId = card?.cardId;
    if (customerId == null || cardId == null) return null;
    state = CardActionState(busy: true, result: card);
    try {
      final answer = await _api.send(
        (api) => stolen
            ? api.agentCardController.reportStolen(
                customerId: customerId,
                cardId: cardId,
              )
            : api.agentCardController.reportLost(
                customerId: customerId,
                cardId: cardId,
              ),
      );
      if (!ref.mounted) return null;
      state = CardActionState(result: requireData(answer.data));
      return null;
    } catch (e) {
      if (!ref.mounted) return e;
      state = CardActionState(result: card);
      return e;
    }
  }
}

final cardLookupControllerProvider =
    NotifierProvider.autoDispose<
      CardLookupController,
      CardActionState<CardLookupResponse>
    >(CardLookupController.new);
