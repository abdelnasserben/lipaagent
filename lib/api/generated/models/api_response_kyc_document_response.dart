// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'kyc_document_response.dart';

part 'api_response_kyc_document_response.g.dart';

@JsonSerializable()
class ApiResponseKycDocumentResponse {
  const ApiResponseKycDocumentResponse({this.data, this.timestamp});

  factory ApiResponseKycDocumentResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseKycDocumentResponseFromJson(json);

  final KycDocumentResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseKycDocumentResponseToJson(this);
}
