import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'focus_theme.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../mixins/focus_state_mixin.dart';

enum ToolbarButtonVariant {
  /// Background fills white when focused; icon inverts to black.
  invert,
  /// Translucent background; icon stays white. Optional scale-on-focus.
  translucent,
}

/// Square icon button that participates in dpad focus traversal,
/// activates on select/enter key events, and renders a focus border.
/// Replaces several near-identical screen-private toolbar buttons.
class FocusableToolbarButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;
  final double size;
  final double iconSize;
  final ToolbarButtonVariant variant;
  /// Border color when focused. Defaults to the user's preferred focus color.
  final Color? accentColor;
  /// Alpha applied to the unfocused icon color in the [invert] variant.
  final int unfocusedIconAlpha;
  /// Multiplicative scale applied while focused. 1.0 disables scaling.
  final double scaleOnFocus;
  final FocusNode? focusNode;
  final VoidCallback? onUpKey;

  /// When false the button dims and ignores presses but still takes focus, so
  /// D-pad focus isn't lost when the button disables itself on press.
  final bool enabled;

  const FocusableToolbarButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.tooltip,
    this.size = 42,
    this.iconSize = 24,
    this.variant = ToolbarButtonVariant.invert,
    this.accentColor,
    this.unfocusedIconAlpha = 179,
    this.scaleOnFocus = 1.0,
    this.focusNode,
    this.onUpKey,
    this.enabled = true,
  });

  @override
  State<FocusableToolbarButton> createState() => _FocusableToolbarButtonState();
}

class _FocusableToolbarButtonState extends State<FocusableToolbarButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final focusColor = widget.accentColor ?? this.focusColor;

    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: widget.size,
      height: widget.size,
      decoration: FocusTheme.focusDecoration(
        isFocused: showFocusBorder,
        radius: 6,
        color: focusColor,
        backgroundColor: _backgroundColor(),
        suppressFocusGlow: ThemeRegistry.active.id == ThemeRegistry.neonPulseId,
      ),
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: _iconColor(),
      ),
    );

    if (widget.scaleOnFocus != 1.0) {
      content = AnimatedScale(
        scale: showFocusBorder ? widget.scaleOnFocus : 1.0,
        duration: const Duration(milliseconds: 120),
        child: content,
      );
    }

    Widget core = MouseRegion(
      cursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (event.isActionable && event.logicalKey.isUpKey && widget.onUpKey != null) {
            widget.onUpKey!();
            return KeyEventResult.handled;
          }
          if (isActivateKey(event)) {
            if (widget.enabled) widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.enabled ? widget.onTap : null,
          child: content,
        ),
      ),
    );

    if (widget.tooltip != null) {
      core = Tooltip(message: widget.tooltip!, child: core);
    }
    // The Semantics node is always in the tree (adding nothing while enabled)
    // so toggling [enabled] doesn't change the tree shape and drop the
    // button's focus.
    return Semantics(
      button: widget.enabled ? null : true,
      enabled: widget.enabled ? null : false,
      child: core,
    );
  }

  Color _backgroundColor() {
    switch (widget.variant) {
      case ToolbarButtonVariant.invert:
        return focused ? AppColorScheme.onSurface : Colors.transparent;
      case ToolbarButtonVariant.translucent:
        return AppColorScheme.onSurface.withAlpha(focused ? 36 : 20);
    }
  }

  Color _iconColor() {
    switch (widget.variant) {
      case ToolbarButtonVariant.invert:
        return focused
            ? (widget.enabled ? AppColors.black : AppColors.black.withAlpha(97))
            : AppColorScheme.onSurface.withAlpha(
                widget.enabled
                    ? widget.unfocusedIconAlpha
                    : widget.unfocusedIconAlpha ~/ 2,
              );
      case ToolbarButtonVariant.translucent:
        return AppColorScheme.onSurface;
    }
  }
}
