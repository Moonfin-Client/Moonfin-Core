import 'package:flutter/material.dart';

import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/input_mode_tracker.dart';
import '../../../util/platform_detection.dart';

/// A tap and d-pad target that hands its builder whether it should look
/// focused, which counts mouse hover off TV.
class NavFocusable extends StatefulWidget {
  const NavFocusable({
    super.key,
    required this.onPressed,
    required this.builder,
    this.focusNode,
    this.semanticLabel,
  });

  final VoidCallback onPressed;
  final Widget Function(BuildContext context, bool focused) builder;
  final FocusNode? focusNode;
  final String? semanticLabel;

  @override
  State<NavFocusable> createState() => _NavFocusableState();
}

class _NavFocusableState extends State<NavFocusable> {
  bool _focused = false;
  bool _hovered = false;

  void _ensureVisible() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_focused) return;
      final box = context.findRenderObject();
      if (box is! RenderBox || !box.attached || !box.hasSize) return;
      Scrollable.ensureVisible(
        context,
        alignment: 0.5,
        duration: const Duration(milliseconds: 180),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final lit =
        InputModeTracker.showFocusVisuals(context, _focused) ||
        (_hovered && !PlatformDetection.isTV);
    return Semantics(
      button: true,
      label: widget.semanticLabel,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: (focused) {
            setState(() => _focused = focused);
            if (focused) _ensureVisible();
          },
          onKeyEvent: (node, event) {
            if (!isActivateKey(event)) return KeyEventResult.ignored;
            widget.onPressed();
            return KeyEventResult.handled;
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onPressed,
            child: widget.builder(context, lit),
          ),
        ),
      ),
    );
  }
}
