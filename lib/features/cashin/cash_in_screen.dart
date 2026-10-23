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
import '../../core/widgets/result_screen.dart';
import 'cash_in_controller.dart';
import '../../l10n/l10n.dart';

/// Cash-in (deposit) flow: confirm the customer, then the amount. The agent
/// float is debited; the customer account is credited (spec §5.4 / §11.1).
class CashInScreen extends ConsumerWidget {
  const CashInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cashInControllerProvider);

    if (state.step == CashInStep.done && state.result != null) {
      return _DoneScreen(
        result: state.result!,
        customerName: state.customer?.fullName ?? '',
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.commonDepotClient,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: switch (state.step) {
                CashInStep.lookup || CashInStep.error => const _LookupStep(),
                _ => const _AmountStep(),
              },
            ),
          ],
        ),
      ),
    );
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
    final state = ref.watch(cashInControllerProvider);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        InfoBanner(
          icon: Icons.info_outline,
          text: l10n.cashInSaisissezNumeroClientConfirmer,
        ),
        const SizedBox(height: 18),
        FieldLabel(l10n.commonNumeroClient),
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
          label: l10n.commonRechercherClient,
          size: BtnSize.lg,
          full: true,
          loading: state.looking,
          onPressed: _valid
              ? () => ref
                    .read(cashInControllerProvider.notifier)
                    .lookup(_phone.text)
              : null,
        ),
      ],
    );
  }
}

class _AmountStep extends ConsumerStatefulWidget {
  const _AmountStep();
  @override
  ConsumerState<_AmountStep> createState() => _AmountStepState();
}

class _AmountStepState extends ConsumerState<_AmountStep> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cashInControllerProvider);
    final notifier = ref.read(cashInControllerProvider.notifier);
    final customer = state.customer;
    final submitting = state.step == CashInStep.submitting;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        if (customer != null)
          PartyCard(
            name: customer.fullName ?? '',
            subtitle: customer.phonePretty,
            statusLabel: CustomerStatus.parse(customer.status?.json).label,
            statusActive:
                customer.status == CustomerLookupResponseStatus.active,
          ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: submitting ? null : notifier.backToLookup,
            icon: const Icon(Icons.swap_horiz_rounded, size: 16),
            label: Text(
              l10n.cashInChangerClient,
              style: AppText.ui(size: 13, color: AppColors.inkMid),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          l10n.cashInMontantDeposer,
          textAlign: TextAlign.center,
          style: AppText.ui(size: 13.5, color: AppColors.inkMid),
        ),
        const SizedBox(height: 18),
        AmountInput(onChanged: notifier.setAmount),
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
          label: state.amount > 0
              ? l10n.cashInDeposer(fmtKmf(state.amount))
              : l10n.cashInDeposer2,
          size: BtnSize.lg,
          full: true,
          loading: submitting,
          onPressed: state.amount > 0 ? notifier.submit : null,
        ),
        const SizedBox(height: 10),
        Text(
          l10n.cashInFloatSeraDebiteMontant,
          textAlign: TextAlign.center,
          style: AppText.ui(size: 12, color: AppColors.inkLow),
        ),
      ],
    );
  }
}

class _DoneScreen extends ConsumerWidget {
  const _DoneScreen({required this.result, required this.customerName});
  final AgentCashResponse result;
  final String customerName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResultScreen(
      title: l10n.commonDepot,
      headline: l10n.cashInDepotEffectue,
      subtitle: customerName.isEmpty
          ? null
          : l10n.cashInCredites(
              fmtKmf(result.requestedAmount ?? 0),
              customerName,
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
                value: fmtKmf(result.feeAmount ?? 0),
                mono: true,
              ),
            if ((result.commissionAmount ?? 0) > 0)
              DetailRow(
                label: l10n.commonCommission,
                value: fmtKmf(result.commissionAmount ?? 0),
                mono: true,
                valueColor: AppColors.brandDeep,
              ),
            DetailRow(
              label: l10n.cashInCrediteClient,
              value: fmtKmf(result.netAmountToDestination ?? 0),
              mono: true,
            ),
            DetailRow(
              label: l10n.commonRef,
              value: shortId(result.transactionId ?? ''),
              mono: true,
              last: true,
            ),
          ],
        ),
      ),
    );
  }
}
