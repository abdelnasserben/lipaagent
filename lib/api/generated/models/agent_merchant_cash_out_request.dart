// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_merchant_cash_out_request.g.dart';

@JsonSerializable()
class AgentMerchantCashOutRequest {
  const AgentMerchantCashOutRequest({
    required this.merchantId,
    this.amount,
    this.merchantPin,
    this.confirmationAcknowledged,
  });

  factory AgentMerchantCashOutRequest.fromJson(Map<String, Object?> json) =>
      _$AgentMerchantCashOutRequestFromJson(json);

  final String merchantId;
  final int? amount;
  final String? merchantPin;
  final bool? confirmationAcknowledged;

  Map<String, Object?> toJson() => _$AgentMerchantCashOutRequestToJson(this);
}
