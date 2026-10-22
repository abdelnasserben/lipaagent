// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_cash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentCashResponse _$ApiResponseAgentCashResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseAgentCashResponse(
  data: json['data'] == null
      ? null
      : AgentCashResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseAgentCashResponseToJson(
  ApiResponseAgentCashResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
