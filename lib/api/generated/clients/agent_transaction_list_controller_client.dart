// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_agent_transaction_response.dart';
import '../models/paged_response_agent_transaction_response.dart';

part 'agent_transaction_list_controller_client.g.dart';

@RestApi()
abstract class AgentTransactionListControllerClient {
  factory AgentTransactionListControllerClient(Dio dio, {String? baseUrl}) =
      _AgentTransactionListControllerClient;

  @GET('/api/v1/agent/transactions')
  Future<PagedResponseAgentTransactionResponse> list1({
    @Query('limit') int? limit = 20,
    @Query('cursor') String? cursor,
    @Query('status') String? status,
    @Query('type') String? type,
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  });

  @GET('/api/v1/agent/transactions/{id}')
  Future<ApiResponseAgentTransactionResponse> getById({
    @Path('id') required String id,
  });
}
