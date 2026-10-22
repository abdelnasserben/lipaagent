// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'totp_setup_response.g.dart';

@JsonSerializable()
class TotpSetupResponse {
  const TotpSetupResponse({this.secret, this.qrUri});

  factory TotpSetupResponse.fromJson(Map<String, Object?> json) =>
      _$TotpSetupResponseFromJson(json);

  final String? secret;
  final String? qrUri;

  Map<String, Object?> toJson() => _$TotpSetupResponseToJson(this);
}
