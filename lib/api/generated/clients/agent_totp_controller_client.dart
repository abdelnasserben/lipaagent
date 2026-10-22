// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_totp_setup_response.dart';
import '../models/totp_confirm_request.dart';
import '../models/totp_revoke_request.dart';

part 'agent_totp_controller_client.g.dart';

@RestApi()
abstract class AgentTotpControllerClient {
  factory AgentTotpControllerClient(Dio dio, {String? baseUrl}) =
      _AgentTotpControllerClient;

  @POST('/api/v1/auth/agent/totp-setup')
  Future<ApiResponseTotpSetupResponse> setup();

  @DELETE('/api/v1/auth/agent/totp-setup')
  Future<void> revoke({@Body() required TotpRevokeRequest body});

  @POST('/api/v1/auth/agent/totp-confirm')
  Future<void> confirm({@Body() required TotpConfirmRequest body});
}
