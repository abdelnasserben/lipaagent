// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseLoginResponse _$ApiResponseLoginResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseLoginResponse(
  data: json['data'] == null
      ? null
      : LoginResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseLoginResponseToJson(
  ApiResponseLoginResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
