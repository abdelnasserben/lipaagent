// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentBalanceResponse _$ApiResponseAgentBalanceResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseAgentBalanceResponse(
  data: json['data'] == null
      ? null
      : AgentBalanceResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseAgentBalanceResponseToJson(
  ApiResponseAgentBalanceResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
