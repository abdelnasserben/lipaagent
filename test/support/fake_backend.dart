import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lipa_agent/api/api_client.dart';
import 'package:lipa_agent/core/auth/token_store.dart';
import 'package:lipa_agent/core/config/app_environment.dart';
import 'package:lipa_agent/core/providers.dart';

/// A request the app sent to the fake backend.
class SentRequest {
  SentRequest(this.method, this.path, this.headers, this.body);
  final String method;
  final String path;
  final Map<String, dynamic> headers;
  final Map<String, dynamic>? body;
}

/// A scripted answer: HTTP status and JSON body.
class Answer {
  const Answer(this.status, this.body);
  final int status;
  final Object? body;

  /// `{ data, timestamp }` success envelope.
  factory Answer.data(Object? data, {int status = 200}) =>
      Answer(status, {'data': data, 'timestamp': '2026-10-22T10:00:00Z'});

  /// `{ error: { code, … } }` error envelope.
  factory Answer.error(int status, String code) => Answer(status, {
    'error': {
      'code': code,
      'message': 'technical message',
      'details': <String>[],
      'correlationId': 'corr-1',
    },
  });
}

/// Plays the backend: answers each request with the next scripted [Answer]
/// for its `METHOD path`, and records what the app sent.
class FakeBackend implements HttpClientAdapter {
  final _answers = <String, List<Answer>>{};
  final sent = <SentRequest>[];

  void on(String method, String path, Answer answer) =>
      _answers.putIfAbsent('$method $path', () => []).add(answer);

  List<SentRequest> sentTo(String path) =>
      sent.where((r) => r.path == path).toList();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    Map<String, dynamic>? body;
    if (options.data is Map<String, dynamic>) {
      body = options.data as Map<String, dynamic>;
    } else if (options.data != null && options.data is! FormData) {
      body = jsonDecode(jsonEncode(options.data)) as Map<String, dynamic>;
    }
    sent.add(
      SentRequest(options.method, options.path, {...options.headers}, body),
    );
    final queue = _answers['${options.method} ${options.path}'];
    if (queue == null || queue.isEmpty) {
      throw StateError('No answer for ${options.method} ${options.path}');
    }
    final answer = queue.length > 1 ? queue.removeAt(0) : queue.first;
    return ResponseBody.fromString(
      jsonEncode(answer.body),
      answer.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// Tokens kept in memory instead of the device's secure storage.
class MemoryTokenStore extends TokenStore {
  MemoryTokenStore([this._tokens]) : super(const FlutterSecureStorage());
  AuthTokens? _tokens;

  @override
  AuthTokens? get current => _tokens;

  @override
  Future<AuthTokens?> load() async => _tokens;

  @override
  Future<void> save(AuthTokens tokens) async => _tokens = tokens;

  @override
  Future<void> clear() async => _tokens = null;
}

/// A session valid for one more hour.
AuthTokens validSession({String access = 'access-1'}) => AuthTokens(
  accessToken: access,
  accessTokenExpiresAt: DateTime.now().add(const Duration(hours: 1)),
  refreshToken: 'refresh-1',
  refreshTokenExpiresAt: DateTime.now().add(const Duration(days: 30)),
);

const testConfig = AppConfig(
  environment: AppEnvironment.local,
  baseUrl: 'http://test',
  connectTimeout: Duration(seconds: 1),
  receiveTimeout: Duration(seconds: 1),
  tokenRefreshLeadTime: Duration(minutes: 1),
  unreadPollInterval: Duration(seconds: 30),
);

/// An [ApiClient] talking to [backend].
ApiClient fakeApiClient(FakeBackend backend, TokenStore tokens) =>
    ApiClient(config: testConfig, tokenStore: tokens, httpAdapter: backend);

/// A provider container whose API calls go to [backend].
ProviderContainer containerWith(FakeBackend backend, {TokenStore? tokens}) {
  final store = tokens ?? MemoryTokenStore(validSession());
  return ProviderContainer(
    overrides: [
      tokenStoreProvider.overrideWithValue(store),
      apiClientProvider.overrideWithValue(fakeApiClient(backend, store)),
    ],
    retry: (retryCount, error) => null,
  );
}
