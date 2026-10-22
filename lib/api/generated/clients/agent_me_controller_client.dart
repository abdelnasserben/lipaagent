// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_agent_balance_response.dart';
import '../models/api_response_agent_profile_response.dart';

part 'agent_me_controller_client.g.dart';

@RestApi()
abstract class AgentMeControllerClient {
  factory AgentMeControllerClient(Dio dio, {String? baseUrl}) =
      _AgentMeControllerClient;

  @GET('/api/v1/agent/me')
  Future<ApiResponseAgentProfileResponse> getProfile();

  @GET('/api/v1/agent/balance')
  Future<ApiResponseAgentBalanceResponse> getBalance();
}
