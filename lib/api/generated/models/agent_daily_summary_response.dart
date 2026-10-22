// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_daily_summary_response.g.dart';

@JsonSerializable()
class AgentDailySummaryResponse {
  const AgentDailySummaryResponse({
    this.agentId,
    this.periodStart,
    this.periodEnd,
    this.totalCompletedAmountToday,
    this.totalCompletedCountToday,
    this.commissionEarnedToday,
    this.currentBalance,
    this.floatAlertThreshold,
    this.belowFloatAlert,
  });

  factory AgentDailySummaryResponse.fromJson(Map<String, Object?> json) =>
      _$AgentDailySummaryResponseFromJson(json);

  final String? agentId;
  final DateTime? periodStart;
  final DateTime? periodEnd;
  final int? totalCompletedAmountToday;
  final int? totalCompletedCountToday;
  final int? commissionEarnedToday;
  final int? currentBalance;
  final int? floatAlertThreshold;
  final bool? belowFloatAlert;

  Map<String, Object?> toJson() => _$AgentDailySummaryResponseToJson(this);
}
