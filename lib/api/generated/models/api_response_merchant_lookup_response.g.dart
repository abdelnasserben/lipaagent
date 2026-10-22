// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_merchant_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseMerchantLookupResponse _$ApiResponseMerchantLookupResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseMerchantLookupResponse(
  data: json['data'] == null
      ? null
      : MerchantLookupResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseMerchantLookupResponseToJson(
  ApiResponseMerchantLookupResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
