import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../widgets/seerr/seerr_status_dot.dart';
import '../shared/immersive_segmented_selector.dart';

class ImmersiveSeasonSelector extends StatefulWidget {
  final List<int> seasonNumbers;
  final int selectedSeasonNumber;
  final String Function(int seasonNumber) labelBuilder;
  final int? Function(int seasonNumber)? statusBuilder;
  final ValueChanged<int> onSeasonActivated;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;
  final bool allowLeftEdgeExit;
  final bool visible;

  const ImmersiveSeasonSelector({
    super.key,
    required this.seasonNumbers,
    required this.selectedSeasonNumber,
    required this.labelBuilder,
    required this.onSeasonActivated,
    required this.onNavigateUp,
    required this.onNavigateDown,
    required this.allowLeftEdgeExit,
    required this.visible,
    this.statusBuilder,
  });

  @override
  State<ImmersiveSeasonSelector> createState() =>
      ImmersiveSeasonSelectorState();
}

class ImmersiveSeasonSelectorState extends State<ImmersiveSeasonSelector>
    with SingleTickerProviderStateMixin {
  static const Duration _showDuration = Duration(milliseconds: 240);
  static const Duration _hideDuration = Duration(milliseconds: 160);

  static const double _phoneMenuWidth = 200;
  static const double _phoneMenuPadding = 8;
  static const double _phoneMenuItemHeight = 44;
  static const double _phoneMenuRadius = 24;

  final GlobalKey<ImmersiveSegmentedSelectorState<int>> _selectorKey =
      GlobalKey<ImmersiveSegmentedSelectorState<int>>();

  final GlobalKey _phoneTriggerKey = GlobalKey();

  final FocusNode _focusBoundaryNode = FocusNode(
    debugLabel: 'immersive_season_selector_boundary',
  );

  late final AnimationController _visibilityController;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _translateAnimation;

  bool _focused = false;
  bool _hovered = false;
  bool _phoneMenuOpen = false;

  bool get _selectorFocusable =>
      widget.visible && widget.seasonNumbers.length > 1;

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return size.shortestSide < 600;
  }

  bool get canFocusSelectedSeason =>
      _selectorFocusable && _focusBoundaryNode.canRequestFocus;

  @override
  void initState() {
    super.initState();

    _visibilityController = AnimationController(
      vsync: this,
      duration: _showDuration,
      reverseDuration: _hideDuration,
      value: widget.visible ? 1.0 : 0.0,
    );

    final showCurve = CurvedAnimation(
      parent: _visibilityController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _visibilityController,
        curve: const Interval(0, 0.72, curve: Curves.easeOut),
        reverseCurve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.985, end: 1).animate(showCurve);

    _translateAnimation = Tween<double>(begin: 5, end: 0).animate(showCurve);
  }

  @override
  void didUpdateWidget(covariant ImmersiveSeasonSelector oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.visible == widget.visible) {
      return;
    }

    if (widget.visible) {
      _visibilityController.forward();
    } else {
      if (_phoneMenuOpen) {
        Navigator.of(context, rootNavigator: true).maybePop();
      }

      _visibilityController.reverse();
    }
  }

  void requestFocusAtSeason(int seasonNumber) {
    if (!_selectorFocusable) {
      return;
    }

    if (_isCompactMobile(context)) {
      _focusBoundaryNode.requestFocus();
      return;
    }

    _selectorKey.currentState?.requestFocusAt(seasonNumber);
  }

  Widget? _buildStatusIndicator(int seasonNumber) {
    final status = widget.statusBuilder?.call(seasonNumber);

    if (status == null ||
        status == SeerrMediaStatus.available ||
        !SeerrMediaStatus.hasDot(status)) {
      return null;
    }

    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: seerrStatusColor(status),
        shape: BoxShape.circle,
      ),
    );
  }

  Future<void> _showPhoneMenu() async {
    if (!_selectorFocusable || _phoneMenuOpen) {
      return;
    }

    final triggerContext = _phoneTriggerKey.currentContext;

    if (triggerContext == null) {
      return;
    }

    final triggerBox = triggerContext.findRenderObject() as RenderBox?;

    final overlay =
        Overlay.of(context, rootOverlay: true).context.findRenderObject()
            as RenderBox?;

    if (triggerBox == null ||
        overlay == null ||
        !triggerBox.hasSize ||
        !overlay.hasSize) {
      return;
    }

    final triggerTopLeft = triggerBox.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );

    final triggerRect = triggerTopLeft & triggerBox.size;

    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;

    final desiredHeight =
        widget.seasonNumbers.length * _phoneMenuItemHeight +
        (_phoneMenuPadding * 2);

    final maxMenuHeight = (screenSize.height * 0.68).clamp(160.0, 420.0);

    final menuHeight = desiredHeight.clamp(0.0, maxMenuHeight);

    const screenMargin = 12.0;
    const triggerGap = 4.0;

    final minTop = mediaQuery.padding.top + screenMargin;

    final maxBottom =
        screenSize.height - mediaQuery.padding.bottom - screenMargin;

    final availableBelow = maxBottom - triggerRect.bottom - triggerGap;

    final availableAbove = triggerRect.top - minTop - triggerGap;

    final openBelow =
        availableBelow >= menuHeight || availableBelow >= availableAbove;

    double top;

    if (openBelow) {
      top = triggerRect.bottom + triggerGap;
    } else {
      top = triggerRect.top - menuHeight - triggerGap;
    }

    top = top.clamp(
      minTop,
      (maxBottom - menuHeight).clamp(minTop, double.infinity),
    );

    var left = triggerRect.left;

    left = left.clamp(
      screenMargin,
      (screenSize.width - _phoneMenuWidth - screenMargin).clamp(
        screenMargin,
        double.infinity,
      ),
    );

    _phoneMenuOpen = true;

    final selected = await showGeneralDialog<int>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.12),
      transitionDuration: const Duration(milliseconds: 180),
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return Stack(
          children: [
            Positioned(
              left: left,
              top: top,
              width: _phoneMenuWidth,
              height: menuHeight,
              child: _PhoneSeasonMenu(
                seasonNumbers: widget.seasonNumbers,
                selectedSeasonNumber: widget.selectedSeasonNumber,
                labelBuilder: widget.labelBuilder,
                statusBuilder: _buildStatusIndicator,
                onSelected: (seasonNumber) {
                  Navigator.of(
                    dialogContext,
                    rootNavigator: true,
                  ).pop(seasonNumber);
                },
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        final alignment = openBelow ? Alignment.topLeft : Alignment.bottomLeft;

        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.94, end: 1).animate(curved),
            alignment: alignment,
            child: child,
          ),
        );
      },
    );

    _phoneMenuOpen = false;

    if (!mounted || selected == null) {
      return;
    }

    widget.onSeasonActivated(selected);
  }

  KeyEventResult _handlePhoneKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    if (event is KeyDownEvent &&
        (key == LogicalKeyboardKey.enter ||
            key == LogicalKeyboardKey.select ||
            key == LogicalKeyboardKey.space)) {
      _showPhoneMenu();

      return KeyEventResult.handled;
    }

    if (_phoneMenuOpen) {
      return KeyEventResult.ignored;
    }

    if (key == LogicalKeyboardKey.arrowUp) {
      final callback = widget.onNavigateUp;

      if (callback == null) {
        return KeyEventResult.ignored;
      }

      return callback() ? KeyEventResult.handled : KeyEventResult.ignored;
    }

    if (key == LogicalKeyboardKey.arrowDown) {
      final callback = widget.onNavigateDown;

      if (callback == null) {
        return KeyEventResult.ignored;
      }

      return callback() ? KeyEventResult.handled : KeyEventResult.ignored;
    }

    return KeyEventResult.ignored;
  }

  void _setFocused(bool focused) {
    if (!mounted || _focused == focused) {
      return;
    }

    setState(() {
      _focused = focused;
    });
  }

  void _setHovered(bool hovered) {
    if (!mounted || _hovered == hovered) {
      return;
    }

    setState(() {
      _hovered = hovered;
    });
  }

  Widget _buildPhoneTrigger(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    final highlighted = _focused || _hovered;

    final label = widget.labelBuilder(widget.selectedSeasonNumber);

    return KeyedSubtree(
      key: _phoneTriggerKey,
      child: Focus(
        focusNode: _focusBoundaryNode,
        canRequestFocus: _selectorFocusable,
        skipTraversal: !_selectorFocusable,
        onFocusChange: _setFocused,
        onKeyEvent: _handlePhoneKeyEvent,
        child: MouseRegion(
          cursor: _selectorFocusable
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          onEnter: _selectorFocusable ? (_) => _setHovered(true) : null,
          onExit: _selectorFocusable ? (_) => _setHovered(false) : null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _selectorFocusable ? _showPhoneMenu : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOutCubic,
              constraints: const BoxConstraints(minHeight: 44),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_buildStatusIndicator(widget.selectedSeasonNumber)
                      case final statusIndicator?) ...[
                    statusIndicator,
                    const SizedBox(width: 9),
                  ],

                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: foreground.withValues(
                        alpha: highlighted ? 1 : 0.94,
                      ),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),

                  if (widget.seasonNumbers.length > 1) ...[
                    const SizedBox(width: 5),
                    _SeasonChevronIndicator(
                      color: foreground.withValues(alpha: 0.62),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStandardSelector() {
    return Focus(
      focusNode: _focusBoundaryNode,
      canRequestFocus: _selectorFocusable,
      descendantsAreFocusable: _selectorFocusable,
      skipTraversal: !_selectorFocusable,
      child: ImmersiveSegmentedSelector<int>(
        key: _selectorKey,
        values: widget.seasonNumbers,
        selectedValue: widget.selectedSeasonNumber,
        labelBuilder: widget.labelBuilder,
        leadingBuilder: _buildStatusIndicator,
        onValueActivated: widget.onSeasonActivated,
        onNavigateUp: widget.onNavigateUp,
        onNavigateDown: widget.onNavigateDown,
        allowLeftEdgeExit: widget.allowLeftEdgeExit,
        selectOnFocus: true,
      ),
    );
  }

  @override
  void dispose() {
    _focusBoundaryNode.dispose();
    _visibilityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final compactMobile = _isCompactMobile(context);

    return SizedBox(
      height: compactMobile ? 44 : 40,
      child: IgnorePointer(
        ignoring: !widget.visible,
        child: AnimatedBuilder(
          animation: _visibilityController,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.translate(
                offset: Offset(0, _translateAnimation.value),
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  alignment: Alignment.centerLeft,
                  child: child,
                ),
              ),
            );
          },
          child: compactMobile
              ? _buildPhoneTrigger(context)
              : _buildStandardSelector(),
        ),
      ),
    );
  }
}

class _PhoneSeasonMenu extends StatelessWidget {
  final List<int> seasonNumbers;
  final int selectedSeasonNumber;
  final String Function(int seasonNumber) labelBuilder;
  final Widget? Function(int seasonNumber) statusBuilder;
  final ValueChanged<int> onSelected;

  const _PhoneSeasonMenu({
    required this.seasonNumbers,
    required this.selectedSeasonNumber,
    required this.labelBuilder,
    required this.statusBuilder,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.onSurface;

    return Material(
      type: MaterialType.transparency,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          ImmersiveSeasonSelectorState._phoneMenuRadius,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 18,
            sigmaY: 18,
            tileMode: TileMode.clamp,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF17191D).withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(
                ImmersiveSeasonSelectorState._phoneMenuRadius,
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.16),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.34),
                  blurRadius: 30,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(
                ImmersiveSeasonSelectorState._phoneMenuPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final seasonNumber in seasonNumbers)
                    _PhoneSeasonMenuItem(
                      label: labelBuilder(seasonNumber),
                      selected: seasonNumber == selectedSeasonNumber,
                      statusIndicator: statusBuilder(seasonNumber),
                      foreground: foreground,
                      onTap: () {
                        onSelected(seasonNumber);
                      },
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

class _PhoneSeasonMenuItem extends StatefulWidget {
  final String label;
  final bool selected;
  final Widget? statusIndicator;
  final Color foreground;
  final VoidCallback onTap;

  const _PhoneSeasonMenuItem({
    required this.label,
    required this.selected,
    required this.statusIndicator,
    required this.foreground,
    required this.onTap,
  });

  @override
  State<_PhoneSeasonMenuItem> createState() => _PhoneSeasonMenuItemState();
}

class _PhoneSeasonMenuItemState extends State<_PhoneSeasonMenuItem> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (!mounted || _pressed == value) {
      return;
    }

    setState(() {
      _pressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        _setPressed(true);
      },
      onTapCancel: () {
        _setPressed(false);
      },
      onTapUp: (_) {
        _setPressed(false);
      },
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        height: ImmersiveSeasonSelectorState._phoneMenuItemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: 0.12)
              : _pressed
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
              child: Align(
                alignment: Alignment.centerLeft,
                child: widget.statusIndicator ?? const SizedBox.shrink(),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                widget.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: widget.foreground.withValues(
                    alpha: selected ? 1 : 0.92,
                  ),
                  fontSize: 16,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  height: 1,
                ),
              ),
            ),

            const SizedBox(width: 8),

            SizedBox(
              width: 20,
              child: selected
                  ? Icon(
                      Icons.check_rounded,
                      size: 19,
                      color: widget.foreground.withValues(alpha: 0.96),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _SeasonChevronIndicator extends StatelessWidget {
  final Color color;

  const _SeasonChevronIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 22,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -2,
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 17,
              color: color,
            ),
          ),
          Positioned(
            bottom: -2,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 17,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
