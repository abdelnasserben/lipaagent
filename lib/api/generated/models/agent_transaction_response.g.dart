// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentTransactionResponse _$AgentTransactionResponseFromJson(
  Map<String, dynamic> json,
) => AgentTransactionResponse(
  id: json['id'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  initiatorType: json['initiatorType'] as String?,
  initiatorId: json['initiatorId'] as String?,
  requestedAmount: (json['requestedAmount'] as num?)?.toInt(),
  feeAmount: (json['feeAmount'] as num?)?.toInt(),
  commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
  netAmountToDestination: (json['netAmountToDestination'] as num?)?.toInt(),
  balanceChange: (json['balanceChange'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  details: json['details'] as Map<String, dynamic>?,
  declineReason: json['declineReason'] as String?,
  correlationId: json['correlationId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  declinedAt: json['declinedAt'] == null
      ? null
      : DateTime.parse(json['declinedAt'] as String),
);

Map<String, dynamic> _$AgentTransactionResponseToJson(
  AgentTransactionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'status': instance.status,
  'initiatorType': instance.initiatorType,
  'initiatorId': instance.initiatorId,
  'requestedAmount': instance.requestedAmount,
  'feeAmount': instance.feeAmount,
  'commissionAmount': instance.commissionAmount,
  'netAmountToDestination': instance.netAmountToDestination,
  'balanceChange': instance.balanceChange,
  'currency': instance.currency,
  'details': instance.details,
  'declineReason': instance.declineReason,
  'correlationId': instance.correlationId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'declinedAt': instance.declinedAt?.toIso8601String(),
};
