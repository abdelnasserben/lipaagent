// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_mark_all_read_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseMarkAllReadResponse _$ApiResponseMarkAllReadResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseMarkAllReadResponse(
  data: json['data'] == null
      ? null
      : MarkAllReadResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseMarkAllReadResponseToJson(
  ApiResponseMarkAllReadResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
