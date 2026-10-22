// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_card_sale_response.dart';

part 'api_response_agent_card_sale_response.g.dart';

@JsonSerializable()
class ApiResponseAgentCardSaleResponse {
  const ApiResponseAgentCardSaleResponse({this.data, this.timestamp});

  factory ApiResponseAgentCardSaleResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseAgentCardSaleResponseFromJson(json);

  final AgentCardSaleResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentCardSaleResponseToJson(this);
}
