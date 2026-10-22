// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'totp_setup_response.dart';

part 'api_response_totp_setup_response.g.dart';

@JsonSerializable()
class ApiResponseTotpSetupResponse {
  const ApiResponseTotpSetupResponse({this.data, this.timestamp});

  factory ApiResponseTotpSetupResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseTotpSetupResponseFromJson(json);

  final TotpSetupResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseTotpSetupResponseToJson(this);
}
