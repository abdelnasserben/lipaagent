// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_card_sale_request.g.dart';

@JsonSerializable()
class AgentCardSaleRequest {
  const AgentCardSaleRequest({
    required this.customerId,
    required this.nfcUid,
    required this.cardPrice,
  });

  factory AgentCardSaleRequest.fromJson(Map<String, Object?> json) =>
      _$AgentCardSaleRequestFromJson(json);

  final String customerId;
  final String nfcUid;
  final int cardPrice;

  Map<String, Object?> toJson() => _$AgentCardSaleRequestToJson(this);
}
