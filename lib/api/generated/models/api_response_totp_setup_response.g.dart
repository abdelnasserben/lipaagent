// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_totp_setup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseTotpSetupResponse _$ApiResponseTotpSetupResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseTotpSetupResponse(
  data: json['data'] == null
      ? null
      : TotpSetupResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseTotpSetupResponseToJson(
  ApiResponseTotpSetupResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
