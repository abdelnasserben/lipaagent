// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'login_response.dart';

part 'api_response_login_response.g.dart';

@JsonSerializable()
class ApiResponseLoginResponse {
  const ApiResponseLoginResponse({this.data, this.timestamp});

  factory ApiResponseLoginResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseLoginResponseFromJson(json);

  final LoginResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseLoginResponseToJson(this);
}
