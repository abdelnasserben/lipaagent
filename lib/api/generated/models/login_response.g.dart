// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      mfaRequired: json['mfaRequired'] as bool?,
      challengeId: json['challengeId'] as String?,
      mfaFactor: json['mfaFactor'] as String?,
      tokens: json['tokens'] == null
          ? null
          : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      pinSetupRequired: json['pinSetupRequired'] as bool?,
      pinSetupToken: json['pinSetupToken'] as String?,
      pinSetupTokenExpiresAt: json['pinSetupTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['pinSetupTokenExpiresAt'] as String),
    );

Map<String, dynamic> _$LoginResponseToJson(
  LoginResponse instance,
) => <String, dynamic>{
  'mfaRequired': instance.mfaRequired,
  'challengeId': instance.challengeId,
  'mfaFactor': instance.mfaFactor,
  'tokens': instance.tokens,
  'pinSetupRequired': instance.pinSetupRequired,
  'pinSetupToken': instance.pinSetupToken,
  'pinSetupTokenExpiresAt': instance.pinSetupTokenExpiresAt?.toIso8601String(),
};
