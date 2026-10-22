// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'change_auth_pin_request.g.dart';

@JsonSerializable()
class ChangeAuthPinRequest {
  const ChangeAuthPinRequest({required this.currentPin, required this.newPin});

  factory ChangeAuthPinRequest.fromJson(Map<String, Object?> json) =>
      _$ChangeAuthPinRequestFromJson(json);

  final String currentPin;
  final String newPin;

  Map<String, Object?> toJson() => _$ChangeAuthPinRequestToJson(this);
}
