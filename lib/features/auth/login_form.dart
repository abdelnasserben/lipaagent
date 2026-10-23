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
import '../../l10n/l10n.dart';

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
          InfoBanner(
            icon: Icons.check_circle_outline,
            kind: PillKind.success,
            text: l10n.loginPinReinitialiseConnectezVous,
          ),
          const SizedBox(height: 18),
        ],
        FieldLabel(l10n.commonNumeroTelephone),
        const SizedBox(height: 8),
        PhoneInput(controller: _phone, onChanged: (_) => setState(() {})),
        const SizedBox(height: 18),
        FieldLabel(
          'PIN',
          trailing: Text(
            l10n.login48Chiffres,
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
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    isDense: true,
                    hintText: l10n.loginSaisissezPin,
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
          label: l10n.loginSeConnecter,
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
              l10n.loginPinOublie,
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
                        text: l10n.loginPinPersonnel,
                        style: AppText.ui(
                          size: 12.5,
                          weight: FontWeight.w600,
                          color: AppColors.inkHi,
                        ),
                      ),
                      TextSpan(text: l10n.loginNeCommuniquezJamaisPin),
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
