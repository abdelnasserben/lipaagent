// Named parameters keep private fields: no initializing formals here.
// ignore_for_file: prefer_initializing_formals
import 'dart:async';

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../core/auth/token_store.dart';
import '../core/config/app_environment.dart';
import '../core/error/api_error.dart';
import 'generated/export.dart';

/// Signals that the session is gone and the UI must go back to login.
typedef SessionExpiredCallback = void Function();

/// The one way to call the backend (like `api` + `unwrap` in the back-office):
///
/// ```dart
/// final res = await ref.read(apiClientProvider)
///     .send((api) => api.agentMeController.getProfile());
/// final profile = requireData(res.data);
/// ```
///
/// [send] attaches the session, refreshes it one minute before it expires,
/// adds an `X-Correlation-Id`, and turns every failure into an [ApiError].
class ApiClient {
  ApiClient({
    required AppConfig config,
    required TokenStore tokenStore,
    @visibleForTesting HttpClientAdapter? httpAdapter,
  }) : _config = config,
       _tokenStore = tokenStore,
       _httpAdapter = httpAdapter {
    _dio = _newDio()
      ..interceptors.add(InterceptorsWrapper(onRequest: _onRequest));
    _api = LipaApi(_dio);
    // No session interceptor: used for refresh and for single-purpose bearers.
    _bareApi = LipaApi(_newDio());
  }

  final AppConfig _config;
  final TokenStore _tokenStore;
  final HttpClientAdapter? _httpAdapter;
  late final Dio _dio;
  late final LipaApi _api;
  late final LipaApi _bareApi;

  SessionExpiredCallback? onSessionExpired;

  /// Calls the API with the agent's session. Throws [ApiError].
  Future<T> send<T>(Future<T> Function(LipaApi api) request) =>
      _send(() => request(_api));

  /// Calls the API with a single-purpose bearer (the PIN setup token), never
  /// with the session. Throws [ApiError].
  Future<T> sendWithBearer<T>(
    String bearer,
    Future<T> Function(LipaApi api) request,
  ) {
    final dio = _newDio()..options.headers['Authorization'] = 'Bearer $bearer';
    return _send(() => request(LipaApi(dio)), refreshOnSession: false);
  }

  Dio _newDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _config.baseUrl,
        connectTimeout: _config.connectTimeout,
        receiveTimeout: _config.receiveTimeout,
      ),
    );
    final adapter = _httpAdapter;
    if (adapter != null) dio.httpClientAdapter = adapter;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // One id per request, echoed in errors and backend logs (support).
          options.headers['X-Correlation-Id'] ??= const Uuid().v4();
          handler.next(options);
        },
      ),
    );
    return dio;
  }

  /// Sign-in calls carry no session.
  static const _publicPaths = {
    '/api/v1/auth/agent/login',
    '/api/v1/auth/agent/login/verify-mfa',
    '/api/v1/auth/agent/refresh',
    '/api/v1/auth/agent/auth-pin/setup',
    '/api/v1/auth/agent/auth-pin/reset',
  };

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_publicPaths.contains(options.path)) {
      final token = await _validAccessToken();
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  /// The access token, refreshed first when it expires within the lead time.
  Future<String?> _validAccessToken() async {
    final tokens = _tokenStore.current ?? await _tokenStore.load();
    if (tokens == null) return null;
    if (tokens.shouldRefresh(_config.tokenRefreshLeadTime)) {
      final refreshed = await _refresh(tokens.refreshToken);
      return refreshed?.accessToken ?? tokens.accessToken;
    }
    return tokens.accessToken;
  }

  // One refresh at a time: the refresh token rotates, reusing an old one
  // revokes every session.
  Future<AuthTokens?>? _refreshInFlight;

  Future<AuthTokens?> _refresh(String refreshToken) {
    return _refreshInFlight ??= _doRefresh(
      refreshToken,
    ).whenComplete(() => _refreshInFlight = null);
  }

  Future<AuthTokens?> _doRefresh(String refreshToken) async {
    try {
      final res = await _bareApi.agentAuthController.refresh(
        body: RefreshTokenRequest(refreshToken: refreshToken),
      );
      final tokens = AuthTokens.fromTokenResponse(res.data);
      if (tokens != null) {
        await _tokenStore.save(tokens);
        return tokens;
      }
    } catch (_) {
      // Falls through: the session is over.
    }
    await _tokenStore.clear();
    onSessionExpired?.call();
    return null;
  }

  Future<T> _send<T>(
    Future<T> Function() run, {
    bool refreshOnSession = true,
    bool retried = false,
  }) async {
    try {
      return await run();
    } on DioException catch (e) {
      final response = e.response;
      if (response == null) throw ApiError.network();
      final error = ApiError.fromResponse(
        response.statusCode ?? 0,
        response.data,
      );
      // Refresh once when the session token itself was refused. Any other 401
      // (a wrong PIN: AUTH_PIN_INVALID, INVALID_CREDENTIALS) is an answer to
      // the request: resending it would count a second wrong PIN.
      if (refreshOnSession &&
          error.statusCode == 401 &&
          _sessionCodes.contains(error.code) &&
          !retried) {
        final tokens = _tokenStore.current ?? await _tokenStore.load();
        if (tokens != null && await _refresh(tokens.refreshToken) != null) {
          return _send(run, retried: true);
        }
        onSessionExpired?.call();
      }
      throw error;
    }
  }

  /// 401 codes meaning the access token is missing, expired or revoked.
  static const _sessionCodes = {
    'UNAUTHORIZED',
    'INVALID_TOKEN',
    'TOKEN_EXPIRED',
    'TOKEN_REVOKED',
    'AUTH_INVALID_TOKEN',
  };
}

/// The `data` of a success envelope. All response fields are optional in the
/// contract; a success without data is a server fault.
T requireData<T>(T? data) {
  if (data == null) throw ApiError.emptyResponse();
  return data;
}
