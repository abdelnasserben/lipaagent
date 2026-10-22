// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_card_sale_response_status.dart';

part 'agent_card_sale_response.g.dart';

@JsonSerializable()
class AgentCardSaleResponse {
  const AgentCardSaleResponse({
    this.transactionId,
    this.status,
    this.cardId,
    this.customerId,
    this.cardPrice,
    this.commissionAmount,
    this.completedAt,
    this.replayed,
  });

  factory AgentCardSaleResponse.fromJson(Map<String, Object?> json) =>
      _$AgentCardSaleResponseFromJson(json);

  final String? transactionId;
  final AgentCardSaleResponseStatus? status;
  final String? cardId;
  final String? customerId;
  final int? cardPrice;
  final int? commissionAmount;
  final DateTime? completedAt;
  final bool? replayed;

  Map<String, Object?> toJson() => _$AgentCardSaleResponseToJson(this);
}
