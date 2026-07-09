import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/foundation.dart' show kIsWeb, listEquals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/util/language_matching.dart';
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
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/background_service.dart';
import '../../widgets/rating_display.dart';
import '../../../data/services/theme_music_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/appletv_preview_player.dart';
import '../../../playback/inline_preview_engine.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/exit_confirmation_dialog.dart';
import '../../widgets/overlay_sheet.dart';
import '../../../util/app_exit.dart';
import '../../../util/global_shortcut_focus.dart';
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
import '../../widgets/mediabar/banner_media_bar.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/responsive_layout.dart';
import '../../widgets/seasonal_effects.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/top_toolbar.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../util/home_row_title_localizer.dart';
import '../../../util/game_library.dart';
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
  final _pluginSyncService = GetIt.instance<PluginSyncService>();
  late final HomeViewModel _viewModel;

  final ValueNotifier<AggregatedItem?> _selectedItemNotifier = ValueNotifier(null);
  final ValueNotifier<String?> _backdropUrlNotifier = ValueNotifier(null);
  Timer? _selectionDebounce;
  Timer? _backdropDebounce;
  Timer? _hoverPauseTimer;
  StreamSubscription<String?>? _backgroundSub;
  final ValueNotifier<bool> _isHoverPausedNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _isScrolledToTopNotifier = ValueNotifier(true);
  String _lastSectionsJson = '';
  bool _lastMultiServer = false;
  bool _lastMergeContinueWatchingNextUp = false;
  String _lastHiddenCW = '{}';
  String _lastHiddenNU = '{}';
  String _lastBlockedParentalRatings = '';
  bool _lastSeerrAvailable = false;
  bool _themeMusicRegistered = false;
  String? _lastObservedPath;
  ModalRoute<dynamic>? _observedRoute;

  bool _lastEnableRadarrCalendar = false;
  bool _lastEnableSonarrCalendar = false;
  bool _lastMergeRadarrSonarrCalendars = false;
  bool _lastRadarrCalendarShowCinema = true;
  bool _lastRadarrCalendarShowDigital = true;
  bool _lastRadarrCalendarShowPhysical = true;
  bool _lastRadarrCalendarShowDate = true;
  bool _lastSonarrCalendarShowEpisodeInfo = true;
  bool _lastSonarrCalendarShowDate = true;

  static const _selectionDelay = Duration(milliseconds: 150);
  static const _backdropDelay = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _viewModel = GetIt.instance<HomeViewModel>();
    WidgetsBinding.instance.addObserver(this);
    appRouter.routerDelegate.addListener(_onRouteChanged);
    _lastObservedPath = appRouter.routerDelegate.currentConfiguration.uri.path;
    homeRefreshBus.addListener(_onHomeRefreshRequested);
    if (homeRefreshBus.consumePending()) {
      _viewModel.refresh(preserveExisting: true);
    }
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) _backdropUrlNotifier.value = url;
    });
    _backdropUrlNotifier.value = _backgroundService.currentUrl;

    _lastSectionsJson = _userPrefs.get(UserPreferences.homeSectionsJson);
    _lastMultiServer = _userPrefs.get(
      UserPreferences.enableMultiServerLibraries,
    );
    _lastMergeContinueWatchingNextUp = _userPrefs.get(
      UserPreferences.mergeContinueWatchingNextUp,
    );
    _lastHiddenCW = _userPrefs.get(UserPreferences.hiddenContinueWatchingItems);
    _lastHiddenNU = _userPrefs.get(UserPreferences.hiddenNextUpSeries);
    _lastBlockedParentalRatings = _userPrefs.get(
      UserPreferences.blockedParentalRatings,
    );
    _lastSeerrAvailable = _pluginSyncService.seerrAvailable;
    _lastEnableRadarrCalendar = _userPrefs.get(UserPreferences.enableRadarrCalendar);
    _lastEnableSonarrCalendar = _userPrefs.get(UserPreferences.enableSonarrCalendar);
    _lastMergeRadarrSonarrCalendars = _userPrefs.get(UserPreferences.mergeRadarrSonarrCalendars);
    _lastRadarrCalendarShowCinema = _userPrefs.get(UserPreferences.radarrCalendarShowCinema);
    _lastRadarrCalendarShowDigital = _userPrefs.get(UserPreferences.radarrCalendarShowDigital);
    _lastRadarrCalendarShowPhysical = _userPrefs.get(UserPreferences.radarrCalendarShowPhysical);
    _lastRadarrCalendarShowDate = _userPrefs.get(UserPreferences.radarrCalendarShowDate);
    _lastSonarrCalendarShowEpisodeInfo = _userPrefs.get(UserPreferences.sonarrCalendarShowEpisodeInfo);
    _lastSonarrCalendarShowDate = _userPrefs.get(UserPreferences.sonarrCalendarShowDate);

    _pluginSyncService.addListener(_onPluginSyncChanged);
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
    _selectedItemNotifier.dispose();
    _backdropUrlNotifier.dispose();
    _isHoverPausedNotifier.dispose();
    _isScrolledToTopNotifier.dispose();
    _pluginSyncService.removeListener(_onPluginSyncChanged);
    _userPrefs.removeListener(_onPrefsChanged);
    if (_themeMusicRegistered) {
      _themeMusicService.unregisterDetailScreen(this);
      _themeMusicRegistered = false;
    }
    super.dispose();
  }


  void _onPluginSyncChanged() {
    if (!mounted) return;
    final seerrAvailable = _pluginSyncService.seerrAvailable;
    if (seerrAvailable == _lastSeerrAvailable) return;
    _lastSeerrAvailable = seerrAvailable;
    _viewModel.refresh(preserveExisting: true);
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
    final currentMultiServer = _userPrefs.get(
      UserPreferences.enableMultiServerLibraries,
    );
    final currentMergeContinueWatchingNextUp = _userPrefs.get(
      UserPreferences.mergeContinueWatchingNextUp,
    );
    final currentBlocked = _userPrefs.get(
      UserPreferences.blockedParentalRatings,
    );
    final currentHiddenCW = _userPrefs.get(UserPreferences.hiddenContinueWatchingItems);
    final currentHiddenNU = _userPrefs.get(UserPreferences.hiddenNextUpSeries);
    final currentEnableRadarr = _userPrefs.get(UserPreferences.enableRadarrCalendar);
    final currentEnableSonarr = _userPrefs.get(UserPreferences.enableSonarrCalendar);
    final currentMerge = _userPrefs.get(UserPreferences.mergeRadarrSonarrCalendars);
    final currentShowCinema = _userPrefs.get(UserPreferences.radarrCalendarShowCinema);
    final currentShowDigital = _userPrefs.get(UserPreferences.radarrCalendarShowDigital);
    final currentShowPhysical = _userPrefs.get(UserPreferences.radarrCalendarShowPhysical);
    final currentShowDate = _userPrefs.get(UserPreferences.radarrCalendarShowDate);
    final currentShowEpisodeInfo = _userPrefs.get(UserPreferences.sonarrCalendarShowEpisodeInfo);
    final currentShowSonarrDate = _userPrefs.get(UserPreferences.sonarrCalendarShowDate);

    if (currentJson != _lastSectionsJson ||
        currentMultiServer != _lastMultiServer ||
        currentMergeContinueWatchingNextUp != _lastMergeContinueWatchingNextUp ||
        currentBlocked != _lastBlockedParentalRatings ||
        currentHiddenCW != _lastHiddenCW ||
        currentHiddenNU != _lastHiddenNU ||
        currentEnableRadarr != _lastEnableRadarrCalendar ||
        currentEnableSonarr != _lastEnableSonarrCalendar ||
        currentMerge != _lastMergeRadarrSonarrCalendars ||
        currentShowCinema != _lastRadarrCalendarShowCinema ||
        currentShowDigital != _lastRadarrCalendarShowDigital ||
        currentShowPhysical != _lastRadarrCalendarShowPhysical ||
        currentShowDate != _lastRadarrCalendarShowDate ||
        currentShowEpisodeInfo != _lastSonarrCalendarShowEpisodeInfo ||
        currentShowSonarrDate != _lastSonarrCalendarShowDate) {
      _lastSectionsJson = currentJson;
      _lastMultiServer = currentMultiServer;
      _lastMergeContinueWatchingNextUp = currentMergeContinueWatchingNextUp;
      _lastBlockedParentalRatings = currentBlocked;
      _lastHiddenCW = currentHiddenCW;
      _lastHiddenNU = currentHiddenNU;
      _lastEnableRadarrCalendar = currentEnableRadarr;
      _lastEnableSonarrCalendar = currentEnableSonarr;
      _lastMergeRadarrSonarrCalendars = currentMerge;
      _lastRadarrCalendarShowCinema = currentShowCinema;
      _lastRadarrCalendarShowDigital = currentShowDigital;
      _lastRadarrCalendarShowPhysical = currentShowPhysical;
      _lastRadarrCalendarShowDate = currentShowDate;
      _lastSonarrCalendarShowEpisodeInfo = currentShowEpisodeInfo;
      _lastSonarrCalendarShowDate = currentShowSonarrDate;

      _viewModel.refresh();
    }
    _maybeRegisterThemeMusic();
    setState(() {});
  }

  void onItemSelected(AggregatedItem? item) {
    _selectionDebounce?.cancel();
    _selectionDebounce = Timer(_selectionDelay, () {
      if (!mounted) return;
      _selectedItemNotifier.value = item;
      _isHoverPausedNotifier.value = true;

      _hoverPauseTimer?.cancel();
      _hoverPauseTimer = Timer(const Duration(seconds: 15), () {
        if (mounted) _isHoverPausedNotifier.value = false;
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
    return path == Destinations.home ||
        path.startsWith('${Destinations.home}/');
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
    if (_selectedItemNotifier.value != null) {
      _maybePlayThemeMusic(_selectedItemNotifier.value);
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
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _viewModel.refresh(preserveExisting: true);
      }
    });
    _maybeRegisterThemeMusic();
    if (_selectedItemNotifier.value != null) {
      _maybePlayThemeMusic(_selectedItemNotifier.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final backdropEnabled = _userPrefs.get(UserPreferences.backdropEnabled);
    final blurAmount = _userPrefs
        .get(UserPreferences.browsingBackgroundBlurAmount)
        .toDouble();
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
                ValueListenableBuilder<String?>(
                  valueListenable: _backdropUrlNotifier,
                  builder: (context, url, _) {
                    return _Backdrop(
                      url: url,
                      blurAmount: blurAmount,
                      useMakdBackdropFx: useMakdBackdropFx,
                    );
                  },
                ),
              const _GradientScrim(),
              Positioned.fill(
                child: _ContentRows(
                  viewModel: _viewModel,
                  mediaBarViewModel: _viewModel.mediaBarViewModel,
                  prefs: _userPrefs,
                  selectedItemNotifier: _selectedItemNotifier,
                  onItemSelected: onItemSelected,
                  isHoverPausedNotifier: _isHoverPausedNotifier,
                  isScrolledToTopNotifier: _isScrolledToTopNotifier,
                  onScrolledToTopChanged: (atTop) {
                    if (atTop != _isScrolledToTopNotifier.value) {
                      _isScrolledToTopNotifier.value = atTop;
                    }
                  },
                ),
              ),
              if (seasonalEffect != 'none')
                Positioned.fill(child: SeasonalEffects(effect: seasonalEffect)),
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
    return RepaintBoundary(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColorScheme.scrim.withValues(alpha: 0.8),
              AppColorScheme.scrim.withValues(alpha: 0.4),
              AppColorScheme.scrim.withValues(alpha: 0.8),
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: SizedBox.expand(),
      ),
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
    return RepaintBoundary(
      child: FullscreenBackdropSwitcher(
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
      ),
    );
  }

  Widget _blurredImage(BuildContext context, String imageUrl, double blur) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final pixelRatio = MediaQuery.devicePixelRatioOf(context).clamp(1.0, 2.0);
    final targetPxWidth =
        (blur > 0
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
    final sigma = GlassSettings.decorativeSigma(blur);
    return ImageFiltered(
      imageFilter: ui.ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
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
  final ValueNotifier<AggregatedItem?> selectedItemNotifier;
  final ValueChanged<AggregatedItem?> onItemSelected;
  final ValueNotifier<bool> isHoverPausedNotifier;
  final ValueNotifier<bool> isScrolledToTopNotifier;
  final ValueChanged<bool>? onScrolledToTopChanged;

  const _ContentRows({
    required this.viewModel,
    required this.mediaBarViewModel,
    required this.prefs,
    required this.selectedItemNotifier,
    required this.onItemSelected,
    required this.isHoverPausedNotifier,
    required this.isScrolledToTopNotifier,
    this.onScrolledToTopChanged,
  });

  @override
  State<_ContentRows> createState() => _ContentRowsState();
}

class _ContentRowsState extends State<_ContentRows>
    with WidgetsBindingObserver, WindowListener
    implements AudioOwnable {
  static const double _kHomeRowLabelInset = 16.0;
  static const double _focusedRowExtraSpacing = 20.0;
  static const Duration _focusedRowSpacingDuration = Duration(
    milliseconds: 200,
  );
  final _scrollController = ScrollController();
  final _mediaBarFocusNode = FocusNode(debugLabel: 'home_media_bar_focus');
  final _playbackManager = GetIt.instance<PlaybackManager>();
  final _audioArbiter = GetIt.instance<PlaybackArbiter>();
  final Media3PlayerBackend? _media3PreviewBackend =
      (PlatformDetection.isTizen || PlatformDetection.isAppleTV)
      ? null
      : GetIt.instance<Media3PlayerBackend>();
  final _themeMusicService = GetIt.instance<ThemeMusicService>();
  final Map<int, GlobalKey> _rowKeys = {};
  final Map<int, GlobalKey> _rowContainerKeys = {};
  final Map<int, ScrollController> _rowHorizontalControllers = {};
  List<HomeRow>? _cachedExtentRows;
  PosterSize? _cachedExtentPosterSize;
  double? _cachedExtentDesktopScale;
  bool? _cachedExtentFullScreenRows;
  HomeRowsStyle? _cachedExtentHomeRowsStyle;
  bool? _cachedExtentShowInfoOverlay;
  NavbarPosition? _cachedExtentNavbarPosition;
  double? _cachedExtentViewportHeight;
  int _cachedExtentPrefsVersion = -1;
  List<double>? _cachedRowExtents;
  int _layoutPrefsVersion = 0;
  Type? _lastMediaBarStateRuntime;
  int _lastMediaBarItemCount = 0;
  // Cache for non-focused row image URLs (independent of focus state). Cleared
  // with the extent cache on data/pref/scale change, and size-capped.
  final Map<String, String?> _rowImageUrlCache = {};
  final Map<String, String> _dynamicBackdrops = {};
  final Set<String> _fetchingBackdrops = {};
  final Map<int, double> _staticRowHeightCache = {};
  final ValueNotifier<int?> _activeFocusedRowNotifier = ValueNotifier(null);
  int? get _activeFocusedRowIndex => _activeFocusedRowNotifier.value;
  set _activeFocusedRowIndex(int? value) {
    if (_activeFocusedRowNotifier.value != value) {
      _activeFocusedRowNotifier.value = value;
    }
  }
  Timer? _previewDelayTimer;
  Timer? _previewStopTimer;
  StreamSubscription<bool>? _mainPlaybackSub;
  Player? _previewPlayer;
  VideoController? _previewController;
  AppleTvPreviewPlayer? _appleTvPreviewPlayer;
  StreamSubscription<void>? _appleTvPreviewCompletedSub;
  int _previewRequestId = 0;
  bool _mainPlaybackActive = false;
  bool _previewUsingMedia3 = false;
  bool _previewUsingAppleTv = false;
  final ValueNotifier<double> _scrollOffsetNotifier = ValueNotifier<double>(0);
  double _previewStartScrollOffset = 0;
  bool get _isScrolledToTop => widget.isScrolledToTopNotifier.value;
  final ValueNotifier<bool> _isActivelyScrollingNotifier = ValueNotifier(false);
  bool get _isActivelyScrolling => _isActivelyScrollingNotifier.value;
  set _isActivelyScrolling(bool value) {
    if (_isActivelyScrollingNotifier.value != value) {
      _isActivelyScrollingNotifier.value = value;
    }
  }

  final ValueNotifier<bool> _infoRevealedNotifier = ValueNotifier(false);
  bool get _infoRevealed => _infoRevealedNotifier.value;
  set _infoRevealed(bool value) {
    if (_infoRevealedNotifier.value != value) {
      _infoRevealedNotifier.value = value;
    }
  }

  Timer? _scrollIdleTimer;
  double _lastActiveRowOffsetUpdate = 0;
  bool _initialFocusResolved = false;
  bool _hasEverFocusedHomeContent = false;
  String? _lastObservedPath;
  bool _suppressNextRowPreviewFromMediaBar = false;
  bool _forceRevealOnNextRowFocusFromMediaBar = false;
  DateTime? _lastScrollTime;
  DateTime? _lastMouseWheelTime;
  DateTime? _lastVerticalNavAt;
  bool _verticalNavInFlight = false;
  bool _windowHasFocus = true;
  bool _holdMediaBarWhileSidebarFocused = false;

  final ValueNotifier<String?> _activePreviewKeyNotifier = ValueNotifier(null);
  String? get _activePreviewKey => _activePreviewKeyNotifier.value;
  set _activePreviewKey(String? value) {
    if (_activePreviewKeyNotifier.value != value) {
      _activePreviewKeyNotifier.value = value;
    }
  }

  final ValueNotifier<bool> _previewReadyNotifier = ValueNotifier(false);
  bool get _previewReady => _previewReadyNotifier.value;
  set _previewReady(bool value) {
    if (_previewReadyNotifier.value != value) {
      _previewReadyNotifier.value = value;
    }
  }

  final ValueNotifier<bool> _mediaBarVisibleNotifier = ValueNotifier(true);
  bool get _mediaBarVisible => _mediaBarVisibleNotifier.value;
  set _mediaBarVisible(bool value) {
    if (_mediaBarVisibleNotifier.value != value) {
      _mediaBarVisibleNotifier.value = value;
    }
  }

  final ValueNotifier<bool> _chromeFocusActiveNotifier = ValueNotifier(false);
  bool get _chromeFocusActive => _chromeFocusActiveNotifier.value;
  set _chromeFocusActive(bool value) {
    if (_chromeFocusActiveNotifier.value != value) {
      _chromeFocusActiveNotifier.value = value;
    }
  }

  final ValueNotifier<bool> _chromeAudioActiveNotifier = ValueNotifier(false);
  set _chromeAudioActive(bool value) {
    if (_chromeAudioActiveNotifier.value != value) {
      _chromeAudioActiveNotifier.value = value;
    }
  }

  double get _scrollOffset => _scrollOffsetNotifier.value;
  set _scrollOffset(double value) {
    if (_scrollOffsetNotifier.value != value) {
      _scrollOffsetNotifier.value = value;
    }
  }
  bool get _isSidebarFocus => LeftSidebar.isFocusedNotifier.value;
  bool _wasSidebarFocused = false;
  VoidCallback? _previousFocusContentFromNavbarCallback;
  FocusNode? _lastGlobalPrimaryFocus;
  String? _mobilePressedV2Key;
  String? _mouseHoveredV2Key;
  final Set<String> _v2FocusPrefetchedUrls = <String>{};
  final ValueNotifier<Map<String, Map<String, double>>> _v2AdditionalRatingsNotifier = ValueNotifier({});
  Map<String, Map<String, double>> get _v2AdditionalRatingsByKey => _v2AdditionalRatingsNotifier.value;
  final Map<String, Future<void>> _v2RatingsRequests = {};
  final Map<String, String?> _v2TmdbIdByKey = {};
  late bool _lastMedia3PreviewPreference;
  List<double> _rowTopOffsets = [];
  List<double> _rowExtents = [];
  List<double> _cachedRowTargetOffsets = [];
  double _cachedRowTargetMaxScrollExtent = -1.0;
  bool _cachedRowTargetFullScreenRows = false;
  double _overlayBottom = 0;
  static const _previewScrollThreshold = 150.0;
  static const _previewOpenTimeout = Duration(seconds: 10);
  static const _pinTransitionDistance = 96.0;
  static const _previewStartDelay = Duration(milliseconds: 1200);
  static const _focusHandoffDuration = Duration(milliseconds: 220);
  static const _focusHandoffCurve = Curves.easeInOutCubic;
  static const _mediaBarFadeDuration = Duration(milliseconds: 220);
  static const double _activeRowRecalcDistance = 48.0;

  void _markUserGesture() {
    if (!kIsWeb) return;
    if (!widget.prefs.get(UserPreferences.previewAudioEnabled)) return;
    final player = _previewPlayer;
    if (player == null || _activePreviewKey == null) return;
    unawaited(player.setVolume(100.0));
  }

  @override
  void didUpdateWidget(covariant _ContentRows oldWidget) {
    super.didUpdateWidget(oldWidget);
    final rowsChanged = !listEquals(oldWidget.viewModel.rows, widget.viewModel.rows);
    if (rowsChanged || oldWidget.prefs != widget.prefs) {
      _invalidateStaticRowHeightCache();
    }
  }

  void _invalidateStaticRowHeightCache() {
    _staticRowHeightCache.clear();
  }

  void _invalidateRowTargetOffsetCache() {
    _cachedRowTargetOffsets = [];
    _cachedRowTargetMaxScrollExtent = -1.0;
    _cachedRowTargetFullScreenRows = false;
  }

  List<double> _rowTargetOffsetsForScroll({required bool fullScreenRows}) {
    final maxScrollExtent = _scrollController.hasClients
        ? _scrollController.position.maxScrollExtent
        : double.infinity;
    if (_cachedRowTargetOffsets.length == _rowTopOffsets.length &&
        _cachedRowTargetFullScreenRows == fullScreenRows &&
        _cachedRowTargetMaxScrollExtent == maxScrollExtent) {
      return _cachedRowTargetOffsets;
    }

    final targets = <double>[];
    for (var i = 0; i < _rowTopOffsets.length; i++) {
      targets.add(
        fullScreenRows
            ? (_rowTopOffsets[i] - _tvTargetTopForRow(i)).clamp(
                0.0,
                maxScrollExtent,
              )
            : _rowTopOffsets[i].clamp(0.0, maxScrollExtent),
      );
    }

    _cachedRowTargetOffsets = targets;
    _cachedRowTargetMaxScrollExtent = maxScrollExtent;
    _cachedRowTargetFullScreenRows = fullScreenRows;
    return targets;
  }

  int? _focusedRowIndex(FocusNode? node) {
    if (OverlaySheetController.hasOpenSheet || SettingsPanel.isOpenNotifier.value) {
      return _activeFocusedRowIndex;
    }
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
    final desktopUnfocused = PlatformDetection.isDesktop && !_windowHasFocus;
    final onIdleFocus =
        primary == null ||
        primary is FocusScopeNode ||
        identical(primary, globalShortcutFocusNode);
    final chromeFocusActive =
        SettingsPanel.isOpenNotifier.value ||
        (!onIdleFocus && !desktopUnfocused && !onMediaBar && !hasRowContext);
    final chromeAudioActive = chromeFocusActive || onSidebar;

    final nextMediaBarVisible = isMobileUi
        ? true
        : (_isMediaBarIncluded() && _isBannerMode()) ||
              onMediaBar ||
              _holdMediaBarWhileSidebarFocused ||
              (_verticalNavInFlight && _mediaBarVisible) ||
              (!onSidebar && _activeFocusedRowIndex == null);
    final chromeChanged =
        _chromeFocusActiveNotifier.value != chromeFocusActive ||
        _chromeAudioActiveNotifier.value != chromeAudioActive;

    if (_mediaBarVisibleNotifier.value != nextMediaBarVisible || chromeChanged) {
      _mediaBarVisible = nextMediaBarVisible;
      _chromeFocusActive = chromeFocusActive;
      _chromeAudioActive = chromeAudioActive;
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

    if (chromeAudioActive && (chromeChanged || _activePreviewKey != null)) {
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
  void reassemble() {
    super.reassemble();
    _invalidateStaticRowHeightCache();
    _cachedRowExtents = null;
  }

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_handleGlobalHardwareKey);
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.addListener(this);
    }
    appRouter.routerDelegate.addListener(_onRouteChanged);
    _lastObservedPath = appRouter.routerDelegate.currentConfiguration.uri.path;
    FocusManager.instance.addListener(_onGlobalFocusChanged);
    SettingsPanel.isOpenNotifier.addListener(_onSettingsPanelOpenChanged);
    LeftSidebar.isFocusedNotifier.addListener(_onGlobalFocusChanged);
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
    _audioArbiter.register(this);
    _activeFocusedRowNotifier.addListener(_updateOffsets);
    widget.viewModel.addListener(_onViewModelChanged);
    widget.mediaBarViewModel.addListener(_onMediaBarStateChanged);
    _lastMediaBarStateRuntime = widget.mediaBarViewModel.state.runtimeType;
    _lastMediaBarItemCount = widget.mediaBarViewModel.state is MediaBarReady
        ? (widget.mediaBarViewModel.state as MediaBarReady).items.length
        : 0;
    if (!_isMediaBarEnabledByMode()) {
      _infoRevealed = true;
    }
  }

  void _onViewModelChanged() {
    _invalidateStaticRowHeightCache();
    _updateOffsets();
    if (mounted) setState(() {});
  }

  void _onMediaBarStateChanged() {
    if (!mounted) return;
    final state = widget.mediaBarViewModel.state;
    final runtime = state.runtimeType;
    final itemCount = state is MediaBarReady ? state.items.length : 0;
    if (runtime == _lastMediaBarStateRuntime &&
        itemCount == _lastMediaBarItemCount) {
      return;
    }
    _lastMediaBarStateRuntime = runtime;
    _lastMediaBarItemCount = itemCount;
    _updateOffsets();
    setState(() {});
  }

  void _updateOffsets() {
    if (!mounted) return;
    final rows = widget.viewModel.rows;
    final prefs = widget.prefs;
    final posterSize = (_isHomeRowsStyleV2() && !prefs.containsPreference(UserPreferences.posterSize))
        ? PosterSize.small
        : prefs.get(UserPreferences.posterSize);

    final includeMediaBar = _isMediaBarIncluded();
    final bannerMode = _isBannerMode();
    final showInfoOverlay = _showHomeRowInfoOverlay();
    final safeTop = MediaQuery.of(context).padding.top;
    final navbarIsTop = prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final fullScreenRows = !PlatformDetection.useMobileUi && prefs.get(UserPreferences.fullScreenRows);

    final navbarHeight = PlatformDetection.isTV
        ? (fullScreenRows ? 95.0 : (navbarIsTop ? 45.0 : 15.0))
        : (navbarIsTop ? (PlatformDetection.useMobileUi ? 60.0 : 80.0) : (fullScreenRows ? 0.0 : 80.0));

    final listTopPadding = includeMediaBar || showInfoOverlay
        ? 0.0
        : _isHomeRowsStyleV2()
            ? (fullScreenRows ? (safeTop + navbarHeight + 8.0).clamp(56.0, double.infinity) : safeTop + navbarHeight + 8)
            : safeTop + 56;

    final infoTopBasePadding = (!PlatformDetection.useMobileUi && navbarHeight == 0) ? 14.0 : 8.0;
    final infoTopPadding = safeTop + navbarHeight + infoTopBasePadding;
    final desktopScale = _desktopUiScaleFactor();
    final infoAreaHeight = InfoArea.fixedHeight(isMobile: PlatformDetection.useMobileUi, desktopScale: desktopScale);
    final infoBottomPadding = includeMediaBar ? 20.0 : 8.0;
    final infoOverlayPlaceholder = showInfoOverlay ? infoTopPadding + infoAreaHeight + infoBottomPadding : 0.0;

    final overlayBottom = _isHomeRowsStyleV2()
        ? (fullScreenRows ? (navbarHeight > 48.0 ? navbarHeight : 48.0) : navbarHeight)
        : showInfoOverlay
            ? infoTopPadding + infoAreaHeight
            : (fullScreenRows ? safeTop + 48.0 : 0.0);

    final rowExtents = _computeRowExtents(rows, posterSize, prefs);
    final rowTopOffsets = <double>[];
    var currentTop = listTopPadding + (bannerMode ? 0.0 : infoOverlayPlaceholder);
    if (includeMediaBar) {
      currentTop += _mediaBarHeight();
    }
    final focusedRowSpacing = PlatformDetection.isTV && !fullScreenRows ? _focusedRowExtraSpacing * 2 : 0.0;

    for (var i = 0; i < rowExtents.length; i++) {
      rowTopOffsets.add(currentTop);
      currentTop += rowExtents[i];
      if (i == _activeFocusedRowIndex) {
        currentTop += focusedRowSpacing;
      }
    }

    _invalidateRowTargetOffsetCache();
    _rowTopOffsets = rowTopOffsets;
    _rowExtents = rowExtents;
    _overlayBottom = overlayBottom;
  }

  @override
  AudioProducer get audioProducerId => AudioProducer.inlinePreview;

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    _finishSharedPreview(releaseResources: true);
    try {
      await _media3PreviewBackend?.release();
    } catch (_) {}
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleGlobalHardwareKey);
    _audioArbiter.unregister(this);
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    WidgetsBinding.instance.removeObserver(this);
    if (PlatformDetection.isDesktop) {
      windowManager.removeListener(this);
    }
    FocusManager.instance.removeListener(_onGlobalFocusChanged);
    SettingsPanel.isOpenNotifier.removeListener(_onSettingsPanelOpenChanged);
    LeftSidebar.isFocusedNotifier.removeListener(_onGlobalFocusChanged);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollOffsetNotifier.dispose();
    _activeFocusedRowNotifier.dispose();
    _v2AdditionalRatingsNotifier.dispose();
    _mediaBarVisibleNotifier.dispose();
    _chromeFocusActiveNotifier.dispose();
    _chromeAudioActiveNotifier.dispose();
    _activePreviewKeyNotifier.dispose();
    _previewReadyNotifier.dispose();
    _isActivelyScrollingNotifier.dispose();
    _infoRevealedNotifier.dispose();
    if (identical(
      NavigationLayout.focusContentFromNavbarNotifier.value,
      _focusContentFromNavbar,
    )) {
      NavigationLayout.focusContentFromNavbarNotifier.value =
          _previousFocusContentFromNavbarCallback;
    }
    _scrollIdleTimer?.cancel();
    _mediaBarFocusNode.dispose();
    _activeFocusedRowNotifier.removeListener(_updateOffsets);
    widget.viewModel.removeListener(_onViewModelChanged);
    widget.mediaBarViewModel.removeListener(_onMediaBarStateChanged);
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

  static String _previewKeyFor(AggregatedItem item, [int? rowIndex]) {
    if (rowIndex != null) {
      return '${item.serverId}:${item.id}:$rowIndex';
    }
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

  void _schedulePreview(
    AggregatedItem item, {
    required Duration delay,
    int? rowIndex,
  }) {
    final previewKey = _previewKeyFor(item, rowIndex);
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
      _activePreviewKey = previewKey;
      _previewReady = false;
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

  void _stopPreviewFor(AggregatedItem item, [int? rowIndex]) {
    final previewKey = _previewKeyFor(item, rowIndex);
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
      unawaited(_media3PreviewBackend!.release());
      _media3PreviewBackend.resetVolumeState();
    }
    if (_previewUsingAppleTv) {
      _previewUsingAppleTv = false;
      unawaited(_appleTvPreviewPlayer?.setVolume(0));
      unawaited(_appleTvPreviewPlayer?.stop());
    }
    if (releaseResources || kIsWeb) {
      _previewPlayer?.dispose();
      _previewPlayer = null;
      _previewController = null;
      _appleTvPreviewCompletedSub?.cancel();
      _appleTvPreviewCompletedSub = null;
      unawaited(_appleTvPreviewPlayer?.dispose());
      _appleTvPreviewPlayer = null;
    }

    if (_activePreviewKey != null || _previewReady) {
      _activePreviewKey = null;
      _previewReady = false;
    }
    _themeMusicService.setExternalAudioActive(false);
  }

  void _disposeSharedPreview() {
    _finishSharedPreview(releaseResources: true, updateUi: false);
  }

  Future<void> _startSharedPreview(
    AggregatedItem item,
    String previewKey,
  ) async {
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
    if (_previewUsingAppleTv) {
      await _appleTvPreviewPlayer?.stop();
      _previewUsingAppleTv = false;
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
      final previewVolume = kIsWeb ? 0.0 : (previewAudioEnabled ? 100.0 : 0.0);
      final useMedia3 = _useMedia3InlinePreview();
      await _audioArbiter.acquire(AudioProducer.inlinePreview);
      if (!_isPreviewRequestActive(requestId, previewKey)) {
        return;
      }
      if (useMedia3) {
        _previewUsingMedia3 = true;
        await _media3PreviewBackend!.setVolume(previewVolume);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          return;
        }

        await _media3PreviewBackend
            .play(<String, dynamic>{
              'url': previewUrl,
              'mediaType': 'video',
              'preview': true,
            })
            .timeout(_previewOpenTimeout);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          await _media3PreviewBackend.stop();
          return;
        }
      } else if (PlatformDetection.isAppleTV) {
        _previewUsingMedia3 = false;
        _previewUsingAppleTv = true;
        final player = _ensureAppleTvSharedPreviewPlayer();
        await player
            .open(previewUrl, volume: previewVolume, backend: 'mpv')
            .timeout(_previewOpenTimeout);
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          await player.stop();
          return;
        }
        await player.resume();
        if (!_isPreviewRequestActive(requestId, previewKey)) {
          await player.stop();
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
        _previewReady = true;
      }
    } catch (_) {
      if (_isPreviewRequestActive(requestId, previewKey)) {
        _finishSharedPreview();
      }
    }
  }

  AppleTvPreviewPlayer _ensureAppleTvSharedPreviewPlayer() {
    final existing = _appleTvPreviewPlayer;
    if (existing != null) {
      return existing;
    }
    final player = AppleTvPreviewPlayer();
    _appleTvPreviewPlayer = player;
    _appleTvPreviewCompletedSub = player.completedStream.listen((_) {
      if (_previewUsingAppleTv) {
        _finishSharedPreview();
      }
    });
    return player;
  }

  Player _ensureSharedPreviewPlayer() {
    final existing = _previewPlayer;
    if (existing != null) {
      return existing;
    }

    final player = Player(
      configuration: const PlayerConfiguration(libass: false),
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
    final hwDecodingEnabled = widget.prefs.get(
      UserPreferences.hardwareDecoding,
    );
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
            targetId = nextUp['Id']?.toString() ?? '';
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
        ? item.mediaSources.first['Id']?.toString()
        : null;
    final audioIndex = _getPreferredAudioIndex(item);
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
      'AudioStreamIndex': ?audioIndex?.toString(),
      if (client.accessToken != null) 'ApiKey': client.accessToken!,
    };

    final normalizedBasePath = baseUri.path.endsWith('/')
        ? baseUri.path.substring(0, baseUri.path.length - 1)
        : baseUri.path;
    final streamPath = kIsWeb ? 'stream.mp4' : 'stream';
    final fullPath = '$normalizedBasePath/Videos/${item.id}/$streamPath';

    return baseUri.replace(path: fullPath, queryParameters: params).toString();
  }

  int? _getPreferredAudioIndex(AggregatedItem item) {
    final allAudio = item.mediaStreams.where((s) => s['Type'] == 'Audio').toList();
    if (allAudio.isEmpty) return null;

    final preferred = widget.prefs.get(UserPreferences.defaultAudioLanguage).trim();
    List<Map<String, dynamic>> candidates = [];

    // find tracks matching the preferred language
    if (preferred.isNotEmpty) {
      final norm = normalizeLanguage(preferred);
      final iso3 = toIso3Language(norm);
      candidates = allAudio.where((s) {
        final lang = (s['Language'] as String?)?.trim();
        return languageMatchesPreferred(lang, norm, iso3);
      }).toList();
    }

    // if no language matches (or no preference set), use all audio tracks
    final finalPool = candidates.isNotEmpty ? candidates : allAudio;

    // return if only one option remains
    if (finalPool.length == 1) return finalPool.first['Index'] as int?;

    // Tie breaker selection
    // Prefer tracks not marked as Commentary or Audio Description
    // Prefer the track marked as Default
    // Prefer the lowest index
    final bestMatch = finalPool.firstWhere(
          (s) => s['IsCommentary'] != true &&
          s['IsAudioDescription'] != true &&
          s['IsDefault'] == true,
      orElse: () => finalPool.firstWhere(
            (s) => s['IsCommentary'] != true && s['IsAudioDescription'] != true,
        orElse: () => finalPool.first,
      ),
    );

    return bestMatch['Index'] as int?;
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
    return _isHomeRouteActive() &&
        !SettingsPanel.isOpenNotifier.value &&
        !OverlaySheetController.hasOpenSheet;
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

  void _prefetchV2FocusedImage(
    AggregatedItem item, {
    required double v2ImageHeight,
    required double v2FocusedWidth,
    required bool useSeriesThumbs,
  }) {
    if (!mounted || PlatformDetection.useMobileUi) return;

    if (_v2FocusPrefetchedUrls.length > 800) {
      _v2FocusPrefetchedUrls.clear();
    }

    final requestScale = MediaQuery.devicePixelRatioOf(context).clamp(1.0, 2.0);
    final imageApi = widget.viewModel.imageApiForServer(item.serverId);
    final url = _resolveV2FocusedImageUrl(
      item,
      imageApi,
      v2ImageHeight,
      useSeriesThumbs,
      requestScale,
      isPrefetch: true,
    );
    if (url == null || url.isEmpty) return;
    if (!_v2FocusPrefetchedUrls.add(url)) return;
    unawaited(
      BoundedNetworkImage.precache(
        context,
        url,
        layoutWidth: v2FocusedWidth,
        scale: 0.9,
        maxWidth: 960,
      ).catchError((_) {
        _v2FocusPrefetchedUrls.remove(url);
      }),
    );
  }

  void _prefetchV2FocusNeighbors({
    required HomeRow row,
    required int focusedIndex,
    required double v2ImageHeight,
    required double v2FocusedWidth,
    required bool useSeriesThumbs,
  }) {
    final items = row.items;
    for (final offset in const [1, -1]) {
      final i = focusedIndex + offset;
      if (i < 0 || i >= items.length) continue;
      _prefetchV2FocusedImage(
        items[i],
        v2ImageHeight: v2ImageHeight,
        v2FocusedWidth: v2FocusedWidth,
        useSeriesThumbs: useSeriesThumbs,
      );
    }
  }

  void _prefetchV2RowLeadImage({
    required HomeRow row,
    required double v2ImageHeight,
    required double v2FocusedWidth,
    required bool useSeriesThumbs,
  }) {
    if (row.isAudio || row.items.isEmpty) return;
    _prefetchV2FocusedImage(
      row.items.first,
      v2ImageHeight: v2ImageHeight,
      v2FocusedWidth: v2FocusedWidth,
      useSeriesThumbs: useSeriesThumbs,
    );
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

  Future<void> _loadV2FocusedRatings(
    AggregatedItem item,
    String itemKey,
  ) async {
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

    _v2AdditionalRatingsNotifier.value = {
      ..._v2AdditionalRatingsByKey,
      itemKey: result,
    };
  }

  double _mediaBarHeight() {
    final size = MediaQuery.sizeOf(context);
    final screenHeight = size.height;
    final screenWidth = size.width;

    if (_isBannerMode()) {
      if (PlatformDetection.isTV) return 320.0;
      if (!PlatformDetection.useMobileUi) return 240.0;
      return 200.0;
    }

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

  bool _isBookshelfMode() {
    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    return mode == UserPreferences.mediaBarModeBookshelf ||
        mode == UserPreferences.mediaBarModeGallery;
  }

  bool _isBannerMode() {
    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    return mode == UserPreferences.mediaBarModeBanner;
  }

  double _pinnedInfoCollapseOffset() {
    return (_mediaBarHeight() - (_pinTransitionDistance / 2)).clamp(
      0.0,
      double.infinity,
    );
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
      _infoRevealed = true;
    }
  }

  void _navigateFromMediaBarToNavbar() {
    widget.onItemSelected(null);
    if (_scrollController.hasClients && _scrollController.offset > 0) {
      unawaited(
        _scrollController.animateTo(
          0,
          duration: _focusHandoffDuration,
          curve: _focusHandoffCurve,
        ),
      );
    }
    _requestFocusToNavbar();
  }

  void _focusContentFromNavbar() {
    if (!_mayRestoreHomeFocus()) return;

    if (_isMediaBarIncluded()) {
      if (mounted && !_mediaBarVisible) {
        setState(() => _mediaBarVisible = true);
      }
      if (_mediaBarFocusNode.context != null) {
        _mediaBarFocusNode.requestFocus();
      } else {
        _requestMediaBarFocus(force: true);
      }
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
    final isBanner = _isBannerMode();
    if (mounted && _mediaBarVisible && !isBanner) {
      _mediaBarVisible = false;
    }
    if (!isBanner && _scrollController.hasClients) {
      final offsetAdjustment = _isBookshelfMode() ? (_overlayBottom + 8) : 0.0;
      final target = (_mediaBarHeight() - offsetAdjustment).clamp(
        0.0,
        _scrollController.position.maxScrollExtent,
      );
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
          _activeFocusedRowIndex = null;
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

      if (mounted && !_mediaBarFocusNode.hasFocus) {
        if (!_mediaBarVisible) {
          setState(() => _mediaBarVisible = true);
        }
        _requestMediaBarFocus(force: true);
      }
    } finally {
      _verticalNavInFlight = false;
    }
  }

  void _requestMediaBarFocus({int attempt = 0, bool force = false}) {
    if (!mounted ||
        (!force && _initialFocusResolved) ||
        !_isMediaBarIncluded()) {
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
    return _rowHorizontalControllers.putIfAbsent(rowIndex, () {
      final controller = ScrollController();
      controller.addListener(() => _onRowScrolled(rowIndex, controller));
      return controller;
    });
  }

  void _onRowScrolled(int rowIndex, ScrollController controller) {
    if (!controller.hasClients) return;
    const loadMoreTriggerDistance = 600.0;
    final remaining =
        controller.position.maxScrollExtent - controller.offset;
    if (remaining <= loadMoreTriggerDistance) {
      widget.viewModel.loadMoreForRow(rowIndex);
    }
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

  double _staticRowHeight(int rowIndex) {
    final row = rowIndex < widget.viewModel.rows.length ? widget.viewModel.rows[rowIndex] : null;
    if (row == null) return 0.0;

    final cached = _staticRowHeightCache[rowIndex];
    if (cached != null) {
      return cached;
    }

    final prefs = widget.prefs;
    final posterSize =
        (_isHomeRowsStyleV2() &&
            !prefs.containsPreference(UserPreferences.posterSize))
        ? PosterSize.small
        : prefs.get(UserPreferences.posterSize);

    final desktopScale = _desktopUiScaleFactor();
    final metadataScale = desktopScale;
    final isRowsV2 = prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2 && !_isSeerrFilterRow(row);
    final platformScale = PlatformDetection.isTV ? 0.8 * desktopScale : desktopScale;

    double childHeight = 0.0;
    if (row.isLoading) {
      if (row.rowType == HomeRowType.liveTv ||
          row.rowType == HomeRowType.libraryTilesSmall) {
        final squarePosterSide = _squarePosterSide(posterSize);
        childHeight = squarePosterSide + (56 * metadataScale);
      } else if (isRowsV2) {
        final imageHeight = posterSize.portraitHeight.toDouble() * platformScale * 2;
        childHeight = imageHeight + (_v2MetadataHeightBudget(prefs) * metadataScale) + (10 * metadataScale);
      } else {
        final imageHeight = posterSize.portraitHeight.toDouble() * platformScale;
        childHeight = imageHeight + (46 * metadataScale) + (10 * metadataScale);
      }
    } else if (row.rowType == HomeRowType.liveTv ||
        row.rowType == HomeRowType.libraryTilesSmall) {
      final squarePosterSide = _squarePosterSide(posterSize);
      childHeight = squarePosterSide + (56 * metadataScale);
    } else {
      final isSeerrRowOverride = _isSeerrFilterRow(row);
      final rowImageType = isSeerrRowOverride
          ? ImageType.thumb
          : (isRowsV2 ? ImageType.poster : _homeRowImageTypeForRow(row, prefs));
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
      childHeight = maxCardHeight + (10 * metadataScale);
    }

    final subtitle = _rowSubtitle(row, AppLocalizations.of(context));
    final hasSubtitle = subtitle != null &&
        (row.rowType != HomeRowType.liveTv &&
            row.rowType != HomeRowType.libraryTilesSmall);
    final headerPaddingTop = isRowsV2 ? 6.0 : 16.0;
    final headerPaddingBottom = isRowsV2 ? 1.0 : 8.0;
    final titleHeight = 20.0 * metadataScale;
    final subtitleHeight = hasSubtitle ? (18.0 * metadataScale) : 0.0;
    final headerHeight = headerPaddingTop + headerPaddingBottom + titleHeight + subtitleHeight;

    final totalHeight = childHeight + headerHeight;
    _staticRowHeightCache[rowIndex] = totalHeight;
    return totalHeight;
  }

  double _tvTargetTopForRow(int rowIndex) {
    final defaultTop = _overlayBottom + 8.0;
    final row = rowIndex < widget.viewModel.rows.length ? widget.viewModel.rows[rowIndex] : null;
    if (row == null) return defaultTop;
    final isRowsV2 = widget.prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2 &&
        !_isSeerrFilterRow(row);

    if (rowIndex == 0 && _rowTopOffsets.isNotEmpty) {
      if (_isMediaBarIncluded() && !_isBannerMode()) {
        return defaultTop;
      }
      if (!_isMediaBarIncluded() || !isRowsV2) {
        return _rowTopOffsets[0];
      }
    }

    final stackRender = context.findRenderObject();
    if (stackRender is! RenderBox || !stackRender.hasSize) {
      return rowIndex == 0 && _rowTopOffsets.isNotEmpty ? _rowTopOffsets[0] : defaultTop;
    }

    final viewportHeight = stackRender.size.height;
    final desktopScale = widget.prefs
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;
    final ratingsEnabled =
        widget.prefs.get(UserPreferences.enableAdditionalRatings) as bool? ??
        false;
    final extraHeight = ratingsEnabled ? (32.0 * desktopScale) : 0.0;
    final rowHeight = _staticRowHeight(rowIndex) + extraHeight;

    if (rowIndex == 0 && _rowTopOffsets.isNotEmpty) {
      final safeBottomMargin = 40.0 * desktopScale;
      final preferredTop = viewportHeight - rowHeight - safeBottomMargin;
      return preferredTop.clamp(defaultTop, _rowTopOffsets[0]);
    }

    if (isRowsV2) {
      final targetTop = (viewportHeight - rowHeight) / 2.0;
      return targetTop.clamp(defaultTop, double.infinity);
    }
    return defaultTop;
  }

  Future<void> _scrollTvRowIntoOverlayBand(int rowIndex) async {
    if (!mounted || !_scrollController.hasClients) return;


    final targetTop = _tvTargetTopForRow(rowIndex);
    final targetOffset = (_rowTopOffsets[rowIndex] - targetTop).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    final currentOffset = _scrollController.offset;
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
    final isDesktop = !PlatformDetection.isTV && !PlatformDetection.useMobileUi;
    if (isDesktop) {
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
      } else if (mediaBarState is MediaBarDisabled ||
          mediaBarState is MediaBarError) {
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
        final offsetAdjustment = _isBookshelfMode()
            ? (_overlayBottom + 8)
            : 0.0;
        final targetOffset = (_rowTopOffsets[rowIndex] - offsetAdjustment)
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

            final fullScreenRows =
                !PlatformDetection.useMobileUi &&
                widget.prefs.get(UserPreferences.fullScreenRows);
            if ((PlatformDetection.isTV || fullScreenRows) &&
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
        now.difference(_lastVerticalNavAt!) <
            const Duration(milliseconds: 140)) {
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
    if (focused) {
      _hasEverFocusedHomeContent = true;
      if (_activeFocusedRowIndex != rowIndex && _activePreviewKey != null) {
        _finishSharedPreview();
      }
      _activeFocusedRowIndex = rowIndex;

      if (!PlatformDetection.useMobileUi &&
          _mediaBarVisible &&
          !_verticalNavInFlight &&
          !_isBannerMode()) {
        setState(() => _mediaBarVisible = false);
      }
    } else if (_activeFocusedRowIndex == rowIndex) {
      if (_isSidebarFocus) {
        return;
      }
      if (OverlaySheetController.hasOpenSheet || SettingsPanel.isOpenNotifier.value) {
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
    final topStateChanged = atTop != _isScrolledToTop;
    if (topStateChanged) {
      widget.onScrolledToTopChanged?.call(atTop);
    }

    final isDesktop = !PlatformDetection.isTV && !PlatformDetection.useMobileUi;
    final fullScreenRows =
        !PlatformDetection.useMobileUi &&
        widget.prefs.get(UserPreferences.fullScreenRows);

    final shouldUpdateActiveRow = isDesktop &&
        _rowTopOffsets.isNotEmpty &&
        _scrollController.hasClients &&
        (_activeFocusedRowIndex == null ||
            (offset - _lastActiveRowOffsetUpdate).abs() >=
                _activeRowRecalcDistance ||
            offset <= 0);
    if (shouldUpdateActiveRow) {
      _lastActiveRowOffsetUpdate = offset;
      double minDiff = double.infinity;
      int? closestRowIndex;

      if (_isMediaBarIncluded()) {
        final mediaBarDiff = offset.abs();
        if (mediaBarDiff < minDiff) {
          minDiff = mediaBarDiff;
          closestRowIndex = null;
        }
      }

      final targets = _rowTargetOffsetsForScroll(fullScreenRows: fullScreenRows);
      for (var i = 0; i < targets.length; i++) {
        final diff = (targets[i] - offset).abs();
        if (diff < minDiff) {
          minDiff = diff;
          closestRowIndex = i;
        }
      }

      if (closestRowIndex != _activeFocusedRowIndex) {
        _activeFocusedRowIndex = closestRowIndex;
      }
    }

    final isMouseScroll =
        _lastMouseWheelTime != null &&
        DateTime.now().difference(_lastMouseWheelTime!).inMilliseconds < 100;

    if (isMouseScroll && isDesktop) {
      final primary = FocusManager.instance.primaryFocus;
      if (primary != null && primary != globalShortcutFocusNode) {
        globalShortcutFocusNode?.requestFocus();
      }
    }

    final shouldMarkScrolling = !_isActivelyScrolling;
    if (shouldMarkScrolling) {
      _isActivelyScrolling = true;
    }

    _scrollIdleTimer?.cancel();
    _scrollIdleTimer = Timer(
      Duration(milliseconds: isMouseScroll ? 1000 : 250),
      () {
        if (!mounted) return;
        _isActivelyScrolling = false;
        _snapToNearestRow();
      },
    );
    if (_activePreviewKey != null) {
      final scrollDelta = (offset - _previewStartScrollOffset).abs();
      if (scrollDelta > _previewScrollThreshold) {
        _finishSharedPreview();
        return;
      }
    }

    if (_infoRevealed && _isMediaBarIncluded() && _showHomeRowInfoOverlay()) {
      final collapseOffset = _pinnedInfoCollapseOffset();
      if (scrollingUp && offset < collapseOffset) {
        if (_infoRevealed) {
          _infoRevealed = false;
          _scrollOffset = offset;
          if (mounted) {
            setState(() {});
          }
        }
        return;
      }
    }

    _scrollOffset = offset;
  }

  void _snapToNearestRow() {
    if (!mounted || !_scrollController.hasClients) return;
    final prefs = widget.prefs;
    final fullScreenRows =
        !PlatformDetection.useMobileUi &&
        prefs.get(UserPreferences.fullScreenRows);
    if (!fullScreenRows) return;

    if (_mediaBarFocusNode.hasFocus) return;

    final homeRowsHaveFocus = _rowKeys.values.any((key) {
      final state = key.currentState;
      return state is LockedFocusRowState && state.hasFocusedItem;
    });
    final homeContentHadFocus = homeRowsHaveFocus || _mediaBarFocusNode.hasFocus;

    if (_activeFocusedRowIndex == null) {
      if (_scrollController.hasClients && _scrollController.offset > 0.0) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );
      }
      if (homeContentHadFocus && !_mediaBarFocusNode.hasFocus) {
        _mediaBarFocusNode.requestFocus();
      }
      return;
    }

    final currentOffset = _scrollController.offset;
    double minDiff = double.infinity;
    double bestOffset = currentOffset;
    int bestTargetIndex = 0;

    final List<double> targets = [];
    if (_isMediaBarIncluded()) {
      targets.add(0.0);
    }
    for (var i = 0; i < _rowTopOffsets.length; i++) {
      final targetTop = _tvTargetTopForRow(i);
      targets.add(
        (_rowTopOffsets[i] - targetTop).clamp(
          0.0,
          _scrollController.position.maxScrollExtent,
        ),
      );
    }

    for (var i = 0; i < targets.length; i++) {
      final target = targets[i];
      final diff = (target - currentOffset).abs();
      if (diff < minDiff) {
        minDiff = diff;
        bestOffset = target;
        bestTargetIndex = i;
      }
    }

    if ((bestOffset - currentOffset).abs() > 1.0) {
      _scrollController.animateTo(
        bestOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }

    if (homeContentHadFocus) {
      final int? bestRowIndex;
      if (_isMediaBarIncluded()) {
        if (bestTargetIndex == 0) {
          bestRowIndex = null;
        } else {
          bestRowIndex = bestTargetIndex - 1;
        }
      } else {
        bestRowIndex = bestTargetIndex;
      }

      if (bestRowIndex == null) {
        if (!_mediaBarFocusNode.hasFocus) {
          _mediaBarFocusNode.requestFocus();
        }
      } else {
        final rowState = _rowKeys[bestRowIndex]?.currentState;
        if (rowState is LockedFocusRowState<dynamic>) {
          rowState.requestFocusFromMemory();
        }
      }
    }
  }

  bool _handleGlobalHardwareKey(KeyEvent event) {
    if (event is! KeyDownEvent) return false;
    if (!_isHomeRouteActive()) return false;
    if (!_windowHasFocus) return false;
    if (SettingsPanel.isOpenNotifier.value || OverlaySheetController.hasOpenSheet) return false;
    if (LeftSidebar.isFocusedNotifier.value) return false;
    // Let the focused top navbar handle its own d-pad keys.
    if (TopToolbar.isFocusedNotifier.value) return false;

    final homeRowsHaveFocus = _rowKeys.values.any((key) {
      final state = key.currentState;
      return state is LockedFocusRowState && state.hasFocusedItem;
    });
    final homeContentHadFocus = homeRowsHaveFocus || _mediaBarFocusNode.hasFocus;

    if (homeContentHadFocus) return false;
    if (event.logicalKey.isBackKey) return false;

    final activeRow = _activeFocusedRowIndex;
    if (activeRow != null) {
      final rowState = _rowKeys[activeRow]?.currentState;
      if (rowState is LockedFocusRowState<dynamic>) {
        rowState.requestFocusFromMemory();
        return true;
      }
    } else {
      if (_isMediaBarIncluded()) {
        _mediaBarFocusNode.requestFocus();
      } else {
        final rowState = _rowKeys[0]?.currentState;
        if (rowState is LockedFocusRowState<dynamic>) {
          rowState.requestFocusFromMemory();
        }
      }
      return true;
    }

    return false;
  }

  double _libraryRowExtent(double rowHeight, {double metadataScale = 1.0}) =>
      rowHeight + (34 * metadataScale);

  double _desktopUiScaleFactor() {
    return widget.prefs.get(UserPreferences.desktopUiScale).scaleFactor;
  }

  double _squarePosterSide(PosterSize posterSize) {
    final scaleFactor = _desktopUiScaleFactor();
    final platformScale = PlatformDetection.isTV
        ? 0.8 * scaleFactor
        : scaleFactor;
    return posterSize.portraitHeight.toDouble() * platformScale;
  }

  double _rowContentHeight(
    HomeRow row,
    PosterSize posterSize,
    UserPreferences prefs,
  ) {
    final desktopScale = _desktopUiScaleFactor();
    final metadataScale = desktopScale;
    if (row.isLoading) {
      return _libraryRowExtent(
        220 * metadataScale,
        metadataScale: metadataScale,
      );
    } else if (row.rowType == HomeRowType.liveTv ||
        row.rowType == HomeRowType.libraryTilesSmall) {
      final squarePosterSide = _squarePosterSide(posterSize);
      final rowHeight = squarePosterSide + (56 * metadataScale);
      return _libraryRowExtent(rowHeight, metadataScale: metadataScale);
    } else {
      final isSeerrRowOverride = _isSeerrFilterRow(row);
      final isRowsV2 =
          prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2 &&
          !isSeerrRowOverride;
      final rowImageType = isSeerrRowOverride
          ? ImageType.thumb
          : (isRowsV2 ? ImageType.poster : _homeRowImageTypeForRow(row, prefs));
      final platformScale = PlatformDetection.isTV
          ? 0.8 * desktopScale
          : desktopScale;
      var maxCardHeight = 220.0 * metadataScale;
      if (isRowsV2) {
        final imageHeight =
            posterSize.portraitHeight.toDouble() * platformScale * 2;
        maxCardHeight =
            imageHeight + (_v2MetadataHeightBudget(prefs) * metadataScale);
      } else {
        for (final item in row.items) {
          final aspectRatio = _aspectRatioForRowItem(item, row, rowImageType);
          final imageHeight =
              (aspectRatio > 1
                  ? posterSize.landscapeHeight.toDouble()
                  : posterSize.portraitHeight.toDouble()) *
              platformScale;
          final cardHeight = imageHeight + (46 * metadataScale);
          if (cardHeight > maxCardHeight) {
            maxCardHeight = cardHeight;
          }
        }
      }
      return _libraryRowExtent(maxCardHeight, metadataScale: metadataScale);
    }
  }

  double _estimatedRowExtent(
    int rowIndex,
    HomeRow row,
    PosterSize posterSize,
    UserPreferences prefs,
  ) {
    var extent = _staticRowHeight(rowIndex);

    final fullScreenRows =
        !PlatformDetection.useMobileUi &&
        prefs.get(UserPreferences.fullScreenRows);
    if (fullScreenRows) {
      final desktopScale = _desktopUiScaleFactor();
      final viewportHeight = MediaQuery.sizeOf(context).height;
      final safeTop = MediaQuery.paddingOf(context).top;
      final isRowsV2 =
          prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2 &&
          !_isSeerrFilterRow(row);

      final navbarIsTop =
          prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
      final navbarHeight = PlatformDetection.isTV
          ? 95.0
          : (navbarIsTop ? (PlatformDetection.useMobileUi ? 60.0 : 80.0) : 0.0);

      double topOffset;
      if (isRowsV2) {
        topOffset = (safeTop + navbarHeight + 8.0).clamp(56.0, double.infinity);
      } else {
        final showInfoOverlay = prefs.get(UserPreferences.homeRowInfoOverlay);
        if (showInfoOverlay) {
          final infoTopBasePadding = (navbarHeight == 0) ? 14.0 : 8.0;
          final infoTopPadding = safeTop + navbarHeight + infoTopBasePadding;
          final infoAreaHeight = InfoArea.fixedHeight(
            isMobile: false,
            desktopScale: desktopScale,
          );
          topOffset = infoTopPadding + infoAreaHeight + 8.0;
        } else {
          topOffset = safeTop + 56.0;
        }
      }

      final targetExtent = viewportHeight - topOffset;
      if (extent < targetExtent) {
        extent = targetExtent;
      }
    }

    return extent;
  }

  List<double> _computeRowExtents(
    List<HomeRow> rows,
    PosterSize posterSize,
    UserPreferences prefs,
  ) {
    final desktopScale = _desktopUiScaleFactor();
    final fullScreenRows =
        !PlatformDetection.useMobileUi &&
        prefs.get(UserPreferences.fullScreenRows);
    final homeRowsStyle = prefs.get(UserPreferences.homeRowsStyle);
    final showInfoOverlay = prefs.get(UserPreferences.homeRowInfoOverlay);
    final navbarPosition = prefs.get(UserPreferences.navbarPosition);
    final viewportHeight = MediaQuery.sizeOf(context).height;

    if (_cachedRowExtents != null &&
        listEquals(_cachedExtentRows, rows) &&
        _cachedExtentPosterSize == posterSize &&
        _cachedExtentDesktopScale == desktopScale &&
        _cachedExtentFullScreenRows == fullScreenRows &&
        _cachedExtentHomeRowsStyle == homeRowsStyle &&
        _cachedExtentShowInfoOverlay == showInfoOverlay &&
        _cachedExtentNavbarPosition == navbarPosition &&
        _cachedExtentViewportHeight == viewportHeight &&
        _cachedExtentPrefsVersion == _layoutPrefsVersion) {
      return _cachedRowExtents!;
    }

    _invalidateStaticRowHeightCache();

    final extents = <double>[];
    for (var i = 0; i < rows.length; i++) {
      extents.add(_estimatedRowExtent(i, rows[i], posterSize, prefs));
    }
    _rowImageUrlCache.clear();
    _cachedExtentRows = rows;
    _cachedExtentPosterSize = posterSize;
    _cachedExtentDesktopScale = desktopScale;
    _cachedExtentFullScreenRows = fullScreenRows;
    _cachedExtentHomeRowsStyle = homeRowsStyle;
    _cachedExtentShowInfoOverlay = showInfoOverlay;
    _cachedExtentNavbarPosition = navbarPosition;
    _cachedExtentViewportHeight = viewportHeight;
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
    final hasAdditionalRatings = prefs.get(
      UserPreferences.enableAdditionalRatings,
    );
    final hasAdditionalRatingsPadding = hasAdditionalRatings ? 8.0 : 0.0;
    final heightBudget = 175.0 + hasAdditionalRatingsPadding;
    return heightBudget;
  }

  double _overlayRowShift({
    required double rowViewportTop,
    required double rowExtent,
    required double overlayBottom,
  }) {
    if (rowViewportTop >= overlayBottom + 20) return 0;
    const transitionRange = 40.0;
    final progress = ((overlayBottom + 20 - rowViewportTop) / transitionRange)
        .clamp(0.0, 1.0);
    final fullShift = (rowViewportTop + rowExtent + 10).clamp(
      0.0,
      double.infinity,
    );
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
    final fullScreenRows =
        !PlatformDetection.useMobileUi &&
        widget.prefs.get(UserPreferences.fullScreenRows);
    final isRowsV2 =
        widget.prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2;
    // If overlay isn't active, return child unchanged
    if ((!showInfoOverlay || !_infoRevealed) && !(isRowsV2 && fullScreenRows)) {
      return child;
    }

    // If media bar isn't included, no shifting
    if (!PlatformDetection.isTV && !fullScreenRows && !_isMediaBarIncluded()) {
      return child;
    }

    final focusedRowIndex = _focusedRowIndex(FocusManager.instance.primaryFocus);

    // Compute viewport geometry
    final rowViewportTop = rowTopOffsets[rowIndex] - _scrollOffset;
    final rowViewportBottom = rowViewportTop + rowExtents[rowIndex];

    // Get viewport height from scroll controller
    final viewportHeight = _scrollController.position.viewportDimension;

    // Classifier inputs
    final isVisibleOnScreen = rowViewportBottom > 0 && rowViewportTop < viewportHeight;
    final isUnderOverlay = rowViewportBottom <= overlayBottom + 8;
    final isNeighbor = focusedRowIndex != null &&
        (rowIndex - focusedRowIndex).abs() == 1;
    final isFocusedRow = focusedRowIndex == rowIndex;
    final isFarAway = focusedRowIndex != null &&
        (rowIndex - focusedRowIndex).abs() > 1;

    // Focused row: always visible
    if (isFocusedRow) {
      return child;
    }

    // Neighbor rows: always kept in tree (opacity fade)
    if (isNeighbor) {
      return IgnorePointer(
        child: Opacity(opacity: 0.0, child: child),
      );
    }

    // Far-away rows: hide only if offscreen
    if (isFarAway && !isVisibleOnScreen) {
      return IgnorePointer(
        child: Visibility(visible: false, child: child),
      );
    }

    // Rows under overlay: fade out but keep focusable
    if (isUnderOverlay) {
      return IgnorePointer(
        child: Opacity(opacity: 0.0, child: child),
      );
    }

    // Overlay shift logic
    final shift = _overlayRowShift(
      rowViewportTop: rowViewportTop,
      rowExtent: rowExtents[rowIndex],
      overlayBottom: overlayBottom,
    );
    if (shift <= 0) {
      return child;
    }

    const transitionRange = 40.0;
    final progress = ((overlayBottom + 20 - rowViewportTop) / transitionRange)
        .clamp(0.0, 1.0);
    final opacity = (1.0 - (progress * 1.4)).clamp(0.0, 1.0);

    return ClipRect(
      child: Transform.translate(
        offset: Offset(0, -shift),
        child: Opacity(opacity: opacity, child: child),
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

  String? _rowSubtitle(HomeRow row, AppLocalizations l10n) {
    if (row.id == 'merged_calendar' || row.id == 'radarr_calendar' || row.id == 'sonarr_calendar') {
      return 'Radarr and Sonarr Calendars';
    }
    if (row.id.startsWith('seerr_')) return l10n.seerrDiscoveryRows;
    if (row.id.startsWith('tmdb_')) return 'TMDB Lists';

    final config = widget.prefs.homeSectionsConfig.firstWhereOrNull((c) => c.stableId == row.id);
    if (config != null && config.pluginSource == HomeSectionPluginSource.custom) {
      Map<String, dynamic> rowConfig = {};
      try {
        rowConfig = jsonDecode(config.pluginAdditionalData ?? '{}') as Map<String, dynamic>;
      } catch (_) {}
      final source = rowConfig['source'] as String? ?? 'imdb';
      final type = rowConfig['type'] as String? ?? 'user_list';
      final sourceLabel = switch (source) {
        'imdb' => 'IMDb',
        'tmdb' => 'TMDB',
        'letterboxd' => 'Letterboxd',
        'mdblist' => 'MDBList',
        _ => source.toUpperCase(),
      };
      final typeLabel = switch (type) {
        'user_list' => source == 'tmdb'
            ? 'List'
            : (source == 'mdblist' ? '' : 'List from URL'),
        'user_diary' => 'Diary',
        'watchlist' => 'Watchlist',
        'films' => 'Complete Films',
        'awards_events' => 'Awards/Events',
        'movie_collection' => 'Collection',
        _ => type,
      };
      return '$sourceLabel $typeLabel'.trim();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final rows = widget.viewModel.rows;
    // Guard against a stale focused-row index pointing past the end of the
    // (potentially shorter) new row list
    if (_activeFocusedRowIndex != null && _activeFocusedRowIndex! >= rows.length) {
      _activeFocusedRowIndex = null;
    }
    final prefs = widget.prefs;
    final posterSize =
        (_isHomeRowsStyleV2() &&
            !prefs.containsPreference(UserPreferences.posterSize))
        ? PosterSize.small
        : prefs.get(UserPreferences.posterSize);
    final watchedBehavior = prefs.get(UserPreferences.watchedIndicatorBehavior);
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final cardExpansion = prefs.get(UserPreferences.cardFocusExpansion);
    final useSeriesThumbs = prefs.get(UserPreferences.seriesThumbnailsEnabled);

    if (widget.viewModel.isLoading && rows.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    _updateOffsets();
    final includeMediaBar = _isMediaBarIncluded();
    final bannerMode = _isBannerMode();
    final mediaBarHeight = _mediaBarHeight();
    final showInfoOverlay = _showHomeRowInfoOverlay();
    final safeTop = MediaQuery.of(context).padding.top;
    final desktopScale = _desktopUiScaleFactor();
    final fullScreenRows =
        !PlatformDetection.useMobileUi &&
        prefs.get(UserPreferences.fullScreenRows);
    final navbarIsTop =
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final navbarIsLeft = !navbarIsTop;
    final navbarHeight = PlatformDetection.isTV
        ? (fullScreenRows ? 95.0 : (navbarIsTop ? 45.0 : 15.0))
        : (navbarIsTop
              ? (PlatformDetection.useMobileUi ? 60.0 : 80.0)
              : (fullScreenRows ? 0.0 : 80.0));
    final listTopPadding = includeMediaBar || showInfoOverlay
        ? 0.0
        : _isHomeRowsStyleV2()
        ? (fullScreenRows
              ? (safeTop + navbarHeight + 8.0).clamp(56.0, double.infinity)
              : safeTop + navbarHeight + 8)
        : safeTop + 56;
    final tvTopNavbarInset =
        navbarIsTop && PlatformDetection.isTV && !PlatformDetection.useMobileUi
        ? 48.0
        : 0.0;
    final navbarLeftInset = navbarIsTop ? 16.0 + tvTopNavbarInset : 56.0;
    final infoHeaderLeftInset = (!PlatformDetection.useMobileUi && navbarIsTop)
        ? 8.0
        : 0.0;
    final rowLeftInset =
        (navbarIsLeft && !PlatformDetection.useMobileUi
            ? 56.0
            : tvTopNavbarInset) +
        (!PlatformDetection.useMobileUi ? 16.0 : 0.0);
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
    final infoOverlayPlaceholder = showInfoOverlay
        ? infoTopPadding + infoAreaHeight + infoBottomPadding
        : 0.0;

    final infoPlaceholderHeightBuilder = bannerMode
        ? ValueListenableBuilder<bool>(
            valueListenable: _infoRevealedNotifier,
            builder: (context, revealed, _) => SizedBox(
              height: revealed ? infoOverlayPlaceholder : 0.0,
            ),
          )
        : SizedBox(height: infoOverlayPlaceholder);

    final overlayBottom = _overlayBottom;
    final rowTopOffsets = _rowTopOffsets;
    final rowExtents = _rowExtents;
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
              onPressed: () =>
                  widget.viewModel.refresh(preserveExisting: false),
              child: Text(l10n.retryHomeRows),
            ),
          ],
        ),
      );
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _markUserGesture(),
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          _lastMouseWheelTime = DateTime.now();
        }
      },
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
                      return ValueListenableBuilder<bool>(
                        valueListenable: _mediaBarVisibleNotifier,
                        builder: (context, mediaBarVisible, _) {
                          return AnimatedOpacity(
                            duration: _mediaBarFadeDuration,
                            curve: Curves.easeInOutCubic,
                            opacity: mediaBarVisible ? 1.0 : 0.0,
                            child: IgnorePointer(
                              ignoring: !mediaBarVisible,
                              child: ValueListenableBuilder<bool>(
                                valueListenable: widget.isHoverPausedNotifier,
                                builder: (context, isHoverPaused, _) {
                                  return ValueListenableBuilder<bool>(
                                    valueListenable: widget.isScrolledToTopNotifier,
                                    builder: (context, isScrolledToTop, _) {
                                      return ValueListenableBuilder<bool>(
                                        valueListenable: _chromeAudioActiveNotifier,
                                        builder: (context, chromeAudioActive, _) {
                                          final barPaused = isHoverPaused ||
                                              !isScrolledToTop ||
                                              _isActivelyScrolling ||
                                              chromeAudioActive;

                                          return RepaintBoundary(
                                            child: bannerMode
                                              ? BannerMediaBar(
                                                  viewModel: widget.mediaBarViewModel,
                                                  prefs: prefs,
                                                  height: mediaBarHeight,
                                                  externallyPaused:
                                                      barPaused ||
                                                      !mediaBarVisible ||
                                                      _activePreviewKey != null,
                                                  focusNode: _mediaBarFocusNode,
                                                  onNavigateDown: _moveFocusFromMediaBarToRows,
                                                  onNavigateUp: _navigateFromMediaBarToNavbar,
                                                  onNavigateLeft: navbarIsLeft
                                                      ? _navigateFromMediaBarToNavbar
                                                      : null,
                                                  onOpen: (item) => context.push(
                                                    Destinations.item(
                                                      item.itemId,
                                                      serverId: item.serverId,
                                                    ),
                                                  ),
                                                  onPlay: (item) => context.push(
                                                    Destinations.item(
                                                      item.itemId,
                                                      serverId: item.serverId,
                                                      autoPlay: true,
                                                    ),
                                                  ),
                                                )
                                              : MediaBar(
                                                  viewModel: widget.mediaBarViewModel,
                                                  prefs: prefs,
                                                  externallyPaused:
                                                      barPaused ||
                                                      !mediaBarVisible ||
                                                      _activePreviewKey != null,
                                                  height: mediaBarHeight,
                                                  onNavigateDown: _moveFocusFromMediaBarToRows,
                                                  onNavigateUp: _navigateFromMediaBarToNavbar,
                                                  onNavigateLeft: navbarIsLeft
                                                      ? _navigateFromMediaBarToNavbar
                                                      : null,
                                                  focusNode: _mediaBarFocusNode,
                                                ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                    final infoIndex = includeMediaBar ? 1 : 0;
                    if (index == infoIndex) {
                      return infoPlaceholderHeightBuilder;
                    }
                    final row = rows[index - headerCount];
                    final rowIndex = index - headerCount;
                    final l10n = AppLocalizations.of(context);
                    late final Widget rowChild;
                    if (row.isLoading) {
                      rowChild = LibraryRow(
                        title: _localizedRowTitle(row, l10n),
                        isLoading: true,
                        children: const [],
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

                    final contentHeight = _rowContentHeight(row, posterSize, prefs);
                    final targetExtent = rowExtents[rowIndex];
                    final isRowsV2 = prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2 && !_isSeerrFilterRow(row);
                    final extraTopPadding = fullScreenRows
                        ? (isRowsV2
                            ? ((targetExtent - contentHeight) * 0.1).clamp(0.0, double.infinity)
                            : ((targetExtent - contentHeight) / 2.0).clamp(0.0, double.infinity))
                        : 0.0;

                    final paddedRowChild = extraTopPadding > 0.0
                        ? Padding(
                            padding: EdgeInsets.only(top: extraTopPadding),
                            child: rowChild,
                          )
                        : rowChild;

                    if (row.isLoading) {
                      final itemWidget = Padding(
                        padding: EdgeInsets.only(left: rowLeftInset),
                        child: ValueListenableBuilder<double>(
                          valueListenable: _scrollOffsetNotifier,
                          builder: (context, scrollOffset, _) {
                            return _buildShiftedRow(
                              child: paddedRowChild,
                              rowIndex: rowIndex,
                              rowTopOffsets: rowTopOffsets,
                              rowExtents: rowExtents,
                              showInfoOverlay: showInfoOverlay,
                              overlayBottom: overlayBottom,
                            );
                          },
                        ),
                      );
                      if (fullScreenRows) {
                        return SizedBox(
                          height: rowExtents[rowIndex],
                          child: itemWidget,
                        );
                      }
                      return itemWidget;
                    }

                    final itemWidget = Padding(
                      padding: EdgeInsets.only(left: rowLeftInset),
                      child: ValueListenableBuilder<int?>(
                        valueListenable: _activeFocusedRowNotifier,
                        builder: (context, activeRowIndex, _) {
                          return AnimatedPadding(
                            duration: _focusedRowSpacingDuration,
                            curve: Curves.easeOut,
                            padding: EdgeInsets.symmetric(
                              vertical: (PlatformDetection.isTV &&
                                      !fullScreenRows &&
                                      rowIndex == activeRowIndex)
                                  ? _focusedRowExtraSpacing
                                  : 0,
                            ),
                            child: ValueListenableBuilder<double>(
                              valueListenable: _scrollOffsetNotifier,
                              builder: (context, scrollOffset, _) {
                                return _buildShiftedRow(
                                  child: paddedRowChild,
                                  rowIndex: rowIndex,
                                  rowTopOffsets: rowTopOffsets,
                                  rowExtents: rowExtents,
                                  showInfoOverlay: showInfoOverlay,
                                  overlayBottom: overlayBottom,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                    if (fullScreenRows) {
                      return SizedBox(
                        height: rowExtents[rowIndex],
                        child: itemWidget,
                      );
                    }
                    return itemWidget;
                  },
                ),
              ),
            ),
        ValueListenableBuilder<bool>(
          valueListenable: _infoRevealedNotifier,
          builder: (context, infoRevealed, _) {
            if (infoRevealed && showInfoOverlay) {
              return Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      PlatformDetection.useMobileUi
                          ? navbarLeftInset
                          : rowLeftInset,
                      infoTopPadding,
                      16,
                      8,
                    ),
                    child: ValueListenableBuilder<AggregatedItem?>(
                      valueListenable: widget.selectedItemNotifier,
                      builder: (context, selectedItem, _) {
                        return InfoArea(
                          item: selectedItem,
                          headerLeftInset: infoHeaderLeftInset,
                        );
                      },
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
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
    final metadataScale = _desktopUiScaleFactor();
    final squarePosterSide = _squarePosterSide(posterSize);
    final rowHeight = squarePosterSide + (56 * metadataScale);
    final actions = <_LiveTvAction>[
      _LiveTvAction(Icons.tv_rounded, l10n.guide, Destinations.liveTvGuide),
      _LiveTvAction(
        Icons.fiber_manual_record_rounded,
        l10n.recordings,
        Destinations.liveTvRecordings,
      ),
      _LiveTvAction(
        Icons.schedule_rounded,
        l10n.schedule,
        Destinations.liveTvSchedule,
      ),
      _LiveTvAction(
        Icons.movie_creation,
        l10n.series,
        Destinations.liveTvSeriesRecordings,
      ),
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
    final metadataScale = _desktopUiScaleFactor();
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
          onLongPress: (_, item) =>
              showContextMenu(context, item, onChanged: () => setState(() {})),
          itemBuilder: (ctx, item, idx, isFocused) {
            final collectionType =
                (item.rawData['CollectionType'] as String? ?? '').toLowerCase();
            final icon = isGameLibrary(collectionType, item.name)
                ? gameLibraryIcon
                : _iconForCollectionType(collectionType);
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
                  onLongPress: () => showContextMenu(
                    context,
                    item,
                    onChanged: () => setState(() {}),
                  ),
                  onSecondaryTap: () => showContextMenu(
                    context,
                    item,
                    onChanged: () => setState(() {}),
                  ),
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
    final isSeerrRowOverride = _isSeerrFilterRow(row);
    final isRowsV2 =
        prefs.get(UserPreferences.homeRowsStyle) == HomeRowsStyle.v2 &&
        !isSeerrRowOverride;
    final rowImageType = isSeerrRowOverride
        ? ImageType.thumb
        : (isRowsV2 ? ImageType.poster : _homeRowImageTypeForRow(row, prefs));
    final desktopScale = _desktopUiScaleFactor();
    final metadataScale = desktopScale;
    final platformScale = PlatformDetection.isTV
        ? 0.8 * desktopScale
        : desktopScale;
    final v2ImageHeight =
        posterSize.portraitHeight.toDouble() * platformScale * 2;
    final v2MetadataHeightBudget = _v2MetadataHeightBudget(prefs);
    final v2PortraitAspect = row.isAudio ? 1.0 : 2 / 3;
    final v2FocusedAspect = row.isAudio ? 1.0 : 16 / 9;
    final v2PortraitWidth = v2ImageHeight * v2PortraitAspect;
    final v2FocusedWidth = v2ImageHeight * v2FocusedAspect;
    final navbarIsTopV2 =
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final rowLeftInsetV2 =
        (navbarIsTopV2
            ? (PlatformDetection.isTV && !PlatformDetection.useMobileUi
                  ? 48.0
                  : 0.0)
            : (!PlatformDetection.useMobileUi ? 56.0 : 0.0)) +
        (!PlatformDetection.useMobileUi ? 16.0 : 0.0);
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
      _prefetchV2RowLeadImage(
        row: row,
        v2ImageHeight: v2ImageHeight,
        v2FocusedWidth: v2FocusedWidth,
        useSeriesThumbs: useSeriesThumbs,
      );
    } else {
      for (final item in row.items) {
        final ar = _aspectRatioForRowItem(item, row, rowImageType);
        final height =
            (ar > 1
                ? posterSize.landscapeHeight.toDouble()
                : posterSize.portraitHeight.toDouble()) *
            platformScale;
        final cardHeight = height + (46 * metadataScale);
        if (cardHeight > maxCardHeight) maxCardHeight = cardHeight;
        if (firstCardWidth == 0) firstCardWidth = height * ar;
      }
    }

    if (firstCardWidth == 0) {
      final defaultAspect = row.isAudio ? 1.0 : 2 / 3;
      firstCardWidth =
          posterSize.portraitHeight.toDouble() * platformScale * defaultAspect;
    }
    if (maxCardHeight == 0) {
      maxCardHeight =
          posterSize.portraitHeight.toDouble() * platformScale +
          (46 * metadataScale);
    }

    final subtitle = _rowSubtitle(row, l10n);
    final hasSubtitle = subtitle != null && subtitle.isNotEmpty;
    return _buildTitledRow(
      key: _rowContainerKey(rowIndex),
      title: _localizedRowTitle(row, l10n),
      subtitle: subtitle,
      rowIndex: rowIndex,
      hasItems: row.items.isNotEmpty,
      height: maxCardHeight + (10 * metadataScale) + (hasSubtitle ? 18.0 : 0.0),
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
          onIndexChanged: (index, item) {
          final forceReveal = _forceRevealOnNextRowFocusFromMediaBar;
          _forceRevealOnNextRowFocusFromMediaBar = false;
          widget.onItemSelected(item);
          if (isRowsV2 && !row.isAudio) {
            _primeV2FocusedRatings(item);
            _prefetchV2FocusNeighbors(
              row: row,
              focusedIndex: index,
              v2ImageHeight: v2ImageHeight,
              v2FocusedWidth: v2FocusedWidth,
              useSeriesThumbs: useSeriesThumbs,
            );
          }
          unawaited(
            _revealAndScrollToPinnedInfo(ignoreScrollCooldown: forceReveal),
          );
          if (_suppressNextRowPreviewFromMediaBar) {
            _suppressNextRowPreviewFromMediaBar = false;
            _finishSharedPreview();
            return;
          }
          final canPreview = _supportsEpisodePreview(item);
          if (!PlatformDetection.useMobileUi && canPreview) {
            _schedulePreview(item, delay: _previewStartDelay, rowIndex: rowIndex);
          } else {
            _finishSharedPreview();
          }
          if (index >= row.items.length - 8) {
            widget.viewModel.loadMoreForRow(rowIndex);
          }
        },
        onLongPress: (_, item) =>
            showContextMenu(context, item, onChanged: () => setState(() {})),
        onTap: (_, item) {
          _finishSharedPreview(releaseResources: true);
          if (row.rowType == HomeRowType.libraryTiles) {
            _navigateToLibrary(context, item);
          } else if (row.rowType == HomeRowType.genres && row.id == 'genres') {
            context.push(Destinations.genre(item.name, genreId: item.id));
          } else if (item.serverId == 'seerr') {
            _navigateToSeerrItem(context, item);
          } else {
            context.push(
              Destinations.itemOrPhoto(
                item.id,
                serverId: item.serverId,
                type: item.type,
              ),
            );
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
          final previewKey = _previewKeyFor(item, rowIndex);
          final isV2MobileTouch = isRowsV2 && PlatformDetection.useMobileUi;
          final isV2MouseHover = isRowsV2 && !PlatformDetection.useMobileUi;
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
          final canUseExpandedV2Card = isRowsV2 && effectiveV2Focused && !row.isAudio;

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
            final itemHeight =
                (itemAr > 1
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

          return ValueListenableBuilder<String?>(
            valueListenable: _activePreviewKeyNotifier,
            builder: (context, activePreviewKey, _) {
              return ValueListenableBuilder<bool>(
                valueListenable: _previewReadyNotifier,
                builder: (context, previewReady, _) {
                  final showPreviewVideo = activePreviewKey == previewKey && previewReady;

                  void navigateToItem() {
                    if (row.rowType == HomeRowType.libraryTiles) {
                      _navigateToLibrary(context, item);
                    } else if (row.rowType == HomeRowType.genres && row.id == 'genres') {
                      context.push(Destinations.genre(item.name, genreId: item.id));
                    } else if (item.serverId == 'seerr') {
                      _navigateToSeerrItem(context, item);
                    } else {
                      context.push(
                        Destinations.itemOrPhoto(
                          item.id,
                          serverId: item.serverId,
                          type: item.type,
                        ),
                      );
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
              final row2Text = episodeInfo != null
                  ? '$episodeInfo - ${item.name}'
                  : item.name;
              final row3Text = _v2MetadataLine(item);
              final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
              final baseTextStyle =
                  Theme.of(context).textTheme.bodySmall ??
                  const TextStyle(fontSize: 12);
              final subtitleColor = isNeon
                  ? AppColorScheme.onSurface
                  : Theme.of(context).colorScheme.onSurface.withAlpha(180);
              final subtitleStyle = baseTextStyle.copyWith(
                color: subtitleColor,
                shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
              );

              Widget? ratingWidget;
              final enableEpisodeRatings = widget.prefs.get(UserPreferences.enableEpisodeRatings);
              if (enableEpisodeRatings) {
                final ratingVal = item.communityRating;
                if (ratingVal != null && ratingVal > 0) {
                  final displayVal = ratingVal <= 10.0 ? ratingVal * 10 : ratingVal;
                  final ratingText = '${displayVal.toInt()}%';
                  final ratingColor = isNeon
                      ? AppColorScheme.accent
                      : const Color(0xFF00B0FF); // matching TMDb theme color or active neon color
                  ratingWidget = Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: ratingColor.withValues(alpha: 0.15),
                      border: Border.all(
                        color: ratingColor.withValues(alpha: 0.8),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/ratings/tmdb.png',
                          height: 18,
                          filterQuality: FilterQuality.medium,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          ratingText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.1,
                            shadows: [
                              Shadow(blurRadius: 4, color: Colors.black54)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }

              final infoColumn = Column(
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

              if (ratingWidget != null) {
                cardSubtitleWidget = Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ratingWidget,
                    const SizedBox(width: 8),
                    Expanded(child: infoColumn),
                  ],
                );
              } else {
                cardSubtitleWidget = infoColumn;
              }
            } else {
              cardSubtitle = episodeInfo ?? item.name;
              cardSubtitleWidget = null;
            }
          } else {
            cardTitle = item.name;
            final showUserRatings = item.rawData['ShowUserRatings'] == true;
            final userRating = item.rawData['UserRating'] as String? ?? '';
            if (showUserRatings && userRating.isNotEmpty) {
              cardSubtitle = userRating;
            } else {
              cardSubtitle = (canUseExpandedV2Card &&
                      row.id != 'radarr_calendar' &&
                      row.id != 'sonarr_calendar' &&
                      row.id != 'merged_calendar')
                  ? _v2MetadataLine(item)
                  : item.subtitle;
            }
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
                    seerrMediaType: item.seerrMediaType,
                    seerrStatus: item.seerrStatus,
                    focusColor: (row.rowType == HomeRowType.genres && row.id == 'genres')
                        ? ThemeRegistry.active.borders.focusBorder.color
                        : focusColor,
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
                        if (!row.isAudio) {
                          _primeV2FocusedRatings(item);
                        }
                      }
                      if (!PlatformDetection.useMobileUi && canPreview) {
                        _schedulePreview(item, delay: _previewStartDelay, rowIndex: rowIndex);
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
                        _stopPreviewFor(item, rowIndex);
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

                      if (isRowsV2 && (_mobilePressedV2Key != null || _mouseHoveredV2Key != null)) {
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
                          appleTvTextureId: showPreviewVideo && _previewUsingAppleTv
                              ? _appleTvPreviewPlayer?.textureId
                              : null,
                          isFocused: isFocused,
                          focusColor: focusColor,
                        );

                  if (isRowsV2) {
                    final showExtendedSection = effectiveV2Focused;
                    final extendedSection = showExtendedSection
                        ? _buildV2ExtendedSection(
                            ctx,
                            item,
                            // Ratings are cached under the global item key, so
                            // look them up without the row index.
                            _previewKeyFor(item),
                            cardWidth: width,
                            extendedWidth: v2ExtendedWidth,
                            isAudioRow: row.isAudio,
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
                          if (extendedSection != null) ...[
                            const SizedBox(height: 4),
                            extendedSection,
                          ],
                        ],
                      ),
                    );
                  }

                  return previewWrappedCard;
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildV2ExtendedSection(
    BuildContext context,
    AggregatedItem item,
    String itemKey, {
    required double cardWidth,
    required double extendedWidth,
    required bool isAudioRow,
  }) {
    return ValueListenableBuilder<Map<String, Map<String, double>>>(
      valueListenable: _v2AdditionalRatingsNotifier,
      builder: (context, ratingsByKey, _) {
        final additionalRatings = ratingsByKey[itemKey] ?? {};
        final hasAnyRating = item.communityRating != null ||
            item.criticRating != null ||
            additionalRatings.isNotEmpty;
        final overview = isAudioRow ? '' : (item.overview ?? '');
        if (!hasAnyRating && overview.isEmpty) {
          return SizedBox(width: cardWidth);
        }

    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final baseStyle =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
    final overviewStyle = baseStyle.copyWith(
      color: isNeon
          ? AppColorScheme.onSurface
          : Theme.of(context).colorScheme.onSurface.withAlpha(180),
      shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
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
                    if (hasAnyRating && item.type != 'Episode')
                      RatingsRow(
                        ratings: additionalRatings,
                        communityRating: item.communityRating,
                        criticRating: item.criticRating,
                        enableAdditionalRatings: widget.prefs.get(
                          UserPreferences.enableAdditionalRatings,
                        ),
                        enabledRatings: widget.prefs.get(
                          UserPreferences.enabledRatings,
                        ),
                        showLabels: widget.prefs.get(
                          UserPreferences.showRatingLabels,
                        ),
                        showBadges: widget.prefs.get(
                          UserPreferences.showRatingBadges,
                        ),
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
      },
    );
  }

  static String _v2MetadataLine(AggregatedItem item) {
    final parts = <String>[];
    if (item.type == 'MusicAlbum' || item.type == 'Audio') {
      final artist = (item.albumArtist ?? '').trim().isNotEmpty
          ? item.albumArtist!.trim()
          : (item.albumArtists.isNotEmpty
              ? (item.albumArtists.first['Name'] as String?)?.trim()
              : (item.artists.isNotEmpty ? item.artists.first.trim() : ''));
      final year = item.productionYear;
      if (artist != null && artist.isNotEmpty) {
        if (year != null) {
          parts.add('$artist ($year)');
        } else {
          parts.add(artist);
        }
      } else if (year != null) {
        parts.add('$year');
      }
    } else {
      final year = item.productionYear;
      if (year != null) {
        parts.add('$year');
      }
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
    String? subtitle,
    required int rowIndex,
    required bool hasItems,
    required double height,
    required Widget child,
  }) {
    final isRowsV2 = _isHomeRowsStyleV2();
    final showHeaderControls =
        hasItems && PlatformDetection.useDesktopUi && !PlatformDetection.isTV;
    return RepaintBoundary(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (subtitle != null && subtitle.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ],
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
      ),
      ),
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

  static bool _isSeerrFilterRow(HomeRow row) =>
      row.id == 'seerr_movie_genres' ||
      row.id == 'seerr_series_genres' ||
      row.id == 'seerr_studios' ||
      row.id == 'seerr_networks';

  static String? _seerrTmdbImageUrl(String? path, int width) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    return 'https://image.tmdb.org/t/p/w$width$path';
  }

  static void _navigateToSeerrItem(BuildContext context, AggregatedItem item) {
    final filterType = item.rawData['FilterType'] as String?;
    if (filterType != null) {
      final mediaType = item.rawData['MediaType'] as String? ?? 'movie';
      final filterName = item.rawData['FilterName'] as String? ?? item.name;
      final uri = Uri(
        path: Destinations.seerrBrowse,
        queryParameters: {
          'filterId': item.id,
          'filterName': filterName,
          'mediaType': mediaType,
          'filterType': filterType,
        },
      );
      context.push(uri.toString());
    } else {
      final mediaType = item.type == 'Series' || item.type == 'tv'
          ? 'tv'
          : 'movie';
      context.push(
        Destinations.seerrMedia(item.id),
        extra: {'mediaType': mediaType, 'title': item.name},
      );
    }
  }

  static void _navigateToLibrary(BuildContext context, AggregatedItem item) {
    final collectionType = (item.rawData['CollectionType'] as String? ?? '')
        .toLowerCase();
    switch (collectionType) {
      case 'music':
        context.push(Destinations.musicLibrary(item.id));
        return;
      case 'books':
      case 'audiobooks':
        context.push(
          Destinations.bookLibrary(item.id, collectionType: collectionType),
        );
        return;
      case 'livetv':
        context.push(Destinations.liveTvGuide);
        return;
      default:
        // Game libraries route to the EmulatorJS browser; everything else to the
        // normal library view. Shared with the sidebar and bottom nav.
        context.push(gameOrLibraryRoute(item.id, collectionType, item.name));
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
        return imageApi.getPrimaryImageUrl(sId, maxHeight: maxH, tag: sTag);
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
    if (item.type != 'Video' && item.type != 'MusicVideo') {
      final parentId = item.parentBackdropItemId;
      final parentTags = item.parentBackdropImageTags;
      if (parentId != null && parentTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          parentId,
          maxWidth: maxW,
          tag: parentTags.first,
        );
      }
    }
    return _resolvePrimaryImageUrl(item, imageApi, maxWidth: maxW);
  }

  void _fetchBackdropIfNeeded(AggregatedItem item) async {
    if (item.serverId != 'seerr') return;
    final backdrop = item.rawData['BackdropPath'] as String?;
    if (backdrop != null && backdrop.startsWith('/')) return;
    if (_dynamicBackdrops.containsKey(item.id)) return;
    if (!_fetchingBackdrops.add(item.id)) return;

    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();

      final title = item.rawData['Name'] as String?;
      final searchPage = await repo.search(title != null && title.isNotEmpty ? title : item.id);
      if (searchPage.results.isNotEmpty) {
        final year = item.rawData['ProductionYear'] as int?;
        var matchedItem = searchPage.results.first;
        if (year != null) {
          for (final result in searchPage.results) {
            final resultYearStr = result.releaseDate ?? result.firstAirDate;
            if (resultYearStr != null && resultYearStr.length >= 4) {
              final resultYear = int.tryParse(resultYearStr.substring(0, 4));
              if (resultYear == year) {
                matchedItem = result;
                break;
              }
            }
          }
        }
        if (matchedItem.backdropPath != null && matchedItem.backdropPath!.isNotEmpty) {
          if (mounted) {
            setState(() {
              _dynamicBackdrops[item.id] = matchedItem.backdropPath!;
            });
          }
        }
      }
    } catch (e) {
      debugPrint('[HomeScreen] Failed to fetch backdrop for ${item.id}: $e');
    } finally {
      _fetchingBackdrops.remove(item.id);
    }
  }

  String? _resolveV2FocusedImageUrl(
    AggregatedItem item,
    ImageApi imageApi,
    double height,
    bool useSeriesThumbs,
    double requestScale, {
    bool isPrefetch = false,
  }) {
    if (item.serverId == 'seerr') {
      if (!isPrefetch) {
        _fetchBackdropIfNeeded(item);
      }
      final dynamicBackdrop = _dynamicBackdrops[item.id];
      if (dynamicBackdrop != null) {
        return _seerrTmdbImageUrl(dynamicBackdrop, 1280);
      }
      final backdrop = item.rawData['BackdropPath'] as String?;
      if (backdrop != null && backdrop.startsWith('/')) {
        return _seerrTmdbImageUrl(backdrop, 1280);
      }
      return _seerrTmdbImageUrl(item.rawData['PosterPath'] as String?, 300);
    }
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
        final latestEpId = item.rawData['LatestEpisodeId']?.toString();
        final latestEpTag =
            item.rawData['LatestEpisodePrimaryImageTag'] as String?;
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
      return imageApi.getThumbImageUrl(
        item.id,
        maxWidth: maxW,
        tag: itemThumbTag,
      );
    }

    final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
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
    if (row.isAudio) {
      return ImageType.poster;
    }
    if (_isSeerrFilterRow(row)) {
      return ImageType.thumb;
    }
    if (row.rowType == HomeRowType.latestMedia && _isLatestMusicRow(row)) {
      return ImageType.poster;
    }

    if (prefs.get(UserPreferences.homeRowsUniversalOverride)) {
      return prefs.get(UserPreferences.homeRowsUniversalImageType);
    }

    final sectionType = _sectionTypeForRow(row, prefs);
    if (sectionType == null) {
      return ImageType.poster;
    }
    return prefs.get(UserPreferences.homeRowImageType(sectionType));
  }

  static HomeSectionType? _sectionTypeForRow(HomeRow row, UserPreferences prefs) {
    final config = prefs.homeSectionsConfig.firstWhereOrNull((c) => c.stableId == row.id);
    if (config != null) {
      return config.type;
    }

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
      HomeRowType.recentlyReleased => HomeSectionType.recentlyReleased,
      _ => null,
    };
  }

  static bool _isLatestMusicRow(HomeRow row) {
    if (row.rowType != HomeRowType.latestMedia || row.items.isEmpty) {
      return false;
    }
    return row.items.every(
      (item) =>
          item.type == 'Audio' ||
          item.type == 'MusicAlbum' ||
          item.type == 'MusicArtist',
    );
  }

  static double _aspectRatioForRowItem(
    AggregatedItem item,
    HomeRow row,
    ImageType imageType,
  ) {
    if (row.isAudio) {
      return 1.0;
    }
    if (_isSeerrFilterRow(row)) {
      return 16 / 9;
    }
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
    double requestScale, {
    bool isMyMediaRow = false,
  }) {
    if (imageType == ImageType.poster && isMyMediaRow) {
      final primaryAr = item.rawData['PrimaryImageAspectRatio'] as num?;
      if (primaryAr != null && primaryAr >= 1.0) {
        return null;
      }
    }

    if (item.serverId == 'seerr') {
      final backdrop = _seerrTmdbImageUrl(
        item.rawData['BackdropPath'] as String?,
        1280,
      );
      final poster = _seerrTmdbImageUrl(
        item.rawData['PosterPath'] as String?,
        300,
      );
      if (imageType == ImageType.thumb || imageType == ImageType.banner) {
        return backdrop ?? poster;
      }
      return poster ?? backdrop;
    }
    final itemThumbTag = _tagForType(item, 'Thumb');
    final itemBannerTag = _tagForType(item, 'Banner');
    final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
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
        final myMediaPrimary = _resolvePrimaryImageUrl(
          item,
          imageApi,
          maxWidth: maxW,
        );
        if (myMediaPrimary != null) {
          return myMediaPrimary;
        }
      }
      if (itemBannerTag != null) {
        return imageApi.getBannerImageUrl(
          item.id,
          maxWidth: maxW,
          tag: itemBannerTag,
        );
      }
      if (itemThumbTag != null) {
        return imageApi.getThumbImageUrl(
          item.id,
          maxWidth: maxW,
          tag: itemThumbTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          item.id,
          maxWidth: maxW,
          tag: item.backdropImageTags.first,
        );
      }
      return _resolveImageUrl(
        item,
        imageApi,
        height,
        useSeriesThumbs,
        requestScale,
      );
    }

    if (imageType == ImageType.thumb) {
      final maxW = (height * 16 / 9 * requestScale).toInt();
      final maxH = (height * requestScale).toInt();
      if (!useSeriesThumbs ||
          item.type == 'Video' ||
          item.type == 'MusicVideo') {
        if (item.type == 'Episode' ||
            item.type == 'Video' ||
            item.type == 'MusicVideo') {
          final videoPrimary = _resolvePrimaryImageUrl(
            item,
            imageApi,
            maxHeight: maxH,
            maxWidth: maxW,
          );
          if (videoPrimary != null) {
            return videoPrimary;
          }
        } else if (item.type == 'Series') {
          final latestEpId = item.rawData['LatestEpisodeId']?.toString();
          final latestEpTag =
              item.rawData['LatestEpisodePrimaryImageTag'] as String?;
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
        return imageApi.getThumbImageUrl(
          item.id,
          maxWidth: maxW,
          tag: itemThumbTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          item.id,
          maxWidth: maxW,
          tag: item.backdropImageTags.first,
        );
      }
      if (useSeriesThumbs || item.type != 'Episode') {
        if (parentThumbItemId != null && parentThumbTag != null) {
          return imageApi.getThumbImageUrl(
            parentThumbItemId,
            maxWidth: maxW,
            tag: parentThumbTag,
          );
        }
        if (item.parentBackdropItemId != null &&
            item.parentBackdropImageTags.isNotEmpty) {
          return imageApi.getBackdropImageUrl(
            item.parentBackdropItemId!,
            maxWidth: maxW,
            tag: item.parentBackdropImageTags.first,
          );
        }
      }
      return _resolveLandscapeImageUrl(item, imageApi, height, requestScale);
    }

    return _resolveImageUrl(
      item,
      imageApi,
      height,
      useSeriesThumbs,
      requestScale,
    );
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
    final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
    final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;
    final parentBackdropItemId = item.parentBackdropItemId;
    final parentBackdropTags = item.parentBackdropImageTags;

    if (imageType == ImageType.poster) {
      final sId = seriesId ?? item.parentPrimaryImageItemId;
      final sTag = seriesPrimaryTag ?? item.parentPrimaryImageTag;
      if (sId != null) {
        return imageApi.getPrimaryImageUrl(sId, maxHeight: maxH, tag: sTag);
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
      final seriesBannerTag =
          (item.rawData['SeriesImageTags'] as Map?)?['Banner'] as String?;
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
  final int? appleTvTextureId;
  final bool isFocused;
  final Color focusColor;

  const _PreviewCardShell({
    required this.card,
    required this.width,
    required this.aspectRatio,
    required this.showVideo,
    required this.useMedia3,
    required this.controller,
    this.appleTvTextureId,
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
      previewSurface = const Media3VideoView(fill: Colors.black, role: 'preview');
    } else if (appleTvTextureId != null) {
      previewSurface = FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: 1920,
          height: 1080,
          child: Texture(textureId: appleTvTextureId!),
        ),
      );
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
                  borderRadius: AppRadius.circular(8),
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
                    borderRadius: AppRadius.circular(8),
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