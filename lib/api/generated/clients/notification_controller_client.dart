// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response_list_notification_response.dart';
import '../models/api_response_mark_all_read_response.dart';
import '../models/api_response_unread_count_response.dart';
import '../models/api_response_void.dart';

part 'notification_controller_client.g.dart';

@RestApi()
abstract class NotificationControllerClient {
  factory NotificationControllerClient(Dio dio, {String? baseUrl}) =
      _NotificationControllerClient;

  @POST('/api/v1/notifications/{id}/read')
  Future<ApiResponseVoid> markRead({@Path('id') required String id});

  @POST('/api/v1/notifications/read-all')
  Future<ApiResponseMarkAllReadResponse> markAllRead();

  @GET('/api/v1/notifications')
  Future<ApiResponseListNotificationResponse> list({
    @Query('limit') int? limit = 20,
  });

  @GET('/api/v1/notifications/unread')
  Future<ApiResponseUnreadCountResponse> unreadCount();
}
