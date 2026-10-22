// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseTokenResponse _$ApiResponseTokenResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseTokenResponse(
  data: json['data'] == null
      ? null
      : TokenResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseTokenResponseToJson(
  ApiResponseTokenResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
