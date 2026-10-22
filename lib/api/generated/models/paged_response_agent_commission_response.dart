// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'agent_commission_response.dart';
import 'pagination.dart';

part 'paged_response_agent_commission_response.g.dart';

@JsonSerializable()
class PagedResponseAgentCommissionResponse {
  const PagedResponseAgentCommissionResponse({this.data, this.pagination});

  factory PagedResponseAgentCommissionResponse.fromJson(
    Map<String, Object?> json,
  ) => _$PagedResponseAgentCommissionResponseFromJson(json);

  final List<AgentCommissionResponse>? data;
  final Pagination? pagination;

  Map<String, Object?> toJson() =>
      _$PagedResponseAgentCommissionResponseToJson(this);
}
