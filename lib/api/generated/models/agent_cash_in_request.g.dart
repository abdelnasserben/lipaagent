// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_cash_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCashInRequest _$AgentCashInRequestFromJson(Map<String, dynamic> json) =>
    AgentCashInRequest(
      customerId: json['customerId'] as String,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AgentCashInRequestToJson(AgentCashInRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'amount': instance.amount,
    };
