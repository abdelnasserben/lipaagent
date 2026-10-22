// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentProfileResponse _$ApiResponseAgentProfileResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseAgentProfileResponse(
  data: json['data'] == null
      ? null
      : AgentProfileResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseAgentProfileResponseToJson(
  ApiResponseAgentProfileResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
