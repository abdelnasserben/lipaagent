// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'reset_auth_pin_request.g.dart';

@JsonSerializable()
class ResetAuthPinRequest {
  const ResetAuthPinRequest({
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.totpCode,
    required this.newPin,
  });

  factory ResetAuthPinRequest.fromJson(Map<String, Object?> json) =>
      _$ResetAuthPinRequestFromJson(json);

  final String phoneCountryCode;
  final String phoneNumber;
  final String totpCode;
  final String newPin;

  Map<String, Object?> toJson() => _$ResetAuthPinRequestToJson(this);
}
