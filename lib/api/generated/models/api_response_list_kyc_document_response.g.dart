// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_list_kyc_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseListKycDocumentResponse _$ApiResponseListKycDocumentResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseListKycDocumentResponse(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => KycDocumentResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseListKycDocumentResponseToJson(
  ApiResponseListKycDocumentResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
