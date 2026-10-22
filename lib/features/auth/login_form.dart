import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import 'login_controller.dart';
import 'boxed_input.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key, required this.state});
  final LoginState state;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _phone = TextEditingController();
  final _pin = TextEditingController();
  bool _reveal = false;

  @override
  void dispose() {
    _phone.dispose();
    _pin.dispose();
    super.dispose();
  }

  bool get _valid =>
      PhoneValidator.isComplete(_phone.text) && PinValidator.isValid(_pin.text);

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (s.pinResetDone) ...[
          const InfoBanner(
            icon: Icons.check_circle_outline,
            kind: PillKind.success,
            text: 'PIN réinitialisé. Connectez-vous avec votre nouveau PIN.',
          ),
          const SizedBox(height: 18),
        ],
        const FieldLabel('Numéro de téléphone'),
        const SizedBox(height: 8),
        PhoneInput(controller: _phone, onChanged: (_) => setState(() {})),
        const SizedBox(height: 18),
        FieldLabel(
          'PIN',
          trailing: Text(
            '4 à 8 chiffres',
            style: AppText.ui(size: 12, color: AppColors.inkLow),
          ),
        ),
        const SizedBox(height: 8),
        BoxedInput(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _pin,
                  obscureText: !_reveal,
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (_) => setState(() {}),
                  style: AppText.mono(size: 18, letterSpacing: 4),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    isDense: true,
                    hintText: 'Saisissez votre PIN',
                  ),
                ),
              ),
              IconButton(
                onPressed: () => setState(() => _reveal = !_reveal),
                icon: Icon(
                  _reveal ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: AppColors.inkMid,
                ),
              ),
            ],
          ),
        ),
        if (s.errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            s.errorMessage!,
            style: AppText.ui(size: 13, color: AppColors.danger),
          ),
        ],
        const SizedBox(height: 18),
        LipaButton(
          label: 'Se connecter',
          size: BtnSize.lg,
          full: true,
          loading: s.submitting,
          onPressed: _valid
              ? () => ref
                    .read(loginControllerProvider.notifier)
                    .login(phoneNumber: _phone.text, pin: _pin.text)
              : null,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () => ref
                .read(loginControllerProvider.notifier)
                .goToStep(AuthStep.forgotPin),
            child: Text(
              'PIN oublié ?',
              style: AppText.ui(
                size: 13.5,
                weight: FontWeight.w600,
                color: AppColors.brand,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        LipaCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.shield_outlined,
                size: 20,
                color: AppColors.brand,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppText.ui(
                      size: 12.5,
                      color: AppColors.inkMid,
                      height: 1.55,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sécurité renforcée par Lipa. ',
                        style: AppText.ui(
                          size: 12.5,
                          weight: FontWeight.w600,
                          color: AppColors.inkHi,
                        ),
                      ),
                      const TextSpan(
                        text: 'Votre PIN reste confidentiel et protégé.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
