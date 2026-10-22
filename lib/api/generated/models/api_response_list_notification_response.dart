// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'notification_response.dart';

part 'api_response_list_notification_response.g.dart';

@JsonSerializable()
class ApiResponseListNotificationResponse {
  const ApiResponseListNotificationResponse({this.data, this.timestamp});

  factory ApiResponseListNotificationResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseListNotificationResponseFromJson(json);

  final List<NotificationResponse>? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseListNotificationResponseToJson(this);
}
