import 'package:flutter_test/flutter_test.dart';
import 'package:lipa_agent/features/cashin/cash_in_controller.dart';

import 'support/fake_backend.dart';

const _lookup = '/api/v1/agent/lookup';
const _cashIn = '/api/v1/agent/cash-in';

void main() {
  test('cash-in: a retry of the same deposit keeps its key', () async {
    final backend = FakeBackend()
      ..on(
        'GET',
        _lookup,
        Answer.data({
          'customerId': 'c1',
          'fullName': 'Riadh',
          'status': 'ACTIVE',
        }),
      )
      ..on('POST', _cashIn, Answer.error(409, 'DUPLICATE_IDEMPOTENCY_KEY'))
      ..on(
        'POST',
        _cashIn,
        Answer.data({'transactionId': 't1', 'requestedAmount': 5000}),
      );
    final container = containerWith(backend);
    addTearDown(container.dispose);
    final sub = container.listen(cashInControllerProvider, (_, _) {});
    addTearDown(sub.close);
    final c = container.read(cashInControllerProvider.notifier);

    await c.lookup('3209876');
    c.setAmount(5000);
    await c.submit();
    expect(container.read(cashInControllerProvider).errorMessage, isNotNull);
    await c.submit();

    expect(container.read(cashInControllerProvider).step, CashInStep.done);
    final sent = backend.sentTo(_cashIn);
    expect(
      sent[1].headers['Idempotency-Key'],
      sent[0].headers['Idempotency-Key'],
    );
    expect(sent[0].body, {'customerId': 'c1', 'amount': 5000});
  });
}
