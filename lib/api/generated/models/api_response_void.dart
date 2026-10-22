// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'api_response_void.g.dart';

@JsonSerializable()
class ApiResponseVoid {
  const ApiResponseVoid({this.data, this.timestamp});

  factory ApiResponseVoid.fromJson(Map<String, Object?> json) =>
      _$ApiResponseVoidFromJson(json);

  final dynamic data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseVoidToJson(this);
}
