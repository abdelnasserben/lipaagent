// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_cash_in_request.g.dart';

@JsonSerializable()
class AgentCashInRequest {
  const AgentCashInRequest({required this.customerId, this.amount});

  factory AgentCashInRequest.fromJson(Map<String, Object?> json) =>
      _$AgentCashInRequestFromJson(json);

  final String customerId;
  final int? amount;

  Map<String, Object?> toJson() => _$AgentCashInRequestToJson(this);
}
