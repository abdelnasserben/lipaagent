// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'enroll_customer_request.g.dart';

@JsonSerializable()
class EnrollCustomerRequest {
  const EnrollCustomerRequest({
    required this.fullName,
    required this.dateOfBirth,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.nationalIdNumber,
    required this.nationalIdType,
    this.addressIsland,
    this.addressCity,
    this.addressDistrict,
  });

  factory EnrollCustomerRequest.fromJson(Map<String, Object?> json) =>
      _$EnrollCustomerRequestFromJson(json);

  final String fullName;
  final String dateOfBirth;
  final String phoneCountryCode;
  final String phoneNumber;
  final String nationalIdNumber;
  final String nationalIdType;
  final String? addressIsland;
  final String? addressCity;
  final String? addressDistrict;

  Map<String, Object?> toJson() => _$EnrollCustomerRequestToJson(this);
}
