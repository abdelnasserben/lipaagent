import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/amount_input.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import '../../core/widgets/party_card.dart';
import '../../core/widgets/result_screen.dart';
import 'cards_controller.dart';
import '../../l10n/l10n.dart';

/// Card sale (spec §5.6): confirm the customer, scan the card from assigned
/// stock, declare a price, sell. Always shows the price returned by the API
/// (config-driven pricing — spec §6.5).
class CardSaleScreen extends ConsumerStatefulWidget {
  const CardSaleScreen({super.key});

  @override
  ConsumerState<CardSaleScreen> createState() => _CardSaleScreenState();
}

class _CardSaleScreenState extends ConsumerState<CardSaleScreen> {
  final _phone = TextEditingController();
  String? _nfcUid;
  int _price = 0;

  CardSaleController get _controller =>
      ref.read(cardSaleControllerProvider.notifier);

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  Future<void> _scan() async {
    final uid = await ref.read(cardScannerProvider).scanCardUid(context);
    if (uid != null) setState(() => _nfcUid = uid);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(cardSaleControllerProvider);
    final result = s.result;
    final customer = s.customer;
    if (result != null) {
      return ResultScreen(
        title: l10n.commonVenteCarte,
        headline: l10n.cardSaleCarteVendue,
        subtitle: l10n.cardSaleCarteActivee(
          customer?.fullName ?? l10n.cardSaleClient,
        ),
        replayed: result.replayed ?? false,
        onDone: () => Navigator.of(context).pop(),
        detail: LipaCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              DetailRow(
                label: l10n.cardSalePrixFacture,
                value: fmtKmf(result.cardPrice ?? 0),
                mono: true,
                valueColor: AppColors.brandDeep,
              ),
              if ((result.commissionAmount ?? 0) > 0)
                DetailRow(
                  label: l10n.commonCommission,
                  value: fmtKmf(result.commissionAmount ?? 0),
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

    final canSell = customer != null && _nfcUid != null && _price > 0;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.commonVendreCarte,
              subtitle: l10n.cardSaleDepuisStock,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  // Step 1 — customer.
                  _StepLabel(n: 1, text: l10n.cardSaleClient2),
                  const SizedBox(height: 10),
                  if (customer == null) ...[
                    PhoneInput(
                      controller: _phone,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 10),
                    LipaButton(
                      label: l10n.commonRechercherClient,
                      variant: BtnVariant.secondary,
                      full: true,
                      loading: s.busy,
                      onPressed: PhoneValidator.isComplete(_phone.text)
                          ? () => _controller.lookup(_phone.text)
                          : null,
                    ),
                  ] else
                    PartyCard(
                      name: customer.fullName ?? '',
                      subtitle: customer.phonePretty,
                      statusLabel: CustomerStatus.parse(
                        customer.status?.json,
                      ).label,
                      statusActive:
                          customer.status ==
                          CustomerLookupResponseStatus.active,
                      trailing: IconButton(
                        onPressed: _controller.clearCustomer,
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: AppColors.inkMid,
                        ),
                      ),
                    ),
                  const SizedBox(height: 22),

                  // Step 2 — card.
                  _StepLabel(n: 2, text: l10n.cardSaleCarteNfc),
                  const SizedBox(height: 10),
                  _CardSlot(uid: _nfcUid, onScan: _scan),
                  const SizedBox(height: 22),

                  // Step 3 — price.
                  _StepLabel(n: 3, text: l10n.cardSalePrixCarte),
                  const SizedBox(height: 14),
                  AmountInput(
                    autofocus: false,
                    quickAmounts: const [1000, 2500, 5000, 10000],
                    onChanged: (v) => setState(() => _price = v),
                  ),
                  if (s.error != null) ...[
                    const SizedBox(height: 14),
                    Text(
                      errorMessage(s.error!),
                      textAlign: TextAlign.center,
                      style: AppText.ui(size: 13, color: AppColors.danger),
                    ),
                  ],
                  const SizedBox(height: 24),
                  LipaButton(
                    label: _price > 0
                        ? l10n.cardSaleVendre(fmtKmf(_price))
                        : l10n.cardSaleVendreCarte,
                    size: BtnSize.lg,
                    full: true,
                    loading: s.busy && customer != null,
                    onPressed: canSell
                        ? () =>
                              _controller.sell(nfcUid: _nfcUid!, price: _price)
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.cardSalePrixFinalPeutEtre,
                    textAlign: TextAlign.center,
                    style: AppText.ui(size: 12, color: AppColors.inkLow),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepLabel extends StatelessWidget {
  const _StepLabel({required this.n, required this.text});
  final int n;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.nearBlack,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$n',
            style: AppText.mono(
              size: 12,
              weight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(text, style: AppText.ui(size: 14.5, weight: FontWeight.w700)),
      ],
    );
  }
}

class _CardSlot extends StatelessWidget {
  const _CardSlot({required this.uid, required this.onScan});
  final String? uid;
  final VoidCallback onScan;

  @override
  Widget build(BuildContext context) {
    if (uid == null) {
      return LipaButton(
        label: l10n.commonScannerCarte,
        icon: const Icon(Icons.nfc_rounded),
        variant: BtnVariant.secondary,
        size: BtnSize.lg,
        full: true,
        onPressed: onScan,
      );
    }
    return LipaCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          const Icon(Icons.credit_card_rounded, color: AppColors.brandDeep),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.cardSaleCarteSelectionnee,
                  style: AppText.ui(size: 12.5, color: AppColors.inkMid),
                ),
                Text(
                  uid!,
                  style: AppText.mono(size: 14, weight: FontWeight.w600),
                ),
              ],
            ),
          ),
          TextButton(onPressed: onScan, child: Text(l10n.cardSaleChanger)),
        ],
      ),
    );
  }
}
