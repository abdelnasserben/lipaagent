// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_card_stock_view_status.dart';

part 'agent_card_stock_view.g.dart';

@JsonSerializable()
class AgentCardStockView {
  const AgentCardStockView({
    this.id,
    this.nfcUid,
    this.internalCardNumber,
    this.batchRef,
    this.producedAt,
    this.assignedAt,
    this.status,
  });

  factory AgentCardStockView.fromJson(Map<String, Object?> json) =>
      _$AgentCardStockViewFromJson(json);

  final String? id;
  final String? nfcUid;
  final String? internalCardNumber;
  final String? batchRef;
  final String? producedAt;
  final DateTime? assignedAt;
  final AgentCardStockViewStatus? status;

  Map<String, Object?> toJson() => _$AgentCardStockViewToJson(this);
}
