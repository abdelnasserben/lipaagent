// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_merchant_cash_out_response.dart';

part 'api_response_agent_merchant_cash_out_response.g.dart';

@JsonSerializable()
class ApiResponseAgentMerchantCashOutResponse {
  const ApiResponseAgentMerchantCashOutResponse({this.data, this.timestamp});

  factory ApiResponseAgentMerchantCashOutResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseAgentMerchantCashOutResponseFromJson(json);

  final AgentMerchantCashOutResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseAgentMerchantCashOutResponseToJson(this);
}
