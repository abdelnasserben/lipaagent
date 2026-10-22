// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response_agent_card_stock_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedResponseAgentCardStockView _$PagedResponseAgentCardStockViewFromJson(
  Map<String, dynamic> json,
) => PagedResponseAgentCardStockView(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => AgentCardStockView.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PagedResponseAgentCardStockViewToJson(
  PagedResponseAgentCardStockView instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
