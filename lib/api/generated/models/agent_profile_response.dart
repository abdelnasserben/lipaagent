// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_profile_response.g.dart';

@JsonSerializable()
class AgentProfileResponse {
  const AgentProfileResponse({
    this.id,
    this.externalRef,
    this.fullName,
    this.phoneCountryCode,
    this.phoneNumber,
    this.zone,
    this.kycLevel,
    this.status,
    this.accountId,
    this.limitProfileId,
    this.canSellCards,
    this.canDoCashIn,
    this.canDoCashOut,
    this.floatAlertThreshold,
    this.contractRef,
    this.createdAt,
  });

  factory AgentProfileResponse.fromJson(Map<String, Object?> json) =>
      _$AgentProfileResponseFromJson(json);

  final String? id;
  final String? externalRef;
  final String? fullName;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final String? zone;
  final String? kycLevel;
  final String? status;
  final String? accountId;
  final String? limitProfileId;
  final bool? canSellCards;
  final bool? canDoCashIn;
  final bool? canDoCashOut;
  final int? floatAlertThreshold;
  final String? contractRef;
  final DateTime? createdAt;

  Map<String, Object?> toJson() => _$AgentProfileResponseToJson(this);
}
