import 'package:flutter/material.dart';
import '../../api/generated/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';
import 'home_screen.dart';
import '../../l10n/l10n.dart';

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({super.key, required this.summary});
  final AsyncValue<AgentDailySummaryResponse> summary;

  @override
  Widget build(BuildContext context) {
    return summary.when(
      loading: () => const ActivitySkeleton(),
      error: (_, _) => ErrorRetry(message: l10n.summaryGridResumeIndisponible),
      data: (s) => Row(
        children: [
          Expanded(
            child: _Stat(
              label: l10n.summaryGridVolume,
              value: fmtKmfNoUnit(s.totalCompletedAmountToday ?? 0),
              unit: 'KMF',
              icon: Icons.swap_horiz_rounded,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _Stat(
              label: l10n.summaryGridOperations,
              value: '${s.totalCompletedCountToday}',
              icon: Icons.tag_rounded,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _Stat(
              label: l10n.commonCommission,
              value: fmtKmfNoUnit(s.commissionEarnedToday ?? 0),
              unit: 'KMF',
              icon: Icons.savings_outlined,
              accent: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.label,
    required this.value,
    this.unit,
    required this.icon,
    this.accent = false,
  });
  final String label;
  final String value;
  final String? unit;
  final IconData icon;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return LipaCard(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
            color: accent ? AppColors.brand : AppColors.inkLow,
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: AppText.mono(
                    size: 17,
                    weight: FontWeight.w600,
                    color: accent ? AppColors.brandDeep : AppColors.inkHi,
                  ),
                ),
                if (unit != null) ...[
                  const SizedBox(width: 3),
                  Text(
                    unit!,
                    style: AppText.mono(size: 10, color: AppColors.inkLow),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(label, style: AppText.ui(size: 11.5, color: AppColors.inkMid)),
        ],
      ),
    );
  }
}
