// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_enroll_customer_response.dart';
import '../models/enroll_customer_request.dart';

part 'agent_enrollment_controller_client.g.dart';

@RestApi()
abstract class AgentEnrollmentControllerClient {
  factory AgentEnrollmentControllerClient(Dio dio, {String? baseUrl}) =
      _AgentEnrollmentControllerClient;

  @POST('/api/v1/agent/customers/enroll')
  Future<ApiResponseEnrollCustomerResponse> enroll({
    @Body() required EnrollCustomerRequest body,
  });
}
