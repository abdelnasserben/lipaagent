// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_merchant_cash_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentMerchantCashOutResponse _$AgentMerchantCashOutResponseFromJson(
  Map<String, dynamic> json,
) => AgentMerchantCashOutResponse(
  outcome: json['outcome'] == null
      ? null
      : AgentMerchantCashOutResponseOutcome.fromJson(json['outcome'] as String),
  transactionId: json['transactionId'] as String?,
  status: json['status'] as String?,
  approvalId: json['approvalId'] as String?,
  requestedAmount: (json['requestedAmount'] as num?)?.toInt(),
  matchedThresholdAmount: (json['matchedThresholdAmount'] as num?)?.toInt(),
  feeAmount: (json['feeAmount'] as num?)?.toInt(),
  commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
  netAmountToDestination: (json['netAmountToDestination'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  replayed: json['replayed'] as bool?,
);

Map<String, dynamic> _$AgentMerchantCashOutResponseToJson(
  AgentMerchantCashOutResponse instance,
) => <String, dynamic>{
  'outcome': instance.outcome,
  'transactionId': instance.transactionId,
  'status': instance.status,
  'approvalId': instance.approvalId,
  'requestedAmount': instance.requestedAmount,
  'matchedThresholdAmount': instance.matchedThresholdAmount,
  'feeAmount': instance.feeAmount,
  'commissionAmount': instance.commissionAmount,
  'netAmountToDestination': instance.netAmountToDestination,
  'currency': instance.currency,
  'completedAt': instance.completedAt?.toIso8601String(),
  'replayed': instance.replayed,
};
