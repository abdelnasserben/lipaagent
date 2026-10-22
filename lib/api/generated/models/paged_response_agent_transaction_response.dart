// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_transaction_response.dart';
import 'pagination.dart';

part 'paged_response_agent_transaction_response.g.dart';

@JsonSerializable()
class PagedResponseAgentTransactionResponse {
  const PagedResponseAgentTransactionResponse({this.data, this.pagination});

  factory PagedResponseAgentTransactionResponse.fromJson(
    Map<String, Object?> json,
  ) => _$PagedResponseAgentTransactionResponseFromJson(json);

  final List<AgentTransactionResponse>? data;
  final Pagination? pagination;

  Map<String, Object?> toJson() =>
      _$PagedResponseAgentTransactionResponseToJson(this);
}
