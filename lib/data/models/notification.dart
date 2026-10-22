import '../../core/utils/formatters.dart';
import 'enums.dart';

/// `NotificationResponse`: a `code`, a `category` and `parameters`, no text.
/// The app owns the wording; unknown codes get a generic title.
///
/// Agents receive no notification today (backend guide), but the inbox is
/// wired so it lights up when agent notifications are added.
class AppNotification {
  const AppNotification({
    required this.id,
    required this.category,
    required this.code,
    required this.parameters,
    required this.status,
    this.createdAt,
    this.readAt,
  });

  final String id;
  final String category;
  final String code;
  final Map<String, dynamic> parameters;
  final NotificationStatus status;
  final DateTime? createdAt;
  final DateTime? readAt;

  bool get isUnread => status.isUnread;

  /// French title for the known codes, a generic one otherwise.
  String get title => switch (code) {
    'CASH_IN_CREDITED' => 'Dépôt crédité',
    'MERCHANT_CASH_OUT_COMPLETED' => 'Retrait marchand effectué',
    _ => 'Notification',
  };

  /// French detail line built from the parameters (empty when there is none).
  String get body {
    final amount = parameters['amount'];
    if (amount is num) return fmtKmf(amount.toInt());
    return '';
  }

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      AppNotification(
        id: (json['id'] ?? '') as String,
        category: (json['category'] ?? '') as String,
        code: (json['code'] ?? '') as String,
        parameters: json['parameters'] is Map<String, dynamic>
            ? json['parameters'] as Map<String, dynamic>
            : const {},
        status: NotificationStatus.parse(json['status'] as String?),
        createdAt: tryParseInstant(json['createdAt']),
        readAt: tryParseInstant(json['readAt']),
      );
}
