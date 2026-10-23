import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/amount_input.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import '../../core/widgets/party_card.dart';
import '../../core/widgets/pin_sheet.dart';
import '../../core/widgets/result_screen.dart';
import 'cash_out_controller.dart';
import '../../l10n/l10n.dart';

/// Cash-out (withdrawal) flow with the control-tier loop (spec §8):
/// EXECUTED (200) · PENDING_CONFIRMATION · PENDING_PIN · PENDING_APPROVAL (202).
class CashOutScreen extends ConsumerStatefulWidget {
  const CashOutScreen({super.key});

  @override
  ConsumerState<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends ConsumerState<CashOutScreen> {
  bool _pinSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cashOutControllerProvider);
    final notifier = ref.read(cashOutControllerProvider.notifier);

    // Drive the merchant-PIN sheet from the control step.
    ref.listen(cashOutControllerProvider, (prev, next) {
      if (next.step == CashOutStep.needsPin && !_pinSheetOpen) {
        _openPinSheet();
      }
    });

    if (state.step == CashOutStep.done && state.result != null) {
      return _DoneScreen(
        result: state.result!,
        merchantName: state.merchant?.businessName ?? '',
      );
    }
    if (state.step == CashOutStep.approval && state.result != null) {
      return _ApprovalScreen(result: state.result!);
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.commonRetraitMarchand,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: state.step == CashOutStep.lookup
                  ? const _LookupStep()
                  : _AmountStep(
                      onAcknowledge: notifier.acknowledgeConfirmation,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPinSheet() async {
    _pinSheetOpen = true;
    final notifier = ref.read(cashOutControllerProvider.notifier);
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        return Consumer(
          builder: (ctx, ref, _) {
            final s = ref.watch(cashOutControllerProvider);
            return PinSheet(
              title: l10n.cashOutPinMarchand,
              subtitle: l10n.cashOutDemandezMarchandSaisirSon(fmtKmf(s.amount)),
              submitting: s.submitting,
              errorMessage: s.pinError,
              onSubmit: (pin) => notifier.submitPin(pin),
            );
          },
        );
      },
    );
    _pinSheetOpen = false;
    // If we left the PIN step without executing (e.g. user dismissed via the
    // close button), reset back to amount so the flow isn't stuck.
    final s = ref.read(cashOutControllerProvider);
    if (s.step == CashOutStep.needsPin) {
      ref.read(cashOutControllerProvider.notifier).backToLookupAmount();
    }
  }
}

class _LookupStep extends ConsumerStatefulWidget {
  const _LookupStep();
  @override
  ConsumerState<_LookupStep> createState() => _LookupStepState();
}

class _LookupStepState extends ConsumerState<_LookupStep> {
  final _phone = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  bool get _valid => PhoneValidator.isComplete(_phone.text);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cashOutControllerProvider);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        InfoBanner(
          icon: Icons.info_outline,
          text: l10n.cashOutSaisissezNumeroMarchandConfirmer,
        ),
        const SizedBox(height: 18),
        FieldLabel(l10n.cashOutNumeroMarchand),
        const SizedBox(height: 8),
        PhoneInput(controller: _phone, onChanged: (_) => setState(() {})),
        if (state.errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            state.errorMessage!,
            style: AppText.ui(size: 13, color: AppColors.danger),
          ),
        ],
        const SizedBox(height: 18),
        LipaButton(
          label: l10n.cashOutRechercherMarchand,
          size: BtnSize.lg,
          full: true,
          loading: state.looking,
          onPressed: _valid
              ? () => ref
                    .read(cashOutControllerProvider.notifier)
                    .lookup(_phone.text)
              : null,
        ),
      ],
    );
  }
}

class _AmountStep extends ConsumerWidget {
  const _AmountStep({required this.onAcknowledge});
  final VoidCallback onAcknowledge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cashOutControllerProvider);
    final notifier = ref.read(cashOutControllerProvider.notifier);
    final merchant = state.merchant;
    final submitting = state.submitting;
    final needsConfirm = state.step == CashOutStep.needsConfirmation;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        if (merchant != null)
          PartyCard(
            icon: Icons.storefront_rounded,
            name: merchant.businessName ?? '',
            subtitle: '${merchant.externalRef} · ${merchant.phonePretty}',
            statusLabel: (merchant.canCashOut ?? false)
                ? MerchantStatus.parse(merchant.status?.json).label
                : l10n.cashOutRetraitBloque,
            statusActive:
                (merchant.canCashOut ?? false) &&
                merchant.status == MerchantLookupResponseStatus.active,
          ),
        if (merchant != null && !(merchant.canCashOut ?? false)) ...[
          const SizedBox(height: 12),
          InfoBanner(
            kind: PillKind.warn,
            icon: Icons.block,
            text: l10n.cashOutMarchandNPasAutorise,
          ),
        ],
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: submitting ? null : notifier.backToLookup,
            icon: const Icon(Icons.swap_horiz_rounded, size: 16),
            label: Text(
              l10n.cashOutChangerMarchand,
              style: AppText.ui(size: 13, color: AppColors.inkMid),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          l10n.cashOutMontantRetirer,
          textAlign: TextAlign.center,
          style: AppText.ui(size: 13.5, color: AppColors.inkMid),
        ),
        const SizedBox(height: 18),
        AmountInput(onChanged: notifier.setAmount),
        if (needsConfirm && state.result != null) ...[
          const SizedBox(height: 18),
          InfoBanner(
            kind: PillKind.warn,
            icon: Icons.verified_user_outlined,
            text: l10n.cashOutMontantSuperieurSeuilConfirmez(
              fmtKmf(state.result!.matchedThresholdAmount ?? 0),
            ),
          ),
        ],
        if (state.errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(
            state.errorMessage!,
            textAlign: TextAlign.center,
            style: AppText.ui(size: 13, color: AppColors.danger),
          ),
        ],
        const SizedBox(height: 28),
        LipaButton(
          label: needsConfirm
              ? l10n.cashOutConfirmerRetrait
              : (state.amount > 0
                    ? l10n.cashOutRetirer(fmtKmf(state.amount))
                    : l10n.cashOutRetirer2),
          size: BtnSize.lg,
          full: true,
          loading: submitting,
          variant: needsConfirm ? BtnVariant.primaryDark : BtnVariant.primary,
          onPressed: state.amount > 0 && (merchant?.canCashOut ?? false)
              ? (needsConfirm ? onAcknowledge : notifier.submit)
              : null,
        ),
        const SizedBox(height: 10),
        Text(
          l10n.cashOutMarchandDebiteFloatCredite,
          textAlign: TextAlign.center,
          style: AppText.ui(size: 12, color: AppColors.inkLow),
        ),
      ],
    );
  }
}

class _ApprovalScreen extends ConsumerWidget {
  const _ApprovalScreen({required this.result});
  final AgentMerchantCashOutResponse result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResultScreen(
      title: l10n.commonRetrait,
      kind: ResultKind.pending,
      headline: l10n.cashOutApprobationRequise,
      subtitle: l10n.cashOutRetraitDepasseSeuilEte(
        fmtKmf(result.requestedAmount ?? 0),
      ),
      onDone: () => Navigator.of(context).pop(),
      detail: LipaCard(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            DetailRow(
              label: l10n.commonMontant,
              value: fmtKmf(result.requestedAmount ?? 0),
              mono: true,
            ),
            if (result.matchedThresholdAmount != null)
              DetailRow(
                label: l10n.cashOutSeuil,
                value: fmtKmf(result.matchedThresholdAmount!),
                mono: true,
              ),
            if (result.approvalId != null)
              DetailRow(
                label: l10n.cashOutRefApprobation,
                value: shortId(result.approvalId!),
                mono: true,
                last: true,
              ),
          ],
        ),
      ),
    );
  }
}

class _DoneScreen extends ConsumerWidget {
  const _DoneScreen({required this.result, required this.merchantName});
  final AgentMerchantCashOutResponse result;
  final String merchantName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResultScreen(
      title: l10n.commonRetrait,
      headline: l10n.cashOutRetraitEffectue,
      subtitle: merchantName.isEmpty
          ? null
          : l10n.cashOutRetires(
              fmtKmf(result.requestedAmount ?? 0),
              merchantName,
            ),
      replayed: result.replayed ?? false,
      onDone: () => Navigator.of(context).pop(),
      detail: LipaCard(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            DetailRow(
              label: l10n.commonMontant,
              value: fmtKmf(result.requestedAmount ?? 0),
              mono: true,
            ),
            if ((result.feeAmount ?? 0) > 0)
              DetailRow(
                label: l10n.commonFrais,
                value: fmtKmf(result.feeAmount!),
                mono: true,
              ),
            if ((result.commissionAmount ?? 0) > 0)
              DetailRow(
                label: l10n.commonCommission,
                value: fmtKmf(result.commissionAmount!),
                mono: true,
                valueColor: AppColors.brandDeep,
              ),
            if (result.transactionId != null)
              DetailRow(
                label: l10n.commonRef,
                value: shortId(result.transactionId!),
                mono: true,
                last: true,
              ),
          ],
        ),
      ),
    );
  }
}
