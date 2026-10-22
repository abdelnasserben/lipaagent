// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'customer_lookup_response.dart';

part 'api_response_customer_lookup_response.g.dart';

@JsonSerializable()
class ApiResponseCustomerLookupResponse {
  const ApiResponseCustomerLookupResponse({this.data, this.timestamp});

  factory ApiResponseCustomerLookupResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseCustomerLookupResponseFromJson(json);

  final CustomerLookupResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseCustomerLookupResponseToJson(this);
}
