import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/transaction_receipt.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/status_pills.dart';
import '../agent/agent_providers.dart';
import '../../l10n/l10n.dart';

/// Full transaction detail (spec §5.3). Fetched fresh by id so the screen is
/// linkable from anywhere (dashboard, activity, receipts).
class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({super.key, required this.txId});
  final String txId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tx = ref.watch(transactionProvider(txId));

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.transactionDetailDetailOperation,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: tx.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.brand),
                ),
                error: (_, _) => Padding(
                  padding: EdgeInsets.all(16),
                  child: ErrorRetry(message: l10n.commonTransactionIntrouvable),
                ),
                data: (t) => _Body(tx: t),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.tx});
  final AgentTransactionResponse tx;

  @override
  Widget build(BuildContext context) {
    final incoming = tx.incoming;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        // Amount hero.
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              TxStatusPill(status: tx.state),
              const SizedBox(height: 14),
              Text(
                fmtKmf(tx.signedAmount, signed: incoming),
                style: AppText.mono(
                  size: 32,
                  weight: FontWeight.w600,
                  color: incoming ? AppColors.brandDeep : AppColors.inkHi,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                tx.kind.label,
                style: AppText.ui(size: 13.5, color: AppColors.inkMid),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        LipaCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              DetailRow(label: l10n.commonType, value: tx.kind.label),
              if (tx.completedAt != null)
                DetailRow(
                  label: l10n.transactionDetailEffectue,
                  value: fmtDateTimeFr(tx.completedAt!),
                ),
              if (tx.declinedAt != null)
                DetailRow(
                  label: l10n.transactionDetailRefuse,
                  value: fmtDateTimeFr(tx.declinedAt!),
                ),
              if (tx.createdAt != null)
                DetailRow(
                  label: l10n.transactionDetailCree,
                  value: fmtDateTimeFr(tx.createdAt!),
                ),
              DetailRow(
                label: l10n.commonMontant,
                value: fmtKmf(tx.requestedAmount ?? 0),
                mono: true,
              ),
              if ((tx.feeAmount ?? 0) > 0)
                DetailRow(
                  label: l10n.commonFrais,
                  value: fmtKmf(tx.feeAmount ?? 0),
                  mono: true,
                ),
              if ((tx.commissionAmount ?? 0) > 0)
                DetailRow(
                  label: l10n.commonCommission,
                  value: fmtKmf(tx.commissionAmount ?? 0),
                  mono: true,
                  valueColor: AppColors.brandDeep,
                ),
              DetailRow(
                label: l10n.transactionDetailNetDestinataire,
                value: fmtKmf(tx.netAmountToDestination ?? 0),
                mono: true,
              ),
              if (tx.declineReason != null)
                DetailRow(
                  label: l10n.transactionDetailMotifRefus,
                  value: tx.declineReason!,
                  valueColor: AppColors.danger,
                ),
              _CopyRow(
                label: l10n.transactionDetailRefTransaction,
                value: tx.id ?? '',
              ),
              if (tx.correlationId != null)
                _CopyRow(
                  label: l10n.transactionDetailCorrelation,
                  value: tx.correlationId!,
                  last: true,
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: LipaButton(
                label: l10n.transactionDetailRecuPdf,
                variant: BtnVariant.secondary,
                icon: const Icon(Icons.download),
                onPressed: () => _openReceiptPdf(context, tx),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: LipaButton(
                label: l10n.transactionDetailPartager,
                variant: BtnVariant.secondary,
                icon: const Icon(Icons.share),
                onPressed: () => _shareReceipt(context, tx),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Generates the receipt PDF locally and opens the system print/preview
  /// sheet, from which the user can save or share the file.
  Future<void> _openReceiptPdf(
    BuildContext context,
    AgentTransactionResponse t,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await Printing.layoutPdf(
        onLayout: (_) => receiptPdfBytes(t),
        name: 'recu-lipa-${t.id}.pdf',
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.transactionDetailImpossibleGenererRecuPdf)),
      );
    }
  }

  /// Opens the native share sheet with a plain-text recap of the transaction.
  Future<void> _shareReceipt(
    BuildContext context,
    AgentTransactionResponse t,
  ) async {
    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        text: receiptShareText(t),
        subject: l10n.transactionDetailRecuLipa,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : null,
      ),
    );
  }
}

/// A DetailRow that copies its value to the clipboard on tap.
class _CopyRow extends StatelessWidget {
  const _CopyRow({required this.label, required this.value, this.last = false});
  final String label;
  final String value;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.commonCopie(label),
              style: AppText.ui(color: Colors.white),
            ),
            backgroundColor: AppColors.nearBlack,
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: DetailRow(
        label: label,
        value: shortId(value),
        mono: true,
        copy: true,
        last: last,
      ),
    );
  }
}
