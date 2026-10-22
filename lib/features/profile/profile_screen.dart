import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import '../../api/model_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/status_pills.dart';
import '../agent/agent_providers.dart';
import '../auth/session_controller.dart';
import '../commissions/commissions_screen.dart';
import '../security/security_screen.dart';
import 'limits_screen.dart';
import '../../l10n/l10n.dart';

/// Profile tab: agent identity, capabilities, and entry points to commissions,
/// limits, and security (PIN / TOTP). Logout lives here.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return Column(
      children: [
        ScreenHeader(title: l10n.commonProfil),
        Expanded(
          child: profile.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.brand),
            ),
            error: (_, _) => Padding(
              padding: EdgeInsets.all(16),
              child: ErrorRetry(message: l10n.commonProfilIndisponible),
            ),
            data: (p) => _Body(profile: p),
          ),
        ),
      ],
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.profile});
  final AgentProfileResponse profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        // Identity header.
        LipaCard(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.nearBlack,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Text(
                  _initials(profile.fullName ?? ''),
                  style: AppText.ui(
                    size: 20,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.fullName ?? '',
                      style: AppText.ui(size: 17, weight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      profile.phonePretty,
                      style: AppText.mono(size: 13, color: AppColors.inkMid),
                    ),
                    const SizedBox(height: 8),
                    GenericStatusPill(
                      label: AgentStatus.parse(profile.status).label,
                      active: AgentStatus.parse(profile.status).isActive,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Account details.
        LipaCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              DetailRow(
                label: l10n.profileReferenceAgent,
                value: profile.externalRef ?? '',
              ),
              if (profile.zone != null && profile.zone!.isNotEmpty)
                DetailRow(label: l10n.profileZone, value: profile.zone!),
              DetailRow(
                label: l10n.profileNiveauKyc,
                value: KycLevel.parse(profile.kycLevel).label,
              ),
              if (profile.contractRef != null)
                DetailRow(
                  label: l10n.profileContrat,
                  value: profile.contractRef!,
                ),
              DetailRow(
                label: l10n.profileSeuilAlerteFloat,
                value: fmtKmf(profile.floatAlertThreshold ?? 0),
                mono: true,
                last: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Capabilities (spec §10.3 gating flags).
        Text(
          l10n.profileAutorisations,
          style: AppText.ui(size: 13, weight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _Cap(label: l10n.profileDepots, on: profile.canDoCashIn ?? false),
            _Cap(
              label: l10n.profileRetraits,
              on: profile.canDoCashOut ?? false,
            ),
            _Cap(
              label: l10n.profileVenteCartes,
              on: profile.canSellCards ?? false,
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Navigation.
        _NavCard(
          children: [
            _NavRow(
              icon: Icons.savings_outlined,
              label: l10n.commonCommissions,
              onTap: () => _push(context, const CommissionsScreen()),
            ),
            _NavRow(
              icon: Icons.speed_rounded,
              label: l10n.commonPlafonds,
              onTap: () => _push(context, const LimitsScreen()),
            ),
            _NavRow(
              icon: Icons.shield_outlined,
              label: l10n.profileSecuritePinTotp,
              onTap: () => _push(context, const SecurityScreen()),
              last: true,
            ),
          ],
        ),
        const SizedBox(height: 20),

        LipaButton(
          label: l10n.profileSeDeconnecter,
          variant: BtnVariant.dangerOutline,
          size: BtnSize.lg,
          full: true,
          icon: const Icon(Icons.logout_rounded),
          onPressed: () => _confirmLogout(context, ref),
        ),
      ],
    );
  }

  void _push(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          l10n.profileSeDeconnecter,
          style: AppText.ui(size: 17, weight: FontWeight.w700),
        ),
        content: Text(
          l10n.profileVoulezVousVraimentVous,
          style: AppText.ui(size: 14, color: AppColors.inkMid),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l10n.commonAnnuler,
              style: AppText.ui(size: 14, color: AppColors.inkMid),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l10n.profileDeconnexion,
              style: AppText.ui(
                size: 14,
                weight: FontWeight.w700,
                color: AppColors.danger,
              ),
            ),
          ),
        ],
      ),
    );
    if (ok == true) {
      await ref.read(sessionControllerProvider.notifier).logout();
    }
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      return parts.first.isEmpty ? '?' : parts.first[0].toUpperCase();
    }
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}

class _Cap extends StatelessWidget {
  const _Cap({required this.label, required this.on});
  final String label;
  final bool on;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: on ? AppColors.brandSoft : AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: on ? AppColors.brandSoft : AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            on ? Icons.check_circle : Icons.remove_circle_outline,
            size: 15,
            color: on ? AppColors.brandDeep : AppColors.inkLow,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppText.ui(
              size: 12.5,
              weight: FontWeight.w600,
              color: on ? AppColors.brandDeep : AppColors.inkMid,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  const _NavCard({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => LipaCard(
    padding: EdgeInsets.zero,
    child: Column(children: children),
  );
}

class _NavRow extends StatelessWidget {
  const _NavRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.last = false,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          border: last
              ? null
              : const Border(bottom: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.ink),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: AppText.ui(size: 14.5, weight: FontWeight.w600),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.inkLow),
          ],
        ),
      ),
    );
  }
}
