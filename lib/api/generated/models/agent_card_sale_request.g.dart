// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_card_sale_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCardSaleRequest _$AgentCardSaleRequestFromJson(
  Map<String, dynamic> json,
) => AgentCardSaleRequest(
  customerId: json['customerId'] as String,
  nfcUid: json['nfcUid'] as String,
  cardPrice: (json['cardPrice'] as num).toInt(),
);

Map<String, dynamic> _$AgentCardSaleRequestToJson(
  AgentCardSaleRequest instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'nfcUid': instance.nfcUid,
  'cardPrice': instance.cardPrice,
};
