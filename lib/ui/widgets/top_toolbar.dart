import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/app_localizations.dart';
import '../../auth/repositories/user_repository.dart';
import '../../data/models/aggregated_library.dart';
import '../../data/repositories/multi_server_repository.dart';
import '../../data/repositories/user_views_repository.dart';
import '../../data/services/achievements_service.dart';
import '../../data/services/library_scope_service.dart';
import '../../data/services/plugin_sync_service.dart';
import '../../preference/preference_constants.dart';
import '../../preference/seerr_preferences.dart';
import '../../preference/user_preferences.dart';
import '../../util/audio_artwork_url.dart';
import '../../util/clock_format.dart';
import '../../util/game_library.dart';
import '../../util/live_tv_library.dart';
import '../../util/overlay_color_palette.dart';
import '../../util/platform_detection.dart';
import '../navigation/destinations.dart';
import '../navigation/home_refresh_bus.dart';
import '../navigation/route_lifecycle_observer.dart';
import 'downloads_nav_slot.dart';
import 'friends_nav_slot.dart';
import 'expandable_icon_button.dart';
import 'marquee_text.dart';
import 'nav_styles/atlas_panel.dart';
import 'nav_styles/nav_back_guard.dart';
import 'nav_styles/nav_button_style.dart';
import 'overlay_sheet.dart';
import 'navigation_layout.dart';
import 'settings/settings_panel.dart';
import '../screens/downloads/downloads_panel.dart';
import '../screens/settings/settings_side_panel.dart';
import '../screens/watch_party/watch_together_route.dart';
import 'seerr_icons.dart';
import 'server_messages_dialog.dart';
import 'server_messages_nav_slot.dart';
import 'shuffle_overlay.dart';
import 'user_menu_dialog.dart';

import 'offline_aware_image.dart';
import 'package:playback_core/playback_core.dart';
import '../../data/models/aggregated_item.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/focus/input_mode_tracker.dart';
import '../navigation/app_router.dart';
import 'adaptive/sf_symbol.dart';
import 'user_avatar_image.dart';

const _kToolbarHeightTV = 95.0;
const _kToolbarHeightDesktop = 80.0;
const _kToolbarHeightMobile = 60.0;
const _kOverscanH = 48.0;
const _kOverscanV = 27.0;
const _kNavbarBackdrop = Color(0x1AFFFFFF);
const _kAvatarSize = 40.0;
const _kPillRadius = 36.0;
const _kButtonSpacing = 12.0;
const _kButtonSpacingMobile = 8.0;
const _kButtonSpacingTV = 2.0;
const _kMusicBarTitleMaxWidth = 280.0;

class TopToolbar extends StatefulWidget {
  final String? activeRoute;
  final bool showBackButton;
  final FocusNode? contentFocusNode;

  /// True while focus is inside the toolbar, so screens can avoid stealing its
  /// d-pad keys. Mirrors [LeftSidebar.isFocusedNotifier].
  static final ValueNotifier<bool> isFocusedNotifier = ValueNotifier<bool>(
    false,
  );

  const TopToolbar({
    super.key,
    this.activeRoute,
    this.showBackButton = false,
    this.contentFocusNode,
  });

  /// Extra height the embedded music bar adds to the toolbar when audio is
  /// playing, or 0 when it is not. Single source of truth so the toolbar's own
  /// layout and the content inset stay in sync.
  static double musicBarExtraHeight() {
    final manager = GetIt.instance<PlaybackManager>();
    final item = manager.queueService.currentItem;
    final isMusic = item is AggregatedItem && item.isAudioLike;
    if (!isMusic) return 0.0;
    return PlatformDetection.useLeanbackUi ? 64.0 : 54.0;
  }

  /// Base height of the toolbar for the current platform (excluding music bar).
  static double baseHeightFor(BuildContext context) {
    return PlatformDetection.useLeanbackUi
        ? _kToolbarHeightTV
        : PlatformDetection.useMobileUi
        ? _kToolbarHeightMobile
        : _kToolbarHeightDesktop;
  }

  /// Total laid-out height of the toolbar for the current platform.
  static double heightFor(BuildContext context) {
    return baseHeightFor(context) + musicBarExtraHeight();
  }

  @override
  State<TopToolbar> createState() => _TopToolbarState();
}

class _TopToolbarState extends State<TopToolbar> with RouteAware {
  final _userRepo = GetIt.instance<UserRepository>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _viewsRepo = GetIt.instance<UserViewsRepository>();

  final _avatarFocus = FocusNode();
  final _homeFocus = FocusNode(debugLabel: 'TopToolbarHome');
  final _settingsFocus = FocusNode(debugLabel: 'TopToolbarSettings');
  final _serverMessagesFocus = FocusNode(
    debugLabel: 'TopToolbarServerMessages',
  );
  final _friendsFocus = FocusNode(debugLabel: 'TopToolbarFriends');
  final _inlineLibrariesTriggerFocus = FocusNode(
    debugLabel: 'TopToolbarInlineLibrariesTrigger',
  );
  final _toolbarScopeNode = FocusNode(
    debugLabel: 'TopToolbarScope',
    canRequestFocus: false,
    skipTraversal: true,
  );
  final _musicBarFocusNode = FocusNode(debugLabel: 'TopMusicBar');
  final _atlasPortal = OverlayPortalController();
  final _atlasLink = LayerLink();
  final _atlasPanelScope = FocusScopeNode(debugLabel: 'AtlasPanel');
  final _atlasFirstLink = FocusNode(debugLabel: 'AtlasPanelFirstLink');
  final Map<String, FocusNode> _atlasTabFocus = {};
  final Map<String, AtlasPanelSpec> _atlasSpecs = {};
  String? _atlasOpenKey;
  AtlasPanelSpec? _atlasSpec;
  // A panel opened by hovering closes when the pointer leaves it. One opened
  // with the d-pad follows focus along the tabs instead.
  bool _atlasByHover = false;
  Timer? _atlasHoverTimer;
  Timer? _atlasCloseTimer;
  late final VoidCallback _focusNavbarCallback;
  late final VoidCallback _focusAvatarCallback;
  VoidCallback? _previousFocusNavbarCallback;
  VoidCallback? _previousFocusAvatarCallback;
  FocusNode? _previousFocus;
  // Tracked per instance so only the toolbar that actually held focus
  // clears the shared isFocusedNotifier on dispose.
  bool _toolbarHadFocus = false;
  bool _friendsAvailable = FriendsNavSlot.isAvailable();
  List<AggregatedLibrary> _libraries = [];
  Timer? _clockTimer;
  Timer? _librariesReloadDebounce;
  late final ValueNotifier<String> _currentTime;
  StreamSubscription? _userSub;
  String? _userImageUrl;
  StreamSubscription? _playSub;
  StreamSubscription? _queueSub;

  @override
  void initState() {
    super.initState();
    _currentTime = ValueNotifier<String>('');
    // Guarded so a stale registration from a torn-down toolbar is a safe
    // no-op instead of focusing a disposed node.
    _focusNavbarCallback = () {
      if (!mounted || _homeFocus.context == null) return;
      _homeFocus.requestFocus();
    };
    _focusAvatarCallback = () {
      if (!mounted || _avatarFocus.context == null) return;
      _avatarFocus.requestFocus();
    };
    _previousFocusNavbarCallback = NavigationLayout.focusNavbarNotifier.value;
    _previousFocusAvatarCallback =
        NavigationLayout.focusNavbarAvatarNotifier.value;
    NavigationLayout.focusNavbarNotifier.value = _focusNavbarCallback;
    NavigationLayout.focusNavbarAvatarNotifier.value = _focusAvatarCallback;
    NavigationLayout.chromeFocusRoots.add(_toolbarScopeNode);
    _avatarFocus.addListener(_onAvatarFocusChanged);
    FocusManager.instance.addListener(_trackPreviousFocus);
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
    if (GetIt.instance.isRegistered<AchievementsService>()) {
      GetIt.instance<AchievementsService>().addListener(_onAchievementsChanged);
    }
    _loadLibraries();
    final manager = GetIt.instance<PlaybackManager>();
    _playSub = manager.state.playingStream.listen((_) {
      if (mounted) setState(() {});
    });
    _queueSub = manager.queueService.queueChangedStream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  ModalRoute<dynamic>? _observedRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
    }
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  @override
  void didPopNext() {
    // Our route is current again. An out of order route teardown can leave
    // the focus bridge pointing at a torn-down chrome instance, so re-assert
    // that it targets this live one.
    NavigationLayout.focusNavbarNotifier.value = _focusNavbarCallback;
    NavigationLayout.focusNavbarAvatarNotifier.value = _focusAvatarCallback;
  }

  @override
  void didPushNext() => _closeAtlas();

  @override
  void dispose() {
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
      _observedRoute = null;
    }
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
    _clockTimer?.cancel();
    _librariesReloadDebounce?.cancel();
    // Only clear the shared flag if this instance held focus, so a torn-down
    // route's toolbar can't wipe the state of the one the user is on.
    if (_toolbarHadFocus) {
      TopToolbar.isFocusedNotifier.value = false;
    }
    NavigationLayout.chromeFocusRoots.remove(_toolbarScopeNode);
    _avatarFocus.removeListener(_onAvatarFocusChanged);
    FocusManager.instance.removeListener(_trackPreviousFocus);
    _toolbarScopeNode.dispose();
    _avatarFocus.dispose();
    _homeFocus.dispose();
    _settingsFocus.dispose();
    _serverMessagesFocus.dispose();
    _friendsFocus.dispose();
    _inlineLibrariesTriggerFocus.dispose();
    _musicBarFocusNode.dispose();
    _atlasHoverTimer?.cancel();
    _atlasCloseTimer?.cancel();
    _atlasPanelScope.dispose();
    _atlasFirstLink.dispose();
    for (final node in _atlasTabFocus.values) {
      node.dispose();
    }
    _userSub?.cancel();
    try {
      _viewsRepo.removeListener(_onUserViewsChanged);
    } catch (_) {}
    try {
      GetIt.instance<PluginSyncService>().removeListener(_onPrefsChanged);
    } catch (_) {}
    try {
      GetIt.instance<AchievementsService>().removeListener(
        _onAchievementsChanged,
      );
    } catch (_) {}
    _prefs.removeListener(_onPrefsChanged);
    _currentTime.dispose();
    _playSub?.cancel();
    _queueSub?.cancel();
    super.dispose();
  }

  Color _overlayColor() {
    return OverlayColorPalette.resolveColor(
      _prefs.get(UserPreferences.navbarColor),
    );
  }

  double _overlayOpacity() {
    return _prefs.get(UserPreferences.navbarOpacity) / 100.0;
  }

  Color _toolbarSurfaceColor() {
    if (ThemeRegistry.active.transparentNavbarSurface) {
      return Colors.transparent;
    }
    return _overlayColor().withValues(alpha: _overlayOpacity());
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    if (_style != TopNavbarStyle.atlas) _closeAtlas();
    _updateClock();
    _scheduleLibrariesReload();
    setState(() {});
  }

  void _onUserViewsChanged() {
    if (!mounted) return;
    _scheduleLibrariesReload();
  }

  /// The service also notifies on every badge refresh, which the slot redraws
  /// by itself, so the bar only rebuilds when the button comes or goes.
  void _onAchievementsChanged() {
    final available = FriendsNavSlot.isAvailable();
    if (!mounted || available == _friendsAvailable) return;
    setState(() => _friendsAvailable = available);
  }

  // Collapses a burst of change notifications, like the settings sync
  // applying a whole profile, into a single library reload.
  void _scheduleLibrariesReload() {
    _librariesReloadDebounce?.cancel();
    _librariesReloadDebounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) _loadLibraries();
    });
  }

  void _onAvatarFocusChanged() {
    if (!mounted) return;
    setState(() {});
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

      unawaited(GetIt.instance<GameLibraryRegistry>().refresh());

      final filtered = useMultiServer
          ? await GetIt.instance<LibraryScopeService>().withoutHiddenLibraries(
              libs,
            )
          : libs;

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

  // Kids Mode sends /live-tv back to home, so the guide button would only be a
  // dead end.
  bool get _showLiveTvButton =>
      !_kidsMode &&
      _prefs.get(UserPreferences.showLiveTvButton) &&
      _libraries.any(isLiveTvLibrary);

  List<AggregatedLibrary> get _navLibraries =>
      librariesForNav(_libraries, _showLiveTvButton, hideLiveTv: _kidsMode);

  bool get _kidsMode => _prefs.get(UserPreferences.kidsModeEnabled);

  void _trackPreviousFocus() {
    _followAtlasFocus();
    final primary = FocusManager.instance.primaryFocus;
    if (primary == null) return;
    if (primary.skipTraversal) return;
    // The Atlas panel lives in the overlay, outside the toolbar's focus scope.
    if (_isInsideToolbar(primary) ||
        _isDescendantOf(primary, _atlasPanelScope)) {
      return;
    }
    _previousFocus = primary;
  }

  bool _isInsideToolbar(FocusNode node) {
    FocusNode? current = node;
    while (current != null) {
      if (identical(current, _toolbarScopeNode)) return true;
      current = current.parent;
    }
    return false;
  }

  bool _isDescendantOf(FocusNode? child, FocusNode parent) {
    FocusNode? current = child;
    while (current != null) {
      if (identical(current, parent)) return true;
      current = current.parent;
    }
    return false;
  }

  bool _isUsableOutsideToolbar(FocusNode? node) {
    if (node == null) return false;
    if (node.skipTraversal) return false;
    if (_isInsideToolbar(node)) return false;
    return _isLaidOutFocusNode(node);
  }

  void _restoreFocusBelowToolbar() {
    if (NavigationLayout.focusDetailsPlayButton()) return;
    final focusContent = NavigationLayout.focusContentFromNavbarNotifier.value;
    if (focusContent != null && widget.activeRoute == Destinations.home) {
      focusContent();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final primary = FocusManager.instance.primaryFocus;
        if (primary == null || _isInsideToolbar(primary)) {
          _restoreFocusBelowToolbarFallback();
        }
      });
      return;
    }

    _restoreFocusBelowToolbarFallback();
  }

  void _restoreFocusBelowToolbarFallback() {
    final previous = _previousFocus;
    if (previous != null && _isUsableOutsideToolbar(previous)) {
      previous.requestFocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final primary = FocusManager.instance.primaryFocus;
        if (_isUsableOutsideToolbar(primary)) {
          return;
        }
        _previousFocus = null;
        _moveFocusDown();
      });
      return;
    }
    _previousFocus = null;
    _moveFocusDown();
  }

  /// A node can only take focus once its box exists and has been laid out.
  /// Asking earlier throws out of the focus machinery.
  bool _isReadyForFocus(FocusNode node) {
    final render = node.context?.findRenderObject();
    return render is RenderBox && render.attached && render.hasSize;
  }

  void _moveFocusDown({int attempt = 0}) {
    if (!mounted) return;
    final scope = FocusScope.of(context);
    // Directional traversal measures every candidate it walks, so one node
    // still waiting on layout takes the whole call down. The manual paths below
    // cover the same ground, so a failure here isn't worth surfacing.
    try {
      if (scope.focusInDirection(TraversalDirection.down)) {
        final primary = FocusManager.instance.primaryFocus;
        if (_isUsableOutsideToolbar(primary)) return;
      }
    } catch (_) {}

    final firstBelow = _findFirstFocusableBelowToolbar(scope);
    if (firstBelow != null && _isReadyForFocus(firstBelow)) {
      firstBelow.requestFocus();
      return;
    }
    final fallback = widget.contentFocusNode;
    if (fallback != null && fallback.context != null) {
      final firstContent = _firstFocusableDescendant(fallback);
      if (firstContent != null) {
        if (_isReadyForFocus(firstContent)) {
          firstContent.requestFocus();
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          final primary = FocusManager.instance.primaryFocus;
          if (_isUsableOutsideToolbar(primary)) return;
          if (attempt < 3) {
            _moveFocusDown(attempt: attempt + 1);
          }
        });
      } else if (attempt < 3) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _moveFocusDown(attempt: attempt + 1);
        });
      }
      return;
    }
    if (attempt < 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _moveFocusDown(attempt: attempt + 1);
      });
    }
  }

  /// Where focus goes on leaving the far end of the inline libraries.
  ///
  /// The row has collapsed by now, so its buttons are gone and the trigger is
  /// what sits in their place. Stepping from there lands on whatever is next,
  /// which is downloads or server messages before it reaches settings.
  void _focusAfterInlineLibraries() {
    final moved = _moveWithinToolbar(
      TraversalDirection.right,
      from: _inlineLibrariesTriggerFocus,
    );
    if (!moved) _settingsFocus.requestFocus();
  }

  /// Renders nothing while there is nothing saved.
  Widget _buildDownloadsButton({
    required Color? navColor,
    required bool alwaysExpanded,
    required String label,
  }) {
    return DownloadsNavSlot(
      builder: (context) => ExpandableIconButton(
        key: const ValueKey('toolbar-downloads'),
        forceExpanded: alwaysExpanded,
        icon: Icons.download_for_offline,
        label: label,
        baseColor: navColor,
        onPressed: () => showDownloadsDialog(context),
      ),
    );
  }

  /// Moves focus one button along the toolbar, in painted order.
  ///
  /// [from] names where to step from when focus hasn't landed there yet. A
  /// request applies a microtask later, so a caller that has just moved focus
  /// can't rely on the primary node having caught up.
  bool _moveWithinToolbar(TraversalDirection direction, {FocusNode? from}) {
    final primary = from ?? FocusManager.instance.primaryFocus;
    if (primary == null || !_isInsideToolbar(primary)) return false;

    final insideMusicBar = _isDescendantOf(primary, _musicBarFocusNode);

    final nodes =
        _toolbarScopeNode.descendants
            .where((n) => !n.skipTraversal && _isLaidOutFocusNode(n))
            .where((n) {
              final isMusicNode = _isDescendantOf(n, _musicBarFocusNode);
              return insideMusicBar == isMusicNode;
            })
            .map((n) {
              final box = n.context!.findRenderObject() as RenderBox?;
              final pos = box?.localToGlobal(Offset.zero);
              return (node: n, x: pos?.dx ?? -1.0);
            })
            .where((item) => item.x > 0)
            .toList()
          ..sort((a, b) => a.x.compareTo(b.x));

    final index = nodes.indexWhere((e) => e.node == primary);
    if (index < 0) return false;
    final nextIndex = direction == TraversalDirection.right
        ? index + 1
        : index - 1;
    if (nextIndex < 0 || nextIndex >= nodes.length) return false;
    nodes[nextIndex].node.requestFocus();
    return true;
  }

  FocusNode? _findFirstFocusableBelowToolbar(FocusScopeNode scope) {
    for (final node in scope.traversalDescendants) {
      if (node.skipTraversal) continue;
      if (!_isLaidOutFocusNode(node)) continue;
      if (_isInsideToolbar(node)) continue;
      return node;
    }
    return null;
  }

  FocusNode? _firstFocusableDescendant(FocusNode node) {
    for (final child in node.children) {
      if (!child.skipTraversal && _isLaidOutFocusNode(child)) {
        return child;
      }
      final found = _firstFocusableDescendant(child);
      if (found != null) return found;
    }
    return null;
  }

  bool _isLaidOutFocusNode(FocusNode node) {
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

  bool _isActive(String route) => widget.activeRoute == route;

  /// Phones keep the avatar on home only, so other routes leave the back
  /// arrow on its own.
  bool get _showAvatar =>
      !PlatformDetection.useMobileUi || _isActive(Destinations.home);

  bool get _showBackArrow => widget.showBackButton && !PlatformDetection.isTV;

  TopNavbarStyle get _style =>
      NavigationLayout.sanitizeNavbarPosition(
            _prefs.get(UserPreferences.navbarPosition),
          ) ==
          NavbarPosition.top
      ? _prefs.get(UserPreferences.topNavbarStyle)
      : TopNavbarStyle.classic;

  void _openAtlas(String key, {bool byHover = false, bool focusPanel = false}) {
    final spec = _atlasSpecs[key];
    if (spec == null || !mounted) return;
    _atlasHoverTimer?.cancel();
    _atlasCloseTimer?.cancel();
    setState(() {
      _atlasOpenKey = key;
      _atlasSpec = spec;
      _atlasByHover = byHover;
    });
    _atlasPortal.show();
    if (focusPanel) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _atlasFirstLink.context != null) {
          _atlasFirstLink.requestFocus();
        }
      });
    }
  }

  void _closeAtlas({bool refocusTab = false}) {
    _atlasHoverTimer?.cancel();
    _atlasCloseTimer?.cancel();
    final key = _atlasOpenKey;
    if (key == null) return;
    if (refocusTab) _atlasTabFocus[key]?.requestFocus();
    _atlasOpenKey = null;
    _atlasByHover = false;
    if (_atlasPortal.isShowing) _atlasPortal.hide();
    if (mounted) setState(() {});
  }

  void _scheduleAtlasClose() {
    _atlasCloseTimer?.cancel();
    _atlasCloseTimer = Timer(const Duration(milliseconds: 250), () {
      if (mounted && _atlasByHover) _closeAtlas();
    });
  }

  /// A panel opened from the d-pad follows focus along the tabs, and closes
  /// on a tab without one or once focus leaves the bar.
  void _followAtlasFocus() {
    if (_atlasOpenKey == null || _atlasByHover) return;
    final primary = FocusManager.instance.primaryFocus;
    if (primary == null || _isDescendantOf(primary, _atlasPanelScope)) return;
    for (final entry in _atlasTabFocus.entries) {
      if (identical(entry.value, primary)) {
        if (entry.key != _atlasOpenKey) _openAtlas(entry.key);
        return;
      }
    }
    _closeAtlas();
  }

  void _openFromAtlas(String route, {required bool topLevel}) {
    _closeAtlas();
    if (topLevel) {
      context.navigateTopLevel(route);
    } else {
      context.push(route);
    }
  }

  /// What an Atlas tab with a panel needs: its own focus node so the panel can
  /// hand focus back, Down to open the panel, and the chevron that toggles it.
  ({
    FocusNode focusNode,
    KeyEventResult Function(FocusNode, KeyEvent) onKeyEvent,
    Widget trailing,
    bool attached,
  })
  _atlasTabProps(String key, AtlasPanelSpec spec) {
    _atlasSpecs[key] = spec;
    final node = _atlasTabFocus.putIfAbsent(
      key,
      () => FocusNode(debugLabel: 'AtlasTab $key'),
    );
    final open = _atlasOpenKey == key;
    return (
      focusNode: node,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.arrowDown) {
          _openAtlas(key, focusPanel: true);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      trailing: GestureDetector(
        onTap: () => open ? _closeAtlas() : _openAtlas(key),
        child: Icon(
          open
              ? Icons.keyboard_arrow_up_rounded
              : Icons.keyboard_arrow_down_rounded,
          size: 18,
          color: open ? AppColorScheme.accent : null,
        ),
      ),
      attached: open,
    );
  }

  /// Hovering a tab for a moment opens its panel.
  Widget _atlasHover(String key, Widget child) {
    if (PlatformDetection.isTV || PlatformDetection.useMobileUi) return child;
    return MouseRegion(
      onEnter: (_) {
        _atlasCloseTimer?.cancel();
        if (_atlasOpenKey == key) return;
        _atlasHoverTimer?.cancel();
        _atlasHoverTimer = Timer(const Duration(milliseconds: 300), () {
          if (mounted) _openAtlas(key, byHover: true);
        });
      },
      onExit: (_) {
        _atlasHoverTimer?.cancel();
        if (_atlasByHover) _scheduleAtlasClose();
      },
      child: child,
    );
  }

  /// Phones have no hover, so a tap there toggles the panel instead of opening
  /// the section.
  VoidCallback _atlasPress(String key, VoidCallback open) {
    if (PlatformDetection.useMobileUi) {
      return () => _atlasOpenKey == key ? _closeAtlas() : _openAtlas(key);
    }
    return () {
      _closeAtlas();
      open();
    };
  }

  Widget _buildAtlasOverlay(BuildContext context) {
    final spec = _atlasSpec;
    if (spec == null || _atlasOpenKey == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Positioned.fill(
          child: CompositedTransformFollower(
            link: _atlasLink,
            targetAnchor: Alignment.bottomLeft,
            showWhenUnlinked: false,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _closeAtlas,
              child: const ColoredBox(color: Color(0x8C000000)),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: CompositedTransformFollower(
            link: _atlasLink,
            targetAnchor: Alignment.bottomLeft,
            showWhenUnlinked: false,
            child: MouseRegion(
              onEnter: (_) => _atlasCloseTimer?.cancel(),
              onExit: (_) {
                if (_atlasByHover) _scheduleAtlasClose();
              },
              child: AtlasPanel(
                spec: spec,
                scopeNode: _atlasPanelScope,
                firstFocus: _atlasFirstLink,
                compact: PlatformDetection.useMobileUi,
                onExit: () => _closeAtlas(refocusTab: true),
                onOpen: _openFromAtlas,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Atlas is a solid bar. The navbar color still tints it, at the strength
  /// its opacity setting gives the classic pill.
  Color _atlasBarColor() => Color.alphaBlend(
    _overlayColor().withValues(alpha: _overlayOpacity() * 0.35),
    const Color(0xFF0C0E12),
  ).withValues(alpha: 0.92);

  Widget _buildTablineEnd({required bool showClock}) {
    final l10n = AppLocalizations.of(context);
    return NavButtonStyle(
      style: TopNavbarStyle.classic,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _orderButton(
            order: 95,
            child: ExpandableIconButton(
              key: const ValueKey('toolbar_search'),
              icon: Icons.search_rounded,
              label: l10n.search,
              baseColor: Colors.white.withValues(alpha: 0.85),
              onPressed: () {
                if (_isActive(Destinations.search)) return;
                context.navigateTopLevel(Destinations.search);
              },
            ),
          ),
          if (showClock && !PlatformDetection.useMobileUi) ...[
            const SizedBox(width: 18),
            Center(child: _buildEnd()),
          ],
          if (_showAvatar) ...[
            const SizedBox(width: 18),
            _orderButton(order: 100, child: Center(child: _buildAvatar())),
          ],
        ],
      ),
    );
  }

  /// [endsRow] keeps Right from leaving the bar on TV. [inlineLibrariesBefore]
  /// sends Left back toward the inline libraries.
  Widget _buildSettingsButton({
    required bool endsRow,
    bool inlineLibrariesBefore = false,
    bool forceExpanded = false,
    Color? baseColor,
  }) {
    return _orderButton(
      order: 99,
      child: ExpandableIconButton(
        key: const ValueKey('toolbar_settings'),
        forceExpanded: forceExpanded,
        icon: Icons.settings_rounded,
        label: AppLocalizations.of(context).settings,
        baseColor: baseColor,
        focusNode: _settingsFocus,
        onKeyEvent: (_, event) {
          final isRtl = Directionality.of(context) == TextDirection.rtl;
          final outwardKey = isRtl
              ? LogicalKeyboardKey.arrowLeft
              : LogicalKeyboardKey.arrowRight;
          final inwardKey = isRtl
              ? LogicalKeyboardKey.arrowRight
              : LogicalKeyboardKey.arrowLeft;
          if ((event is KeyDownEvent || event is KeyRepeatEvent) &&
              PlatformDetection.isTV &&
              endsRow &&
              event.logicalKey == outwardKey) {
            return KeyEventResult.handled;
          }
          if (event is KeyDownEvent &&
              event.logicalKey == inwardKey &&
              inlineLibrariesBefore) {
            // Step onto whatever is actually alongside first, since
            // downloads and server messages both sit between the
            // libraries and here. Jumping to the trigger is the
            // fallback for when nothing does, which is what keeps
            // the inline libraries reachable from the end of the row.
            if (!_moveWithinToolbar(TraversalDirection.left)) {
              _inlineLibrariesTriggerFocus.requestFocus();
            }
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        onPressed: () async {
          _closeAtlas();
          await SettingsPanel.open(context, const SettingsSidePanel());
          if (mounted) _settingsFocus.requestFocus();
        },
      ),
    );
  }

  bool _isLibraryActive(AggregatedLibrary lib) {
    final active = widget.activeRoute;
    if (active == null) return false;
    final path = Uri.parse(
      libraryRoute(lib.id, lib.collectionType, lib.name, serverId: lib.serverId),
    ).path;
    return Uri.parse(active).path == path;
  }

  @override
  void didUpdateWidget(covariant TopToolbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeRoute != widget.activeRoute) {
      _previousFocus = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTV = PlatformDetection.useLeanbackUi;
    final isMobile = PlatformDetection.useMobileUi;
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;
    final hPad = isTV
        ? _kOverscanH
        : isMobile
        ? 12.0
        : 32.0;
    final vPad = isTV
        ? _kOverscanV
        : isMobile
        ? 8.0
        : 10.0;
    final clockBehavior = _prefs.get(UserPreferences.clockBehavior);
    final showClock =
        clockBehavior == ClockBehavior.always ||
        clockBehavior == ClockBehavior.inMenus;
    final hasEndSection = !isMobile && showClock;
    final startReservedWidth = switch ((_showAvatar, _showBackArrow)) {
      (true, true) => 96.0,
      (false, false) => 0.0,
      _ => 44.0,
    };
    final endReservedWidth = hasEndSection ? 96.0 : 0.0;
    final centerSidePadding =
        math.max(startReservedWidth, endReservedWidth) + 14.0;
    final toolbarHeight = isTV
        ? _kToolbarHeightTV
        : isMobile
        ? _kToolbarHeightMobile
        : _kToolbarHeightDesktop;

    final manager = GetIt.instance<PlaybackManager>();
    final currentItem = manager.queueService.currentItem;
    final isMusicActive =
        currentItem is AggregatedItem && currentItem.isAudioLike;
    final totalHeight = toolbarHeight + TopToolbar.musicBarExtraHeight();
    final style = _style;

    final toolbar = SafeArea(
      // A TV's overscan margin below already keeps the toolbar off the edges,
      // so the system's side insets would count twice.
      left: !isTV,
      right: !isTV,
      bottom: false,
      child: SizedBox(
        height: totalHeight,
        child: Padding(
          // Atlas tabs reach the bottom edge, so an open one joins its panel.
          padding: style == TopNavbarStyle.atlas
              ? EdgeInsets.fromLTRB(hPad, vPad, hPad, 0)
              : EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Focus(
            focusNode: _toolbarScopeNode,
            onFocusChange: (hasFocus) {
              _toolbarHadFocus = hasFocus;
              TopToolbar.isFocusedNotifier.value = hasFocus;
            },
            onKeyEvent: (_, event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.arrowDown) {
                final primary = FocusManager.instance.primaryFocus;
                if (primary != null) {
                  final insideMusicBar = _isDescendantOf(
                    primary,
                    _musicBarFocusNode,
                  );
                  if (!insideMusicBar && isMusicActive) {
                    final musicNodes =
                        _musicBarFocusNode.descendants
                            .where(
                              (n) =>
                                  !n.skipTraversal && _isLaidOutFocusNode(n),
                            )
                            .map((n) {
                              final box =
                                  n.context!.findRenderObject() as RenderBox?;
                              final pos = box?.localToGlobal(Offset.zero);
                              return (node: n, x: pos?.dx ?? -1.0);
                            })
                            .where((item) => item.x > 0)
                            .toList()
                          ..sort((a, b) => a.x.compareTo(b.x));

                    if (musicNodes.isNotEmpty) {
                      musicNodes.first.node.requestFocus();
                      return KeyEventResult.handled;
                    }
                  }

                  if (widget.activeRoute != Destinations.home &&
                      NavigationLayout.focusDetailsPlayButtonNotifier.value ==
                          null) {
                    final success = primary.focusInDirection(
                      TraversalDirection.down,
                    );
                    if (success) {
                      final newFocus = FocusManager.instance.primaryFocus;
                      if (newFocus != null && _isInsideToolbar(newFocus)) {
                        return KeyEventResult.handled;
                      }
                    }
                  }
                }
                _restoreFocusBelowToolbar();
                return KeyEventResult.handled;
              }
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.arrowUp) {
                final primary = FocusManager.instance.primaryFocus;
                if (primary != null) {
                  final insideMusicBar = _isDescendantOf(
                    primary,
                    _musicBarFocusNode,
                  );
                  if (insideMusicBar) {
                    if (_homeFocus.canRequestFocus) {
                      _homeFocus.requestFocus();
                      return KeyEventResult.handled;
                    }
                    FocusNode? targetNode;
                    for (final n in _toolbarScopeNode.descendants) {
                      if (!n.skipTraversal &&
                          _isLaidOutFocusNode(n) &&
                          !_isDescendantOf(n, _musicBarFocusNode)) {
                        final box =
                            n.context!.findRenderObject() as RenderBox?;
                        final pos = box?.localToGlobal(Offset.zero);
                        if (pos != null && pos.dx > 0) {
                          targetNode = n;
                          break;
                        }
                      }
                    }
                    if (targetNode != null) {
                      targetNode.requestFocus();
                      return KeyEventResult.handled;
                    }
                  }
                }
              }
              if ((PlatformDetection.isTV || PlatformDetection.isDesktop) &&
                  event is KeyDownEvent &&
                  (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
                      event.logicalKey == LogicalKeyboardKey.arrowRight)) {
                final direction =
                    event.logicalKey == LogicalKeyboardKey.arrowLeft
                    ? TraversalDirection.left
                    : TraversalDirection.right;
                _moveWithinToolbar(direction);
                // Always consume so the key can't escape sideways into content.
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FocusTraversalGroup(
                  policy: WidgetOrderTraversalPolicy(),
                  child: style != TopNavbarStyle.classic
                      ? _buildStyledRow(
                          style,
                          toolbarHeight: toolbarHeight,
                          vPad: vPad,
                          showClock: showClock,
                        )
                      : isLandscape
                      ? SizedBox(
                          height: toolbarHeight - (vPad * 2),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: centerSidePadding,
                                  ),
                                  child: _buildCenter(),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: _buildStart(),
                              ),
                              if (!isMobile)
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: _buildEnd(),
                                ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: toolbarHeight - (vPad * 2),
                          child: Row(
                            children: [
                              _buildStart(),
                              const SizedBox(width: 12),
                              Expanded(child: _buildCenter()),
                              if (!isMobile) ...[
                                const SizedBox(width: 12),
                                _buildEnd(),
                              ],
                            ],
                          ),
                        ),
                ),
                if (isMusicActive) ...[
                  const SizedBox(height: 8),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: TopMusicBar(focusNode: _musicBarFocusNode),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
    return _wrapStyle(style, toolbar, totalHeight);
  }

  Widget _wrapStyle(TopNavbarStyle style, Widget toolbar, double totalHeight) {
    final scoped = NavButtonStyle(style: style, child: toolbar);
    switch (style) {
      case TopNavbarStyle.classic:
        return scoped;
      case TopNavbarStyle.tabline:
        final top = MediaQuery.paddingOf(context).top;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: top + totalHeight * 1.9,
              child: const IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xBF000000),
                        Color(0x59000000),
                        Color(0x00000000),
                      ],
                      stops: [0, 0.55, 1],
                    ),
                  ),
                ),
              ),
            ),
            scoped,
          ],
        );
      case TopNavbarStyle.atlas:
        return NavBackGuard(
          open: _atlasOpenKey != null,
          onClose: () => _closeAtlas(refocusTab: true),
          child: CompositedTransformTarget(
            link: _atlasLink,
            child: OverlayPortal(
              controller: _atlasPortal,
              overlayChildBuilder: _buildAtlasOverlay,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: _atlasBarColor(),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                  ),
                ),
                child: scoped,
              ),
            ),
          ),
        );
    }
  }

  Widget _buildStyledRow(
    TopNavbarStyle style, {
    required double toolbarHeight,
    required double vPad,
    required bool showClock,
  }) {
    final isMobile = PlatformDetection.useMobileUi;
    final rowHeight = toolbarHeight - vPad * 2;
    if (style == TopNavbarStyle.tabline) {
      return SizedBox(
        height: rowHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_showBackArrow) ...[
              Center(child: _buildStart(avatar: false)),
              const SizedBox(width: 12),
            ],
            Expanded(child: _buildCenter()),
            const SizedBox(width: 16),
            _buildTablineEnd(showClock: showClock),
          ],
        ),
      );
    }
    return SizedBox(
      height: toolbarHeight - vPad,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: _buildStart()),
          const SizedBox(width: 12),
          Expanded(child: _buildCenter()),
          if (showClock && !isMobile) ...[
            const SizedBox(width: 16),
            Center(child: _buildEnd()),
          ],
          // Phones reach settings from the avatar.
          if (!isMobile) ...[
            const SizedBox(width: 8),
            Center(
              child: SizedBox(
                height: rowHeight,
                child: NavButtonStyle(
                  style: TopNavbarStyle.classic,
                  child: _buildSettingsButton(endsRow: true),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStart({bool avatar = true}) {
    return FocusTraversalOrder(
      order: const NumericFocusOrder(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showAvatar && avatar) _buildAvatar(),
          if (_showBackArrow) ...[
            if (_showAvatar && avatar) const SizedBox(width: 8),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.popOrHome(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _toolbarSurfaceColor(),
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
    );
  }

  Widget _buildAvatar() {
    const avatarSize = _kAvatarSize;
    final avatarFocusVisible = InputModeTracker.showFocusVisuals(
      context,
      _avatarFocus.hasFocus,
    );

    return Focus(
      focusNode: _avatarFocus,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) return KeyEventResult.ignored;
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          _showUserMenu();
          return KeyEventResult.handled;
        }
        if ((PlatformDetection.isTV || PlatformDetection.isDesktop) &&
            event.logicalKey == LogicalKeyboardKey.arrowDown) {
          _restoreFocusBelowToolbar();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: _showUserMenu,
        child: AnimatedScale(
          scale: avatarFocusVisible ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: (avatarFocusVisible && !PlatformDetection.isTV)
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder,
                    )
                  : null,
              color: (avatarFocusVisible && PlatformDetection.isTV)
                  ? Colors.white
                  : null,
            ),
            child: ClipOval(
              child: UserAvatarImage(
                url: _userImageUrl,
                size: avatarSize,
                fallback: _avatarFallback(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatarFallback() {
    final user = _userRepo.currentUser;
    final initial = (user?.name.isNotEmpty == true)
        ? user!.name[0].toUpperCase()
        : '?';
    final isMobile = PlatformDetection.useMobileUi;
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: _kNavbarBackdrop,
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: TextStyle(
          color: Colors.white,
          fontSize: isMobile ? 18 : 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _showUserMenu() {
    showUserMenu(context);
  }

  Widget _buildCenter() {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final showShuffle = _prefs.get(UserPreferences.showShuffleButton);
    final showGenres = _prefs.get(UserPreferences.showGenresButton);
    final showFavorites = _prefs.get(UserPreferences.showFavoritesButton);
    // Checked alongside the show* preferences, never written into them, since
    // those sync and would follow the account to the parent's other devices.
    final kidsMode = _kidsMode;
    final showLiveTv = _showLiveTvButton;
    final navLibraries = _navLibraries;
    final showLibraries =
        !kidsMode && _prefs.get(UserPreferences.showLibrariesInToolbar);
    final showLibrariesIndividually =
        _prefs.get(UserPreferences.showLibrariesIndividually);
    final alwaysExpanded = _prefs.get(UserPreferences.navbarAlwaysExpanded);
    final showSyncPlay =
        !kidsMode &&
        _prefs.get(UserPreferences.syncPlayEnabled) &&
        _prefs.get(UserPreferences.showSyncPlayButton);
    final seerrPrefs = GetIt.instance<SeerrPreferences>();
    final showSeerr =
        !kidsMode &&
        _prefs.get(UserPreferences.showSeerrButton) &&
        GetIt.instance<PluginSyncService>().seerrAvailable;
    final showCalendar =
        !kidsMode &&
        _prefs.get(UserPreferences.showCalendarButton) &&
        GetIt.instance<PluginSyncService>().calendarAvailable;
    final l10n = AppLocalizations.of(context);
    final seerrNavLabel = seerrPrefs.labelOrDefault(l10n.seerr);
    final style = _style;
    final atlas = style == TopNavbarStyle.atlas;
    final tabline = style == TopNavbarStyle.tabline;
    if (atlas) _atlasSpecs.clear();
    // Desktop/macOS keeps the dropdown; inline fan-out is only used where
    // horizontal scroll is natural (TV d-pad or touch).
    final useInlineLibraries =
        !atlas &&
        !showLibrariesIndividually &&
        _prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top &&
        ((alwaysExpanded &&
                (PlatformDetection.isTV || PlatformDetection.useMobileUi)) ||
            ((PlatformDetection.isAndroid || PlatformDetection.isAppleTV) &&
                PlatformDetection.isTV));

    int order = 1;
    var navSlot = 0;
    Color? nextNavColor() {
      final c = AppColorScheme.navColorForSlot(navSlot);
      if (c != null) navSlot += 1;
      return c;
    }

    return Align(
      alignment: style == TopNavbarStyle.classic
          ? Alignment.center
          : AlignmentDirectional.centerStart,
      child: _wrapPill(
        isNeon: isNeon,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _orderButton(
                order: (order++).toDouble(),
                child: ExpandableIconButton(
                  key: const ValueKey('toolbar_home'),
                  selected: _isActive(Destinations.home),
                  forceExpanded: alwaysExpanded,
                  icon: Icons.home_rounded,
                  label: l10n.home,
                  baseColor: nextNavColor(),
                  focusNode: _homeFocus,
                  onPressed: () {
                    if (_isActive(Destinations.home)) {
                      homeRefreshBus.request(newMediaBar: true);
                      return;
                    }
                    homeRefreshBus.requestAfterNavigation();
                    context.go(Destinations.home);
                  },
                ),
              ),
              // Tabline keeps search with the avatar on the right.
              if (!tabline) ...[
              _gap(),
              _orderButton(
                order: (order++).toDouble(),
                child: ExpandableIconButton(
                  key: const ValueKey('toolbar_search'),
                  forceExpanded: alwaysExpanded,
                  icon: Icons.search_rounded,
                  label: l10n.search,
                  baseColor: nextNavColor(),
                  onPressed: () {
                    if (_isActive(Destinations.search)) return;
                    context.navigateTopLevel(Destinations.search);
                  },
                ),
              ),
              ],
              if (showShuffle) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_shuffle'),
                    forceExpanded: alwaysExpanded,
                    icon: Icons.shuffle_rounded,
                    label: l10n.shuffle,
                    baseColor: nextNavColor(),
                    onPressed: () => showShuffleOverlay(context),
                  ),
                ),
              ],
              if (showGenres) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_genres'),
                    selected: _isActive(Destinations.allGenres),
                    forceExpanded: alwaysExpanded,
                    baseColor: nextNavColor(),
                    iconBuilder: (size, color) => Image.asset(
                      'assets/icons/genres.png',
                      width: size,
                      height: size,
                      color: color,
                      fit: BoxFit.contain,
                    ),
                    label: l10n.genres,
                    onPressed: () {
                      if (_isActive(Destinations.allGenres)) return;
                      context.navigateTopLevel(Destinations.allGenres);
                    },
                  ),
                ),
              ],
              if (showFavorites) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_favorites'),
                    selected: _isActive(Destinations.allFavorites),
                    forceExpanded: alwaysExpanded,
                    icon: Icons.favorite_rounded,
                    label: l10n.favorites,
                    baseColor: nextNavColor(),
                    onPressed: () {
                      if (_isActive(Destinations.allFavorites)) return;
                      context.navigateTopLevel(Destinations.allFavorites);
                    },
                  ),
                ),
              ],
              if (showLiveTv) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: _navButton(
                    key: const ValueKey('toolbar_livetv'),
                    selected: _isActive(Destinations.liveTvGuide),
                    atlasKey: 'livetv',
                    atlasSpec: atlas ? atlasLiveTvSpec(l10n) : null,
                    forceExpanded: alwaysExpanded,
                    icon: Icons.live_tv_rounded,
                    label: l10n.liveTv,
                    baseColor: nextNavColor(),
                    onPressed: () {
                      if (_isActive(Destinations.liveTvGuide)) return;
                      context.navigateTopLevel(Destinations.liveTvGuide);
                    },
                  ),
                ),
              ],
              if (showSyncPlay) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_syncplay'),
                    forceExpanded: alwaysExpanded,
                    icon: Icons.groups_rounded,
                    label: l10n.watchParties,
                    baseColor: nextNavColor(),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => watchTogetherScreen(),
                      ),
                    ),
                  ),
                ),
              ],
              if (showSeerr) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: _navButton(
                    key: const ValueKey('toolbar_seerr'),
                    selected: _isActive(Destinations.seerrDiscover),
                    atlasKey: 'seerr',
                    atlasSpec: atlas ? atlasSeerrSpec(l10n, seerrNavLabel) : null,
                    forceExpanded: alwaysExpanded,
                    baseColor: nextNavColor(),
                    iconBuilder: (size, color) => seerrPrefs.isSeerrVariant
                        ? SeerrIcon(size: size, color: color)
                        : SeerrIcon(size: size, color: color),
                    label: seerrNavLabel,
                    onPressed: () {
                      if (_isActive(Destinations.seerrDiscover)) return;
                      context.navigateTopLevel(Destinations.seerrDiscover);
                    },
                  ),
                ),
              ],
              if (showCalendar) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_calendar'),
                    selected: _isActive(Destinations.calendar),
                    forceExpanded: alwaysExpanded,
                    baseColor: nextNavColor(),
                    icon: Icons.calendar_month_rounded,
                    label: l10n.calendar,
                    onPressed: () {
                      if (_isActive(Destinations.calendar)) return;
                      context.navigateTopLevel(Destinations.calendar);
                    },
                  ),
                ),
              ],
              if (showLibraries && showLibrariesIndividually)
                for (final lib in navLibraries) ...[
                  _gap(),
                  _orderButton(
                    order: (order++).toDouble(),
                    child: _navButton(
                      // Two servers can share a library id, so the key is the
                      // library itself.
                      key: ObjectKey(lib),
                      selected: _isLibraryActive(lib),
                      atlasKey: 'lib:${lib.serverId}:${lib.id}',
                      atlasSpec: atlas ? atlasLibrarySpec(l10n, lib) : null,
                      forceExpanded: alwaysExpanded,
                      icon: libraryIcon(lib),
                      label: lib.name,
                      baseColor: nextNavColor(),
                      onPressed: () => _openLibrary(lib),
                    ),
                  ),
                ]
              else if (showLibraries && navLibraries.isNotEmpty) ...[
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: atlas
                      ? _navButton(
                          key: const ValueKey('toolbar_libraries_atlas'),
                          forceExpanded: alwaysExpanded,
                          iconBuilder: (size, color) => Image.asset(
                            'assets/icons/clapperboard.png',
                            width: size,
                            height: size,
                            color: color,
                            fit: BoxFit.contain,
                          ),
                          label: l10n.libraries,
                          baseColor: nextNavColor(),
                          atlasKey: 'libraries',
                          atlasSpec: atlasLibrariesSpec(l10n, navLibraries),
                          onPressed: () =>
                              _openAtlas('libraries', focusPanel: true),
                        )
                      : useInlineLibraries
                      ? _buildInlineLibrariesButton(
                          l10n,
                          iconColor: nextNavColor(),
                          alwaysExpanded: alwaysExpanded,
                        )
                      : _buildLibrariesButton(
                          iconColor: nextNavColor(),
                          alwaysExpanded: alwaysExpanded,
                        ),
                ),
              ],
              _gap(),
              if (DownloadsNavSlot.isOffered())
                _orderButton(
                  order: 97,
                  // The slot is taken here rather than inside the builder, so
                  // the icons after it keep their colour whether or not
                  // anything is saved to show.
                  child: _buildDownloadsButton(
                    navColor: nextNavColor(),
                    alwaysExpanded: alwaysExpanded,
                    label: l10n.savedMedia,
                  ),
                ),
              if (FriendsNavSlot.isOffered() && _friendsAvailable)
                _orderButton(
                  order: 97.5,
                  // Only taken where the plugin has friends on, so on every
                  // other server the icons after it keep their color.
                  child: _buildFriendsButton(
                    navColor: nextNavColor(),
                    alwaysExpanded: alwaysExpanded,
                    label: l10n.friends,
                  ),
                ),
              if (_prefs.get(UserPreferences.showServerMessagesButton))
                _orderButton(
                  order: 98,
                  // The slot is taken here rather than inside the builder, so the
                  // settings icon keeps its colour whether or not there are any
                  // messages to show.
                  child: _buildServerMessagesButton(
                    navColor: nextNavColor(),
                    alwaysExpanded: alwaysExpanded,
                    label: l10n.serverMessages,
                  ),
                ),
              // The TV avatar menu has no settings, so Tabline keeps a
              // Settings tab there.
              if (style == TopNavbarStyle.classic ||
                  (tabline && PlatformDetection.isTV))
                _buildSettingsButton(
                  // Settings ends the classic row. Tabline has search and the
                  // avatar after it.
                  endsRow: style == TopNavbarStyle.classic,
                  inlineLibrariesBefore:
                      useInlineLibraries &&
                      showLibraries &&
                      navLibraries.isNotEmpty,
                  forceExpanded: alwaysExpanded,
                  baseColor: nextNavColor(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// A center button that, in Atlas, can also drop a panel.
  Widget _navButton({
    required Key key,
    required String label,
    IconData? icon,
    Widget Function(double size, Color color)? iconBuilder,
    bool forceExpanded = false,
    Color? baseColor,
    bool selected = false,
    required String atlasKey,
    AtlasPanelSpec? atlasSpec,
    required VoidCallback onPressed,
  }) {
    final props = atlasSpec == null
        ? null
        : _atlasTabProps(atlasKey, atlasSpec);
    final button = ExpandableIconButton(
      key: key,
      forceExpanded: forceExpanded,
      icon: icon,
      iconBuilder: iconBuilder,
      label: label,
      baseColor: baseColor,
      selected: selected,
      focusNode: props?.focusNode,
      onKeyEvent: props?.onKeyEvent,
      trailing: props?.trailing,
      attachedBelow: props?.attached ?? false,
      onPressed: props == null ? onPressed : _atlasPress(atlasKey, onPressed),
    );
    return props == null ? button : _atlasHover(atlasKey, button);
  }

  Widget _wrapPill({required bool isNeon, required Widget child}) {
    if (_style != TopNavbarStyle.classic) return child;
    if (AppColorScheme.isGlass) {
      return GlassSurface(
        cornerRadius: _kPillRadius,
        fallbackColor: Colors.transparent,
        child: child,
      );
    }
    return ClipRRect(
      borderRadius: AppRadius.circular(_kPillRadius),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: _toolbarSurfaceColor(),
          borderRadius: AppRadius.circular(_kPillRadius),
          border: isNeon
              ? Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: AppColorScheme.accent,
                    width: 1.0,
                  ),
                )
              : null,
          boxShadow: isNeon
              ? const [BoxShadow(color: Color(0x33FF2E92), blurRadius: 6)]
              : null,
        ),
        child: child,
      ),
    );
  }

  void _openLibrary(AggregatedLibrary lib) {
    context.navigateTopLevel(
      libraryRoute(
        lib.id,
        lib.collectionType,
        lib.name,
        serverId: lib.serverId,
      ),
    );
  }

  Widget _buildLibrariesButton({
    Color? iconColor,
    bool alwaysExpanded = false,
  }) {
    return _LibrariesDropdown(
      key: const ValueKey('toolbar_libraries'),
      activeRoute: widget.activeRoute,
      libraries: _navLibraries,
      surfaceColor: _toolbarSurfaceColor(),
      iconColor: iconColor,
      alwaysExpanded: alwaysExpanded,
      onLibraryTap: _openLibrary,
    );
  }

  Widget _buildInlineLibrariesButton(
    AppLocalizations l10n, {
    Color? iconColor,
    bool alwaysExpanded = false,
  }) {
    return _AndroidTvExpandableLibrariesButton(
      key: const ValueKey('toolbar_libraries_inline_tv'),
      activeRoute: widget.activeRoute,
      libraries: _navLibraries,
      label: l10n.libraries,
      iconColor: iconColor,
      alwaysExpanded: alwaysExpanded,
      triggerFocusNode: _inlineLibrariesTriggerFocus,
      onExitForward: _focusAfterInlineLibraries,
      onLibraryTap: _openLibrary,
    );
  }

  /// The messages button, or nothing when there is nothing to show. The nav
  /// colour is passed in so the caller decides which palette slot it takes.
  /// The gap to the next button travels with it, so it only takes up room when
  /// the button is there.
  Widget _buildServerMessagesButton({
    required Color? navColor,
    required bool alwaysExpanded,
    required String label,
  }) {
    return ServerMessagesNavSlot(
      builder: (context, unread) => Row(
        mainAxisSize: MainAxisSize.min,
        // Stretch like the bare buttons, or the hover pill stops short of the
        // bar's height.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExpandableIconButton(
            key: const ValueKey('toolbar_server_messages'),
            forceExpanded: alwaysExpanded,
            icon: Icons.info_outline_rounded,
            label: label,
            baseColor: navColor,
            badgeCount: unread,
            focusNode: _serverMessagesFocus,
            onPressed: () async {
              await showServerMessagesDialog(context);
              if (mounted) _serverMessagesFocus.requestFocus();
            },
          ),
          _gap(),
        ],
      ),
    );
  }

  /// The friends button, or nothing when the server has no friends feature.
  /// The gap to the next button travels with it, like the messages button.
  Widget _buildFriendsButton({
    required Color? navColor,
    required bool alwaysExpanded,
    required String label,
  }) {
    return FriendsNavSlot(
      builder: (context, badge) => Row(
        mainAxisSize: MainAxisSize.min,
        // Stretch like the bare buttons, or the hover pill stops short of the
        // bar's height.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExpandableIconButton(
            key: const ValueKey('toolbar_friends'),
            forceExpanded: alwaysExpanded,
            icon: Icons.people_alt_rounded,
            label: label,
            baseColor: navColor,
            badgeCount: badge,
            focusNode: _friendsFocus,
            onPressed: () async {
              await FriendsNavSlot.open(context);
              if (mounted) _friendsFocus.requestFocus();
            },
          ),
          _gap(),
        ],
      ),
    );
  }

  Widget _buildEnd() {
    final clockBehavior = _prefs.get(UserPreferences.clockBehavior);
    final showClock =
        clockBehavior == ClockBehavior.always ||
        clockBehavior == ClockBehavior.inMenus;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    if (!showClock) return const SizedBox.shrink();

    return ValueListenableBuilder<String>(
      valueListenable: _currentTime,
      builder: (context, time, _) {
        return Text(
          time,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: isNeon
                ? AppColorScheme.onSurface
                : Colors.white.withValues(alpha: 0.9),
            fontSize: 22,
            fontWeight: FontWeight.w500,
            shadows: isNeon
                ? const [Shadow(color: Color(0x6600E5FF), blurRadius: 8)]
                : null,
          ),
        );
      },
    );
  }

  Widget _gap() => SizedBox(
    width: PlatformDetection.useLeanbackUi
        ? _kButtonSpacingTV
        : PlatformDetection.useMobileUi
        ? _kButtonSpacingMobile
        : _kButtonSpacing,
  );

  Widget _orderButton({required double order, required Widget child}) {
    return FocusTraversalOrder(order: NumericFocusOrder(order), child: child);
  }
}

class _LibrariesDropdown extends StatefulWidget {
  final String? activeRoute;
  final List<AggregatedLibrary> libraries;
  final Color surfaceColor;
  final Color? iconColor;
  final bool alwaysExpanded;
  final ValueChanged<AggregatedLibrary> onLibraryTap;

  const _LibrariesDropdown({
    super.key,
    this.activeRoute,
    required this.libraries,
    required this.surfaceColor,
    this.iconColor,
    this.alwaysExpanded = false,
    required this.onLibraryTap,
  });

  @override
  State<_LibrariesDropdown> createState() => _LibrariesDropdownState();
}

class _AndroidTvExpandableLibrariesButton extends StatefulWidget {
  final String? activeRoute;
  final List<AggregatedLibrary> libraries;
  final String label;
  final Color? iconColor;
  final bool alwaysExpanded;
  final FocusNode? triggerFocusNode;

  /// Called when focus leaves the far end of the row, once it has collapsed.
  final VoidCallback? onExitForward;
  final ValueChanged<AggregatedLibrary> onLibraryTap;

  const _AndroidTvExpandableLibrariesButton({
    super.key,
    this.activeRoute,
    required this.libraries,
    required this.label,
    this.iconColor,
    this.alwaysExpanded = false,
    this.triggerFocusNode,
    this.onExitForward,
    required this.onLibraryTap,
  });

  @override
  State<_AndroidTvExpandableLibrariesButton> createState() =>
      _AndroidTvExpandableLibrariesButtonState();
}

class _AndroidTvExpandableLibrariesButtonState
    extends State<_AndroidTvExpandableLibrariesButton> {
  bool _expanded = false;
  final FocusNode _ownedTriggerFocusNode = FocusNode(
    debugLabel: 'TopToolbarLibrariesTriggerInline',
  );
  final List<FocusNode> _libraryFocusNodes = [];
  final List<GlobalKey> _libraryItemKeys = [];

  FocusNode get _triggerFocusNode =>
      widget.triggerFocusNode ?? _ownedTriggerFocusNode;

  @override
  void initState() {
    super.initState();
    _syncLibraryFocusNodes();
  }

  @override
  void didUpdateWidget(
    covariant _AndroidTvExpandableLibrariesButton oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    _syncLibraryFocusNodes();
  }

  @override
  void dispose() {
    _ownedTriggerFocusNode.dispose();
    for (final node in _libraryFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _syncLibraryFocusNodes() {
    while (_libraryFocusNodes.length < widget.libraries.length) {
      _libraryFocusNodes.add(
        FocusNode(
          debugLabel: 'TopToolbarInlineLibrary_${_libraryFocusNodes.length}',
        ),
      );
    }
    while (_libraryFocusNodes.length > widget.libraries.length) {
      _libraryFocusNodes.removeLast().dispose();
    }
    while (_libraryItemKeys.length < widget.libraries.length) {
      _libraryItemKeys.add(GlobalKey());
    }
    while (_libraryItemKeys.length > widget.libraries.length) {
      _libraryItemKeys.removeLast();
    }
  }

  void _focusLibraryAt(int index) {
    if (index < 0 || index >= _libraryFocusNodes.length) return;
    _libraryFocusNodes[index].requestFocus();
  }

  void _ensureLibraryVisible(int index) {
    if (index < 0 || index >= _libraryItemKeys.length) return;
    final ctx = _libraryItemKeys[index].currentContext;
    if (ctx == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        alignment: 0.5,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
    });
  }

  void _moveFocusToNextAfterLibraries() {
    if (!mounted) return;
    if (_expanded) {
      setState(() => _expanded = false);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final exit = widget.onExitForward;
      if (exit != null) {
        exit();
        return;
      }
      FocusScope.of(context).nextFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final inlineLibrariesWidth = (MediaQuery.sizeOf(context).width * 0.36)
        .clamp(280.0, 560.0);

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (hasFocus) {
        if (!hasFocus && _expanded && mounted) {
          setState(() => _expanded = false);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ToolbarLibrariesTriggerButton(
            key: const ValueKey('toolbar_libraries_trigger'),
            focusNode: _triggerFocusNode,
            label: widget.label,
            expanded: _expanded,
            iconColor: widget.iconColor,
            alwaysExpanded: widget.alwaysExpanded,
            onMoveRight: () {
              if (!_expanded || _libraryFocusNodes.isEmpty) return;
              _focusLibraryAt(0);
            },
            onPressed: () {
              if (!mounted) return;
              setState(() => _expanded = !_expanded);
            },
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            child: _expanded
                ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      width: inlineLibrariesWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final entry in widget.libraries.indexed)
                              Padding(
                                key: _libraryItemKeys[entry.$1],
                                padding: const EdgeInsets.only(right: 4),
                                child: _ToolbarLibraryLabelButton(
                                  key: ValueKey(
                                    'toolbar_library_${entry.$2.id}',
                                  ),
                                  focusNode: _libraryFocusNodes[entry.$1],
                                  label: entry.$2.name,
                                  onFocusChanged: (focused) {
                                    if (focused) {
                                      _ensureLibraryVisible(entry.$1);
                                    }
                                  },
                                  onMoveLeft: () {
                                    final i = entry.$1;
                                    if (i <= 0) {
                                      _triggerFocusNode.requestFocus();
                                      return;
                                    }
                                    _focusLibraryAt(i - 1);
                                  },
                                  onMoveRight: () {
                                    final i = entry.$1;
                                    if (i >= _libraryFocusNodes.length - 1) {
                                      _moveFocusToNextAfterLibraries();
                                      return;
                                    }
                                    _focusLibraryAt(i + 1);
                                  },
                                  onPressed: () {
                                    widget.onLibraryTap(entry.$2);
                                    if (!mounted) return;
                                    setState(() => _expanded = false);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _ToolbarLibrariesTriggerButton extends StatefulWidget {
  final String label;
  final bool expanded;
  final bool alwaysExpanded;
  final FocusNode? focusNode;
  final Color? iconColor;
  final VoidCallback? onMoveRight;
  final VoidCallback onPressed;

  const _ToolbarLibrariesTriggerButton({
    super.key,
    required this.label,
    required this.expanded,
    this.alwaysExpanded = false,
    this.focusNode,
    this.iconColor,
    this.onMoveRight,
    required this.onPressed,
  });

  @override
  State<_ToolbarLibrariesTriggerButton> createState() =>
      _ToolbarLibrariesTriggerButtonState();
}

class _ToolbarLibrariesTriggerButtonState
    extends State<_ToolbarLibrariesTriggerButton> {
  final _prefs = GetIt.instance<UserPreferences>();
  bool _focused = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isLeanback = PlatformDetection.useLeanbackUi;
    final showLabel = _focused || _hovered || widget.alwaysExpanded;

    final Color bgColor;
    final Color fgColor;
    if (isLeanback) {
      final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
      final highlighted = _focused || widget.expanded;
      bgColor = highlighted ? Colors.white : Colors.transparent;
      fgColor = highlighted
          ? Colors.black
          : (widget.iconColor ??
                (isNeon
                    ? AppColorScheme.accent
                    : Colors.white.withValues(alpha: 0.6)));
    } else {
      final focusColor = Color(
        _prefs.get(UserPreferences.focusColor).colorValue,
      );
      final base =
          widget.iconColor ?? AppColorScheme.onSurface.withValues(alpha: 0.6);
      final active = _focused || _hovered || widget.expanded;
      bgColor = active
          ? focusColor.withValues(alpha: 0.18)
          : Colors.transparent;
      fgColor = active ? focusColor : base;
    }

    final hoverEnabled = !isLeanback;
    return MouseRegion(
      onEnter: hoverEnabled
          ? (_) {
              if (mounted && !_hovered) setState(() => _hovered = true);
            }
          : null,
      onExit: hoverEnabled
          ? (_) {
              if (mounted && _hovered) setState(() => _hovered = false);
            }
          : null,
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) {
          if (_focused != focused && mounted) {
            setState(() => _focused = focused);
          }
        },
        onKeyEvent: (_, event) {
          if (event is KeyDownEvent &&
              (event.logicalKey == LogicalKeyboardKey.select ||
                  event.logicalKey == LogicalKeyboardKey.enter)) {
            widget.onPressed();
            return KeyEventResult.handled;
          }
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowRight &&
              widget.expanded &&
              widget.onMoveRight != null) {
            widget.onMoveRight!.call();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: NavButtonStyle.of(context) == TopNavbarStyle.tabline
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TablineTabLabel(
                    label: widget.label,
                    focused: InputModeTracker.showFocusVisuals(context, _focused),
                    selected: widget.expanded,
                    hovered: _hovered,
                    fontSize: tablineFontSize(
                      isMobile: PlatformDetection.useMobileUi,
                      isTV: PlatformDetection.isTV,
                    ),
                  ),
                )
              : AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            constraints: const BoxConstraints(minHeight: 44),
            padding: EdgeInsets.symmetric(
              horizontal: showLabel ? 18 : 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: AppRadius.circular(36),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/clapperboard.png',
                  width: 24,
                  height: 24,
                  color: fgColor,
                  fit: BoxFit.contain,
                ),
                if (showLabel) ...[
                  const SizedBox(width: 10),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: fgColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolbarLibraryLabelButton extends StatefulWidget {
  final FocusNode? focusNode;
  final String label;
  final ValueChanged<bool>? onFocusChanged;
  final VoidCallback? onMoveLeft;
  final VoidCallback? onMoveRight;
  final VoidCallback onPressed;

  const _ToolbarLibraryLabelButton({
    super.key,
    this.focusNode,
    required this.label,
    this.onFocusChanged,
    this.onMoveLeft,
    this.onMoveRight,
    required this.onPressed,
  });

  @override
  State<_ToolbarLibraryLabelButton> createState() =>
      _ToolbarLibraryLabelButtonState();
}

class _ToolbarLibraryLabelButtonState
    extends State<_ToolbarLibraryLabelButton> {
  final _prefs = GetIt.instance<UserPreferences>();
  bool _focused = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isLeanback = PlatformDetection.useLeanbackUi;
    final active = _focused || _hovered;
    final Color bgColor;
    final Color fgColor;
    if (isLeanback) {
      bgColor = _focused ? Colors.white : Colors.transparent;
      fgColor = _focused ? Colors.black : Colors.white;
    } else {
      final focusColor = Color(
        _prefs.get(UserPreferences.focusColor).colorValue,
      );
      bgColor = active
          ? focusColor.withValues(alpha: 0.18)
          : Colors.transparent;
      fgColor = active
          ? focusColor
          : AppColorScheme.onSurface.withValues(alpha: 0.85);
    }

    final hoverEnabled = !isLeanback;
    return MouseRegion(
      onEnter: hoverEnabled
          ? (_) {
              if (mounted && !_hovered) setState(() => _hovered = true);
            }
          : null,
      onExit: hoverEnabled
          ? (_) {
              if (mounted && _hovered) setState(() => _hovered = false);
            }
          : null,
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) {
          if (_focused != focused && mounted) {
            setState(() => _focused = focused);
          }
          widget.onFocusChanged?.call(focused);
        },
        onKeyEvent: (_, event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowLeft &&
              widget.onMoveLeft != null) {
            widget.onMoveLeft!.call();
            return KeyEventResult.handled;
          }
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.arrowRight &&
              widget.onMoveRight != null) {
            widget.onMoveRight!.call();
            return KeyEventResult.handled;
          }
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
          child: NavButtonStyle.of(context) == TopNavbarStyle.tabline
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TablineTabLabel(
                    label: widget.label,
                    focused: InputModeTracker.showFocusVisuals(context, _focused),
                    hovered: _hovered,
                    fontSize: tablineFontSize(
                      isMobile: PlatformDetection.useMobileUi,
                      isTV: PlatformDetection.isTV,
                    ),
                  ),
                )
              : AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            constraints: const BoxConstraints(minHeight: 44),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: active
                ? BoxDecoration(
                    color: bgColor,
                    borderRadius: AppRadius.circular(22),
                  )
                : null,
            child: Text(
              widget.label,
              style: TextStyle(
                color: fgColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LibrariesDropdownState extends State<_LibrariesDropdown> {
  final _targetKey = GlobalKey();
  final _layerLink = LayerLink();
  final _buttonFocusNode = FocusNode(debugLabel: 'TopToolbarLibraries');
  final List<FocusNode> _itemFocusNodes = [];
  OverlayEntry? _overlayEntry;
  bool _buttonHovered = false;
  bool _dropdownHovered = false;
  Timer? _hideTimer;
  bool _openToLeft = false;
  double _menuWidth = 220;

  @override
  void initState() {
    super.initState();
    _syncItemFocusNodes();
  }

  @override
  void didUpdateWidget(covariant _LibrariesDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncItemFocusNodes();
    if (oldWidget.activeRoute != widget.activeRoute && _overlayEntry != null) {
      _hideDropdown();
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _removeOverlay();
    _buttonFocusNode.dispose();
    for (final node in _itemFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _syncItemFocusNodes() {
    while (_itemFocusNodes.length < widget.libraries.length) {
      _itemFocusNodes.add(
        FocusNode(
          debugLabel: 'TopToolbarLibraryItem_${_itemFocusNodes.length}',
        ),
      );
    }
    while (_itemFocusNodes.length > widget.libraries.length) {
      _itemFocusNodes.removeLast().dispose();
    }
  }

  bool _hasManagedFocus(FocusNode? node) {
    if (node == null) return false;
    if (identical(node, _buttonFocusNode)) return true;
    return _itemFocusNodes.any((candidate) => identical(candidate, node));
  }

  void _handleManagedFocusChange() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _overlayEntry == null) return;
      final current = FocusManager.instance.primaryFocus;
      if (!_hasManagedFocus(current) && !_buttonHovered && !_dropdownHovered) {
        _hideDropdown();
      }
    });
  }

  void _removeOverlay() {
    InlineBackInterceptor.remove(_closeFromBack);
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // The dropdown is an overlay entry rather than a route, so nothing pops it on
  // back. Registering it lets the key close it instead of leaving the page.
  bool _closeFromBack() {
    _hideDropdown(focusButton: true);
    return true;
  }

  double _calculateMenuWidth(BuildContext context, double screenWidth) {
    final baseStyle = (Theme.of(context).textTheme.bodyMedium ??
            const TextStyle())
        .copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );
    final textPainter = TextPainter(
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    );
    double maxTextWidth = 0.0;
    for (final lib in widget.libraries) {
      textPainter.text = TextSpan(
        text: lib.name,
        style: baseStyle,
      );
      textPainter.layout();
      if (textPainter.width > maxTextWidth) {
        maxTextWidth = textPainter.width;
      }
    }
    textPainter.dispose();

    const horizontalPadding = 44.0;
    final contentWidth = maxTextWidth + horizontalPadding;
    final maxAllowed = (screenWidth - 24).clamp(140.0, 320.0);
    return contentWidth.clamp(140.0, maxAllowed);
  }

  void _showDropdown({bool focusFirstItem = false}) {
    _hideTimer?.cancel();
    if (_overlayEntry != null) return;

    final screenWidth = MediaQuery.of(context).size.width;
    _menuWidth = _calculateMenuWidth(context, screenWidth);

    final targetBox =
        _targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (targetBox != null) {
      final targetLeft = targetBox.localToGlobal(Offset.zero).dx;
      final wouldOverflowRight = targetLeft + _menuWidth > screenWidth - 8;
      _openToLeft = wouldOverflowRight;
    } else {
      _openToLeft = false;
    }

    _overlayEntry = OverlayEntry(builder: _buildOverlay);
    Overlay.of(context).insert(_overlayEntry!);
    InlineBackInterceptor.push(_closeFromBack);
    setState(() {});

    if (focusFirstItem && _itemFocusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _overlayEntry != null) {
          _itemFocusNodes.first.requestFocus();
        }
      });
    }
  }

  void _hideDropdown({bool focusButton = false}) {
    _removeOverlay();
    setState(() {});

    if (focusButton) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _buttonFocusNode.requestFocus();
        }
      });
    }
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 200), () {
      if (!_buttonHovered &&
          !_dropdownHovered &&
          !_hasManagedFocus(FocusManager.instance.primaryFocus)) {
        _hideDropdown();
      }
    });
  }

  Widget _buildOverlay(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxMenuHeight = (screenHeight - 120).clamp(220.0, 520.0);

    final content = Align(
      alignment: _openToLeft ? Alignment.topRight : Alignment.topLeft,
      child: MouseRegion(
        onEnter: (_) {
          _dropdownHovered = true;
          _hideTimer?.cancel();
        },
        onExit: (_) {
          _dropdownHovered = false;
          _scheduleHide();
        },
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: AppRadius.circular(12),
            child: GlassSettings.blursBackdrop
                ? BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: GlassSettings.capSigma(20),
                      sigmaY: GlassSettings.capSigma(20),
                    ),
                    child: _dropdownContent(maxMenuHeight),
                  )
                : _dropdownContent(maxMenuHeight),
          ),
        ),
      ),
    );

    final follower = CompositedTransformFollower(
      link: _layerLink,
      targetAnchor: _openToLeft ? Alignment.bottomRight : Alignment.bottomLeft,
      followerAnchor: _openToLeft ? Alignment.topRight : Alignment.topLeft,
      offset: const Offset(0, 4),
      child: content,
    );

    if (!PlatformDetection.isMobile) return follower;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _hideDropdown(),
          ),
        ),
        follower,
      ],
    );
  }

  Widget _dropdownContent(double maxMenuHeight) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final borderColor = isNeon
        ? AppColorScheme.accent
        : ThemeRegistry.active.borders.chipBorder.color;

    return Container(
      width: _menuWidth,
      constraints: BoxConstraints(
        maxHeight: maxMenuHeight,
      ),
      decoration: BoxDecoration(
        color: widget.surfaceColor,
        borderRadius: AppRadius.circular(12),
        border: Border.all(
          color: borderColor,
          width: 1.2,
        ),
        boxShadow: [
          if (isNeon)
            BoxShadow(
              color: AppColorScheme.accent.withValues(alpha: 0.25),
              blurRadius: 16,
              spreadRadius: 1,
            ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: widget.libraries.indexed
              .map(
                (entry) => _LibraryDropdownItem(
                  focusNode: _itemFocusNodes[entry.$1],
                  isFirst: entry.$1 == 0,
                  isLast: entry.$1 == widget.libraries.length - 1,
                  name: entry.$2.name,
                  onFocusChanged: (_) => _handleManagedFocusChange(),
                  onMoveUpFromFirst: () => _hideDropdown(focusButton: true),
                  onMoveDown: entry.$1 < widget.libraries.length - 1
                      ? () => _itemFocusNodes[entry.$1 + 1].requestFocus()
                      : null,
                  onMoveUp: entry.$1 > 0
                      ? () => _itemFocusNodes[entry.$1 - 1].requestFocus()
                      : null,
                  onTap: () {
                    _hideDropdown();
                    widget.onLibraryTap(entry.$2);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      key: _targetKey,
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          _buttonHovered = true;
        },
        onExit: (_) {
          _buttonHovered = false;
          _scheduleHide();
        },
        child: ExpandableIconButton(
          baseColor: widget.iconColor,
          forceExpanded: widget.alwaysExpanded || _overlayEntry != null,
          focusNode: _buttonFocusNode,
          onFocusChanged: (_) => _handleManagedFocusChange(),
          onKeyEvent: (_, event) {
            if (event is! KeyDownEvent) return KeyEventResult.ignored;
            if (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter) {
              if (_overlayEntry != null) {
                _hideDropdown();
              } else {
                _showDropdown(focusFirstItem: true);
              }
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          iconBuilder: (size, color) => Image.asset(
            'assets/icons/clapperboard.png',
            width: size,
            height: size,
            color: color,
            fit: BoxFit.contain,
          ),
          label: AppLocalizations.of(context).libraries,
          onPressed: () {
            if (_overlayEntry != null) {
              _hideDropdown();
            } else {
              _showDropdown();
            }
          },
        ),
      ),
    );
  }
}

class _LibraryDropdownItem extends StatefulWidget {
  final FocusNode focusNode;
  final bool isFirst;
  final bool isLast;
  final String name;
  final ValueChanged<bool>? onFocusChanged;
  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;
  final VoidCallback? onMoveUpFromFirst;
  final VoidCallback onTap;

  const _LibraryDropdownItem({
    required this.focusNode,
    required this.isFirst,
    required this.isLast,
    required this.name,
    this.onFocusChanged,
    this.onMoveUp,
    this.onMoveDown,
    this.onMoveUpFromFirst,
    required this.onTap,
  });

  @override
  State<_LibraryDropdownItem> createState() => _LibraryDropdownItemState();
}

class _LibraryDropdownItemState extends State<_LibraryDropdownItem> {
  final _prefs = GetIt.instance<UserPreferences>();
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) {
          setState(() => _isFocused = focused);
          widget.onFocusChanged?.call(focused);
        },
        onKeyEvent: (_, event) {
          if (event is! KeyDownEvent) return KeyEventResult.ignored;
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            if (widget.isFirst) {
              widget.onMoveUpFromFirst?.call();
            } else {
              widget.onMoveUp?.call();
            }
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
              !widget.isLast) {
            widget.onMoveDown?.call();
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.select ||
              event.logicalKey == LogicalKeyboardKey.enter) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: (_isHovered || _isFocused)
                ? focusColor.withValues(alpha: 0.12)
                : Colors.transparent,
            child: Text(
              widget.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: (Theme.of(context).textTheme.bodyMedium ??
                      const TextStyle())
                  .copyWith(
                    color:
                        (_isHovered || _isFocused) ? focusColor : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopMusicBar extends StatefulWidget {
  final FocusNode? focusNode;
  const TopMusicBar({super.key, this.focusNode});

  @override
  State<TopMusicBar> createState() => _TopMusicBarState();
}

class _TopMusicBarState extends State<TopMusicBar> {
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

  String? _artUrl(AggregatedItem item) =>
      audioArtUrl(item, clientFactory: _clientFactory, maxHeight: 120);

  Widget _buildBarButton({
    required IconData icon,
    required VoidCallback onPressed,
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
          final focused = InputModeTracker.showFocusVisuals(
            context,
            Focus.of(context).hasFocus,
          );
          return GestureDetector(
            onTap: onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 90),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: focused ? AppColorScheme.onSurface : Colors.transparent,
              ),
              child: AdaptiveIcon(
                icon,
                size: 20,
                color: focused
                    ? AppColorScheme.surface
                    : AppColorScheme.onSurface,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _wrapPill({required bool isNeon, required Widget child}) {
    final border = isNeon
        ? Border.all(
            color: const Color(0xFF00F0FF), // cyan outline for Neon Pulse!
            width: 1.5,
          )
        : Border.all(
            color: AppColorScheme.onSurface.withValues(alpha: 0.15),
            width: 1.0,
          );
    if (AppColorScheme.isGlass) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(24),
          border: border,
        ),
        child: GlassSurface(
          cornerRadius: 24,
          reinforced: true,
          fallbackColor: Colors.transparent,
          child: child,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color:
            OverlayColorPalette.resolveColor(
              GetIt.instance<UserPreferences>().get(
                UserPreferences.navbarColor,
              ),
            ).withValues(
              alpha:
                  GetIt.instance<UserPreferences>().get(
                    UserPreferences.navbarOpacity,
                  ) /
                  100.0,
            ),
        borderRadius: AppRadius.circular(24),
        border: border,
      ),
      child: child,
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
    final artist = item.artists.isNotEmpty
        ? item.artists.join(', ')
        : item.albumArtist ?? '';
    final displayText = artist.isNotEmpty
        ? '${item.name} - $artist'
        : item.name;
    final titleStyle = TextStyle(
      color: AppColorScheme.onSurface,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );
    // The text already grows with the UI scale, so the cap on it does too.
    final titleMaxWidth =
        _kMusicBarTitleMaxWidth *
        GetIt.instance<UserPreferences>()
            .get(UserPreferences.desktopUiScale)
            .scaleFactor;
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    return Center(
      child: _wrapPill(
        isNeon: isNeon,
        child: Focus(
          focusNode: widget.focusNode,
          canRequestFocus: false,
          child: FocusTraversalGroup(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: AppRadius.circular(6),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: artUrl != null
                          ? OfflineAwareImage(
                              imageUrl: artUrl,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.1,
                              ),
                              child: Icon(
                                Icons.music_note,
                                size: 16,
                                color: AppColorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Focusable, not just tappable: a remote cannot tap, and
                  // this title is the only way back to the player. Same focus
                  // treatment as the transport buttons beside it.
                  Flexible(
                    child: Focus(
                      onKeyEvent: (node, event) {
                        if (isActivateKey(event)) {
                          appRouter.push(Destinations.audioPlayer);
                          return KeyEventResult.handled;
                        }
                        return KeyEventResult.ignored;
                      },
                      child: Builder(
                        builder: (context) {
                          final focused = InputModeTracker.showFocusVisuals(
                            context,
                            Focus.of(context).hasFocus,
                          );
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () =>
                                  appRouter.push(Destinations.audioPlayer),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 90),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.circular(12),
                                  color: focused
                                      ? AppColorScheme.onSurface.withValues(
                                          alpha: 0.22,
                                        )
                                      : Colors.transparent,
                                ),
                                child: PlatformDetection.useMobileUi
                                    ? Text(
                                        displayText,
                                        style: titleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: titleMaxWidth,
                                        ),
                                        child: MarqueeText(
                                          text: displayText,
                                          style: titleStyle,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  _buildBarButton(
                    icon: Icons.skip_previous,
                    onPressed: _manager.previous,
                  ),
                  const SizedBox(width: 4),
                  _buildBarButton(
                    icon: isPlaying ? Icons.pause : Icons.play_arrow,
                    onPressed: isPlaying ? _manager.pause : _manager.resume,
                  ),
                  const SizedBox(width: 4),
                  _buildBarButton(
                    icon: Icons.skip_next,
                    onPressed: _manager.next,
                  ),
                  const SizedBox(width: 4),
                  _buildBarButton(
                    icon: Icons.stop,
                    onPressed: () =>
                        unawaited(_manager.stop(userInitiated: true)),
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
