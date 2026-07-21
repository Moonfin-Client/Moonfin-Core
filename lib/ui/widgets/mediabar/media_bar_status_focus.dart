import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Keeps the media bar's focus node attached while the bar shows a
/// placeholder (loading spinner or error panel). The home screen still
/// treats those states as part of the bar, so focus handoffs from the rows
/// and toolbar target this node. Without it attached they would silently
/// fail and strand focus below the navbar. Arrow keys route back out through
/// the navigate callbacks and select triggers [onSelect], which lets the
/// error state retry.
class MediaBarStatusFocus extends StatelessWidget {
  final FocusNode? focusNode;
  final bool skipTraversal;
  final VoidCallback? onNavigateUp;
  final Future<void> Function()? onNavigateDown;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onSelect;
  final Widget child;

  const MediaBarStatusFocus({
    super.key,
    required this.child,
    this.focusNode,
    this.skipTraversal = false,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
    this.onSelect,
  });

  KeyEventResult _onKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (onSelect != null &&
        (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter)) {
      onSelect!();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp) {
      onNavigateUp?.call();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      unawaited(onNavigateDown?.call());
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft) {
      onNavigateLeft?.call();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowRight) {
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      skipTraversal: skipTraversal,
      onKeyEvent: (node, event) => _onKeyEvent(event),
      child: Builder(
        builder: (context) {
          final focused = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(16),
              border: Border.all(
                color: focused ? AppColorScheme.accent : Colors.transparent,
                width: 2.5,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
