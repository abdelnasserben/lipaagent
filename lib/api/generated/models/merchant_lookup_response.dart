// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'merchant_lookup_response_kyc_level.dart';
import 'merchant_lookup_response_status.dart';

part 'merchant_lookup_response.g.dart';

@JsonSerializable()
class MerchantLookupResponse {
  const MerchantLookupResponse({
    this.merchantId,
    this.externalRef,
    this.businessName,
    this.phoneCountryCode,
    this.phoneNumber,
    this.status,
    this.kycLevel,
    this.canCashOut,
  });

  factory MerchantLookupResponse.fromJson(Map<String, Object?> json) =>
      _$MerchantLookupResponseFromJson(json);

  final String? merchantId;
  final String? externalRef;
  final String? businessName;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final MerchantLookupResponseStatus? status;
  final MerchantLookupResponseKycLevel? kycLevel;
  final bool? canCashOut;

  Map<String, Object?> toJson() => _$MerchantLookupResponseToJson(this);
}
