import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart' show kIsWeb;
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
import '../../data/services/plugin_sync_service.dart';
import '../../preference/preference_constants.dart';
import '../../preference/seerr_preferences.dart';
import '../../preference/user_preferences.dart';
import '../../util/clock_format.dart';
import '../../util/overlay_color_palette.dart';
import '../../util/platform_detection.dart';
import '../navigation/destinations.dart';
import '../navigation/home_refresh_bus.dart';
import 'expandable_icon_button.dart';
import 'navigation_layout.dart';
import 'settings/settings_panel.dart';
import '../screens/settings/settings_side_panel.dart';
import '../screens/syncplay/syncplay_screen.dart';
import 'seerr_icons.dart';
import 'shuffle_overlay.dart';
import 'user_menu_dialog.dart';

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

class TopToolbar extends StatefulWidget {
  final String? activeRoute;
  final bool showBackButton;
  final FocusNode? contentFocusNode;

  const TopToolbar({
    super.key,
    this.activeRoute,
    this.showBackButton = false,
    this.contentFocusNode,
  });

  /// Total laid-out height of the toolbar for the current platform.
  static double heightFor(BuildContext context) {
    if (PlatformDetection.useLeanbackUi) return _kToolbarHeightTV;
    if (PlatformDetection.useMobileUi) return _kToolbarHeightMobile;
    return _kToolbarHeightDesktop;
  }

  @override
  State<TopToolbar> createState() => _TopToolbarState();
}

class _TopToolbarState extends State<TopToolbar> {
  final _userRepo = GetIt.instance<UserRepository>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _viewsRepo = GetIt.instance<UserViewsRepository>();

  final _avatarFocus = FocusNode();
  final _homeFocus = FocusNode(debugLabel: 'TopToolbarHome');
  final _settingsFocus = FocusNode(debugLabel: 'TopToolbarSettings');
  final _inlineLibrariesTriggerFocus = FocusNode(
    debugLabel: 'TopToolbarInlineLibrariesTrigger',
  );
  final _toolbarScopeNode = FocusNode(
    debugLabel: 'TopToolbarScope',
    canRequestFocus: false,
    skipTraversal: true,
  );
  late final VoidCallback _focusNavbarCallback;
  late final VoidCallback _focusAvatarCallback;
  VoidCallback? _previousFocusNavbarCallback;
  VoidCallback? _previousFocusAvatarCallback;
  FocusNode? _previousFocus;
  List<AggregatedLibrary> _libraries = [];
  Timer? _clockTimer;
  late final ValueNotifier<String> _currentTime;
  StreamSubscription? _userSub;
  String? _userImageUrl;

  @override
  void initState() {
    super.initState();
    _currentTime = ValueNotifier<String>('');
    _focusNavbarCallback = () => _homeFocus.requestFocus();
    _focusAvatarCallback = () => _avatarFocus.requestFocus();
    _previousFocusNavbarCallback = NavigationLayout.focusNavbarNotifier.value;
    _previousFocusAvatarCallback =
      NavigationLayout.focusNavbarAvatarNotifier.value;
    NavigationLayout.focusNavbarNotifier.value = _focusNavbarCallback;
    NavigationLayout.focusNavbarAvatarNotifier.value = _focusAvatarCallback;
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
    _loadLibraries();
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
    _clockTimer?.cancel();
    _avatarFocus.removeListener(_onAvatarFocusChanged);
    FocusManager.instance.removeListener(_trackPreviousFocus);
    _toolbarScopeNode.dispose();
    _avatarFocus.dispose();
    _homeFocus.dispose();
    _settingsFocus.dispose();
    _inlineLibrariesTriggerFocus.dispose();
    _userSub?.cancel();
    try {
      _viewsRepo.removeListener(_onUserViewsChanged);
    } catch (_) {}
    try {
      GetIt.instance<PluginSyncService>().removeListener(_onPrefsChanged);
    } catch (_) {}
    _prefs.removeListener(_onPrefsChanged);
    _currentTime.dispose();
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
    if (ThemeRegistry.active.id == ThemeRegistry.neonPulseId) {
      return Colors.transparent;
    }
    return _overlayColor().withValues(alpha: _overlayOpacity());
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

  void _trackPreviousFocus() {
    final primary = FocusManager.instance.primaryFocus;
    if (primary == null) return;
    if (primary.skipTraversal) return;
    if (_isInsideToolbar(primary)) return;
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

  bool _isUsableOutsideToolbar(FocusNode? node) {
    if (node == null) return false;
    if (node.skipTraversal) return false;
    if (_isInsideToolbar(node)) return false;
    return _isLaidOutFocusNode(node);
  }

  void _restoreFocusBelowToolbar() {
    final focusContent = NavigationLayout.focusContentFromNavbarNotifier.value;
    if (focusContent != null && widget.activeRoute == Destinations.home) {
      focusContent();
      final primary = FocusManager.instance.primaryFocus;
      if (_isUsableOutsideToolbar(primary)) {
        return;
      }
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

  void _moveFocusDown({int attempt = 0}) {
    if (!mounted) return;
    final scope = FocusScope.of(context);
    if (scope.focusInDirection(TraversalDirection.down)) {
      final primary = FocusManager.instance.primaryFocus;
      if (_isUsableOutsideToolbar(primary)) return;
    }
    final firstBelow = _findFirstFocusableBelowToolbar(scope);
    if (firstBelow != null) {
      firstBelow.requestFocus();
      return;
    }
    final fallback = widget.contentFocusNode;
    if (fallback != null && fallback.context != null) {
      final firstContent = _firstFocusableDescendant(fallback);
      if (firstContent != null) {
        firstContent.requestFocus();
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
    final startReservedWidth =
        (widget.showBackButton && !PlatformDetection.isTV) ? 96.0 : 44.0;
    final endReservedWidth = hasEndSection ? 96.0 : 0.0;
    final centerSidePadding =
        math.max(startReservedWidth, endReservedWidth) + 14.0;
    final toolbarHeight = isTV
        ? _kToolbarHeightTV
        : isMobile
        ? _kToolbarHeightMobile
        : _kToolbarHeightDesktop;

    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: toolbarHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Focus(
            focusNode: _toolbarScopeNode,
            onKeyEvent: (_, event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.arrowDown) {
                _restoreFocusBelowToolbar();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: FocusTraversalGroup(
              policy: WidgetOrderTraversalPolicy(),
              child: isLandscape
                  ? Stack(
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
                          alignment: Alignment.centerLeft,
                          child: _buildStart(),
                        ),
                        if (!isMobile)
                          Align(
                            alignment: Alignment.centerRight,
                            child: _buildEnd(),
                          ),
                      ],
                    )
                  : Row(
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
        ),
      ),
    );
  }

  Widget _buildStart() {
    return FocusTraversalOrder(
      order: const NumericFocusOrder(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAvatar(),
          if (widget.showBackButton && !PlatformDetection.isTV) ...[
            const SizedBox(width: 8),
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
        if (PlatformDetection.isTV &&
            event.logicalKey == LogicalKeyboardKey.arrowRight) {
          _homeFocus.requestFocus();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: _showUserMenu,
        child: AnimatedScale(
          scale: _avatarFocus.hasFocus ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: (_avatarFocus.hasFocus && !PlatformDetection.isTV)
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder,
                    )
                  : null,
              color: (_avatarFocus.hasFocus && PlatformDetection.isTV)
                  ? Colors.white
                  : null,
            ),
            child: ClipOval(
              child: _userImageUrl != null
                  ? Image.network(
                      _userImageUrl!,
                      fit: BoxFit.cover,
                      width: avatarSize,
                      height: avatarSize,
                      errorBuilder: (_, _, _) => _avatarFallback(),
                    )
                  : _avatarFallback(),
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
    final showLibraries = _prefs.get(UserPreferences.showLibrariesInToolbar);
    final showFolders = _prefs.get(UserPreferences.enableFolderView);
    final showSyncPlay =
        _prefs.get(UserPreferences.syncPlayEnabled) &&
        _prefs.get(UserPreferences.showSyncPlayButton);
    final seerrPrefs = GetIt.instance<SeerrPreferences>();
    final showSeerr = _prefs.get(UserPreferences.showSeerrButton) &&
        GetIt.instance<PluginSyncService>().seerrAvailable;
    final l10n = AppLocalizations.of(context);
    final seerrDisplayName = seerrPrefs.moonfinDisplayName.trim();
    final seerrNavLabel = seerrDisplayName.isNotEmpty
      ? seerrDisplayName
      : (seerrPrefs.isSeerrVariant ? l10n.seerr : l10n.jellyseerr);
    final useAndroidTvInlineLibraries =
        PlatformDetection.isAndroid &&
        PlatformDetection.isTV &&
        _prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;

    int order = 1;
    var neonSlot = 0;
    Color? nextNavColor() {
      if (!isNeon) return null;
      final c = neonSlot.isEven
          ? AppColorScheme.accent
          : AppColorScheme.onSurface;
      neonSlot += 1;
      return c;
    }

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kPillRadius),
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: _toolbarSurfaceColor(),
            borderRadius: BorderRadius.circular(_kPillRadius),
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
                    icon: Icons.home_rounded,
                    label: l10n.home,
                    baseColor: nextNavColor(),
                    focusNode: _homeFocus,
                    onKeyEvent: (node, event) {
                      if (event is KeyDownEvent &&
                          PlatformDetection.isTV &&
                          event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                        _avatarFocus.requestFocus();
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                    onPressed: () {
                      if (_isActive(Destinations.home)) {
                        requestHomeRefresh();
                        return;
                      }
                      requestHomeRefreshAfterNavigation();
                      context.go(Destinations.home);
                    },
                  ),
                ),
                _gap(),
                _orderButton(
                  order: (order++).toDouble(),
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_search'),
                    icon: Icons.search_rounded,
                    label: l10n.search,
                    baseColor: nextNavColor(),
                    onPressed: () {
                      if (_isActive(Destinations.search)) return;
                      context.navigateTopLevel(Destinations.search);
                    },
                  ),
                ),
                if (showShuffle) ...[
                  _gap(),
                  _orderButton(
                    order: (order++).toDouble(),
                    child: ExpandableIconButton(
                      key: const ValueKey('toolbar_shuffle'),
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
                if (showFolders) ...[
                  _gap(),
                  _orderButton(
                    order: (order++).toDouble(),
                    child: ExpandableIconButton(
                      key: const ValueKey('toolbar_folders'),
                      icon: Icons.folder_rounded,
                      label: l10n.folders,
                      baseColor: nextNavColor(),
                      onPressed: () {
                        if (_isActive(Destinations.folderView)) return;
                        context.navigateTopLevel(Destinations.folderView);
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
                      icon: Icons.groups_rounded,
                      label: l10n.syncPlay,
                      baseColor: nextNavColor(),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const SyncPlayScreen(),
                        ),
                      ),
                    ),
                  ),
                ],
                if (showSeerr) ...[
                  _gap(),
                  _orderButton(
                    order: (order++).toDouble(),
                    child: ExpandableIconButton(
                      key: const ValueKey('toolbar_seerr'),
                      baseColor: nextNavColor(),
                      iconBuilder: (size, color) => seerrPrefs.isSeerrVariant
                          ? SeerrIcon(size: size, color: color)
                          : JellyseerrIcon(size: size, color: color),
                      label: seerrNavLabel,
                      onPressed: () {
                        if (_isActive(Destinations.seerrDiscover)) return;
                        context.navigateTopLevel(Destinations.seerrDiscover);
                      },
                    ),
                  ),
                ],
                if (showLibraries && _libraries.isNotEmpty) ...[
                  _gap(),
                  _orderButton(
                    order: (order++).toDouble(),
                    child: useAndroidTvInlineLibraries
                        ? _buildAndroidTvLibrariesButton(
                            l10n,
                            iconColor: nextNavColor(),
                          )
                        : _buildLibrariesButton(iconColor: nextNavColor()),
                  ),
                ],
                _gap(),
                _orderButton(
                  order: 99,
                  child: ExpandableIconButton(
                    key: const ValueKey('toolbar_settings'),
                    icon: Icons.settings_rounded,
                    label: l10n.settings,
                    baseColor: nextNavColor(),
                    focusNode: _settingsFocus,
                    onKeyEvent: (_, event) {
                      if ((event is KeyDownEvent || event is KeyRepeatEvent) &&
                          PlatformDetection.isTV &&
                          event.logicalKey == LogicalKeyboardKey.arrowRight) {
                        return KeyEventResult.handled;
                      }
                      if (event is KeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.arrowLeft &&
                          useAndroidTvInlineLibraries &&
                          showLibraries &&
                          _libraries.isNotEmpty) {
                        _inlineLibrariesTriggerFocus.requestFocus();
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                    onPressed: () async {
                      await SettingsPanel.open(
                        context,
                        const SettingsSidePanel(),
                      );
                      if (mounted) _settingsFocus.requestFocus();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLibrariesButton({Color? iconColor}) {
    return _LibrariesDropdown(
      key: const ValueKey('toolbar_libraries'),
      activeRoute: widget.activeRoute,
      libraries: _libraries,
      surfaceColor: _toolbarSurfaceColor(),
      iconColor: iconColor,
      onLibraryTap: (lib) {
        if (lib.collectionType == 'music') {
          context.navigateTopLevel('/music/${lib.id}');
        } else if (lib.collectionType == 'livetv') {
          context.navigateTopLevel(Destinations.liveTvGuide);
        } else {
          context.navigateTopLevel('/library/${lib.id}');
        }
      },
    );
  }

  Widget _buildAndroidTvLibrariesButton(
    AppLocalizations l10n, {
    Color? iconColor,
  }) {
    return _AndroidTvExpandableLibrariesButton(
      key: const ValueKey('toolbar_libraries_inline_tv'),
      activeRoute: widget.activeRoute,
      libraries: _libraries,
      label: l10n.libraries,
      iconColor: iconColor,
      triggerFocusNode: _inlineLibrariesTriggerFocus,
      nextFocusNode: _settingsFocus,
      onLibraryTap: (lib) {
        if (lib.collectionType == 'music') {
          context.navigateTopLevel('/music/${lib.id}');
        } else if (lib.collectionType == 'livetv') {
          context.navigateTopLevel(Destinations.liveTvGuide);
        } else {
          context.navigateTopLevel('/library/${lib.id}');
        }
      },
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
  final ValueChanged<AggregatedLibrary> onLibraryTap;

  const _LibrariesDropdown({
    super.key,
    this.activeRoute,
    required this.libraries,
    required this.surfaceColor,
    this.iconColor,
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
  final FocusNode? triggerFocusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<AggregatedLibrary> onLibraryTap;

  const _AndroidTvExpandableLibrariesButton({
    super.key,
    this.activeRoute,
    required this.libraries,
    required this.label,
    this.iconColor,
    this.triggerFocusNode,
    this.nextFocusNode,
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
      final next = widget.nextFocusNode;
      if (next != null && next.canRequestFocus) {
        next.requestFocus();
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
  final FocusNode? focusNode;
  final Color? iconColor;
  final VoidCallback? onMoveRight;
  final VoidCallback onPressed;

  const _ToolbarLibrariesTriggerButton({
    super.key,
    required this.label,
    required this.expanded,
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
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final highlighted = _focused || widget.expanded;
    final showLabel = _focused;
    final bgColor = highlighted ? Colors.white : Colors.transparent;
    final fgColor = highlighted
        ? Colors.black
        : (widget.iconColor ??
              (isNeon
                  ? AppColorScheme.accent
                  : Colors.white.withValues(alpha: 0.6)));

    return Focus(
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          constraints: const BoxConstraints(minHeight: 44),
          padding: EdgeInsets.symmetric(
            horizontal: showLabel ? 18 : 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(36),
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
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = _focused ? Colors.white : Colors.transparent;
    final fgColor = _focused ? Colors.black : Colors.white;

    return Focus(
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: _focused
              ? BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(22),
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
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showDropdown({bool focusFirstItem = false}) {
    _hideTimer?.cancel();
    if (_overlayEntry != null) return;

    final screenWidth = MediaQuery.of(context).size.width;
    _menuWidth = (screenWidth - 16).clamp(180.0, 280.0);

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
            borderRadius: BorderRadius.circular(12),
            child: kIsWeb
                ? _dropdownContent(maxMenuHeight)
                : BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: _dropdownContent(maxMenuHeight),
                  ),
          ),
        ),
      ),
    );

    return CompositedTransformFollower(
      link: _layerLink,
      targetAnchor: _openToLeft ? Alignment.bottomRight : Alignment.bottomLeft,
      followerAnchor: _openToLeft ? Alignment.topRight : Alignment.topLeft,
      offset: Offset.zero,
      child: content,
    );
  }

  Widget _dropdownContent(double maxMenuHeight) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 180,
        maxWidth: _menuWidth,
        maxHeight: maxMenuHeight,
      ),
      decoration: BoxDecoration(
        color: widget.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
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
              style: TextStyle(
                color: (_isHovered || _isFocused) ? focusColor : Colors.white,
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
