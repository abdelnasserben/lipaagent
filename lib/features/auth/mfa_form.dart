import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/widgets/code_field.dart';
import '../../core/widgets/common.dart';
import 'login_controller.dart';
import '../../l10n/l10n.dart';

/// MFA: a single hidden field backing 6 display cells.
class MfaForm extends ConsumerStatefulWidget {
  const MfaForm({super.key, required this.state});
  final LoginState state;
  @override
  ConsumerState<MfaForm> createState() => _MfaFormState();
}

class _MfaFormState extends ConsumerState<MfaForm> {
  String _code = '';

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CodeField(onChanged: (v) => setState(() => _code = v)),
        if (s.errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            s.errorMessage!,
            style: AppText.ui(size: 13, color: AppColors.danger),
          ),
        ],
        const SizedBox(height: 18),
        LipaButton(
          label: l10n.mfaVerifierContinuer,
          size: BtnSize.lg,
          full: true,
          loading: s.submitting,
          onPressed: _code.length == 6
              ? () =>
                    ref.read(loginControllerProvider.notifier).verifyMfa(_code)
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
