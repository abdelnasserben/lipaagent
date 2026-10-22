// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_card_replace_request.g.dart';

@JsonSerializable()
class AgentCardReplaceRequest {
  const AgentCardReplaceRequest({
    required this.stockId,
    required this.replacementFee,
  });

  factory AgentCardReplaceRequest.fromJson(Map<String, Object?> json) =>
      _$AgentCardReplaceRequestFromJson(json);

  final String stockId;
  final int replacementFee;

  Map<String, Object?> toJson() => _$AgentCardReplaceRequestToJson(this);
}
