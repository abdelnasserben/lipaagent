// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_daily_summary_response.dart';

part 'api_response_agent_daily_summary_response.g.dart';

@JsonSerializable()
class ApiResponseAgentDailySummaryResponse {
  const ApiResponseAgentDailySummaryResponse({this.data, this.timestamp});

  factory ApiResponseAgentDailySummaryResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseAgentDailySummaryResponseFromJson(json);

  final AgentDailySummaryResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentDailySummaryResponseToJson(this);
}
