// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_limits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentLimitsResponse _$AgentLimitsResponseFromJson(Map<String, dynamic> json) =>
    AgentLimitsResponse(
      limitProfileId: json['limitProfileId'] as String?,
      profileName: json['profileName'] as String?,
      maxTransactionAmount: (json['maxTransactionAmount'] as num?)?.toInt(),
      minTransactionAmount: (json['minTransactionAmount'] as num?)?.toInt(),
      maxDailyAmount: (json['maxDailyAmount'] as num?)?.toInt(),
      maxWeeklyAmount: (json['maxWeeklyAmount'] as num?)?.toInt(),
      maxMonthlyAmount: (json['maxMonthlyAmount'] as num?)?.toInt(),
      maxDailyTransactionCount: (json['maxDailyTransactionCount'] as num?)
          ?.toInt(),
      maxMonthlyTransactionCount: (json['maxMonthlyTransactionCount'] as num?)
          ?.toInt(),
      requiredKycLevel: json['requiredKycLevel'] as String?,
    );

Map<String, dynamic> _$AgentLimitsResponseToJson(
  AgentLimitsResponse instance,
) => <String, dynamic>{
  'limitProfileId': instance.limitProfileId,
  'profileName': instance.profileName,
  'maxTransactionAmount': instance.maxTransactionAmount,
  'minTransactionAmount': instance.minTransactionAmount,
  'maxDailyAmount': instance.maxDailyAmount,
  'maxWeeklyAmount': instance.maxWeeklyAmount,
  'maxMonthlyAmount': instance.maxMonthlyAmount,
  'maxDailyTransactionCount': instance.maxDailyTransactionCount,
  'maxMonthlyTransactionCount': instance.maxMonthlyTransactionCount,
  'requiredKycLevel': instance.requiredKycLevel,
};
