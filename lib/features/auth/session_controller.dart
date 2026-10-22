import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../security/security_controller.dart';

/// High-level session state that drives the root router (logged in vs auth).
enum SessionStatus { unknown, unauthenticated, authenticated }

class SessionState {
  const SessionState({required this.status, this.expiredNotice = false});

  final SessionStatus status;

  /// True right after an involuntary logout (token expiry) so the auth screen
  /// can show the "session expired" variant.
  final bool expiredNotice;

  SessionState copyWith({SessionStatus? status, bool? expiredNotice}) =>
      SessionState(
        status: status ?? this.status,
        expiredNotice: expiredNotice ?? this.expiredNotice,
      );
}

class SessionController extends Notifier<SessionState> {
  @override
  SessionState build() {
    _bootstrap();
    return const SessionState(status: SessionStatus.unknown);
  }

  Future<void> _bootstrap() async {
    // Wire the API client's involuntary-logout signal back to us.
    ref.read(apiClientProvider).onSessionExpired = _onSessionExpired;
    final tokenStore = ref.read(tokenStoreProvider);
    final tokens = await tokenStore.load();
    final hasValidRefresh =
        tokens != null && DateTime.now().isBefore(tokens.refreshTokenExpiresAt);
    state = SessionState(
      status: hasValidRefresh
          ? SessionStatus.authenticated
          : SessionStatus.unauthenticated,
    );
  }

  /// Called by the auth flow after a successful login / MFA / token issue.
  void markAuthenticated() {
    state = const SessionState(status: SessionStatus.authenticated);
  }

  void _onSessionExpired() {
    if (state.status == SessionStatus.authenticated) {
      state = const SessionState(
        status: SessionStatus.unauthenticated,
        expiredNotice: true,
      );
      _resetUserScopedState();
    }
  }

  Future<void> logout() async {
    try {
      await ref.read(authRepositoryProvider).logout();
    } finally {
      state = const SessionState(status: SessionStatus.unauthenticated);
      _resetUserScopedState();
    }
  }

  /// Tears down per-user state that would otherwise leak across accounts.
  ///
  /// [agentRepositoryProvider] is a long-lived singleton; we rebuild it so the
  /// next agent starts clean. The `autoDispose` data
  /// providers unmount with the shell at logout and start fresh on re-login.
  /// (Cf. the Lipa customer app's user-scoped state reset.)
  void _resetUserScopedState() {
    ref.invalidate(agentRepositoryProvider);
    // Session-scoped TOTP flag must not leak to the next agent.
    ref.read(totpEnrolledProvider.notifier).set(false);
  }

  void clearExpiredNotice() {
    if (state.expiredNotice) {
      state = state.copyWith(expiredNotice: false);
    }
  }
}

final sessionControllerProvider =
    NotifierProvider<SessionController, SessionState>(SessionController.new);
