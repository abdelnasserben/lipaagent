import 'package:flutter_test/flutter_test.dart';
import 'package:lipa_agent/api/enums.dart';
import 'package:lipa_agent/api/generated/export.dart';
import 'package:lipa_agent/api/model_helpers.dart';
import 'package:lipa_agent/api/operation_key.dart';
import 'package:lipa_agent/core/error/api_error.dart';

void main() {
  test('transaction direction comes from balanceChange', () {
    final cashIn = AgentTransactionResponse.fromJson({
      'type': 'CASH_IN',
      'status': 'COMPLETED',
      'requestedAmount': 5000,
      'balanceChange': -4975,
    });
    expect(cashIn.kind, TransactionType.cashIn);
    expect(cashIn.state, TransactionStatus.completed);
    expect(cashIn.incoming, isFalse);
    expect(cashIn.signedAmount, -4975);

    final unknown = AgentTransactionResponse.fromJson({'type': 'NEW_TYPE'});
    expect(unknown.kind, TransactionType.unknown);
    expect(unknown.signedAmount, 0);
  });

  test('statement lines never show the raw ledger text', () {
    AgentStatementEntryResponse line(String description) =>
        AgentStatementEntryResponse.fromJson({
          'side': 'CREDIT',
          'amount': 25,
          'description': description,
        });
    expect(line('CASH_IN credit (recipient)').kind, TransactionType.cashIn);
    expect(
      line('Commission settle (immediate)').kind,
      TransactionType.commissionPayout,
    );
    expect(line('Something internal').kind, TransactionType.unknown);
    expect(line('x').signedAmount, 25);
  });

  test('new enum values from the backend do not crash', () {
    final res = AgentMerchantCashOutResponse.fromJson({'outcome': 'NEW_ONE'});
    expect(res.outcome, AgentMerchantCashOutResponseOutcome.$unknown);
    expect(res.isExecuted, isFalse);
  });

  test('login answer branches', () {
    expect(
      LoginResponse.fromJson({
        'pinSetupRequired': true,
        'pinSetupToken': 't',
      }).branch,
      LoginBranch.pinSetup,
    );
    expect(
      LoginResponse.fromJson({'mfaRequired': true, 'challengeId': 'c'}).branch,
      LoginBranch.mfa,
    );
    expect(LoginResponse.fromJson({}).branch, LoginBranch.unknown);
  });

  test('OperationKey: same intent same key, new intent new key', () {
    final key = OperationKey();
    final first = key.forIntent('c1|5000');
    expect(key.forIntent('c1|5000'), first);
    expect(key.forIntent('c1|6000'), isNot(first));
  });

  test('error texts never show the technical message', () {
    final e = ApiError.fromResponse(422, {
      'error': {'code': 'BRAND_NEW', 'message': 'tech', 'correlationId': 'c2'},
    });
    expect(errorMessage(e), isNot(contains('tech')));
    expect(errorMessage(e), contains('c2'));
    expect(ApiError.fromResponse(429, null).code, 'RATE_LIMITED');
  });
}
