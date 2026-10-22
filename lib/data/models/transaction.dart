import '../../core/utils/formatters.dart';
import 'enums.dart';

int _int(Object? v) => v is int ? v : (v is num ? v.toInt() : 0);

/// `AgentTransactionResponse` — a transaction of the agent's account (history
/// row and detail view).
class AgentTransaction {
  const AgentTransaction({
    required this.id,
    required this.type,
    required this.status,
    required this.initiatorType,
    required this.initiatorId,
    required this.requestedAmount,
    required this.feeAmount,
    required this.commissionAmount,
    required this.netAmountToDestination,
    required this.balanceChange,
    this.details = const {},
    this.declineReason,
    this.correlationId,
    this.createdAt,
    this.completedAt,
    this.declinedAt,
  });

  final String id;
  final TransactionType type;
  final TransactionStatus status;
  final String initiatorType;
  final String initiatorId;
  final int requestedAmount;
  final int feeAmount;
  final int commissionAmount;
  final int netAmountToDestination;

  /// What the transaction changed on the agent's account, commissions
  /// included: negative when money went out.
  final int balanceChange;

  /// Type-dependent extra fields (e.g. `cardId` of a card sale).
  final Map<String, dynamic> details;
  final String? declineReason;
  final String? correlationId;
  final DateTime? createdAt;
  final DateTime? completedAt;
  final DateTime? declinedAt;

  /// True when the agent's account received money.
  bool get incoming => balanceChange > 0;

  /// Signed amount from the agent account's point of view (credit +, debit −).
  int get signedAmount => balanceChange;

  DateTime? get effectiveAt => completedAt ?? declinedAt ?? createdAt;

  factory AgentTransaction.fromJson(Map<String, dynamic> json) =>
      AgentTransaction(
        id: (json['id'] ?? '') as String,
        type: TransactionType.parse(json['type'] as String?),
        status: TransactionStatus.parse(json['status'] as String?),
        initiatorType: (json['initiatorType'] ?? '') as String,
        initiatorId: (json['initiatorId'] ?? '') as String,
        requestedAmount: _int(json['requestedAmount']),
        feeAmount: _int(json['feeAmount']),
        commissionAmount: _int(json['commissionAmount']),
        netAmountToDestination: _int(json['netAmountToDestination']),
        balanceChange: _int(json['balanceChange']),
        details: json['details'] is Map<String, dynamic>
            ? json['details'] as Map<String, dynamic>
            : const {},
        declineReason: json['declineReason'] as String?,
        correlationId: json['correlationId'] as String?,
        createdAt: tryParseInstant(json['createdAt']),
        completedAt: tryParseInstant(json['completedAt']),
        declinedAt: tryParseInstant(json['declinedAt']),
      );
}

/// `AgentStatementEntryResponse` — a ledger line of the agent's account.
class StatementEntry {
  const StatementEntry({
    required this.id,
    required this.transactionId,
    required this.side,
    required this.amount,
    required this.runningBalance,
    required this.description,
    this.postedAt,
    this.globalSequence,
  });

  final String id;
  final String transactionId;
  final EntrySide side;
  final int amount;
  final int runningBalance;

  /// Internal ledger string from the backend that *leads* with the raw
  /// transaction type followed by technical detail. Localize the leading token
  /// via [TransactionType.frLabel].
  final String description;
  final DateTime? postedAt;
  final int? globalSequence;

  /// French label derived from the *leading* type token of [description]
  /// (the rest of the string is technical detail we drop). The backend text is
  /// internal English and is never shown: commission lines
  /// ("Commission settle (…)") get the commission label, anything else
  /// unrecognised the generic one.
  String get descriptionFr {
    final raw = description.trim();
    final t = _leadingType(raw);
    if (t != null && t != TransactionType.unknown) return t.frLabel;
    if (raw.startsWith('Commission')) {
      return TransactionType.commissionPayout.frLabel;
    }
    return TransactionType.unknown.frLabel;
  }

  /// Parses the leading SCREAMING_SNAKE token (the type) from a ledger
  /// description. Returns null when the string doesn't start with such a token.
  static TransactionType? _leadingType(String s) {
    final m = RegExp(r'^([A-Z][A-Z0-9_]*)').firstMatch(s);
    if (m == null) return null;
    return TransactionType.parse(m.group(1));
  }

  /// Signed amount from the entry side.
  int get signedAmount => side.isCredit ? amount : -amount;

  factory StatementEntry.fromJson(Map<String, dynamic> json) => StatementEntry(
    id: (json['id'] ?? '') as String,
    transactionId: (json['transactionId'] ?? '') as String,
    side: EntrySide.parse(json['side'] as String?),
    amount: _int(json['amount']),
    runningBalance: _int(json['runningBalance']),
    description: (json['description'] ?? '') as String,
    postedAt: tryParseInstant(json['postedAt']),
    globalSequence: json['globalSequence'] is num
        ? _int(json['globalSequence'])
        : null,
  );
}
