// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_limits_response.g.dart';

@JsonSerializable()
class AgentLimitsResponse {
  const AgentLimitsResponse({
    this.limitProfileId,
    this.profileName,
    this.maxTransactionAmount,
    this.minTransactionAmount,
    this.maxDailyAmount,
    this.maxWeeklyAmount,
    this.maxMonthlyAmount,
    this.maxDailyTransactionCount,
    this.maxMonthlyTransactionCount,
    this.requiredKycLevel,
  });

  factory AgentLimitsResponse.fromJson(Map<String, Object?> json) =>
      _$AgentLimitsResponseFromJson(json);

  final String? limitProfileId;
  final String? profileName;
  final int? maxTransactionAmount;
  final int? minTransactionAmount;
  final int? maxDailyAmount;
  final int? maxWeeklyAmount;
  final int? maxMonthlyAmount;
  final int? maxDailyTransactionCount;
  final int? maxMonthlyTransactionCount;
  final String? requiredKycLevel;

  Map<String, Object?> toJson() => _$AgentLimitsResponseToJson(this);
}
