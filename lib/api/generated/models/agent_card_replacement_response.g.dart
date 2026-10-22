// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_card_replacement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCardReplacementResponse _$AgentCardReplacementResponseFromJson(
  Map<String, dynamic> json,
) => AgentCardReplacementResponse(
  transactionId: json['transactionId'] as String?,
  status: json['status'] == null
      ? null
      : AgentCardReplacementResponseStatus.fromJson(json['status'] as String),
  newCardId: json['newCardId'] as String?,
  oldCardId: json['oldCardId'] as String?,
  customerId: json['customerId'] as String?,
  replacementFee: (json['replacementFee'] as num?)?.toInt(),
  commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  replayed: json['replayed'] as bool?,
);

Map<String, dynamic> _$AgentCardReplacementResponseToJson(
  AgentCardReplacementResponse instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'status': instance.status,
  'newCardId': instance.newCardId,
  'oldCardId': instance.oldCardId,
  'customerId': instance.customerId,
  'replacementFee': instance.replacementFee,
  'commissionAmount': instance.commissionAmount,
  'completedAt': instance.completedAt?.toIso8601String(),
  'replayed': instance.replayed,
};
