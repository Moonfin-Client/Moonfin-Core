import 'package:flutter/widgets.dart';

import 'modern_card_transition.dart';

/// Fades cached fullscreen rows without replacing their motion or focus state.
/// The surrounding lazy list owns disposal when a row leaves its cache.
class ModernRowVisibility extends StatelessWidget {
  final bool visible;
  final Duration duration;
  final Widget child;

  const ModernRowVisibility({
    super.key,
    required this.visible,
    required this.duration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => IgnorePointer(
    ignoring: !visible,
    child: AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: duration,
      curve: modernCardMotionCurve,
      child: child,
    ),
  );
}
