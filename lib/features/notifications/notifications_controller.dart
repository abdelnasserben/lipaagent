import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../agent/agent_providers.dart';

/// Marks notifications read, then refreshes the inbox and the badge.
class NotificationsController extends Notifier<void> {
  @override
  void build() {}

  /// Returns the failure, if any, for a message.
  Future<Object?> markRead(String id) => _run(
    () => ref
        .read(apiClientProvider)
        .send((api) => api.notificationController.markRead(id: id)),
  );

  Future<Object?> markAllRead() => _run(
    () => ref
        .read(apiClientProvider)
        .send((api) => api.notificationController.markAllRead()),
  );

  Future<Object?> _run(Future<Object?> Function() request) async {
    try {
      await request();
      return null;
    } catch (e) {
      return e;
    } finally {
      if (ref.mounted) {
        ref.invalidate(notificationsProvider);
        ref.invalidate(unreadCountProvider);
      }
    }
  }
}

final notificationsControllerProvider =
    NotifierProvider.autoDispose<NotificationsController, void>(
      NotificationsController.new,
    );
