import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lipa_agent/features/cashout/cash_out_controller.dart';

import 'support/fake_backend.dart';

const _lookup = '/api/v1/agent/merchants/lookup';
const _cashOut = '/api/v1/agent/cash-out';

Answer _outcome(String outcome, {int status = 202}) => Answer.data({
  'outcome': outcome,
  'requestedAmount': 5000,
  if (outcome == 'EXECUTED') 'transactionId': 't1',
}, status: status);

void main() {
  late FakeBackend backend;
  late ProviderContainer container;

  setUp(() {
    backend = FakeBackend()
      ..on(
        'GET',
        _lookup,
        Answer.data({
          'merchantId': 'm1',
          'businessName': 'Boutique',
          'status': 'ACTIVE',
          'canCashOut': true,
        }),
      );
    container = containerWith(backend);
    addTearDown(container.dispose);
  });

  CashOutState state() => container.read(cashOutControllerProvider);

  /// Merchant found and 5 000 KMF entered.
  Future<CashOutController> ready() async {
    final sub = container.listen(cashOutControllerProvider, (_, _) {});
    addTearDown(sub.close);
    final c = container.read(cashOutControllerProvider.notifier);
    await c.lookup('3201234');
    c.setAmount(5000);
    return c;
  }

  test('PENDING_PIN: the PIN is resent with the same key', () async {
    backend
      ..on('POST', _cashOut, _outcome('PENDING_PIN'))
      ..on('POST', _cashOut, _outcome('EXECUTED', status: 200));
    final c = await ready();

    await c.submit();
    expect(state().step, CashOutStep.needsPin);
    await c.submitPin('4321');
    expect(state().step, CashOutStep.done);

    final sent = backend.sentTo(_cashOut);
    expect(sent, hasLength(2));
    expect(
      sent[1].headers['Idempotency-Key'],
      sent[0].headers['Idempotency-Key'],
    );
    expect(sent[0].body?['merchantPin'], isNull);
    expect(sent[1].body?['merchantPin'], '4321');
  });

  test('a wrong merchant PIN stays on the PIN step', () async {
    backend
      ..on('POST', _cashOut, _outcome('PENDING_PIN'))
      ..on('POST', _cashOut, Answer.error(401, 'AUTH_PIN_INVALID'));
    final c = await ready();

    await c.submit();
    await c.submitPin('0000');

    expect(state().step, CashOutStep.needsPin);
    expect(state().pinError, isNotNull);
    expect(backend.sentTo(_cashOut), hasLength(2));
  });

  test('PENDING_CONFIRMATION: confirmation resent with the same key', () async {
    backend
      ..on('POST', _cashOut, _outcome('PENDING_CONFIRMATION'))
      ..on('POST', _cashOut, _outcome('EXECUTED', status: 200));
    final c = await ready();

    await c.submit();
    expect(state().step, CashOutStep.needsConfirmation);
    await c.acknowledgeConfirmation();

    final sent = backend.sentTo(_cashOut);
    expect(sent[1].body?['confirmationAcknowledged'], isTrue);
    expect(
      sent[1].headers['Idempotency-Key'],
      sent[0].headers['Idempotency-Key'],
    );
    expect(state().step, CashOutStep.done);
  });

  test('PENDING_APPROVAL is not shown as done', () async {
    backend.on('POST', _cashOut, _outcome('PENDING_APPROVAL'));
    final c = await ready();

    await c.submit();
    expect(state().step, CashOutStep.approval);
  });

  test('a new amount is a new operation: new key', () async {
    backend.on('POST', _cashOut, Answer.error(422, 'DAILY_LIMIT_EXCEEDED'));
    final c = await ready();

    await c.submit();
    expect(state().errorMessage, isNotNull);
    c.setAmount(3000);
    await c.submit();

    final sent = backend.sentTo(_cashOut);
    expect(
      sent[1].headers['Idempotency-Key'],
      isNot(sent[0].headers['Idempotency-Key']),
    );
  });
}
