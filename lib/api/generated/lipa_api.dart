// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'clients/agent_auth_pin_controller_client.dart';
import 'clients/notification_controller_client.dart';
import 'clients/agent_totp_controller_client.dart';
import 'clients/agent_auth_controller_client.dart';
import 'clients/agent_kyc_controller_client.dart';
import 'clients/agent_card_controller_client.dart';
import 'clients/agent_card_replacement_controller_client.dart';
import 'clients/agent_enrollment_controller_client.dart';
import 'clients/agent_transaction_controller_client.dart';
import 'clients/agent_transaction_list_controller_client.dart';
import 'clients/agent_summary_controller_client.dart';
import 'clients/agent_statement_controller_client.dart';
import 'clients/agent_me_controller_client.dart';
import 'clients/agent_limits_controller_client.dart';
import 'clients/agent_commission_controller_client.dart';
import 'clients/agent_card_stock_controller_client.dart';

/// Lipa API `vv1`.
///
/// Success bodies are wrapped in { data, timestamp }, lists in { data, pagination }, errors in { error: { code, message, details, correlationId, timestamp } }. Error codes are stable; messages are for developers only.
class LipaApi {
  LipaApi(Dio dio, {String? baseUrl}) : _dio = dio, _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => 'v1';

  AgentAuthPinControllerClient? _agentAuthPinController;
  NotificationControllerClient? _notificationController;
  AgentTotpControllerClient? _agentTotpController;
  AgentAuthControllerClient? _agentAuthController;
  AgentKycControllerClient? _agentKycController;
  AgentCardControllerClient? _agentCardController;
  AgentCardReplacementControllerClient? _agentCardReplacementController;
  AgentEnrollmentControllerClient? _agentEnrollmentController;
  AgentTransactionControllerClient? _agentTransactionController;
  AgentTransactionListControllerClient? _agentTransactionListController;
  AgentSummaryControllerClient? _agentSummaryController;
  AgentStatementControllerClient? _agentStatementController;
  AgentMeControllerClient? _agentMeController;
  AgentLimitsControllerClient? _agentLimitsController;
  AgentCommissionControllerClient? _agentCommissionController;
  AgentCardStockControllerClient? _agentCardStockController;

  AgentAuthPinControllerClient get agentAuthPinController =>
      _agentAuthPinController ??= AgentAuthPinControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  NotificationControllerClient get notificationController =>
      _notificationController ??= NotificationControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentTotpControllerClient get agentTotpController => _agentTotpController ??=
      AgentTotpControllerClient(_dio, baseUrl: _baseUrl);

  AgentAuthControllerClient get agentAuthController => _agentAuthController ??=
      AgentAuthControllerClient(_dio, baseUrl: _baseUrl);

  AgentKycControllerClient get agentKycController =>
      _agentKycController ??= AgentKycControllerClient(_dio, baseUrl: _baseUrl);

  AgentCardControllerClient get agentCardController => _agentCardController ??=
      AgentCardControllerClient(_dio, baseUrl: _baseUrl);

  AgentCardReplacementControllerClient get agentCardReplacementController =>
      _agentCardReplacementController ??= AgentCardReplacementControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentEnrollmentControllerClient get agentEnrollmentController =>
      _agentEnrollmentController ??= AgentEnrollmentControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentTransactionControllerClient get agentTransactionController =>
      _agentTransactionController ??= AgentTransactionControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentTransactionListControllerClient get agentTransactionListController =>
      _agentTransactionListController ??= AgentTransactionListControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentSummaryControllerClient get agentSummaryController =>
      _agentSummaryController ??= AgentSummaryControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentStatementControllerClient get agentStatementController =>
      _agentStatementController ??= AgentStatementControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentMeControllerClient get agentMeController =>
      _agentMeController ??= AgentMeControllerClient(_dio, baseUrl: _baseUrl);

  AgentLimitsControllerClient get agentLimitsController =>
      _agentLimitsController ??= AgentLimitsControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentCommissionControllerClient get agentCommissionController =>
      _agentCommissionController ??= AgentCommissionControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );

  AgentCardStockControllerClient get agentCardStockController =>
      _agentCardStockController ??= AgentCardStockControllerClient(
        _dio,
        baseUrl: _baseUrl,
      );
}
