// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'token_response.dart';

part 'api_response_token_response.g.dart';

@JsonSerializable()
class ApiResponseTokenResponse {
  const ApiResponseTokenResponse({this.data, this.timestamp});

  factory ApiResponseTokenResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseTokenResponseFromJson(json);

  final TokenResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseTokenResponseToJson(this);
}
