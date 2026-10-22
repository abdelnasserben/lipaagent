// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentProfileResponse _$AgentProfileResponseFromJson(
  Map<String, dynamic> json,
) => AgentProfileResponse(
  id: json['id'] as String?,
  externalRef: json['externalRef'] as String?,
  fullName: json['fullName'] as String?,
  phoneCountryCode: json['phoneCountryCode'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  zone: json['zone'] as String?,
  kycLevel: json['kycLevel'] as String?,
  status: json['status'] as String?,
  accountId: json['accountId'] as String?,
  limitProfileId: json['limitProfileId'] as String?,
  canSellCards: json['canSellCards'] as bool?,
  canDoCashIn: json['canDoCashIn'] as bool?,
  canDoCashOut: json['canDoCashOut'] as bool?,
  floatAlertThreshold: (json['floatAlertThreshold'] as num?)?.toInt(),
  contractRef: json['contractRef'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AgentProfileResponseToJson(
  AgentProfileResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'externalRef': instance.externalRef,
  'fullName': instance.fullName,
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNumber': instance.phoneNumber,
  'zone': instance.zone,
  'kycLevel': instance.kycLevel,
  'status': instance.status,
  'accountId': instance.accountId,
  'limitProfileId': instance.limitProfileId,
  'canSellCards': instance.canSellCards,
  'canDoCashIn': instance.canDoCashIn,
  'canDoCashOut': instance.canDoCashOut,
  'floatAlertThreshold': instance.floatAlertThreshold,
  'contractRef': instance.contractRef,
  'createdAt': instance.createdAt?.toIso8601String(),
};
