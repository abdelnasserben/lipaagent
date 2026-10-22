// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_daily_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentDailySummaryResponse _$AgentDailySummaryResponseFromJson(
  Map<String, dynamic> json,
) => AgentDailySummaryResponse(
  agentId: json['agentId'] as String?,
  periodStart: json['periodStart'] == null
      ? null
      : DateTime.parse(json['periodStart'] as String),
  periodEnd: json['periodEnd'] == null
      ? null
      : DateTime.parse(json['periodEnd'] as String),
  totalCompletedAmountToday: (json['totalCompletedAmountToday'] as num?)
      ?.toInt(),
  totalCompletedCountToday: (json['totalCompletedCountToday'] as num?)?.toInt(),
  commissionEarnedToday: (json['commissionEarnedToday'] as num?)?.toInt(),
  currentBalance: (json['currentBalance'] as num?)?.toInt(),
  floatAlertThreshold: (json['floatAlertThreshold'] as num?)?.toInt(),
  belowFloatAlert: json['belowFloatAlert'] as bool?,
);

Map<String, dynamic> _$AgentDailySummaryResponseToJson(
  AgentDailySummaryResponse instance,
) => <String, dynamic>{
  'agentId': instance.agentId,
  'periodStart': instance.periodStart?.toIso8601String(),
  'periodEnd': instance.periodEnd?.toIso8601String(),
  'totalCompletedAmountToday': instance.totalCompletedAmountToday,
  'totalCompletedCountToday': instance.totalCompletedCountToday,
  'commissionEarnedToday': instance.commissionEarnedToday,
  'currentBalance': instance.currentBalance,
  'floatAlertThreshold': instance.floatAlertThreshold,
  'belowFloatAlert': instance.belowFloatAlert,
};
