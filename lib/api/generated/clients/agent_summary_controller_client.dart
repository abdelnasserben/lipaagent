// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_agent_daily_summary_response.dart';

part 'agent_summary_controller_client.g.dart';

@RestApi()
abstract class AgentSummaryControllerClient {
  factory AgentSummaryControllerClient(Dio dio, {String? baseUrl}) =
      _AgentSummaryControllerClient;

  @GET('/api/v1/agent/summary/daily')
  Future<ApiResponseAgentDailySummaryResponse> daily();
}
