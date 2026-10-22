import 'package:flutter/material.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import 'notifications_controller.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';
import '../agent/agent_providers.dart';
import '../../l10n/l10n.dart';

/// Shared notification inbox (spec §5.8). MVP reality: the agent inbox is empty
/// today — the backend does not target agents as recipients yet. The screen is
/// wired and renders a clean empty state until that changes.
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    // Keeps the controller alive while its requests run.
    ref.watch(notificationsControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: l10n.notificationsNotifications,
              onBack: () => Navigator.of(context).pop(),
              action: TextButton(
                onPressed: () async {
                  final failure = await ref
                      .read(notificationsControllerProvider.notifier)
                      .markAllRead();
                  if (failure != null && context.mounted) {
                    _showError(context, failure);
                  }
                },
                child: Text(
                  l10n.notificationsToutLire,
                  style: AppText.ui(size: 13, color: AppColors.brand),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(notificationsProvider);
                  ref.invalidate(unreadCountProvider);
                  await ref.read(notificationsProvider.future);
                },
                child: notifications.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.brand),
                  ),
                  error: (_, _) => ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: ErrorRetry(
                          message: l10n.notificationsNotificationsIndisponibles,
                        ),
                      ),
                    ],
                  ),
                  data: (items) {
                    if (items.isEmpty) {
                      return ListView(
                        children: [
                          EmptyState(
                            icon: Icons.notifications_none_rounded,
                            title: l10n.notificationsAucuneNotification,
                            message: l10n.notificationsAlertesApparaitrontIciQu,
                          ),
                        ],
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                      itemCount: items.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (_, i) => _NotifRow(
                        notif: items[i],
                        onTap: () async {
                          final id = items[i].id;
                          if (id == null) return;
                          final failure = await ref
                              .read(notificationsControllerProvider.notifier)
                              .markRead(id);
                          if (failure != null && context.mounted) {
                            _showError(context, failure);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The app owns the wording of each notification code.
String _title(NotificationResponse n) => switch (n.code) {
  NotificationResponseCode.cashInCredited => l10n.notificationsDepotCredite,
  NotificationResponseCode.merchantCashOutCompleted =>
    l10n.notificationsRetraitMarchandEffectue,
  _ => l10n.notificationsNotification,
};

void _showError(BuildContext context, Object failure) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage(failure)),
      backgroundColor: AppColors.danger,
    ),
  );
}

class _NotifRow extends StatelessWidget {
  const _NotifRow({required this.notif, required this.onTap});
  final NotificationResponse notif;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: LipaCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: notif.isUnread ? AppColors.brand : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title(notif),
                    style: AppText.ui(
                      size: 14,
                      weight: notif.isUnread
                          ? FontWeight.w700
                          : FontWeight.w600,
                    ),
                  ),
                  if (notif.amount != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      fmtKmf(notif.amount!),
                      style: AppText.ui(
                        size: 13,
                        color: AppColors.inkMid,
                        height: 1.45,
                      ),
                    ),
                  ],
                  if (notif.createdAt != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      fmtRelativeFr(notif.createdAt!),
                      style: AppText.ui(size: 11.5, color: AppColors.inkLow),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
