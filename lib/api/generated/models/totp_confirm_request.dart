// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'totp_confirm_request.g.dart';

@JsonSerializable()
class TotpConfirmRequest {
  const TotpConfirmRequest({required this.code});

  factory TotpConfirmRequest.fromJson(Map<String, Object?> json) =>
      _$TotpConfirmRequestFromJson(json);

  final String code;

  Map<String, Object?> toJson() => _$TotpConfirmRequestToJson(this);
}
