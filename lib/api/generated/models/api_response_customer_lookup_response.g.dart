// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_customer_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseCustomerLookupResponse _$ApiResponseCustomerLookupResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseCustomerLookupResponse(
  data: json['data'] == null
      ? null
      : CustomerLookupResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseCustomerLookupResponseToJson(
  ApiResponseCustomerLookupResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
