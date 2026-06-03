import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart' hide ImageType;
import 'package:window_manager/window_manager.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/repositories/mdblist_repository.dart';
import '../../../data/services/background_service.dart';
import '../../widgets/rating_display.dart';
import '../../../data/services/theme_music_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/inline_preview_engine.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/exit_confirmation_dialog.dart';
import '../../../util/app_exit.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/locked_focus_row.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../../util/server_url.dart';
import '../../navigation/app_router.dart';
import '../../navigation/destinations.dart';
import '../../../data/models/media_bar_state.dart';
import '../../../data/viewmodels/media_bar_view_model.dart';
import '../../widgets/grid_button_card.dart';
import '../../widgets/info_area.dart';
import '../../widgets/left_sidebar.dart';
import '../../widgets/library_row.dart';
import '../../widgets/media_bar.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/responsive_layout.dart';
import '../../widgets/seasonal_effects.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../util/home_row_title_localizer.dart';
import 'home_view_model.dart';

Color get _homeBackground => AppColorScheme.background;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: _HomeShell(),
      tvBody: _HomeShell(),
    );
  }
}

class _HomeShell extends StatefulWidget {
  const _HomeShell();

  @override
  State<_HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<_HomeShell>
  with WidgetsBindingObserver, RouteAware {
  final _backgroundService = GetIt.instance<BackgroundService>();
  final _userPrefs = GetIt.instance<UserPreferences>();
  final _themeMusicService = GetIt.instance<ThemeMusicService>();
  late final HomeViewModel _viewModel;

  AggregatedItem? _selectedItem;
  String? _backdropUrl;
  Timer? _selectionDebounce;
  Timer? _backdropDebounce;
  Timer? _hoverPauseTimer;
  StreamSubscription<String?>? _backgroundSub;
  bool _isHoverPaused = false;
  bool _isScrolledToTop = true;
  String _lastSectionsJson = '';
  Type? _lastMediaBarStateRuntime;
  int _lastMediaBarItemCount = 0;
  bool _lastMultiServer = false;
  bool _lastMergeContinueWatchingNextUp = false;
  String _lastBlockedParentalRatings = '';
  bool _themeMusicRegistered = false;
  String? _lastObservedPath;
  ModalRoute<dynamic>? _observedRoute;

  static const _selectionDelay = Duration(milliseconds: 150);
  static const _backdropDelay = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    appRouter.routerDelegate.addListener(_onRouteChanged);
    _lastObservedPath = appRouter.routerDelegate.currentConfiguration.uri.path;
    homeRefreshBus.addListener(_onHomeRefreshRequested);
    if (consumePendingHomeRefresh()) {
      _viewModel.refresh(preserveExisting: true);
    }
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;

    _viewModel = GetIt.instance<HomeViewModel>();
    _viewModel.addListener(_onViewModelChanged);
    _viewModel.mediaBarViewModel.addListener(_onMediaBarStateChanged);
    _lastMediaBarStateRuntime = _viewModel.mediaBarViewModel.state.runtimeType;
    _lastMediaBarItemCount =
        _viewModel.mediaBarViewModel.state is MediaBarReady
            ? (_viewModel.mediaBarViewModel.state as MediaBarReady).items.length
            : 0;
    _lastSectionsJson = _userPrefs.get(UserPreferences.homeSectionsJson);
    _lastMultiServer = _userPrefs.get(UserPreferences.enableMultiServerLibraries);
    _lastMergeContinueWatchingNextUp =
      _userPrefs.get(UserPreferences.mergeContinueWatchingNextUp);
    _lastBlockedParentalRatings = _userPrefs.get(UserPreferences.blockedParentalRatings);
    _userPrefs.addListener(_onPrefsChanged);
    _maybeRegisterThemeMusic();
    _viewModel.load(preserveExisting: _viewModel.rows.isNotEmpty);
  }

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
  void dispose() {
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
      _observedRoute = null;
    }
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    homeRefreshBus.removeListener(_onHomeRefreshRequested);
    WidgetsBinding.instance.removeObserver(this);
    _selectionDebounce?.cancel();
    _backdropDebounce?.cancel();
    _hoverPauseTimer?.cancel();
    _backgroundSub?.cancel();
    _viewModel.mediaBarViewModel.removeListener(_onMediaBarStateChanged);
    _viewModel.removeListener(_onViewModelChanged);
    _userPrefs.removeListener(_onPrefsChanged);
    if (_themeMusicRegistered) {
      _themeMusicService.unregisterDetailScreen(this);
      _themeMusicRegistered = false;
    }
    super.dispose();
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  void _onMediaBarStateChanged() {
    if (!mounted) return;
    final state = _viewModel.mediaBarViewModel.state;
    final runtime = state.runtimeType;
    final itemCount = state is MediaBarReady ? state.items.length : 0;
    if (runtime == _lastMediaBarStateRuntime &&
        itemCount == _lastMediaBarItemCount) {
      return;
    }
    _lastMediaBarStateRuntime = runtime;
    _lastMediaBarItemCount = itemCount;
    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _viewModel.refresh(preserveExisting: true);
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        (state == AppLifecycleState.inactive &&
            !PlatformDetection.isDesktop &&
            !PlatformDetection.isWeb)) {
      _themeMusicService.fadeOutAndStop();
    }
  }

  void _onHomeRefreshRequested() {
    if (!mounted) return;
    _viewModel.refresh(preserveExisting: true);
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    final currentJson = _userPrefs.get(UserPreferences.homeSectionsJson);
    final currentMultiServer = _userPrefs.get(UserPreferences.enableMultiServerLibraries);
    final currentMergeContinueWatchingNextUp =
      _userPrefs.get(UserPreferences.mergeContinueWatchingNextUp);
    final currentBlocked = _userPrefs.get(UserPreferences.blockedParentalRatings);
    if (currentJson != _lastSectionsJson ||
        currentMultiServer != _lastMultiServer ||
      currentMergeContinueWatchingNextUp !=
        _lastMergeContinueWatchingNextUp ||
        currentBlocked != _lastBlockedParentalRatings) {
      _lastSectionsJson = currentJson;
      _lastMultiServer = currentMultiServer;
      _lastMergeContinueWatchingNextUp =
        currentMergeContinueWatchingNextUp;
      _lastBlockedParentalRatings = currentBlocked;
      _viewModel.refresh();
    }
    _maybeRegisterThemeMusic();
    setState(() {});
  }

  void onItemSelected(AggregatedItem? item) {
    _selectionDebounce?.cancel();
    _selectionDebounce = Timer(_selectionDelay, () {
      if (!mounted) return;
      setState(() {
        _selectedItem = item;
        _isHoverPaused = true;
      });

      _hoverPauseTimer?.cancel();
      _hoverPauseTimer = Timer(const Duration(seconds: 15), () {
        if (mounted) setState(() => _isHoverPaused = false);
      });

      _backdropDebounce?.cancel();
      _backdropDebounce = Timer(_backdropDelay, () {
        _backgroundService.setBackground(item, context: BlurContext.browsing);
      });

      _maybePlayThemeMusic(item);
    });
  }

  void _maybeRegisterThemeMusic() {
    final shouldRegister =
        _userPrefs.get(UserPreferences.themeMusicEnabled) &&
            _userPrefs.get(UserPreferences.themeMusicOnHomeRows);
    if (shouldRegister && !_themeMusicRegistered) {
      _themeMusicService.registerDetailScreen(this);
      _themeMusicRegistered = true;
    } else if (!shouldRegister && _themeMusicRegistered) {
      _themeMusicService.unregisterDetailScreen(this);
      _themeMusicRegistered = false;
    }
  }

  void _maybePlayThemeMusic(AggregatedItem? item) {
    _maybeRegisterThemeMusic();
    if (!_isHomeRouteActive()) {
      _themeMusicService.fadeOutAndStop();
      return;
    }
    if (!_themeMusicRegistered) {
      _themeMusicService.fadeOutAndStop();
      return;
    }
    if (item == null) {
      _themeMusicService.fadeOutAndStop();
      return;
    }
    _themeMusicService.playForItem(item);
  }

  bool _isHomeRouteActive() {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    return path == Destinations.home || path.startsWith('${Destinations.home}/');
  }

  void _onRouteChanged() {
    if (!mounted) return;
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    if (path == _lastObservedPath) return;
    _lastObservedPath = path;

    final onHome = _isHomeRouteActive();
    if (!onHome) {
      if (_themeMusicRegistered) {
        _themeMusicService.unregisterDetailScreen(this);
        _themeMusicRegistered = false;
      }
      _themeMusicService.fadeOutAndStop();
      return;
    }

    _maybeRegisterThemeMusic();
    if (_selectedItem != null) {
      _maybePlayThemeMusic(_selectedItem);
    }
  }

  @override
  void didPushNext() {
    if (_themeMusicRegistered) {
      _themeMusicService.unregisterDetailScreen(this);
      _themeMusicRegistered = false;
    }
    _themeMusicService.fadeOutAndStop();
  }

  @override
  void didPopNext() {
    if (!_isHomeRouteActive()) {
      _themeMusicService.fadeOutAndStop();
      return;
    }
    _viewModel.refresh(preserveExisting: true);
    _maybeRegisterThemeMusic();
    if (_selectedItem != null) {
      _maybePlayThemeMusic(_selectedItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    final backdropEnabled = _userPrefs.get(UserPreferences.backdropEnabled);
    final blurAmount = _userPrefs.get(UserPreferences.browsingBackgroundBlurAmount).toDouble();
    final seasonalEffect = _userPrefs.get(UserPreferences.seasonalSurprise);
    final mediaBarMode = UserPreferences.normalizeMediaBarMode(
      _userPrefs.get(UserPreferences.mediaBarMode),
    );
    final useMakdBackdropFx =
        PlatformDetection.useMobileUi &&
        mediaBarMode == UserPreferences.mediaBarModeMakd;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _showExitConfirmation(context);
      },
      child: Scaffold(
        backgroundColor: _homeBackground,
        body: NavigationLayout(
          activeRoute: Destinations.home,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (backdropEnabled)
                _Backdrop(
                  url: _backdropUrl,
                  blurAmount: blurAmount,
                  useMakdBackdropFx: useMakdBackdropFx,
                ),
              const _GradientScrim(),
              Positioned.fill(
                child: _ContentRows(
                  viewModel: _viewModel,
                  mediaBarViewModel: _viewModel.mediaBarViewModel,
                  prefs: _userPrefs,
                  selectedItem: _selectedItem,
                  onItemSelected: onItemSelected,
                  isHoverPaused: _isHoverPaused,
                  onScrolledToTopChanged: (atTop) {
                    if (atTop != _isScrolledToTop) {
                      setState(() => _isScrolledToTop = atTop);
                    }
                  },
                ),
              ),
              if (seasonalEffect != 'none')
                Positioned.fill(
                  child: SeasonalEffects(effect: seasonalEffect),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showExitConfirmation(BuildContext context) async {
    if (!_userPrefs.get(UserPreferences.confirmExit)) {
      await AppExit.closeApp();
      return;
    }
    final navContext = appRouter.routerDelegate.navigatorKey.currentContext;
    await showExitConfirmationDialog(navContext ?? context);
  }
}

class _GradientScrim extends StatelessWidget {
  const _GradientScrim();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColorScheme.scrim.withValues(alpha: 0.67),
            AppColorScheme.scrim.withValues(alpha: 0.27),
            AppColorScheme.scrim.withValues(alpha: 0.73),
          ],
          stops: [0.0, 0.3, 1.0],
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}

class _Backdrop extends StatelessWidget {
  final String? url;
  final double blurAmount;
  final bool useMakdBackdropFx;

  const _Backdrop({
    this.url,
    required this.blurAmount,
    this.useMakdBackdropFx = false,
  });

  @override
  Widget build(BuildContext context) {
    return FullscreenBackdropSwitcher(
      imageUrl: url,
      duration: BackgroundService.transitionDuration,
      imageBuilder: (imageUrl) {
        final image = _blurredImage(context, imageUrl, blurAmount);
        if (!useMakdBackdropFx) {
          return image;
        }

        return ClipRect(
          child: TweenAnimationBuilder<double>(
            key: ValueKey('makd_home_backdrop_$imageUrl'),
            tween: Tween(begin: 1.0, end: 1.08),
            duration: const Duration(seconds: 10),
            curve: Curves.easeOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                alignment: Alignment.center,
                child: child,
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                image,
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColorScheme.scrim.withValues(alpha: 0.26),
                  ),
                  child: const SizedBox.expand(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _blurredImage(BuildContext context, String imageUrl, double blur) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final pixelRatio = MediaQuery.devicePixelRatioOf(context).clamp(1.0, 2.0);
    final targetPxWidth = (blur > 0
            ? viewportWidth * pixelRatio * 0.6
            : viewportWidth * pixelRatio)
        .round();
    final maxWidth = targetPxWidth < 480
        ? 480
        : (targetPxWidth > 1280 ? 1280 : targetPxWidth);
    final image = BoundedNetworkImage(
      imageUrl: imageUrl,
      scale: blur > 0 ? 0.3 : 1.0,
      minWidth: 320,
      maxWidth: maxWidth,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
    if (blur <= 0) return image;
    return ImageFiltered(
      imageFilter: ui.ImageFilter.blur(
        sigmaX: blur,
        sigmaY: blur,
        tileMode: TileMode.decal,
      ),
      child: image,
    );
  }
}

class _ContentRows extends StatefulWidget {
  final HomeViewModel viewModel;
  final MediaBarViewModel mediaBarViewModel;
  final UserPreferences prefs;
  final AggregatedItem? selectedItem;
  final ValueChanged<AggregatedItem?> onItemSelected;
  final bool isHoverPaused;
  final ValueChanged<bool>? onScrolledToTopChanged;

  const _ContentRows({
    required this.viewModel,
    required this.mediaBarViewModel,
    required this.prefs,
    required this.selectedItem,
    required this.onItemSelected,
    this.isHoverPaused = false,
    this.onScrolledToTopChanged,
  });

  @override
  State<_ContentRows> createState() => _ContentRowsState();
}

class _ContentRowsState extends State<_ContentRows>
  with WidgetsBindingObserver, WindowListener {
  static const double _kHomeRowLabelInset = 16.0;
  final _scrollController = ScrollController();
  final _mediaBarFocusNode = FocusNode(debugLabel: 'home_media_bar_focus');
  final _playbackManager = GetIt.instance<PlaybackManager>();
  final Media3PlayerBackend? _media3PreviewBackend = PlatformDetection.isTizen
      ? null
      : GetIt.instance<Media3PlayerBackend>();
  final _themeMusicService = GetIt.instance<ThemeMusicService>();
  final Map<int, GlobalKey> _rowKeys = {};
  final Map<int, GlobalKey> _rowContainerKeys = {};
  final Map<int, ScrollController> _rowHorizontalControllers = {};
  List<HomeRow>? _cachedExtentRows;
  PosterSize? _cachedExtentPosterSize;
  double? _cachedExtentDesktopScale;
  int _cachedExtentPrefsVersion = -1;
  List<double>? _cachedRowExtents;
  int _layoutPrefsVersion = 0;
  // Cache for non-focused row image URLs (independent of focus state). Cleared
  // with the extent cache on data/pref/scale change, and size-capped.
  final Map<String, String?> _rowImageUrlCache = {};
  int? _activeFocusedRowIndex;
  Timer? _previewDelayTimer;
  Timer? _previewStopTimer;
  StreamSubscription<bool>? _mainPlaybackSub;
  Player? _previewPlayer;
  VideoController? _previewController;
  int _previewRequestId = 0;
  bool _mainPlaybackActive = false;
  bool _previewReady = false;
  bool _previewUsingMedia3 = false;
  double _scrollOffset = 0;
  double _previewStartScrollOffset = 0;
  bool _isScrolledToTop = true;
  bool _isActivelyScrolling = false;
  Timer? _scrollIdleTimer;
  bool _infoRevealed = false;
  bool _mediaBarVisible = true;
  bool _initialFocusResolved = false;
  bool _hasEverFocusedHomeContent = false;
  String? _lastObservedPath;
  bool _suppressNextRowPreviewFromMediaBar = false;
  bool _forceRevealOnNextRowFocusFromMediaBar = false;
  DateTime? _lastScrollTime;
  DateTime? _lastVerticalNavAt;
  bool _verticalNavInFlight = false;
  bool _chromeFocusActive = false;
  bool _windowHasFocus = true;
  bool _holdMediaBarWhileSidebarFocused = false;
  bool get _isSidebarFocus => LeftSidebar.isFocusedNotifier.value;
  bool _wasSidebarFocused = false;
  VoidCallback? _previousFocusContentFromNavbarCallback;
  FocusNode? _lastGlobalPrimaryFocus;
  String? _activePreviewKey;
  String? _mobilePressedV2Key;
  String? _mouseHoveredV2Key;
  final Map<String, Map<String, double>> _v2AdditionalRatingsByKey = {};
  final Map<String, Future<void>> _v2RatingsRequests = {};
  final Map<String, String?> _v2TmdbIdByKey = {};
  late bool _lastMedia3PreviewPreference;
  List<double> _rowTopOffsets = [];
  double _overlayBottom = 0;
  static const _previewScrollThreshold = 150.0;
  static const _previewOpenTimeout = Duration(seconds: 10);
  static const _pinTransitionDistance = 96.0;
  static const _previewStartDelay = Duration(milliseconds: 1200);
  static const _focusHandoffDuration = Duration(milliseconds: 220);
  static const _focusHandoffCurve = Curves.easeInOutCubic;
  static const _mediaBarFadeDuration = Duration(milliseconds: 220);

  void _markUserGesture() {
    if (!kIsWeb) return;
    if (!widget.prefs.get(UserPreferences.previewAudioEnabled)) return;
    final player = _previewPlayer;
    if (player == null || _activePreviewKey == null) return;
    unawaited(player.setVolume(100.0));
  }

  int? _focusedRowIndex(FocusNode? node) {
    if (node == null) return null;
    if (identical(node, _mediaBarFocusNode)) return null;
    return _activeFocusedRowIndex;
  }

  void _onGlobalFocusChanged() {
    if (!mounted) return;
    final isMobileUi = PlatformDetection.useMobileUi;
    final primary = FocusManager.instance.primaryFocus;
    final onMediaBar = identical(primary, _mediaBarFocusNode);
    final onSidebar = _isSidebarFocus;
    final wasOnSidebar = _wasSidebarFocused;
    if (onSidebar && !wasOnSidebar) {
      _holdMediaBarWhileSidebarFocused = identical(
        _lastGlobalPrimaryFocus,
        _mediaBarFocusNode,
      );
    } else if (!onSidebar) {
      _holdMediaBarWhileSidebarFocused = false;
    }
    final hasRowContext = _activeFocusedRowIndex != null || onSidebar;
    final desktopUnfocused =
      PlatformDetection.isDesktop && !_windowHasFocus;
    final chromeFocusActive =
        SettingsPanel.isOpenNotifier.value ||
        (!desktopUnfocused && !onMediaBar && !hasRowContext);

    final nextMediaBarVisible = isMobileUi
      ? true
      : onMediaBar ||
          _holdMediaBarWhileSidebarFocused ||
          (!onSidebar && _activeFocusedRowIndex == null);
    final chromeChanged = _chromeFocusActive != chromeFocusActive;

    if (_mediaBarVisible != nextMediaBarVisible || chromeChanged) {
      setState(() {
        _mediaBarVisible = nextMediaBarVisible;
        _chromeFocusActive = chromeFocusActive;
      });
    }

    if (wasOnSidebar && !onSidebar && _activeFocusedRowIndex != null) {
      final rowIndex = _activeFocusedRowIndex!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_mayRestoreHomeFocus()) return;
        _requestRowFocusFromMemory(rowIndex);
      });
    }

    _wasSidebarFocused = onSidebar;
    _lastGlobalPrimaryFocus = primary;

    if (chromeFocusActive && (chromeChanged || _activePreviewKey != null)) {
      _finishSharedPreview(releaseResources: true);
    }
  }

  void _onSettingsPanelOpenChanged() {
    final isOpen = SettingsPanel.isOpenNotifier.value;
    _onGlobalFocusChanged();
    if (isOpen) return;
    if (!_isHomeRouteActive()) return;
    if (_activeFocusedRowIndex != null) return;
    if (!_initialFocusResolved) return;
    _initialFocusResolved = false;
    if (mounted) {
      setState(() {});
    }
  }

  bool _isMediaBarEnabledByMode() {
    final mode = widget.prefs.get(UserPreferences.mediaBarMode);
    return UserPreferences.isMediaBarModeEnabled(mode);
  }

  bool _useMedia3InlinePreview() {
    return usesMedia3ForInlinePreview(widget.prefs);
  }

  void _onPreviewPrefsChanged() {
    if (!mounted) return;

    _layoutPrefsVersion++;

    final useMedia3 = _useMedia3InlinePreview();
    if (useMedia3 != _lastMedia3PreviewPreference) {
      _lastMedia3PreviewPreference = useMedia3;
      _finishSharedPreview(releaseResources: true);
      return;
    }

    if (_activePreviewKey == null) {
      return;
    }

    final previewAudioEnabled = widget.prefs.get(
      UserPreferences.previewAudioEnabled,
    );
    final previewVolume = kIsWeb ? 0.0 : (previewAudioEnabled ? 100.0 : 0.0);

    if (_previewUsingMedia3) {
      unawaited(_media3PreviewBackend!.setVolume(previewVolume));
      return;
    }

    final player = _previewPlayer;
    if (player != null) {
      unawaited(player.setVolume(previewVolume));
    }
  }

  void _onMainPlaybackChanged(bool isPlaying) {
    if (isPlaying &&
        _previewUsingMedia3 &&
        _activePreviewKey != null &&
        _isHomeRouteActive()) {
      return;
    }
    if (_mainPlaybackActive == isPlaying) {
      return;
    }
    _mainPlaybackActive = isPlaying;
    if (isPlaying) {
      _finishSharedPreview(releaseResources: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.addListener(this);
    }
    appRouter.routerDelegate.addListener(_onRouteChanged);
    _lastObservedPath = appRouter.routerDelegate.currentConfiguration.uri.path;
    FocusManager.instance.addListener(_onGlobalFocusChanged);
    SettingsPanel.isOpenNotifier.addListener(_onSettingsPanelOpenChanged);
    _lastMedia3PreviewPreference = _useMedia3InlinePreview();
    widget.prefs.addListener(_onPreviewPrefsChanged);
    _previousFocusContentFromNavbarCallback =
      NavigationLayout.focusContentFromNavbarNotifier.value;
    NavigationLayout.focusContentFromNavbarNotifier.value =
      _focusContentFromNavbar;
    _mainPlaybackActive = _playbackManager.state.isPlaying;
    _mainPlaybackSub = _playbackManager.state.playingStream.listen(
      _onMainPlaybackChanged,
    );
    if (!_isMediaBarEnabledByMode()) {
      _infoRevealed = true;
    }
  }

  @override
  void dispose() {
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    WidgetsBinding.instance.removeObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.removeListener(this);
    }
    FocusManager.instance.removeListener(_onGlobalFocusChanged);
    SettingsPanel.isOpenNotifier.removeListener(_onSettingsPanelOpenChanged);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    if (identical(
      NavigationLayout.focusContentFromNavbarNotifier.value,
      _focusContentFromNavbar,
    )) {
      NavigationLayout.focusContentFromNavbarNotifier.value =
          _previousFocusContentFromNavbarCallback;
    }
    _scrollIdleTimer?.cancel();
    _mediaBarFocusNode.dispose();
    _mainPlaybackSub?.cancel();
    widget.prefs.removeListener(_onPreviewPrefsChanged);
    _rowKeys.clear();
    for (final controller in _rowHorizontalControllers.values) {
      controller.dispose();
    }
    _rowHorizontalControllers.clear();
    _disposeSharedPreview();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isBackground =
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.detached ||
        (state == AppLifecycleState.inactive &&
            !PlatformDetection.isDesktop &&
            !PlatformDetection.isWeb);
    if (isBackground) {
      _finishSharedPreview(releaseResources: true);
    }
  }

  @override
  void onWindowBlur() {
    _windowHasFocus = false;
    _onGlobalFocusChanged();
  }

  @override
  void onWindowFocus() {
    _windowHasFocus = true;
    _onGlobalFocusChanged();
    _repairFocusAfterWindowReturn();
  }

  void _repairFocusAfterWindowReturn() {
    if (!_mayRestoreHomeFocus()) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_mayRestoreHomeFocus()) return;
      if (FocusManager.instance.primaryFocus != null) return;

      final rowIndex = _activeFocusedRowIndex;
      if (rowIndex != null) {
        final rowState = _rowKeys[rowIndex]?.currentState;
        if (rowState is LockedFocusRowState<dynamic>) {
          rowState.requestFocusFromMemory();
          if (FocusManager.instance.primaryFocus != null) {
            return;
          }
        }
      }

      if (_isMediaBarIncluded()) {
        _mediaBarFocusNode.requestFocus();
        if (_mediaBarFocusNode.hasFocus) {
          return;
        }
      }

      _requestFocusToNavbar();
    });
  }

  void _onRouteChanged() {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    final wasOnHome = _lastObservedPath?.startsWith(Destinations.home) ?? false;
    _lastObservedPath = path;

    _mainPlaybackActive = _playbackManager.state.isPlaying;

    if (!_isHomeRouteActive()) {
      _finishSharedPreview(releaseResources: true);
      return;
    }

    // Only reset initial focus when entering home from a non-home route
    // (e.g. login, server select). Pop-back from /item should keep the
    // user's previous focus in place.
    if (!wasOnHome) {
      _mainPlaybackActive = _playbackManager.state.isPlaying;
      final shouldRebuild = _initialFocusResolved || _hasEverFocusedHomeContent;
      _initialFocusResolved = false;
      _hasEverFocusedHomeContent = false;
      if (mounted && shouldRebuild) {
        setState(() {});
      }
    }
  }

  bool _shouldRepairInitialFocusAfterMediaBarSync() {
    if (!_initialFocusResolved) return false;
    if (_hasEverFocusedHomeContent) return false;
    if (_isMediaBarIncluded()) return false;
    if (!_isHomeRouteActive()) return false;
    if (SettingsPanel.isOpenNotifier.value) return false;
    if (_activeFocusedRowIndex != null) return false;

    final primary = FocusManager.instance.primaryFocus;
    final primaryContext = primary?.context;
    if (primary == null || primaryContext == null) {
      return true;
    }

    final box = primaryContext.findRenderObject();
    if (box is! RenderBox) {
      return true;
    }

    final global = box.localToGlobal(Offset.zero);
    final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
    final isTopNavbarFocus =
        navbarPosition == NavbarPosition.top && global.dy < 140;
    final isLeftSidebarFocus =
        navbarPosition == NavbarPosition.left && global.dx < 240;
    return isTopNavbarFocus || isLeftSidebarFocus;
  }

  static bool _supportsEpisodePreview(AggregatedItem item) {
    return item.type == 'Series' ||
        item.type == 'Movie' ||
        item.type == 'Episode' ||
        item.type == 'Video' ||
        item.type == 'MusicVideo';
  }

  static String _previewKeyFor(AggregatedItem item) {
    return '${item.serverId}:${item.id}';
  }

  MediaServerClient? _clientForItem(AggregatedItem item) {
    final factory = GetIt.instance<MediaServerClientFactory>();
    final fromFactory = factory.getClientIfExists(item.serverId);
    if (fromFactory != null) {
      return fromFactory;
    }

    final active = GetIt.instance<MediaServerClient>();
    final normalizedActive = normalizeServerBaseUrl(active.baseUrl);
    final normalizedServerId = normalizeServerBaseUrl(item.serverId);
    if (normalizedActive.isNotEmpty &&
        normalizedServerId.isNotEmpty &&
        normalizedActive == normalizedServerId) {
      return active;
    }

    return null;
  }

  void _schedulePreview(AggregatedItem item, {required Duration delay}) {
    final previewKey = _previewKeyFor(item);
    if (_activePreviewKey == previewKey) {
      return;
    }

    _previewDelayTimer?.cancel();
    _previewDelayTimer = null;
    if (_activePreviewKey != null) {
      _finishSharedPreview();
    }

    if (!widget.prefs.get(UserPreferences.episodePreviewEnabled) ||
        !_supportsEpisodePreview(item) ||
        _chromeFocusActive ||
        _mainPlaybackActive) {
      return;
    }

    late final Timer thisTimer;
    thisTimer = Timer(delay, () async {
      if (!mounted || !_isHomeRouteActive()) {
        return;
      }
      if (!identical(_previewDelayTimer, thisTimer)) {
        return;
      }
      _previewStartScrollOffset = _scrollController.offset;
      setState(() {
        _activePreviewKey = previewKey;
        _previewReady = false;
      });
      await _startSharedPreview(item, previewKey);
    });
    _previewDelayTimer = thisTimer;
  }

  bool _isPreviewRequestActive(int requestId, String previewKey) {
    return mounted &&
        requestId == _previewRequestId &&
        _activePreviewKey == previewKey &&
        _isHomeRouteActive();
  }

  void _stopPreviewFor(AggregatedItem item) {
    final previewKey = _previewKeyFor(item);
    _previewDelayTimer?.cancel();
    _previewDelayTimer = null;
    if (_activePreviewKey == previewKey && mounted) {
      _finishSharedPreview();
    }
  }

  void _finishSharedPreview({
    bool releaseResources = false,
    bool updateUi = true,
  }) {
    _previewDelayTimer?.cancel();
    _previewDelayTimer = null;
    _previewStopTimer?.cancel();
    _previewStopTimer = null;
    _previewRequestId++;
    if (!kIsWeb) {
      unawaited(_previewPlayer?.setVolume(0));
      _previewPlayer?.stop();
    }
    if (_previewUsingMedia3) {
      _previewUsingMedia3 = false;
      unawaited(_media3PreviewBackend!.stop());
      _media3PreviewBackend.resetVolumeState();
    }
    if (releaseResources || kIsWeb) {
      _previewPlayer?.dispose();
      _previewPlayer = null;
      _previewController = null;
    }

    if (_activePreviewKey != null || _previewReady) {
      if (updateUi && mounted) {
        setState(() {
          _activePreviewKey = null;
          _previewReady = false;
        });
      } else {
        _activePreviewKey = null;
        _previewReady = false;
      }
    }
    _themeMusicService.setExternalAudioActive(false);
  }

  void _disposeSharedPreview() {
    _finishSharedPreview(releaseResources: true, updateUi: false);
  }

  Future<void> _startSharedPreview(AggregatedItem item, String previewKey) async {
    final mainPlaybackActive =
        _mainPlaybackActive || _playbackManager.state.isPlaying;
    if (_chromeFocusActive || mainPlaybackActive || !_isHomeRouteActive()) {
      _finishSharedPreview(releaseResources: true);
      return;
    }
    final requestId = ++_previewRequestId;

    _previewStopTimer?.cancel();
    if (kIsWeb) {
      _previewPlayer?.dispose();
      _previewPlayer = null;
      _previewController = null;
    } else {
      _previewPlayer?.stop();
    }
    if (_previewUsingMedia3) {
      await _media3PreviewBackend!.stop();
      _previewUsingMedia3 = false;
    }
    _themeMusicService.setExternalAudioActive(true);

    try {
      final client = _clientForItem(item);
      if (client == null) {
        _finishSharedPreview();
        return;
      }
      final target = await _resolvePreviewTargetItem(client, item);
      if (!_isPreviewRequestActive(requestId, previewKey) || target == null) {
        return;
      }

      final seekPosition = _previewSeekPosition(target);
      final previewUrl = _buildPreviewUrl(client, target, seekPosition);
      final previewUri = Uri.tryParse(previewUrl);
      if (previewUri == null ||
          !previewUri.hasScheme ||
          previewUri.host.isEmpty) {
        _finishSharedPreview();
        return;
      }

      final previewAudioEnabled = widget.prefs.get(
        UserPreferences.previewAudioEnabled,
      );
      final previewVolume = kIsWeb
          ? 0.0
          : (previewAudioEnabled ? 100.0 : 0.0);
      final useMedia3 = _useMedia3InlinePreview();
      if (useMedia3) {
        _previewUsingMedia3 = true;
        await _media3PreviewBackend!.setVolume(previewVolume);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          return;
        }

        await _media3PreviewBackend.play(<String, dynamic>{
          'url': previewUrl,
          'mediaType': 'video',
        }).timeout(_previewOpenTimeout);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          await _media3PreviewBackend.stop();
          return;
        }
      } else {
        _previewUsingMedia3 = false;
        final player = _ensureSharedPreviewPlayer();
        await player.setVolume(previewVolume);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          return;
        }

        await player.open(Media(previewUrl)).timeout(_previewOpenTimeout);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          await player.stop();
          return;
        }

        if (previewAudioEnabled) {
          await player.setVolume(100.0);
          if (!_isPreviewRequestActive(requestId, previewKey)) {
            await player.stop();
            return;
          }
        }

        await player.setPlaylistMode(PlaylistMode.loop);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          await player.stop();
          return;
        }
      }
      _previewStopTimer = Timer(const Duration(seconds: 30), () {
        if (requestId == _previewRequestId && _activePreviewKey == previewKey) {
          _finishSharedPreview();
        }
      });

      if (_isPreviewRequestActive(requestId, previewKey)) {
        setState(() => _previewReady = true);
      }
    } catch (_) {
      if (_isPreviewRequestActive(requestId, previewKey)) {
        _finishSharedPreview();
      }
    }
  }

  Player _ensureSharedPreviewPlayer() {
    final existing = _previewPlayer;
    if (existing != null) {
      return existing;
    }

    final player = Player(
      configuration: const PlayerConfiguration(
        libass: false,
      ),
    );
    final platform = player.platform;
    if (platform is NativePlayer) {
      try {
        final dynamic native = platform;
        native.setProperty('network-timeout', '30');
      } catch (_) {}
    }
    _previewPlayer = player;
    _previewController = VideoController(
      player,
      configuration: VideoControllerConfiguration(
        hwdec: _homePreviewHwdecSetting(),
      ),
    );
    return player;
  }

  String? _homePreviewHwdecSetting() {
    final hwDecodingEnabled = widget.prefs.get(UserPreferences.hardwareDecoding);
    if (!hwDecodingEnabled) {
      return 'no';
    }
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
      return 'auto';
    }
    if (PlatformDetection.isLinux) {
      return 'auto-safe';
    }
    return null;
  }

  Future<AggregatedItem?> _resolvePreviewTargetItem(
    MediaServerClient client,
    AggregatedItem item,
  ) async {
    try {
      String targetId = item.id;
      Map<String, dynamic> fallbackRawData = item.rawData;

      if (item.type == 'Series') {
        // try NextUp to respect user progress, and avoid empty folder search
        final nextUpData = await client.itemsApi.getNextUp(
          seriesId: item.id,
          limit: 1,
        );
        final nextUpItems = (nextUpData['Items'] as List?)
            ?.cast<Map<String, dynamic>>()
            .toList();

        if (nextUpItems != null && nextUpItems.isNotEmpty) {
          final nextUp = nextUpItems.first;
          // Skip specials (Season 0) if they appear in Next Up
          if ((nextUp['ParentIndexNumber'] as int?) != 0) {
            targetId = nextUp['Id'] as String;
            fallbackRawData = nextUp;
          }
        }

        // If we still only have the Series ID, we couldn't find a valid episode
        if (targetId == item.id) return null;
      }

      try {
        final itemData = await client.itemsApi.getItem(targetId);
        return AggregatedItem(
          id: targetId,
          serverId: item.serverId,
          rawData: itemData,
        );
      } catch (_) {
        return AggregatedItem(
          id: targetId,
          serverId: item.serverId,
          rawData: fallbackRawData,
        );
      }
    } catch (_) {
      return null;
    }
  }

  Duration _previewSeekPosition(AggregatedItem item) {
    final resume = _playbackPositionFromRaw(item);
    if (resume != null && resume > Duration.zero) {
      return resume;
    }

    final duration = item.runtime;
    if (duration != null && duration > Duration.zero) {
      // If the video is shorter than 15 minutes, start at 0 instead of 3 mins
      if (duration < const Duration(minutes: 15)) {
        return Duration.zero;
      }
    }

    return const Duration(minutes: 3);
  }

  Duration? _playbackPositionFromRaw(AggregatedItem item) {
    final userData = item.rawData['UserData'];
    if (userData is! Map) {
      return item.playbackPosition;
    }

    final rawTicks = userData['PlaybackPositionTicks'];
    if (rawTicks is num && rawTicks > 0) {
      return Duration(microseconds: rawTicks.toInt() ~/ 10);
    }

    return item.playbackPosition;
  }

  String _buildPreviewUrl(
    MediaServerClient client,
    AggregatedItem item,
    Duration startPosition,
  ) {
    if (item.id.isEmpty) return '';

    final baseUri = Uri.tryParse(client.baseUrl.trim());
    if (baseUri == null || !baseUri.hasScheme || baseUri.host.isEmpty) {
      return '';
    }

    final mediaSourceId = item.mediaSources.isNotEmpty
        ? item.mediaSources.first['Id'] as String?
        : null;
    final startTicks = startPosition.inMicroseconds * 10;
    final params = <String, String>{
      'Static': 'false',
      'videoCodec': 'h264',
      'audioCodec': 'aac',
      'maxVideoBitDepth': '8',
      'videoBitRate': '4000000',
      'maxWidth': '1280',
      'maxHeight': '720',
      'audioBitRate': '96000',
      'audioChannels': '2',
      'subtitleMethod': 'Drop',
      if (kIsWeb) 'container': 'mp4',
      if (kIsWeb) 'TranscodingContainer': 'mp4',
      if (startTicks > 0) 'StartTimeTicks': '$startTicks',
      'MediaSourceId': ?mediaSourceId,
      if (client.accessToken != null) 'ApiKey': client.accessToken!,
    };

      final normalizedBasePath = baseUri.path.endsWith('/')
        ? baseUri.path.substring(0, baseUri.path.length - 1)
        : baseUri.path;
      final streamPath = kIsWeb ? 'stream.mp4' : 'stream';
      final fullPath =
        '$normalizedBasePath/Videos/${item.id}/$streamPath';

      return baseUri
        .replace(path: fullPath, queryParameters: params)
        .toString();
  }

  bool _isMediaBarIncluded() {
    if (!_isMediaBarEnabledByMode()) {
      return false;
    }

    final mediaBarState = widget.mediaBarViewModel.state;
    return mediaBarState is MediaBarLoading ||
        mediaBarState is MediaBarError ||
        (mediaBarState is MediaBarReady && mediaBarState.items.isNotEmpty);
  }

  bool _isHomeRouteActive() {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    final onHomePath =
        path == Destinations.home || path.startsWith('${Destinations.home}/');
    if (!onHomePath || !mounted) return false;
    final route = ModalRoute.of(context);
    return route?.isCurrent ?? true;
  }

  bool _mayRestoreHomeFocus() {
    return _isHomeRouteActive() && !SettingsPanel.isOpenNotifier.value;
  }

  bool _isHomeRowsStyleV2() {
    return widget.prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
  }

  bool _showHomeRowInfoOverlay() {
    if (_isHomeRowsStyleV2()) {
      return false;
    }
    return widget.prefs.get(UserPreferences.homeRowInfoOverlay);
  }

  void _primeV2FocusedRatings(AggregatedItem item) {
    if (!widget.prefs.get(UserPreferences.enableAdditionalRatings)) {
      return;
    }

    final itemKey = _previewKeyFor(item);
    if (_v2AdditionalRatingsByKey.containsKey(itemKey)) {
      return;
    }
    if (_v2RatingsRequests.containsKey(itemKey)) {
      return;
    }

    final request = _loadV2FocusedRatings(item, itemKey).whenComplete(() {
      _v2RatingsRequests.remove(itemKey);
    });
    _v2RatingsRequests[itemKey] = request;
  }

  Future<void> _loadV2FocusedRatings(AggregatedItem item, String itemKey) async {
    var tmdbId = item.tmdbId;
    if (tmdbId == null) {
      if (_v2TmdbIdByKey.containsKey(itemKey)) {
        tmdbId = _v2TmdbIdByKey[itemKey];
      } else {
        final clientFactory = GetIt.instance<MediaServerClientFactory>();
        final client =
            clientFactory.getClientIfExists(item.serverId) ??
            clientFactory.getActiveClient();
        try {
          final details = await client.itemsApi.getItem(item.id);
          tmdbId = (details['ProviderIds'] as Map?)?['Tmdb'] as String?;
        } catch (_) {
          tmdbId = null;
        }
        _v2TmdbIdByKey[itemKey] = tmdbId;
      }
    }

    if (tmdbId == null || tmdbId.isEmpty) {
      return;
    }

    final result = await GetIt.instance<MdbListRepository>().getRatings(
      tmdbId: tmdbId,
      mediaType: item.type ?? 'Movie',
    );
    if (!mounted || result == null || result.isEmpty) {
      return;
    }

    setState(() {
      _v2AdditionalRatingsByKey[itemKey] = result;
    });
  }

  double _mediaBarHeight() {
    final size = MediaQuery.sizeOf(context);
    final screenHeight = size.height;
    final screenWidth = size.width;
    
    if (!PlatformDetection.useMobileUi) {
      return screenHeight;
    }

    final isLandscape = screenWidth > screenHeight;
    if (isLandscape) {
      return screenHeight;
    }

    final mediaBarMode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    if (mediaBarMode == UserPreferences.mediaBarModeMakd) {
      return screenHeight * 0.46;
    }

    return screenHeight * 0.55;
  }

  double _pinnedInfoCollapseOffset() {
    return (_mediaBarHeight() - (_pinTransitionDistance / 2))
        .clamp(0.0, double.infinity);
  }

  Future<void> _revealAndScrollToPinnedInfo({
    bool ignoreScrollCooldown = false,
  }) async {
    if (_infoRevealed) return;
    if (!_showHomeRowInfoOverlay()) return;

    final now = DateTime.now();
    if (!ignoreScrollCooldown &&
        _lastScrollTime != null &&
        now.difference(_lastScrollTime!).inMilliseconds < 350) {
      return;
    }

    if (mounted) {
      setState(() => _infoRevealed = true);
    }
  }

  void _navigateFromMediaBarToNavbar() {
    widget.onItemSelected(null);
    if (_scrollController.hasClients && _scrollController.offset > 0) {
      unawaited(_scrollController.animateTo(
        0,
        duration: _focusHandoffDuration,
        curve: _focusHandoffCurve,
      ));
    }
    _requestFocusToNavbar();
  }

  void _focusContentFromNavbar() {
    if (!_mayRestoreHomeFocus()) return;

    if (_isMediaBarIncluded()) {
      if (mounted && !_mediaBarVisible) {
        setState(() => _mediaBarVisible = true);
      }
      _requestMediaBarFocus(force: true);
      return;
    }

    final activeRow = _activeFocusedRowIndex;
    if (activeRow != null && _requestRowFocusFromMemory(activeRow)) {
      return;
    }

    final rows = widget.viewModel.rows;
    for (var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
      if (!_rowHasFocusableItems(rows[rowIndex])) continue;
      if (_requestRowFocusFromMemory(rowIndex, preferredIndex: 0)) {
        return;
      }
    }

    _ensureInitialHomeFocus(rows);
  }

  void _requestFocusToNavbar({int attempt = 0}) {
    if (!mounted) return;
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) {
      focusNavbar();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
        final primary = FocusManager.instance.primaryFocus;
        final ctx = primary?.context;
        if (primary != null && ctx != null) {
          final box = ctx.findRenderObject();
          if (box is RenderBox) {
            final global = box.localToGlobal(Offset.zero);
            final isTopNavbarFocus =
                navbarPosition == NavbarPosition.top && global.dy < 120;
            final isLeftSidebarFocus =
                navbarPosition == NavbarPosition.left && global.dx < 220;
            if (isTopNavbarFocus || isLeftSidebarFocus) {
              return;
            }
          }
        }
        if (attempt < 4) {
          _requestFocusToNavbar(attempt: attempt + 1);
        } else {
          FocusScope.of(context).focusInDirection(TraversalDirection.up);
        }
      });
      return;
    }
    if (attempt < 4) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _requestFocusToNavbar(attempt: attempt + 1);
      });
    }
  }

  Future<void> _moveFocusFromMediaBarToRows() async {
    if (_verticalNavInFlight || !_allowVerticalNavNow()) {
      return;
    }
    if (!_mediaBarFocusNode.hasFocus) {
      return;
    }

    if (!_isMediaBarIncluded()) {
      FocusScope.of(context).nextFocus();
      return;
    }
    _finishSharedPreview(releaseResources: true);
    _suppressNextRowPreviewFromMediaBar = true;
    _forceRevealOnNextRowFocusFromMediaBar = true;
    if (mounted && _mediaBarVisible) {
      setState(() => _mediaBarVisible = false);
    }
    if (_scrollController.hasClients) {
      final target = _mediaBarHeight()
          .clamp(0.0, _scrollController.position.maxScrollExtent);
      if (_scrollController.offset < target) {
        _scrollController.jumpTo(target);
      }
    }
    await _focusAdjacentRowItem(widget.viewModel.rows, -1, 1);
  }

  void _onHomeRowTileFocused(AggregatedItem? item) {
    final forceReveal = _forceRevealOnNextRowFocusFromMediaBar;
    _forceRevealOnNextRowFocusFromMediaBar = false;
    widget.onItemSelected(item);
    unawaited(_revealAndScrollToPinnedInfo(ignoreScrollCooldown: forceReveal));
    _finishSharedPreview();
    _suppressNextRowPreviewFromMediaBar = false;
  }

  Future<void> _moveFocusFromRowsToMediaBar() async {
    if (_verticalNavInFlight) {
      return;
    }
    _verticalNavInFlight = true;
    try {
      _finishSharedPreview(releaseResources: true);
      widget.onItemSelected(null);
      if (mounted) {
        setState(() {
          _infoRevealed = false;
          _mediaBarVisible = true;
        });
      }
      if (!_isMediaBarIncluded()) {
        _navigateFromMediaBarToNavbar();
        return;
      }

      if (_scrollController.hasClients && _scrollController.offset > 0) {
        await _scrollController.animateTo(
          0,
          duration: _focusHandoffDuration,
          curve: _focusHandoffCurve,
        );
      }

      if (!mounted) return;

      final navComplete = Completer<void>();
      late final VoidCallback focusListener;
      focusListener = () {
        if (_mediaBarFocusNode.hasFocus && !navComplete.isCompleted) {
          navComplete.complete();
        }
      };
      _mediaBarFocusNode.addListener(focusListener);

      _requestMediaBarFocus(force: true);

      if (_mediaBarFocusNode.hasFocus && !navComplete.isCompleted) {
        navComplete.complete();
      }

      await navComplete.future.timeout(
        const Duration(milliseconds: 450),
        onTimeout: () {},
      );
      _mediaBarFocusNode.removeListener(focusListener);
    } finally {
      _verticalNavInFlight = false;
    }
  }

  void _requestMediaBarFocus({int attempt = 0, bool force = false}) {
    if (!mounted || (!force && _initialFocusResolved) || !_isMediaBarIncluded()) {
      return;
    }
    if (!_isHomeRouteActive()) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_isMediaBarIncluded()) return;
      if (!_isHomeRouteActive()) return;

      if (_mediaBarFocusNode.context == null) {
        if (attempt < 8) {
          Future<void>.delayed(const Duration(milliseconds: 50), () {
            if (!mounted) return;
            _requestMediaBarFocus(attempt: attempt + 1, force: force);
          });
        }
        return;
      }

      _mediaBarFocusNode.requestFocus();
      if (_mediaBarFocusNode.hasFocus) {
        _initialFocusResolved = true;
        return;
      }

      if (attempt < 8) {
        Future<void>.delayed(const Duration(milliseconds: 50), () {
          if (!mounted) return;
          _requestMediaBarFocus(attempt: attempt + 1, force: force);
        });
      }
    });
  }

  GlobalKey _rowKey(int rowIndex) {
    return _rowKeys.putIfAbsent(rowIndex, () => GlobalKey());
  }

  GlobalKey _rowContainerKey(int rowIndex) {
    return _rowContainerKeys.putIfAbsent(rowIndex, () => GlobalKey());
  }

  ScrollController _rowHorizontalController(int rowIndex) {
    return _rowHorizontalControllers.putIfAbsent(
      rowIndex,
      () => ScrollController(),
    );
  }

  void _scrollHomeRowHorizontal(int rowIndex, double delta) {
    final controller = _rowHorizontalControllers[rowIndex];
    if (controller == null || !controller.hasClients) return;

    final target = (controller.offset + delta).clamp(
      0.0,
      controller.position.maxScrollExtent,
    );
    controller.animateTo(
      target,
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeInOut,
    );
  }

  LockedFocusRowState? _rowStateOf(int rowIndex) {
    return _rowKeys[rowIndex]?.currentState as LockedFocusRowState?;
  }

  Future<void> _scrollTvRowIntoOverlayBand(int rowIndex) async {
    if (!mounted || !_scrollController.hasClients) return;

    final containerCtx = _rowContainerKeys[rowIndex]?.currentContext;
    final stackRender = context.findRenderObject();
    if (containerCtx == null || stackRender is! RenderBox) {
      return;
    }

    final containerRender = containerCtx.findRenderObject();
    if (containerRender is! RenderBox ||
        !stackRender.hasSize ||
        !containerRender.hasSize) {
      return;
    }

    final stackTopGlobal = stackRender.localToGlobal(Offset.zero).dy;
    final containerTopGlobal = containerRender.localToGlobal(Offset.zero).dy;
    final desiredContainerTopGlobal = stackTopGlobal + _overlayBottom + 8;
    final scrollDelta = containerTopGlobal - desiredContainerTopGlobal;
    final currentOffset = _scrollController.offset;
    final targetOffset = (currentOffset + scrollDelta).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    if ((targetOffset - currentOffset).abs() <= 1.0) {
      return;
    }

    await _scrollController.animateTo(
      targetOffset,
      duration: _focusHandoffDuration,
      curve: _focusHandoffCurve,
    );
  }

  bool _requestRowFocusFromMemory(int rowIndex, {int? preferredIndex}) {
    if (!_mayRestoreHomeFocus()) return false;
    final state = _rowStateOf(rowIndex);
    if (state == null) return false;
    if (preferredIndex != null) {
      state.requestFocusAt(preferredIndex);
    } else {
      state.requestFocusFromMemory();
    }
    return true;
  }

  bool _rowHasFocusableItems(HomeRow row) {
    if (row.isLoading) {
      return false;
    }

    return switch (row.rowType) {
      HomeRowType.liveTv => true,
      _ => row.items.isNotEmpty,
    };
  }

  void _ensureInitialHomeFocus(List<HomeRow> rows, {int attempt = 0}) {
    if (!mounted) {
      return;
    }
    if (PlatformDetection.useMobileUi) {
      _initialFocusResolved = true;
      return;
    }
    if (_shouldRepairInitialFocusAfterMediaBarSync()) {
      _initialFocusResolved = false;
    }
    if (_initialFocusResolved) {
      return;
    }
    if (!_mayRestoreHomeFocus()) return;

    final mediaBarEnabled = _isMediaBarEnabledByMode();
    final mediaBarState = widget.mediaBarViewModel.state;
    final firstRowIndex = rows.indexWhere(_rowHasFocusableItems);

    if (firstRowIndex > 0 && rows.take(firstRowIndex).any((r) => r.isLoading)) {
      return;
    }

    bool focusMediaBar = false;
    int? focusRowIndex;

    if (mediaBarEnabled) {
      if (mediaBarState is MediaBarReady) {
        if (mediaBarState.items.isNotEmpty) {
          focusMediaBar = true;
        } else if (firstRowIndex != -1) {
          focusRowIndex = firstRowIndex;
        }
      } else if (mediaBarState is MediaBarDisabled || mediaBarState is MediaBarError) {
        if (firstRowIndex != -1) {
          focusRowIndex = firstRowIndex;
        }
      } else {
        return;
      }
    } else if (firstRowIndex != -1) {
      focusRowIndex = firstRowIndex;
    }

    if (!focusMediaBar && focusRowIndex == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _initialFocusResolved) {
        return;
      }
      if (!_mayRestoreHomeFocus()) return;

      if (focusMediaBar) {
        if (_scrollController.hasClients && _scrollController.offset > 0) {
          _scrollController.jumpTo(0);
        }
        _requestMediaBarFocus();
        return;
      }

      final rowIndex = focusRowIndex!;
      if (_isMediaBarIncluded() &&
          _scrollController.hasClients &&
          rowIndex >= 0 &&
          rowIndex < _rowTopOffsets.length) {
        final targetOffset = _rowTopOffsets[rowIndex]
            .clamp(0.0, _scrollController.position.maxScrollExtent);
        if ((_scrollController.offset - targetOffset).abs() > 10) {
          _scrollController.jumpTo(targetOffset);
        }
      }
      final didRequestFocus = _requestRowFocusFromMemory(rowIndex);
      if (!didRequestFocus) {
        if (attempt < 8) {
          Future<void>.delayed(const Duration(milliseconds: 50), () {
            if (!mounted || _initialFocusResolved || !_mayRestoreHomeFocus()) {
              return;
            }
            _ensureInitialHomeFocus(rows, attempt: attempt + 1);
          });
        }
        return;
      }
      _initialFocusResolved = true;
    });
  }

  String _hubKeyForRow(HomeRow row) => 'home_${row.id}';

  Future<void> _focusAdjacentRowItem(
    List<HomeRow> rows,
    int fromRowIndex,
    int direction,
  ) async {
    if (_verticalNavInFlight) return;
    _verticalNavInFlight = true;
    final maxRow = rows.length - 1;
    var target = fromRowIndex + direction;
    try {
      while (target >= 0 && target <= maxRow) {
        final candidate = rows[target];
        final hasItems = _rowHasFocusableItems(candidate);
        if (hasItems) {
          final targetState = _rowStateOf(target);
          if (targetState != null) {
            targetState.requestFocusAt(0);
          } else {
            _requestRowFocusFromMemory(target, preferredIndex: 0);
          }

          final navComplete = Completer<void>();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              if (!navComplete.isCompleted) navComplete.complete();
              return;
            }
            final rowCtx = _rowKeys[target]?.currentContext;
            if (rowCtx == null) {
              if (!navComplete.isCompleted) navComplete.complete();
              return;
            }

            final viewportHeight = _scrollController.hasClients
                ? _scrollController.position.viewportDimension
                : 768.0;
            final overlayEnabled = _showHomeRowInfoOverlay();

            if (PlatformDetection.isTV &&
                _scrollController.hasClients) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted || !_scrollController.hasClients) {
                  if (!navComplete.isCompleted) navComplete.complete();
                  return;
                }
                final innerCtx = _rowKeys[target]?.currentContext;
                if (innerCtx == null) {
                  if (!navComplete.isCompleted) navComplete.complete();
                  return;
                }
                final renderObj = innerCtx.findRenderObject();
                if (renderObj is! RenderBox || !renderObj.hasSize) {
                  if (!navComplete.isCompleted) navComplete.complete();
                  return;
                }
                _scrollTvRowIntoOverlayBand(target).whenComplete(() {
                  if (!navComplete.isCompleted) navComplete.complete();
                });
              });
              return;
            }

            final alignment = overlayEnabled
                ? ((_overlayBottom + 120) / viewportHeight).clamp(0.05, 0.85)
                : 0.12;

            Scrollable.ensureVisible(
              rowCtx,
              alignment: alignment,
              duration: _focusHandoffDuration,
              curve: _focusHandoffCurve,
            ).whenComplete(() {
              if (!navComplete.isCompleted) navComplete.complete();
            });
          });
          await navComplete.future.timeout(
            const Duration(milliseconds: 450),
            onTimeout: () {},
          );
          return;
        }
        target += direction;
      }

      if (direction < 0) {
        if (_isMediaBarIncluded()) {
          _verticalNavInFlight = false;
          await _moveFocusFromRowsToMediaBar();
        } else {
          _navigateFromMediaBarToNavbar();
        }
      }
    } finally {
      _verticalNavInFlight = false;
    }
  }

  bool _allowVerticalNavNow() {
    final now = DateTime.now();
    if (_lastVerticalNavAt != null &&
        now.difference(_lastVerticalNavAt!) < const Duration(milliseconds: 140)) {
      return false;
    }
    _lastVerticalNavAt = now;
    return true;
  }

  bool _onRowVerticalNavigation({
    required int rowIndex,
    required List<HomeRow> rows,
    required bool isUp,
  }) {
    _markUserGesture();
    if (!_allowVerticalNavNow()) return true;
    if (isUp) {
      if (rowIndex == 0) {
        if (_isMediaBarIncluded()) {
          unawaited(_moveFocusFromRowsToMediaBar());
        } else {
          _navigateFromMediaBarToNavbar();
        }
      } else {
        unawaited(_focusAdjacentRowItem(rows, rowIndex, -1));
      }
    } else {
      unawaited(_focusAdjacentRowItem(rows, rowIndex, 1));
    }
    return true;
  }

  void _onRowLeftEdge() {
    final navbarIsLeft =
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    if (!navbarIsLeft) return;
    final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
    if (focusNavbar != null) focusNavbar();
  }

  void _onRowFocusTracked(int rowIndex, bool focused) {
    if (!mounted) return;
    final isMobileUi = PlatformDetection.useMobileUi;
    if (focused) {
      _hasEverFocusedHomeContent = true;
      if (_activeFocusedRowIndex != rowIndex && _activePreviewKey != null) {
        _finishSharedPreview();
      }
      _activeFocusedRowIndex = rowIndex;
      if (!isMobileUi && _mediaBarVisible) {
        setState(() => _mediaBarVisible = false);
      }
    } else if (_activeFocusedRowIndex == rowIndex) {
      if (_isSidebarFocus) {
        return;
      }
      if (_activePreviewKey != null) {
        _finishSharedPreview();
      }
      _activeFocusedRowIndex = null;
    }
  }

  KeyEventResult _handleRowsKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (!event.logicalKey.isUpKey) return KeyEventResult.ignored;

    final current = FocusManager.instance.primaryFocus;
    if (current == null) return KeyEventResult.ignored;

    if (_isMediaBarIncluded()) {
      if (current == _mediaBarFocusNode) return KeyEventResult.ignored;
      unawaited(_moveFocusFromRowsToMediaBar());
      return KeyEventResult.handled;
    }

    if (_activeFocusedRowIndex == 0) {
      _navigateFromMediaBarToNavbar();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _onScroll() {
    _lastScrollTime = DateTime.now();
    final offset = _scrollController.offset;
    final previousOffset = _scrollOffset;
    final scrollingUp = offset < previousOffset;
    final atTop = offset <= 0;
    if (atTop != _isScrolledToTop) {
      _isScrolledToTop = atTop;
      widget.onScrolledToTopChanged?.call(atTop);
    }

    if (!_isActivelyScrolling) {
      _isActivelyScrolling = true;
      if (mounted) setState(() {});
    }
    _scrollIdleTimer?.cancel();
    _scrollIdleTimer = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      _isActivelyScrolling = false;
      setState(() {});
    });
    if (_activePreviewKey != null) {
      final scrollDelta = (offset - _previewStartScrollOffset).abs();
      if (scrollDelta > _previewScrollThreshold) {
        _finishSharedPreview();
        return;
      }
    }

    if (_infoRevealed &&
        _isMediaBarIncluded() &&
        _showHomeRowInfoOverlay()) {
      final collapseOffset = _pinnedInfoCollapseOffset();
      if (scrollingUp && offset < collapseOffset) {
        setState(() {
          _infoRevealed = false;
          _scrollOffset = offset;
        });
        return;
      }
    }

    if (_infoRevealed && _isMediaBarIncluded()) {
      setState(() => _scrollOffset = offset);
    } else {
      _scrollOffset = offset;
    }
  }

  double _libraryRowExtent(double rowHeight, {double metadataScale = 1.0}) =>
      rowHeight + (34 * metadataScale);

  double _desktopUiScaleFactor() {
    if (!PlatformDetection.useDesktopUi) return 1.0;
    return widget.prefs.get(UserPreferences.desktopUiScale).scaleFactor;
  }

  double _squarePosterSide(PosterSize posterSize) {
    final platformScale = PlatformDetection.isTV ? 0.8 : _desktopUiScaleFactor();
    return posterSize.portraitHeight.toDouble() * platformScale;
  }

  double _estimatedRowExtent(
    HomeRow row,
    PosterSize posterSize,
    UserPreferences prefs,
  ) {
    final desktopScale = _desktopUiScaleFactor();
    final metadataScale = PlatformDetection.useDesktopUi ? desktopScale : 1.0;
    if (row.isLoading) {
      return _libraryRowExtent(220 * metadataScale, metadataScale: metadataScale);
    }

    if (row.rowType == HomeRowType.liveTv ||
        row.rowType == HomeRowType.libraryTilesSmall) {
      final squarePosterSide = _squarePosterSide(posterSize);
      final rowHeight = squarePosterSide + (56 * metadataScale);
      return _libraryRowExtent(rowHeight, metadataScale: metadataScale);
    }

    final isRowsV2 = prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
    final rowImageType = isRowsV2 ? ImageType.poster : _homeRowImageTypeForRow(row, prefs);
    final platformScale = PlatformDetection.isTV ? 0.8 : desktopScale;
    var maxCardHeight = 220.0 * metadataScale;
    if (isRowsV2) {
      final imageHeight = posterSize.portraitHeight.toDouble() * platformScale * 2;
      maxCardHeight = imageHeight + (_v2MetadataHeightBudget(prefs) * metadataScale);
    } else {
      for (final item in row.items) {
        final aspectRatio = _aspectRatioForRowItem(item, row, rowImageType);
        final imageHeight = (aspectRatio > 1
            ? posterSize.landscapeHeight.toDouble()
            : posterSize.portraitHeight.toDouble()) * platformScale;
        final cardHeight = imageHeight + (46 * metadataScale);
        if (cardHeight > maxCardHeight) {
          maxCardHeight = cardHeight;
        }
      }
    }

    return _libraryRowExtent(maxCardHeight, metadataScale: metadataScale);
  }

  List<double> _computeRowExtents(
    List<HomeRow> rows,
    PosterSize posterSize,
    UserPreferences prefs,
  ) {
    final desktopScale = _desktopUiScaleFactor();
    if (_cachedRowExtents != null &&
        identical(_cachedExtentRows, rows) &&
        _cachedExtentPosterSize == posterSize &&
        _cachedExtentDesktopScale == desktopScale &&
        _cachedExtentPrefsVersion == _layoutPrefsVersion) {
      return _cachedRowExtents!;
    }
    final extents = rows
        .map((row) => _estimatedRowExtent(row, posterSize, prefs))
        .toList(growable: false);
    _rowImageUrlCache.clear();
    _cachedExtentRows = rows;
    _cachedExtentPosterSize = posterSize;
    _cachedExtentDesktopScale = desktopScale;
    _cachedExtentPrefsVersion = _layoutPrefsVersion;
    _cachedRowExtents = extents;
    return extents;
  }

  String? _cachedRowImageUrl(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    ImageType imageType,
    bool useSeriesThumbs,
    double requestScale, {
    bool isMyMediaRow = false,
  }) {
    final key =
        '${item.serverId}|${item.id}|${imageType.index}|${height.round()}'
        '|$useSeriesThumbs|${requestScale.toStringAsFixed(2)}|$isMyMediaRow';
    final cached = _rowImageUrlCache[key];
    if (cached != null || _rowImageUrlCache.containsKey(key)) {
      return cached;
    }
    if (_rowImageUrlCache.length > 600) {
      _rowImageUrlCache.clear();
    }
    final url = _resolveRowImageUrl(
      item,
      imageApi,
      height,
      imageType,
      useSeriesThumbs,
      requestScale,
      isMyMediaRow: isMyMediaRow,
    );
    _rowImageUrlCache[key] = url;
    return url;
  }

  double _v2MetadataHeightBudget(UserPreferences prefs) {
    final hasAdditionalRatings =
        prefs.get(UserPreferences.enableAdditionalRatings);
    if (hasAdditionalRatings) {
      return PlatformDetection.isTV ? 208.0 : 144.0;
    }
    return 136.0;
  }

  double _overlayRowShift({
    required double rowViewportTop,
    required double rowExtent,
    required double overlayBottom,
  }) {
    if (rowViewportTop >= overlayBottom + 20) return 0;
    const transitionRange = 40.0;
    final progress =
        ((overlayBottom + 20 - rowViewportTop) / transitionRange).clamp(0.0, 1.0);
    final fullShift = (rowViewportTop + rowExtent + 10).clamp(0.0, double.infinity);
    return Curves.easeIn.transform(progress) * fullShift * 1.5;
  }

  Widget _buildShiftedRow({
    required Widget child,
    required int rowIndex,
    required List<double> rowTopOffsets,
    required List<double> rowExtents,
    required bool showInfoOverlay,
    required double overlayBottom,
  }) {
    if (!showInfoOverlay || !_infoRevealed) {
      return child;
    }

    if (!PlatformDetection.isTV && !_isMediaBarIncluded()) {
      return child;
    }

    if (PlatformDetection.isTV) {
      final focusedRowIndex = _focusedRowIndex(FocusManager.instance.primaryFocus);
      final rowViewportTop = rowTopOffsets[rowIndex] - _scrollOffset;
      final rowBottom = rowViewportTop + rowExtents[rowIndex];
      if (focusedRowIndex != null && rowIndex < focusedRowIndex) {
        return IgnorePointer(
          child: Opacity(opacity: 0, child: child),
        );
      }
      if (rowBottom < overlayBottom - 80) {
        return IgnorePointer(
          child: Opacity(opacity: 0, child: child),
        );
      }
      return child;
    }

    final focusedRowIndex = _focusedRowIndex(FocusManager.instance.primaryFocus);
    if (focusedRowIndex != null && rowIndex >= focusedRowIndex) {
      return child;
    }

    final rowViewportTop = rowTopOffsets[rowIndex] - _scrollOffset;
    final rowViewportBottom = rowViewportTop + rowExtents[rowIndex];

    if (rowViewportBottom <= overlayBottom + 8) {
      return IgnorePointer(
        child: Opacity(opacity: 0, child: child),
      );
    }

    if (focusedRowIndex != null &&
        focusedRowIndex < rowTopOffsets.length &&
        (rowTopOffsets[focusedRowIndex] - _scrollOffset) >= overlayBottom + 20) {
      return child;
    }

    final shift = _overlayRowShift(
      rowViewportTop: rowViewportTop,
      rowExtent: rowExtents[rowIndex],
      overlayBottom: overlayBottom,
    );
    if (shift <= 0) {
      return child;
    }

    const transitionRange = 40.0;
    final progress =
        ((overlayBottom + 20 - rowViewportTop) / transitionRange).clamp(0.0, 1.0);
    final opacity = (1.0 - (progress * 1.4)).clamp(0.0, 1.0);

    return ClipRect(
      child: Transform.translate(
        offset: Offset(0, -shift),
        child: Opacity(
          opacity: opacity,
          child: child,
        ),
      ),
    );
  }

  String _localizedRowTitle(HomeRow row, AppLocalizations l10n) {
    final merge = widget.prefs.get(UserPreferences.mergeContinueWatchingNextUp);
    return localizeHomeRowTitle(
      row: row,
      l10n: l10n,
      mergeContinueWatchingAndNextUp: merge,
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = widget.viewModel.rows;
    final prefs = widget.prefs;
    final posterSize = prefs.get(UserPreferences.posterSize);
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final useSeriesThumbs = prefs.get(UserPreferences.seriesThumbnailsEnabled);

    if (widget.viewModel.isLoading && rows.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final includeMediaBar = _isMediaBarIncluded();
    final mediaBarHeight = _mediaBarHeight();
    final carouselPaused =
      widget.isHoverPaused ||
      !_isScrolledToTop ||
      _isActivelyScrolling ||
      _chromeFocusActive;
    final showInfoOverlay = _showHomeRowInfoOverlay();
    final safeTop = MediaQuery.of(context).padding.top;
    final desktopScale = _desktopUiScaleFactor();
    final navbarIsTop = widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final navbarIsLeft = !navbarIsTop;
    final navbarHeight = navbarIsTop && !(PlatformDetection.isTV && includeMediaBar)
        ? (PlatformDetection.isTV
            ? 95.0
            : PlatformDetection.useMobileUi
                ? 60.0
                : 80.0)
        : 0.0;
    final listTopPadding = includeMediaBar || showInfoOverlay
        ? 0.0
        : _isHomeRowsStyleV2()
            ? safeTop + navbarHeight + 8
            : safeTop + 56;
    final tvTopNavbarInset =
        navbarIsTop && PlatformDetection.isTV && !PlatformDetection.useMobileUi
            ? 48.0
            : 0.0;
    final navbarLeftInset = navbarIsTop ? 16.0 + tvTopNavbarInset : 56.0;
    final infoHeaderLeftInset =
      (!PlatformDetection.useMobileUi && navbarIsTop) ? 8.0 : 0.0;
    final rowLeftInset = navbarIsLeft && !PlatformDetection.useMobileUi
        ? 56.0
        : tvTopNavbarInset;
    final infoTopBasePadding =
      (!PlatformDetection.useMobileUi && navbarHeight == 0) ? 14.0 : 8.0;
    final infoTopPadding = safeTop + navbarHeight + infoTopBasePadding;
    final infoAreaHeight = InfoArea.fixedHeight(
      isMobile: PlatformDetection.useMobileUi,
      desktopScale: desktopScale,
    );
    final infoBottomPadding = includeMediaBar ? 20.0 : 8.0;
    // Reserve the info band height up-front so revealing/hiding the InfoArea
    // overlay (a Stack child) does not shift row positions in the ListView.
    final infoPlaceholderHeight = showInfoOverlay
        ? infoTopPadding + infoAreaHeight + infoBottomPadding
        : 0.0;
    final overlayBottom = _isHomeRowsStyleV2()
        ? navbarHeight
        : infoTopPadding + infoAreaHeight;
    final rowExtents = _computeRowExtents(rows, posterSize, prefs);
    final rowTopOffsets = <double>[];
    var currentTop = listTopPadding + infoPlaceholderHeight;
    if (includeMediaBar) {
      currentTop += mediaBarHeight;
    }
    for (final rowExtent in rowExtents) {
      rowTopOffsets.add(currentTop);
      currentTop += rowExtent;
    }

    _rowTopOffsets = rowTopOffsets;
    _overlayBottom = overlayBottom;
    final headerCount = (includeMediaBar ? 1 : 0) + 1;

    // Ensure the last row can be scrolled so its top sits just below the info
    // overlay; otherwise scroll targets clamp to maxScrollExtent and rows drift
    // higher in the viewport as the user navigates downward.
    final viewportHeight = MediaQuery.of(context).size.height;
    final lastRowExtent = rowExtents.isEmpty ? 0.0 : rowExtents.last;
    final neededBottomPadding =
      (viewportHeight -
          (overlayBottom + (_isHomeRowsStyleV2() ? 4.0 : 8.0)) -
          lastRowExtent)
        .clamp(_isHomeRowsStyleV2() ? 24.0 : 32.0, double.infinity);

    _ensureInitialHomeFocus(rows);

    if (!widget.viewModel.isLoading && rows.isEmpty && !includeMediaBar) {
      final l10n = AppLocalizations.of(context);
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.noHomeRowsLoaded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.noHomeRowsHint,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(160),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => widget.viewModel.refresh(preserveExisting: false),
              child: Text(l10n.retryHomeRows),
            ),
          ],
        ),
      );
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _markUserGesture(),
      child: Stack(
        children: [
        Positioned.fill(
          child: Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onKeyEvent: (_, event) => _handleRowsKeyEvent(event),
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(
                top: listTopPadding,
                bottom: neededBottomPadding,
              ),
              itemCount: rows.length + headerCount,
              cacheExtent: 600,
              itemBuilder: (context, index) {
              if (includeMediaBar && index == 0) {
                return AnimatedOpacity(
                  duration: _mediaBarFadeDuration,
                  curve: Curves.easeInOutCubic,
                  opacity: _mediaBarVisible ? 1.0 : 0.0,
                  child: IgnorePointer(
                    ignoring: !_mediaBarVisible,
                    child: MediaBar(
                      viewModel: widget.mediaBarViewModel,
                      prefs: prefs,
                      externallyPaused:
                          carouselPaused ||
                          !_mediaBarVisible ||
                          _activePreviewKey != null,
                      height: mediaBarHeight,
                      onNavigateDown: _moveFocusFromMediaBarToRows,
                      onNavigateUp: _navigateFromMediaBarToNavbar,
                      onNavigateLeft: navbarIsLeft ? _navigateFromMediaBarToNavbar : null,
                      focusNode: _mediaBarFocusNode,
                    ),
                  ),
                );
              }
              final infoIndex = includeMediaBar ? 1 : 0;
              if (index == infoIndex) {
                return SizedBox(height: infoPlaceholderHeight);
              }
              final row = rows[index - headerCount];
              final rowIndex = index - headerCount;
              final l10n = AppLocalizations.of(context);
              late final Widget rowChild;
              if (row.isLoading) {
                rowChild = LibraryRow(
                  title: _localizedRowTitle(row, l10n),
                  children: const [],
                );
                return Padding(
                  padding: EdgeInsets.only(left: rowLeftInset),
                  child: _buildShiftedRow(
                    child: rowChild,
                    rowIndex: rowIndex,
                    rowTopOffsets: rowTopOffsets,
                    rowExtents: rowExtents,
                    showInfoOverlay: showInfoOverlay,
                    overlayBottom: overlayBottom,
                  ),
                );
              } else if (row.rowType == HomeRowType.liveTv) {
                rowChild = _buildLiveTvRow(
                  row,
                  focusColor,
                  cardExpansion,
                  posterSize: posterSize,
                  rowIndex: rowIndex,
                  rows: rows,
                );
              } else if (row.rowType == HomeRowType.libraryTilesSmall) {
                rowChild = _buildLibraryButtonsRow(
                  row,
                  focusColor,
                  cardExpansion,
                  posterSize: posterSize,
                  rowIndex: rowIndex,
                  rows: rows,
                );
              } else {
                rowChild = _buildMediaRow(
                  row: row,
                  rowIndex: rowIndex,
                  rows: rows,
                  prefs: prefs,
                  posterSize: posterSize,
                  watchedBehavior: watchedBehavior,
                  focusColor: focusColor,
                  cardExpansion: cardExpansion,
                  useSeriesThumbs: useSeriesThumbs,
                  l10n: l10n,
                );
              }
              return Padding(
                padding: EdgeInsets.only(left: rowLeftInset),
                child: _buildShiftedRow(
                  child: rowChild,
                  rowIndex: rowIndex,
                  rowTopOffsets: rowTopOffsets,
                  rowExtents: rowExtents,
                  showInfoOverlay: showInfoOverlay,
                  overlayBottom: overlayBottom,
                ),
              );
              },
            ),
          ),
        ),
          if (_infoRevealed && showInfoOverlay)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    navbarLeftInset,
                    infoTopPadding,
                    16,
                    8,
                  ),
                  child: InfoArea(
                    item: widget.selectedItem,
                    headerLeftInset: infoHeaderLeftInset,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLiveTvRow(
    HomeRow row,
    Color focusColor,
    bool cardExpansion, {
    required PosterSize posterSize,
    required int rowIndex,
    required List<HomeRow> rows,
  }) {
    final l10n = AppLocalizations.of(context);
    final metadataScale = PlatformDetection.useDesktopUi
        ? _desktopUiScaleFactor()
        : 1.0;
    final squarePosterSide = _squarePosterSide(posterSize);
    final rowHeight = squarePosterSide + (56 * metadataScale);
    final actions = <_LiveTvAction>[
      _LiveTvAction(Icons.tv_rounded, l10n.guide, Destinations.liveTvGuide),
      _LiveTvAction(Icons.fiber_manual_record_rounded, l10n.recordings,
          Destinations.liveTvRecordings),
      _LiveTvAction(Icons.schedule_rounded, l10n.schedule,
          Destinations.liveTvSchedule),
      _LiveTvAction(Icons.movie_creation, l10n.series,
          Destinations.liveTvSeriesRecordings),
    ];
    return _buildTitledRow(
      key: _rowContainerKey(rowIndex),
      title: _localizedRowTitle(row, l10n),
      rowIndex: rowIndex,
      hasItems: actions.isNotEmpty,
      height: rowHeight,
      child: LockedFocusRow<_LiveTvAction>(
        key: _rowKey(rowIndex),
        items: actions,
        hubKey: _hubKeyForRow(row),
        controller: _rowHorizontalController(rowIndex),
        height: rowHeight,
        itemExtent: squarePosterSide,
        itemSpacing: 12,
        leadingPadding: _isHomeRowsStyleV2() ? _kHomeRowLabelInset : 0,
        padding: const EdgeInsets.fromLTRB(_kHomeRowLabelInset, 5, 20, 5),
        onIndexChanged: (_, _) {
          _onHomeRowTileFocused(null);
        },
        onFocusChange: (has) => _onRowFocusTracked(rowIndex, has),
        onVerticalNavigation: (isUp) => _onRowVerticalNavigation(
          rowIndex: rowIndex,
          rows: rows,
          isUp: isUp,
        ),
        onLeftEdge: _onRowLeftEdge,
        onTap: (_, action) => context.push(action.destination),
        itemBuilder: (ctx, action, idx, isFocused) {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox.square(
              dimension: squarePosterSide,
              child: GridButtonCard(
                icon: action.icon,
                label: action.label,
                width: squarePosterSide,
                height: squarePosterSide,
                focusColor: focusColor,
                cardFocusExpansion: cardExpansion,
                externalIsFocused: isFocused,
                onTap: () => context.push(action.destination),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLibraryButtonsRow(
    HomeRow row,
    Color focusColor,
    bool cardExpansion, {
    required PosterSize posterSize,
    required int rowIndex,
    required List<HomeRow> rows,
  }) {
    final l10n = AppLocalizations.of(context);
    final metadataScale = PlatformDetection.useDesktopUi
        ? _desktopUiScaleFactor()
        : 1.0;
    final squarePosterSide = _squarePosterSide(posterSize);
    final rowHeight = squarePosterSide + (56 * metadataScale);
    return _buildTitledRow(
      key: _rowContainerKey(rowIndex),
      title: _localizedRowTitle(row, l10n),
      rowIndex: rowIndex,
      hasItems: row.items.isNotEmpty,
      height: rowHeight,
      child: LockedFocusRow<AggregatedItem>(
        key: _rowKey(rowIndex),
        items: row.items,
        hubKey: _hubKeyForRow(row),
        controller: _rowHorizontalController(rowIndex),
        height: rowHeight,
        itemExtent: squarePosterSide,
        itemSpacing: 12,
        leadingPadding: _isHomeRowsStyleV2() ? _kHomeRowLabelInset : 0,
        padding: const EdgeInsets.fromLTRB(_kHomeRowLabelInset, 5, 20, 5),
        onIndexChanged: (_, item) {
          _onHomeRowTileFocused(item);
        },
        onFocusChange: (has) => _onRowFocusTracked(rowIndex, has),
        onVerticalNavigation: (isUp) => _onRowVerticalNavigation(
          rowIndex: rowIndex,
          rows: rows,
          isUp: isUp,
        ),
        onLeftEdge: _onRowLeftEdge,
        onTap: (_, item) => _navigateToLibrary(context, item),
        itemBuilder: (ctx, item, idx, isFocused) {
          final collectionType =
              (item.rawData['CollectionType'] as String? ?? '').toLowerCase();
          final icon = _iconForCollectionType(collectionType);
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox.square(
              dimension: squarePosterSide,
              child: GridButtonCard(
                icon: icon,
                label: item.name,
                width: squarePosterSide,
                height: squarePosterSide,
                focusColor: focusColor,
                cardFocusExpansion: cardExpansion,
                externalIsFocused: isFocused,
                onTap: () => _navigateToLibrary(context, item),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMediaRow({
    required HomeRow row,
    required int rowIndex,
    required List<HomeRow> rows,
    required UserPreferences prefs,
    required PosterSize posterSize,
    required WatchedIndicatorBehavior watchedBehavior,
    required Color focusColor,
    required bool cardExpansion,
    required bool useSeriesThumbs,
    required AppLocalizations l10n,
  }) {
    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;
    final isRowsV2 = prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
    final rowImageType =
        isRowsV2 ? ImageType.poster : _homeRowImageTypeForRow(row, prefs);
    final desktopScale = _desktopUiScaleFactor();
    final metadataScale = PlatformDetection.useDesktopUi ? desktopScale : 1.0;
    final platformScale = PlatformDetection.isTV ? 0.8 : desktopScale;
    final v2ImageHeight = posterSize.portraitHeight.toDouble() * platformScale * 2;
    final v2MetadataHeightBudget = _v2MetadataHeightBudget(prefs);
    const v2PortraitAspect = 2 / 3;
    const v2FocusedAspect = 16 / 9;
    final v2PortraitWidth = v2ImageHeight * v2PortraitAspect;
    final v2FocusedWidth = v2ImageHeight * v2FocusedAspect;
    final navbarIsTopV2 =
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final rowLeftInsetV2 =
        (!navbarIsTopV2 && !PlatformDetection.useMobileUi) ? 56.0 : 0.0;
    final v2ExtendedWidth = isRowsV2
      ? (MediaQuery.of(context).size.width -
          rowLeftInsetV2 -
          16.0 -
          MediaQuery.paddingOf(context).right -
          16.0)
        .clamp(v2PortraitWidth, double.infinity)
        .toDouble()
      : v2PortraitWidth;

    double maxCardHeight = 0;
    double firstCardWidth = 0;
    if (isRowsV2) {
      maxCardHeight = v2ImageHeight + (v2MetadataHeightBudget * metadataScale);
      firstCardWidth = v2PortraitWidth;
    } else {
      for (final item in row.items) {
        final ar = _aspectRatioForRowItem(item, row, rowImageType);
        final height = (ar > 1
                ? posterSize.landscapeHeight.toDouble()
                : posterSize.portraitHeight.toDouble()) *
            platformScale;
        final cardHeight = height + (46 * metadataScale);
        if (cardHeight > maxCardHeight) maxCardHeight = cardHeight;
        if (firstCardWidth == 0) firstCardWidth = height * ar;
      }
    }

    if (firstCardWidth == 0) {
      firstCardWidth =
          posterSize.portraitHeight.toDouble() * platformScale * (2 / 3);
    }
    if (maxCardHeight == 0) {
      maxCardHeight =
          posterSize.portraitHeight.toDouble() * platformScale + (46 * metadataScale);
    }

    return _buildTitledRow(
      key: _rowContainerKey(rowIndex),
      title: _localizedRowTitle(row, l10n),
      rowIndex: rowIndex,
      hasItems: row.items.isNotEmpty,
      height: maxCardHeight + (10 * metadataScale),
      child: LockedFocusRow<AggregatedItem>(
        key: _rowKey(rowIndex),
        items: row.items,
        hubKey: _hubKeyForRow(row),
        controller: _rowHorizontalController(rowIndex),
        height: maxCardHeight + (10 * metadataScale),
        itemExtent: firstCardWidth,
        itemSpacing: 12,
        leadingPadding: isRowsV2 ? _kHomeRowLabelInset : 0,
        clipBehavior: isRowsV2 ? Clip.none : Clip.hardEdge,
        padding: const EdgeInsets.fromLTRB(_kHomeRowLabelInset, 5, 20, 5),
        onFocusChange: (has) => _onRowFocusTracked(rowIndex, has),
        onVerticalNavigation: (isUp) => _onRowVerticalNavigation(
          rowIndex: rowIndex,
          rows: rows,
          isUp: isUp,
        ),
        onLeftEdge: _onRowLeftEdge,
        onIndexChanged: (_, item) {
          final forceReveal = _forceRevealOnNextRowFocusFromMediaBar;
          _forceRevealOnNextRowFocusFromMediaBar = false;
          widget.onItemSelected(item);
          if (isRowsV2) {
            _primeV2FocusedRatings(item);
          }
          unawaited(_revealAndScrollToPinnedInfo(ignoreScrollCooldown: forceReveal));
          if (_suppressNextRowPreviewFromMediaBar) {
            _suppressNextRowPreviewFromMediaBar = false;
            _finishSharedPreview();
            return;
          }
          final canPreview = _supportsEpisodePreview(item);
          if (!PlatformDetection.useMobileUi && canPreview) {
            _schedulePreview(item, delay: _previewStartDelay);
          } else {
            _finishSharedPreview();
          }
        },
        onLongPress: (_, item) => showContextMenu(
          context,
          item,
          onChanged: () => setState(() {}),
        ),
        onTap: (_, item) {
          _finishSharedPreview(releaseResources: true);
          if (row.rowType == HomeRowType.libraryTiles) {
            _navigateToLibrary(context, item);
          } else if (row.rowType == HomeRowType.genres) {
            context.push(Destinations.genre(item.name, genreId: item.id));
          } else {
            context.push(Destinations.itemOrPhoto(
              item.id,
              serverId: item.serverId,
              type: item.type,
            ));
          }
        },
        itemBuilder: (ctx, item, idx, isFocused) {
          final requestScale = MediaQuery.devicePixelRatioOf(
            context,
          ).clamp(1.0, 2.0);
          final imageApi = widget.viewModel.imageApiForServer(item.serverId);
          late final double ar;
          late final double width;
          late final String? imageUrl;
          final previewKey = _previewKeyFor(item);
          final isV2MobileTouch = isRowsV2 && PlatformDetection.useMobileUi;
          final isV2MouseHover =
              isRowsV2 && !PlatformDetection.useMobileUi;
          final isTouchFocused =
              isV2MobileTouch && _mobilePressedV2Key == previewKey;
          final isHoverFocused =
              isV2MouseHover && _mouseHoveredV2Key == previewKey;
          final effectiveV2Focused = isRowsV2
              ? (isV2MobileTouch
                    ? isTouchFocused
                    : (isFocused || isHoverFocused))
              : isFocused;
          final v2FocusedWidthForCurrentViewport =
              isRowsV2 && PlatformDetection.useMobileUi
                  ? v2FocusedWidth
                      .clamp(v2PortraitWidth, v2ExtendedWidth)
                      .toDouble()
                  : v2FocusedWidth;
          final canUseExpandedV2Card =
              isRowsV2 && effectiveV2Focused;

          if (isRowsV2) {
            ar = canUseExpandedV2Card ? v2FocusedAspect : v2PortraitAspect;
            width = canUseExpandedV2Card
              ? v2FocusedWidthForCurrentViewport
              : v2PortraitWidth;
            final posterUrl = _cachedRowImageUrl(
              item,
              imageApi,
              v2ImageHeight,
              ImageType.poster,
              item.type == 'Episode' ? true : useSeriesThumbs,
              requestScale,
              isMyMediaRow: row.rowType == HomeRowType.libraryTiles,
            );
            imageUrl = canUseExpandedV2Card
                ? (_resolveV2FocusedImageUrl(
                      item,
                      imageApi,
                      v2ImageHeight,
                      useSeriesThumbs,
                      requestScale,
                    ) ??
                    posterUrl)
                : posterUrl;
          } else {
            final itemAr = _aspectRatioForRowItem(item, row, rowImageType);
            final itemHeight = (itemAr > 1
                    ? posterSize.landscapeHeight.toDouble()
                    : posterSize.portraitHeight.toDouble()) *
                platformScale;
            ar = itemAr;
            width = itemHeight * itemAr;
            imageUrl = _cachedRowImageUrl(
              item,
              imageApi,
              itemHeight,
              rowImageType,
              useSeriesThumbs,
              requestScale,
              isMyMediaRow: row.rowType == HomeRowType.libraryTiles,
            );
          }

          final canPreview = _supportsEpisodePreview(item);

          final showPreviewVideo =
              _activePreviewKey == previewKey && _previewReady;

          void navigateToItem() {
            if (row.rowType == HomeRowType.libraryTiles) {
              _navigateToLibrary(context, item);
            } else if (row.rowType == HomeRowType.genres) {
              context.push(Destinations.genre(item.name, genreId: item.id));
            } else {
              context.push(Destinations.itemOrPhoto(
                item.id,
                serverId: item.serverId,
                type: item.type,
              ));
            }
          }

          final String cardTitle;
          final String? cardSubtitle;
          final Widget? cardSubtitleWidget;

          if (isRowsV2 && item.type == 'Episode') {
            final s = item.parentIndexNumber;
            final e = item.indexNumber;
            final episodeInfo = switch ((s, e)) {
              (final season?, final episode?) => 'S$season:E$episode',
              _ => null,
            };
            cardTitle = item.seriesName ?? item.name;
            if (effectiveV2Focused) {
              cardSubtitle = null;
              final row2Text = episodeInfo != null ? '$episodeInfo - ${item.name}' : item.name;
              final row3Text = _v2MetadataLine(item);
              final baseTextStyle = Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
              final subtitleColor = Theme.of(context).colorScheme.onSurface.withAlpha(153);
              final subtitleStyle = baseTextStyle.copyWith(color: subtitleColor);
              cardSubtitleWidget = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    row2Text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subtitleStyle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    row3Text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subtitleStyle,
                  ),
                ],
              );
            } else {
              cardSubtitle = episodeInfo ?? item.name;
              cardSubtitleWidget = null;
            }
          } else {
            cardTitle = item.name;
            cardSubtitle = isRowsV2 && effectiveV2Focused ? _v2MetadataLine(item) : item.subtitle;
            cardSubtitleWidget = null;
          }

          final card = MediaCard(
            title: cardTitle,
            subtitle: cardSubtitle,
            subtitleWidget: cardSubtitleWidget,
            imageUrl: imageUrl,
            width: width,
            aspectRatio: ar,
            isFavorite: item.isFavorite,
            isPlayed: item.isPlayed,
            unplayedCount: item.unplayedItemCount,
            playedPercentage: item.playedPercentage,
            watchedBehavior: watchedBehavior,
            itemType: item.type,
            focusColor: focusColor,
            cardFocusExpansion: isRowsV2 ? false : cardExpansion && !showPreviewVideo,
            externalIsFocused: effectiveV2Focused,
            suppressImageFocusBorder: showPreviewVideo,
            suppressFocusGlow: suppressFocusGlow,
            onHoverStart: () {
              unawaited(_revealAndScrollToPinnedInfo());
              widget.onItemSelected(item);
              if (isRowsV2) {
                if (_mouseHoveredV2Key != previewKey) {
                  setState(() => _mouseHoveredV2Key = previewKey);
                }
                _primeV2FocusedRatings(item);
              }
              if (!PlatformDetection.useMobileUi && canPreview) {
                _schedulePreview(item, delay: _previewStartDelay);
              } else {
                _finishSharedPreview();
              }
            },
            onHoverEnd: () {
              if (isRowsV2) {
                if (_mouseHoveredV2Key == previewKey) {
                  setState(() => _mouseHoveredV2Key = null);
                }
                _finishSharedPreview();
              } else {
                _stopPreviewFor(item);
              }
            },
            onLongPress: () => showContextMenu(
              context,
              item,
              onChanged: () => setState(() {}),
            ),
            onTap: () {
              if (isV2MobileTouch) {
                if (_mobilePressedV2Key == previewKey) {
                  setState(() => _mobilePressedV2Key = null);
                  _finishSharedPreview(releaseResources: true);
                  navigateToItem();
                } else {
                  setState(() {
                    _mobilePressedV2Key = previewKey;
                    _mouseHoveredV2Key = null;
                  });
                  widget.onItemSelected(item);
                  _primeV2FocusedRatings(item);
                }
                return;
              }

              if (isRowsV2 &&
                  (_mobilePressedV2Key != null || _mouseHoveredV2Key != null)) {
                setState(() {
                  _mobilePressedV2Key = null;
                  _mouseHoveredV2Key = null;
                });
              }
              _finishSharedPreview(releaseResources: true);
              navigateToItem();
            },
          );

          final previewWrappedCard = !canPreview
              ? card
              : _PreviewCardShell(
                  card: card,
                  width: width,
                  aspectRatio: ar,
                  showVideo: showPreviewVideo,
                  useMedia3: showPreviewVideo && _previewUsingMedia3,
                  controller: _previewController,
                  isFocused: isFocused,
                  focusColor: focusColor,
                );

          if (isRowsV2) {
            final showExtendedSection = effectiveV2Focused;
            final extendedSection = showExtendedSection
                ? _buildV2ExtendedSection(
                    ctx,
                    item,
                    previewKey,
                    cardWidth: width,
                    extendedWidth: v2ExtendedWidth,
                  )
                : null;
            return AnimatedSize(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOutCubic,
              alignment: Alignment.topLeft,
              clipBehavior: Clip.none,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  previewWrappedCard,
                  if (extendedSection != null) ...[const SizedBox(height: 4), extendedSection],
                ],
              ),
            );
          }

          return previewWrappedCard;
        },
      ),
    );
  }

  Widget _buildV2ExtendedSection(
    BuildContext context,
    AggregatedItem item,
    String itemKey,
    {
    required double cardWidth,
    required double extendedWidth,
  }
  ) {
    final additionalRatings = _v2AdditionalRatingsByKey[itemKey] ?? {};
    final hasAnyRating = item.communityRating != null ||
        item.criticRating != null ||
        additionalRatings.isNotEmpty;
    final overview = item.overview ?? '';
    if (!hasAnyRating && overview.isEmpty) {
      return SizedBox(width: cardWidth);
    }

    final baseStyle =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
    final overviewStyle = baseStyle.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withAlpha(140),
      height: 1.4,
    );

    return SizedBox(
      width: cardWidth,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            width: extendedWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasAnyRating)
                  RatingsRow(
                    ratings: additionalRatings,
                    communityRating: item.communityRating,
                    criticRating: item.criticRating,
                    enableAdditionalRatings:
                        widget.prefs.get(UserPreferences.enableAdditionalRatings),
                    enabledRatings: widget.prefs.get(UserPreferences.enabledRatings),
                    showLabels: widget.prefs.get(UserPreferences.showRatingLabels),
                    showBadges: widget.prefs.get(UserPreferences.showRatingBadges),
                  ),
                if (overview.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: overviewStyle,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _v2MetadataLine(AggregatedItem item) {
    final parts = <String>[];
    final year = item.productionYear;
    if (year != null) {
      parts.add('$year');
    }
    final genreLabel = item.genres.take(2).join(' • ');
    if (genreLabel.isNotEmpty) {
      parts.add(genreLabel);
    }

    final runtimeLabel = _formatRuntime(item.runtime);
    if (runtimeLabel.isNotEmpty) {
      parts.add(runtimeLabel);
    }

    return parts.join(' • ');
  }

  static String _formatRuntime(Duration? runtime) {
    if (runtime == null || runtime <= Duration.zero) {
      return '';
    }

    final totalMinutes = runtime.inMinutes;
    if (totalMinutes <= 0) {
      return '';
    }

    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    if (hours <= 0) {
      return '${minutes}m';
    }
    if (minutes == 0) {
      return '${hours}h';
    }
    return '${hours}h ${minutes}m';
  }

  Widget _buildTitledRow({
    Key? key,
    required String title,
    required int rowIndex,
    required bool hasItems,
    required double height,
    required Widget child,
  }) {
    final isRowsV2 = _isHomeRowsStyleV2();
    final showHeaderControls =
      hasItems &&
      PlatformDetection.useDesktopUi &&
      !PlatformDetection.isTV;
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            _kHomeRowLabelInset,
              isRowsV2 ? 6 : 16,
            8,
              isRowsV2 ? 1 : 8,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              if (showHeaderControls) ...[
                Focus(
                  canRequestFocus: false,
                  skipTraversal: true,
                  descendantsAreFocusable: false,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => _scrollHomeRowHorizontal(rowIndex, -480),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Focus(
                  canRequestFocus: false,
                  skipTraversal: true,
                  descendantsAreFocusable: false,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () => _scrollHomeRowHorizontal(rowIndex, 480),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ],
          ),
        ),
        child,
      ],
    );
  }

  static IconData _iconForCollectionType(String collectionType) {
    return switch (collectionType) {
      'movies' => Icons.movie,
      'tvshows' => Icons.tv,
      'music' => Icons.music_note,
      'books' => Icons.book,
      'photos' => Icons.photo,
      'homevideos' => Icons.videocam,
      'livetv' => Icons.live_tv,
      'playlists' => Icons.playlist_play,
      'boxsets' => Icons.collections_bookmark,
      _ => Icons.folder_rounded,
    };
  }

  static void _navigateToLibrary(BuildContext context, AggregatedItem item) {
    final collectionType = (item.rawData['CollectionType'] as String? ?? '').toLowerCase();
    switch (collectionType) {
      case 'music':
        context.push(Destinations.musicLibrary(item.id));
        return;
      case 'books':
        context.push(Destinations.library(item.id, bookUi: true));
        return;
      case 'livetv':
        context.push(Destinations.liveTvGuide);
        return;
      default:
        context.push(Destinations.library(item.id));
        return;
    }
  }

  static String? _resolveImageUrl(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    bool useSeriesThumbs,
    double requestScale,
  ) {
    final maxH = (height * requestScale).toInt();
    if (useSeriesThumbs && item.type == 'Episode') {
      final sId = item.seriesId ?? item.parentPrimaryImageItemId;
      final sTag = item.seriesPrimaryImageTag ?? item.parentPrimaryImageTag;
      if (sId != null) {
        return imageApi.getPrimaryImageUrl(
          sId,
          maxHeight: maxH,
          tag: sTag,
        );
      }
    }
    return _resolvePrimaryImageUrl(item, imageApi, maxHeight: maxH);
  }

  static String? _resolvePrimaryImageUrl(
    AggregatedItem item,
    ImageApi imageApi, {
    int? maxHeight,
    int? maxWidth,
  }) {
    String? primary(String? id, String? tag) {
      if (id == null || tag == null) return null;
      return imageApi.getPrimaryImageUrl(
        id,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        tag: tag,
      );
    }

    return primary(item.id, item.primaryImageTag) ??
        primary(item.primaryImageItemId, item.primaryImageTagField) ??
        primary(item.parentPrimaryImageItemId, item.parentPrimaryImageTag);
  }

  static String? _resolveLandscapeImageUrl(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    double requestScale,
  ) {
    final maxW = (height * 16 / 9 * requestScale).toInt();
    if (item.backdropImageTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        item.id,
        maxWidth: maxW,
        tag: item.backdropImageTags.first,
      );
    }
    final parentId = item.parentBackdropItemId;
    final parentTags = item.parentBackdropImageTags;
    if (parentId != null && parentTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        parentId,
        maxWidth: maxW,
        tag: parentTags.first,
      );
    }
    return _resolvePrimaryImageUrl(item, imageApi, maxWidth: maxW);
  }

  static String? _resolveV2FocusedImageUrl(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    bool useSeriesThumbs,
    double requestScale,
  ) {
    final maxW = (height * 16 / 9 * requestScale).toInt();
    final maxH = (height * requestScale).toInt();
    if (!useSeriesThumbs) {
      if (item.type == 'Episode') {
        final episodePrimary = _resolvePrimaryImageUrl(
          item,
          imageApi,
          maxHeight: maxH,
          maxWidth: maxW,
        );
        if (episodePrimary != null) {
          return episodePrimary;
        }
      } else if (item.type == 'Series') {
        final latestEpId = item.rawData['LatestEpisodeId'] as String?;
        final latestEpTag = item.rawData['LatestEpisodePrimaryImageTag'] as String?;
        if (latestEpId != null) {
          return imageApi.getPrimaryImageUrl(
            latestEpId,
            maxHeight: maxH,
            maxWidth: maxW,
            tag: latestEpTag,
          );
        }
      }
    }
    final itemThumbTag = _tagForType(item, 'Thumb');
    if (itemThumbTag != null) {
      return imageApi.getThumbImageUrl(item.id, maxWidth: maxW, tag: itemThumbTag);
    }

    final parentThumbItemId = item.rawData['ParentThumbItemId'] as String?;
    final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;
    if (parentThumbItemId != null && parentThumbTag != null) {
      return imageApi.getThumbImageUrl(
        parentThumbItemId,
        maxWidth: maxW,
        tag: parentThumbTag,
      );
    }

    if (item.backdropImageTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        item.id,
        maxWidth: maxW,
        tag: item.backdropImageTags.first,
      );
    }

    final parentBackdropItemId = item.parentBackdropItemId;
    final parentBackdropTags = item.parentBackdropImageTags;
    if (parentBackdropItemId != null && parentBackdropTags.isNotEmpty) {
      return imageApi.getBackdropImageUrl(
        parentBackdropItemId,
        maxWidth: maxW,
        tag: parentBackdropTags.first,
      );
    }

    return _resolvePrimaryImageUrl(
      item,
      imageApi,
      maxHeight: maxH,
      maxWidth: maxW,
    );
  }

  static ImageType _homeRowImageTypeForRow(HomeRow row, UserPreferences prefs) {
    if (row.rowType == HomeRowType.latestMedia && _isLatestMusicRow(row)) {
      return ImageType.poster;
    }

    if (prefs.get(UserPreferences.homeRowsUniversalOverride)) {
      return prefs.get(UserPreferences.homeRowsUniversalImageType);
    }

    final sectionType = _sectionTypeForRow(row);
    if (sectionType == null) {
      return ImageType.poster;
    }
    return prefs.get(UserPreferences.homeRowImageType(sectionType));
  }

  static HomeSectionType? _sectionTypeForRow(HomeRow row) {
    return switch (row.rowType) {
      HomeRowType.resume => HomeSectionType.resume,
      HomeRowType.nextUp => HomeSectionType.nextUp,
      HomeRowType.latestMedia => HomeSectionType.latestMedia,
      HomeRowType.favorites => switch (row.id) {
        'favorites_movies' => HomeSectionType.favoriteMovies,
        'favorites_series' => HomeSectionType.favoriteSeries,
        'favorites_episodes' => HomeSectionType.favoriteEpisodes,
        'favorites_people' => HomeSectionType.favoritePeople,
        'favorites_artists' => HomeSectionType.favoriteArtists,
        'favorites_musicvideos' => HomeSectionType.favoriteMusicVideos,
        'favorites_albums' => HomeSectionType.favoriteAlbums,
        'favorites_songs' => HomeSectionType.favoriteSongs,
        _ => HomeSectionType.latestMedia,
      },
      HomeRowType.collections => HomeSectionType.collections,
      HomeRowType.genres => HomeSectionType.genres,
      HomeRowType.libraryTiles => HomeSectionType.libraryTilesSmall,
      HomeRowType.playlists => HomeSectionType.playlists,
      HomeRowType.liveTv => HomeSectionType.liveTv,
      HomeRowType.activeRecordings => HomeSectionType.activeRecordings,
      _ => null,
    };
  }

  static bool _isLatestMusicRow(HomeRow row) {
    if (row.rowType != HomeRowType.latestMedia || row.items.isEmpty) return false;
    return row.items.every((item) =>
        item.type == 'Audio' || item.type == 'MusicAlbum' || item.type == 'MusicArtist');
  }

  static double _aspectRatioForRowItem(
    AggregatedItem item,
    HomeRow row,
    ImageType imageType,
  ) {
    double thumbAspectRatio() {
      return switch (item.type) {
        'MusicAlbum' || 'MusicArtist' || 'Audio' || 'Playlist' || 'Person' => 1,
        _ => 16 / 9,
      };
    }

    return switch (imageType) {
      ImageType.thumb || ImageType.banner => thumbAspectRatio(),
      ImageType.poster => MediaCard.aspectRatioForType(item.type),
    };
  }

  static String? _resolveRowImageUrl(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    ImageType imageType,
    bool useSeriesThumbs,
    double requestScale,
    {bool isMyMediaRow = false}
  ) {
    final itemThumbTag = _tagForType(item, 'Thumb');
    final itemBannerTag = _tagForType(item, 'Banner');
    final parentThumbItemId = item.rawData['ParentThumbItemId'] as String?;
    final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;

    if (useSeriesThumbs && item.type == 'Episode') {
      final seriesImage = _resolveSeriesImageForRowType(
        item,
        imageApi,
        height,
        imageType,
        requestScale,
      );
      if (seriesImage != null) {
        return seriesImage;
      }
    }

    if (imageType == ImageType.banner) {
      final maxW = (height * 16 / 9 * requestScale).toInt();
      if (isMyMediaRow) {
        final myMediaPrimary = _resolvePrimaryImageUrl(item, imageApi, maxWidth: maxW);
        if (myMediaPrimary != null) {
          return myMediaPrimary;
        }
      }
      if (itemBannerTag != null) {
        return imageApi.getBannerImageUrl(item.id, maxWidth: maxW, tag: itemBannerTag);
      }
      if (itemThumbTag != null) {
        return imageApi.getThumbImageUrl(item.id, maxWidth: maxW, tag: itemThumbTag);
      }
      if (item.backdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(item.id, maxWidth: maxW, tag: item.backdropImageTags.first);
      }
      return _resolveImageUrl(item, imageApi, height, useSeriesThumbs, requestScale);
    }

    if (imageType == ImageType.thumb) {
      final maxW = (height * 16 / 9 * requestScale).toInt();
      final maxH = (height * requestScale).toInt();
      if (!useSeriesThumbs) {
        if (item.type == 'Episode') {
          final episodePrimary = _resolvePrimaryImageUrl(
            item,
            imageApi,
            maxHeight: maxH,
            maxWidth: maxW,
          );
          if (episodePrimary != null) {
            return episodePrimary;
          }
        } else if (item.type == 'Series') {
          final latestEpId = item.rawData['LatestEpisodeId'] as String?;
          final latestEpTag = item.rawData['LatestEpisodePrimaryImageTag'] as String?;
          if (latestEpId != null) {
            return imageApi.getPrimaryImageUrl(
              latestEpId,
              maxHeight: maxH,
              maxWidth: maxW,
              tag: latestEpTag,
            );
          }
        }
      }
      if (itemThumbTag != null) {
        return imageApi.getThumbImageUrl(item.id, maxWidth: maxW, tag: itemThumbTag);
      }
      if (item.backdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(item.id, maxWidth: maxW, tag: item.backdropImageTags.first);
      }
      if (useSeriesThumbs || item.type != 'Episode') {
        if (parentThumbItemId != null && parentThumbTag != null) {
          return imageApi.getThumbImageUrl(parentThumbItemId, maxWidth: maxW, tag: parentThumbTag);
        }
        if (item.parentBackdropItemId != null && item.parentBackdropImageTags.isNotEmpty) {
          return imageApi.getBackdropImageUrl(
            item.parentBackdropItemId!,
            maxWidth: maxW,
            tag: item.parentBackdropImageTags.first,
          );
        }
      }
      return _resolveLandscapeImageUrl(item, imageApi, height, requestScale);
    }

    return _resolveImageUrl(item, imageApi, height, useSeriesThumbs, requestScale);
  }

  static String? _resolveSeriesImageForRowType(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    ImageType imageType,
    double requestScale,
  ) {
    final maxW = (height * 16 / 9 * requestScale).toInt();
    final maxH = (height * requestScale).toInt();
    final seriesId = item.seriesId;
    final seriesPrimaryTag = item.seriesPrimaryImageTag;
    final parentThumbItemId = item.rawData['ParentThumbItemId'] as String?;
    final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;
    final parentBackdropItemId = item.parentBackdropItemId;
    final parentBackdropTags = item.parentBackdropImageTags;

    if (imageType == ImageType.poster) {
      final sId = seriesId ?? item.parentPrimaryImageItemId;
      final sTag = seriesPrimaryTag ?? item.parentPrimaryImageTag;
      if (sId != null) {
        return imageApi.getPrimaryImageUrl(
          sId,
          maxHeight: maxH,
          tag: sTag,
        );
      }
      return null;
    }

    if (imageType == ImageType.thumb) {
      if (parentThumbItemId != null && parentThumbTag != null) {
        return imageApi.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: maxW,
          tag: parentThumbTag,
        );
      }
      if (parentBackdropItemId != null && parentBackdropTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          parentBackdropItemId,
          maxWidth: maxW,
          tag: parentBackdropTags.first,
        );
      }
      if (seriesId != null && seriesPrimaryTag != null) {
        return imageApi.getPrimaryImageUrl(
          seriesId,
          maxWidth: maxW,
          tag: seriesPrimaryTag,
        );
      }
      return null;
    }

    if (imageType == ImageType.banner) {
      final seriesBannerTag = (item.rawData['SeriesImageTags'] as Map?)?['Banner'] as String?;
      if (seriesId != null && seriesBannerTag != null) {
        return imageApi.getBannerImageUrl(
          seriesId,
          maxWidth: maxW,
          tag: seriesBannerTag,
        );
      }
      if (parentThumbItemId != null && parentThumbTag != null) {
        return imageApi.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: maxW,
          tag: parentThumbTag,
        );
      }
      if (parentBackdropItemId != null && parentBackdropTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          parentBackdropItemId,
          maxWidth: maxW,
          tag: parentBackdropTags.first,
        );
      }
      if (seriesId != null && seriesPrimaryTag != null) {
        return imageApi.getPrimaryImageUrl(
          seriesId,
          maxWidth: maxW,
          tag: seriesPrimaryTag,
        );
      }
      return null;
    }

    return null;
  }

  static String? _tagForType(AggregatedItem item, String imageType) {
    final tags = item.rawData['ImageTags'];
    if (tags is! Map) return null;
    return tags[imageType] as String?;
  }
}

class _LiveTvAction {
  final IconData icon;
  final String label;
  final String destination;

  const _LiveTvAction(this.icon, this.label, this.destination);
}

class _PreviewCardShell extends StatelessWidget {
  final Widget card;
  final double width;
  final double aspectRatio;
  final bool showVideo;
  final bool useMedia3;
  final VideoController? controller;
  final bool isFocused;
  final Color focusColor;

  const _PreviewCardShell({
    required this.card,
    required this.width,
    required this.aspectRatio,
    required this.showVideo,
    required this.useMedia3,
    required this.controller,
    required this.isFocused,
    required this.focusColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!showVideo) {
      return card;
    }

    final Widget? previewSurface;
    if (useMedia3) {
      previewSurface = const Media3VideoView(fill: Colors.black);
    } else if (controller != null) {
      previewSurface = Video(
        controller: controller!,
        controls: NoVideoControls,
        fit: BoxFit.cover,
        pauseUponEnteringBackgroundMode: false,
        fill: Colors.black,
      );
    } else {
      previewSurface = null;
    }

    if (previewSurface == null) {
      return card;
    }

    return SizedBox(
      width: width,
      child: Stack(
        children: [
          card,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SizedBox(
              height: width / aspectRatio,
              child: IgnorePointer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ColoredBox(
                    color: AppColorScheme.background,
                    child: previewSurface,
                  ),
                ),
              ),
            ),
          ),
          if (isFocused)
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: IgnorePointer(
                child: Container(
                  height: width / aspectRatio,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: focusColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


