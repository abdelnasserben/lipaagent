import 'package:flutter_test/flutter_test.dart';
import 'package:lipa_agent/core/error/api_error.dart';
import 'package:lipa_agent/data/models/agent_profile.dart';
import 'package:lipa_agent/data/models/enums.dart';
import 'package:lipa_agent/data/models/notification.dart';
import 'package:lipa_agent/data/models/transaction.dart';
import 'package:lipa_agent/data/repositories/agent_repository.dart';

void main() {
  group('AgentTransaction', () {
    test('direction and signed amount come from balanceChange', () {
      final cashIn = AgentTransaction.fromJson({
        'id': 't1',
        'type': 'CASH_IN',
        'status': 'COMPLETED',
        'requestedAmount': 5000,
        'balanceChange': -4950,
      });
      expect(cashIn.type, TransactionType.cashIn);
      expect(cashIn.incoming, isFalse);
      expect(cashIn.signedAmount, -4950);

      final cashOut = AgentTransaction.fromJson({
        'id': 't2',
        'type': 'MERCHANT_CASH_OUT',
        'status': 'COMPLETED',
        'requestedAmount': 10000,
        'balanceChange': 10000,
        'details': {'merchantId': 'm1'},
      });
      expect(cashOut.type, TransactionType.merchantCashOut);
      expect(cashOut.incoming, isTrue);
      expect(cashOut.details['merchantId'], 'm1');
    });

    test('agent float types are recognised', () {
      expect(
        TransactionType.parse('AGENT_FLOAT_TOP_UP'),
        TransactionType.agentFloatTopUp,
      );
      expect(
        TransactionType.parse('AGENT_FLOAT_WITHDRAWAL'),
        TransactionType.agentFloatWithdrawal,
      );
      expect(TransactionType.parse('SOMETHING_NEW'), TransactionType.unknown);
    });
  });

  test('StatementEntry reads the side', () {
    final e = StatementEntry.fromJson({
      'id': 'e1',
      'transactionId': 't1',
      'side': 'CREDIT',
      'amount': 300,
      'runningBalance': 1300,
      'description': 'CASH_IN credit',
    });
    expect(e.side, EntrySide.credit);
    expect(e.signedAmount, 300);
    expect(e.descriptionFr, TransactionType.cashIn.frLabel);
  });

  test('StatementEntry never shows the raw ledger text', () {
    StatementEntry line(String description) => StatementEntry.fromJson({
      'side': 'CREDIT',
      'amount': 25,
      'description': description,
    });
    expect(
      line('Commission settle (immediate)').descriptionFr,
      TransactionType.commissionPayout.frLabel,
    );
    expect(
      line('Some internal text').descriptionFr,
      TransactionType.unknown.frLabel,
    );
  });

  test('AgentBalance reads the account fields', () {
    final b = AgentBalance.fromJson({
      'accountId': 'a1',
      'availableBalance': 120000,
      'heldBalance': 500,
      'accountStatus': 'FROZEN',
    });
    expect(b.accountId, 'a1');
    expect(b.heldBalance, 500);
    expect(b.accountStatus, AccountStatus.frozen);
  });

  test('AppNotification reads code and parameters', () {
    final n = AppNotification.fromJson({
      'id': 'n1',
      'category': 'TRANSACTION',
      'code': 'SOME_FUTURE_CODE',
      'parameters': {'amount': 1500, 'currency': 'KMF'},
      'status': 'UNREAD',
    });
    expect(n.title, 'Notification');
    expect(n.body, isNotEmpty);
    expect(n.isUnread, isTrue);
  });

  group('OperationKey', () {
    test('same intent keeps the key, a changed intent gets a new one', () {
      final key = OperationKey();
      final first = key.forIntent('c1|5000');
      expect(key.forIntent('c1|5000'), first);
      final second = key.forIntent('c1|6000');
      expect(second, isNot(first));
      expect(key.forIntent('c1|6000'), second);
    });
  });

  group('ApiError', () {
    test('reads the error envelope', () {
      final e = ApiError.fromResponse(422, {
        'error': {
          'code': 'DAILY_LIMIT_EXCEEDED',
          'message': 'Daily limit exceeded',
          'details': [],
          'correlationId': 'c-1',
        },
      });
      expect(e.code, 'DAILY_LIMIT_EXCEEDED');
      expect(frenchMessageForError(e), contains('journalier'));
    });

    test('unknown codes never show the technical message', () {
      final e = ApiError.fromResponse(422, {
        'error': {
          'code': 'BRAND_NEW_CODE',
          'message': 'Some technical English',
          'correlationId': 'c-2',
        },
      });
      final text = frenchMessageForError(e);
      expect(text, isNot(contains('technical')));
      expect(text, contains('c-2'));
    });

    test('429 without body falls back to RATE_LIMITED', () {
      expect(ApiError.fromResponse(429, null).code, 'RATE_LIMITED');
    });
  });
}
