// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_kyc_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseKycDocumentResponse _$ApiResponseKycDocumentResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseKycDocumentResponse(
  data: json['data'] == null
      ? null
      : KycDocumentResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseKycDocumentResponseToJson(
  ApiResponseKycDocumentResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
