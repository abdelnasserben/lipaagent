import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../l10n/l10n.dart';

/// A single transaction row (icon, type+time, signed amount + status dot).
/// Direction comes from the backend's balanceChange (incoming = credited).
class TxRow extends StatelessWidget {
  const TxRow({super.key, required this.tx, this.divider = false, this.onTap});

  final AgentTransactionResponse tx;
  final bool divider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final incoming = tx.incoming;
    final (icon, label) = _present(tx.kind, incoming);
    final at = tx.effectiveAt;
    final amountColor = tx.state.isDeclined
        ? AppColors.inkLow
        : (incoming ? AppColors.brandDeep : AppColors.inkHi);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: divider
              ? const Border(top: BorderSide(color: AppColors.border))
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(icon, size: 19, color: AppColors.ink),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.ui(size: 14, weight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    at != null ? fmtRelativeFr(at) : '—',
                    style: AppText.ui(size: 12, color: AppColors.inkLow),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  fmtKmf(tx.signedAmount, signed: incoming),
                  style: AppText.mono(
                    size: 14,
                    weight: FontWeight.w600,
                    color: amountColor,
                  ),
                ),
                const SizedBox(height: 3),
                _StatusDot(status: tx.state),
              ],
            ),
          ],
        ),
      ),
    );
  }

  (IconData, String) _present(TransactionType type, bool incoming) {
    return switch (type) {
      TransactionType.cashIn => (Icons.south_west_rounded, l10n.commonDepot),
      TransactionType.merchantCashOut => (
        Icons.north_east_rounded,
        l10n.commonRetraitMarchand,
      ),
      TransactionType.cardSale => (
        Icons.credit_card_rounded,
        l10n.commonVenteCarte,
      ),
      TransactionType.cardReplacement => (
        Icons.sync_rounded,
        l10n.commonRemplacementCarte,
      ),
      TransactionType.commissionPayout => (
        Icons.savings_outlined,
        l10n.labelVersementCommission,
      ),
      TransactionType.agentFloatTopUp => (
        Icons.account_balance_wallet_outlined,
        l10n.labelApprovisionnementFloat,
      ),
      _ => (Icons.swap_horiz_rounded, type.label),
    };
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.status});
  final TransactionStatus status;

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      TransactionStatus.completed => (AppColors.brand, l10n.commonEffectue),
      TransactionStatus.pending => (AppColors.pending, l10n.commonAttente),
      TransactionStatus.authorized => (AppColors.info, l10n.commonAutorise),
      TransactionStatus.declined => (AppColors.danger, l10n.commonRefuse),
      TransactionStatus.reversed => (AppColors.warn, l10n.commonAnnule),
      TransactionStatus.unknown => (AppColors.inkLow, '—'),
    };
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: AppText.ui(size: 11.5, color: AppColors.inkMid)),
      ],
    );
  }
}
