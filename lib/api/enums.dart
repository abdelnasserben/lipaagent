import '../l10n/l10n.dart';
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

  String get label => switch (this) {
    pendingKyc => l10n.labelVerification,
    active => l10n.labelActif,
    suspended => l10n.labelSuspendu,
    frozen => l10n.labelGele,
    closed => l10n.labelCloture,
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

  String get label => switch (this) {
    pendingKyc => l10n.labelVerification,
    active => l10n.labelActif,
    suspended => l10n.labelSuspendu,
    frozen => l10n.labelGele,
    closed => l10n.labelCloture,
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

  String get label => switch (this) {
    pendingKyc => l10n.labelVerification,
    active => l10n.labelActif,
    suspended => l10n.labelSuspendu,
    frozen => l10n.labelGele,
    closed => l10n.labelCloture,
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

  String get label => switch (this) {
    none => l10n.labelAucun,
    basic => l10n.labelBasique,
    verified => l10n.labelVerifie,
    enhanced => l10n.labelRenforce,
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

  String get label => switch (this) {
    active => l10n.labelActif,
    frozen => l10n.labelGele,
    suspended => l10n.labelSuspendu,
    closed => l10n.labelCloture,
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

  /// Long-form label (lib/l10n). Pure-Dart so non-widget layers (e.g. statement
  /// entries) can localize a raw wire token (cf. Lipa statement description).
  String get label => switch (this) {
    cashIn => l10n.labelDepotCashIn,
    merchantCashOut => l10n.commonRetraitMarchandCashOut,
    merchantPayment => l10n.labelPaiementMarchand,
    cardSale => l10n.commonVenteCarte,
    cardReplacement => l10n.commonRemplacementCarte,
    commissionPayout => l10n.commonCommission,
    agentFloatTopUp => l10n.labelApprovisionnementFloat,
    agentFloatWithdrawal => l10n.labelRetraitFloat,
    standaloneFee => l10n.commonFrais,
    reversal => l10n.labelAnnulation,
    merchantTransfer => l10n.labelTransfertMarchand,
    billPayment => l10n.labelPaiementFacture,
    billerSettlement => l10n.labelReglementFacturier,
    platformRevenueWithdrawal => l10n.labelRetraitPlateforme,
    unknown => l10n.labelTransaction,
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

  String get label => switch (this) {
    standard => l10n.labelStandard,
    premium => l10n.labelPremium,
    corporate => l10n.labelEntreprise,
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

  String get label => switch (this) {
    issued => l10n.labelEmise,
    active => l10n.labelActive,
    blocked => l10n.labelBloquee,
    lost => l10n.commonPerdue,
    stolen => l10n.commonVolee,
    expired => l10n.labelExpiree,
    closed => l10n.labelCloturee,
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

  String get label => switch (this) {
    inWarehouse => l10n.labelEntrepot,
    assignedToAgent => l10n.labelAttribuee,
    sold => l10n.labelVendue,
    returned => l10n.labelRetournee,
    spoiled => l10n.labelAbimee,
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

  String get label => switch (this) {
    nationalId => l10n.labelCarteNationaleIdentite,
    passport => l10n.commonPasseport,
    proofOfAddress => l10n.labelJustificatifDomicile,
    businessLicense => l10n.labelLicenceCommerciale,
    other => l10n.commonAutre,
    unknown => l10n.labelDocument,
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

  String get label => switch (this) {
    pendingReview => l10n.commonRevue,
    accepted => l10n.commonAcceptee,
    rejected => l10n.commonRejetee,
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

  String get label => switch (this) {
    immediate => l10n.labelImmediat,
    batchDaily => l10n.labelQuotidien,
    batchWeekly => l10n.labelHebdomadaire,
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

  String get label => switch (this) {
    pending => l10n.commonAttente,
    paid => l10n.labelPayee,
    failed => l10n.labelEchec,
    cancelled => l10n.labelAnnulee,
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
