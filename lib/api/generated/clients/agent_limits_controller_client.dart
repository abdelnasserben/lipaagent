// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_agent_limits_response.dart';

part 'agent_limits_controller_client.g.dart';

@RestApi()
abstract class AgentLimitsControllerClient {
  factory AgentLimitsControllerClient(Dio dio, {String? baseUrl}) =
      _AgentLimitsControllerClient;

  @GET('/api/v1/agent/limits')
  Future<ApiResponseAgentLimitsResponse> getLimits();
}
