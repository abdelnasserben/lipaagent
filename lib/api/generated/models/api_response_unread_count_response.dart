// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'unread_count_response.dart';

part 'api_response_unread_count_response.g.dart';

@JsonSerializable()
class ApiResponseUnreadCountResponse {
  const ApiResponseUnreadCountResponse({this.data, this.timestamp});

  factory ApiResponseUnreadCountResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseUnreadCountResponseFromJson(json);

  final UnreadCountResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseUnreadCountResponseToJson(this);
}
