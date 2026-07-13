import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/key_event_utils.dart';
import 'focus_theme.dart';

class FocusableWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback? onSelect;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;
  final VoidCallback? onBack;
  final bool autofocus;
  final FocusNode? focusNode;
  final double borderRadius;
  final bool autoScroll;
  final double scrollAlignment;
  final ScrollPositionAlignmentPolicy alignmentPolicy;
  final bool useComfortableZone;
  final bool descendantsAreFocusable;
  final bool disableScale;
  final bool useBackgroundFocus;
  final Color? focusColor;
  final bool enableLongPress;
  final Duration longPressDuration;
  final FocusOnKeyEventCallback? onKeyEvent;
  final String? semanticLabel;
  final bool suppressFocusGlow;

  const FocusableWrapper({
    super.key,
    required this.child,
    this.onSelect,
    this.onLongPress,
    this.onFocusChange,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
    this.onNavigateRight,
    this.onBack,
    this.autofocus = false,
    this.focusNode,
    this.borderRadius = FocusTheme.defaultBorderRadius,
    this.autoScroll = false,
    this.scrollAlignment = 0.5,
    this.alignmentPolicy = ScrollPositionAlignmentPolicy.explicit,
    this.useComfortableZone = false,
    this.descendantsAreFocusable = true,
    this.disableScale = false,
    this.useBackgroundFocus = false,
    this.focusColor,
    this.enableLongPress = false,
    this.longPressDuration = const Duration(milliseconds: 500),
    this.onKeyEvent,
    this.semanticLabel,
    this.suppressFocusGlow = false,
  });

  @override
  State<FocusableWrapper> createState() => _FocusableWrapperState();
}

class _FocusableWrapperState extends State<FocusableWrapper>
    with SingleTickerProviderStateMixin {
  FocusNode? _ownedNode;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _focused = false;
  Timer? _longPressTimer;
  bool _longPressFired = false;

  FocusNode get _node => widget.focusNode ?? (_ownedNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: FocusTheme.animationDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: FocusTheme.scale).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    _scaleController.dispose();
    _ownedNode?.dispose();
    super.dispose();
  }

  void _handleFocusChange(bool hasFocus) {
    if (_focused == hasFocus) return;
    setState(() => _focused = hasFocus);
    if (hasFocus && !widget.disableScale) {
      _scaleController.forward();
    } else {
      _scaleController.reverse();
    }
    if (hasFocus && widget.autoScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollIntoView());
    }
    widget.onFocusChange?.call(hasFocus);
  }

  void _scrollIntoView() {
    if (!mounted) return;
    final ctx = context;
    final renderObject = ctx.findRenderObject();
    if (renderObject == null) return;
    final scrollable = Scrollable.maybeOf(ctx);
    if (scrollable == null) return;

    if (widget.useComfortableZone) {
      final viewport = scrollable.context.findRenderObject();
      if (viewport is! RenderBox || renderObject is! RenderBox) {
        Scrollable.ensureVisible(
          ctx,
          alignment: widget.scrollAlignment,
          alignmentPolicy: widget.alignmentPolicy,
          duration: FocusTheme.animationDuration,
          curve: Curves.easeOut,
        );
        return;
      }
      final viewportSize = viewport.size.height;
      final itemTop = renderObject
          .localToGlobal(Offset.zero, ancestor: viewport)
          .dy;
      final itemBottom = itemTop + renderObject.size.height;
      final lower = viewportSize * 0.2;
      final upper = viewportSize * 0.8;
      if (itemTop >= lower && itemBottom <= upper) return;
    }

    Scrollable.ensureVisible(
      ctx,
      alignment: widget.scrollAlignment,
      alignmentPolicy: widget.alignmentPolicy,
      duration: FocusTheme.animationDuration,
      curve: Curves.easeOut,
    );
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    final override = widget.onKeyEvent?.call(node, event);
    if (override != null && override != KeyEventResult.ignored) return override;

    if (widget.enableLongPress && widget.onSelect != null) {
      if (event is KeyDownEvent && event.logicalKey.isSelectKey) {
        _longPressFired = false;
        _longPressTimer?.cancel();
        _longPressTimer = Timer(widget.longPressDuration, () {
          _longPressFired = true;
          widget.onLongPress?.call();
        });
        return KeyEventResult.handled;
      }
      if (event is KeyUpEvent && event.logicalKey.isSelectKey) {
        _longPressTimer?.cancel();
        _longPressTimer = null;
        if (!_longPressFired) {
          widget.onSelect!();
        }
        _longPressFired = false;
        return KeyEventResult.handled;
      }
    }

    if (widget.onBack != null) {
      final r = handleBackKeyAction(event, widget.onBack!);
      if (r != KeyEventResult.ignored) return r;
    }

    final dpad = dpadKeyHandler(
      onUp: widget.onNavigateUp,
      onDown: widget.onNavigateDown,
      onLeft: widget.onNavigateLeft,
      onRight: widget.onNavigateRight,
      onSelect: (!widget.enableLongPress) ? widget.onSelect : null,
    );
    return dpad(node, event);
  }

  void _handleTap() {
    if (widget.onSelect == null) return;
    widget.onSelect!();
  }

  void _handleLongPress() {
    if (widget.onLongPress == null) return;
    widget.onLongPress!();
  }

  @override
  Widget build(BuildContext context) {
    final color = FocusTheme.resolveColor(context, widget.focusColor);
    final decoration = widget.useBackgroundFocus
        ? FocusTheme.focusDecoration(
            isFocused: _focused,
            radius: widget.borderRadius,
            backgroundColor: _focused
                ? color.withValues(alpha: 0.18)
                : null,
            suppressFocusGlow: widget.suppressFocusGlow,
          )
        : FocusTheme.focusDecoration(
            isFocused: _focused,
            radius: widget.borderRadius,
            color: null,
            suppressFocusGlow: widget.suppressFocusGlow,
          );

    // Keep the child inside a stable Stack whether or not it is focused, and
    // only add or remove the border overlay. Rebuilding the Stack around the
    // child on every focus change would give the child a fresh element and
    // restart things like image fade-ins each time it gains or loses focus.
    final borders = ThemeRegistry.active.borders;
    final effectiveRadius = AppColorScheme.isPixel ? 0.0 : widget.borderRadius;
    final borderWidth = FocusTheme.borderWidth;
    final showOverlayBorder = _focused && !widget.useBackgroundFocus;
    final childWithOverlay = Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        widget.child,
        if (showOverlayBorder)
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppRadius.circular(effectiveRadius),
                  border: Border.fromBorderSide(
                    borders.focusBorder.copyWith(
                      color: color,
                      width: borderWidth,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );

    Widget content = AnimatedContainer(
      duration: FocusTheme.animationDuration,
      curve: Curves.easeOut,
      decoration: decoration,
      child: childWithOverlay,
    );

    if (!widget.disableScale) {
      content = ScaleTransition(scale: _scaleAnimation, child: content);
    }

    if (widget.semanticLabel != null) {
      content = Semantics(label: widget.semanticLabel, child: content);
    }

    return Focus(
      focusNode: _node,
      autofocus: widget.autofocus,
      descendantsAreFocusable: widget.descendantsAreFocusable,
      onKeyEvent: _onKeyEvent,
      onFocusChange: _handleFocusChange,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onSelect != null ? _handleTap : null,
        onLongPress: widget.onLongPress != null ? _handleLongPress : null,
        onSecondaryTap: widget.onLongPress != null ? _handleLongPress : null,
        child: content,
      ),
    );
  }
}
