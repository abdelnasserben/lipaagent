// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_enroll_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseEnrollCustomerResponse _$ApiResponseEnrollCustomerResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseEnrollCustomerResponse(
  data: json['data'] == null
      ? null
      : EnrollCustomerResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseEnrollCustomerResponseToJson(
  ApiResponseEnrollCustomerResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
