// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'merchant_lookup_response.dart';

part 'api_response_merchant_lookup_response.g.dart';

@JsonSerializable()
class ApiResponseMerchantLookupResponse {
  const ApiResponseMerchantLookupResponse({this.data, this.timestamp});

  factory ApiResponseMerchantLookupResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseMerchantLookupResponseFromJson(json);

  final MerchantLookupResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseMerchantLookupResponseToJson(this);
}
