// Small helpers on the generated API types (lib/api/generated). They derive
// values for the screens; they never hold business rules.
import '../core/utils/formatters.dart';
import 'enums.dart';
import 'generated/export.dart';

extension AgentProfileHelpers on AgentProfileResponse {
  String get phonePretty => fmtPhone(phoneCountryCode ?? '', phoneNumber ?? '');
  bool get hasAnyCashOps => (canDoCashIn ?? false) || (canDoCashOut ?? false);
}

extension CustomerLookupHelpers on CustomerLookupResponse {
  String get phonePretty => fmtPhone(phoneCountryCode ?? '', phoneNumber ?? '');
}

extension MerchantLookupHelpers on MerchantLookupResponse {
  String get phonePretty => fmtPhone(phoneCountryCode ?? '', phoneNumber ?? '');
}

extension CardLookupHelpers on CardLookupResponse {
  /// True when the card belongs to a customer.
  bool get isLinked => customerId != null && customerId!.isNotEmpty;
}

extension AgentTransactionHelpers on AgentTransactionResponse {
  TransactionType get kind => TransactionType.parse(type);
  TransactionStatus get state => TransactionStatus.parse(status);

  /// What the transaction changed on the agent's account, commissions
  /// included: negative when money went out.
  int get signedAmount => balanceChange ?? 0;
  bool get incoming => signedAmount > 0;
  DateTime? get effectiveAt => completedAt ?? declinedAt ?? createdAt;
}

extension StatementEntryHelpers on AgentStatementEntryResponse {
  EntrySide get entrySide => EntrySide.parse(side);
  int get signedAmount => entrySide.isCredit ? (amount ?? 0) : -(amount ?? 0);

  /// The transaction type that leads the ledger [description] (the rest is
  /// internal English, never shown). Commission lines read "Commission …".
  TransactionType get kind {
    final raw = (description ?? '').trim();
    final m = RegExp(r'^([A-Z][A-Z0-9_]*)\b').firstMatch(raw);
    final parsed = TransactionType.parse(m?.group(1));
    if (parsed != TransactionType.unknown) return parsed;
    if (raw.startsWith('Commission')) return TransactionType.commissionPayout;
    return TransactionType.unknown;
  }
}

extension CashOutHelpers on AgentMerchantCashOutResponse {
  bool get isExecuted =>
      outcome == AgentMerchantCashOutResponseOutcome.executed;
  bool get needsPin =>
      outcome == AgentMerchantCashOutResponseOutcome.pendingPin;
  bool get needsConfirmation =>
      outcome == AgentMerchantCashOutResponseOutcome.pendingConfirmation;
  bool get needsApproval =>
      outcome == AgentMerchantCashOutResponseOutcome.pendingApproval;
}

/// Which answer the login (or MFA verification) gave.
enum LoginBranch { session, mfa, pinSetup, unknown }

extension LoginResponseHelpers on LoginResponse {
  LoginBranch get branch {
    if ((pinSetupRequired ?? false) && pinSetupToken != null) {
      return LoginBranch.pinSetup;
    }
    if ((mfaRequired ?? false) && challengeId != null) return LoginBranch.mfa;
    if (tokens != null) return LoginBranch.session;
    return LoginBranch.unknown;
  }
}

extension NotificationHelpers on NotificationResponse {
  bool get isUnread => status == NotificationResponseStatus.unread;

  /// The amount parameter, when the notification has one.
  int? get amount {
    final value = parameters?['amount'];
    return value is num ? value.toInt() : null;
  }
}
