// Backend enums (OpenAPI contract, group `agent`). Each parses defensively from
// its wire string and keeps an `unknown` fallback so future values never crash
// the UI.

enum AgentStatus {
  pendingKyc,
  active,
  suspended,
  frozen,
  closed,
  unknown;

  static AgentStatus parse(String? s) => switch (s) {
    'PENDING_KYC' => pendingKyc,
    'ACTIVE' => active,
    'SUSPENDED' => suspended,
    'FROZEN' => frozen,
    'CLOSED' => closed,
    _ => unknown,
  };

  bool get isActive => this == active;

  String get frLabel => switch (this) {
    pendingKyc => 'En vérification',
    active => 'Actif',
    suspended => 'Suspendu',
    frozen => 'Gelé',
    closed => 'Clôturé',
    unknown => '—',
  };
}

enum CustomerStatus {
  pendingKyc,
  active,
  suspended,
  frozen,
  closed,
  unknown;

  static CustomerStatus parse(String? s) => switch (s) {
    'PENDING_KYC' => pendingKyc,
    'ACTIVE' => active,
    'SUSPENDED' => suspended,
    'FROZEN' => frozen,
    'CLOSED' => closed,
    _ => unknown,
  };

  String get frLabel => switch (this) {
    pendingKyc => 'En vérification',
    active => 'Actif',
    suspended => 'Suspendu',
    frozen => 'Gelé',
    closed => 'Clôturé',
    unknown => '—',
  };
}

enum MerchantStatus {
  pendingKyc,
  active,
  suspended,
  frozen,
  closed,
  unknown;

  static MerchantStatus parse(String? s) => switch (s) {
    'PENDING_KYC' => pendingKyc,
    'ACTIVE' => active,
    'SUSPENDED' => suspended,
    'FROZEN' => frozen,
    'CLOSED' => closed,
    _ => unknown,
  };

  String get frLabel => switch (this) {
    pendingKyc => 'En vérification',
    active => 'Actif',
    suspended => 'Suspendu',
    frozen => 'Gelé',
    closed => 'Clôturé',
    unknown => '—',
  };
}

enum KycLevel {
  none,
  basic,
  verified,
  enhanced,
  unknown;

  static KycLevel parse(String? s) => switch (s) {
    'KYC_NONE' => none,
    'KYC_BASIC' => basic,
    'KYC_VERIFIED' => verified,
    'KYC_ENHANCED' => enhanced,
    _ => unknown,
  };

  String get frLabel => switch (this) {
    none => 'Aucun',
    basic => 'Basique',
    verified => 'Vérifié',
    enhanced => 'Renforcé',
    unknown => '—',
  };
}

enum AccountStatus {
  active,
  frozen,
  suspended,
  closed,
  unknown;

  static AccountStatus parse(String? s) => switch (s) {
    'ACTIVE' => active,
    'FROZEN' => frozen,
    'SUSPENDED' => suspended,
    'CLOSED' => closed,
    _ => unknown,
  };

  bool get isActive => this == active;

  String get frLabel => switch (this) {
    active => 'Actif',
    frozen => 'Gelé',
    suspended => 'Suspendu',
    closed => 'Clôturé',
    unknown => '—',
  };
}

/// Backend `TransactionType`. Only some of them touch an agent's account.
enum TransactionType {
  cashIn,
  merchantPayment,
  merchantCashOut,
  cardSale,
  agentFloatTopUp,
  agentFloatWithdrawal,
  standaloneFee,
  commissionPayout,
  reversal,
  merchantTransfer,
  billPayment,
  cardReplacement,
  billerSettlement,
  platformRevenueWithdrawal,
  unknown;

  static TransactionType parse(String? s) => switch (s) {
    'CASH_IN' => cashIn,
    'MERCHANT_PAYMENT' => merchantPayment,
    'MERCHANT_CASH_OUT' => merchantCashOut,
    'CARD_SALE' => cardSale,
    'AGENT_FLOAT_TOP_UP' => agentFloatTopUp,
    'AGENT_FLOAT_WITHDRAWAL' => agentFloatWithdrawal,
    'STANDALONE_FEE' => standaloneFee,
    'COMMISSION_PAYOUT' => commissionPayout,
    'REVERSAL' => reversal,
    'MERCHANT_TRANSFER' => merchantTransfer,
    'BILL_PAYMENT' => billPayment,
    'CARD_REPLACEMENT' => cardReplacement,
    'BILLER_SETTLEMENT' => billerSettlement,
    'PLATFORM_REVENUE_WITHDRAWAL' => platformRevenueWithdrawal,
    _ => unknown,
  };

  /// Long-form French label. Pure-Dart so non-widget layers (e.g. statement
  /// entries) can localize a raw wire token (cf. Lipa statement description).
  String get frLabel => switch (this) {
    cashIn => 'Dépôt (cash-in)',
    merchantCashOut => 'Retrait marchand (cash-out)',
    merchantPayment => 'Paiement marchand',
    cardSale => 'Vente de carte',
    cardReplacement => 'Remplacement de carte',
    commissionPayout => 'Commission',
    agentFloatTopUp => 'Approvisionnement float',
    agentFloatWithdrawal => 'Retrait float',
    standaloneFee => 'Frais',
    reversal => 'Annulation',
    merchantTransfer => 'Transfert marchand',
    billPayment => 'Paiement de facture',
    billerSettlement => 'Règlement facturier',
    platformRevenueWithdrawal => 'Retrait plateforme',
    unknown => 'Transaction',
  };
}

enum TransactionStatus {
  pending,
  authorized,
  completed,
  declined,
  reversed,
  unknown;

  static TransactionStatus parse(String? s) => switch (s) {
    'PENDING' => pending,
    'AUTHORIZED' => authorized,
    'COMPLETED' => completed,
    'DECLINED' => declined,
    'REVERSED' => reversed,
    _ => unknown,
  };

  bool get isCompleted => this == completed;
  bool get isDeclined => this == declined;
}

enum CardType {
  standard,
  premium,
  corporate,
  unknown;

  static CardType parse(String? s) => switch (s) {
    'STANDARD' => standard,
    'PREMIUM' => premium,
    'CORPORATE' => corporate,
    _ => unknown,
  };

  String get frLabel => switch (this) {
    standard => 'Standard',
    premium => 'Premium',
    corporate => 'Entreprise',
    unknown => '—',
  };
}

enum CardStatus {
  issued,
  active,
  blocked,
  lost,
  stolen,
  expired,
  closed,
  unknown;

  static CardStatus parse(String? s) => switch (s) {
    'ISSUED' => issued,
    'ACTIVE' => active,
    'BLOCKED' => blocked,
    'LOST' => lost,
    'STOLEN' => stolen,
    'EXPIRED' => expired,
    'CLOSED' => closed,
    _ => unknown,
  };

  bool get isActive => this == active;

  String get frLabel => switch (this) {
    issued => 'Émise',
    active => 'Active',
    blocked => 'Bloquée',
    lost => 'Perdue',
    stolen => 'Volée',
    expired => 'Expirée',
    closed => 'Clôturée',
    unknown => '—',
  };
}

enum CardStockStatus {
  inWarehouse,
  assignedToAgent,
  sold,
  returned,
  spoiled,
  unknown;

  static CardStockStatus parse(String? s) => switch (s) {
    'IN_WAREHOUSE' => inWarehouse,
    'ASSIGNED_TO_AGENT' => assignedToAgent,
    'SOLD' => sold,
    'RETURNED' => returned,
    'SPOILED' => spoiled,
    _ => unknown,
  };

  /// Wire name, for the `?status` query param.
  String get wire => switch (this) {
    inWarehouse => 'IN_WAREHOUSE',
    assignedToAgent => 'ASSIGNED_TO_AGENT',
    sold => 'SOLD',
    returned => 'RETURNED',
    spoiled => 'SPOILED',
    unknown => 'ASSIGNED_TO_AGENT',
  };

  String get frLabel => switch (this) {
    inWarehouse => 'En entrepôt',
    assignedToAgent => 'Attribuée',
    sold => 'Vendue',
    returned => 'Retournée',
    spoiled => 'Abîmée',
    unknown => '—',
  };
}

enum KycDocumentType {
  nationalId,
  passport,
  proofOfAddress,
  businessLicense,
  other,
  unknown;

  static KycDocumentType parse(String? s) => switch (s) {
    'NATIONAL_ID' => nationalId,
    'PASSPORT' => passport,
    'PROOF_OF_ADDRESS' => proofOfAddress,
    'BUSINESS_LICENSE' => businessLicense,
    'OTHER' => other,
    _ => unknown,
  };

  String get wire => switch (this) {
    nationalId => 'NATIONAL_ID',
    passport => 'PASSPORT',
    proofOfAddress => 'PROOF_OF_ADDRESS',
    businessLicense => 'BUSINESS_LICENSE',
    other => 'OTHER',
    unknown => 'OTHER',
  };

  String get frLabel => switch (this) {
    nationalId => 'Carte nationale d’identité',
    passport => 'Passeport',
    proofOfAddress => 'Justificatif de domicile',
    businessLicense => 'Licence commerciale',
    other => 'Autre',
    unknown => 'Document',
  };
}

enum KycDocumentStatus {
  pendingReview,
  accepted,
  rejected,
  unknown;

  static KycDocumentStatus parse(String? s) => switch (s) {
    'PENDING_REVIEW' => pendingReview,
    'ACCEPTED' => accepted,
    'REJECTED' => rejected,
    _ => unknown,
  };

  String get frLabel => switch (this) {
    pendingReview => 'En revue',
    accepted => 'Acceptée',
    rejected => 'Rejetée',
    unknown => '—',
  };
}

enum SettlementMode {
  immediate,
  batchDaily,
  batchWeekly,
  unknown;

  static SettlementMode parse(String? s) => switch (s) {
    'IMMEDIATE' => immediate,
    'BATCH_DAILY' => batchDaily,
    'BATCH_WEEKLY' => batchWeekly,
    _ => unknown,
  };

  String get frLabel => switch (this) {
    immediate => 'Immédiat',
    batchDaily => 'Quotidien',
    batchWeekly => 'Hebdomadaire',
    unknown => '—',
  };
}

enum PayoutStatus {
  pending,
  paid,
  failed,
  cancelled,
  unknown;

  static PayoutStatus parse(String? s) => switch (s) {
    'PENDING' => pending,
    'PAID' => paid,
    'FAILED' => failed,
    'CANCELLED' => cancelled,
    _ => unknown,
  };

  /// Wire name, for the `?status` query param.
  String get wire => switch (this) {
    pending => 'PENDING',
    paid => 'PAID',
    failed => 'FAILED',
    cancelled => 'CANCELLED',
    unknown => 'PENDING',
  };

  String get frLabel => switch (this) {
    pending => 'En attente',
    paid => 'Payée',
    failed => 'Échec',
    cancelled => 'Annulée',
    unknown => '—',
  };
}

enum EntrySide {
  debit,
  credit,
  unknown;

  static EntrySide parse(String? s) => switch (s) {
    'DEBIT' => debit,
    'CREDIT' => credit,
    _ => unknown,
  };

  bool get isCredit => this == credit;
}

/// Cash-out control-tier outcome (spec §7.3 / §8). Branch on the HTTP status
/// **and** this outcome to decide the next step.
enum CashOutOutcome {
  executed,
  pendingPin,
  pendingConfirmation,
  pendingApproval,
  unknown;

  static CashOutOutcome parse(String? s) => switch (s) {
    'EXECUTED' => executed,
    'PENDING_PIN' => pendingPin,
    'PENDING_CONFIRMATION' => pendingConfirmation,
    'PENDING_APPROVAL' => pendingApproval,
    _ => unknown,
  };
}

enum NotificationStatus {
  unread,
  read,
  unknown;

  static NotificationStatus parse(String? s) => switch (s) {
    'UNREAD' => unread,
    'READ' => read,
    _ => unknown,
  };

  bool get isUnread => this == unread;
}
