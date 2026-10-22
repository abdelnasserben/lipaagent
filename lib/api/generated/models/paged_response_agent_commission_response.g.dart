// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response_agent_commission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedResponseAgentCommissionResponse
_$PagedResponseAgentCommissionResponseFromJson(Map<String, dynamic> json) =>
    PagedResponseAgentCommissionResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
            (e) => AgentCommissionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PagedResponseAgentCommissionResponseToJson(
  PagedResponseAgentCommissionResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
