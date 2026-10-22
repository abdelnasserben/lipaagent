// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_agent_merchant_cash_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseAgentMerchantCashOutResponse
_$ApiResponseAgentMerchantCashOutResponseFromJson(Map<String, dynamic> json) =>
    ApiResponseAgentMerchantCashOutResponse(
      data: json['data'] == null
          ? null
          : AgentMerchantCashOutResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiResponseAgentMerchantCashOutResponseToJson(
  ApiResponseAgentMerchantCashOutResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
