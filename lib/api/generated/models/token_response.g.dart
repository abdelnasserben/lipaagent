// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      tokenType: json['tokenType'] as String?,
      accessToken: json['accessToken'] as String?,
      accessTokenExpiresAt: json['accessTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['accessTokenExpiresAt'] as String),
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiresAt: json['refreshTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['refreshTokenExpiresAt'] as String),
    );

Map<String, dynamic> _$TokenResponseToJson(
  TokenResponse instance,
) => <String, dynamic>{
  'tokenType': instance.tokenType,
  'accessToken': instance.accessToken,
  'accessTokenExpiresAt': instance.accessTokenExpiresAt?.toIso8601String(),
  'refreshToken': instance.refreshToken,
  'refreshTokenExpiresAt': instance.refreshTokenExpiresAt?.toIso8601String(),
};
