// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentBalanceResponse _$AgentBalanceResponseFromJson(
  Map<String, dynamic> json,
) => AgentBalanceResponse(
  accountId: json['accountId'] as String?,
  availableBalance: (json['availableBalance'] as num?)?.toInt(),
  heldBalance: (json['heldBalance'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  accountStatus: json['accountStatus'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AgentBalanceResponseToJson(
  AgentBalanceResponse instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'availableBalance': instance.availableBalance,
  'heldBalance': instance.heldBalance,
  'currency': instance.currency,
  'accountStatus': instance.accountStatus,
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
