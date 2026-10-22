// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_merchant_cash_out_response_outcome.dart';

part 'agent_merchant_cash_out_response.g.dart';

@JsonSerializable()
class AgentMerchantCashOutResponse {
  const AgentMerchantCashOutResponse({
    this.outcome,
    this.transactionId,
    this.status,
    this.approvalId,
    this.requestedAmount,
    this.matchedThresholdAmount,
    this.feeAmount,
    this.commissionAmount,
    this.netAmountToDestination,
    this.currency,
    this.completedAt,
    this.replayed,
  });

  factory AgentMerchantCashOutResponse.fromJson(Map<String, Object?> json) =>
      _$AgentMerchantCashOutResponseFromJson(json);

  final AgentMerchantCashOutResponseOutcome? outcome;
  final String? transactionId;
  final String? status;
  final String? approvalId;
  final int? requestedAmount;
  final int? matchedThresholdAmount;
  final int? feeAmount;
  final int? commissionAmount;
  final int? netAmountToDestination;
  final String? currency;
  final DateTime? completedAt;
  final bool? replayed;

  Map<String, Object?> toJson() => _$AgentMerchantCashOutResponseToJson(this);
}
