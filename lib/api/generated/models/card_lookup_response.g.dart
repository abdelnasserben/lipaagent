// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardLookupResponse _$CardLookupResponseFromJson(Map<String, dynamic> json) =>
    CardLookupResponse(
      cardId: json['cardId'] as String?,
      nfcUid: json['nfcUid'] as String?,
      internalCardLast4: json['internalCardLast4'] as String?,
      maskedInternalCardNumber: json['maskedInternalCardNumber'] as String?,
      cardType: json['cardType'] == null
          ? null
          : CardLookupResponseCardType.fromJson(json['cardType'] as String),
      status: json['status'] == null
          ? null
          : CardLookupResponseStatus.fromJson(json['status'] as String),
      customerId: json['customerId'] as String?,
      customerFullName: json['customerFullName'] as String?,
      customerPhoneMasked: json['customerPhoneMasked'] as String?,
      expiresAt: json['expiresAt'] as String?,
    );

Map<String, dynamic> _$CardLookupResponseToJson(CardLookupResponse instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'nfcUid': instance.nfcUid,
      'internalCardLast4': instance.internalCardLast4,
      'maskedInternalCardNumber': instance.maskedInternalCardNumber,
      'cardType': instance.cardType,
      'status': instance.status,
      'customerId': instance.customerId,
      'customerFullName': instance.customerFullName,
      'customerPhoneMasked': instance.customerPhoneMasked,
      'expiresAt': instance.expiresAt,
    };
