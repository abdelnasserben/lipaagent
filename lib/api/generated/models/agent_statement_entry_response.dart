// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'agent_statement_entry_response.g.dart';

@JsonSerializable()
class AgentStatementEntryResponse {
  const AgentStatementEntryResponse({
    this.id,
    this.transactionId,
    this.side,
    this.amount,
    this.runningBalance,
    this.currency,
    this.description,
    this.postedAt,
    this.globalSequence,
  });

  factory AgentStatementEntryResponse.fromJson(Map<String, Object?> json) =>
      _$AgentStatementEntryResponseFromJson(json);

  final String? id;
  final String? transactionId;
  final String? side;
  final int? amount;
  final int? runningBalance;
  final String? currency;
  final String? description;
  final DateTime? postedAt;
  final int? globalSequence;

  Map<String, Object?> toJson() => _$AgentStatementEntryResponseToJson(this);
}
