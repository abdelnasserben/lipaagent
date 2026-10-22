// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_card_replacement_response_status.dart';

part 'agent_card_replacement_response.g.dart';

@JsonSerializable()
class AgentCardReplacementResponse {
  const AgentCardReplacementResponse({
    this.transactionId,
    this.status,
    this.newCardId,
    this.oldCardId,
    this.customerId,
    this.replacementFee,
    this.commissionAmount,
    this.completedAt,
    this.replayed,
  });

  factory AgentCardReplacementResponse.fromJson(Map<String, Object?> json) =>
      _$AgentCardReplacementResponseFromJson(json);

  final String? transactionId;
  final AgentCardReplacementResponseStatus? status;
  final String? newCardId;
  final String? oldCardId;
  final String? customerId;
  final int? replacementFee;
  final int? commissionAmount;
  final DateTime? completedAt;
  final bool? replayed;

  Map<String, Object?> toJson() => _$AgentCardReplacementResponseToJson(this);
}
