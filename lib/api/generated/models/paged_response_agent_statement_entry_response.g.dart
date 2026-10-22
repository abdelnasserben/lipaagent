// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response_agent_statement_entry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedResponseAgentStatementEntryResponse
_$PagedResponseAgentStatementEntryResponseFromJson(Map<String, dynamic> json) =>
    PagedResponseAgentStatementEntryResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                AgentStatementEntryResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PagedResponseAgentStatementEntryResponseToJson(
  PagedResponseAgentStatementEntryResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
