// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_daily_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentDailySummaryResponse
_$ApiResponseAgentDailySummaryResponseFromJson(Map<String, dynamic> json) =>
    ApiResponseAgentDailySummaryResponse(
      data: json['data'] == null
          ? null
          : AgentDailySummaryResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiResponseAgentDailySummaryResponseToJson(
  ApiResponseAgentDailySummaryResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
