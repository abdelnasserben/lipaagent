// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_cash_response_status.dart';

part 'agent_cash_response.g.dart';

@JsonSerializable()
class AgentCashResponse {
  const AgentCashResponse({
    this.transactionId,
    this.status,
    this.requestedAmount,
    this.feeAmount,
    this.commissionAmount,
    this.netAmountToDestination,
    this.currency,
    this.completedAt,
    this.replayed,
  });

  factory AgentCashResponse.fromJson(Map<String, Object?> json) =>
      _$AgentCashResponseFromJson(json);

  final String? transactionId;
  final AgentCashResponseStatus? status;
  final int? requestedAmount;
  final int? feeAmount;
  final int? commissionAmount;
  final int? netAmountToDestination;
  final String? currency;
  final DateTime? completedAt;
  final bool? replayed;

  Map<String, Object?> toJson() => _$AgentCashResponseToJson(this);
}
