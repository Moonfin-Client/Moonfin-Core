import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/focus/focus_scroll.dart';
import '../../mixins/focus_state_mixin.dart';

/// A tappable pill for a genre, network or keyword, which leads into Seerr
/// browse filtered by it.
class SeerrBrowseChip extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color? borderColor;
  final Color labelColor;
  final bool dense;
  final FocusNode? focusNode;

  /// Handed the arrow key when moving off the chip would leave the block.
  /// Anything unhandled falls through to the usual traversal.
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  const SeerrBrowseChip({
    super.key,
    required this.label,
    required this.onTap,
    this.color = Colors.white12,
    this.borderColor,
    this.labelColor = Colors.white,
    this.dense = false,
    this.focusNode,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<SeerrBrowseChip> createState() => _SeerrBrowseChipState();
}

class _SeerrBrowseChipState extends State<SeerrBrowseChip>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final hPad = widget.dense ? 8.0 : 10.0;
    final vPad = widget.dense ? 4.0 : 6.0;
    final borderRadius = AppRadius.circular(999);
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (focused) {
        setFocused(focused);
        if (focused && mounted) scrollFocusIntoView(context);
      },
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.gameButtonA) {
          widget.onTap();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
            widget.onNavigateUp != null) {
          widget.onNavigateUp!();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
            widget.onNavigateDown != null) {
          widget.onNavigateDown!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: showFocusBorder ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: borderRadius,
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: showFocusBorder
                        ? focusColor
                        : (widget.borderColor ?? Colors.transparent),
                    width: showFocusBorder ? 2 : 1,
                  ),
                ),
              ),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.dense ? 11 : 12,
                  color: widget.labelColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
