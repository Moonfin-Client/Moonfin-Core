import 'dart:async';

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/user_repository.dart';
import '../../data/models/aggregated_library.dart';
import '../../data/repositories/multi_server_repository.dart';
import '../../data/repositories/user_views_repository.dart';
import '../../data/services/plugin_sync_service.dart';
import '../../preference/preference_constants.dart';
import '../../preference/seerr_preferences.dart';
import '../../preference/user_preferences.dart';
import '../../l10n/app_localizations.dart';
import '../../util/clock_format.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/game_library.dart';
import '../../util/overlay_color_palette.dart';
import '../../util/platform_detection.dart';
import '../navigation/destinations.dart';
import '../navigation/home_refresh_bus.dart';
import 'navigation_layout.dart';
import 'settings/settings_panel.dart';
import '../screens/syncplay/syncplay_screen.dart';
import '../screens/settings/settings_side_panel.dart';
import 'seerr_icons.dart';
import 'shuffle_overlay.dart';
import 'user_menu_dialog.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:playback_core/playback_core.dart';
import '../../data/models/aggregated_item.dart';
import '../../data/services/media_server_client_factory.dart';
import '../navigation/app_router.dart';
import 'adaptive/sf_symbol.dart';

const _kExpandedWidthDesktop = 240.0;
const _kExpandedWidthMobile = 260.0;
const _kExpandDuration = Duration(milliseconds: 200);
const _kExpandedWidthTV = 280.0;
const _kCollapsedWidthTV = 72.0;
const _kExpandedBackdropWidthTV = _kExpandedWidthTV - 16.0;
const _kBackdropEdgeBlendWidthTV =
    _kExpandedWidthTV - _kExpandedBackdropWidthTV;

class LeftSidebar extends StatefulWidget {
  final String? activeRoute;
  final FocusNode? contentFocusNode;
  final bool showBackButton;

  /// Notifier updated when the sidebar's focus state changes.
  /// Use this instead of walking the element tree to determine if the
  /// current focus is within the sidebar; it's resilient during teardown.
  static final ValueNotifier<bool> isFocusedNotifier = ValueNotifier<bool>(false);

  const LeftSidebar({
    super.key,
    this.activeRoute,
    this.contentFocusNode,
    this.showBackButton = false,
  });

  @override
  State<LeftSidebar> createState() => _LeftSidebarState();
}

class _LeftSidebarState extends State<LeftSidebar> {
  final _userRepo = GetIt.instance<UserRepository>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _viewsRepo = GetIt.instance<UserViewsRepository>();
  final _sidebarFocus = FocusScopeNode(debugLabel: 'LeftSidebar');
  final _homeFocusNode = FocusNode(debugLabel: 'LeftSidebarHome');
  final _settingsFocusNode = FocusNode(debugLabel: 'LeftSidebarSettings');
  final _profileFocusNode = FocusNode(debugLabel: 'LeftSidebarProfile');
  final _musicCardFocusNode = FocusNode(debugLabel: 'SidebarMusicCard');
  late final VoidCallback _focusNavbarCallback;
  late final VoidCallback _focusAvatarCallback;
  VoidCallback? _previousFocusNavbarCallback;
  VoidCallback? _previousFocusAvatarCallback;
  final _scrollController = ScrollController();

  List<AggregatedLibrary> _libraries = [];
  bool _isExpanded = false;
  bool _showLabels = false;
  bool _librariesExpanded = false;
  bool _canExpandViaFocus = false;
  bool _skipExpandOnNextFocusFromNavigation = false;
  bool get _sidebarHadFocus => LeftSidebar.isFocusedNotifier.value;
  Timer? _clockTimer;
  Timer? _labelTimer;
  Timer? _focusExpandGateTimer;
  Timer? _focusHomeTimer;
  late final ValueNotifier<String> _currentTime;
  StreamSubscription? _userSub;
  String? _userImageUrl;
  FocusNode? _previousFocus;

  bool get _isMobile => PlatformDetection.useMobileUi;

  @override
  void initState() {
    super.initState();
    _currentTime = ValueNotifier<String>('');
    _focusNavbarCallback = () {
      if (!mounted) return;
      if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
        _homeFocusNode.requestFocus();
      }
    };
    _focusAvatarCallback = () {
      if (!mounted) return;
      if (PlatformDetection.isTV) {
        if (_profileFocusNode.context != null) {
          _profileFocusNode.requestFocus();
        } else {
          _expand();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            if (_profileFocusNode.context != null) {
              _profileFocusNode.requestFocus();
            } else {
              _homeFocusNode.requestFocus();
            }
          });
        }
      } else if ((PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
        _homeFocusNode.requestFocus();
      }
    };
    _previousFocusNavbarCallback = NavigationLayout.focusNavbarNotifier.value;
    _previousFocusAvatarCallback =
        NavigationLayout.focusNavbarAvatarNotifier.value;
    NavigationLayout.focusNavbarNotifier.value = _focusNavbarCallback;
    NavigationLayout.focusNavbarAvatarNotifier.value = _focusAvatarCallback;
    _updateClock();
    _clockTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _updateClock(),
    );
    _loadUserImage();
    _userSub = _userRepo.currentUserStream.listen((_) => _loadUserImage());
    _prefs.addListener(_onPrefsChanged);
    _viewsRepo.addListener(_onUserViewsChanged);
    GetIt.instance<PluginSyncService>().addListener(_onPrefsChanged);
    _loadLibraries();
    FocusManager.instance.addListener(_trackPreviousFocus);
    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      _armTvFocusGate();
      _sidebarFocus.addListener(_onSidebarFocusNodeChanged);
    }
    if (PlatformDetection.isTV) {
      _profileFocusNode.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (identical(
      NavigationLayout.focusNavbarNotifier.value,
      _focusNavbarCallback,
    )) {
      NavigationLayout.focusNavbarNotifier.value = _previousFocusNavbarCallback;
    }
    if (identical(
      NavigationLayout.focusNavbarAvatarNotifier.value,
      _focusAvatarCallback,
    )) {
      NavigationLayout.focusNavbarAvatarNotifier.value =
          _previousFocusAvatarCallback;
    }
    FocusManager.instance.removeListener(_trackPreviousFocus);
    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      _sidebarFocus.removeListener(_onSidebarFocusNodeChanged);
    }
    _clockTimer?.cancel();
    _labelTimer?.cancel();
    _focusExpandGateTimer?.cancel();
    _focusHomeTimer?.cancel();
    _homeFocusNode.dispose();
    _settingsFocusNode.dispose();
    _profileFocusNode.dispose();
    _musicCardFocusNode.dispose();
    _sidebarFocus.dispose();
    _scrollController.dispose();
    _userSub?.cancel();
    try {
      _viewsRepo.removeListener(_onUserViewsChanged);
    } catch (_) {}
    try {
      GetIt.instance<PluginSyncService>().removeListener(_onPrefsChanged);
    } catch (_) {}
    _prefs.removeListener(_onPrefsChanged);
    _currentTime.dispose();
    LeftSidebar.isFocusedNotifier.value = false;
    super.dispose();
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    _updateClock();
    _loadLibraries();
    setState(() {});
  }

  void _onUserViewsChanged() {
    if (!mounted) return;
    _loadLibraries();
  }

  void _updateClock() {
    final newTime = formatClockTime(
      DateTime.now(),
      use24Hour: _prefs.get(UserPreferences.use24HourClock),
    );
    if (mounted && _currentTime.value != newTime) {
      _currentTime.value = newTime;
    }
  }

  void _loadUserImage() {
    final user = _userRepo.currentUser;
    if (user == null) {
      setState(() => _userImageUrl = null);
      return;
    }
    try {
      final client = GetIt.instance<MediaServerClient>();
      setState(() => _userImageUrl = client.imageApi.getUserImageUrl(user.id));
    } catch (_) {
      setState(() => _userImageUrl = null);
    }
  }

  Future<void> _loadLibraries() async {
    try {
      final useMultiServer = _prefs.get(
        UserPreferences.enableMultiServerLibraries,
      );
      final libs = useMultiServer
          ? await GetIt.instance<MultiServerRepository>()
                .getAggregatedLibraries()
          : await _viewsRepo.getUserViews();

      List<AggregatedLibrary> filtered = libs;
      if (useMultiServer) {
        try {
          final config = await _viewsRepo.getUserConfiguration();
          final excluded = config.myMediaExcludes.toSet();
          if (excluded.isNotEmpty) {
            filtered = libs.where((lib) => !excluded.contains(lib.id)).toList();
          }
        } catch (_) {}
      }

      if (mounted && !_librariesEqual(_libraries, filtered)) {
        setState(() => _libraries = filtered);
      }
    } catch (_) {}
  }

  bool _librariesEqual(List<AggregatedLibrary> a, List<AggregatedLibrary> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id) return false;
    }
    return true;
  }

  Color _overlayColor() {
    return OverlayColorPalette.resolveColor(
      _prefs.get(UserPreferences.navbarColor),
    );
  }

  double _overlayOpacity() {
    return _prefs.get(UserPreferences.navbarOpacity) / 100.0;
  }

  void _expand() {
    if (_isExpanded) return;
    setState(() => _isExpanded = true);
    _labelTimer?.cancel();
    final delay = PlatformDetection.isTV
        ? const Duration(milliseconds: 150)
        : const Duration(milliseconds: 100);
    _labelTimer = Timer(delay, () {
      if (mounted) setState(() => _showLabels = true);
    });
  }

  void _collapse() {
    if (!_isExpanded) return;
    _labelTimer?.cancel();
    setState(() {
      _isExpanded = false;
      _showLabels = false;
      _librariesExpanded = false;
    });
  }

  void _toggle() {
    if (_isExpanded) {
      _collapse();
    } else {
      _expand();
    }
  }

  void _onSidebarFocusNodeChanged() {
    final hasFocus = _sidebarFocus.hasFocus;
    if (hasFocus && !_sidebarHadFocus) {
      if (_skipExpandOnNextFocusFromNavigation) {
        _skipExpandOnNextFocusFromNavigation = false;
        _focusHomeTimer?.cancel();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _exitSidebarToContent();
        });
      } else if (_canExpandViaFocus) {
        _expand();
        _focusHomeTimer?.cancel();
        _focusHomeTimer = Timer(Duration.zero, () {
          if (!mounted) return;
          _homeFocusNode.requestFocus();
        });
      }
    } else if (!hasFocus && _sidebarHadFocus && _canExpandViaFocus) {
      _collapse();
    }
    LeftSidebar.isFocusedNotifier.value = hasFocus;
  }

  void _markNavigationAwayFromSidebar() {
    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      _skipExpandOnNextFocusFromNavigation = true;
    }
  }

  void _onSidebarFocusChange(bool hasFocus) {
    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      return;
    }
    // On mobile, keep sidebar opening explicit (menu tap) to avoid
    // route-to-route focus restoration repeatedly reopening it.
  }

  void _armTvFocusGate() {
    setState(() => _canExpandViaFocus = false);
    _focusExpandGateTimer?.cancel();
    _focusExpandGateTimer = Timer(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _canExpandViaFocus = true);
    });
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      final primary = FocusManager.instance.primaryFocus;
      final insideMusicCard = primary != null && _isDescendantOf(primary, _musicCardFocusNode);

      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        if (insideMusicCard) {
          final success = primary.focusInDirection(TraversalDirection.right);
          if (success) {
            return KeyEventResult.handled;
          }
        }
        _collapse();
        _restoreFocusOutsideSidebar();
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        if (insideMusicCard) {
          final success = primary.focusInDirection(TraversalDirection.left);
          if (success) {
            return KeyEventResult.handled;
          }
          if (PlatformDetection.isTV) {
            return KeyEventResult.handled;
          }
        } else {
          if (PlatformDetection.isTV) {
            return KeyEventResult.handled;
          }
        }
      }
      if (PlatformDetection.isTV &&
          event.logicalKey == LogicalKeyboardKey.arrowUp &&
          _homeFocusNode.hasFocus) {
        if (_profileFocusNode.context != null) {
          _profileFocusNode.requestFocus();
        }
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  bool _isDescendantOf(FocusNode? child, FocusNode parent) {
    FocusNode? current = child;
    while (current != null) {
      if (identical(current, parent)) return true;
      current = current.parent;
    }
    return false;
  }

  void _trackPreviousFocus() {
    final primary = FocusManager.instance.primaryFocus;
    if (primary == null || _sidebarFocus.hasFocus) return;
    _previousFocus = primary;
  }

  void _restoreFocusOutsideSidebar() {
    final previous = _previousFocus;
    if (previous != null && _isLaidOutFocusNode(previous)) {
      previous.requestFocus();
      return;
    }
    final fallback = widget.contentFocusNode;
    if (fallback != null && _isLaidOutFocusNode(fallback)) {
      final firstContent = _firstFocusableDescendant(fallback);
      if (firstContent != null) {
        firstContent.requestFocus();
      } else {
        fallback.requestFocus();
      }
      return;
    }
    if (mounted) FocusScope.of(context).nextFocus();
  }

  static bool _isLaidOutFocusNode(FocusNode node) {
    if (!node.canRequestFocus) {
      return false;
    }
    final context = node.context;
    if (context == null) {
      return false;
    }
    final renderObject = context.findRenderObject();
    return renderObject is RenderBox &&
        renderObject.attached &&
        renderObject.hasSize;
  }

  static FocusNode? _firstFocusableDescendant(FocusNode node) {
    for (final child in node.children) {
      if (!child.skipTraversal && _isLaidOutFocusNode(child)) {
        return child;
      }
      final found = _firstFocusableDescendant(child);
      if (found != null) return found;
    }
    return null;
  }

  String _normalizedPath(String path) {
    if (path.isEmpty) return path;
    return (path.endsWith('/') && path.length > 1)
        ? path.substring(0, path.length - 1)
        : path;
  }

  String _currentPath() {
    if (widget.activeRoute != null && widget.activeRoute!.isNotEmpty) {
      return _normalizedPath(widget.activeRoute!);
    }
    try {
      return _normalizedPath(GoRouterState.of(context).uri.path);
    } catch (_) {
      return '';
    }
  }

  bool _isActive(String route) {
    return _currentPath() == _normalizedPath(route);
  }

  @override
  Widget build(BuildContext context) {
    return _buildDrawerLayout();
  }

  Widget _buildDrawerLayout() {
    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      return _buildTvLayout();
    }
    final expandedWidth = _isMobile
        ? _kExpandedWidthMobile
        : _kExpandedWidthDesktop;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    return Stack(
      children: [
        if (_isExpanded)
          Positioned.fill(
            child: GestureDetector(
              onTap: _collapse,
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
        AnimatedPositioned(
          duration: _kExpandDuration,
          curve: Curves.easeInOut,
          left: _isExpanded ? 0 : -expandedWidth,
          top: 0,
          bottom: 0,
          width: expandedWidth,
          child: FocusScope(
            node: _sidebarFocus,
            onFocusChange: _onSidebarFocusChange,
            onKeyEvent: _onKeyEvent,
            child: AppColorScheme.isGlass
                ? GlassSurface(
                    cornerRadius: 18,
                    reinforced: _isMobile,
                    fallbackColor: Colors.transparent,
                    child: _isMobile
                        ? SafeArea(right: false, child: _buildContent())
                        : _buildContent(),
                  )
                : Container(
              decoration: BoxDecoration(
                gradient: _isMobile
                    ? null
                    : LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          _overlayColor().withValues(alpha: _overlayOpacity()),
                          _overlayColor().withValues(
                            alpha: _overlayOpacity() * 0.75,
                          ),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.7, 1.0],
                      ),
                color: _isMobile
                    ? _overlayColor().withValues(alpha: _overlayOpacity())
                    : null,
                border: isNeon
                    ? Border(
                        right: ThemeRegistry.active.borders.chipBorder.copyWith(
                          color: AppColorScheme.accent,
                          width: 1.2,
                        ),
                      )
                    : null,
                boxShadow: _isExpanded
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.6),
                          blurRadius: 20,
                          offset: const Offset(4, 0),
                        ),
                        if (isNeon)
                          const BoxShadow(
                            color: Color(0x66FF2E92),
                            blurRadius: 12,
                            offset: Offset(2, 0),
                          ),
                        if (isNeon)
                          const BoxShadow(
                            color: Color(0x5500E5FF),
                            blurRadius: 10,
                            offset: Offset(1, 0),
                          ),
                      ]
                    : null,
              ),
              child: _isMobile
                  ? SafeArea(right: false, child: _buildContent())
                  : _buildContent(),
            ),
          ),
        ),
        if (!_isExpanded)
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _toggle,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.menu,
                          size: 22,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                    if (widget.showBackButton) ...[
                      const SizedBox(width: 6),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => context.popOrHome(),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.4),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTvLayout() {
    final overlayColor = _overlayColor();
    final opacity = _overlayOpacity();
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final desktopHoverRail =
        (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi)) && !PlatformDetection.isTV;
    final railWidth = _isExpanded ? _kExpandedWidthTV : _kCollapsedWidthTV;

    final rail = AnimatedContainer(
      duration: _kExpandDuration,
      curve: Curves.easeInOut,
      width: railWidth,
      child: ClipRect(
        child: FocusScope(
          node: _sidebarFocus,
          onFocusChange: _onSidebarFocusChange,
          onKeyEvent: _onKeyEvent,
          child: Stack(
            children: [
              if (_isExpanded)
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: _kExpandedWidthTV,
                    child: Stack(
                      children: [
                        if (AppColorScheme.isGlass)
                          SizedBox(
                            width: _kExpandedBackdropWidthTV,
                            child: const GlassSurface(
                              cornerRadius: 18,
                              fallbackColor: Colors.transparent,
                            ),
                          )
                        else
                          Container(
                            width: _kExpandedBackdropWidthTV,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  overlayColor.withValues(
                                    alpha: math.max(opacity, 0.7),
                                  ),
                                  overlayColor.withValues(
                                    alpha: math.max(opacity, 0.5),
                                  ),
                                ],
                              ),
                              border: isNeon
                                  ? Border(
                                      right: ThemeRegistry
                                          .active
                                          .borders
                                          .chipBorder
                                          .copyWith(
                                            color: AppColorScheme.accent,
                                            width: 1.2,
                                          ),
                                    )
                                  : null,
                            ),
                          ),
                        if (!AppColorScheme.isGlass)
                          Positioned(
                            left: _kExpandedBackdropWidthTV,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: _kBackdropEdgeBlendWidthTV,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    overlayColor.withValues(
                                      alpha: math.max(opacity, 0.5),
                                    ),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: _kExpandDuration,
                  curve: Curves.easeInOut,
                  width: _isExpanded ? _kExpandedBackdropWidthTV : _kCollapsedWidthTV,
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (!desktopHoverRail) return rail;

    return MouseRegion(
      onEnter: (_) => _expand(),
      onExit: (_) => _collapse(),
      child: rail,
    );
  }

  Widget _buildContent() {
    final l10n = AppLocalizations.of(context);
    final showShuffle = _prefs.get(UserPreferences.showShuffleButton);
    final showGenres = _prefs.get(UserPreferences.showGenresButton);
    final showFavorites = _prefs.get(UserPreferences.showFavoritesButton);
    final showLibraries = _prefs.get(UserPreferences.showLibrariesInToolbar);
    final showFolders = _prefs.get(UserPreferences.enableFolderView);
    final showSyncPlay =
        _prefs.get(UserPreferences.syncPlayEnabled) &&
        _prefs.get(UserPreferences.showSyncPlayButton);
    final seerrPrefs = GetIt.instance<SeerrPreferences>();
    final seerrNavLabel = seerrPrefs.labelOrDefault(l10n.seerr);
    final clockBehavior = _prefs.get(UserPreferences.clockBehavior);
    final showClock =
        clockBehavior == ClockBehavior.always ||
        clockBehavior == ClockBehavior.inMenus;
    return Column(
      children: [
        Visibility(
          visible: _isExpanded,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: _buildUserSection(),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              var mainSlot = 0;
              Color? nextMainSidebarColor() {
                final c = AppColorScheme.navColorForSlot(mainSlot);
                if (c != null) mainSlot += 1;
                return c;
              }

              var librarySlot = 0;
              Color? nextLibrarySidebarColor() {
                final c = AppColorScheme.navColorForSlot(librarySlot);
                if (c != null) librarySlot += 1;
                return c;
              }

              final items = <Widget>[
                _SidebarItem(
                  key: const ValueKey('sidebar-home'),
                  icon: Icons.home_rounded,
                  label: l10n.home,
                  baseColor: nextMainSidebarColor(),
                  focusNode: _homeFocusNode,
                  showLabel: _showLabels,
                  onPressed: () {
                    _onNavigate();
                    if (_isActive(Destinations.home)) {
                      homeRefreshBus.request();
                      _exitSidebarToContent();
                      return;
                    }
                    homeRefreshBus.requestAfterNavigation();
                    _markNavigationAwayFromSidebar();
                    context.go(Destinations.home);
                  },
                ),
                _SidebarItem(
                  key: const ValueKey('sidebar-search'),
                  icon: Icons.search_rounded,
                  label: l10n.search,
                  baseColor: nextMainSidebarColor(),
                  showLabel: _showLabels,
                  onPressed: () {
                    _onNavigate();
                    if (_isActive(Destinations.search)) {
                      _exitSidebarToContent();
                      return;
                    }
                    _markNavigationAwayFromSidebar();
                    context.navigateTopLevel(Destinations.search);
                  },
                ),
                if (showShuffle)
                  _SidebarItem(
                    key: const ValueKey('sidebar-shuffle'),
                    icon: Icons.shuffle_rounded,
                    label: l10n.shuffle,
                    baseColor: nextMainSidebarColor(),
                    showLabel: _showLabels,
                    onPressed: () {
                      _onNavigate();
                      showShuffleOverlay(context);
                    },
                  ),
                if (showGenres)
                  _SidebarItem(
                    key: const ValueKey('sidebar-genres'),
                    baseColor: nextMainSidebarColor(),
                    iconBuilder: (size, color) => Image.asset(
                      'assets/icons/genres.png',
                      width: size,
                      height: size,
                      color: color,
                    ),
                    label: l10n.genres,
                    showLabel: _showLabels,
                    onPressed: () {
                      _onNavigate();
                      if (_isActive(Destinations.allGenres)) {
                        _exitSidebarToContent();
                        return;
                      }
                      _markNavigationAwayFromSidebar();
                      context.navigateTopLevel(Destinations.allGenres);
                    },
                  ),
                if (showFavorites)
                  _SidebarItem(
                    key: const ValueKey('sidebar-favorites'),
                    icon: Icons.favorite_rounded,
                    label: l10n.favorites,
                    baseColor: nextMainSidebarColor(),
                    showLabel: _showLabels,
                    onPressed: () {
                      _onNavigate();
                      if (_isActive(Destinations.allFavorites)) {
                        _exitSidebarToContent();
                        return;
                      }
                      _markNavigationAwayFromSidebar();
                      context.navigateTopLevel(Destinations.allFavorites);
                    },
                  ),
                if (showFolders)
                  _SidebarItem(
                    key: const ValueKey('sidebar-folders'),
                    icon: Icons.folder_rounded,
                    label: l10n.folders,
                    baseColor: nextMainSidebarColor(),
                    showLabel: _showLabels,
                    onPressed: () {
                      _onNavigate();
                      if (_isActive(Destinations.folderView)) {
                        _exitSidebarToContent();
                        return;
                      }
                      _markNavigationAwayFromSidebar();
                      context.navigateTopLevel(Destinations.folderView);
                    },
                  ),
                if (showSyncPlay)
                  _SidebarItem(
                    key: const ValueKey('sidebar-syncplay'),
                    icon: Icons.groups_rounded,
                    label: l10n.syncPlay,
                    baseColor: nextMainSidebarColor(),
                    showLabel: _showLabels,
                    onPressed: () {
                      _onNavigate();
                      _markNavigationAwayFromSidebar();
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const SyncPlayScreen(),
                        ),
                      );
                    },
                  ),
                if (_prefs.get(UserPreferences.showSeerrButton) &&
                    GetIt.instance<PluginSyncService>().seerrAvailable)
                  _SidebarItem(
                    key: const ValueKey('sidebar-seerr'),
                    baseColor: nextMainSidebarColor(),
                    iconBuilder: (size, color) => seerrPrefs.isSeerrVariant
                        ? SeerrIcon(size: size, color: color)
                        : SeerrIcon(size: size, color: color),
                    label: seerrNavLabel,
                    showLabel: _showLabels,
                    onPressed: () {
                      _onNavigate();
                      if (_isActive(Destinations.seerrDiscover)) {
                        _exitSidebarToContent();
                        return;
                      }
                      _markNavigationAwayFromSidebar();
                      context.navigateTopLevel(Destinations.seerrDiscover);
                    },
                  ),
                if (showLibraries && _libraries.isNotEmpty) ...[
                  _SidebarItem(
                    key: const ValueKey('sidebar-libraries'),
                    baseColor: nextMainSidebarColor(),
                    iconBuilder: (size, color) => Image.asset(
                      'assets/icons/clapperboard.png',
                      width: size,
                      height: size,
                      color: color,
                      fit: BoxFit.contain,
                    ),
                    label: l10n.libraries,
                    showLabel: _showLabels,
                    trailing: _showLabels
                        ? AnimatedRotation(
                            turns: _librariesExpanded ? 0.5 : 0,
                            duration: _kExpandDuration,
                            child: Icon(
                              Icons.expand_more,
                              size:
                                  ((PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi)) &&
                                      !PlatformDetection.isTV)
                                  ? 18
                                  : 16,
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          )
                        : null,
                    onPressed: () => setState(
                      () => _librariesExpanded = !_librariesExpanded,
                    ),
                  ),
                  AnimatedSize(
                    key: const ValueKey('sidebar-libraries-children'),
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: _librariesExpanded
                        ? Column(
                            children: _libraries
                                .map(
                                  (lib) => _SidebarLibraryItem(
                                    key: ObjectKey(lib.id),
                                    label: lib.name,
                                    baseColor: nextLibrarySidebarColor(),
                                    showLabel: _showLabels,
                                    onPressed: () {
                                      _onNavigate();
                                      _markNavigationAwayFromSidebar();
                                      if (lib.collectionType == 'music') {
                                        context.navigateTopLevel(
                                          '/music/${lib.id}',
                                        );
                                      } else if (lib.collectionType ==
                                              'books' ||
                                          lib.collectionType == 'audiobooks') {
                                        context.navigateTopLevel(
                                          Destinations.bookLibrary(
                                            lib.id,
                                            collectionType: lib.collectionType,
                                          ),
                                        );
                                      } else if (lib.collectionType ==
                                          'livetv') {
                                        context.navigateTopLevel(
                                          Destinations.liveTvGuide,
                                        );
                                      } else {
                                        context.navigateTopLevel(
                                          gameOrLibraryRoute(
                                            lib.id,
                                            lib.collectionType,
                                            lib.name,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                                .toList(),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
                _SidebarItem(
                  key: const ValueKey('sidebar-settings'),
                  icon: Icons.settings_rounded,
                  label: l10n.settings,
                  baseColor: nextMainSidebarColor(),
                  focusNode: _settingsFocusNode,
                  showLabel: _showLabels,
                  onPressed: () async {
                    _onNavigate();
                    await SettingsPanel.open(
                      context,
                      const SettingsSidePanel(),
                    );
                    if (!mounted) return;
                    _markNavigationAwayFromSidebar();
                    _settingsFocusNode.requestFocus();
                  },
                ),
              ];

              return SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: math.max(0, constraints.maxHeight - 8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: items,
                  ),
                ),
              );
            },
          ),
        ),
        SidebarMusicCard(
          isExpanded: _showLabels,
          focusNode: _musicCardFocusNode,
        ),
        if (showClock)
          Visibility(
            visible: _showLabels,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ValueListenableBuilder<String>(
                    valueListenable: _currentTime,
                    builder: (context, time, _) {
                      return Text(
                        time,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          )
        else
          const SizedBox(height: 16),
      ],
    );
  }

  void _onNavigate() {
    if (_isMobile) _collapse();
  }

  void _exitSidebarToContent() {
    _collapse();
    if (PlatformDetection.isTV || (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi))) {
      _restoreFocusOutsideSidebar();
    }
  }

  Widget _buildUserSection() {
    final user = _userRepo.currentUser;
    final initial = (user?.name.isNotEmpty == true)
        ? user!.name[0].toUpperCase()
        : '?';
    final fallback = Center(
      child: Text(
        initial,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );

    final tvCompact = PlatformDetection.isTV && !_showLabels;
    final innerPad = tvCompact ? 0.0 : 6.0;
    final isFocused = _profileFocusNode.hasFocus;

    final avatar = Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00A4DC), Color(0xFF0077B6)],
        ),
      ),
      child: ClipOval(
        child: _userImageUrl != null
            ? Image.network(
                _userImageUrl!,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
                errorBuilder: (_, _, _) => fallback,
              )
            : fallback,
      ),
    );

    final content = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: EdgeInsets.all(innerPad),
      decoration: BoxDecoration(
        color: (PlatformDetection.isTV && isFocused && _showLabels)
            ? Colors.white
            : Colors.transparent,
        borderRadius: AppRadius.circular(24),
      ),
      child: Row(
        children: [
          avatar,
          if (_showLabels) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                user?.name ?? '',
                style: TextStyle(
                  color: (PlatformDetection.isTV && isFocused)
                      ? Colors.black
                      : Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: PlatformDetection.isTV
          ? Focus(
              focusNode: _profileFocusNode,
              onKeyEvent: (_, event) {
                if (event is KeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.select ||
                      event.logicalKey == LogicalKeyboardKey.enter) {
                    _onNavigate();
                    showUserMenu(context);
                    return KeyEventResult.handled;
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    _homeFocusNode.requestFocus();
                    return KeyEventResult.handled;
                  }
                }
                return KeyEventResult.ignored;
              },
              child: GestureDetector(
                onTap: () {
                  _onNavigate();
                  showUserMenu(context);
                },
                child: content,
              ),
            )
          : GestureDetector(
              onTap: () {
                _onNavigate();
                showUserMenu(context);
              },
              child: content,
            ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  final IconData? icon;
  final Widget Function(double size, Color color)? iconBuilder;
  final String label;
  final bool showLabel;
  final VoidCallback onPressed;
  final Widget? trailing;
  final FocusNode? focusNode;
  final Color? baseColor;

  const _SidebarItem({
    super.key,
    this.icon,
    this.iconBuilder,
    required this.label,
    required this.showLabel,
    required this.onPressed,
    this.trailing,
    this.focusNode,
    this.baseColor,
  });

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  final _prefs = GetIt.instance<UserPreferences>();
  FocusNode? _internalNode;
  late final VoidCallback _focusListener;
  bool _isFocused = false;
  bool _isHovered = false;

  FocusNode get _focusNode =>
      widget.focusNode ?? (_internalNode ??= FocusNode());

  bool get _tvCompact => PlatformDetection.isTV && !widget.showLabel;

  @override
  void initState() {
    super.initState();
    _focusListener = () {
      if (!mounted) return;
      setState(() => _isFocused = _focusNode.hasFocus);
    };
    _focusNode.addListener(_focusListener);
    _isFocused = _focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(_SidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      (oldWidget.focusNode ?? _internalNode)?.removeListener(_focusListener);
      _focusNode.addListener(_focusListener);
      _isFocused = _focusNode.hasFocus;
    }
  }

  @override
  void dispose() {
    (widget.focusNode ?? _internalNode)?.removeListener(_focusListener);
    _internalNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final desktopSidebar =
        (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi)) && !PlatformDetection.isTV;
    final useBaseForFocus = widget.baseColor != null;
    final highlighted =
        (desktopSidebar && _isHovered) ||
        (PlatformDetection.isTV && _isFocused);
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final tvFocused = PlatformDetection.isTV && _isFocused;
    final baseColor = widget.baseColor ?? Colors.white.withValues(alpha: 0.6);
    final fgColor = tvFocused
        ? Colors.black
        : highlighted
        ? (useBaseForFocus ? baseColor : focusColor)
        : baseColor;
    final iconSize = desktopSidebar ? 28.0 : 24.0;
    final iconSlotWidth = desktopSidebar ? 36.0 : 32.0;
    final labelFontSize = desktopSidebar ? 16.0 : 14.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Focus(
          focusNode: _focusNode,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.select ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              widget.onPressed();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: widget.onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: desktopSidebar ? 44 : 40,
              padding: EdgeInsets.only(
                left: _tvCompact ? 12 : 18,
                right: _tvCompact ? 12 : 18,
              ),
              decoration: BoxDecoration(
                color: tvFocused
                    ? Colors.white
                    : highlighted
                    ? (useBaseForFocus
                          ? baseColor.withValues(alpha: 0.12)
                          : focusColor.withValues(alpha: 0.12))
                    : Colors.transparent,
                borderRadius: PlatformDetection.isTV
                    ? AppRadius.circular(24)
                    : BorderRadius.zero,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: iconSlotWidth,
                    child:
                        widget.iconBuilder?.call(iconSize, fgColor) ??
                        (widget.icon != null
                            ? AdaptiveIcon(
                                widget.icon!,
                                size: iconSize,
                                color: fgColor,
                              )
                            : const SizedBox.shrink()),
                  ),
                  if (widget.showLabel) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: fgColor,
                          fontSize: labelFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (widget.trailing != null) widget.trailing!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SidebarLibraryItem extends StatefulWidget {
  final String label;
  final bool showLabel;
  final VoidCallback onPressed;
  final Color? baseColor;

  const _SidebarLibraryItem({
    super.key,
    required this.label,
    required this.showLabel,
    required this.onPressed,
    this.baseColor,
  });

  @override
  State<_SidebarLibraryItem> createState() => _SidebarLibraryItemState();
}

class _SidebarLibraryItemState extends State<_SidebarLibraryItem> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _focusNode = FocusNode();
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final desktopSidebar =
        (PlatformDetection.isDesktop || (PlatformDetection.isWeb && !PlatformDetection.useMobileUi)) && !PlatformDetection.isTV;
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final baseColor = widget.baseColor ?? Colors.white.withValues(alpha: 0.5);
    final useBaseForFocus = widget.baseColor != null;
    final highlighted =
        (desktopSidebar && _isHovered) ||
        (PlatformDetection.isTV && _isFocused);
    final tvFocused = PlatformDetection.isTV && _isFocused;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Focus(
          focusNode: _focusNode,
          onKeyEvent: (_, event) {
            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.select ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              widget.onPressed();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: widget.onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: desktopSidebar ? 40 : 36,
              padding: EdgeInsets.only(
                left: desktopSidebar ? 64 : 58,
                right: 18,
              ),
              decoration: BoxDecoration(
                color: tvFocused
                    ? Colors.white
                    : highlighted
                    ? (useBaseForFocus
                          ? baseColor.withValues(alpha: 0.12)
                          : focusColor.withValues(alpha: 0.1))
                    : Colors.transparent,
                borderRadius: PlatformDetection.isTV
                    ? AppRadius.circular(24)
                    : BorderRadius.zero,
              ),
              alignment: Alignment.centerLeft,
              child: widget.showLabel
                  ? Text(
                      widget.label,
                      style: TextStyle(
                        color: tvFocused
                            ? Colors.black
                            : highlighted
                            ? (useBaseForFocus ? baseColor : focusColor)
                            : baseColor,
                        fontSize: desktopSidebar ? 15 : 13,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarMusicCard extends StatefulWidget {
  final bool isExpanded;
  final FocusNode? focusNode;
  const SidebarMusicCard({
    super.key,
    required this.isExpanded,
    this.focusNode,
  });

  @override
  State<SidebarMusicCard> createState() => _SidebarMusicCardState();
}

class _SidebarMusicCardState extends State<SidebarMusicCard> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  StreamSubscription? _playSub;
  StreamSubscription? _queueSub;

  @override
  void initState() {
    super.initState();
    _playSub = _manager.state.playingStream.listen((_) {
      if (mounted) setState(() {});
    });
    _queueSub = _manager.queueService.queueChangedStream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _playSub?.cancel();
    _queueSub?.cancel();
    super.dispose();
  }

  AggregatedItem? get _currentItem {
    final raw = _manager.queueService.currentItem;
    return raw is AggregatedItem ? raw : null;
  }

  String? _artUrl(AggregatedItem item) {
    try {
      final client = _clientFactory.getClientIfExists(item.serverId) ??
          GetIt.instance<MediaServerClient>();
      final albumTag = item.albumPrimaryImageTag;
      final albumId = item.albumId;
      if (item.type == 'Audio' && albumTag != null && albumId != null) {
        return client.imageApi
            .getPrimaryImageUrl(albumId, maxHeight: 120, tag: albumTag);
      }
      if (item.primaryImageTag != null) {
        return client.imageApi
            .getPrimaryImageUrl(item.id, maxHeight: 120, tag: item.primaryImageTag);
      }
    } catch (_) {}
    return null;
  }

  Widget _buildCardButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool large = false,
  }) {
    return Focus(
      onKeyEvent: (node, event) {
        if (isActivateKey(event)) {
          onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Builder(
        builder: (context) {
          final focused = Focus.of(context).hasFocus;
          final diameter = large ? 38.0 : 32.0;
          return GestureDetector(
            onTap: onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 90),
              width: diameter,
              height: diameter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: focused
                    ? AppColorScheme.onSurface
                    : AppColorScheme.onSurface.withValues(alpha: 0.10),
              ),
              child: Icon(
                icon,
                size: large ? 22 : 18,
                color: focused ? AppColorScheme.surface : AppColorScheme.onSurface,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = _currentItem;
    if (item == null || !item.isAudioLike) {
      return const SizedBox.shrink();
    }

    final isPlaying = _manager.state.isPlaying;
    final artUrl = _artUrl(item);

    if (!widget.isExpanded) {
      // Collapsed layout: show a single focusable circular avatar with the album art
      return Focus(
        onKeyEvent: (node, event) {
          if (isActivateKey(event)) {
            appRouter.push(Destinations.audioPlayer);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: Builder(
          builder: (context) {
            final focused = Focus.of(context).hasFocus;
            return GestureDetector(
              onTap: () => appRouter.push(Destinations.audioPlayer),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: focused ? AppColorScheme.accent : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: focused
                          ? [
                              BoxShadow(
                                color: AppColorScheme.accent.withValues(alpha: 0.4),
                                blurRadius: 8,
                                spreadRadius: 1,
                              )
                            ]
                          : null,
                    ),
                    child: ClipOval(
                      child: artUrl != null
                          ? CachedNetworkImage(
                              imageUrl: artUrl,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: AppColorScheme.onSurface.withValues(alpha: 0.1),
                              child: Icon(
                                Icons.music_note,
                                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    // Expanded layout: beautiful square card inside the sidebar
    final artist = item.artists.isNotEmpty
        ? item.artists.join(', ')
        : item.albumArtist ?? '';

    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final border = isNeon
        ? Border.all(
            color: const Color(0xFF00F0FF),
            width: 1.5,
          )
        : Border.all(
            color: AppColorScheme.onSurface.withValues(alpha: 0.15),
            width: 1.0,
          );
    final boxShadow = isNeon
        ? const [
            BoxShadow(
              color: Color(0x3300F0FF),
              blurRadius: 8,
              spreadRadius: 1,
            )
          ]
        : null;

    final cardContent = GlassSurface(
      cornerRadius: 16,
      reinforced: true,
      fallbackColor: AppColorScheme.surfaceVariant.withValues(alpha: 0.3),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => appRouter.push(Destinations.audioPlayer),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: AppRadius.circular(8),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: artUrl != null
                        ? CachedNetworkImage(
                            imageUrl: artUrl,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: AppColorScheme.onSurface.withValues(alpha: 0.1),
                            child: Icon(
                              Icons.music_note,
                              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          color: AppColorScheme.onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (artist.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          artist,
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCardButton(
                icon: Icons.skip_previous,
                onPressed: _manager.previous,
              ),
              _buildCardButton(
                icon: isPlaying ? Icons.pause : Icons.play_arrow,
                onPressed: isPlaying ? _manager.pause : _manager.resume,
                large: true,
              ),
              _buildCardButton(
                icon: Icons.skip_next,
                onPressed: _manager.next,
              ),
              _buildCardButton(
                icon: Icons.stop,
                onPressed: () => unawaited(_manager.stop(userInitiated: true)),
              ),
            ],
          ),
        ],
      ),
    );

    return Focus(
      focusNode: widget.focusNode,
      canRequestFocus: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: FocusTraversalGroup(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(16),
              border: border,
              boxShadow: boxShadow,
            ),
            child: cardContent,
          ),
        ),
      ),
    );
  }
}
