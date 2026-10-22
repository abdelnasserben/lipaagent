import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/form_fields.dart';
import 'security_controller.dart';
import '../../l10n/l10n.dart';

/// Change PIN (spec §3.6): current PIN + new PIN (4–8 digits) + confirm.
class ChangePinScreen extends ConsumerStatefulWidget {
  const ChangePinScreen({super.key});

  @override
  ConsumerState<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends ConsumerState<ChangePinScreen> {
  final _current = TextEditingController();
  final _newPin = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _current.dispose();
    _newPin.dispose();
    _confirm.dispose();
    super.dispose();
  }

  /// The new PIN can't be the same as the current one — that's not a change,
  /// and the backend would reject (or no-op) it. Show the hint only once the
  /// agent has fully typed both, to avoid nagging mid-entry.
  bool get _sameAsCurrent =>
      PinValidator.isValid(_current.text) && _current.text == _newPin.text;

  /// The new PIN and its confirmation must match (mirrors the setup flow).
  bool get _confirmMismatch =>
      _confirm.text.isNotEmpty && _newPin.text != _confirm.text;

  bool get _valid =>
      PinValidator.isValid(_current.text) &&
      PinValidator.isValid(_newPin.text) &&
      _newPin.text == _confirm.text &&
      _newPin.text != _current.text;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePinControllerProvider);

    ref.listen(changePinControllerProvider, (prev, next) {
      if (next.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.changePinPinMisJour,
              style: AppText.ui(color: Colors.white),
            ),
            backgroundColor: AppColors.brandDeep,
          ),
        );
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.commonChangerMonPin,
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  FieldLabel(l10n.changePinPinActuel),
                  const SizedBox(height: 8),
                  PinDigitsInput(
                    controller: _current,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 18),
                  FieldLabel(l10n.commonNouveauPin),
                  const SizedBox(height: 8),
                  PinDigitsInput(
                    controller: _newPin,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 18),
                  FieldLabel(l10n.changePinConfirmerNouveauPin),
                  const SizedBox(height: 8),
                  PinDigitsInput(
                    controller: _confirm,
                    onChanged: (_) => setState(() {}),
                  ),
                  if (_sameAsCurrent) ...[
                    const SizedBox(height: 10),
                    Text(
                      l10n.changePinNouveauPinDoitEtre,
                      style: AppText.ui(size: 13, color: AppColors.danger),
                    ),
                  ] else if (_confirmMismatch) ...[
                    const SizedBox(height: 10),
                    Text(
                      l10n.changePinDeuxPinNeCorrespondent,
                      style: AppText.ui(size: 13, color: AppColors.danger),
                    ),
                  ],
                  if (state.error != null) ...[
                    const SizedBox(height: 14),
                    Text(
                      state.error!,
                      style: AppText.ui(size: 13, color: AppColors.danger),
                    ),
                  ],
                  const SizedBox(height: 24),
                  LipaButton(
                    label: l10n.changePinEnregistrer,
                    size: BtnSize.lg,
                    full: true,
                    loading: state.loading,
                    onPressed: _valid
                        ? () => ref
                              .read(changePinControllerProvider.notifier)
                              .submit(
                                currentPin: _current.text,
                                newPin: _newPin.text,
                              )
                        : null,
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
