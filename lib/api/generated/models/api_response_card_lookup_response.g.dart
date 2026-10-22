// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_card_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseCardLookupResponse _$ApiResponseCardLookupResponseFromJson(
  Map<String, dynamic> json,
) => ApiResponseCardLookupResponse(
  data: json['data'] == null
      ? null
      : CardLookupResponse.fromJson(json['data'] as Map<String, dynamic>),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ApiResponseCardLookupResponseToJson(
  ApiResponseCardLookupResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
};
