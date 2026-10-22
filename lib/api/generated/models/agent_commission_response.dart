// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_commission_response.g.dart';

@JsonSerializable()
class AgentCommissionResponse {
  const AgentCommissionResponse({
    this.id,
    this.transactionId,
    this.appliedRuleId,
    this.amount,
    this.basisAmount,
    this.currency,
    this.settlementMode,
    this.status,
    this.paidAt,
    this.paymentTransactionId,
    this.createdAt,
  });

  factory AgentCommissionResponse.fromJson(Map<String, Object?> json) =>
      _$AgentCommissionResponseFromJson(json);

  final String? id;
  final String? transactionId;
  final String? appliedRuleId;
  final int? amount;
  final int? basisAmount;
  final String? currency;
  final String? settlementMode;
  final String? status;
  final DateTime? paidAt;
  final String? paymentTransactionId;
  final DateTime? createdAt;

  Map<String, Object?> toJson() => _$AgentCommissionResponseToJson(this);
}
