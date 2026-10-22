// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_auth_pin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeAuthPinRequest _$ChangeAuthPinRequestFromJson(
  Map<String, dynamic> json,
) => ChangeAuthPinRequest(
  currentPin: json['currentPin'] as String,
  newPin: json['newPin'] as String,
);

Map<String, dynamic> _$ChangeAuthPinRequestToJson(
  ChangeAuthPinRequest instance,
) => <String, dynamic>{
  'currentPin': instance.currentPin,
  'newPin': instance.newPin,
};
