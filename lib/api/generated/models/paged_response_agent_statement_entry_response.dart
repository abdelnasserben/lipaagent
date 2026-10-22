// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_statement_entry_response.dart';
import 'pagination.dart';

part 'paged_response_agent_statement_entry_response.g.dart';

@JsonSerializable()
class PagedResponseAgentStatementEntryResponse {
  const PagedResponseAgentStatementEntryResponse({this.data, this.pagination});

  factory PagedResponseAgentStatementEntryResponse.fromJson(
    Map<String, Object?> json,
  ) => _$PagedResponseAgentStatementEntryResponseFromJson(json);

  final List<AgentStatementEntryResponse>? data;
  final Pagination? pagination;

  Map<String, Object?> toJson() =>
      _$PagedResponseAgentStatementEntryResponseToJson(this);
}
