import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/common.dart';
import '../activity/statement_screen.dart';
import '../activity/transaction_detail_screen.dart';
import '../activity/tx_row.dart';
import '../agent/agent_providers.dart';
import '../cashin/cash_in_screen.dart';
import '../cashout/cash_out_screen.dart';
import '../notifications/notifications_screen.dart';
import 'float_card.dart';
import 'summary_grid.dart';
import 'quick_ops.dart';
import '../../l10n/l10n.dart';

/// Agent dashboard. The float balance hero + daily summary are the operator's
/// most-watched numbers; quick actions jump into the core cash journeys.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final balance = ref.watch(balanceProvider);
    final summary = ref.watch(dailySummaryProvider);
    final activity = ref.watch(transactionsProvider);
    final unread = ref.watch(unreadCountProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(balanceProvider);
        ref.invalidate(dailySummaryProvider);
        ref.invalidate(transactionsProvider);
        ref.invalidate(unreadCountProvider);
        await ref.read(transactionsProvider.future);
      },
      child: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          // Greeting + bell.
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.homeAgentLipa,
                        style: AppText.ui(size: 13, color: AppColors.inkMid),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        profile.maybeWhen(
                          data: (p) => p.fullName ?? '',
                          orElse: () => '…',
                        ),
                        style: AppText.ui(
                          size: 19,
                          weight: FontWeight.w700,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleButton(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  ),
                  badge: unread.maybeWhen(
                    data: (n) => n > 0 ? CountBadge(count: n) : null,
                    orElse: () => null,
                  ),
                  child: const Icon(Icons.notifications_none),
                ),
              ],
            ),
          ),

          // Float balance hero card.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FloatCard(
              balance: balance,
              profile: profile,
              onCashIn: () => _push(context, const CashInScreen()),
              onCashOut: () => _push(context, const CashOutScreen()),
              onStatement: () => _push(context, const StatementScreen()),
            ),
          ),

          // Daily summary.
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 8),
            child: Text(
              l10n.homeAujourdHui,
              style: AppText.ui(size: 15, weight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SummaryGrid(summary: summary),
          ),

          // Quick operations.
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 10),
            child: Text(
              l10n.homeOperationsRapides,
              style: AppText.ui(size: 15, weight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: profile.maybeWhen(
              data: (p) => QuickOps(profile: p),
              orElse: () => const SizedBox.shrink(),
            ),
          ),

          // Recent activity.
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 8),
            child: Text(
              l10n.homeActiviteRecente,
              style: AppText.ui(size: 15, weight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: activity.when(
              loading: () => const ActivitySkeleton(),
              error: (e, _) =>
                  ErrorRetry(message: l10n.commonImpossibleChargerActivite),
              data: (txs) => txs.isEmpty
                  ? LipaCard(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        l10n.homeAucuneOperationMoment,
                        style: AppText.ui(size: 13, color: AppColors.inkMid),
                      ),
                    )
                  : LipaCard(
                      child: Column(
                        children: [
                          for (var i = 0; i < txs.take(5).length; i++)
                            TxRow(
                              tx: txs[i],
                              divider: i > 0,
                              onTap: () => _push(
                                context,
                                TransactionDetailScreen(txId: txs[i].id ?? ''),
                              ),
                            ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

class ActivitySkeleton extends StatelessWidget {
  const ActivitySkeleton({super.key});
  @override
  Widget build(BuildContext context) {
    return LipaCard(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.brand,
          ),
        ),
      ),
    );
  }
}
