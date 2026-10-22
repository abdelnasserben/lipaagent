// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_cash_response.dart';

part 'api_response_agent_cash_response.g.dart';

@JsonSerializable()
class ApiResponseAgentCashResponse {
  const ApiResponseAgentCashResponse({this.data, this.timestamp});

  factory ApiResponseAgentCashResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseAgentCashResponseFromJson(json);

  final AgentCashResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseAgentCashResponseToJson(this);
}
