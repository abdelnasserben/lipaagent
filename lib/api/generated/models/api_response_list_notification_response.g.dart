// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_list_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseListNotificationResponse
_$ApiResponseListNotificationResponseFromJson(Map<String, dynamic> json) =>
    ApiResponseListNotificationResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiResponseListNotificationResponseToJson(
  ApiResponseListNotificationResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
