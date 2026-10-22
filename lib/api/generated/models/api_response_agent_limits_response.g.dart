// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_limits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentLimitsResponse _$ApiResponseAgentLimitsResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseAgentLimitsResponse(
  data: json['data'] == null
      ? null
      : AgentLimitsResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseAgentLimitsResponseToJson(
  ApiResponseAgentLimitsResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
