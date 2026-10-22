// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_balance_response.g.dart';

@JsonSerializable()
class AgentBalanceResponse {
  const AgentBalanceResponse({
    this.accountId,
    this.availableBalance,
    this.heldBalance,
    this.currency,
    this.accountStatus,
    this.updatedAt,
  });

  factory AgentBalanceResponse.fromJson(Map<String, Object?> json) =>
      _$AgentBalanceResponseFromJson(json);

  final String? accountId;
  final int? availableBalance;
  final int? heldBalance;
  final String? currency;
  final String? accountStatus;
  final DateTime? updatedAt;

  Map<String, Object?> toJson() => _$AgentBalanceResponseToJson(this);
}
