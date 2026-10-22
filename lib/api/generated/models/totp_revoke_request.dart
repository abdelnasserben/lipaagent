// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'totp_revoke_request.g.dart';

@JsonSerializable()
class TotpRevokeRequest {
  const TotpRevokeRequest({required this.code});

  factory TotpRevokeRequest.fromJson(Map<String, Object?> json) =>
      _$TotpRevokeRequestFromJson(json);

  final String code;

  Map<String, Object?> toJson() => _$TotpRevokeRequestToJson(this);
}
