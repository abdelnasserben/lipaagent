// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_balance_response.dart';

part 'api_response_agent_balance_response.g.dart';

@JsonSerializable()
class ApiResponseAgentBalanceResponse {
  const ApiResponseAgentBalanceResponse({this.data, this.timestamp});

  factory ApiResponseAgentBalanceResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseAgentBalanceResponseFromJson(json);

  final AgentBalanceResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentBalanceResponseToJson(this);
}
