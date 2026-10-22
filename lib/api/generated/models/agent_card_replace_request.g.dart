// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_card_replace_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCardReplaceRequest _$AgentCardReplaceRequestFromJson(
  Map<String, dynamic> json,
) => AgentCardReplaceRequest(
  stockId: json['stockId'] as String,
  replacementFee: (json['replacementFee'] as num).toInt(),
);

Map<String, dynamic> _$AgentCardReplaceRequestToJson(
  AgentCardReplaceRequest instance,
) => <String, dynamic>{
  'stockId': instance.stockId,
  'replacementFee': instance.replacementFee,
};
