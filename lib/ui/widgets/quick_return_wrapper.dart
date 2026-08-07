import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import '../navigation/route_lifecycle_observer.dart';
import 'overlay_sheet.dart';

const _kScrolledAwayThreshold = 20.0;

/// Sends a scrolled screen back to its start.
///
/// On TV the remote's Back key does it, through [InlineBackInterceptor], and
/// only once the screen has actually been scrolled. Everywhere else a floating
/// button fades in over the lower right corner.
///
/// Wrap the scrolling body, not the whole screen, so the button lands above
/// any bottom chrome the screen draws rather than on top of it.
///
/// A screen with one scroll view hands over its [scrollController] and lets
/// this drive it. A screen where the start means more than an offset, like the
/// home rows where focus also has to come back up, reports its own state
/// through [isAtStart] and does the returning itself in [onReturn].
class QuickReturnWrapper extends StatefulWidget {
  const QuickReturnWrapper({
    super.key,
    required this.child,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.topFocusNode,
    this.isAtStart,
    this.onReturn,
  }) : assert(
         scrollController != null || isAtStart != null,
         'Give it a controller to watch or a notifier telling it where it is.',
       );

  final Widget child;
  final ScrollController? scrollController;
  final Axis scrollDirection;

  /// Focused after the scroll finishes, so a remote carries on from the first
  /// card rather than from wherever the old focus scrolled away to.
  final FocusNode? topFocusNode;

  /// Overrides the reading taken from [scrollController] for screens that
  /// count more than the offset.
  final ValueListenable<bool>? isAtStart;

  /// Runs after the scroll, for whatever returning to the start means beyond
  /// moving the offset.
  final VoidCallback? onReturn;

  @override
  State<QuickReturnWrapper> createState() => _QuickReturnWrapperState();
}

class _QuickReturnWrapperState extends State<QuickReturnWrapper>
    with RouteAware {
  bool _isScrolledAway = false;
  bool _interceptorRegistered = false;
  bool _routeIsOnTop = true;
  ModalRoute<dynamic>? _observedRoute;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_updateScrollState);
    widget.isAtStart?.addListener(_updateScrollState);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollState());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  @override
  void didUpdateWidget(QuickReturnWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_updateScrollState);
      widget.scrollController?.addListener(_updateScrollState);
      _updateScrollState();
    }
    if (oldWidget.isAtStart != widget.isAtStart) {
      oldWidget.isAtStart?.removeListener(_updateScrollState);
      widget.isAtStart?.addListener(_updateScrollState);
      _updateScrollState();
    }
  }

  @override
  void dispose() {
    _unregisterInterceptor();
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    widget.scrollController?.removeListener(_updateScrollState);
    widget.isAtStart?.removeListener(_updateScrollState);
    super.dispose();
  }

  // The handler sits on a stack the whole app reads, so a screen that is no
  // longer on top has to give it up. Otherwise Back on whatever was pushed
  // over this screen scrolls this one instead of going anywhere.
  @override
  void didPushNext() {
    _routeIsOnTop = false;
    _syncInterceptor();
  }

  @override
  void didPopNext() {
    _routeIsOnTop = true;
    _syncInterceptor();
  }

  void _syncInterceptor() {
    final wanted = PlatformDetection.isTV && _isScrolledAway && _routeIsOnTop;
    if (wanted && !_interceptorRegistered) {
      InlineBackInterceptor.push(_returnToStart);
      _interceptorRegistered = true;
    } else if (!wanted) {
      _unregisterInterceptor();
    }
  }

  void _unregisterInterceptor() {
    if (!_interceptorRegistered) return;
    InlineBackInterceptor.remove(_returnToStart);
    _interceptorRegistered = false;
  }

  void _updateScrollState() {
    if (!mounted) return;
    final notifier = widget.isAtStart;
    final isAway = notifier != null
        ? !notifier.value
        : _offset > _kScrolledAwayThreshold;
    if (isAway != _isScrolledAway) {
      setState(() => _isScrolledAway = isAway);
    }
    _syncInterceptor();
  }

  /// Zero unless exactly one scroll view is attached. Two share the controller
  /// for a frame while a grid is swapped out, and reading the offset then
  /// throws rather than returning either one.
  double get _offset {
    final controller = widget.scrollController;
    if (controller == null || controller.positions.length != 1) return 0;
    final position = controller.position;
    return position.hasPixels ? position.pixels : 0;
  }

  void _returnToStart() {
    final controller = widget.scrollController;
    if (controller != null && controller.hasClients) {
      controller.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
    widget.topFocusNode?.requestFocus();
    widget.onReturn?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV) return widget.child;

    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        Positioned(
          right: 24,
          bottom: 24,
          child: SafeArea(
            child: AnimatedOpacity(
              opacity: _isScrolledAway ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              child: AnimatedScale(
                scale: _isScrolledAway ? 1.0 : 0.8,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                child: IgnorePointer(
                  ignoring: !_isScrolledAway,
                  child: ExcludeFocus(
                    excluding: !_isScrolledAway,
                    child: _QuickReturnButton(
                      onPressed: _returnToStart,
                      scrollDirection: widget.scrollDirection,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickReturnButton extends StatefulWidget {
  const _QuickReturnButton({
    required this.onPressed,
    required this.scrollDirection,
  });

  final VoidCallback onPressed;
  final Axis scrollDirection;

  @override
  State<_QuickReturnButton> createState() => _QuickReturnButtonState();
}

class _QuickReturnButtonState extends State<_QuickReturnButton> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accent = AppColorScheme.accent;
    final isHorizontal = widget.scrollDirection == Axis.horizontal;
    final isActive = _hovered || _focused;

    return Tooltip(
      message: isHorizontal ? l10n.scrollLeft : l10n.scrollToTop,
      child: Semantics(
        button: true,
        label: isHorizontal ? l10n.scrollLeft : l10n.scrollToTop,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          cursor: SystemMouseCursors.click,
          // The button floats over whatever the screen draws, which isn't
          // always Material, so it brings its own for InkResponse to ink on.
          child: Material(
            type: MaterialType.transparency,
            child: InkResponse(
              onTap: widget.onPressed,
              onFocusChange: (focused) => setState(() => _focused = focused),
              radius: 24,
              customBorder: const CircleBorder(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOutCubic,
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? accent : Colors.transparent,
                  border: Border.all(color: accent, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isActive ? 0.4 : 0.25,
                      ),
                      blurRadius: isActive ? 12 : 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  isHorizontal
                      ? Icons.arrow_back_rounded
                      : Icons.arrow_upward_rounded,
                  color: isActive ? AppColorScheme.onAccent : accent,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
