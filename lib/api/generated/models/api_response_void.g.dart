// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_void.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseVoid _$ApiResponseVoidFromJson(Map<String, dynamic> json) =>
    ApiResponseVoid(
      data: json['data'],
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiResponseVoidToJson(ApiResponseVoid instance) =>
    <String, dynamic>{
      'data': instance.data,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
