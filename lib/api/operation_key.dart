import 'package:uuid/uuid.dart';

/// The `Idempotency-Key` of one money-moving operation: the same key while
/// the agent retries the same operation (network error, PIN or confirmation
/// step), a new one as soon as what is sent changes (person, amount, card).
class OperationKey {
  String? _intent;
  String _key = const Uuid().v4();

  /// [intent] describes what is sent, e.g. `'$customerId|$amount'`.
  String forIntent(String intent) {
    if (intent != _intent) {
      _intent = intent;
      _key = const Uuid().v4();
    }
    return _key;
  }
}
