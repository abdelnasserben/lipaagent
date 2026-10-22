// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_card_replacement_response.dart';

part 'api_response_agent_card_replacement_response.g.dart';

@JsonSerializable()
class ApiResponseAgentCardReplacementResponse {
  const ApiResponseAgentCardReplacementResponse({this.data, this.timestamp});

  factory ApiResponseAgentCardReplacementResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseAgentCardReplacementResponseFromJson(json);

  final AgentCardReplacementResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentCardReplacementResponseToJson(this);
}
