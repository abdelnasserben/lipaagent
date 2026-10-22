// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'unread_count_response.g.dart';

@JsonSerializable()
class UnreadCountResponse {
  const UnreadCountResponse({this.unread});

  factory UnreadCountResponse.fromJson(Map<String, Object?> json) =>
      _$UnreadCountResponseFromJson(json);

  final int? unread;

  Map<String, Object?> toJson() => _$UnreadCountResponseToJson(this);
}
