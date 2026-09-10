import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../util/idiom/glass_capability.dart';

/// Ceiling on the press multiplier, so a small target doesn't balloon.
const _kMaxScale = 1.3;

/// Grows [child] while a pointer is down on it and settles back on release,
/// the way iOS 26 glass inflates under a finger.
///
/// The growth is a fixed number of logical pixels on the longest side rather
/// than a flat multiplier, so a small icon and a wide pill both gain the same
/// visible amount and neither looks out of proportion.
///
/// Pointer events only, so a remote's select key never triggers it, and it
/// sits under the tap detector at each call site rather than replacing it.
/// Inert when the glass look is off or the platform asks for reduced motion.
class GlassPressScale extends StatefulWidget {
  const GlassPressScale({
    super.key,
    required this.child,
    this.growth = 17.0,
  });

  final Widget child;

  /// Logical pixels the longest side gains while pressed. 0 disables the
  /// effect, for surfaces that carry their own press response.
  final double growth;

  @override
  State<GlassPressScale> createState() => _GlassPressScaleState();
}

class _GlassPressScaleState extends State<GlassPressScale> {
  double _scale = 1.0;

  /// Measured at press rather than in build, where the box has no size yet.
  double _pressedScale() {
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.hasSize) return 1.0;
    final longest = math.max(box.size.width, box.size.height);
    if (longest <= 0) return 1.0;
    final grown = (longest + widget.growth) / longest;
    return grown.clamp(1.0, _kMaxScale);
  }

  void _press() {
    final scale = _pressedScale();
    if (_scale == scale) return;
    setState(() => _scale = scale);
  }

  void _release() {
    if (_scale == 1.0) return;
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    // Aspect-scoped so a resize or a rotation doesn't rebuild every button.
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (widget.growth == 0 ||
        reduceMotion ||
        !GlassCapability.glassLookActive) {
      return widget.child;
    }
    final pressed = _scale != 1.0;
    return Listener(
      // Translucent so a child that's pure decoration still presses, without
      // taking the event from anything underneath.
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _press(),
      onPointerUp: (_) => _release(),
      onPointerCancel: (_) => _release(),
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: pressed ? 110 : 280),
        // easeOutBack dips under the rest size on the way back, the undershoot
        // a spring would give.
        curve: pressed ? Curves.easeOut : Curves.easeOutBack,
        child: widget.child,
      ),
    );
  }
}
