// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'card_lookup_response.dart';

part 'api_response_card_lookup_response.g.dart';

@JsonSerializable()
class ApiResponseCardLookupResponse {
  const ApiResponseCardLookupResponse({this.data, this.timestamp});

  factory ApiResponseCardLookupResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseCardLookupResponseFromJson(json);

  final CardLookupResponse? data;
  final DateTime? timestamp;

  Map<String, Object?> toJson() => _$ApiResponseCardLookupResponseToJson(this);
}
