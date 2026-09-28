import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import '../../util/overlay_color_palette.dart';
import 'bottom_nav/bottom_navbar.dart';
import 'download_progress_bar.dart';
import 'left_sidebar.dart';
import 'top_toolbar.dart';

import 'dart:async';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import '../navigation/destinations.dart';
import '../navigation/route_lifecycle_observer.dart';

class NavigationLayout extends StatefulWidget {
  final String? activeRoute;
  final Widget child;
  final bool showBackButton;
  final bool showNavigationChrome;

  /// Keep the top toolbar fixed instead of letting it translate away as the
  /// content scrolls. No effect off-TV, where the toolbar is already fixed.
  final bool pinTopToolbar;

  static bool get allowBottomNavbar =>
      PlatformDetection.useMobileUi && !PlatformDetection.isWeb;

  static List<NavbarPosition> get availableNavbarPositions => <NavbarPosition>[
    NavbarPosition.top,
    NavbarPosition.left,
    if (allowBottomNavbar) NavbarPosition.bottom,
  ];

  static NavbarPosition sanitizeNavbarPosition(NavbarPosition position) {
    if (position == NavbarPosition.bottom && !allowBottomNavbar) {
      return NavbarPosition.top;
    }
    return position;
  }

  static final positionNotifier = ValueNotifier<NavbarPosition?>(
    sanitizeNavbarPosition(
      GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition),
    ),
  );

  /// Focus roots of the navigation chrome, registered by the sidebar and
  /// toolbar while mounted. The route focus observer refuses to land inside
  /// these, so a fresh route waits for content instead of starting the d-pad
  /// in the rail and popping it open before anything has loaded.
  static final Set<FocusNode> chromeFocusRoots = <FocusNode>{};

  static final focusNavbarNotifier = ValueNotifier<VoidCallback?>(null);
  static final focusNavbarAvatarNotifier = ValueNotifier<VoidCallback?>(null);
  static final focusContentFromNavbarNotifier = ValueNotifier<VoidCallback?>(
    null,
  );
  static final focusDetailsPlayButtonNotifier = ValueNotifier<FocusNode?>(null);

  /// Hands focus to the play button a details page registered, and says
  /// whether it took it so the caller can fall back to its own choice.
  static bool focusDetailsPlayButton() {
    final node = focusDetailsPlayButtonNotifier.value;
    if (node == null || node.context == null || !node.canRequestFocus) {
      return false;
    }
    node.requestFocus();
    return true;
  }

  /// True while a media-bar trailer is playing; the toolbar and sidebar fade
  /// out on TV. Focusing chrome cancels the trailer, which fades them back in.
  static final trailerImmersiveNotifier = ValueNotifier<bool>(false);

  /// Hands focus to the navbar and reports whether there was one to take it.
  /// Callers need the answer so they only report a key as handled when focus
  /// really moved.
  static bool focusNavbar() {
    final callback = focusNavbarNotifier.value;

    if (callback == null) {
      return false;
    }

    callback();

    return true;
  }

  const NavigationLayout({
    super.key,
    this.activeRoute,
    required this.child,
    this.showBackButton = false,
    this.showNavigationChrome = true,
    this.pinTopToolbar = false,
  });

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout>
    with WidgetsBindingObserver, RouteAware {
  final _prefs = GetIt.instance<UserPreferences>();
  final _contentFocusNode = FocusNode(debugLabel: 'NavigationContent');
  final _contentKey = GlobalKey(debugLabel: 'navigationLayoutContent');
  final ValueNotifier<double> _toolbarScrollOffset = ValueNotifier<double>(0.0);
  late NavbarPosition _position;
  late BottomNavbarStyle _bottomStyle;
  bool _keyboardVisible = false;

  // Split shrinks while the user scrolls down and comes back on the way up.
  // The flag only flips at the thresholds, so scrolling rebuilds nothing.
  final _bottomMinimized = ValueNotifier<bool>(false);
  bool _userScrolling = false;
  double _scrollTravel = 0;
  ModalRoute<dynamic>? _observedRoute;
  final _playbackManager = GetIt.instance<PlaybackManager>();
  StreamSubscription? _playSub;
  StreamSubscription? _queueSub;

  @override
  void initState() {
    super.initState();
    final storedPosition = _prefs.get(UserPreferences.navbarPosition);
    _position = NavigationLayout.sanitizeNavbarPosition(storedPosition);
    if (_position != storedPosition) {
      _prefs.set(UserPreferences.navbarPosition, _position);
    }
    _bottomStyle = _prefs.get(UserPreferences.bottomNavbarStyle);
    _prefs.addListener(_onPrefsChanged);
    WidgetsBinding.instance.addObserver(this);
    NavigationLayout.positionNotifier.addListener(_onPositionNotified);
    // The top toolbar grows to host the embedded music bar; rebuild so the
    // content inset tracks that height when playback starts or stops.
    _playSub = _playbackManager.state.playingStream.listen((_) {
      if (mounted) setState(() {});
    });
    _queueSub = _playbackManager.queueService.queueChangedStream.listen((_) {
      if (mounted) setState(() {});
    });
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
  void didUpdateWidget(NavigationLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeRoute != widget.activeRoute) _expandBottomBar();
  }

  // Home stays mounted under whatever it pushes, so coming back to it, or
  // leaving it, starts the bar out whole again.
  @override
  void didPushNext() => _expandBottomBar();

  @override
  void didPopNext() => _expandBottomBar();

  void _expandBottomBar() {
    _scrollTravel = 0;
    _bottomMinimized.value = false;
  }

  bool _onBottomScroll(ScrollNotification n) {
    if (_bottomStyle != BottomNavbarStyle.split) return false;
    // Rows of cards scroll sideways and a nested list isn't the page.
    if (n.metrics.axis != Axis.vertical || n.depth > 1) return false;

    // Only a finger moves the bar. A jump back to the top, a D-pad scroll or
    // a row snapping into view shouldn't. A drag starts at the top, so this
    // is noted before the top check below can return.
    if (n is UserScrollNotification) {
      _userScrolling = n.direction != ScrollDirection.idle;
      _scrollTravel = 0;
    }

    final metrics = n.metrics;
    if (metrics.pixels <= metrics.minScrollExtent + 8) {
      _expandBottomBar();
      return false;
    }
    if (n is ScrollUpdateNotification &&
        _userScrolling &&
        metrics.maxScrollExtent > 120) {
      final delta = n.scrollDelta ?? 0;
      if (delta.sign != _scrollTravel.sign) _scrollTravel = 0;
      _scrollTravel += delta;
      if (_scrollTravel > 24 && metrics.pixels > 56) {
        _bottomMinimized.value = true;
      } else if (_scrollTravel < -16) {
        _bottomMinimized.value = false;
      }
    }
    return false;
  }

  @override
  void dispose() {
    if (_observedRoute != null) routeLifecycleObserver.unsubscribe(this);
    _bottomMinimized.dispose();
    _prefs.removeListener(_onPrefsChanged);
    NavigationLayout.positionNotifier.removeListener(_onPositionNotified);
    WidgetsBinding.instance.removeObserver(this);
    _playSub?.cancel();
    _queueSub?.cancel();
    _contentFocusNode.dispose();
    _toolbarScrollOffset.dispose();
    super.dispose();
  }

  void _onPositionNotified() {
    final pos = NavigationLayout.positionNotifier.value;
    if (pos != null && pos != _position && mounted) {
      final normalized = NavigationLayout.sanitizeNavbarPosition(pos);
      if (normalized != pos) {
        NavigationLayout.positionNotifier.value = normalized;
      }
      if (_prefs.get(UserPreferences.navbarPosition) != normalized) {
        _prefs.set(UserPreferences.navbarPosition, normalized);
      }
      if (normalized != _position) {
        setState(() => _position = normalized);
      }
    }
  }

  // The bar's height, and with it the content inset, depends on the style.
  void _onPrefsChanged() {
    final style = _prefs.get(UserPreferences.bottomNavbarStyle);
    if (style == _bottomStyle || !mounted) return;
    _expandBottomBar();
    setState(() => _bottomStyle = style);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refreshPosition();
  }

  // MediaQuery can't be used for this: the Scaffold strips view insets from
  // the body the layout sits in.
  @override
  void didChangeMetrics() {
    if (!mounted) return;
    final view = View.maybeOf(context);
    if (view == null) return;
    final visible = view.viewInsets.bottom / view.devicePixelRatio > 0;
    if (visible != _keyboardVisible) setState(() => _keyboardVisible = visible);
  }

  void _refreshPosition() {
    final storedPosition = _prefs.get(UserPreferences.navbarPosition);
    final pos = NavigationLayout.sanitizeNavbarPosition(storedPosition);
    if (storedPosition != pos) {
      _prefs.set(UserPreferences.navbarPosition, pos);
      NavigationLayout.positionNotifier.value = pos;
    }
    if (pos != _position && mounted) setState(() => _position = pos);
  }

  @override
  Widget build(BuildContext context) {
    final layout = switch (_position) {
      NavbarPosition.left => _buildSidebar(),
      NavbarPosition.top => _buildToolbar(),
      NavbarPosition.bottom =>
        NavigationLayout.allowBottomNavbar ? _buildBottomBar() : _buildToolbar(),
    };
    // Grouping only pays off when the tier draws real backdrop blurs, the
    // sheen tier never does.
    return AppColorScheme.isGlass && GlassSettings.blursBackdrop
        ? BackdropGroup(child: layout)
        : layout;
  }

  /// Keyed so moving the navbar reparents the page that is already on screen
  /// instead of tearing it down and building it again.
  Widget get _content => KeyedSubtree(
    key: _contentKey,
    child: Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    ),
  );

  Widget _buildBottomBar() {
    final content = _content;
    return Stack(
      children: [
        Positioned.fill(
          child: BottomNavInsetScope(
            height: BottomNavbar.heightFor(context, style: _bottomStyle),
            child: NotificationListener<ScrollNotification>(
              onNotification: _onBottomScroll,
              child: content,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          // The keyboard covers the bar anyway, and a bar riding up on top of
          // it would hide the field that brought it up.
          child: IgnorePointer(
            ignoring: _keyboardVisible,
            child: AnimatedSlide(
              offset: _keyboardVisible ? const Offset(0, 1.2) : Offset.zero,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              child: BottomNavbar(
                activeRoute: widget.activeRoute,
                chromeVisible: widget.showNavigationChrome,
                minimized: _bottomMinimized,
                onExpand: _expandBottomBar,
                // The download progress bar pads the system inset itself,
                // which it no longer touches once the bar sits under it.
                header: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: const DownloadProgressBar(),
                ),
              ),
            ),
          ),
        ),
        if (widget.showBackButton)
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: _buildFloatingBackButton(),
            ),
          ),
      ],
    );
  }

  Widget _buildToolbar() {
    final translateWithScroll = PlatformDetection.isTV && !widget.pinTopToolbar;
    final content = _content;
    final toolbar = ValueListenableBuilder<bool>(
      valueListenable: NavigationLayout.trailerImmersiveNotifier,
      builder: (context, trailerImmersive, child) {
        final show = widget.showNavigationChrome &&
            !(trailerImmersive && PlatformDetection.isTV);
        return AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: IgnorePointer(
            ignoring: !show,
            child: child,
          ),
        );
      },
      child: TopToolbar(
        activeRoute: widget.activeRoute,
        showBackButton: widget.showBackButton,
        contentFocusNode: _contentFocusNode,
      ),
    );
    final maxTranslate = TopToolbar.heightFor(context);
    final body = translateWithScroll
        ? NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.axis != Axis.vertical) return false;
              final px = n.metrics.pixels.clamp(0.0, double.infinity);
              if ((px - _toolbarScrollOffset.value).abs() > 0.5) {
                _toolbarScrollOffset.value = px;
              }
              return false;
            },
            child: content,
          )
        : content;
    final musicExtra = TopToolbar.musicBarExtraHeight();
    final insetBody = (widget.pinTopToolbar && musicExtra > 0)
        ? Padding(padding: EdgeInsets.only(top: musicExtra), child: body)
        : body;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: insetBody),
              if (translateWithScroll)
                ValueListenableBuilder<bool>(
                  valueListenable: TopToolbar.isFocusedNotifier,
                  builder: (_, toolbarFocused, child) =>
                      ValueListenableBuilder<double>(
                    valueListenable: _toolbarScrollOffset,
                    builder: (_, offset, child) {
                      // A focused toolbar must be visible. Screens can hand
                      // focus to it while the content is scrolled down, which
                      // would leave focus in a toolbar translated off screen.
                      final translate = !widget.showNavigationChrome
                          ? maxTranslate
                          : toolbarFocused
                          ? 0.0
                          : offset.clamp(0.0, maxTranslate);
                      return Positioned(
                        left: 0,
                        right: 0,
                        top: -translate,
                        child: IgnorePointer(
                          ignoring: !widget.showNavigationChrome ||
                              translate >= maxTranslate,
                          child: child!,
                        ),
                      );
                    },
                    child: child,
                  ),
                  child: toolbar,
                )
              else
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: toolbar,
                ),
              if (widget.showBackButton &&
                  !PlatformDetection.isTV &&
                  !widget.showNavigationChrome)
                Positioned(
                  top: 16,
                  left: 16,
                  child: SafeArea(child: _buildFloatingBackButton()),
                ),
            ],
          ),
        ),
        const DownloadProgressBar(),
      ],
    );
  }

  Widget _buildSidebar() {
    final content = _content;

    final sidebar = ValueListenableBuilder<bool>(
      valueListenable: NavigationLayout.trailerImmersiveNotifier,
      builder: (context, trailerImmersive, child) {
        final show = widget.showNavigationChrome &&
            !(trailerImmersive && PlatformDetection.isTV);
        return AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: IgnorePointer(
            ignoring: !show,
            child: child,
          ),
        );
      },
      child: LeftSidebar(
        activeRoute: widget.activeRoute,
        contentFocusNode: _contentFocusNode,
        showBackButton: widget.showBackButton,
      ),
    );

    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: content),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: sidebar,
                ),
                if (widget.showBackButton && !PlatformDetection.isTV)
                  Positioned(
                    top: 16,
                    left: 88,
                    child: _buildFloatingBackButton(),
                  ),
              ],
            ),
          ),
          const DownloadProgressBar(),
        ],
      );
    }

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: content),
              Positioned.fill(
                child: sidebar,
              ),
            ],
          ),
        ),
        const DownloadProgressBar(),
      ],
    );
  }

  Widget _buildFloatingBackButton() {
    final overlayColor = OverlayColorPalette.resolveColor(
      _prefs.get(UserPreferences.navbarColor),
    );
    final opacity = _prefs.get(UserPreferences.navbarOpacity) / 100.0;
    final backgroundColor = ThemeRegistry.active.transparentNavbarSurface
        ? Colors.transparent
        : overlayColor.withValues(alpha: opacity);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.popOrHome(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
