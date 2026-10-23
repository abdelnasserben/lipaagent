import 'package:flutter/material.dart';
import '../../api/generated/export.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../cashin/cash_in_screen.dart';
import '../cashout/cash_out_screen.dart';
import '../enroll/enroll_screen.dart';
import '../../l10n/l10n.dart';

/// Capability-gated quick-op chips (spec §11.3): hidden when the agent can't.
class QuickOps extends StatelessWidget {
  const QuickOps({super.key, required this.profile});
  final AgentProfileResponse profile;

  @override
  Widget build(BuildContext context) {
    final tiles = <Widget>[
      if (profile.canDoCashIn ?? false)
        _OpTile(
          icon: Icons.south_west_rounded,
          label: l10n.commonDepotClient,
          sub: l10n.quickOpsCrediterClient,
          onTap: () => _push(context, const CashInScreen()),
        ),
      if (profile.canDoCashOut ?? false)
        _OpTile(
          icon: Icons.north_east_rounded,
          label: l10n.commonRetraitMarchand,
          sub: l10n.quickOpsRemettreEspeces,
          onTap: () => _push(context, const CashOutScreen()),
        ),
      _OpTile(
        icon: Icons.person_add_alt_1_rounded,
        label: l10n.commonEnrolerClient,
        sub: l10n.quickOpsCompteKyc,
        onTap: () => _push(context, const EnrollScreen()),
      ),
    ];
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.6,
      children: tiles,
    );
  }

  void _push(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

class _OpTile extends StatelessWidget {
  const _OpTile({
    required this.icon,
    required this.label,
    required this.sub,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final String sub;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.brandSoft,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(icon, size: 20, color: AppColors.brandDeep),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.ui(size: 13.5, weight: FontWeight.w600),
                    ),
                    Text(
                      sub,
                      style: AppText.ui(size: 11.5, color: AppColors.inkLow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
