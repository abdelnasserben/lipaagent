// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_limits_response.dart';

part 'api_response_agent_limits_response.g.dart';

@JsonSerializable()
class ApiResponseAgentLimitsResponse {
  const ApiResponseAgentLimitsResponse({this.data, this.timestamp});

  factory ApiResponseAgentLimitsResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseAgentLimitsResponseFromJson(json);

  final AgentLimitsResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseAgentLimitsResponseToJson(this);
}
