// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'card_lookup_response_card_type.dart';
import 'card_lookup_response_status.dart';

part 'card_lookup_response.g.dart';

@JsonSerializable()
class CardLookupResponse {
  const CardLookupResponse({
    this.cardId,
    this.nfcUid,
    this.internalCardLast4,
    this.maskedInternalCardNumber,
    this.cardType,
    this.status,
    this.customerId,
    this.customerFullName,
    this.customerPhoneMasked,
    this.expiresAt,
  });

  factory CardLookupResponse.fromJson(Map<String, Object?> json) =>
      _$CardLookupResponseFromJson(json);

  final String? cardId;
  final String? nfcUid;
  final String? internalCardLast4;
  final String? maskedInternalCardNumber;
  final CardLookupResponseCardType? cardType;
  final CardLookupResponseStatus? status;
  final String? customerId;
  final String? customerFullName;
  final String? customerPhoneMasked;
  final String? expiresAt;

  Map<String, Object?> toJson() => _$CardLookupResponseToJson(this);
}
