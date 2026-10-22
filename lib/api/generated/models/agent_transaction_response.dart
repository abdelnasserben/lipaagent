// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_transaction_response.g.dart';

@JsonSerializable()
class AgentTransactionResponse {
  const AgentTransactionResponse({
    this.id,
    this.type,
    this.status,
    this.initiatorType,
    this.initiatorId,
    this.requestedAmount,
    this.feeAmount,
    this.commissionAmount,
    this.netAmountToDestination,
    this.balanceChange,
    this.currency,
    this.details,
    this.declineReason,
    this.correlationId,
    this.createdAt,
    this.completedAt,
    this.declinedAt,
  });

  factory AgentTransactionResponse.fromJson(Map<String, Object?> json) =>
      _$AgentTransactionResponseFromJson(json);

  final String? id;
  final String? type;
  final String? status;
  final String? initiatorType;
  final String? initiatorId;
  final int? requestedAmount;
  final int? feeAmount;
  final int? commissionAmount;
  final int? netAmountToDestination;
  final int? balanceChange;
  final String? currency;
  final Map<String, dynamic>? details;
  final String? declineReason;
  final String? correlationId;
  final DateTime? createdAt;
  final DateTime? completedAt;
  final DateTime? declinedAt;

  Map<String, Object?> toJson() => _$AgentTransactionResponseToJson(this);
}
