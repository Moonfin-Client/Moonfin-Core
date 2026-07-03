import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Clean text tab bar with an underline under the active tab. Focusable and
/// d-pad friendly: tabs select on press, left/right move focus between tabs, and
/// left from the first tab calls [onExitLeft] (e.g. back to the hero actions).
class DetailsTabBar extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final FocusNode Function(int index) focusNodeFor;
  final VoidCallback? onExitLeft;
  final VoidCallback? onExitUp;
  final void Function(int index)? onNavigateDown;

  const DetailsTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.focusNodeFor,
    this.onExitLeft,
    this.onExitUp,
    this.onNavigateDown,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _DetailsTabItem(
                label: labels[i],
                isSelected: selectedIndex == i,
                focusNode: focusNodeFor(i),
                onSelect: () => onSelect(i),
                onNavigateDown: onNavigateDown != null ? () => onNavigateDown!(i) : null,
                onNavigateUp: onExitUp,
                onNavigateLeft: () {
                  if (i > 0) {
                    focusNodeFor(i - 1).requestFocus();
                    return true;
                  }
                  if (onExitLeft != null) {
                    onExitLeft!();
                    return true;
                  }
                  return false;
                },
                onNavigateRight: () {
                  if (i < labels.length - 1) {
                    focusNodeFor(i + 1).requestFocus();
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _DetailsTabItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final FocusNode focusNode;
  final VoidCallback onSelect;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateUp;
  // True if the left key was consumed; false to let focus traversal handle it.
  final bool Function() onNavigateLeft;
  final VoidCallback onNavigateRight;

  const _DetailsTabItem({
    required this.label,
    required this.isSelected,
    required this.focusNode,
    required this.onSelect,
    this.onNavigateDown,
    this.onNavigateUp,
    required this.onNavigateLeft,
    required this.onNavigateRight,
  });

  @override
  State<_DetailsTabItem> createState() => _DetailsTabItemState();
}

class _DetailsTabItemState extends State<_DetailsTabItem> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _DetailsTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);
      widget.focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    if (mounted) {
      setState(() {
        _isFocused = widget.focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = AppColorScheme.accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);

    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: (node, event) {
        final isDownOrRepeat = event is KeyDownEvent || event is KeyRepeatEvent;
        
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          if (isDownOrRepeat && widget.onNavigateDown != null) {
            widget.onNavigateDown!();
          }
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          if (isDownOrRepeat && widget.onNavigateUp != null) {
            widget.onNavigateUp!();
          }
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          if (isDownOrRepeat) {
            final handled = widget.onNavigateLeft();
            return handled ? KeyEventResult.handled : KeyEventResult.ignored;
          }
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          if (isDownOrRepeat) {
            widget.onNavigateRight();
          }
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.select) {
          // Activate on press only so holding select does not reselect on repeat.
          if (event is KeyDownEvent) {
            widget.onSelect();
          }
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onSelect,
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppRadius.circular(8),
            // Border is ALWAYS present with a fixed width to eliminate visual judder!
            border: Border.all(
              color: _isFocused ? accent : Colors.transparent,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: textTheme.titleSmall?.copyWith(
                    color: (widget.isSelected || _isFocused)
                        ? AppColorScheme.onSurface
                        : muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                // Underline is ALWAYS present, color is visible when selected or focused
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.isSelected || _isFocused)
                        ? accent
                        : Colors.transparent,
                    borderRadius: AppRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
