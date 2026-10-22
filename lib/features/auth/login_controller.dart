import '../../api/api_client.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/auth/token_store.dart';
import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../security/security_controller.dart';
import 'session_controller.dart';
import '../../l10n/l10n.dart';

/// Which auth step the UI is currently showing.
enum AuthStep { login, mfa, pinSetup, forgotPin, sessionExpired, locked }

class LoginState {
  const LoginState({
    this.step = AuthStep.login,
    this.submitting = false,
    this.errorMessage,
    this.challengeId,
    this.pinSetupToken,
    this.phoneNumber = '',
    this.pinResetDone = false,
  });

  final AuthStep step;
  final bool submitting;
  final String? errorMessage;
  final String? challengeId;
  final String? pinSetupToken;
  final String phoneNumber;

  /// Set right after a successful forgotten-PIN reset so the login form can
  /// show a "PIN réinitialisé" confirmation. Cleared on the next action.
  final bool pinResetDone;

  LoginState copyWith({
    AuthStep? step,
    bool? submitting,
    String? errorMessage,
    bool clearError = false,
    String? challengeId,
    String? pinSetupToken,
    String? phoneNumber,
    bool pinResetDone = false,
  }) => LoginState(
    step: step ?? this.step,
    submitting: submitting ?? this.submitting,
    errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    challengeId: challengeId ?? this.challengeId,
    pinSetupToken: pinSetupToken ?? this.pinSetupToken,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    pinResetDone: pinResetDone,
  );
}

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();
  static const _countryCode = '269';

  void goToStep(AuthStep step) =>
      state = state.copyWith(step: step, clearError: true);

  Future<void> login({required String phoneNumber, required String pin}) async {
    state = state.copyWith(
      submitting: true,
      clearError: true,
      phoneNumber: phoneNumber,
    );
    try {
      final answer = await ref
          .read(apiClientProvider)
          .send(
            (api) => api.agentAuthController.login(
              body: LoginRequest(
                phoneCountryCode: _countryCode,
                phoneNumber: _digits(phoneNumber),
                pin: pin,
              ),
            ),
          );
      final res = requireData(answer.data);
      if (res.branch == LoginBranch.session) await _saveSession(res);
      if (!ref.mounted) return;
      switch (res.branch) {
        case LoginBranch.session:
          ref.read(sessionControllerProvider.notifier).markAuthenticated();
          state = state.copyWith(submitting: false);
        case LoginBranch.mfa:
          // An MFA challenge proves this agent has TOTP enrolled — the
          // authoritative cross-device signal for the Security screen.
          ref.read(totpEnrolledProvider.notifier).set(true);
          state = state.copyWith(
            submitting: false,
            step: AuthStep.mfa,
            challengeId: res.challengeId,
          );
        case LoginBranch.pinSetup:
          state = state.copyWith(
            submitting: false,
            step: AuthStep.pinSetup,
            pinSetupToken: res.pinSetupToken,
          );
        case LoginBranch.unknown:
          state = state.copyWith(
            submitting: false,
            errorMessage: l10n.commonReponseInattendueServeur,
          );
      }
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      if (e.code == 'AUTH_PIN_LOCKED') {
        state = state.copyWith(submitting: false, step: AuthStep.locked);
      } else {
        state = state.copyWith(
          submitting: false,
          errorMessage: apiErrorMessage(e),
        );
      }
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }

  Future<void> verifyMfa(String code) async {
    final challengeId = state.challengeId;
    if (challengeId == null) return;
    state = state.copyWith(submitting: true, clearError: true);
    try {
      final answer = await ref
          .read(apiClientProvider)
          .send(
            (api) => api.agentAuthController.verifyMfa(
              body: VerifyMfaRequest(challengeId: challengeId, code: code),
            ),
          );
      await _saveSession(requireData(answer.data));
      if (!ref.mounted) return;
      ref.read(sessionControllerProvider.notifier).markAuthenticated();
      state = state.copyWith(submitting: false);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: apiErrorMessage(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }

  /// Initial PIN setup using the single-use PIN_SETUP token (spec §3.6). Per
  /// spec no session is issued — return to login to authenticate with the new PIN.
  Future<void> setupPin(String pin) async {
    final token = state.pinSetupToken;
    if (token == null) return;
    state = state.copyWith(submitting: true, clearError: true);
    try {
      await ref
          .read(apiClientProvider)
          .sendWithBearer(
            token,
            (api) => api.agentAuthPinController.setup1(
              body: SetAuthPinRequest(pin: pin),
            ),
          );
      if (!ref.mounted) return;
      state = state.copyWith(submitting: false, step: AuthStep.login);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: apiErrorMessage(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }

  /// Forgotten-PIN self-service (spec §3.6): gated by TOTP. On success the
  /// backend sets the new PIN directly (no session issued) — we return to the
  /// login step with a confirmation banner so the agent signs in with it.
  Future<void> resetPin({
    required String phoneNumber,
    required String totpCode,
    required String newPin,
  }) async {
    state = state.copyWith(
      submitting: true,
      clearError: true,
      phoneNumber: phoneNumber,
    );
    try {
      await ref
          .read(apiClientProvider)
          .send(
            (api) => api.agentAuthPinController.reset(
              body: ResetAuthPinRequest(
                phoneCountryCode: _countryCode,
                phoneNumber: _digits(phoneNumber),
                totpCode: totpCode,
                newPin: newPin,
              ),
            ),
          );
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        step: AuthStep.login,
        pinResetDone: true,
      );
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: apiErrorMessage(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        submitting: false,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }

  /// Stores the session tokens of a login or MFA answer.
  Future<void> _saveSession(LoginResponse res) async {
    final tokens = AuthTokens.fromTokens(res.tokens);
    if (tokens == null) throw ApiError.emptyResponse();
    await ref.read(tokenStoreProvider).save(tokens);
  }

  String _digits(String s) => s.replaceAll(RegExp(r'\D'), '');
}

final loginControllerProvider =
    NotifierProvider.autoDispose<LoginController, LoginState>(
      LoginController.new,
    );
