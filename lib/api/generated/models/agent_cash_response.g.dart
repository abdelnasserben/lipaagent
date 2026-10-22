// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_cash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCashResponse _$AgentCashResponseFromJson(Map<String, dynamic> json) =>
    AgentCashResponse(
      transactionId: json['transactionId'] as String?,
      status: json['status'] == null
          ? null
          : AgentCashResponseStatus.fromJson(json['status'] as String),
      requestedAmount: (json['requestedAmount'] as num?)?.toInt(),
      feeAmount: (json['feeAmount'] as num?)?.toInt(),
      commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
      netAmountToDestination: (json['netAmountToDestination'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      replayed: json['replayed'] as bool?,
    );

Map<String, dynamic> _$AgentCashResponseToJson(AgentCashResponse instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'status': instance.status,
      'requestedAmount': instance.requestedAmount,
      'feeAmount': instance.feeAmount,
      'commissionAmount': instance.commissionAmount,
      'netAmountToDestination': instance.netAmountToDestination,
      'currency': instance.currency,
      'completedAt': instance.completedAt?.toIso8601String(),
      'replayed': instance.replayed,
    };
