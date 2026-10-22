// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'enroll_customer_response.dart';

part 'api_response_enroll_customer_response.g.dart';

@JsonSerializable()
class ApiResponseEnrollCustomerResponse {
  const ApiResponseEnrollCustomerResponse({this.data, this.timestamp});

  factory ApiResponseEnrollCustomerResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseEnrollCustomerResponseFromJson(json);

  final EnrollCustomerResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseEnrollCustomerResponseToJson(this);
}
