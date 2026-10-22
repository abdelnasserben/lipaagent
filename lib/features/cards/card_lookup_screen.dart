import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import 'cards_controller.dart';
import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/status_pills.dart';
import 'card_replace_screen.dart';
import '../../l10n/l10n.dart';

/// Card lookup by scanned NFC UID (spec §5.4 / §5.6). The result drives the
/// report-lost / report-stolen / replace actions for a customer card.
class CardLookupScreen extends ConsumerStatefulWidget {
  const CardLookupScreen({super.key});

  @override
  ConsumerState<CardLookupScreen> createState() => _CardLookupScreenState();
}

class _CardLookupScreenState extends ConsumerState<CardLookupScreen> {
  CardLookupController get _controller =>
      ref.read(cardLookupControllerProvider.notifier);

  Future<void> _scan() async {
    final uid = await ref.read(cardScannerProvider).scanCardUid(context);
    if (uid == null) return;
    await _controller.lookup(uid);
  }

  Future<void> _report(bool stolen) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          stolen ? l10n.cardLookupDeclarerVolee : l10n.cardLookupDeclarerPerdue,
          style: AppText.ui(size: 17, weight: FontWeight.w700),
        ),
        content: Text(
          stolen
              ? l10n.cardLookupConfirmerCarteVoleeElle
              : l10n.cardLookupConfirmerCartePerdueElle,
          style: AppText.ui(size: 14, color: AppColors.inkMid, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l10n.commonAnnuler,
              style: AppText.ui(size: 14, color: AppColors.inkMid),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l10n.commonConfirmer,
              style: AppText.ui(
                size: 14,
                weight: FontWeight.w700,
                color: AppColors.danger,
              ),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final failure = await _controller.report(stolen: stolen);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          failure != null
              ? errorMessage(failure)
              : (stolen
                    ? l10n.cardLookupCarteDeclareeVolee
                    : l10n.cardLookupCarteDeclareePerdue),
          style: AppText.ui(color: Colors.white),
        ),
        backgroundColor: failure != null
            ? AppColors.danger
            : AppColors.nearBlack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(cardLookupControllerProvider);
    final card = s.result;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.commonRechercherCarte,
              subtitle: l10n.cardLookupUidNfc,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  InfoBanner(
                    icon: Icons.nfc_rounded,
                    text: l10n.cardLookupScannezCarteClientSaisissez,
                  ),
                  const SizedBox(height: 16),
                  LipaButton(
                    label: card == null
                        ? l10n.commonScannerCarte
                        : l10n.cardLookupScannerAutreCarte,
                    icon: const Icon(Icons.nfc_rounded),
                    size: BtnSize.lg,
                    full: true,
                    loading: s.busy && card == null,
                    onPressed: s.busy ? null : _scan,
                  ),
                  if (s.error != null) ...[
                    const SizedBox(height: 14),
                    InfoBanner(
                      kind: PillKind.declined,
                      icon: Icons.error_outline,
                      text: errorMessage(s.error!),
                    ),
                  ],
                  if (card != null) ...[
                    const SizedBox(height: 20),
                    _CardCard(card: card),
                    const SizedBox(height: 16),
                    if (card.isLinked) ...[
                      Row(
                        children: [
                          Expanded(
                            child: LipaButton(
                              label: l10n.commonPerdue,
                              icon: const Icon(Icons.help_outline_rounded),
                              variant: BtnVariant.dangerOutline,
                              size: BtnSize.lg,
                              loading: s.busy,
                              onPressed:
                                  card.status == CardLookupResponseStatus.lost
                                  ? null
                                  : () => _report(false),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: LipaButton(
                              label: l10n.commonVolee,
                              icon: const Icon(
                                Icons.report_gmailerrorred_rounded,
                              ),
                              variant: BtnVariant.danger,
                              size: BtnSize.lg,
                              loading: s.busy,
                              onPressed:
                                  card.status == CardLookupResponseStatus.stolen
                                  ? null
                                  : () => _report(true),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      LipaButton(
                        label: l10n.commonRemplacerCarte,
                        icon: const Icon(Icons.sync_rounded),
                        variant: BtnVariant.secondary,
                        size: BtnSize.lg,
                        full: true,
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CardReplaceScreen(card: card),
                          ),
                        ),
                      ),
                    ] else
                      InfoBanner(
                        kind: PillKind.info,
                        icon: Icons.info_outline,
                        text: l10n.cardLookupCarteNPasEncore,
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardCard extends StatelessWidget {
  const _CardCard({required this.card});
  final CardLookupResponse card;

  @override
  Widget build(BuildContext context) {
    return LipaCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceAlt,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Icon(
                    Icons.credit_card_rounded,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.maskedInternalCardNumber ?? l10n.cardLookupCarte,
                        style: AppText.mono(size: 16, weight: FontWeight.w600),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        CardType.parse(card.cardType?.json).label,
                        style: AppText.ui(size: 12.5, color: AppColors.inkMid),
                      ),
                    ],
                  ),
                ),
                CardStatusPill(status: CardStatus.parse(card.status?.json)),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          DetailRow(
            label: l10n.cardLookupUidNfc2,
            value: card.nfcUid ?? '',
            mono: true,
          ),
          if (card.customerFullName != null)
            DetailRow(
              label: l10n.cardLookupTitulaire,
              value: card.customerFullName!,
            ),
          if (card.customerPhoneMasked != null)
            DetailRow(
              label: l10n.cardLookupTelephone,
              value: card.customerPhoneMasked!,
              mono: true,
            ),
          DetailRow(
            label: l10n.commonStatut2,
            value: CardStatus.parse(card.status?.json).label,
            last: true,
          ),
        ],
      ),
    );
  }
}
