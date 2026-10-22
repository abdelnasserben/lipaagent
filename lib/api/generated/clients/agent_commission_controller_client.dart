// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/paged_response_agent_commission_response.dart';

part 'agent_commission_controller_client.g.dart';

@RestApi()
abstract class AgentCommissionControllerClient {
  factory AgentCommissionControllerClient(Dio dio, {String? baseUrl}) =
      _AgentCommissionControllerClient;

  @GET('/api/v1/agent/commissions')
  Future<PagedResponseAgentCommissionResponse> list3({
    @Query('limit') int? limit = 20,
    @Query('cursor') String? cursor,
    @Query('status') String? status,
  });
}
