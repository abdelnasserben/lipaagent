// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'mark_all_read_response.dart';

part 'api_response_mark_all_read_response.g.dart';

@JsonSerializable()
class ApiResponseMarkAllReadResponse {
  const ApiResponseMarkAllReadResponse({this.data, this.timestamp});

  factory ApiResponseMarkAllReadResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseMarkAllReadResponseFromJson(json);

  final MarkAllReadResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseMarkAllReadResponseToJson(this);
}
