// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_card_sale_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCardSaleResponse _$AgentCardSaleResponseFromJson(
  Map<String, dynamic> json,
) => AgentCardSaleResponse(
  transactionId: json['transactionId'] as String?,
  status: json['status'] == null
      ? null
      : AgentCardSaleResponseStatus.fromJson(json['status'] as String),
  cardId: json['cardId'] as String?,
  customerId: json['customerId'] as String?,
  cardPrice: (json['cardPrice'] as num?)?.toInt(),
  commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  replayed: json['replayed'] as bool?,
);

Map<String, dynamic> _$AgentCardSaleResponseToJson(
  AgentCardSaleResponse instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'status': instance.status,
  'cardId': instance.cardId,
  'customerId': instance.customerId,
  'cardPrice': instance.cardPrice,
  'commissionAmount': instance.commissionAmount,
  'completedAt': instance.completedAt?.toIso8601String(),
  'replayed': instance.replayed,
};
