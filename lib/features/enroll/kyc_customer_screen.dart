import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import 'kyc_controller.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import '../../core/widgets/party_card.dart';
import 'kyc_documents_screen.dart';

/// Reopen an *existing* customer's KYC file (spec §5.5).
///
/// Enrollment applies `KYC_BASIC`; raising the level to `KYC_VERIFIED` /
/// `KYC_ENHANCED` is a back-office decision driven by the documents the agent
/// supplies here. This screen never changes `kycLevel` itself — there is no
/// agent endpoint for that — it only resolves the customer and routes to the
/// shared [KycDocumentsScreen] for upload/review.
class KycCustomerScreen extends ConsumerStatefulWidget {
  const KycCustomerScreen({super.key});

  @override
  ConsumerState<KycCustomerScreen> createState() => _KycCustomerScreenState();
}

class _KycCustomerScreenState extends ConsumerState<KycCustomerScreen> {
  final _phone = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
    super.dispose();
  }

  void _openDocuments(CustomerLookupResponse c) {
    final customerId = c.customerId;
    if (customerId == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => KycDocumentsScreen(
          customerId: customerId,
          customerName: c.fullName ?? '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(kycCustomerControllerProvider);
    final customer = s.customer;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'KYC client',
              subtitle: 'Compléter le dossier d’un client',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  const FieldHint('Numéro du client'),
                  const SizedBox(height: 10),
                  if (customer == null) ...[
                    PhoneInput(
                      controller: _phone,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                    LipaButton(
                      label: 'Rechercher le client',
                      variant: BtnVariant.secondary,
                      full: true,
                      loading: s.busy,
                      onPressed: PhoneValidator.isComplete(_phone.text)
                          ? () => ref
                                .read(kycCustomerControllerProvider.notifier)
                                .lookup(_phone.text)
                          : null,
                    ),
                  ] else ...[
                    PartyCard(
                      name: customer.fullName ?? '',
                      subtitle: customer.phonePretty,
                      statusLabel: CustomerStatus.parse(
                        customer.status?.json,
                      ).frLabel,
                      statusActive:
                          customer.status ==
                          CustomerLookupResponseStatus.active,
                      trailing: IconButton(
                        onPressed: ref
                            .read(kycCustomerControllerProvider.notifier)
                            .clear,
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: AppColors.inkMid,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _KycLevelCard(
                      level: KycLevel.parse(customer.kycLevel?.json),
                    ),
                    const SizedBox(height: 16),
                    LipaButton(
                      label: 'Gérer les documents KYC',
                      icon: const Icon(Icons.folder_open_rounded),
                      size: BtnSize.lg,
                      full: true,
                      onPressed: () => _openDocuments(customer),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Les documents envoyés sont examinés par le back-office, '
                      'qui décide du rehaussement du niveau KYC.',
                      textAlign: TextAlign.center,
                      style: AppText.ui(size: 12, color: AppColors.inkLow),
                    ),
                  ],
                  if (s.error != null) ...[
                    const SizedBox(height: 14),
                    Text(
                      errorMessage(s.error!),
                      textAlign: TextAlign.center,
                      style: AppText.ui(size: 13, color: AppColors.danger),
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

/// Shows the current KYC level and what documents the next level typically
/// requires — guidance only; the back-office holds the actual policy.
class _KycLevelCard extends StatelessWidget {
  const _KycLevelCard({required this.level});
  final KycLevel level;

  /// Plain-language hint about the documents the next tier usually needs.
  String? get _nextStepHint => switch (level) {
    KycLevel.none || KycLevel.basic =>
      'Pour le niveau Vérifié : pièce d’identité (CNI ou passeport) '
          'et justificatif de domicile.',
    KycLevel.verified =>
      'Pour le niveau Renforcé : justificatifs complémentaires '
          'demandés par le back-office.',
    KycLevel.enhanced => null, // already at the top tier
    KycLevel.unknown => null,
  };

  @override
  Widget build(BuildContext context) {
    final hint = _nextStepHint;
    final (pillKind, _) = switch (level) {
      KycLevel.enhanced => (PillKind.success, ''),
      KycLevel.verified => (PillKind.info, ''),
      KycLevel.none => (PillKind.warn, ''),
      _ => (PillKind.pending, ''),
    };
    return LipaCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Niveau KYC actuel',
                style: AppText.ui(size: 13, color: AppColors.inkMid),
              ),
              const Spacer(),
              StatusPill(label: level.frLabel, kind: pillKind),
            ],
          ),
          if (hint != null) ...[
            const SizedBox(height: 12),
            Text(
              hint,
              style: AppText.ui(size: 13, color: AppColors.inkHi, height: 1.4),
            ),
          ] else if (level == KycLevel.enhanced) ...[
            const SizedBox(height: 12),
            Text(
              'Niveau maximal atteint.',
              style: AppText.ui(size: 13, color: AppColors.inkHi),
            ),
          ],
        ],
      ),
    );
  }
}
