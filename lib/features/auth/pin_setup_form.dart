import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import 'login_controller.dart';
import '../../l10n/l10n.dart';

class PinSetupForm extends ConsumerStatefulWidget {
  const PinSetupForm({super.key, required this.state});
  final LoginState state;
  @override
  ConsumerState<PinSetupForm> createState() => _PinSetupFormState();
}

class _PinSetupFormState extends ConsumerState<PinSetupForm> {
  final _pin = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _pin.dispose();
    _confirm.dispose();
    super.dispose();
  }

  bool get _valid =>
      PinValidator.isValid(_pin.text) && _pin.text == _confirm.text;

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InfoBanner(
          icon: Icons.lock_outline,
          text: l10n.pinSetupConfigurationUniqueChoisissezPin,
        ),
        const SizedBox(height: 18),
        FieldLabel(l10n.commonNouveauPin),
        const SizedBox(height: 8),
        PinDigitsInput(controller: _pin, onChanged: (_) => setState(() {})),
        const SizedBox(height: 18),
        FieldLabel(l10n.commonConfirmerPin),
        const SizedBox(height: 8),
        PinDigitsInput(controller: _confirm, onChanged: (_) => setState(() {})),
        if (s.errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            s.errorMessage!,
            style: AppText.ui(size: 13, color: AppColors.danger),
          ),
        ],
        const SizedBox(height: 22),
        LipaButton(
          label: l10n.pinSetupEnregistrerPin,
          size: BtnSize.lg,
          full: true,
          loading: s.submitting,
          onPressed: _valid
              ? () => ref
                    .read(loginControllerProvider.notifier)
                    .setupPin(_pin.text)
              : null,
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () => ref
              .read(loginControllerProvider.notifier)
              .goToStep(AuthStep.login),
          child: Text(
            l10n.commonRetourConnexion,
            style: AppText.ui(size: 13.5, color: AppColors.inkMid),
          ),
        ),
      ],
    );
  }
}
