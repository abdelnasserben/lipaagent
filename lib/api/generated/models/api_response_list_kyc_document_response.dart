// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'kyc_document_response.dart';

part 'api_response_list_kyc_document_response.g.dart';

@JsonSerializable()
class ApiResponseListKycDocumentResponse {
  const ApiResponseListKycDocumentResponse({this.data, this.timestamp});

  factory ApiResponseListKycDocumentResponse.fromJson(
    Map<String, Object?> json,
  ) => _$ApiResponseListKycDocumentResponseFromJson(json);

  final List<KycDocumentResponse>? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() =>
      _$ApiResponseListKycDocumentResponseToJson(this);
}
