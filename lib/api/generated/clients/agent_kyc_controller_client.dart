// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_kyc_document_response.dart';
import '../models/api_response_list_kyc_document_response.dart';

part 'agent_kyc_controller_client.g.dart';

@RestApi()
abstract class AgentKycControllerClient {
  factory AgentKycControllerClient(Dio dio, {String? baseUrl}) =
      _AgentKycControllerClient;

  @GET('/api/v1/agent/customers/{customerId}/kyc-documents')
  Future<ApiResponseListKycDocumentResponse> listDocuments({
    @Path('customerId') required String customerId,
  });

  @MultiPart()
  @POST('/api/v1/agent/customers/{customerId}/kyc-documents')
  Future<ApiResponseKycDocumentResponse> uploadDocument({
    @Path('customerId') required String customerId,
    @Query('documentType') required String documentType,
    @Part(name: 'file') required MultipartFile file,
  });
}
