// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'notification_response_category.dart';
import 'notification_response_code.dart';
import 'notification_response_status.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  const NotificationResponse({
    this.id,
    this.category,
    this.code,
    this.parameters,
    this.status,
    this.createdAt,
    this.readAt,
  });

  factory NotificationResponse.fromJson(Map<String, Object?> json) =>
      _$NotificationResponseFromJson(json);

  final String? id;
  final NotificationResponseCategory? category;
  final NotificationResponseCode? code;
  final Map<String, dynamic>? parameters;
  final NotificationResponseStatus? status;
  final DateTime? createdAt;
  final DateTime? readAt;

  Map<String, Object?> toJson() => _$NotificationResponseToJson(this);
}
