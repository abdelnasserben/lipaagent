// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_login_response.dart';
import '../models/api_response_token_response.dart';
import '../models/login_request.dart';
import '../models/refresh_token_request.dart';
import '../models/verify_mfa_request.dart';

part 'agent_auth_controller_client.g.dart';

@RestApi()
abstract class AgentAuthControllerClient {
  factory AgentAuthControllerClient(Dio dio, {String? baseUrl}) =
      _AgentAuthControllerClient;

  @POST('/api/v1/auth/agent/refresh')
  Future<ApiResponseTokenResponse> refresh({
    @Body() required RefreshTokenRequest body,
  });

  @POST('/api/v1/auth/agent/logout')
  Future<void> logout();

  @POST('/api/v1/auth/agent/login')
  Future<ApiResponseLoginResponse> login({@Body() required LoginRequest body});

  @POST('/api/v1/auth/agent/login/verify-mfa')
  Future<ApiResponseLoginResponse> verifyMfa({
    @Body() required VerifyMfaRequest body,
  });
}
