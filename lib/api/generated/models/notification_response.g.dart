// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => NotificationResponse(
  id: json['id'] as String?,
  category: json['category'] == null
      ? null
      : NotificationResponseCategory.fromJson(json['category'] as String),
  code: json['code'] == null
      ? null
      : NotificationResponseCode.fromJson(json['code'] as String),
  parameters: json['parameters'] as Map<String, dynamic>?,
  status: json['status'] == null
      ? null
      : NotificationResponseStatus.fromJson(json['status'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  readAt: json['readAt'] == null
      ? null
      : DateTime.parse(json['readAt'] as String),
);

Map<String, dynamic> _$NotificationResponseToJson(
  NotificationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'code': instance.code,
  'parameters': instance.parameters,
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
  'readAt': instance.readAt?.toIso8601String(),
};
