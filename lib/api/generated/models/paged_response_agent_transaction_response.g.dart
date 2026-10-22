// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response_agent_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedResponseAgentTransactionResponse
_$PagedResponseAgentTransactionResponseFromJson(Map<String, dynamic> json) =>
    PagedResponseAgentTransactionResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
            (e) => AgentTransactionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PagedResponseAgentTransactionResponseToJson(
  PagedResponseAgentTransactionResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
