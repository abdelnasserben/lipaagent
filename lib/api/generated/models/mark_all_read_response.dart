// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'mark_all_read_response.g.dart';

@JsonSerializable()
class MarkAllReadResponse {
  const MarkAllReadResponse({this.updated});

  factory MarkAllReadResponse.fromJson(Map<String, Object?> json) =>
      _$MarkAllReadResponseFromJson(json);

  final int? updated;

  Map<String, Object?> toJson() => _$MarkAllReadResponseToJson(this);
}
