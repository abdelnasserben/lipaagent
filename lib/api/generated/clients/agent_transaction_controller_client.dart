// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/agent_card_sale_request.dart';
import '../models/agent_cash_in_request.dart';
import '../models/agent_merchant_cash_out_request.dart';
import '../models/api_response_agent_card_sale_response.dart';
import '../models/api_response_agent_cash_response.dart';
import '../models/api_response_agent_merchant_cash_out_response.dart';
import '../models/api_response_card_lookup_response.dart';
import '../models/api_response_customer_lookup_response.dart';
import '../models/api_response_merchant_lookup_response.dart';

part 'agent_transaction_controller_client.g.dart';

@RestApi()
abstract class AgentTransactionControllerClient {
  factory AgentTransactionControllerClient(Dio dio, {String? baseUrl}) =
      _AgentTransactionControllerClient;

  @POST('/api/v1/agent/cash-out')
  Future<ApiResponseAgentMerchantCashOutResponse> cashOut({
    @Header('Idempotency-Key') required String idempotencyKey,
    @Body() required AgentMerchantCashOutRequest body,
  });

  @POST('/api/v1/agent/cash-in')
  Future<ApiResponseAgentCashResponse> cashIn({
    @Header('Idempotency-Key') required String idempotencyKey,
    @Body() required AgentCashInRequest body,
  });

  @POST('/api/v1/agent/card-sales')
  Future<ApiResponseAgentCardSaleResponse> sellCard({
    @Header('Idempotency-Key') required String idempotencyKey,
    @Body() required AgentCardSaleRequest body,
  });

  @GET('/api/v1/agent/merchants/lookup')
  Future<ApiResponseMerchantLookupResponse> lookupMerchant({
    @Query('phoneCountryCode') required String phoneCountryCode,
    @Query('phoneNumber') required String phoneNumber,
  });

  @GET('/api/v1/agent/lookup')
  Future<ApiResponseCustomerLookupResponse> lookupCustomer({
    @Query('phoneCountryCode') required String phoneCountryCode,
    @Query('phoneNumber') required String phoneNumber,
  });

  @GET('/api/v1/agent/cards/lookup')
  Future<ApiResponseCardLookupResponse> lookupCard({
    @Query('nfcUid') required String nfcUid,
  });
}
