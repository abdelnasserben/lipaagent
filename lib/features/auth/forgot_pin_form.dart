import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/code_field.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import 'login_controller.dart';

/// Forgotten-PIN reset (spec §3.6): phone + current TOTP code + new PIN.
class ForgotPinForm extends ConsumerStatefulWidget {
  const ForgotPinForm({super.key, required this.state});
  final LoginState state;
  @override
  ConsumerState<ForgotPinForm> createState() => _ForgotPinFormState();
}

class _ForgotPinFormState extends ConsumerState<ForgotPinForm> {
  late final TextEditingController _phone = TextEditingController(
    text: widget.state.phoneNumber,
  );
  final _newPin = TextEditingController();
  final _confirm = TextEditingController();
  String _code = '';

  @override
  void dispose() {
    _phone.dispose();
    _newPin.dispose();
    _confirm.dispose();
    super.dispose();
  }

  bool get _valid =>
      PhoneValidator.isComplete(_phone.text) &&
      _code.length == 6 &&
      PinValidator.isValid(_newPin.text) &&
      _newPin.text == _confirm.text;

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const InfoBanner(
          icon: Icons.shield_outlined,
          text:
              'Réinitialisation possible uniquement si le TOTP est activé. Sinon, contactez le back-office Lipa.',
        ),
        const SizedBox(height: 18),
        const FieldLabel('Numéro de téléphone'),
        const SizedBox(height: 8),
        PhoneInput(controller: _phone, onChanged: (_) => setState(() {})),
        const SizedBox(height: 18),
        const FieldLabel('Nouveau PIN'),
        const SizedBox(height: 8),
        PinDigitsInput(controller: _newPin, onChanged: (_) => setState(() {})),
        const SizedBox(height: 18),
        const FieldLabel('Confirmer le PIN'),
        const SizedBox(height: 8),
        PinDigitsInput(controller: _confirm, onChanged: (_) => setState(() {})),
        const SizedBox(height: 18),
        const FieldLabel('Code d’authentification (TOTP)'),
        const SizedBox(height: 8),
        CodeField(onChanged: (v) => setState(() => _code = v)),
        if (s.errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            s.errorMessage!,
            style: AppText.ui(size: 13, color: AppColors.danger),
          ),
        ],
        const SizedBox(height: 22),
        LipaButton(
          label: 'Réinitialiser le PIN',
          size: BtnSize.lg,
          full: true,
          loading: s.submitting,
          onPressed: _valid
              ? () => ref
                    .read(loginControllerProvider.notifier)
                    .resetPin(
                      phoneNumber: _phone.text,
                      totpCode: _code,
                      newPin: _newPin.text,
                    )
              : null,
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () => ref
              .read(loginControllerProvider.notifier)
              .goToStep(AuthStep.login),
          child: Text(
            '← Retour à la connexion',
            style: AppText.ui(size: 13.5, color: AppColors.inkMid),
          ),
        ),
      ],
    );
  }
}
