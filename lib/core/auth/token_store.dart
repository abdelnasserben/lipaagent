import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../api/generated/export.dart';

/// The session tokens returned by login, MFA verification and refresh, as
/// stored on the device.
class AuthTokens {
  const AuthTokens({
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
  });

  final String accessToken;
  final DateTime accessTokenExpiresAt;
  final String refreshToken;
  final DateTime refreshTokenExpiresAt;

  /// From a login / MFA answer; null when a field is missing.
  static AuthTokens? fromTokens(Tokens? t) => _of(
    t?.accessToken,
    t?.accessTokenExpiresAt,
    t?.refreshToken,
    t?.refreshTokenExpiresAt,
  );

  /// From a refresh answer; null when a field is missing.
  static AuthTokens? fromTokenResponse(TokenResponse? t) => _of(
    t?.accessToken,
    t?.accessTokenExpiresAt,
    t?.refreshToken,
    t?.refreshTokenExpiresAt,
  );

  static AuthTokens? _of(
    String? access,
    DateTime? accessExpiresAt,
    String? refresh,
    DateTime? refreshExpiresAt,
  ) {
    if (access == null ||
        accessExpiresAt == null ||
        refresh == null ||
        refreshExpiresAt == null) {
      return null;
    }
    return AuthTokens(
      accessToken: access,
      accessTokenExpiresAt: accessExpiresAt,
      refreshToken: refresh,
      refreshTokenExpiresAt: refreshExpiresAt,
    );
  }

  bool get isAccessExpired => DateTime.now().isAfter(accessTokenExpiresAt);

  /// Should we refresh now, given a lead time before expiry?
  bool shouldRefresh(Duration lead) =>
      DateTime.now().isAfter(accessTokenExpiresAt.subtract(lead));

  factory AuthTokens.fromJson(Map<String, dynamic> json) => AuthTokens(
    accessToken: json['accessToken'] as String,
    accessTokenExpiresAt: DateTime.parse(
      json['accessTokenExpiresAt'] as String,
    ),
    refreshToken: json['refreshToken'] as String,
    refreshTokenExpiresAt: DateTime.parse(
      json['refreshTokenExpiresAt'] as String,
    ),
  );

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'accessTokenExpiresAt': accessTokenExpiresAt.toIso8601String(),
    'refreshToken': refreshToken,
    'refreshTokenExpiresAt': refreshTokenExpiresAt.toIso8601String(),
  };
}

/// Persists tokens in the platform secure enclave (Keychain / Keystore).
/// Never write tokens to plain prefs or logs.
class TokenStore {
  TokenStore(this._storage);

  final FlutterSecureStorage _storage;
  static const _key = 'lipa.agent.tokens';

  AuthTokens? _cache;

  AuthTokens? get current => _cache;

  Future<AuthTokens?> load() async {
    final raw = await _storage.read(key: _key);
    if (raw == null) return null;
    try {
      _cache = AuthTokens.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      await clear();
      return null;
    }
    return _cache;
  }

  Future<void> save(AuthTokens tokens) async {
    _cache = tokens;
    await _storage.write(key: _key, value: jsonEncode(tokens.toJson()));
  }

  Future<void> clear() async {
    _cache = null;
    await _storage.delete(key: _key);
  }
}
