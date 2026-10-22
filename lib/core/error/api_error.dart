import '../../l10n/l10n.dart';

/// An error answer of the backend (`{ "error": { code, message, details,
/// correlationId } }`), or a network failure. Error bodies are not in the
/// contract. Branch on [code], never on [message] (technical English).
///
/// We keep the raw `code` string so unknown/future codes never crash the app.
class ApiError implements Exception {
  const ApiError({
    required this.statusCode,
    required this.code,
    this.message,
    this.details = const [],
    this.correlationId,
  });

  final int statusCode;
  final String code;
  final String? message;
  final List<String> details;
  final String? correlationId;

  /// Parses both the wrapped `{ "error": {...} }` envelope (controller /
  /// validation / 429) and the raw `ApiError` body that Spring Security emits
  /// for 401/403. See spec §2.3.
  factory ApiError.fromResponse(int statusCode, Object? body) {
    Map<String, dynamic>? err;
    if (body is Map<String, dynamic>) {
      final wrapped = body['error'];
      if (wrapped is Map<String, dynamic>) {
        err = wrapped;
      } else if (body.containsKey('code')) {
        err = body; // raw ApiError (security filter)
      }
    }
    final details = <String>[];
    final rawDetails = err?['details'];
    if (rawDetails is List) {
      details.addAll(rawDetails.map((e) => e.toString()));
    }
    return ApiError(
      statusCode: statusCode,
      code: (err?['code'] as String?) ?? _fallbackCode(statusCode),
      message: err?['message'] as String?,
      details: details,
      correlationId: err?['correlationId'] as String?,
    );
  }

  static String _fallbackCode(int status) {
    switch (status) {
      case 401:
        return 'UNAUTHORIZED';
      case 403:
        return 'FORBIDDEN';
      case 404:
        return 'NOT_FOUND';
      case 429:
        return 'RATE_LIMITED';
      default:
        return 'UNKNOWN_ERROR';
    }
  }

  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
  bool get isConflict => statusCode == 409;

  /// True for the codes that mean the agent or its account is unusable and
  /// not self-recoverable.
  bool get isAccountBlocked => const {
    'ACTOR_PENDING_KYC',
    'ACTOR_SUSPENDED',
    'ACTOR_FROZEN',
    'ACTOR_CLOSED',
    'AGENT_NOT_FOUND',
    'ACCOUNT_FROZEN',
    'ACCOUNT_SUSPENDED',
    'ACCOUNT_CLOSED',
  }.contains(code);

  /// A network/transport failure with no HTTP response (timeout, no route).
  factory ApiError.network() =>
      const ApiError(statusCode: 0, code: 'NETWORK_ERROR');

  /// A success response without the expected `data`.
  factory ApiError.emptyResponse() =>
      const ApiError(statusCode: 0, code: 'EMPTY_RESPONSE');

  @override
  String toString() => 'ApiError($statusCode $code: ${message ?? ''})';
}

/// The text of a backend error code (texts in lib/l10n/app_fr.arb, keys
/// `error…`). Unknown codes get a generic text with the correlation id: the
/// technical message and the raw code are never shown.
String apiErrorMessage(ApiError e) {
  switch (e.code) {
    // ── Session / auth ─────────────────────────────────────────────────────
    case 'INVALID_CREDENTIALS':
      return l10n.errorNumeroPinIncorrect;
    case 'AUTH_PIN_INVALID':
      return l10n.errorPinIncorrectReessayez;
    case 'AUTH_PIN_LOCKED':
      return l10n.errorPinBloqueReessayezDans;
    case 'AUTH_PIN_FORMAT':
      return l10n.errorPinDoitComporter4;
    case 'AUTH_PIN_ALREADY_SET':
      return l10n.errorPinDejaDefiniCompte;
    case 'AUTH_PIN_NOT_SET':
      return l10n.errorAucunPinNDefini;
    case 'AUTH_PIN_RESET_TOTP_REQUIRED':
      return l10n.errorActivezTotpContactezBack;
    case 'AUTH_INVALID_TOKEN':
      return l10n.errorLienExpireRecommencezConnexion;
    case 'AUTH_MFA_INVALID':
    case 'MFA_INVALID':
      return l10n.errorCodeVerificationInvalide;
    case 'REFRESH_TOKEN_INVALID':
    case 'UNAUTHORIZED':
    case 'INVALID_TOKEN':
    case 'TOKEN_EXPIRED':
    case 'TOKEN_REVOKED':
      return l10n.errorSessionExpireReconnectezVous;
    case 'RATE_LIMITED':
      return l10n.errorTropTentativesReessayezDans;
    case 'ACTOR_PENDING_KYC':
      return l10n.errorCompteAgentCoursVerification;
    case 'ACTOR_SUSPENDED':
    case 'ACTOR_FROZEN':
    case 'ACTOR_CLOSED':
      return l10n.errorCompteIndisponibleContactezBack;
    case 'ACTOR_KYC_INSUFFICIENT':
      return l10n.errorNiveauVerificationKycInsuffisant;

    // ── Financial / business ───────────────────────────────────────────────
    case 'INSUFFICIENT_BALANCE':
    case 'ACCOUNT_INSUFFICIENT_FUNDS':
      return l10n.errorSoldeInsuffisantOperation;
    case 'TRANSACTION_AMOUNT_TOO_LOW':
      return l10n.errorMontantInferieurMinimumAutorise;
    case 'TRANSACTION_AMOUNT_TOO_HIGH':
      return l10n.errorMontantSuperieurMaximumAutorise;
    case 'TRANSACTION_ZERO_AMOUNT':
      return l10n.errorMontantDoitEtreSuperieur;
    case 'DAILY_LIMIT_EXCEEDED':
      return l10n.errorPlafondJournalierAtteintConsultez;
    case 'WEEKLY_LIMIT_EXCEEDED':
      return l10n.errorPlafondHebdomadaireAtteintConsultez;
    case 'MONTHLY_LIMIT_EXCEEDED':
      return l10n.errorPlafondMensuelAtteintConsultez;
    case 'TRANSACTION_COUNT_LIMIT_EXCEEDED':
      return l10n.errorNombreMaximalOperationsAtteint;
    case 'ACCOUNT_FROZEN':
    case 'ACCOUNT_SUSPENDED':
    case 'ACCOUNT_CLOSED':
      return l10n.errorCompteIndisponibleContactezBack;
    case 'CONFIG_LIMIT_PROFILE_NOT_FOUND':
    case 'CONFIG_RULE_INACTIVE':
      return l10n.errorServiceTemporairementIndisponibleReessayez;
    case 'APPROVAL_REQUIRED':
      return l10n.errorMontantSoumisApprobationBack;
    case 'CASH_IN_NOT_ALLOWED':
      return l10n.errorVousNEtesPas;
    case 'CASH_OUT_NOT_ALLOWED':
      return l10n.errorRetraitMarchandNonAutorise;
    case 'CARD_SALE_NOT_ALLOWED':
      return l10n.errorVousNEtesPas2;
    case 'DUPLICATE_IDEMPOTENCY_KEY':
      return l10n.errorOperationDejaCoursTraitement;
    case 'CONCURRENT_MODIFICATION':
      return l10n.errorDonneesOntChangeEntre;

    // ── Lookup / not found ─────────────────────────────────────────────────
    case 'CUSTOMER_NOT_FOUND':
      return l10n.errorNumeroNeCorrespondAucun;
    case 'MERCHANT_NOT_FOUND':
      return l10n.errorNumeroNeCorrespondAucun2;
    case 'CARD_NOT_FOUND':
      return l10n.errorCarteIntrouvableCetUid;
    case 'TRANSACTION_NOT_FOUND':
      return l10n.commonTransactionIntrouvable;
    case 'ACTOR_NOT_FOUND':
    case 'ACCOUNT_NOT_FOUND':
    case 'NOT_FOUND':
      return l10n.errorIntrouvable;

    // ── Enrollment / KYC ───────────────────────────────────────────────────
    case 'PHONE_ALREADY_IN_USE':
      return l10n.errorNumeroTelephoneDejaUtilise;
    case 'NATIONAL_ID_ALREADY_IN_USE':
      return l10n.errorNumeroPieceIdentiteDeja;

    // ── Cards / stock ──────────────────────────────────────────────────────
    case 'CARD_STOCK_NOT_FOUND':
      return l10n.errorStockCartesIntrouvable;
    case 'CARD_STOCK_WRONG_STATUS':
      return l10n.errorCarteNPasDisponible;
    case 'CARD_STOCK_NOT_ASSIGNED_TO_AGENT':
      return l10n.errorCarteNeVousPas;
    case 'CARD_NOT_ACTIVE':
      return l10n.errorCarteRemplacerNPas;
    case 'CARD_INVALID_TRANSITION':
      return l10n.errorOperationNPasPossible;

    // ── Validation / transport ─────────────────────────────────────────────
    case 'VALIDATION_FIELD_REQUIRED':
    case 'VALIDATION_ERROR':
    case 'VALIDATION_INVALID_FORMAT':
      return l10n.errorDonneesInvalidesVerifiezChamps;
    case 'NETWORK_ERROR':
      return e.message ?? l10n.errorConnexionImpossibleVerifiezReseau;
    default:
      // Backend messages are technical English: never shown. The correlation
      // id helps support find the request.
      final ref = e.correlationId;
      return ref == null
          ? l10n.errorErreurSurvenueReessayez
          : l10n.errorErreurSurvenueReessayezRef(ref);
  }
}

/// The text of any failure caught by a controller: the translated code of
/// an [ApiError] (with its correlation id for support), else a generic text.
String errorMessage(Object error) => error is ApiError
    ? apiErrorMessage(error)
    : l10n.errorErreurSurvenueReessayez;
