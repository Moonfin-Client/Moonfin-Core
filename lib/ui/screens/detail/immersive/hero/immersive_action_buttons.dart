import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImmersiveAction {
  final String label;
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final VoidCallback? onFocused;
  final VoidCallback? onArrowUp;
  final VoidCallback? onArrowDown;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isActive;
  final Color? activeColor;
  final double? progress;

  const ImmersiveAction({
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconBuilder,
    this.onLongPress,
    this.onFocused,
    this.onArrowUp,
    this.onArrowDown,
    this.onArrowLeft,
    this.onArrowRight,
    this.focusNode,
    this.autofocus = false,
    this.isActive = false,
    this.activeColor,
    this.progress,
  });
}

bool _immersiveActionsUsePhoneLayout(BuildContext context) {
  final size = MediaQuery.sizeOf(context);

  return size.height > size.width && size.width < 600;
}

double _immersiveActionScale(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;

  if (width < 700) {
    return (width / 430.0).clamp(0.84, 1.0);
  }

  return (width / 1920.0).clamp(0.90, 1.08);
}

class ImmersiveActionButtons extends StatefulWidget {
  final ImmersiveAction? primaryAction;
  final List<ImmersiveAction> secondaryActions;

  const ImmersiveActionButtons({
    super.key,
    required this.primaryAction,
    required this.secondaryActions,
  });

  @override
  State<ImmersiveActionButtons> createState() => _ImmersiveActionButtonsState();
}

class _ImmersiveActionButtonsState extends State<ImmersiveActionButtons> {
  static const int _maxSecondaryActionsWithoutOverflow = 3;
  static const int _visibleSecondaryActionsWithOverflow = 2;

  final FocusNode _overflowFocusNode = FocusNode(
    debugLabel: 'immersive-actions-overflow',
  );

  bool get _usesOverflow =>
      widget.secondaryActions.length > _maxSecondaryActionsWithoutOverflow;

  List<ImmersiveAction> get _visibleSecondaryActions {
    if (!_usesOverflow) {
      return widget.secondaryActions;
    }

    return widget.secondaryActions
        .take(_visibleSecondaryActionsWithOverflow)
        .toList(growable: false);
  }

  List<ImmersiveAction> get _overflowActions {
    if (!_usesOverflow) {
      return const <ImmersiveAction>[];
    }

    return widget.secondaryActions
        .skip(_visibleSecondaryActionsWithOverflow)
        .toList(growable: false);
  }

  @override
  void dispose() {
    _overflowFocusNode.dispose();

    super.dispose();
  }

  void _focusPrimary() {
    final node = widget.primaryAction?.focusNode;

    if (node != null && node.canRequestFocus) {
      node.requestFocus();
    }
  }

  void _focusSecondary(int index) {
    final actions = _visibleSecondaryActions;

    if (index < 0 || index >= actions.length) {
      return;
    }

    final node = actions[index].focusNode;

    if (node != null && node.canRequestFocus) {
      node.requestFocus();
    }
  }

  void _focusOverflow() {
    if (_overflowFocusNode.canRequestFocus) {
      _overflowFocusNode.requestFocus();
    }
  }

  Future<void> _showOverflowActions(BuildContext context) async {
    final actions = _overflowActions;

    if (actions.isEmpty) {
      return;
    }

    final selectedAction = await showDialog<ImmersiveAction>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.56),
      builder: (context) {
        return _ImmersiveOverflowDialog(actions: actions);
      },
    );

    if (!mounted) {
      return;
    }

    if (selectedAction == null) {
      _focusOverflow();
      return;
    }

    selectedAction.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final primaryAction = widget.primaryAction;
    final visibleSecondaryActions = _visibleSecondaryActions;
    final overflowActions = _overflowActions;

    if (primaryAction == null &&
        visibleSecondaryActions.isEmpty &&
        overflowActions.isEmpty) {
      return const SizedBox.shrink();
    }

    if (_immersiveActionsUsePhoneLayout(context)) {
      return _buildPhoneLayout(
        context,
        primaryAction,
        visibleSecondaryActions,
        overflowActions,
      );
    }

    return _buildStandardLayout(
      context,
      primaryAction,
      visibleSecondaryActions,
      overflowActions,
    );
  }

  Widget _buildPhoneLayout(
    BuildContext context,
    ImmersiveAction? primaryAction,
    List<ImmersiveAction> visibleSecondaryActions,
    List<ImmersiveAction> overflowActions,
  ) {
    final hasSecondary =
        visibleSecondaryActions.isNotEmpty || overflowActions.isNotEmpty;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (primaryAction != null)
            SizedBox(
              width: double.infinity,
              child: _ImmersivePrimaryButton(
                action: primaryAction,
                fullWidth: true,
                onArrowRight: visibleSecondaryActions.isNotEmpty
                    ? () => _focusSecondary(0)
                    : overflowActions.isNotEmpty
                    ? _focusOverflow
                    : primaryAction.onArrowRight,
              ),
            ),

          if (primaryAction != null && hasSecondary) const SizedBox(height: 14),

          if (hasSecondary)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (
                  var index = 0;
                  index < visibleSecondaryActions.length;
                  index++
                ) ...[
                  if (index > 0) const SizedBox(width: 14),

                  _ImmersiveCircleActionButton(
                    action: visibleSecondaryActions[index],
                    compact: true,
                    onArrowLeft: index == 0
                        ? primaryAction != null
                              ? _focusPrimary
                              : visibleSecondaryActions[index].onArrowLeft
                        : () => _focusSecondary(index - 1),
                    onArrowRight: index < visibleSecondaryActions.length - 1
                        ? () => _focusSecondary(index + 1)
                        : overflowActions.isNotEmpty
                        ? _focusOverflow
                        : visibleSecondaryActions[index].onArrowRight,
                  ),
                ],

                if (overflowActions.isNotEmpty) ...[
                  if (visibleSecondaryActions.isNotEmpty)
                    const SizedBox(width: 14),

                  _ImmersiveMoreButton(
                    focusNode: _overflowFocusNode,
                    compact: true,
                    onPressed: () => _showOverflowActions(context),
                    onArrowLeft: visibleSecondaryActions.isNotEmpty
                        ? () => _focusSecondary(
                            visibleSecondaryActions.length - 1,
                          )
                        : primaryAction != null
                        ? _focusPrimary
                        : null,
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildStandardLayout(
    BuildContext context,
    ImmersiveAction? primaryAction,
    List<ImmersiveAction> visibleSecondaryActions,
    List<ImmersiveAction> overflowActions,
  ) {
    final scale = _immersiveActionScale(context);

    final primaryGap = 18.0 * scale;
    final secondaryGap = 12.0 * scale;

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (primaryAction != null)
            _ImmersivePrimaryButton(
              action: primaryAction,
              onArrowRight: visibleSecondaryActions.isNotEmpty
                  ? () => _focusSecondary(0)
                  : overflowActions.isNotEmpty
                  ? _focusOverflow
                  : primaryAction.onArrowRight,
            ),

          if (primaryAction != null &&
              (visibleSecondaryActions.isNotEmpty ||
                  overflowActions.isNotEmpty))
            SizedBox(width: primaryGap),

          for (
            var index = 0;
            index < visibleSecondaryActions.length;
            index++
          ) ...[
            if (index > 0) SizedBox(width: secondaryGap),

            _ImmersiveCircleActionButton(
              action: visibleSecondaryActions[index],
              onArrowLeft: index == 0
                  ? primaryAction != null
                        ? _focusPrimary
                        : visibleSecondaryActions[index].onArrowLeft
                  : () => _focusSecondary(index - 1),
              onArrowRight: index < visibleSecondaryActions.length - 1
                  ? () => _focusSecondary(index + 1)
                  : overflowActions.isNotEmpty
                  ? _focusOverflow
                  : visibleSecondaryActions[index].onArrowRight,
            ),
          ],

          if (overflowActions.isNotEmpty) ...[
            if (visibleSecondaryActions.isNotEmpty)
              SizedBox(width: secondaryGap),

            _ImmersiveMoreButton(
              focusNode: _overflowFocusNode,
              onPressed: () => _showOverflowActions(context),
              onArrowLeft: visibleSecondaryActions.isNotEmpty
                  ? () => _focusSecondary(visibleSecondaryActions.length - 1)
                  : primaryAction != null
                  ? _focusPrimary
                  : null,
            ),
          ],
        ],
      ),
    );
  }
}

class _ImmersivePrimaryButton extends StatefulWidget {
  final ImmersiveAction action;
  final VoidCallback? onArrowRight;
  final bool fullWidth;

  const _ImmersivePrimaryButton({
    required this.action,
    this.onArrowRight,
    this.fullWidth = false,
  });

  @override
  State<_ImmersivePrimaryButton> createState() =>
      _ImmersivePrimaryButtonState();
}

class _ImmersivePrimaryButtonState extends State<_ImmersivePrimaryButton> {
  bool _focused = false;
  bool _hovered = false;

  bool get _highlighted => _focused || _hovered;

  @override
  Widget build(BuildContext context) {
    final action = widget.action;
    final scale = _immersiveActionScale(context);

    final phone = _immersiveActionsUsePhoneLayout(context);

    final progress = action.progress?.clamp(0.0, 1.0).toDouble();

    final showProgress = progress != null && progress > 0 && progress < 1;

    final height = phone ? 54.0 : 62.0 * scale;

    return Focus(
      focusNode: action.focusNode,
      autofocus: action.autofocus,
      onFocusChange: (focused) {
        if (_focused == focused) {
          return;
        }

        setState(() {
          _focused = focused;
        });

        if (focused) {
          action.onFocused?.call();
        }
      },
      onKeyEvent: (_, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          final callback = action.onArrowUp;

          if (callback == null) {
            return KeyEventResult.ignored;
          }

          callback();

          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          final callback = action.onArrowDown;

          if (callback == null) {
            return KeyEventResult.ignored;
          }

          callback();

          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          final callback = action.onArrowLeft;

          if (callback == null) {
            return KeyEventResult.ignored;
          }

          callback();

          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          final callback = widget.onArrowRight;

          if (callback == null) {
            return KeyEventResult.ignored;
          }

          callback();

          return KeyEventResult.handled;
        }

        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.space)) {
          action.onPressed();

          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          if (_hovered) {
            return;
          }

          setState(() {
            _hovered = true;
          });
        },
        onExit: (_) {
          if (!_hovered) {
            return;
          }

          setState(() {
            _hovered = false;
          });
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: action.onPressed,
          onLongPress: action.onLongPress,
          child: AnimatedScale(
            scale: _focused
                ? phone
                      ? 1.015
                      : 1.06
                : _hovered
                ? phone
                      ? 1.01
                      : 1.025
                : 1,
            duration: const Duration(milliseconds: 170),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 170),
              curve: Curves.easeOutCubic,
              width: widget.fullWidth ? double.infinity : null,
              height: height,
              constraints: widget.fullWidth
                  ? const BoxConstraints()
                  : BoxConstraints(minWidth: 0, maxWidth: 270.0 * scale),
              padding: EdgeInsets.symmetric(
                horizontal: phone ? 20 : 23.0 * scale,
              ),
              decoration: BoxDecoration(
                color: _highlighted
                    ? Colors.white
                    : Colors.black.withValues(alpha: phone ? 0.40 : 0.34),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: _highlighted
                      ? Colors.white
                      : Colors.white.withValues(alpha: phone ? 0.24 : 0.20),
                  width: 1,
                ),
                boxShadow: _focused
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.42),
                          blurRadius: phone ? 18 : 26.0 * scale,
                          offset: Offset(0, phone ? 5 : 8.0 * scale),
                        ),
                      ]
                    : null,
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: widget.fullWidth
                          ? MainAxisSize.max
                          : MainAxisSize.min,
                      mainAxisAlignment: widget.fullWidth
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        _ActionIcon(
                          action: action,
                          size: phone ? 20 : 21.0 * scale,
                          color: _highlighted ? Colors.black : Colors.white,
                        ),
                        SizedBox(width: phone ? 10 : 12.0 * scale),
                        Flexible(
                          child: Text(
                            action.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: _highlighted ? Colors.black : Colors.white,
                              fontSize: phone ? 15.5 : 16.5 * scale,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (showProgress)
                    Positioned(
                      left: phone ? 18 : 20.0 * scale,
                      right: phone ? 18 : 20.0 * scale,
                      bottom: phone ? 7 : 8.0 * scale,
                      height: phone ? 2 : (2.0 * scale).clamp(2.0, 3.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final progressWidth =
                                constraints.maxWidth * progress;

                            final backgroundColor = _highlighted
                                ? Colors.black.withValues(alpha: 0.10)
                                : Colors.white.withValues(alpha: 0.18);

                            final progressColor = _highlighted
                                ? Colors.black.withValues(alpha: 0.68)
                                : Colors.white.withValues(alpha: 0.72);

                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                ColoredBox(color: backgroundColor),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: progressWidth,
                                    child: ColoredBox(color: progressColor),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
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

class _ImmersiveCircleActionButton extends StatefulWidget {
  final ImmersiveAction action;
  final VoidCallback? onArrowLeft;
  final VoidCallback? onArrowRight;
  final bool compact;

  const _ImmersiveCircleActionButton({
    required this.action,
    this.onArrowLeft,
    this.onArrowRight,
    this.compact = false,
  });

  @override
  State<_ImmersiveCircleActionButton> createState() =>
      _ImmersiveCircleActionButtonState();
}

class _ImmersiveCircleActionButtonState
    extends State<_ImmersiveCircleActionButton> {
  Timer? _tooltipTimer;

  bool _focused = false;
  bool _hovered = false;
  bool _tooltipVisible = false;

  bool get _highlighted => _focused || _hovered;

  void _scheduleTooltip({required Duration delay}) {
    _tooltipTimer?.cancel();

    _tooltipTimer = Timer(delay, () {
      if (!mounted || (!_focused && !_hovered)) {
        return;
      }

      if (_tooltipVisible) {
        return;
      }

      setState(() {
        _tooltipVisible = true;
      });
    });
  }

  void _hideTooltip() {
    _tooltipTimer?.cancel();
    _tooltipTimer = null;

    if (!_tooltipVisible || !mounted) {
      return;
    }

    setState(() {
      _tooltipVisible = false;
    });
  }

  void _handleFocusChanged(bool focused) {
    if (_focused == focused) {
      return;
    }

    setState(() {
      _focused = focused;
    });

    if (focused) {
      widget.action.onFocused?.call();

      _scheduleTooltip(delay: const Duration(milliseconds: 80));

      return;
    }

    if (!_hovered) {
      _hideTooltip();
    }
  }

  void _handlePointerEnter() {
    if (!_hovered) {
      setState(() {
        _hovered = true;
      });
    }

    if (!_focused) {
      _scheduleTooltip(delay: const Duration(milliseconds: 350));
    }
  }

  void _handlePointerExit() {
    if (_hovered) {
      setState(() {
        _hovered = false;
      });
    }

    if (!_focused) {
      _hideTooltip();
    }
  }

  @override
  void dispose() {
    _tooltipTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final action = widget.action;

    final activeColor = action.activeColor ?? Colors.white;

    final scale = _immersiveActionScale(context);

    final size = widget.compact ? 52.0 : 64.0 * scale;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Focus(
            focusNode: action.focusNode,
            autofocus: action.autofocus,
            onFocusChange: _handleFocusChanged,
            onKeyEvent: (_, event) {
              if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                return KeyEventResult.ignored;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                final callback = action.onArrowUp;

                if (callback == null) {
                  return KeyEventResult.ignored;
                }

                callback();

                return KeyEventResult.handled;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                final callback = action.onArrowDown;

                if (callback == null) {
                  return KeyEventResult.ignored;
                }

                callback();

                return KeyEventResult.handled;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                final callback = widget.onArrowLeft;

                if (callback == null) {
                  return KeyEventResult.ignored;
                }

                callback();

                return KeyEventResult.handled;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                final callback = widget.onArrowRight;

                if (callback == null) {
                  return KeyEventResult.ignored;
                }

                callback();

                return KeyEventResult.handled;
              }

              if (event is KeyDownEvent &&
                  (event.logicalKey == LogicalKeyboardKey.select ||
                      event.logicalKey == LogicalKeyboardKey.enter ||
                      event.logicalKey == LogicalKeyboardKey.space)) {
                action.onPressed();

                return KeyEventResult.handled;
              }

              return KeyEventResult.ignored;
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => _handlePointerEnter(),
              onExit: (_) => _handlePointerExit(),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: action.onPressed,
                onLongPress: action.onLongPress,
                child: AnimatedScale(
                  scale: _highlighted
                      ? widget.compact
                            ? 1.035
                            : 1.075
                      : 1,
                  duration: const Duration(milliseconds: 160),
                  curve: Curves.easeOutCubic,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    curve: Curves.easeOutCubic,
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: _highlighted
                          ? Colors.white
                          : Colors.black.withValues(
                              alpha: widget.compact ? 0.34 : 0.28,
                            ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _highlighted
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.18),
                        width: 1,
                      ),
                      boxShadow: _highlighted
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.34),
                                blurRadius: widget.compact ? 16 : 22.0 * scale,
                                offset: Offset(
                                  0,
                                  widget.compact ? 5 : 7.0 * scale,
                                ),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: _ActionIcon(
                        action: action,
                        size: widget.compact ? 20 : 22.0 * scale,
                        color: _highlighted
                            ? Colors.black
                            : action.isActive
                            ? activeColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          if (_tooltipVisible)
            Positioned(
              top: size + 8.0 * scale,
              child: _ImmersiveActionTooltip(label: action.label),
            ),
        ],
      ),
    );
  }
}

class _ImmersiveMoreButton extends StatefulWidget {
  final FocusNode focusNode;
  final VoidCallback onPressed;
  final VoidCallback? onArrowLeft;
  final bool compact;

  const _ImmersiveMoreButton({
    required this.focusNode,
    required this.onPressed,
    this.onArrowLeft,
    this.compact = false,
  });

  @override
  State<_ImmersiveMoreButton> createState() => _ImmersiveMoreButtonState();
}

class _ImmersiveMoreButtonState extends State<_ImmersiveMoreButton> {
  Timer? _tooltipTimer;

  bool _focused = false;
  bool _hovered = false;
  bool _tooltipVisible = false;

  bool get _highlighted => _focused || _hovered;

  void _scheduleTooltip({required Duration delay}) {
    _tooltipTimer?.cancel();

    _tooltipTimer = Timer(delay, () {
      if (!mounted || (!_focused && !_hovered)) {
        return;
      }

      if (_tooltipVisible) {
        return;
      }

      setState(() {
        _tooltipVisible = true;
      });
    });
  }

  void _hideTooltip() {
    _tooltipTimer?.cancel();
    _tooltipTimer = null;

    if (!_tooltipVisible || !mounted) {
      return;
    }

    setState(() {
      _tooltipVisible = false;
    });
  }

  void _handleFocusChanged(bool focused) {
    if (_focused == focused) {
      return;
    }

    setState(() {
      _focused = focused;
    });

    if (focused) {
      _scheduleTooltip(delay: const Duration(milliseconds: 80));

      return;
    }

    if (!_hovered) {
      _hideTooltip();
    }
  }

  void _handlePointerEnter() {
    if (!_hovered) {
      setState(() {
        _hovered = true;
      });
    }

    if (!_focused) {
      _scheduleTooltip(delay: const Duration(milliseconds: 350));
    }
  }

  void _handlePointerExit() {
    if (_hovered) {
      setState(() {
        _hovered = false;
      });
    }

    if (!_focused) {
      _hideTooltip();
    }
  }

  @override
  void dispose() {
    _tooltipTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = _immersiveActionScale(context);

    final size = widget.compact ? 52.0 : 64.0 * scale;

    final moreLabel = MaterialLocalizations.of(context).moreButtonTooltip;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Focus(
            focusNode: widget.focusNode,
            onFocusChange: _handleFocusChanged,
            onKeyEvent: (_, event) {
              if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
                return KeyEventResult.ignored;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                final callback = widget.onArrowLeft;

                if (callback == null) {
                  return KeyEventResult.ignored;
                }

                callback();

                return KeyEventResult.handled;
              }

              if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                return KeyEventResult.handled;
              }

              if (event is KeyDownEvent &&
                  (event.logicalKey == LogicalKeyboardKey.select ||
                      event.logicalKey == LogicalKeyboardKey.enter ||
                      event.logicalKey == LogicalKeyboardKey.space)) {
                widget.onPressed();

                return KeyEventResult.handled;
              }

              return KeyEventResult.ignored;
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => _handlePointerEnter(),
              onExit: (_) => _handlePointerExit(),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.onPressed,
                child: AnimatedScale(
                  scale: _highlighted
                      ? widget.compact
                            ? 1.035
                            : 1.075
                      : 1,
                  duration: const Duration(milliseconds: 160),
                  curve: Curves.easeOutCubic,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    curve: Curves.easeOutCubic,
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: _highlighted
                          ? Colors.white
                          : Colors.black.withValues(
                              alpha: widget.compact ? 0.34 : 0.28,
                            ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _highlighted
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.18),
                        width: 1,
                      ),
                      boxShadow: _highlighted
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.34),
                                blurRadius: widget.compact ? 16 : 22.0 * scale,
                                offset: Offset(
                                  0,
                                  widget.compact ? 5 : 7.0 * scale,
                                ),
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      Icons.more_horiz_rounded,
                      size: widget.compact ? 22 : 25.0 * scale,
                      color: _highlighted ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          if (_tooltipVisible)
            Positioned(
              top: size + 8.0 * scale,
              child: _ImmersiveActionTooltip(label: moreLabel),
            ),
        ],
      ),
    );
  }
}

class _ImmersiveActionTooltip extends StatelessWidget {
  final String label;

  const _ImmersiveActionTooltip({required this.label});

  @override
  Widget build(BuildContext context) {
    final scale = _immersiveActionScale(context);

    return IgnorePointer(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, -3 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            constraints: BoxConstraints(maxWidth: 220.0 * scale),
            padding: EdgeInsets.symmetric(
              horizontal: 11.0 * scale,
              vertical: 6.0 * scale,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E).withValues(alpha: 0.96),
              borderRadius: BorderRadius.circular(8.0 * scale),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.30),
                  blurRadius: 12.0 * scale,
                  offset: Offset(0, 4.0 * scale),
                ),
              ],
            ),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0 * scale,
                fontWeight: FontWeight.w600,
                height: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImmersiveOverflowDialog extends StatelessWidget {
  final List<ImmersiveAction> actions;

  const _ImmersiveOverflowDialog({required this.actions});

  @override
  Widget build(BuildContext context) {
    final scale = _immersiveActionScale(context);

    final phone = _immersiveActionsUsePhoneLayout(context);

    return Dialog(
      backgroundColor: const Color(0xFF17181A),
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: phone ? 20 : 48.0 * scale,
        vertical: phone ? 32 : 48.0 * scale,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(phone ? 20 : 22.0 * scale),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: phone ? 0 : 320.0 * scale,
          maxWidth: phone ? 420 : 440.0 * scale,
        ),
        child: Padding(
          padding: EdgeInsets.all(phone ? 10 : 12.0 * scale),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var index = 0; index < actions.length; index++)
                _ImmersiveOverflowActionTile(
                  action: actions[index],
                  autofocus: index == 0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImmersiveOverflowActionTile extends StatefulWidget {
  final ImmersiveAction action;
  final bool autofocus;

  const _ImmersiveOverflowActionTile({
    required this.action,
    this.autofocus = false,
  });

  @override
  State<_ImmersiveOverflowActionTile> createState() =>
      _ImmersiveOverflowActionTileState();
}

class _ImmersiveOverflowActionTileState
    extends State<_ImmersiveOverflowActionTile> {
  bool _focused = false;
  bool _hovered = false;

  bool get _highlighted => _focused || _hovered;

  @override
  Widget build(BuildContext context) {
    final action = widget.action;

    final activeColor = action.activeColor ?? Colors.white;

    final scale = _immersiveActionScale(context);

    final phone = _immersiveActionsUsePhoneLayout(context);

    return Focus(
      autofocus: widget.autofocus,
      onFocusChange: (focused) {
        if (_focused == focused) {
          return;
        }

        setState(() {
          _focused = focused;
        });
      },
      onKeyEvent: (_, event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.space) {
          Navigator.of(context).pop(action);

          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          if (_hovered) {
            return;
          }

          setState(() {
            _hovered = true;
          });
        },
        onExit: (_) {
          if (!_hovered) {
            return;
          }

          setState(() {
            _hovered = false;
          });
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pop(action);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOutCubic,
            width: double.infinity,
            constraints: BoxConstraints(minHeight: phone ? 56 : 58.0 * scale),
            margin: EdgeInsets.symmetric(vertical: phone ? 2 : 2.0 * scale),
            padding: EdgeInsets.symmetric(
              horizontal: phone ? 16 : 18.0 * scale,
              vertical: phone ? 12 : 13.0 * scale,
            ),
            decoration: BoxDecoration(
              color: _highlighted
                  ? Colors.white.withValues(alpha: 0.12)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(phone ? 12 : 12.0 * scale),
            ),
            child: Row(
              children: [
                _ActionIcon(
                  action: action,
                  size: phone ? 21 : 23.0 * scale,
                  color: action.isActive ? activeColor : Colors.white,
                ),
                SizedBox(width: phone ? 13 : 14.0 * scale),
                Expanded(
                  child: Text(
                    action.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: action.isActive ? activeColor : Colors.white,
                      fontSize: phone ? 15 : 15.0 * scale,
                      fontWeight: FontWeight.w600,
                    ),
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

class _ActionIcon extends StatelessWidget {
  final ImmersiveAction action;
  final double size;
  final Color color;

  const _ActionIcon({
    required this.action,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final builder = action.iconBuilder;

    if (builder != null) {
      return builder(size, color);
    }

    final icon = action.icon;

    if (icon == null) {
      return SizedBox.square(dimension: size);
    }

    return Icon(icon, size: size, color: color);
  }
}
