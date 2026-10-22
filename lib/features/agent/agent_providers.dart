import 'package:flutter/material.dart' show DateTimeRange;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/api_client.dart';
import '../../api/generated/export.dart';
import '../../core/error/api_error.dart';
import '../../core/providers.dart';

// Server data read by the screens (the back-office's `useQuery`). All are
// `autoDispose`: they tear down when the agent shell unmounts at logout, so
// they never refetch under a cleared token and start fresh for the next agent.

ApiClient _api(Ref ref) => ref.watch(apiClientProvider);

final profileProvider = FutureProvider.autoDispose<AgentProfileResponse>((
  ref,
) async {
  final res = await _api(ref).send((api) => api.agentMeController.getProfile());
  return requireData(res.data);
});

final balanceProvider = FutureProvider.autoDispose<AgentBalanceResponse>((
  ref,
) async {
  final res = await _api(ref).send((api) => api.agentMeController.getBalance());
  return requireData(res.data);
});

/// Null when no limit profile is assigned (404 → "not configured").
final limitsProvider = FutureProvider.autoDispose<AgentLimitsResponse?>((
  ref,
) async {
  try {
    final res = await _api(
      ref,
    ).send((api) => api.agentLimitsController.getLimits());
    return requireData(res.data);
  } on ApiError catch (e) {
    if (e.isNotFound) return null;
    rethrow;
  }
});

final dailySummaryProvider =
    FutureProvider.autoDispose<AgentDailySummaryResponse>((ref) async {
      final res = await _api(
        ref,
      ).send((api) => api.agentSummaryController.daily());
      return requireData(res.data);
    });

/// Latest transactions of the agent's account (dashboard + activity tab).
final transactionsProvider =
    FutureProvider.autoDispose<List<AgentTransactionResponse>>((ref) async {
      final res = await _api(
        ref,
      ).send((api) => api.agentTransactionListController.list1());
      return res.data ?? const [];
    });

final transactionProvider = FutureProvider.autoDispose
    .family<AgentTransactionResponse, String>((ref, id) async {
      final res = await _api(
        ref,
      ).send((api) => api.agentTransactionListController.getById(id: id));
      return requireData(res.data);
    });

/// Statement lines for the chosen window. A null range = full history.
///
/// The backend binds `from`/`to` as ISO-8601 instants, so we send full UTC
/// instants and make the window inclusive of the last day by ending at the
/// start of the day *after* `end`.
final statementsProvider = FutureProvider.autoDispose
    .family<List<AgentStatementEntryResponse>, DateTimeRange?>((
      ref,
      range,
    ) async {
      // The picker yields local midnight; convert to UTC so the boundary is exact.
      final from = range == null
          ? null
          : DateTime(range.start.year, range.start.month, range.start.day);
      // Exclusive upper bound at the next midnight → the whole `end` day is covered.
      final to = range == null
          ? null
          : DateTime(range.end.year, range.end.month, range.end.day + 1);
      final res = await _api(ref).send(
        (api) => api.agentStatementController.list2(
          from: from?.toUtc(),
          to: to?.toUtc(),
        ),
      );
      return res.data ?? const [];
    });

/// Cards assigned to this agent (default ASSIGNED_TO_AGENT), used by the cards
/// tab and the card-sale / replacement pickers.
final cardStockProvider = FutureProvider.autoDispose<List<AgentCardStockView>>((
  ref,
) async {
  final res = await _api(
    ref,
  ).send((api) => api.agentCardStockController.listMyStock());
  return res.data ?? const [];
});

final commissionsProvider =
    FutureProvider.autoDispose<List<AgentCommissionResponse>>((ref) async {
      final res = await _api(
        ref,
      ).send((api) => api.agentCommissionController.list3());
      return res.data ?? const [];
    });

/// Unread badge count — refreshed on demand / poll.
final unreadCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final res = await _api(
    ref,
  ).send((api) => api.notificationController.unreadCount());
  return res.data?.unread ?? 0;
});

final notificationsProvider =
    FutureProvider.autoDispose<List<NotificationResponse>>((ref) async {
      final res = await _api(
        ref,
      ).send((api) => api.notificationController.list(limit: 20));
      return res.data ?? const [];
    });
