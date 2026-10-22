import 'package:flutter/material.dart';
import '../../api/enums.dart';
import '../../api/generated/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/widgets/lipa_brand.dart';
import '../../l10n/l10n.dart';

class FloatCard extends StatefulWidget {
  const FloatCard({
    super.key,
    required this.balance,
    required this.profile,
    required this.onCashIn,
    required this.onCashOut,
    required this.onStatement,
  });
  final AsyncValue<AgentBalanceResponse> balance;
  final AsyncValue<AgentProfileResponse> profile;
  final VoidCallback onCashIn;
  final VoidCallback onCashOut;
  final VoidCallback onStatement;

  @override
  State<FloatCard> createState() => _FloatCardState();
}

class _FloatCardState extends State<FloatCard> {
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    final threshold = widget.profile.maybeWhen(
      data: (p) => p.floatAlertThreshold ?? 0,
      orElse: () => 0,
    );
    final below = widget.balance.maybeWhen(
      data: (b) => (b.availableBalance ?? 0) < threshold && threshold > 0,
      orElse: () => false,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.hero),
      child: Stack(
        children: [
          Container(
            color: AppColors.nearBlack,
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.floatCardFloatDisponible,
                      style: AppText.ui(
                        size: 12.5,
                        weight: FontWeight.w600,
                        color: Colors.white54,
                        letterSpacing: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() => _hidden = !_hidden),
                      child: Icon(
                        _hidden ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                widget.balance.when(
                  loading: () => Text(
                    '••• •••',
                    style: AppText.mono(
                      size: 38,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  error: (_, _) => Text(
                    '—',
                    style: AppText.mono(size: 38, color: Colors.white),
                  ),
                  data: (b) => Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _hidden
                            ? '••• •••'
                            : fmtKmfNoUnit(b.availableBalance ?? 0),
                        style: AppText.mono(
                          size: 38,
                          weight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'KMF',
                        style: AppText.mono(size: 14, color: Colors.white54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                widget.balance.maybeWhen(
                  data: (b) => Text.rich(
                    TextSpan(
                      style: AppText.ui(size: 12.5, color: Colors.white54),
                      children: [
                        TextSpan(
                          text: l10n.floatCardKmfReservesCompte(
                            fmtKmfNoUnit(b.heldBalance ?? 0),
                          ),
                        ),
                        TextSpan(
                          text:
                              '● ${AccountStatus.parse(b.accountStatus).label}',
                          style: TextStyle(
                            color: AccountStatus.parse(b.accountStatus).isActive
                                ? const Color(0xFF8FD1A8)
                                : const Color(0xFFE0A24A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
                if (below) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3A2A12),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: const Color(0xFF6B4E1E)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          size: 18,
                          color: Color(0xFFE0A24A),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            l10n.floatCardFloatSousSeuilAlerte(
                              fmtKmf(threshold),
                            ),
                            style: AppText.ui(
                              size: 12,
                              color: const Color(0xFFE6C998),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                const Divider(color: Colors.white10, height: 1),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _HeroAction(
                      icon: Icons.south_west_rounded,
                      label: l10n.commonDepot,
                      onTap: widget.onCashIn,
                    ),
                    const SizedBox(width: 8),
                    _HeroAction(
                      icon: Icons.north_east_rounded,
                      label: l10n.commonRetrait,
                      onTap: widget.onCashOut,
                    ),
                    const SizedBox(width: 8),
                    _HeroAction(
                      icon: Icons.description_outlined,
                      label: l10n.commonReleve,
                      onTap: widget.onStatement,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const GridBackground(),
        ],
      ),
    );
  }
}

class _HeroAction extends StatelessWidget {
  const _HeroAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Column(
            children: [
              Icon(icon, size: 22, color: Colors.white),
              const SizedBox(height: 6),
              Text(
                label,
                style: AppText.ui(
                  size: 12,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
