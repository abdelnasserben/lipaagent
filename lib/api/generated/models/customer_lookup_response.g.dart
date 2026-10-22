// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLookupResponse _$CustomerLookupResponseFromJson(
  Map<String, dynamic> json,
) => CustomerLookupResponse(
  customerId: json['customerId'] as String?,
  fullName: json['fullName'] as String?,
  phoneCountryCode: json['phoneCountryCode'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  status: json['status'] == null
      ? null
      : CustomerLookupResponseStatus.fromJson(json['status'] as String),
  kycLevel: json['kycLevel'] == null
      ? null
      : CustomerLookupResponseKycLevel.fromJson(json['kycLevel'] as String),
);

Map<String, dynamic> _$CustomerLookupResponseToJson(
  CustomerLookupResponse instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'fullName': instance.fullName,
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNumber': instance.phoneNumber,
  'status': instance.status,
  'kycLevel': instance.kycLevel,
};
