// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_transaction_response.dart';

part 'api_response_agent_transaction_response.g.dart';

@JsonSerializable()
class ApiResponseAgentTransactionResponse {
  const ApiResponseAgentTransactionResponse({this.data, this.timestamp});

  factory ApiResponseAgentTransactionResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseAgentTransactionResponseFromJson(json);

  final AgentTransactionResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentTransactionResponseToJson(this);
}
