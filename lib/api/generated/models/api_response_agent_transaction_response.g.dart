// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentTransactionResponse
_$ApiResponseAgentTransactionResponseFromJson(Map<String, dynamic> json) =>
    ApiResponseAgentTransactionResponse(
      data: json['data'] == null
          ? null
          : AgentTransactionResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiResponseAgentTransactionResponseToJson(
  ApiResponseAgentTransactionResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
