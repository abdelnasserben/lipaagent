import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';
import '../agent/agent_providers.dart';
import '../../l10n/l10n.dart';

/// Assigned transaction limits (spec §5.2). Null when no profile is assigned.
class LimitsScreen extends ConsumerWidget {
  const LimitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limits = ref.watch(limitsProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.commonPlafonds,
              subtitle: l10n.limitsLimitesTransaction,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: limits.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.brand),
                ),
                error: (_, _) => Padding(
                  padding: EdgeInsets.all(16),
                  child: ErrorRetry(message: l10n.limitsPlafondsIndisponibles),
                ),
                data: (l) => l == null
                    ? EmptyState(
                        icon: Icons.speed_rounded,
                        title: l10n.limitsAucunPlafondConfigure,
                        message: l10n.limitsAucunProfilLimitesN,
                      )
                    : _Body(limits: l),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.limits});
  final AgentLimitsResponse limits;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        LipaCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(
                Icons.verified_outlined,
                color: AppColors.brandDeep,
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      limits.profileName ?? '',
                      style: AppText.ui(size: 15, weight: FontWeight.w700),
                    ),
                    Text(
                      l10n.limitsKycRequis(
                        KycLevel.parse(limits.requiredKycLevel).label,
                      ),
                      style: AppText.ui(size: 12.5, color: AppColors.inkMid),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.limitsTransaction,
          style: AppText.ui(size: 13, weight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        LipaCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _row(l10n.limitsMinimum, limits.minTransactionAmount),
              _row(l10n.limitsMaximum, limits.maxTransactionAmount, last: true),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.limitsCumuls,
          style: AppText.ui(size: 13, weight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        LipaCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _row(l10n.limitsPlafondJournalier, limits.maxDailyAmount),
              _row(l10n.limitsPlafondHebdomadaire, limits.maxWeeklyAmount),
              _row(l10n.limitsPlafondMensuel, limits.maxMonthlyAmount),
              _countRow(
                l10n.limitsTransactionsJour,
                limits.maxDailyTransactionCount,
              ),
              _countRow(
                l10n.limitsTransactionsMois,
                limits.maxMonthlyTransactionCount,
                last: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(String label, int? value, {bool last = false}) => DetailRow(
    label: label,
    value: value == null ? l10n.limitsNonDefini : fmtKmf(value),
    mono: value != null,
    last: last,
  );

  Widget _countRow(String label, int? value, {bool last = false}) => DetailRow(
    label: label,
    value: value == null ? l10n.limitsNonDefini : '$value',
    mono: value != null,
    last: last,
  );
}
