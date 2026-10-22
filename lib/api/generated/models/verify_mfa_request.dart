// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'verify_mfa_request.g.dart';

@JsonSerializable()
class VerifyMfaRequest {
  const VerifyMfaRequest({required this.challengeId, required this.code});

  factory VerifyMfaRequest.fromJson(Map<String, Object?> json) =>
      _$VerifyMfaRequestFromJson(json);

  final String challengeId;
  final String code;

  Map<String, Object?> toJson() => _$VerifyMfaRequestToJson(this);
}
