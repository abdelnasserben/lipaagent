// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'set_auth_pin_request.g.dart';

@JsonSerializable()
class SetAuthPinRequest {
  const SetAuthPinRequest({required this.pin});

  factory SetAuthPinRequest.fromJson(Map<String, Object?> json) =>
      _$SetAuthPinRequestFromJson(json);

  final String pin;

  Map<String, Object?> toJson() => _$SetAuthPinRequestToJson(this);
}
