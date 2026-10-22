// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_card_lookup_response.dart';

part 'agent_card_controller_client.g.dart';

@RestApi()
abstract class AgentCardControllerClient {
  factory AgentCardControllerClient(Dio dio, {String? baseUrl}) =
      _AgentCardControllerClient;

  @POST('/api/v1/agent/customers/{customerId}/cards/{cardId}/report-stolen')
  Future<ApiResponseCardLookupResponse> reportStolen({
    @Path('customerId') required String customerId,
    @Path('cardId') required String cardId,
  });

  @POST('/api/v1/agent/customers/{customerId}/cards/{cardId}/report-lost')
  Future<ApiResponseCardLookupResponse> reportLost({
    @Path('customerId') required String customerId,
    @Path('cardId') required String cardId,
  });
}
