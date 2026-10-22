// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollCustomerRequest _$EnrollCustomerRequestFromJson(
  Map<String, dynamic> json,
) => EnrollCustomerRequest(
  fullName: json['fullName'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  phoneCountryCode: json['phoneCountryCode'] as String,
  phoneNumber: json['phoneNumber'] as String,
  nationalIdNumber: json['nationalIdNumber'] as String,
  nationalIdType: json['nationalIdType'] as String,
  addressIsland: json['addressIsland'] as String?,
  addressCity: json['addressCity'] as String?,
  addressDistrict: json['addressDistrict'] as String?,
);

Map<String, dynamic> _$EnrollCustomerRequestToJson(
  EnrollCustomerRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNumber': instance.phoneNumber,
  'nationalIdNumber': instance.nationalIdNumber,
  'nationalIdType': instance.nationalIdType,
  'addressIsland': instance.addressIsland,
  'addressCity': instance.addressCity,
  'addressDistrict': instance.addressDistrict,
};
