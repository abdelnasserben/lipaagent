// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_mfa_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyMfaRequest _$VerifyMfaRequestFromJson(Map<String, dynamic> json) =>
    VerifyMfaRequest(
      challengeId: json['challengeId'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyMfaRequestToJson(VerifyMfaRequest instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'code': instance.code,
    };
