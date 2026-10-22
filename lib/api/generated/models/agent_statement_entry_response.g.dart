// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_statement_entry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentStatementEntryResponse _$AgentStatementEntryResponseFromJson(
  Map<String, dynamic> json,
) => AgentStatementEntryResponse(
  id: json['id'] as String?,
  transactionId: json['transactionId'] as String?,
  side: json['side'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  runningBalance: (json['runningBalance'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  description: json['description'] as String?,
  postedAt: json['postedAt'] == null
      ? null
      : DateTime.parse(json['postedAt'] as String),
  globalSequence: (json['globalSequence'] as num?)?.toInt(),
);

Map<String, dynamic> _$AgentStatementEntryResponseToJson(
  AgentStatementEntryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'transactionId': instance.transactionId,
  'side': instance.side,
  'amount': instance.amount,
  'runningBalance': instance.runningBalance,
  'currency': instance.currency,
  'description': instance.description,
  'postedAt': instance.postedAt?.toIso8601String(),
  'globalSequence': instance.globalSequence,
};
