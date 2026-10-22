// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_profile_response.dart';

part 'api_response_agent_profile_response.g.dart';

@JsonSerializable()
class ApiResponseAgentProfileResponse {
  const ApiResponseAgentProfileResponse({this.data, this.timestamp});

  factory ApiResponseAgentProfileResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseAgentProfileResponseFromJson(json);

  final AgentProfileResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentProfileResponseToJson(this);
}
