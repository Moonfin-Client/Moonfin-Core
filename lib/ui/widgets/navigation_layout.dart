import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import 'download_progress_bar.dart';
import 'left_sidebar.dart';
import 'mobile_bottom_nav_bar.dart';
import 'top_toolbar.dart';

class NavigationLayout extends StatefulWidget {
  final String? activeRoute;
  final Widget child;
  final bool showBackButton;
  final bool showNavigationChrome;

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

  static final focusNavbarNotifier = ValueNotifier<VoidCallback?>(null);
  static final focusNavbarAvatarNotifier = ValueNotifier<VoidCallback?>(null);
  static final focusContentFromNavbarNotifier = ValueNotifier<VoidCallback?>(
    null,
  );

  const NavigationLayout({
    super.key,
    this.activeRoute,
    required this.child,
    this.showBackButton = false,
    this.showNavigationChrome = true,
  });

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> with WidgetsBindingObserver {
  final _prefs = GetIt.instance<UserPreferences>();
  final _contentFocusNode = FocusNode(debugLabel: 'NavigationContent');
  final ValueNotifier<double> _toolbarScrollOffset = ValueNotifier<double>(0.0);
  late NavbarPosition _position;

  @override
  void initState() {
    super.initState();
    final storedPosition = _prefs.get(UserPreferences.navbarPosition);
    _position = NavigationLayout.sanitizeNavbarPosition(storedPosition);
    if (_position != storedPosition) {
      _prefs.set(UserPreferences.navbarPosition, _position);
    }
    WidgetsBinding.instance.addObserver(this);
    NavigationLayout.positionNotifier.addListener(_onPositionNotified);
  }

  @override
  void dispose() {
    NavigationLayout.positionNotifier.removeListener(_onPositionNotified);
    WidgetsBinding.instance.removeObserver(this);
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refreshPosition();
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
    if (!widget.showNavigationChrome) {
      return widget.child;
    }
    return switch (_position) {
      NavbarPosition.left => _buildSidebar(),
      NavbarPosition.top => _buildToolbar(),
      NavbarPosition.bottom =>
        NavigationLayout.allowBottomNavbar ? _buildBottomBar() : _buildToolbar(),
    };
  }

  Widget _buildBottomBar() {
    final content = Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    );
    return Column(
      children: [
        Expanded(child: content),
        const DownloadProgressBar(),
        MobileBottomNavBar(activeRoute: widget.activeRoute),
      ],
    );
  }

  Widget _buildToolbar() {
    final translateWithScroll = PlatformDetection.isTV;
    final content = Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    );
    final toolbar = TopToolbar(
      activeRoute: widget.activeRoute,
      showBackButton: widget.showBackButton,
      contentFocusNode: _contentFocusNode,
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
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: body),
              if (translateWithScroll)
                ValueListenableBuilder<double>(
                  valueListenable: _toolbarScrollOffset,
                  builder: (_, offset, child) {
                    final translate = offset.clamp(0.0, maxTranslate);
                    return Positioned(
                      left: 0,
                      right: 0,
                      top: -translate,
                      child: IgnorePointer(
                        ignoring: translate >= maxTranslate,
                        child: child!,
                      ),
                    );
                  },
                  child: toolbar,
                )
              else
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: toolbar,
                ),
            ],
          ),
        ),
        const DownloadProgressBar(),
      ],
    );
  }

  Widget _buildSidebar() {
    final content = Focus(
      focusNode: _contentFocusNode,
      skipTraversal: true,
      child: widget.child,
    );

    final sidebar = LeftSidebar(
      activeRoute: widget.activeRoute,
      contentFocusNode: _contentFocusNode,
      showBackButton: widget.showBackButton,
    );

    if (PlatformDetection.isTV || PlatformDetection.isDesktop) {
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
}
