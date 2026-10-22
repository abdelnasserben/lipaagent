import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/common.dart';
import 'login_controller.dart';
import '../../l10n/l10n.dart';

class SessionExpiredNotice extends ConsumerWidget {
  const SessionExpiredNotice({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LipaCard(
          padding: const EdgeInsets.all(18),
          radius: AppRadius.lg,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.warnSoft,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  size: 20,
                  color: AppColors.warn,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.authNoticesVousAvezEteDeconnecte,
                      style: AppText.ui(size: 14.5, weight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.authNoticesReconnectezVousContinuerOperations,
                      style: AppText.ui(
                        size: 13,
                        color: AppColors.inkMid,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        LipaButton(
          label: l10n.authNoticesSeReconnecter,
          size: BtnSize.lg,
          full: true,
          onPressed: () => ref
              .read(loginControllerProvider.notifier)
              .goToStep(AuthStep.login),
        ),
      ],
    );
  }
}

class PinLockedNotice extends ConsumerWidget {
  const PinLockedNotice({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.dangerSoft,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: const Icon(
                  Icons.lock_outline,
                  size: 20,
                  color: AppColors.danger,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.authNoticesSaisiePinBloquee,
                      style: AppText.ui(size: 14.5, weight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.authNoticesPinIncorrectSaisi3,
                      style: AppText.ui(
                        size: 13,
                        color: AppColors.inkMid,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        LipaButton(
          label: l10n.authNoticesReinitialiserMonPin,
          variant: BtnVariant.secondary,
          size: BtnSize.lg,
          full: true,
          onPressed: () => ref
              .read(loginControllerProvider.notifier)
              .goToStep(AuthStep.forgotPin),
        ),
      ],
    );
  }
}
