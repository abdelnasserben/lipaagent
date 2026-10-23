import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import '../widgets/lipa_brand.dart';

/// "Hold the card here" visual of the NFC sheet: the Lipa mark (a dot and two
/// arcs, like the contactless sign) with waves spreading around it.
/// When [active] is false (no reader), the mark stays still and faded.
class ScanPulse extends StatefulWidget {
  const ScanPulse({super.key, this.active = true});

  final bool active;

  @override
  State<ScanPulse> createState() => _ScanPulseState();
}

class _ScanPulseState extends State<ScanPulse>
    with SingleTickerProviderStateMixin {
  static const _size = 168.0;
  static const _core = 88.0;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  @override
  void initState() {
    super.initState();
    if (widget.active) _controller.repeat();
  }

  @override
  void didUpdateWidget(ScanPulse old) {
    super.didUpdateWidget(old);
    if (widget.active && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.active && _controller.isAnimating) {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return Stack(
            alignment: Alignment.center,
            children: [
              if (widget.active) ...[_wave(t), _wave((t + 0.5) % 1)],
              Transform.scale(
                // A light "breath" of the mark, in step with the waves.
                scale: widget.active
                    ? 1 +
                          0.05 *
                              Curves.easeInOut.transform(1 - (2 * t - 1).abs())
                    : 1,
                child: Container(
                  width: _core,
                  height: _core,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.brandSoft,
                    shape: BoxShape.circle,
                  ),
                  child: Opacity(
                    opacity: widget.active ? 1 : 0.4,
                    child: const LipaMark(size: 56),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// One wave: grows from the core to the full size while fading out.
  Widget _wave(double t) {
    final eased = Curves.easeOut.transform(t);
    final diameter = _core + (_size - _core) * eased;
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.brand.withValues(alpha: 0.5 * (1 - t)),
          width: 2,
        ),
      ),
    );
  }
}
