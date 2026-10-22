// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantLookupResponse _$MerchantLookupResponseFromJson(
  Map<String, dynamic> json,
) => MerchantLookupResponse(
  merchantId: json['merchantId'] as String?,
  externalRef: json['externalRef'] as String?,
  businessName: json['businessName'] as String?,
  phoneCountryCode: json['phoneCountryCode'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  status: json['status'] == null
      ? null
      : MerchantLookupResponseStatus.fromJson(json['status'] as String),
  kycLevel: json['kycLevel'] == null
      ? null
      : MerchantLookupResponseKycLevel.fromJson(json['kycLevel'] as String),
  canCashOut: json['canCashOut'] as bool?,
);

Map<String, dynamic> _$MerchantLookupResponseToJson(
  MerchantLookupResponse instance,
) => <String, dynamic>{
  'merchantId': instance.merchantId,
  'externalRef': instance.externalRef,
  'businessName': instance.businessName,
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNumber': instance.phoneNumber,
  'status': instance.status,
  'kycLevel': instance.kycLevel,
  'canCashOut': instance.canCashOut,
};
