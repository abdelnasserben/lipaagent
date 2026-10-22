// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/agent_card_replace_request.dart';
import '../models/api_response_agent_card_replacement_response.dart';

part 'agent_card_replacement_controller_client.g.dart';

@RestApi()
abstract class AgentCardReplacementControllerClient {
  factory AgentCardReplacementControllerClient(Dio dio, {String? baseUrl}) =
      _AgentCardReplacementControllerClient;

  @POST('/api/v1/agent/customers/{customerId}/cards/{cardId}/replace')
  Future<ApiResponseAgentCardReplacementResponse> replace({
    @Path('customerId') required String customerId,
    @Path('cardId') required String cardId,
    @Header('Idempotency-Key') required String idempotencyKey,
    @Body() required AgentCardReplaceRequest body,
  });
}
