import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../util/focus/dpad_keys.dart';
import '../../util/focus/input_mode_tracker.dart';
import 'focus/focus_theme.dart';

class FocusableDialogRow extends StatefulWidget {
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final String label;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool autofocus;
  final bool dimmed;
  final Duration longPressDuration;

  const FocusableDialogRow({
    super.key,
    this.icon,
    this.iconBuilder,
    required this.label,
    required this.onTap,
    this.onLongPress,
    this.autofocus = false,
    this.dimmed = false,
    this.longPressDuration = const Duration(milliseconds: 500),
  });

  @override
  State<FocusableDialogRow> createState() => _FocusableDialogRowState();
}

class _FocusableDialogRowState extends State<FocusableDialogRow> {
  final _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isHovered = false;
  Timer? _longPressTimer;
  bool _longPressFired = false;
  bool _selectPressed = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!mounted) return;
      final hasFocus = _focusNode.hasFocus;
      setState(() => _isFocused = hasFocus);
      if (!hasFocus) {
        _longPressTimer?.cancel();
        _longPressTimer = null;
        _longPressFired = false;
        _selectPressed = false;
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_focusNode.hasFocus) return;
        Scrollable.ensureVisible(
          context,
          alignment: 0.5,
          alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // A touch leaves focus parked on the row it hit, which shouldn't read as a
    // pick, so only a remote, a keyboard or the mouse lights a row.
    final showActive = InputModeTracker.of(context) == InputMode.keyboard
        ? _isFocused
        : _isHovered;
    final baseColor = widget.dimmed
      ? AppColorScheme.onSurface.withValues(alpha: 0.5)
      : AppColorScheme.onSurface.withValues(alpha: 0.8);
    final color = showActive ? FocusTheme.solidFocusForeground : baseColor;

    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) {
          return KeyEventResult.ignored;
        }

        if (event is KeyDownEvent) {
          if (_selectPressed) return KeyEventResult.handled;
          _selectPressed = true;
          _longPressFired = false;
          _longPressTimer?.cancel();
          _longPressTimer = Timer(widget.longPressDuration, () {
            if (!mounted || !_focusNode.hasFocus) return;
            _longPressFired = true;
            (widget.onLongPress ?? widget.onTap).call();
          });
          return KeyEventResult.handled;
        }

        if (event is KeyRepeatEvent) {
          return KeyEventResult.handled;
        }

        if (event is KeyUpEvent) {
          if (!_selectPressed) {
            return KeyEventResult.handled;
          }
          _selectPressed = false;
          _longPressTimer?.cancel();
          _longPressTimer = null;
          final triggered = _longPressFired;
          _longPressFired = false;
          if (!triggered) {
            widget.onTap();
          }
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          onLongPress: widget.onLongPress ?? widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              width: double.infinity,
              decoration: FocusTheme.solidFocusDecoration(active: showActive),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: Row(
                children: [
                  if (widget.icon != null || widget.iconBuilder != null) ...[
                    widget.iconBuilder != null
                        ? widget.iconBuilder!(20, color)
                        : Icon(widget.icon, size: 20, color: color),
                    const SizedBox(width: 16),
                  ],
                  Expanded(
                    child: Text(
                      widget.label,
                      style: TextStyle(fontSize: 16, color: color),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
