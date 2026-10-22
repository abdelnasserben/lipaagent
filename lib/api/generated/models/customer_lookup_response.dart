// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'customer_lookup_response_kyc_level.dart';
import 'customer_lookup_response_status.dart';

part 'customer_lookup_response.g.dart';

@JsonSerializable()
class CustomerLookupResponse {
  const CustomerLookupResponse({
    this.customerId,
    this.fullName,
    this.phoneCountryCode,
    this.phoneNumber,
    this.status,
    this.kycLevel,
  });

  factory CustomerLookupResponse.fromJson(Map<String, Object?> json) =>
      _$CustomerLookupResponseFromJson(json);

  final String? customerId;
  final String? fullName;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final CustomerLookupResponseStatus? status;
  final CustomerLookupResponseKycLevel? kycLevel;

  Map<String, Object?> toJson() => _$CustomerLookupResponseToJson(this);
}
