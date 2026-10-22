import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/lipa_brand.dart';
import 'login_controller.dart';
import 'session_controller.dart';
import 'login_form.dart';
import 'mfa_form.dart';
import 'pin_setup_form.dart';
import 'forgot_pin_form.dart';
import 'auth_notices.dart';

/// The full agent auth surface (login → MFA → PIN setup → expired → locked).
/// Reuses the Lipa dark-hero auth layout, adapted to agent copy.
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  void initState() {
    super.initState();
    // If we arrived here due to an expired session, show that variant once.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final session = ref.read(sessionControllerProvider);
      if (session.expiredNotice) {
        ref
            .read(loginControllerProvider.notifier)
            .goToStep(AuthStep.sessionExpired);
        ref.read(sessionControllerProvider.notifier).clearExpiredNotice();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    final step = state.step;

    final (heroTitle, heroSubtitle) = switch (step) {
      AuthStep.login => (
        'Espace agent',
        'Connectez-vous pour gérer vos opérations cash et l’enrôlement client.',
      ),
      AuthStep.mfa => (
        'Vérifiez votre identité',
        'Saisissez le code à 6 chiffres de votre application d’authentification.',
      ),
      AuthStep.pinSetup => (
        'Définir votre PIN',
        'Choisissez le PIN qui protégera votre compte agent et vos opérations.',
      ),
      AuthStep.forgotPin => (
        'PIN oublié',
        'Réinitialisez votre PIN avec le code de votre application d’authentification.',
      ),
      AuthStep.sessionExpired => (
        'Session expirée',
        'Vous avez été déconnecté afin de protéger votre compte agent.',
      ),
      AuthStep.locked => (
        'PIN bloqué',
        'Trop de tentatives incorrectes. Réessayez dans 15 minutes.',
      ),
    };

    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // Dark hero header.
          Stack(
            children: [
              Container(
                height: 320 + topInset,
                width: double.infinity,
                color: AppColors.nearBlack,
              ),
              const GridBackground(),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(28, topInset, 28, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const LipaWordmark(dark: true, size: 44),
                      const SizedBox(height: 36),
                      Text(
                        heroTitle,
                        style: AppText.ui(
                          size: 32,
                          weight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: -0.8,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Text(
                          heroSubtitle,
                          style: AppText.ui(
                            size: 14.5,
                            color: Colors.white.withValues(alpha: 0.62),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -1,
                left: 0,
                right: 0,
                child: Container(
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
              child: switch (step) {
                AuthStep.login => LoginForm(state: state),
                AuthStep.mfa => MfaForm(state: state),
                AuthStep.pinSetup => PinSetupForm(state: state),
                AuthStep.forgotPin => ForgotPinForm(state: state),
                AuthStep.sessionExpired => const SessionExpiredNotice(),
                AuthStep.locked => const PinLockedNotice(),
              },
            ),
          ),
        ],
      ),
    );
  }
}
