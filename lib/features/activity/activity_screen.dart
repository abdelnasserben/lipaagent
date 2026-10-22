import 'package:flutter/material.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/common.dart';
import '../agent/agent_providers.dart';
import 'statement_screen.dart';
import 'transaction_detail_screen.dart';
import 'tx_row.dart';
import '../../l10n/l10n.dart';

/// Wallet-scoped transaction history (spec §5.3). Tab root, with toutes /
/// entrées / sorties filter chips (mirrors the Lipa customer activity screen).
class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) {
    final activity = ref.watch(transactionsProvider);

    return Column(
      children: [
        ScreenHeader(
          title: l10n.commonActivite,
          subtitle: l10n.activityTransactions,
          action: CircleButton(
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const StatementScreen())),
            child: const Icon(Icons.description_outlined),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Row(
            children: [
              for (final f in [
                ('all', l10n.activityToutes),
                ('in', l10n.activityEntrees),
                ('out', l10n.activitySorties),
              ])
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: _Chip(
                    label: f.$2,
                    active: _filter == f.$1,
                    onTap: () => setState(() => _filter = f.$1),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(transactionsProvider);
              await ref.read(transactionsProvider.future);
            },
            child: activity.when(
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.brand),
              ),
              error: (_, _) => ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: ErrorRetry(
                      message: l10n.commonImpossibleChargerActivite,
                    ),
                  ),
                ],
              ),
              data: (all) {
                final txs = switch (_filter) {
                  'in' => all.where((t) => t.incoming).toList(),
                  'out' => all.where((t) => !t.incoming).toList(),
                  _ => all,
                };
                if (txs.isEmpty) {
                  return ListView(
                    children: [
                      EmptyState(
                        icon: Icons.receipt_long_rounded,
                        title: l10n.activityAucuneOperation,
                        message: l10n.activityDepotsRetraitsVentesCartes,
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  itemCount: txs.length,
                  itemBuilder: (_, i) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(i == 0 ? AppRadius.xl : 0),
                        bottom: Radius.circular(
                          i == txs.length - 1 ? AppRadius.xl : 0,
                        ),
                      ),
                    ),
                    child: TxRow(
                      tx: txs[i],
                      divider: i > 0,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              TransactionDetailScreen(txId: txs[i].id ?? ''),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.active, required this.onTap});
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: active ? AppColors.inkHi : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? AppColors.inkHi : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: AppText.ui(
            size: 12.5,
            weight: FontWeight.w600,
            color: active ? Colors.white : AppColors.inkMid,
          ),
        ),
      ),
    );
  }
}
