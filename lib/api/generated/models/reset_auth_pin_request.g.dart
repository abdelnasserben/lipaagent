// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_auth_pin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetAuthPinRequest _$ResetAuthPinRequestFromJson(Map<String, dynamic> json) =>
    ResetAuthPinRequest(
      phoneCountryCode: json['phoneCountryCode'] as String,
      phoneNumber: json['phoneNumber'] as String,
      totpCode: json['totpCode'] as String,
      newPin: json['newPin'] as String,
    );

Map<String, dynamic> _$ResetAuthPinRequestToJson(
  ResetAuthPinRequest instance,
) => <String, dynamic>{
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNumber': instance.phoneNumber,
  'totpCode': instance.totpCode,
  'newPin': instance.newPin,
};
