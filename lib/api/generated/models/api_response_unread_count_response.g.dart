// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_unread_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseUnreadCountResponse _$ApiResponseUnreadCountResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseUnreadCountResponse(
  data: json['data'] == null
      ? null
      : UnreadCountResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseUnreadCountResponseToJson(
  ApiResponseUnreadCountResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
