// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/paged_response_agent_statement_entry_response.dart';

part 'agent_statement_controller_client.g.dart';

@RestApi()
abstract class AgentStatementControllerClient {
  factory AgentStatementControllerClient(Dio dio, {String? baseUrl}) =
      _AgentStatementControllerClient;

  @GET('/api/v1/agent/statements')
  Future<PagedResponseAgentStatementEntryResponse> list2({
    @Query('limit') int? limit = 20,
    @Query('cursor') String? cursor,
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  });
}
