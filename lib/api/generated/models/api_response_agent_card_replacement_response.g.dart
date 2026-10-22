// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_card_replacement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentCardReplacementResponse
_$ApiResponseAgentCardReplacementResponseFromJson(Map<String, dynamic> json) =>
    ApiResponseAgentCardReplacementResponse(
      data: json['data'] == null
          ? null
          : AgentCardReplacementResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiResponseAgentCardReplacementResponseToJson(
  ApiResponseAgentCardReplacementResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
