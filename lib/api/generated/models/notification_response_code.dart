// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NotificationResponseCode {
  @JsonValue('P2P_TRANSFER_SENT')
  p2pTransferSent('P2P_TRANSFER_SENT'),
  @JsonValue('P2P_TRANSFER_RECEIVED')
  p2pTransferReceived('P2P_TRANSFER_RECEIVED'),
  @JsonValue('MERCHANT_PAYMENT_SENT')
  merchantPaymentSent('MERCHANT_PAYMENT_SENT'),
  @JsonValue('MERCHANT_PAYMENT_RECEIVED')
  merchantPaymentReceived('MERCHANT_PAYMENT_RECEIVED'),
  @JsonValue('CASH_IN_CREDITED')
  cashInCredited('CASH_IN_CREDITED'),
  @JsonValue('MERCHANT_CASH_OUT_COMPLETED')
  merchantCashOutCompleted('MERCHANT_CASH_OUT_COMPLETED'),
  @JsonValue('MERCHANT_TRANSFER_SENT')
  merchantTransferSent('MERCHANT_TRANSFER_SENT'),
  @JsonValue('MERCHANT_TRANSFER_RECEIVED')
  merchantTransferReceived('MERCHANT_TRANSFER_RECEIVED'),
  @JsonValue('BILL_PAYMENT_QUEUED')
  billPaymentQueued('BILL_PAYMENT_QUEUED'),
  @JsonValue('BILL_PAYMENT_TO_PROCESS')
  billPaymentToProcess('BILL_PAYMENT_TO_PROCESS'),
  @JsonValue('BILL_PAYMENT_SUCCEEDED')
  billPaymentSucceeded('BILL_PAYMENT_SUCCEEDED'),
  @JsonValue('BILL_PAYMENT_REFUNDED')
  billPaymentRefunded('BILL_PAYMENT_REFUNDED'),
  @JsonValue('BILL_PAYMENT_EXPIRED')
  billPaymentExpired('BILL_PAYMENT_EXPIRED'),
  @JsonValue('BILL_PAYMENT_CANCELLED')
  billPaymentCancelled('BILL_PAYMENT_CANCELLED'),
  @JsonValue('APPROVAL_PENDING')
  approvalPending('APPROVAL_PENDING'),
  @JsonValue('APPROVAL_APPROVED')
  approvalApproved('APPROVAL_APPROVED'),
  @JsonValue('APPROVAL_REJECTED')
  approvalRejected('APPROVAL_REJECTED'),
  @JsonValue('RECONCILIATION_INCIDENT_OPENED')
  reconciliationIncidentOpened('RECONCILIATION_INCIDENT_OPENED'),
  @JsonValue('BILL_REMINDER_DUE')
  billReminderDue('BILL_REMINDER_DUE'),

  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const NotificationResponseCode(this.json);

  factory NotificationResponseCode.fromJson(String json) =>
      values.firstWhere((e) => e.json == json, orElse: () => $unknown);

  final String? json;
  String toJson() {
    final value = json;
    if (value == null) {
      throw StateError(
        'Cannot convert enum value with null JSON representation to String. '
        'This usually happens for \$unknown or @JsonValue(null) entries.',
      );
    }
    return value as String;
  }

  @override
  String toString() => json?.toString() ?? super.toString();

  /// Returns all defined enum values excluding the $unknown value.
  static List<NotificationResponseCode> get $valuesDefined =>
      values.where((value) => value != $unknown).toList();
}
