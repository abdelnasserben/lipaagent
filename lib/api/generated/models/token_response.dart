// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  const TokenResponse({
    this.tokenType,
    this.accessToken,
    this.accessTokenExpiresAt,
    this.refreshToken,
    this.refreshTokenExpiresAt,
  });

  factory TokenResponse.fromJson(Map<String, Object?> json) =>
      _$TokenResponseFromJson(json);

  final String? tokenType;
  final String? accessToken;
  final DateTime? accessTokenExpiresAt;
  final String? refreshToken;
  final DateTime? refreshTokenExpiresAt;

  Map<String, Object?> toJson() => _$TokenResponseToJson(this);
}
