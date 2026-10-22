// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/paged_response_agent_card_stock_view.dart';
import '../models/status.dart';

part 'agent_card_stock_controller_client.g.dart';

@RestApi()
abstract class AgentCardStockControllerClient {
  factory AgentCardStockControllerClient(Dio dio, {String? baseUrl}) =
      _AgentCardStockControllerClient;

  @GET('/api/v1/agent/card-stock')
  Future<PagedResponseAgentCardStockView> listMyStock({
    @Query('status') Status? status = Status.assignedToAgent,
  });
}
