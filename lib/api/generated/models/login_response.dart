// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'tokens.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  const LoginResponse({
    this.mfaRequired,
    this.challengeId,
    this.mfaFactor,
    this.tokens,
    this.pinSetupRequired,
    this.pinSetupToken,
    this.pinSetupTokenExpiresAt,
  });

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);

  final bool? mfaRequired;
  final String? challengeId;
  final String? mfaFactor;
  final Tokens? tokens;
  final bool? pinSetupRequired;
  final String? pinSetupToken;
  final DateTime? pinSetupTokenExpiresAt;

  Map<String, Object?> toJson() => _$LoginResponseToJson(this);
}
