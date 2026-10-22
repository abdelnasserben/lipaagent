// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollCustomerResponse _$EnrollCustomerResponseFromJson(
  Map<String, dynamic> json,
) => EnrollCustomerResponse(
  customerId: json['customerId'] as String?,
  externalRef: json['externalRef'] as String?,
  accountId: json['accountId'] as String?,
);

Map<String, dynamic> _$EnrollCustomerResponseToJson(
  EnrollCustomerResponse instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'externalRef': instance.externalRef,
  'accountId': instance.accountId,
};
