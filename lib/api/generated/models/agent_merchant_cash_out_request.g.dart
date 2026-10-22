// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_merchant_cash_out_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentMerchantCashOutRequest _$AgentMerchantCashOutRequestFromJson(
  Map<String, dynamic> json,
) => AgentMerchantCashOutRequest(
  merchantId: json['merchantId'] as String,
  amount: (json['amount'] as num?)?.toInt(),
  merchantPin: json['merchantPin'] as String?,
  confirmationAcknowledged: json['confirmationAcknowledged'] as bool?,
);

Map<String, dynamic> _$AgentMerchantCashOutRequestToJson(
  AgentMerchantCashOutRequest instance,
) => <String, dynamic>{
  'merchantId': instance.merchantId,
  'amount': instance.amount,
  'merchantPin': instance.merchantPin,
  'confirmationAcknowledged': instance.confirmationAcknowledged,
};
