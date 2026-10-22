// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'enroll_customer_response.g.dart';

@JsonSerializable()
class EnrollCustomerResponse {
  const EnrollCustomerResponse({
    this.customerId,
    this.externalRef,
    this.accountId,
  });

  factory EnrollCustomerResponse.fromJson(Map<String, Object?> json) =>
      _$EnrollCustomerResponseFromJson(json);

  final String? customerId;
  final String? externalRef;
  final String? accountId;

  Map<String, Object?> toJson() => _$EnrollCustomerResponseToJson(this);
}
