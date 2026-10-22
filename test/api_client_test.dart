import 'package:flutter_test/flutter_test.dart';
import 'package:lipa_agent/api/api_client.dart';
import 'package:lipa_agent/api/generated/export.dart';
import 'package:lipa_agent/core/error/api_error.dart';

import 'support/fake_backend.dart';

const _cashOut = '/api/v1/agent/cash-out';
const _me = '/api/v1/agent/me';
const _refresh = '/api/v1/auth/agent/refresh';

Map<String, Object?> _tokens(String access) => {
  'accessToken': access,
  'accessTokenExpiresAt': '2099-01-01T00:00:00Z',
  'refreshToken': 'refresh-2',
  'refreshTokenExpiresAt': '2099-02-01T00:00:00Z',
};

void main() {
  late FakeBackend backend;
  late MemoryTokenStore tokens;
  late ApiClient client;

  setUp(() {
    backend = FakeBackend();
    tokens = MemoryTokenStore(validSession());
    client = fakeApiClient(backend, tokens);
  });

  test('sends the session and a correlation id', () async {
    backend.on('GET', _me, Answer.data({'fullName': 'Ismael'}));
    final res = await client.send((api) => api.agentMeController.getProfile());
    expect(res.data?.fullName, 'Ismael');
    final headers = backend.sent.single.headers;
    expect(headers['Authorization'], 'Bearer access-1');
    expect(headers['X-Correlation-Id'], isNotEmpty);
  });

  test('a wrong PIN (401) is returned, never resent', () async {
    backend.on('POST', _cashOut, Answer.error(401, 'AUTH_PIN_INVALID'));
    backend.on('POST', _refresh, Answer.data(_tokens('access-2')));
    var expired = false;
    client.onSessionExpired = () => expired = true;

    await expectLater(
      client.send(
        (api) => api.agentTransactionController.cashOut(
          idempotencyKey: 'k1',
          body: const AgentMerchantCashOutRequest(
            merchantId: 'm1',
            amount: 1000,
            merchantPin: '0000',
          ),
        ),
      ),
      throwsA(
        isA<ApiError>().having((e) => e.code, 'code', 'AUTH_PIN_INVALID'),
      ),
    );
    expect(backend.sentTo(_cashOut), hasLength(1));
    expect(backend.sentTo(_refresh), isEmpty);
    expect(expired, isFalse);
  });

  test('a refused session token is refreshed once, then retried', () async {
    backend.on('GET', _me, Answer.error(401, 'INVALID_TOKEN'));
    backend.on('GET', _me, Answer.data({'fullName': 'Ismael'}));
    backend.on('POST', _refresh, Answer.data(_tokens('access-2')));

    final res = await client.send((api) => api.agentMeController.getProfile());

    expect(res.data?.fullName, 'Ismael');
    expect(backend.sentTo(_refresh), hasLength(1));
    expect(
      backend.sentTo(_me).last.headers['Authorization'],
      'Bearer access-2',
    );
    expect(tokens.current?.accessToken, 'access-2');
  });

  test('a failed refresh ends the session', () async {
    backend.on('GET', _me, Answer.error(401, 'TOKEN_EXPIRED'));
    backend.on('POST', _refresh, Answer.error(401, 'REFRESH_TOKEN_INVALID'));
    var expired = false;
    client.onSessionExpired = () => expired = true;

    await expectLater(
      client.send((api) => api.agentMeController.getProfile()),
      throwsA(isA<ApiError>()),
    );
    expect(expired, isTrue);
    expect(tokens.current, isNull);
  });

  test('an error answer becomes an ApiError with its correlation id', () async {
    backend.on('GET', _me, Answer.error(422, 'DAILY_LIMIT_EXCEEDED'));
    await expectLater(
      client.send((api) => api.agentMeController.getProfile()),
      throwsA(
        isA<ApiError>()
            .having((e) => e.statusCode, 'status', 422)
            .having((e) => e.code, 'code', 'DAILY_LIMIT_EXCEEDED')
            .having((e) => e.correlationId, 'correlationId', 'corr-1'),
      ),
    );
  });

  test('sign-in calls carry no session', () async {
    backend.on('POST', '/api/v1/auth/agent/login', Answer.data({}));
    await client.send(
      (api) => api.agentAuthController.login(
        body: const LoginRequest(
          phoneCountryCode: '269',
          phoneNumber: '3301234',
          pin: '1234',
        ),
      ),
    );
    expect(backend.sent.single.headers['Authorization'], isNull);
  });
}
