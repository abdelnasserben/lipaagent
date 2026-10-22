// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_card_sale_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentCardSaleResponse _$ApiResponseAgentCardSaleResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseAgentCardSaleResponse(
  data: json['data'] == null
      ? null
      : AgentCardSaleResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseAgentCardSaleResponseToJson(
  ApiResponseAgentCardSaleResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
