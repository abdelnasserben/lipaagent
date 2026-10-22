import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/app_tokens.dart';
import '../../l10n/l10n.dart';

/// Official Lipa mark — a solid dot followed by two echoing arcs.
/// Transcribed from the Customer design `tokens.jsx` LipaMark (viewBox 0 0 100 100).
class LipaMark extends StatelessWidget {
  const LipaMark({super.key, this.size = 36, this.dark = false});

  final double size;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _LipaMarkPainter(
          ink: dark ? Colors.white : const Color(0xFF0A0A0A),
        ),
      ),
    );
  }
}

class _LipaMarkPainter extends CustomPainter {
  _LipaMarkPainter({required this.ink});

  final Color ink;
  static const _accent = AppColors.brand;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 100.0;
    final dot = Paint()..color = ink;
    canvas.drawCircle(Offset(26 * s, 50 * s), 9 * s, dot);

    final inner = Paint()
      ..color = ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7 * s
      ..strokeCap = StrokeCap.round;
    final p1 = Path()
      ..moveTo(44 * s, 32 * s)
      ..quadraticBezierTo(60 * s, 50 * s, 44 * s, 68 * s);
    canvas.drawPath(p1, inner);

    final outer = Paint()
      ..color = _accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7 * s
      ..strokeCap = StrokeCap.round;
    final p2 = Path()
      ..moveTo(58 * s, 22 * s)
      ..quadraticBezierTo(80 * s, 50 * s, 58 * s, 78 * s);
    canvas.drawPath(p2, outer);
  }

  @override
  bool shouldRepaint(covariant _LipaMarkPainter old) => old.ink != ink;
}

/// Wordmark: mark + "Lipa" + an uppercase subtitle.
///
/// The Agent app always shows the "AGENT" subtitle so the operator
/// always knows which Lipa surface they are in (vs the Customer app).
class LipaWordmark extends StatelessWidget {
  const LipaWordmark({super.key, this.dark = false, this.size = 36});

  final bool dark;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LipaMark(size: size, dark: dark),
        const SizedBox(width: 12),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.commonLipa,
              style: AppText.ui(
                size: size * 0.55,
                weight: FontWeight.w700,
                color: dark ? Colors.white : AppColors.inkHi,
                letterSpacing: -(size * 0.55) * 0.01,
                height: 1,
              ),
            ),
            ...[
              const SizedBox(height: 4),
              Text(
                l10n.lipaBrandAgent.toUpperCase(),
                style: AppText.ui(
                  size: 10,
                  weight: FontWeight.w600,
                  color: dark ? Colors.white54 : AppColors.inkLow,
                  letterSpacing: 1.2,
                  height: 1,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

/// The faint grid + radial-fade overlay used on the dark hero panels.
class GridBackground extends StatelessWidget {
  const GridBackground({super.key, this.cell = 64});

  final double cell;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (rect) => RadialGradient(
            center: const Alignment(0.9, -0.9),
            radius: 1.2,
            colors: const [Colors.black, Colors.transparent],
            stops: const [0.3, 0.75],
          ).createShader(rect),
          child: CustomPaint(painter: _GridPainter(cell: cell)),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({required this.cell});
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..strokeWidth = 1;
    for (double x = 0; x <= size.width; x += cell) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += cell) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter old) => old.cell != cell;
}
