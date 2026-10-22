// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_card_stock_view.dart';
import 'pagination.dart';

part 'paged_response_agent_card_stock_view.g.dart';

@JsonSerializable()
class PagedResponseAgentCardStockView {
  const PagedResponseAgentCardStockView({this.data, this.pagination});

  factory PagedResponseAgentCardStockView.fromJson(Map<String, Object?> json) =>
      _$PagedResponseAgentCardStockViewFromJson(json);

  final List<AgentCardStockView>? data;
  final Pagination? pagination;

  Map<String, Object?> toJson() =>
      _$PagedResponseAgentCardStockViewToJson(this);
}
