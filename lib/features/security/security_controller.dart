import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../../data/models/login_response.dart';

/// Session-scoped "TOTP is enrolled" flag for the connected agent. The agent
/// profile (spec §7.2) carries no TOTP field, so we track it for the session:
/// login's MFA branch is the authoritative cross-device signal (seeded by the
/// login controller), and confirm/revoke keep the Security screen in sync
/// within the session. Drives whether Security offers "configurer" vs
/// "révoquer".
class TotpEnrolled extends Notifier<bool> {
  @override
  bool build() => false;

  void set(bool enrolled) => state = enrolled;
}

final totpEnrolledProvider = NotifierProvider<TotpEnrolled, bool>(
  TotpEnrolled.new,
);

/// Async action result for the security sub-flows (change PIN, TOTP).
class ActionResult {
  const ActionResult({this.loading = false, this.error, this.done = false});
  final bool loading;
  final String? error;
  final bool done;

  static const idle = ActionResult();
}

/// Change-PIN flow (spec §3.6 — PUT /auth-pin, requires currentPin).
class ChangePinController extends Notifier<ActionResult> {
  @override
  ActionResult build() => ActionResult.idle;

  Future<void> submit({
    required String currentPin,
    required String newPin,
  }) async {
    state = const ActionResult(loading: true);
    try {
      await ref
          .read(authRepositoryProvider)
          .changePin(currentPin: currentPin, newPin: newPin);
      if (!ref.mounted) return;
      state = const ActionResult(done: true);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = ActionResult(error: frenchMessageForError(e));
    } catch (_) {
      if (!ref.mounted) return;
      state = const ActionResult(error: 'Une erreur est survenue.');
    }
  }

  void reset() => state = ActionResult.idle;
}

final changePinControllerProvider =
    NotifierProvider.autoDispose<ChangePinController, ActionResult>(
      ChangePinController.new,
    );

/// TOTP enrollment flow (spec §3.7).
class TotpState {
  const TotpState({
    this.loading = false,
    this.setup,
    this.error,
    this.confirmed = false,
    this.revoked = false,
  });

  final bool loading;
  final TotpSetup? setup;
  final String? error;
  final bool confirmed;
  final bool revoked;

  TotpState copyWith({
    bool? loading,
    TotpSetup? setup,
    String? error,
    bool clearError = false,
    bool? confirmed,
    bool? revoked,
  }) => TotpState(
    loading: loading ?? this.loading,
    setup: setup ?? this.setup,
    error: clearError ? null : (error ?? this.error),
    confirmed: confirmed ?? this.confirmed,
    revoked: revoked ?? this.revoked,
  );
}

class TotpController extends Notifier<TotpState> {
  @override
  TotpState build() => const TotpState();

  Future<void> start() async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final setup = await ref.read(authRepositoryProvider).startTotpSetup();
      if (!ref.mounted) return;
      state = state.copyWith(loading: false, setup: setup);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(loading: false, error: frenchMessageForError(e));
    }
  }

  Future<void> confirm(String code) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      await ref.read(authRepositoryProvider).confirmTotp(code);
      if (!ref.mounted) return;
      ref.read(totpEnrolledProvider.notifier).set(true);
      state = state.copyWith(loading: false, confirmed: true);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(loading: false, error: frenchMessageForError(e));
    }
  }

  Future<void> revoke(String code) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      await ref.read(authRepositoryProvider).revokeTotp(code);
      if (!ref.mounted) return;
      ref.read(totpEnrolledProvider.notifier).set(false);
      state = state.copyWith(loading: false, revoked: true);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(loading: false, error: frenchMessageForError(e));
    }
  }
}

final totpControllerProvider =
    NotifierProvider.autoDispose<TotpController, TotpState>(TotpController.new);
