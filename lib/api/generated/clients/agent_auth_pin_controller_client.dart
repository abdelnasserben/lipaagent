// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/change_auth_pin_request.dart';
import '../models/reset_auth_pin_request.dart';
import '../models/set_auth_pin_request.dart';

part 'agent_auth_pin_controller_client.g.dart';

@RestApi()
abstract class AgentAuthPinControllerClient {
  factory AgentAuthPinControllerClient(Dio dio, {String? baseUrl}) =
      _AgentAuthPinControllerClient;

  @PUT('/api/v1/auth/agent/auth-pin')
  Future<void> change({@Body() required ChangeAuthPinRequest body});

  @POST('/api/v1/auth/agent/auth-pin/setup')
  Future<void> setup1({@Body() required SetAuthPinRequest body});

  @POST('/api/v1/auth/agent/auth-pin/reset')
  Future<void> reset({@Body() required ResetAuthPinRequest body});
}
