// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_commission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCommissionResponse _$AgentCommissionResponseFromJson(
  Map<String, dynamic> json,
) => AgentCommissionResponse(
  id: json['id'] as String?,
  transactionId: json['transactionId'] as String?,
  appliedRuleId: json['appliedRuleId'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  basisAmount: (json['basisAmount'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  settlementMode: json['settlementMode'] as String?,
  status: json['status'] as String?,
  paidAt: json['paidAt'] == null
      ? null
      : DateTime.parse(json['paidAt'] as String),
  paymentTransactionId: json['paymentTransactionId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AgentCommissionResponseToJson(
  AgentCommissionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'transactionId': instance.transactionId,
  'appliedRuleId': instance.appliedRuleId,
  'amount': instance.amount,
  'basisAmount': instance.basisAmount,
  'currency': instance.currency,
  'settlementMode': instance.settlementMode,
  'status': instance.status,
  'paidAt': instance.paidAt?.toIso8601String(),
  'paymentTransactionId': instance.paymentTransactionId,
  'createdAt': instance.createdAt?.toIso8601String(),
};
