import 'dart:async';
import 'dart:ui';

import 'offline_aware_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:logger/logger.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/media_bar_slide_item.dart';
import '../../data/models/media_bar_state.dart';
import '../../data/services/background_service.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../data/services/sponsorblock_service.dart';
import '../../data/services/youtube_stream_resolver.dart';
import '../../data/viewmodels/media_bar_view_model.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../navigation/app_router.dart';
import '../navigation/destinations.dart';
import '../../util/language_matching.dart';
import '../../util/overlay_color_palette.dart';
import '../../util/overview_text.dart';
import '../../util/platform_detection.dart';
import '../../l10n/app_localizations.dart';
import '../../playback/appletv_preview_player.dart';
import '../../playback/html_video_backend_profile.dart';
import '../../playback/inline_preview_engine.dart';
import '../../playback/media3_player_backend.dart';
import 'bounded_network_image.dart';
import 'fullscreen_backdrop_switcher.dart';
import 'navigation_layout.dart';
import 'mediabar/bookshelf_layout.dart';
import 'mediabar/gallery_coverflow.dart';
import 'mediabar/gallery_layout.dart';
import 'rating_display.dart';
import 'web_local_trailer.dart';
import 'web_youtube_trailer.dart';

final Logger _trailerLog = Logger();

List<Shadow> get _textShadows => [
  Shadow(blurRadius: 4, color: AppColorScheme.scrim.withValues(alpha: 0.54)),
];

class MediaBar extends StatefulWidget {
  final MediaBarViewModel viewModel;
  final UserPreferences prefs;
  final bool externallyPaused;
  final double height;
  final Future<void> Function()? onNavigateDown;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateLeft;
  final FocusNode? focusNode;

  const MediaBar({
    super.key,
    required this.viewModel,
    required this.prefs,
    this.externallyPaused = false,
    this.height = 220,
    this.onNavigateDown,
    this.onNavigateUp,
    this.onNavigateLeft,
    this.focusNode,
  });

  @override
  State<MediaBar> createState() => _MediaBarState();
}

class _MediaBarState extends State<MediaBar>
    with WidgetsBindingObserver
    implements AudioOwnable {
  static const _openTimeout = Duration(seconds: 10);
  static const _previewRevealDelay = Duration(seconds: 3);
  static const _trailerPrepareDebounce = Duration(milliseconds: 500);
  static const _trailerResolveTimeout = Duration(seconds: 10);
  static const _trailerReadyTimeout = Duration(seconds: 5);
  static const _youtubeRevealBufferDelay = Duration(milliseconds: 900);

  final _backgroundService = GetIt.instance<BackgroundService>();
  final _playbackManager = GetIt.instance<PlaybackManager>();
  final _audioArbiter = GetIt.instance<PlaybackArbiter>();
  final Media3PlayerBackend? _media3TrailerBackend =
      (PlatformDetection.isTizen || PlatformDetection.isAppleTV)
      ? null
      : GetIt.instance<Media3PlayerBackend>();
  final _sponsorBlockService = SponsorBlockService();
  final _sponsorBlockSession = SponsorBlockSkipSession();
  bool _isHomeRouteActive = true;

  Timer? _autoAdvanceTimer;
  bool _isPaused = false;
  int _currentIndex = 0;

  bool _readyHooksAppliedForCurrentLoad = false;

  DateTime? _keyDownTime;
  DateTime? _lastFocusReceivedAt;
  static const _keyLongPressThreshold = Duration(milliseconds: 500);
  static const _focusActivationGuardDuration = Duration(milliseconds: 350);

  Player? _trailerPlayer;
  VideoController? _trailerController;
  AppleTvPreviewPlayer? _appleTvTrailerPlayer;
  StreamSubscription<void>? _appleTvTrailerCompletedSub;
  bool _trailerUsingAppleTv = false;
  StreamSubscription<bool>? _mainPlaybackSub;
  StreamSubscription<bool>? _trailerCompletedSub;
  StreamSubscription<bool>? _media3TrailerCompletedSub;
  StreamSubscription<Map<String, dynamic>>? _media3EventSub;
  StreamSubscription<Duration>? _trailerPositionSub;
  Timer? _trailerRevealTimer;
  Timer? _trailerPrepareTimer;
  Timer? _mainPlaybackInactiveTimer;
  Timer? _youTubeRevealTimer;
  double _trailerVideoOpacity = 0.0;
  String? _activeTrailerItemId;
  String? _pendingTrailerItemId;
  int _trailerResolveId = 0;
  bool _trailerRevealArmed = false;
  bool _isTrailerPlayingValue = false;
  bool get _isTrailerPlaying => _isTrailerPlayingValue;
  set _isTrailerPlaying(bool value) {
    _isTrailerPlayingValue = value;
    _publishTrailerImmersive(value);
  }

  /// Mirrors the trailer-playing state into the chrome-fade notifier. Writes
  /// defer to post-frame mid-build (cancel runs from deactivate) so the
  /// ancestor NavigationLayout is not marked dirty during build.
  void _publishTrailerImmersive(bool value) {
    if (NavigationLayout.trailerImmersiveNotifier.value == value) return;
    final phase = SchedulerBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.idle ||
        phase == SchedulerPhase.postFrameCallbacks) {
      NavigationLayout.trailerImmersiveNotifier.value = value;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Re-derive the value because the state may have changed again
        // within the frame.
        NavigationLayout.trailerImmersiveNotifier.value =
            mounted && _isTrailerPlayingValue;
      });
    }
  }
  bool _mainPlaybackActive = false;
  bool _trailerUsingMedia3 = false;
  String? _activeYouTubeVideoId;
  String? _pendingYouTubeVideoId;
  String? _retainedYouTubeVideoId;
  String? _activeWebTrailerUrl;
  String? _pendingWebTrailerUrl;
  bool _embeddedYouTubeAvailable = true;
  bool _sponsorBlockSeekInFlight = false;
  int _sponsorBlockToken = 0;
  String? _lastSyncedMakdBackdropUrl;
  int? _media3PlatformViewId;
  bool _bookshelfLoadingOverlay = false;
  bool _galleryLoadingOverlay = false;
  final Set<String> _failedTrailerItemIds = <String>{};
  late bool _lastHardwareDecodingEnabled;
  late bool _lastUseMedia3TrailerEngine;

  bool get _hideLeftNavArrowForSidebar {
    if (PlatformDetection.useMobileUi) return false;
    return widget.prefs.get(UserPreferences.navbarPosition) ==
        NavbarPosition.left;
  }

  Color _mediaBarOverlayColor() {
    return OverlayColorPalette.resolveColor(
      widget.prefs.get(UserPreferences.mediaBarOverlayColor),
    );
  }

  double _mediaBarOverlayOpacity() {
    final value = widget.prefs
        .get(UserPreferences.mediaBarOverlayOpacity)
        .toDouble();
    return value.clamp(0.0, 100.0) / 100.0;
  }

  @override
  void initState() {
    super.initState();
    _lastHardwareDecodingEnabled = widget.prefs.get(
      UserPreferences.hardwareDecoding,
    );
    _lastUseMedia3TrailerEngine = _useMedia3TrailerEngine();
    _mainPlaybackActive = _playbackManager.state.isPlaying;
    _mainPlaybackSub = _playbackManager.state.playingStream.listen(
      _onMainPlaybackChanged,
    );
    _media3EventSub = _media3TrailerBackend?.errorStream.listen(
      _onMedia3BackendEvent,
      onError: (_) {},
    );
    _isHomeRouteActive = _isHomePath(
      appRouter.routerDelegate.currentConfiguration.uri.path,
    );
    appRouter.routerDelegate.addListener(_onRouteChanged);
    PlayerRouteObserver.instance.isPlayerActive
        .addListener(_onPlayerRouteChanged);
    widget.viewModel.addListener(_onStateChanged);
    widget.prefs.addListener(_onPrefsChanged);
    WidgetsBinding.instance.addObserver(this);
    _audioArbiter.register(this);
  }

  @override
  AudioProducer get audioProducerId => AudioProducer.mediaBarTrailer;

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    _cancelTrailerPreview();
    try {
      await _trailerPlayer?.stop();
    } catch (_) {}
    try {
      await _appleTvTrailerPlayer?.stop();
    } catch (_) {}
    try {
      await _media3TrailerBackend?.release();
    } catch (_) {}
  }

  @override
  void deactivate() {
    // Stop playback if the widget is recycled before the async dispose() runs.
    _cancelTrailerPreview(rebuild: false);
    super.deactivate();
  }

  @override
  void dispose() {
    _isTrailerPlayingValue = false;
    _publishTrailerImmersive(false);
    _audioArbiter.unregister(this);
    _autoAdvanceTimer?.cancel();
    _trailerRevealTimer?.cancel();
    _trailerPrepareTimer?.cancel();
    _mainPlaybackInactiveTimer?.cancel();
    _youTubeRevealTimer?.cancel();
    _mainPlaybackSub?.cancel();
    _media3EventSub?.cancel();
    unawaited(_disposeTrailerPlayer());
    widget.viewModel.removeListener(_onStateChanged);
    widget.prefs.removeListener(_onPrefsChanged);
    WidgetsBinding.instance.removeObserver(this);
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    PlayerRouteObserver.instance.isPlayerActive
        .removeListener(_onPlayerRouteChanged);
    super.dispose();
  }

  // Re-evaluate the persistent Media3 view's mount condition when a player
  // route is pushed or popped.
  void _onPlayerRouteChanged() {
    if (mounted) setState(() {});
  }

  bool _isHomePath(String path) {
    return path == Destinations.home ||
        path.startsWith('${Destinations.home}/');
  }

  bool _isHomeRouteCurrent() {
    return _isHomePath(appRouter.routerDelegate.currentConfiguration.uri.path);
  }

  /// Whether a trailer may play right now. Re-checked after every await in the
  /// reveal pipeline so a leave-event aborts the reveal even before
  /// _cancelTrailerPreview() runs.
  bool _trailerShouldBeActive() {
    return mounted &&
        !widget.externallyPaused &&
        _isHomeRouteCurrent() &&
        !_mainPlaybackActive;
  }

  bool _useMedia3TrailerEngine() {
    return usesMedia3ForInlinePreview();
  }

  /// Whether the Media3 platform view stays mounted between trailers so each
  /// trailer reuses the same native view via setSource. It is not gated on the home
  /// route because an unpainted view under an opaque route costs nothing and skips
  /// the expensive teardown/create cycle on every detail push. It MUST stay
  /// unmounted while a player route is up, though: a freshly mounted view's
  /// native init takes over Media3Bridge.activeView and force-releases the
  /// fullscreen player's surface. Auto-advance between queue items emits a
  /// brief isPlaying=false, so gating on playback state alone lets the preview
  /// view mount mid-session and black-screen the next item.
  bool get _shouldMountPersistentMedia3View =>
      _useMedia3TrailerEngine() &&
      widget.prefs.get(UserPreferences.mediaBarTrailerPreview) &&
      !_mainPlaybackActive &&
      !PlayerRouteObserver.instance.isPlayerActive.value;

  void _onMainPlaybackChanged(bool isPlaying) {
    if (isPlaying &&
        _trailerUsingMedia3 &&
        _activeTrailerItemId != null &&
        _isHomeRouteCurrent()) {
      return;
    }
    if (isPlaying) {
      _mainPlaybackInactiveTimer?.cancel();
      _mainPlaybackInactiveTimer = null;
      _setMainPlaybackActive(true);
      return;
    }
    // Debounce the drop to false: buffering, a scrub, and queue auto-advance all
    // report a brief isPlaying=false, and remounting the preview during that
    // window would steal the shared Media3 slot from the live player. A real
    // stop stays false past the timer.
    if (!_mainPlaybackActive || _mainPlaybackInactiveTimer != null) return;
    _mainPlaybackInactiveTimer = Timer(const Duration(seconds: 1), () {
      _mainPlaybackInactiveTimer = null;
      _setMainPlaybackActive(false);
    });
  }

  void _setMainPlaybackActive(bool active) {
    if (_mainPlaybackActive == active) return;
    _mainPlaybackActive = active;
    if (active) {
      _cancelTrailerPreview();
    }
    // Re-evaluate the persistent Media3 view's mount condition.
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(MediaBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.externallyPaused != oldWidget.externallyPaused) {
      if (widget.externallyPaused) {
        _autoAdvanceTimer?.cancel();
        _cancelTrailerPreview();
      } else {
        _startAutoAdvance();
        final items = widget.viewModel.items;
        if (_isHomeRouteActive && _currentIndex < items.length) {
          _scheduleTrailerPreview(items[_currentIndex]);
        }
      }
    }
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
      _cancelTrailerPreview();
      _autoAdvanceTimer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _startAutoAdvance();
    }
  }

  void _onStateChanged() {
    if (!mounted) return;
    setState(() {});
    final state = widget.viewModel.state;
    if (state is MediaBarLoading) {
      _readyHooksAppliedForCurrentLoad = false;
    }

    if (state is MediaBarReady && !_readyHooksAppliedForCurrentLoad) {
      _readyHooksAppliedForCurrentLoad = true;
      _prefetchAround(state.items, _currentIndex);
      _prefetchAllInBackground(state.items, _currentIndex);
      if (_isGalleryMode()) {
        _prefetchGalleryWindow(state.items, _currentIndex);
      }
    }
    if (state is MediaBarReady && _failedTrailerItemIds.isNotEmpty) {
      final knownItemIds = state.items.map((item) => item.itemId).toSet();
      _failedTrailerItemIds.removeWhere((id) => !knownItemIds.contains(id));
    }
    if (_isHomeRouteActive &&
        state is MediaBarReady &&
        state.items.isNotEmpty) {
      _startAutoAdvance();
      if (_activeTrailerItemId == null && _currentIndex < state.items.length) {
        _scheduleTrailerPreview(state.items[_currentIndex]);
      }
      _syncMakdBackdropWithCurrentSlide();
    }
  }

  void _markTrailerFailed(String? itemId) {
    if (itemId == null || itemId.isEmpty) return;
    _failedTrailerItemIds.add(itemId);
    if (_failedTrailerItemIds.length <= 256) return;
    _failedTrailerItemIds.remove(_failedTrailerItemIds.first);
  }

  void _onMedia3BackendEvent(Map<String, dynamic> _) {
    if (!_trailerUsingMedia3 || !_isHomeRouteActive) return;
    if (_activeTrailerItemId == null) return;

    _markTrailerFailed(_activeTrailerItemId);
    if (mounted) {
      // The bar keeps cycling; a media3 failure does not implicate the
      // dormant WebView.
      _cancelTrailerPreview(retainYouTubePlayer: true);
    }
  }

  void _syncMakdBackdropWithCurrentSlide() {
    if (!_isHomeRouteActive) return;

    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    if (mode != UserPreferences.mediaBarModeMakd) {
      _lastSyncedMakdBackdropUrl = null;
      return;
    }

    final items = widget.viewModel.items;
    if (_currentIndex >= items.length) return;

    final backdropUrl = items[_currentIndex].backdropUrl;
    if (backdropUrl == null || backdropUrl.isEmpty) return;

    if (_lastSyncedMakdBackdropUrl == backdropUrl ||
        _backgroundService.currentUrl == backdropUrl) {
      return;
    }

    _backgroundService.setBackgroundUrl(
      backdropUrl,
      context: BlurContext.browsing,
    );
    _lastSyncedMakdBackdropUrl = backdropUrl;
  }

  bool _isMakdMobileMode() {
    if (!PlatformDetection.useMobileUi) return false;
    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    return mode == UserPreferences.mediaBarModeMakd;
  }

  void _prefetchAllInBackground(
    List<MediaBarSlideItem> items,
    int centerIndex,
  ) {
    if (!mounted || items.isEmpty) return;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    // Calculate dimensions matching layout constraints exactly to maximize memory cache hits.
    final isMobile = PlatformDetection.useMobileUi;
    final contentHeight = widget.height - (isMobile ? 108.0 : 0.0);
    final activeBookHeight = contentHeight * 0.84;
    final activeBookWidth = activeBookHeight * 0.72;
    final posterCacheW = (activeBookWidth * 0.88 * dpr).round().clamp(150, 400);
    final backdropCacheW = (screenWidth * dpr).round().clamp(640, 1280);

    final warmIndices = <int>{
      centerIndex,
      if (centerIndex + 1 < items.length) centerIndex + 1,
      if (centerIndex + 2 < items.length) centerIndex + 2,
      if (centerIndex + 3 < items.length) centerIndex + 3,
      if (centerIndex - 1 >= 0) centerIndex - 1,
      if (centerIndex - 2 >= 0) centerIndex - 2,
    };

    final isBookshelf = _isBookshelfMode();

    final windowStart = (centerIndex - 2).clamp(0, items.length);
    final windowEnd = (centerIndex + 11).clamp(0, items.length);

    Future<void>(() async {
      // Allow active and adjacent images to load first without network contention
      await Future<void>.delayed(const Duration(milliseconds: 1500));
      for (var i = windowStart; i < windowEnd; i++) {
        if (warmIndices.contains(i)) continue;

        final item = items[i];
        if (!mounted) return;

        // Add a brief delay between items to prevent clogging the network queue
        await Future<void>.delayed(const Duration(milliseconds: 200));
        if (!mounted) return;

        try {
          if (isBookshelf) {
            if (item.posterUrl != null) {
              await precacheImage(
                ResizeImage(
                  offlineAwareImageProvider(item.posterUrl!),
                  width: posterCacheW,
                ),
                context,
              );
            }
          } else {
            if (item.backdropUrl != null) {
              await precacheImage(
                ResizeImage(
                  offlineAwareImageProvider(item.backdropUrl!),
                  width: backdropCacheW,
                ),
                context,
              );
              if (!mounted) return;
            }
            if (item.logoUrl != null) {
              await precacheImage(
                offlineAwareImageProvider(item.logoUrl!),
                context,
              );
            }
          }
        } catch (_) {}
      }
    });
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    setState(() {});

    if (_isMakdMobileMode()) {
      _cancelTrailerPreview();
      return;
    }

    final useMedia3Trailer = _useMedia3TrailerEngine();
    final trailerEngineChanged =
        useMedia3Trailer != _lastUseMedia3TrailerEngine;
    if (trailerEngineChanged) {
      _lastUseMedia3TrailerEngine = useMedia3Trailer;
      _cancelTrailerPreview();
      unawaited(_disposeTrailerPlayer());
    }

    final trailerPreviewEnabled = widget.prefs.get(
      UserPreferences.mediaBarTrailerPreview,
    );

    final hardwareDecodingEnabled = widget.prefs.get(
      UserPreferences.hardwareDecoding,
    );
    final hardwareDecodingChanged =
        hardwareDecodingEnabled != _lastHardwareDecodingEnabled;

    if (hardwareDecodingChanged) {
      _lastHardwareDecodingEnabled = hardwareDecodingEnabled;
      _cancelTrailerPreview();
      unawaited(_disposeTrailerPlayer());
    }

    if (!trailerPreviewEnabled) {
      if (!hardwareDecodingChanged) {
        _cancelTrailerPreview();
      }
    } else if (_trailerUsingMedia3) {
      final audioEnabled = widget.prefs.get(
        UserPreferences.mediaBarTrailerAudio,
      );
      _media3TrailerBackend!.setVolume(audioEnabled ? 100 : 0);
    } else if (_trailerUsingAppleTv) {
      final audioEnabled = widget.prefs.get(
        UserPreferences.mediaBarTrailerAudio,
      );
      unawaited(_appleTvTrailerPlayer?.setVolume(audioEnabled ? 100 : 0));
    } else if (_trailerPlayer != null) {
      final audioEnabled = widget.prefs.get(
        UserPreferences.mediaBarTrailerAudio,
      );
      _trailerPlayer?.setVolume(audioEnabled ? 100 : 0);
    }
  }

  void _onRouteChanged() {
    final isHome = _isHomeRouteCurrent();
    if (_isHomeRouteActive == isHome) return;

    _isHomeRouteActive = isHome;
    if (!_isHomeRouteActive) {
      _autoAdvanceTimer?.cancel();
      _cancelTrailerPreview();
      _lastSyncedMakdBackdropUrl = null;
      return;
    }

    if (_activeTrailerItemId != null) {
      _cancelTrailerPreview();
    }

    _startAutoAdvance();
    final items = widget.viewModel.items;
    if (_currentIndex < items.length) {
      _scheduleTrailerPreview(items[_currentIndex]);
    }
    _syncMakdBackdropWithCurrentSlide();
  }

  void _startAutoAdvance() {
    _autoAdvanceTimer?.cancel();
    if (!widget.prefs.get(UserPreferences.mediaBarAutoAdvance)) return;
    if (widget.externallyPaused) return;
    if (_isTrailerPlaying) return;
    if (!_isHomeRouteActive) return;
    final intervalMs = widget.prefs.get(UserPreferences.mediaBarIntervalMs);
    _autoAdvanceTimer = Timer.periodic(Duration(milliseconds: intervalMs), (_) {
      if (_isPaused ||
          _isTrailerPlaying ||
          !mounted ||
          widget.externallyPaused ||
          !_isHomeRouteActive) {
        return;
      }
      final items = widget.viewModel.items;
      if (items.isEmpty) return;
      if (_isBookshelfMode() && _currentIndex >= items.length - 1) {
        _autoAdvanceTimer?.cancel();
        return;
      }
      final nextIndex = (_currentIndex + 1) % items.length;
      _goToPage(nextIndex);
    });
  }

  void _goToPage(int index) {
    if (_currentIndex != index) {
      _onPageChanged(index);
    }
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
    _syncMakdBackdropWithCurrentSlide();
    _startAutoAdvance();
    // Keep the booted WebView across the slide change so the next YouTube
    // trailer starts fast.
    _cancelTrailerPreview(retainYouTubePlayer: true);
    final items = widget.viewModel.items;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _prefetchAround(items, index);
      if (_isGalleryMode()) {
        _prefetchGalleryWindow(items, index);
      }
      if (index < items.length) {
        _scheduleTrailerPreview(items[index]);
      }
    });
  }

  void _prefetchAround(List<MediaBarSlideItem> items, int centerIndex) {
    if (!mounted || items.isEmpty) return;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    // Calculate dimensions matching layout constraints exactly to maximize memory cache hits.
    final isMobile = PlatformDetection.useMobileUi;
    final contentHeight = widget.height - (isMobile ? 108.0 : 0.0);
    final activeBookHeight = contentHeight * 0.84;
    final activeBookWidth = activeBookHeight * 0.72;
    final posterCacheW = (activeBookWidth * 0.88 * dpr).round().clamp(150, 400);
    final backdropCacheW = (screenWidth * dpr).round().clamp(640, 1280);

    final isBookshelf = _isBookshelfMode();

    // Prefetch close items (next 2 slides and previous 2 slides)
    final indicesToPrefetch = [
      centerIndex + 1,
      centerIndex + 2,
      centerIndex - 1,
      centerIndex - 2,
    ];
    for (final idx in indicesToPrefetch) {
      if (idx >= 0 && idx < items.length) {
        final item = items[idx];

        if (isBookshelf) {
          if (item.posterUrl != null) {
            precacheImage(
              ResizeImage(
                offlineAwareImageProvider(item.posterUrl!),
                width: posterCacheW,
              ),
              context,
            );
          }
        } else {
          if (item.backdropUrl != null) {
            precacheImage(
              ResizeImage(
                offlineAwareImageProvider(item.backdropUrl!),
                width: backdropCacheW,
              ),
              context,
            );
          }

          if (item.logoUrl != null) {
            precacheImage(offlineAwareImageProvider(item.logoUrl!), context);
          }
        }
      }
    }
  }

  void _setPaused(bool paused) {
    if (_isPaused == paused) return;
    _isPaused = paused;
    if (paused) {
      _autoAdvanceTimer?.cancel();
    } else {
      _startAutoAdvance();
    }
  }

  void _handleFocusChange(bool focused) {
    if (focused) {
      _lastFocusReceivedAt = DateTime.now();
    }
  }

  bool _isBookshelfMode() {
    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    return mode == UserPreferences.mediaBarModeBookshelf;
  }

  bool _isGalleryMode() {
    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    return mode == UserPreferences.mediaBarModeGallery;
  }

  void _scheduleTrailerPreview(MediaBarSlideItem item) {
    if (_isMakdMobileMode() || _isBookshelfMode()) {
      _cancelTrailerPreview();
      return;
    }
    if (!widget.prefs.get(UserPreferences.mediaBarTrailerPreview)) {
      return;
    }
    if (!_isHomeRouteActive) {
      return;
    }
    if (_mainPlaybackActive) {
      return;
    }
    if (_failedTrailerItemIds.contains(item.itemId)) {
      return;
    }
    if (_activeTrailerItemId == item.itemId && _trailerVideoOpacity > 0) {
      return;
    }
    if (_pendingTrailerItemId == item.itemId) {
      return;
    }

    _trailerRevealTimer?.cancel();
    _trailerPrepareTimer?.cancel();
    final resolveId = ++_trailerResolveId;
    _pendingTrailerItemId = item.itemId;
    _trailerRevealArmed = false;
    // Let slide flips settle so intermediate items never fire the trailer
    // resolution network chain. Reveal still waits _previewRevealDelay.
    _trailerPrepareTimer = Timer(_trailerPrepareDebounce, () {
      if (!mounted || resolveId != _trailerResolveId) return;
      unawaited(_prepareTrailerPreview(item, resolveId));
    });
    _trailerRevealTimer = Timer(_previewRevealDelay, () async {
      if (!mounted || resolveId != _trailerResolveId) return;
      if (!widget.prefs.get(UserPreferences.mediaBarTrailerPreview)) return;
      _trailerRevealArmed = true;
      await _tryRevealPreparedTrailer(item, resolveId);
    });
  }

  /// [retainYouTubePlayer] keeps the booted WebView alive (dormant) for the
  /// next YouTube trailer. Only slide-to-slide transitions pass true; every
  /// leave or disable path releases the WebView entirely.
  void _cancelTrailerPreview({
    bool rebuild = true,
    bool retainYouTubePlayer = false,
  }) {
    final wasTrailerPlaying = _isTrailerPlaying;
    final wasUsingMedia3 = _trailerUsingMedia3;
    final wasUsingAppleTv = _trailerUsingAppleTv;
    _trailerRevealTimer?.cancel();
    _trailerPrepareTimer?.cancel();
    _youTubeRevealTimer?.cancel();
    _trailerResolveId++;
    _trailerRevealArmed = false;
    _isTrailerPlaying = false;
    _trailerUsingMedia3 = false;
    _trailerUsingAppleTv = false;
    // Stop both media-bar-owned players unconditionally: the flags can desync
    // from what is actually playing.
    _trailerPlayer?.stop();
    unawaited(_appleTvTrailerPlayer?.stop());
    // Media3 is a shared singleton (also drives row previews); only release it
    // when the trailer owned it.
    if (wasUsingMedia3) {
      unawaited(_media3TrailerBackend?.release());
    }
    _activeTrailerItemId = null;
    _pendingTrailerItemId = null;
    _pendingYouTubeVideoId = null;
    _pendingWebTrailerUrl = null;
    _clearSponsorBlockTracking();
    final releaseRetainedYouTube =
        !retainYouTubePlayer && _retainedYouTubeVideoId != null;
    if (_activeYouTubeVideoId != null ||
        _activeWebTrailerUrl != null ||
        releaseRetainedYouTube ||
        _trailerVideoOpacity != 0.0 ||
        wasUsingMedia3 ||
        wasUsingAppleTv) {
      _activeYouTubeVideoId = null;
      _activeWebTrailerUrl = null;
      if (releaseRetainedYouTube) {
        _retainedYouTubeVideoId = null;
      }
      _trailerVideoOpacity = 0.0;
      // deactivate() runs during the build phase, where setState() would throw.
      if (rebuild && mounted) setState(() {});
    }
    if (rebuild && wasTrailerPlaying && mounted) {
      _startAutoAdvance();
    }
  }

  Future<void> _prepareTrailerPreview(
    MediaBarSlideItem item,
    int resolveId,
  ) async {
    if (!_trailerShouldBeActive()) {
      return;
    }
    final client = _clientForServer(item.serverId);
    String? streamUrl;
    bool useYouTubeHeaders = false;
    String? youTubeVideoId;
    String? sponsorBlockVideoId;
    StreamResolutionResult? localRes;
    final webOnly = PlatformDetection.isWeb;
    final supportsEmbeddedYouTube = _supportsEmbeddedYouTubePreview();

    // Negotiate local trailers through the shared PlaybackInfo path (direct-play
    // when compatible, transcode otherwise) instead of a hand-built URL.
    try {
      final trailers = await client.itemsApi.getLocalTrailers(item.itemId);
      if (!mounted || resolveId != _trailerResolveId) return;

      final trailer = _preferredLocalTrailer(trailers);
      if (trailer != null) {
        localRes = await _resolverForClient(client)
            .resolve(
              trailer,
              deviceProfile: _trailerDeviceProfile(),
              enableDirectPlay: true,
              enableDirectStream: true,
              enableTranscoding: true,
            )
            .timeout(_trailerResolveTimeout);
        if (!mounted || resolveId != _trailerResolveId) return;
        streamUrl = localRes.streamUrl;
      }
    } catch (error, stack) {
      _trailerLog.w(
        'Local trailer resolution failed for ${item.itemId}',
        error: error,
        stackTrace: stack,
      );
    }

    List<Map<String, dynamic>> remoteTrailers = item.remoteTrailers;
    if (remoteTrailers.isEmpty) {
      try {
        final fullItem = await client.itemsApi.getItem(item.itemId);
        if (!mounted || resolveId != _trailerResolveId) return;
        remoteTrailers =
            (fullItem['RemoteTrailers'] as List?)
                ?.cast<Map<String, dynamic>>() ??
            const [];
      } catch (_) {}
    }

    if (streamUrl == null && remoteTrailers.isNotEmpty) {
      for (final trailer in remoteTrailers) {
        final url = trailer['Url'] as String?;
        if (url == null) continue;
        final videoId = YouTubeStreamResolver.extractVideoId(url);
        if (videoId != null) {
          sponsorBlockVideoId = videoId;
          if (supportsEmbeddedYouTube) {
            youTubeVideoId = videoId;
            break;
          }
          if (!webOnly) {
            streamUrl = await YouTubeStreamResolver.resolveFromUrl(
              url,
            ).timeout(_trailerResolveTimeout, onTimeout: () => null);
            if (streamUrl != null) {
              useYouTubeHeaders = true;
            }
          }
        } else if (!webOnly) {
          streamUrl = url;
        }
        if (!mounted || resolveId != _trailerResolveId) return;
        if (streamUrl != null) break;
      }
    }

    if (!mounted || resolveId != _trailerResolveId) return;

    if (youTubeVideoId != null) {
      _activeTrailerItemId = item.itemId;
      _pendingTrailerItemId = null;
      _pendingYouTubeVideoId = youTubeVideoId;
      await _tryRevealPreparedTrailer(item, resolveId);
      return;
    }

    if (webOnly) {
      // No media_kit/mpv backend in the browser; a local trailer plays through
      // an HTML <video> element (YouTube trailers use the iframe path above).
      if (streamUrl != null) {
        _activeTrailerItemId = item.itemId;
        _pendingTrailerItemId = null;
        _pendingWebTrailerUrl = streamUrl;
        if (sponsorBlockVideoId != null && sponsorBlockVideoId.isNotEmpty) {
          _startSponsorBlockTracking(sponsorBlockVideoId, resolveId);
        } else {
          _clearSponsorBlockTracking();
        }
        await _tryRevealPreparedTrailer(item, resolveId);
      } else if (_pendingTrailerItemId == item.itemId) {
        _pendingTrailerItemId = null;
      }
      return;
    }

    if (streamUrl == null) {
      if (_pendingTrailerItemId == item.itemId) {
        _pendingTrailerItemId = null;
      }
      return;
    }

    final localHeaders = useYouTubeHeaders
        ? YouTubeStreamResolver.youtubeHeaders
        : (localRes?.requestHeaders ?? const <String, String>{});

    try {
      final useMedia3 = _useMedia3TrailerEngine() && !webOnly;
      if (useMedia3) {
        _media3TrailerCompletedSub ??= _media3TrailerBackend!.completedStream
            .listen(_onTrailerCompleted);
        _trailerUsingMedia3 = true;
        // Another view (a row preview or a player screen) may have attached
        // since the last trailer, so reclaim control routing first.
        final persistentViewId = _media3PlatformViewId;
        if (persistentViewId != null) {
          await _media3TrailerBackend!.activateView(persistentViewId);
          if (!mounted || resolveId != _trailerResolveId) return;
        }
        await _media3TrailerBackend!.setVolume(0);
        if (!mounted || resolveId != _trailerResolveId) return;

        final payload = <String, dynamic>{
          'url': streamUrl,
          'mediaType': localRes?.mediaType ?? 'video',
          'preview': true,
          if (localHeaders.isNotEmpty) 'headers': localHeaders,
          if (localRes?.container != null) 'container': localRes!.container,
          if (localRes?.videoRangeType != null)
            'videoRangeType': localRes!.videoRangeType,
        };
        await _media3TrailerBackend.play(payload).timeout(_openTimeout);
        if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
          await _media3TrailerBackend.stop();
          return;
        }
      } else if (PlatformDetection.isAppleTV) {
        _trailerUsingAppleTv = true;
        final player = _ensureAppleTvTrailerPlayer();
        await player
            .open(
              streamUrl,
              headers: localHeaders.isNotEmpty ? localHeaders : null,
              volume: 0,
              backend: 'mpv',
            )
            .timeout(_openTimeout);
        if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
          await player.stop();
          return;
        }
        if (mounted) setState(() {});
      } else {
        _trailerUsingMedia3 = false;
        final player = _ensureTrailerPlayer();
        await player.setVolume(0);
        if (!mounted || resolveId != _trailerResolveId) return;

        final media = localHeaders.isNotEmpty
            ? Media(streamUrl, httpHeaders: localHeaders)
            : Media(streamUrl);
        await player.open(media).timeout(_openTimeout);
        if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
          await player.stop();
          return;
        }
      }

      setState(() {
        _activeTrailerItemId = item.itemId;
        _pendingTrailerItemId = null;
        _trailerVideoOpacity = 0;
      });

      if (sponsorBlockVideoId != null && sponsorBlockVideoId.isNotEmpty) {
        _startSponsorBlockTracking(sponsorBlockVideoId, resolveId);
      } else {
        _clearSponsorBlockTracking();
      }

      await _tryRevealPreparedTrailer(item, resolveId);
    } catch (error, stack) {
      _trailerLog.w(
        'Trailer preview playback failed for ${item.itemId}',
        error: error,
        stackTrace: stack,
      );
      _markTrailerFailed(item.itemId);
      // This item's stream failed; the bar keeps cycling.
      if (mounted) _cancelTrailerPreview(retainYouTubePlayer: true);
    }
  }

  Future<void> _tryRevealPreparedTrailer(
    MediaBarSlideItem item,
    int resolveId,
  ) async {
    if (!mounted || resolveId != _trailerResolveId) return;
    if (!_trailerRevealArmed) return;
    if (_activeTrailerItemId != item.itemId) return;
    if (!_trailerShouldBeActive()) return;

    await _audioArbiter.acquire(AudioProducer.mediaBarTrailer);
    if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
      _cancelTrailerPreview();
      return;
    }

    if (_pendingYouTubeVideoId != null) {
      _isTrailerPlaying = true;
      _autoAdvanceTimer?.cancel();
      setState(() {
        _activeYouTubeVideoId = _pendingYouTubeVideoId;
        // Native keeps the WebView booted between trailers; web recreates
        // per video (see the overlay key).
        if (!PlatformDetection.isWeb) {
          _retainedYouTubeVideoId = _pendingYouTubeVideoId;
        }
        _trailerVideoOpacity = PlatformDetection.isWeb ? 1.0 : 0.0;
      });
      _pendingYouTubeVideoId = null;
      return;
    }

    if (_activeYouTubeVideoId != null) {
      _isTrailerPlaying = true;
      _autoAdvanceTimer?.cancel();
      return;
    }

    if (_pendingWebTrailerUrl != null) {
      _isTrailerPlaying = true;
      _autoAdvanceTimer?.cancel();
      setState(() {
        _activeWebTrailerUrl = _pendingWebTrailerUrl;
        _trailerVideoOpacity = 1.0;
      });
      _pendingWebTrailerUrl = null;
      return;
    }

    if (_activeWebTrailerUrl != null) {
      _isTrailerPlaying = true;
      _autoAdvanceTimer?.cancel();
      return;
    }

    if (_trailerUsingMedia3) {
      final audioEnabled = widget.prefs.get(
        UserPreferences.mediaBarTrailerAudio,
      );
      try {
        await _media3TrailerBackend!.setVolume(audioEnabled ? 100 : 0);
        if (!mounted || resolveId != _trailerResolveId) return;

        await _media3TrailerBackend.resume();
        if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
          _cancelTrailerPreview();
          return;
        }
      } catch (_) {
        _markTrailerFailed(item.itemId);
        _cancelTrailerPreview();
        return;
      }

      _isTrailerPlaying = true;
      _autoAdvanceTimer?.cancel();
      await _waitForMedia3TrailerReady(resolveId);
      if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
        _cancelTrailerPreview();
        return;
      }

      if (_trailerVideoOpacity != 1) {
        setState(() => _trailerVideoOpacity = 1);
      }
      return;
    }

    if (_trailerUsingAppleTv) {
      final player = _appleTvTrailerPlayer;
      if (player == null) return;
      final audioEnabled = widget.prefs.get(
        UserPreferences.mediaBarTrailerAudio,
      );
      try {
        await player.setVolume(audioEnabled ? 100 : 0);
        if (!mounted || resolveId != _trailerResolveId) return;
        await player.resume();
        if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
          _cancelTrailerPreview();
          return;
        }
      } catch (_) {
        _markTrailerFailed(item.itemId);
        _cancelTrailerPreview();
        return;
      }
      _isTrailerPlaying = true;
      _autoAdvanceTimer?.cancel();
      if (_trailerVideoOpacity != 1) {
        setState(() => _trailerVideoOpacity = 1);
      }
      return;
    }

    final player = _trailerPlayer;
    if (player == null) return;

    final audioEnabled = widget.prefs.get(UserPreferences.mediaBarTrailerAudio);
    try {
      await player.setVolume(audioEnabled ? 100 : 0);
      if (!mounted || resolveId != _trailerResolveId) return;

      await player.play();
      if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
        _cancelTrailerPreview();
        return;
      }
    } catch (_) {
      _markTrailerFailed(item.itemId);
      _cancelTrailerPreview();
      return;
    }

    _isTrailerPlaying = true;
    _autoAdvanceTimer?.cancel();
    await _waitForMediaKitTrailerReady(player, resolveId);
    if (resolveId != _trailerResolveId || !_trailerShouldBeActive()) {
      _cancelTrailerPreview();
      return;
    }

    if (_trailerVideoOpacity != 1) {
      setState(() => _trailerVideoOpacity = 1);
    }
  }

  Future<bool> _waitForMedia3TrailerReady(int resolveId) async {
    if (!mounted || resolveId != _trailerResolveId) return false;

    var isPlaying = _media3TrailerBackend!.isPlaying;
    var isBuffering = _media3TrailerBackend.isBuffering;
    var buffered = _media3TrailerBackend.buffer;
    var position = _media3TrailerBackend.position;
    if (isPlaying &&
        (!isBuffering ||
            buffered > Duration.zero ||
            position > Duration.zero)) {
      return true;
    }

    final completer = Completer<bool>();
    late StreamSubscription<bool> playingSub;
    late StreamSubscription<bool> bufferingSub;
    late StreamSubscription<Duration> bufferSub;
    late StreamSubscription<Duration> positionSub;

    void checkReady() {
      if (!completer.isCompleted &&
          isPlaying &&
          (!isBuffering ||
              buffered > Duration.zero ||
              position > Duration.zero)) {
        completer.complete(true);
      }
    }

    playingSub = _media3TrailerBackend.playingStream.listen((value) {
      isPlaying = value;
      checkReady();
    });
    bufferingSub = _media3TrailerBackend.bufferingStream.listen((value) {
      isBuffering = value;
      checkReady();
    });
    bufferSub = _media3TrailerBackend.bufferStream.listen((value) {
      buffered = value;
      checkReady();
    });
    positionSub = _media3TrailerBackend.positionStream.listen((value) {
      position = value;
      checkReady();
    });

    try {
      return await completer.future.timeout(
        _trailerReadyTimeout,
        onTimeout: () => false,
      );
    } finally {
      await playingSub.cancel();
      await bufferingSub.cancel();
      await bufferSub.cancel();
      await positionSub.cancel();
    }
  }

  Future<bool> _waitForMediaKitTrailerReady(
    Player player,
    int resolveId,
  ) async {
    if (!mounted || resolveId != _trailerResolveId) return false;

    var isPlaying = player.state.playing;
    var isBuffering = player.state.buffering;
    var buffered = player.state.buffer;
    var position = player.state.position;
    if (isPlaying &&
        (!isBuffering ||
            buffered > Duration.zero ||
            position > Duration.zero)) {
      return true;
    }

    final completer = Completer<bool>();
    late StreamSubscription<bool> playingSub;
    late StreamSubscription<bool> bufferingSub;
    late StreamSubscription<Duration> bufferSub;
    late StreamSubscription<Duration> positionSub;

    void checkReady() {
      if (!completer.isCompleted &&
          isPlaying &&
          (!isBuffering ||
              buffered > Duration.zero ||
              position > Duration.zero)) {
        completer.complete(true);
      }
    }

    playingSub = player.stream.playing.listen((value) {
      isPlaying = value;
      checkReady();
    });
    bufferingSub = player.stream.buffering.listen((value) {
      isBuffering = value;
      checkReady();
    });
    bufferSub = player.stream.buffer.listen((value) {
      buffered = value;
      checkReady();
    });
    positionSub = player.stream.position.listen((value) {
      position = value;
      checkReady();
    });

    try {
      return await completer.future.timeout(
        _trailerReadyTimeout,
        onTimeout: () => false,
      );
    } finally {
      await playingSub.cancel();
      await bufferingSub.cancel();
      await bufferSub.cancel();
      await positionSub.cancel();
    }
  }

  AppleTvPreviewPlayer _ensureAppleTvTrailerPlayer() {
    final existing = _appleTvTrailerPlayer;
    if (existing != null) return existing;
    final player = AppleTvPreviewPlayer();
    _appleTvTrailerPlayer = player;
    _appleTvTrailerCompletedSub = player.completedStream.listen(
      (_) => _onTrailerCompleted(true),
    );
    return player;
  }

  Player _ensureTrailerPlayer() {
    final existing = _trailerPlayer;
    if (existing != null) return existing;

    final player = Player(
      configuration: const PlayerConfiguration(libass: false),
    );
    _trailerPlayer = player;
    _trailerCompletedSub = player.stream.completed.listen(_onTrailerCompleted);
    _trailerController = VideoController(
      player,
      configuration: VideoControllerConfiguration(
        hwdec: _trailerHwdecSetting(),
      ),
    );
    return player;
  }

  String? _trailerHwdecSetting() {
    if (!widget.prefs.get(UserPreferences.hardwareDecoding)) {
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

  Future<void> _disposeTrailerPlayer() async {
    _clearSponsorBlockTracking();
    _trailerCompletedSub?.cancel();
    _trailerCompletedSub = null;
    _media3TrailerCompletedSub?.cancel();
    _media3TrailerCompletedSub = null;
    _appleTvTrailerCompletedSub?.cancel();
    _appleTvTrailerCompletedSub = null;
    if (_trailerUsingMedia3) {
      _trailerUsingMedia3 = false;
      unawaited(_media3TrailerBackend!.stop());
    }
    if (_trailerUsingAppleTv) {
      _trailerUsingAppleTv = false;
    }
    final appleTvPlayer = _appleTvTrailerPlayer;
    _appleTvTrailerPlayer = null;
    unawaited(appleTvPlayer?.dispose());
    // Capture and null fields before the await so any code that wakes during
    // the async pause (e.g. a concurrent _loadTrailer call) sees null and
    // creates a fresh player rather than grabbing this half-disposed one.
    // This matches how the main video player already handles teardown.
    final player = _trailerPlayer;
    _trailerPlayer = null;
    _trailerController = null;
    await player?.stop();
    player?.dispose();
  }

  void _clearSponsorBlockTracking() {
    _sponsorBlockToken++;
    _trailerPositionSub?.cancel();
    _trailerPositionSub = null;
    _sponsorBlockSeekInFlight = false;
    _sponsorBlockSession.clear();
  }

  void _startSponsorBlockTracking(String videoId, int resolveId) {
    _clearSponsorBlockTracking();
    final token = ++_sponsorBlockToken;

    if (_trailerUsingMedia3) {
      _trailerPositionSub = _media3TrailerBackend!.positionStream.listen((
        position,
      ) {
        _handleSponsorBlockPosition(position);
      });
    } else {
      final player = _trailerPlayer;
      if (player == null) {
        return;
      }
      _trailerPositionSub = player.stream.position.listen((position) {
        _handleSponsorBlockPosition(position);
      });
    }

    unawaited(() async {
      final segments = await _sponsorBlockService.fetchSegments(
        videoId,
        categories: sponsorBlockDefaultCategories,
      );
      if (!mounted ||
          resolveId != _trailerResolveId ||
          token != _sponsorBlockToken) {
        return;
      }
      _sponsorBlockSession.setSegments(segments);
    }());
  }

  void _handleSponsorBlockPosition(Duration position) {
    if (_sponsorBlockSeekInFlight || !_isTrailerPlaying) {
      return;
    }

    final decision = _sponsorBlockSession.checkPosition(position);
    if (!decision.shouldSkip || decision.skipTo == null) {
      return;
    }

    final skipTo = decision.skipTo!;
    if (skipTo <= position + const Duration(milliseconds: 500)) {
      return;
    }

    _sponsorBlockSeekInFlight = true;
    unawaited(() async {
      try {
        if (_trailerUsingMedia3) {
          await _media3TrailerBackend!.seekTo(skipTo);
        } else {
          await _trailerPlayer?.seek(skipTo);
        }
      } catch (_) {
      } finally {
        _sponsorBlockSeekInFlight = false;
      }
    }());
  }

  void _onTrailerCompleted(bool completed) {
    if (!completed || !mounted) return;
    if (!_isTrailerPlaying || _activeTrailerItemId == null) return;

    _cancelTrailerPreview(retainYouTubePlayer: true);

    if (!_isHomeRouteActive || widget.externallyPaused || _isPaused) return;
    final items = widget.viewModel.items;
    if (items.length <= 1) return;

    final nextIndex = (_currentIndex + 1) % items.length;
    _goToPage(nextIndex);
  }

  MediaServerClient _clientForServer(String serverId) {
    final active = GetIt.instance<MediaServerClient>();
    if (active.baseUrl == serverId || serverId.isEmpty) {
      return active;
    }
    final factory = GetIt.instance<MediaServerClientFactory>();
    return factory.getClientIfExists(serverId) ?? active;
  }

  bool _supportsEmbeddedYouTubePreview() {
    // Prefer the iframe on every WebView platform (Android incl. TV); when no
    // WebView is available it reports unavailable and Media3 is the fallback.
    return _embeddedYouTubeAvailable &&
        (PlatformDetection.isWeb ||
            PlatformDetection.isAndroid ||
            PlatformDetection.isIOS ||
            PlatformDetection.isMacOS);
  }

  void _handleEmbeddedYouTubeUnavailable() {
    if (PlatformDetection.isWeb) {
      _markTrailerFailed(_activeTrailerItemId);
      _cancelTrailerPreview();
      return;
    }
    if (!_embeddedYouTubeAvailable) {
      return;
    }
    _embeddedYouTubeAvailable = false;

    final currentItem = widget.viewModel.items.elementAtOrNull(_currentIndex);
    final shouldRetryCurrentItem =
        _isHomeRouteActive &&
        !widget.externallyPaused &&
        currentItem != null &&
        _activeTrailerItemId == currentItem.itemId;

    _cancelTrailerPreview();

    if (!shouldRetryCurrentItem) {
      return;
    }

    _scheduleTrailerPreview(currentItem);
  }

  void _onYouTubePlaybackStarted() {
    if (!mounted || _activeYouTubeVideoId == null) {
      return;
    }

    _youTubeRevealTimer?.cancel();
    _youTubeRevealTimer = Timer(_youtubeRevealBufferDelay, () {
      if (!mounted || _activeYouTubeVideoId == null || !_isTrailerPlaying) {
        return;
      }
      if (_trailerVideoOpacity == 1) {
        return;
      }
      setState(() {
        _trailerVideoOpacity = 1;
      });
    });
  }

  void _handleYouTubeAutoplayFailed() {
    if (!mounted || _activeYouTubeVideoId == null) {
      return;
    }
    _handleEmbeddedYouTubeUnavailable();
  }

  /// Picks the local trailer item (raw map) to play, preferring one whose audio
  /// matches the user's default audio language and falling back to the first.
  Map<String, dynamic>? _preferredLocalTrailer(
    List<Map<String, dynamic>> items,
  ) {
    Map<String, dynamic>? firstWithId;
    for (final item in items) {
      final id = item['Id']?.toString();
      if (id != null && id.isNotEmpty) {
        firstWithId = item;
        break;
      }
    }
    if (firstWithId == null) {
      return null;
    }

    final preferred = widget.prefs
        .get(UserPreferences.defaultAudioLanguage)
        .trim();
    if (preferred.isEmpty) {
      return firstWithId;
    }

    final preferredNormalized = normalizeLanguage(preferred);
    if (preferredNormalized.isEmpty) {
      return firstWithId;
    }
    final preferredIso3 = toIso3Language(preferredNormalized);

    for (final item in items) {
      final id = item['Id']?.toString();
      if (id == null || id.isEmpty) {
        continue;
      }

      final audioStreams = _audioStreamsFromRawTrailer(item);
      final hasMatch = audioStreams.any(
        (stream) => languageMatchesPreferred(
          (stream['Language'] as String?)?.trim(),
          preferredNormalized,
          preferredIso3,
        ),
      );
      if (hasMatch) {
        return item;
      }
    }

    return firstWithId;
  }

  MediaStreamResolver _resolverForClient(MediaServerClient client) {
    return switch (client.serverType) {
      ServerType.jellyfin => JellyfinPlugin(client).createStreamResolver(),
      ServerType.emby => EmbyPlugin(client).createStreamResolver(),
    };
  }

  Map<String, dynamic> _trailerDeviceProfile() {
    if (PlatformDetection.isWeb) {
      return buildHtmlVideoBackendDeviceProfile(widget.prefs);
    }
    // Reuse the real profile from the active backend so the preview advertises
    // the codecs, resolution, and bitrate the device supports instead of a bare
    // profile that makes the server fall back to a tiny transcode.
    return GetIt.instance<PlayerBackend>().getDeviceProfile();
  }

  List<Map<String, dynamic>> _audioStreamsFromRawTrailer(
    Map<String, dynamic> raw,
  ) {
    final List<Map<String, dynamic>> audio = <Map<String, dynamic>>[];

    final streams = (raw['MediaStreams'] as List?)?.whereType<Map>();
    if (streams != null) {
      for (final stream in streams) {
        final casted = stream.cast<String, dynamic>();
        if (casted['Type'] == 'Audio') {
          audio.add(casted);
        }
      }
    }

    final sources = (raw['MediaSources'] as List?)?.whereType<Map>();
    if (sources != null) {
      for (final source in sources) {
        final sourceStreams =
            (source['MediaStreams'] as List?)?.whereType<Map>() ??
            const <Map>[];
        for (final stream in sourceStreams) {
          final casted = stream.cast<String, dynamic>();
          if (casted['Type'] == 'Audio') {
            audio.add(casted);
          }
        }
      }
    }

    return audio;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = widget.viewModel.state;
    final mode = UserPreferences.normalizeMediaBarMode(
      widget.prefs.get(UserPreferences.mediaBarMode),
    );
    final useMakdStyle = mode == UserPreferences.mediaBarModeMakd;
    final useBookshelfStyle = mode == UserPreferences.mediaBarModeBookshelf;
    final useGalleryStyle = mode == UserPreferences.mediaBarModeGallery;

    return switch (state) {
      MediaBarLoading() => SizedBox(height: widget.height),
      MediaBarDisabled() => const SizedBox.shrink(),
      MediaBarError(message: final message) => _buildStatusPanel(
        context,
        title: l10n.mediaBarError,
        detail: message,
        showRetry: true,
      ),
      MediaBarReady(items: final items) =>
        items.isEmpty
            ? const SizedBox.shrink()
            : (useGalleryStyle
                  ? _buildGallerySlideshow(context, items)
                  : (useBookshelfStyle
                        ? _buildBookshelfSlideshow(context, items)
                        : (useMakdStyle
                              ? _buildMakdSlideshow(context, items)
                              : _buildSlideshow(context, items)))),
    };
  }

  Widget _buildStatusPanel(
    BuildContext context, {
    required String title,
    String? detail,
    bool showRetry = false,
  }) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColorScheme.scrim.withValues(alpha: 0.35),
            borderRadius: AppRadius.circular(12),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.cardBorder,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.slideshow, color: AppColorScheme.accent),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColorScheme.onSurface,
                        ),
                      ),
                      if (detail != null && detail.isNotEmpty)
                        Text(
                          detail,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColorScheme.onSurface.withValues(
                                  alpha: 0.85,
                                ),
                              ),
                        ),
                    ],
                  ),
                ),
                if (showRetry)
                  TextButton(
                    onPressed: () => widget.viewModel.load(context: context),
                    child: Text(AppLocalizations.of(context).retry),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlideshow(BuildContext context, List<MediaBarSlideItem> items) {
    final overlayColor = _mediaBarOverlayColor();
    final overlayOpacity = _mediaBarOverlayOpacity();
    final currentItem = items.elementAtOrNull(_currentIndex);

    final isMobile = PlatformDetection.useMobileUi;
    final isTablet =
        isMobile && MediaQuery.of(context).size.shortestSide >= 600;
    final hasLeftSidebar =
        !isMobile &&
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final logoLeftInset = 40.0 + (hasLeftSidebar ? 88.0 : 0.0);
    final infoHorizontalInset = hasLeftSidebar
        ? 72.0
        : (PlatformDetection.isTV ? 25.0 : 24.0);
    final navbarAtTop =
        isMobile &&
        (widget.prefs.get(UserPreferences.navbarPosition) ==
            NavbarPosition.top);
    final toolbarInset = navbarAtTop
        ? MediaQuery.of(context).padding.top + 60.0
        : 0.0;
    final hasVisibleTrailerVideo =
        (_activeYouTubeVideoId != null ||
            _activeWebTrailerUrl != null ||
            _trailerUsingMedia3 ||
            _trailerController != null) &&
        _trailerVideoOpacity > 0;

    return MouseRegion(
      onEnter: (_) => _setPaused(true),
      onExit: (_) => _setPaused(false),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.focusNode == null && PlatformDetection.useLeanbackUi,
        skipTraversal: true,
        onFocusChange: _handleFocusChange,
        onKeyEvent: (node, event) => _handleKeyEvent(event, items),
        child: GestureDetector(
          onTap: () => _navigateToItem(context, items),
          onLongPress: () => _navigateToItemAndPlay(context, items),
          child: Padding(
            padding: EdgeInsets.only(top: toolbarInset),
            child: SizedBox(
              height: widget.height - toolbarInset,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedOpacity(
                    opacity: hasVisibleTrailerVideo ? 0 : 1,
                    duration: const Duration(milliseconds: 250),
                    child: _BackdropLayer(
                      items: items,
                      currentIndex: _currentIndex,
                    ),
                  ),
                  ..._buildVideoOverlays(allowPersistentMedia3: true),
                  if(!_isTrailerPlaying) // no gradient when trailer playing
                    _GradientOverlay(
                      color: overlayColor,
                      opacity: overlayOpacity,
                    ),
                  if (items.length > 1)
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: _IndicatorDots(
                        count: items.length,
                        current: _currentIndex,
                        overlayColor: overlayColor,
                        overlayOpacity: overlayOpacity,
                      ),
                    ),
                  if (currentItem != null &&
                      currentItem.logoUrl != null &&
                      (!isMobile || isTablet))
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 56,
                      left: logoLeftInset,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: SizedBox(
                          key: ValueKey('logo_${currentItem.itemId}'),
                          width: 280,
                          height: 120,
                          child: _buildLogoWithShadow(currentItem.logoUrl!),
                        ),
                      ),
                    ),
                  if (currentItem != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        behavior: PlatformDetection.useMobileUi
                            ? HitTestBehavior.translucent
                            : HitTestBehavior.deferToChild,
                        onHorizontalDragEnd: PlatformDetection.useMobileUi
                            ? (details) {
                                final velocity = details.primaryVelocity ?? 0;
                                if (velocity < -300 &&
                                    _currentIndex < items.length - 1) {
                                  _goToPage(_currentIndex + 1);
                                } else if (velocity > 300 &&
                                    _currentIndex > 0) {
                                  _goToPage(_currentIndex - 1);
                                }
                              }
                            : null,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            key: ValueKey(
                              '${currentItem.itemId}_${_isTrailerPlaying ? 'compact' : 'full'}',
                            ),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isMobile &&
                                  !isTablet &&
                                  currentItem.logoUrl != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    bottom: 8,
                                  ),
                                  child: SizedBox(
                                    width: 180,
                                    height: 70,
                                    child: _buildLogoWithShadow(
                                      currentItem.logoUrl!,
                                    ),
                                  ),
                                ),
                              _SlideInfo(
                                item: currentItem,
                                ratings: widget.viewModel.ratingsFor(
                                  currentItem.itemId,
                                ),
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
                                compact: _isTrailerPlaying,
                                overlayColor: overlayColor,
                                overlayOpacity: overlayOpacity,
                                leftInset: infoHorizontalInset,
                                rightInset: infoHorizontalInset,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (items.length > 1 && !PlatformDetection.useMobileUi) ...[
                    if (!_hideLeftNavArrowForSidebar)
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: _NavArrow(
                            icon: Icons.chevron_left,
                            onTap: _currentIndex > 0
                                ? () => _goToPage(_currentIndex - 1)
                                : null,
                          ),
                        ),
                      ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _NavArrow(
                          icon: Icons.chevron_right,
                          onTap: () =>
                              _goToPage((_currentIndex + 1) % items.length),
                        ),
                      ),
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

  Widget _buildMakdSlideshow(
    BuildContext context,
    List<MediaBarSlideItem> items,
  ) {
    final currentItem = items.elementAtOrNull(_currentIndex);
    final currentRatings = currentItem == null
        ? const <String, double>{}
        : widget.viewModel.ratingsFor(currentItem.itemId);
    final overlayColor = _mediaBarOverlayColor();
    final overlayOpacity = _mediaBarOverlayOpacity();
    final isMobile = PlatformDetection.useMobileUi;
    final navbarAtTop =
        isMobile &&
        (widget.prefs.get(UserPreferences.navbarPosition) ==
            NavbarPosition.top);
    final toolbarInset = navbarAtTop
        ? MediaQuery.of(context).padding.top + 60.0
        : 0.0;
    final effectiveTopInset = isMobile ? 0.0 : toolbarInset;
    final contentWidth = (MediaQuery.of(context).size.width * 0.42).clamp(
      280.0,
      560.0,
    );
    final hasVisibleTrailerVideo =
        (_activeYouTubeVideoId != null ||
            _activeWebTrailerUrl != null ||
            _trailerUsingMedia3 ||
            _trailerController != null) &&
        _trailerVideoOpacity > 0;

    return MouseRegion(
      onEnter: (_) => _setPaused(true),
      onExit: (_) => _setPaused(false),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.focusNode == null && PlatformDetection.useLeanbackUi,
        skipTraversal: true,
        onFocusChange: _handleFocusChange,
        onKeyEvent: (node, event) => _handleKeyEvent(event, items),
        child: GestureDetector(
          onTap: () => _navigateToItem(context, items),
          onLongPress: () => _navigateToItemAndPlay(context, items),
          onHorizontalDragEnd: isMobile
              ? (details) {
                  final velocity = details.primaryVelocity ?? 0;
                  if (velocity < -300 && _currentIndex < items.length - 1) {
                    _goToPage(_currentIndex + 1);
                  } else if (velocity > 300 && _currentIndex > 0) {
                    _goToPage(_currentIndex - 1);
                  }
                }
              : null,
          child: Padding(
            padding: EdgeInsets.only(top: effectiveTopInset),
            child: SizedBox(
              height: widget.height - effectiveTopInset,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (!isMobile)
                    AnimatedOpacity(
                      opacity: hasVisibleTrailerVideo ? 0 : 1,
                      duration: const Duration(milliseconds: 250),
                      child: _BackdropLayer(
                        items: items,
                        currentIndex: _currentIndex,
                        zoomDuration: Duration(
                          milliseconds: widget.prefs.get(
                            UserPreferences.mediaBarIntervalMs,
                          ),
                        ),
                      ),
                    ),
                  if (!isMobile)
                    ..._buildVideoOverlays(allowPersistentMedia3: true),
                  if (!isMobile && !_isTrailerPlaying) // no gradient when trailer playing
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              overlayColor.withValues(
                                alpha: overlayOpacity * 0.78,
                              ),
                              overlayColor.withValues(
                                alpha: overlayOpacity * 0.46,
                              ),
                              overlayColor.withValues(
                                alpha: overlayOpacity * 0.06,
                              ),
                            ],
                            stops: const [0.0, 0.46, 1.0],
                          ),
                        ),
                      ),
                    ),
                  if (!isMobile && !_isTrailerPlaying) // no gradient when trailer playing
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              overlayColor.withValues(
                                alpha: overlayOpacity * 0.12,
                              ),
                              overlayColor.withValues(
                                alpha: overlayOpacity * 0.28,
                              ),
                              overlayColor.withValues(
                                alpha: overlayOpacity * 0.78,
                              ),
                            ],
                            stops: const [0.0, 0.48, 1.0],
                          ),
                        ),
                      ),
                    ),
                  if (currentItem != null && currentItem.logoUrl != null)
                    Builder(
                      builder: (context) {
                        final contentHeight = widget.height - effectiveTopInset;
                        final screenWidth = MediaQuery.of(context).size.width;
                        final logoTop = contentHeight * 0.22;
                        final logoWidth = (screenWidth * 0.45).clamp(
                          220.0,
                          640.0,
                        );
                        final logoHeight = (contentHeight * 0.35).clamp(
                          90.0,
                          300.0,
                        );
                        final mobileLogoHeight = (contentHeight * 0.18).clamp(
                          58.0,
                          112.0,
                        );
                        final mobileLogoWidth = (screenWidth * 0.7).clamp(
                          190.0,
                          380.0,
                        );
                        final mobileLogoTop =
                            (contentHeight * 0.5 - mobileLogoHeight / 2).clamp(
                              8.0,
                              contentHeight * 0.56,
                            );
                        return Positioned(
                          left: isMobile ? null : 50,
                          top: isMobile ? mobileLogoTop : logoTop,
                          child: AnimatedOpacity(
                            opacity: _isTrailerPlaying ? 0 : 1,
                            duration: const Duration(milliseconds: 250),
                            child: IgnorePointer(
                              ignoring: _isTrailerPlaying,
                              child: isMobile
                                  ? SizedBox(
                                      width: screenWidth,
                                      child: Center(
                                        child: AnimatedSwitcher(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          child: SizedBox(
                                            key: ValueKey(
                                              'makd_logo_${currentItem.itemId}',
                                            ),
                                            width: mobileLogoWidth,
                                            height: mobileLogoHeight,
                                            child: _buildLogoWithShadow(
                                              currentItem.logoUrl!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: SizedBox(
                                        key: ValueKey(
                                          'makd_logo_${currentItem.itemId}',
                                        ),
                                        width: logoWidth,
                                        height: logoHeight,
                                        child: _buildLogoWithShadow(
                                          currentItem.logoUrl!,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  if (currentItem != null)
                    Positioned(
                      left: isMobile ? 0 : 50,
                      right: isMobile ? 0 : null,
                      bottom: isMobile ? 24 : 20,
                      child: AnimatedOpacity(
                        opacity: _isTrailerPlaying ? 0 : 1,
                        duration: const Duration(milliseconds: 250),
                        child: IgnorePointer(
                          ignoring: _isTrailerPlaying,
                          child: Padding(
                            padding: isMobile
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : EdgeInsets.zero,
                            child: SizedBox(
                              width: isMobile ? null : contentWidth,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 320),
                                child: _MakdContent(
                                  key: ValueKey(
                                    'makd_content_${currentItem.itemId}',
                                  ),
                                  item: currentItem,
                                  ratings: currentRatings,
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
                                  isMobile: isMobile,
                                  onPlay: () =>
                                      _navigateToItemAndPlay(context, items),
                                  onInfo: () => _navigateToItem(context, items),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (items.length > 1 && !_isTrailerPlaying)
                    isMobile
                        ? Positioned(
                            bottom: 14,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: _MakdDots(
                                count: items.length,
                                current: _currentIndex,
                              ),
                            ),
                          )
                        : Positioned(
                            right: 20,
                            bottom: 24,
                            child: _MakdDots(
                              count: items.length,
                              current: _currentIndex,
                            ),
                          ),
                  if (items.length > 1 &&
                      !PlatformDetection.useMobileUi &&
                      !_isTrailerPlaying) ...[
                    if (!_hideLeftNavArrowForSidebar)
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: _NavArrow(
                            icon: Icons.chevron_left,
                            onTap: _currentIndex > 0
                                ? () => _goToPage(_currentIndex - 1)
                                : null,
                          ),
                        ),
                      ),
                    Positioned(
                      right: 44,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _NavArrow(
                          icon: Icons.chevron_right,
                          onTap: () =>
                              _goToPage((_currentIndex + 1) % items.length),
                        ),
                      ),
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

  Widget _buildBookshelfSlideshow(
    BuildContext context,
    List<MediaBarSlideItem> items,
  ) {
    final clampedIndex = _currentIndex.clamp(0, items.length - 1);
    if (clampedIndex != _currentIndex) {
      _currentIndex = clampedIndex;
    }

    final activeItem = items[clampedIndex];
    if (widget.viewModel.bookshelfDetailFor(activeItem.itemId) == null) {
      unawaited(widget.viewModel.ensureBookshelfDetail(activeItem.itemId));
    }

    return MouseRegion(
      onEnter: (_) => _setPaused(true),
      onExit: (_) => _setPaused(false),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.focusNode == null && PlatformDetection.useLeanbackUi,
        skipTraversal: true,
        onFocusChange: _handleFocusChange,
        onKeyEvent: (node, event) => _handleKeyEvent(event, items),
        child: SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              BookshelfLayout(
                items: items,
                activeIndex: clampedIndex,
                onSelect: _selectBookshelfIndex,
                onInfo: () => _navigateToItem(context, items),
                onPlay: () => _playFromBookshelf(context, items),
                detailFor: widget.viewModel.bookshelfDetailFor,
              ),
              if (_bookshelfLoadingOverlay)
                const Positioned.fill(child: _TheaterLoadingOverlay()),
            ],
          ),
        ),
      ),
    );
  }

  void _selectBookshelfIndex(int index) {
    final items = widget.viewModel.items;
    if (index < 0 || index >= items.length) return;
    if (index == _currentIndex) return;
    _goToPage(index);
    unawaited(widget.viewModel.ensureBookshelfDetail(items[index].itemId));
  }

  void _playFromBookshelf(BuildContext context, List<MediaBarSlideItem> items) {
    if (mounted) {
      setState(() => _bookshelfLoadingOverlay = true);
    }
    _navigateToItemAndPlay(context, items);
    Future<void>.delayed(const Duration(milliseconds: 1400), () {
      if (mounted && _bookshelfLoadingOverlay) {
        setState(() => _bookshelfLoadingOverlay = false);
      }
    });
  }

  Widget _buildGallerySlideshow(
    BuildContext context,
    List<MediaBarSlideItem> items,
  ) {
    final clampedIndex = _currentIndex.clamp(0, items.length - 1);
    if (clampedIndex != _currentIndex) {
      _currentIndex = clampedIndex;
    }

    final activeItem = items[clampedIndex];
    final useCoverflow =
        PlatformDetection.useMobileUi &&
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (!useCoverflow &&
        widget.viewModel.galleryDetailFor(activeItem.itemId) == null) {
      unawaited(widget.viewModel.ensureGalleryDetail(activeItem.itemId));
    }
    unawaited(widget.viewModel.ensureRatings(activeItem.itemId));

    final activeRatingsMap = widget.viewModel.ratingsFor(activeItem.itemId);
    final hasRatings =
        activeRatingsMap.isNotEmpty ||
        activeItem.communityRating != null ||
        activeItem.criticRating != null;
    final activeRatings = hasRatings
        ? RatingsRow(
            ratings: activeRatingsMap,
            communityRating: activeItem.communityRating,
            criticRating: activeItem.criticRating,
            enableAdditionalRatings: widget.prefs.get(
              UserPreferences.enableAdditionalRatings,
            ),
            enabledRatings: widget.prefs.get(UserPreferences.enabledRatings),
            showLabels: widget.prefs.get(UserPreferences.showRatingLabels),
            showBadges: false,
          )
        : null;

    final trailerOverlays = _buildVideoOverlays();
    final trailerVisible =
        (_activeYouTubeVideoId != null ||
            _activeWebTrailerUrl != null ||
            _trailerUsingMedia3 ||
            _trailerController != null) &&
        _trailerVideoOpacity > 0;
    final activeTrailer = trailerOverlays.isEmpty
        ? null
        : Stack(fit: StackFit.expand, children: trailerOverlays);

    final Widget gallery = useCoverflow
        ? GalleryCoverflow(
            items: items,
            activeIndex: clampedIndex,
            onSelect: _selectGalleryIndex,
            onInfo: () => _navigateToItem(context, items),
            onPlay: () => _playFromGallery(context, items),
            activeRatings: activeRatings,
            activeTrailer: activeTrailer,
            trailerActive: trailerVisible,
          )
        : GalleryLayout(
            items: items,
            activeIndex: clampedIndex,
            onSelect: _selectGalleryIndex,
            onInfo: () => _navigateToItem(context, items),
            detailFor: widget.viewModel.galleryDetailFor,
            activeRatings: activeRatings,
            activeTrailer: activeTrailer,
            trailerActive: trailerVisible,
          );

    return MouseRegion(
      onEnter: (_) => _setPaused(true),
      onExit: (_) => _setPaused(false),
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.focusNode == null && PlatformDetection.useLeanbackUi,
        skipTraversal: true,
        onFocusChange: _handleFocusChange,
        onKeyEvent: (node, event) => _handleKeyEvent(event, items),
        child: SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              gallery,
              if (_galleryLoadingOverlay)
                const Positioned.fill(child: _TheaterLoadingOverlay()),
            ],
          ),
        ),
      ),
    );
  }

  void _selectGalleryIndex(int index) {
    final items = widget.viewModel.items;
    if (index < 0 || index >= items.length) return;
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    _startAutoAdvance();
    // Keep the booted WebView across the slide change so the next YouTube
    // trailer starts fast.
    _cancelTrailerPreview(retainYouTubePlayer: true);
    _prefetchGalleryWindow(items, index);
    _scheduleTrailerPreview(items[index]);
  }

  void _playFromGallery(BuildContext context, List<MediaBarSlideItem> items) {
    if (mounted) {
      setState(() => _galleryLoadingOverlay = true);
    }
    _navigateToItemAndPlay(context, items);
    Future<void>.delayed(const Duration(milliseconds: 1400), () {
      if (mounted && _galleryLoadingOverlay) {
        setState(() => _galleryLoadingOverlay = false);
      }
    });
  }

  void _prefetchGalleryWindow(List<MediaBarSlideItem> items, int centerIndex) {
    if (!mounted || items.isEmpty) return;
    final pageSize = GalleryLayout.pageSize;
    final start = (centerIndex ~/ pageSize) * pageSize;
    final end = (start + pageSize * 2).clamp(0, items.length);
    for (var i = start; i < end; i++) {
      final url = items[i].backdropUrl;
      if (url == null) continue;
      precacheImage(
        ResizeImage(
          offlineAwareImageProvider(url),
          width: GalleryLayout.kBackdropDecodeWidth,
        ),
        context,
      );
    }
  }

  KeyEventResult _handleKeyEvent(
    KeyEvent event,
    List<MediaBarSlideItem> items,
  ) {
    final key = event.logicalKey;

    if (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter) {
      if (event is KeyDownEvent) {
        _keyDownTime ??= DateTime.now();
        return KeyEventResult.handled;
      }
      if (event is KeyRepeatEvent) {
        _keyDownTime ??= DateTime.now();
        return KeyEventResult.handled;
      }
      if (event is KeyUpEvent) {
        final now = DateTime.now();
        final downTime = _keyDownTime;
        _keyDownTime = null;
        final focusedAt = _lastFocusReceivedAt;
        final shouldSuppressBleedThrough =
            downTime == null &&
            focusedAt != null &&
            now.difference(focusedAt) < _focusActivationGuardDuration;
        if (shouldSuppressBleedThrough) {
          return KeyEventResult.handled;
        }
        if (downTime != null &&
            now.difference(downTime) >= _keyLongPressThreshold) {
          if (_isBookshelfMode()) {
            _playFromBookshelf(context, items);
          } else if (_isGalleryMode()) {
            _playFromGallery(context, items);
          } else {
            _navigateToItemAndPlay(context, items);
          }
        } else {
          _navigateToItem(context, items);
        }
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    if (key == LogicalKeyboardKey.arrowLeft) {
      if (_currentIndex > 0) {
        _goToPage(_currentIndex - 1);
      } else if (widget.onNavigateLeft != null) {
        widget.onNavigateLeft!();
      }
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowRight) {
      if (_isBookshelfMode()) {
        if (_currentIndex < items.length - 1) {
          _goToPage(_currentIndex + 1);
        }
      } else {
        _goToPage((_currentIndex + 1) % items.length);
      }
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown && widget.onNavigateDown != null) {
      unawaited(widget.onNavigateDown!());
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp) {
      widget.onNavigateUp?.call();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _navigateToItem(BuildContext context, List<MediaBarSlideItem> items) {
    final item = items.elementAtOrNull(_currentIndex);
    if (item != null) {
      _cancelTrailerPreview();
      context.push(Destinations.item(item.itemId, serverId: item.serverId));
    }
  }

  List<Widget> _buildVideoOverlays({bool allowPersistentMedia3 = false}) {
    final mountPersistentMedia3 =
        allowPersistentMedia3 && _shouldMountPersistentMedia3View;
    return [
      if (_trailerUsingMedia3 ||
          mountPersistentMedia3 ||
          _trailerController != null ||
          (_trailerUsingAppleTv && _appleTvTrailerPlayer?.textureId != null))
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              // The idle persistent view stays fully hidden; the native side
              // shows an opaque black cover when stopped.
              opacity: _trailerUsingMedia3 || !mountPersistentMedia3
                  ? _trailerVideoOpacity
                  : 0.0,
              duration: const Duration(milliseconds: 800),
              child: _trailerUsingMedia3 || mountPersistentMedia3
                  ? Media3VideoView(
                      fill: Colors.transparent,
                      role: 'preview',
                      onPlatformViewCreated: (id) =>
                          _media3PlatformViewId = id,
                    )
                  : _trailerUsingAppleTv
                  ? FittedBox(
                      fit: BoxFit.cover,
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: 1920,
                        height: 1080,
                        child: Texture(
                          textureId: _appleTvTrailerPlayer!.textureId!,
                        ),
                      ),
                    )
                  : Video(
                      controller: _trailerController!,
                      controls: NoVideoControls,
                      fit: BoxFit.cover,
                      pauseUponEnteringBackgroundMode: false,
                      fill: Colors.transparent,
                    ),
            ),
          ),
        ),
      if (_activeYouTubeVideoId != null || _retainedYouTubeVideoId != null)
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              // The retained (dormant) WebView must stay hidden even while a
              // Media3/local trailer reveals underneath at shared opacity.
              opacity: _activeYouTubeVideoId != null
                  ? _trailerVideoOpacity
                  : 0.0,
              duration: const Duration(milliseconds: 800),
              child: ClipRect(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const overscan = 1.03;
                    final w = constraints.maxWidth * overscan;
                    final h = constraints.maxHeight * overscan;
                    return OverflowBox(
                      minWidth: w,
                      minHeight: h,
                      maxWidth: w,
                      maxHeight: h,
                      child: WebYouTubeTrailer(
                        // Web swaps videos only via widget recreation; native
                        // keeps one WebView and swaps via loadVideoById.
                        key: PlatformDetection.isWeb
                            ? ValueKey(_activeYouTubeVideoId)
                            : const ValueKey('media-bar-embedded-yt'),
                        videoId:
                            (_activeYouTubeVideoId ?? _retainedYouTubeVideoId)!,
                        suspended: _activeYouTubeVideoId == null,
                        muted: !widget.prefs.get(
                          UserPreferences.mediaBarTrailerAudio,
                        ),
                        showControls: false,
                        ignorePointer: true,
                        loop: true,
                        onPlaybackStarted: _onYouTubePlaybackStarted,
                        onCompleted: () => _onTrailerCompleted(true),
                        onAutoplayFailed: _handleYouTubeAutoplayFailed,
                        onEmbeddedUnavailable:
                            _handleEmbeddedYouTubeUnavailable,
                        autoplayTimeout: const Duration(seconds: 7),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      if (_activeWebTrailerUrl != null)
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: _trailerVideoOpacity,
              duration: const Duration(milliseconds: 800),
              child: ClipRect(
                child: WebLocalTrailer(
                  key: ValueKey(_activeWebTrailerUrl),
                  url: _activeWebTrailerUrl!,
                  muted: !widget.prefs.get(
                    UserPreferences.mediaBarTrailerAudio,
                  ),
                  ignorePointer: true,
                  onCompleted: () => _onTrailerCompleted(true),
                  onError: () {
                    _markTrailerFailed(_activeTrailerItemId);
                    _cancelTrailerPreview();
                  },
                ),
              ),
            ),
          ),
        ),
    ];
  }

  void _navigateToItemAndPlay(
    BuildContext context,
    List<MediaBarSlideItem> items,
  ) {
    final item = items.elementAtOrNull(_currentIndex);
    if (item != null) {
      _cancelTrailerPreview();
      context.push(
        Destinations.item(item.itemId, serverId: item.serverId, autoPlay: true),
      );
    }
  }

  Widget _buildLogoWithShadow(String url) {
    Widget image() => OfflineAwareImage(
      imageUrl: url,
      fit: BoxFit.contain,
      alignment: Alignment.centerLeft,
      fadeInDuration: Duration.zero,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
    );
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 2,
          bottom: -2,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                AppColorScheme.scrim.withValues(alpha: 0.4),
                BlendMode.srcATop,
              ),
              child: image(),
            ),
          ),
        ),
        image(),
      ],
    );
  }
}

class _BackdropLayer extends StatelessWidget {
  final List<MediaBarSlideItem> items;
  final int currentIndex;

  /// When set, the backdrop slowly zooms (Ken Burns) over this duration
  final Duration? zoomDuration;

  const _BackdropLayer({
    required this.items,
    required this.currentIndex,
    this.zoomDuration,
  });

  @override
  Widget build(BuildContext context) {
    final url = (currentIndex >= 0 && currentIndex < items.length)
        ? items[currentIndex].backdropUrl
        : null;
    return RepaintBoundary(
      child: FullscreenBackdropSwitcher(
        imageUrl: url,
        duration: const Duration(milliseconds: 600),
        imageBuilder: (imageUrl) {
          final Widget image = BoundedNetworkImage(
            imageUrl: imageUrl,
            minWidth: 640,
            maxWidth: 1280,
            errorBuilder: (_, _, _) =>
                ColoredBox(color: AppColorScheme.background),
          );
          final zoom = zoomDuration;
          if (zoom == null) return image;
          return _KenBurnsImage(duration: zoom, child: image);
        },
      ),
    );
  }
}

class _KenBurnsImage extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const _KenBurnsImage({required this.child, required this.duration});

  @override
  State<_KenBurnsImage> createState() => _KenBurnsImageState();
}

class _KenBurnsImageState extends State<_KenBurnsImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
    _scale = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }
}

class _GradientOverlay extends StatelessWidget {
  final Color color;
  final double opacity;

  const _GradientOverlay({required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withValues(alpha: opacity * 0.3),
              color.withValues(alpha: opacity * 0.1),
              color.withValues(alpha: opacity * 0.8),
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavArrow({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          canRequestFocus: false,
          customBorder: const CircleBorder(),
          child: AnimatedOpacity(
            opacity: onTap != null ? 1.0 : 0.3,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.scrim.withValues(alpha: 0.4),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.cardBorder,
                ),
              ),
              child: Icon(
                icon,
                color: AppColorScheme.onSurface.withValues(alpha: 0.9),
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SlideInfo extends StatelessWidget {
  final MediaBarSlideItem item;
  final Map<String, double> ratings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;
  final bool compact;
  final Color overlayColor;
  final double overlayOpacity;
  final double leftInset;
  final double rightInset;

  const _SlideInfo({
    required this.item,
    required this.ratings,
    required this.enableAdditionalRatings,
    required this.enabledRatings,
    this.showLabels = true,
    this.showBadges = true,
    this.compact = false,
    required this.overlayColor,
    required this.overlayOpacity,
    this.leftInset = 1.0,
    this.rightInset = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = PlatformDetection.useMobileUi;
    final cardAlpha = (kIsWeb ? 1.0 : 0.75) * overlayOpacity;
    final glass = AppColorScheme.isGlass;

    final infoCard = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: compact ? 6 : 12),
      decoration: (compact || glass)
          ? null
          : BoxDecoration(
              color: overlayColor.withValues(alpha: cardAlpha.clamp(0.0, 1.0)),
              borderRadius: AppRadius.circular(16),
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.cardBorder,
              ),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _MetadataRow(item: item),
          if (!compact &&
              (ratings.isNotEmpty ||
                  item.communityRating != null ||
                  item.criticRating != null)) ...[
            const SizedBox(height: 6),
            RatingsRow(
              ratings: ratings,
              communityRating: item.communityRating,
              criticRating: item.criticRating,
              enableAdditionalRatings: enableAdditionalRatings,
              enabledRatings: enabledRatings,
              showLabels: showLabels,
              showBadges: showBadges,
            ),
          ],
          if (!compact) ...[
            const SizedBox(height: 8),
            SizedBox(
              height:
                  ((isMobile
                          ? theme.textTheme.bodySmall?.fontSize
                          : theme.textTheme.bodyMedium?.fontSize) ??
                      14) *
                  1.4 *
                  (isMobile ? 2 : 3),
              child: Text(
                cleanOverview(item.overview),
                style:
                    (isMobile
                            ? theme.textTheme.bodySmall
                            : theme.textTheme.bodyMedium)
                        ?.copyWith(
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.9,
                          ),
                          shadows: _textShadows,
                        ),
                maxLines: isMobile ? 2 : 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        left: leftInset,
        right: rightInset,
        bottom: isMobile ? 24 : 36,
      ),
      child: compact
          ? infoCard
          : glass
          ? GlassSurface(
              cornerRadius: 16,
              fallbackColor: Colors.transparent,
              child: infoCard,
            )
          : ClipRRect(
              borderRadius: AppRadius.circular(16),
              child: GlassSettings.blursBackdrop
                  ? BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: GlassSettings.capSigma(20),
                        sigmaY: GlassSettings.capSigma(20),
                      ),
                      child: infoCard,
                    )
                  : infoCard,
            ),
    );
  }
}

class _MetadataRow extends StatelessWidget {
  final MediaBarSlideItem item;

  const _MetadataRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parts = <Widget>[];

    if (item.year != null) {
      parts.add(_infoText(theme, item.year.toString()));
    }

    if (item.officialRating != null) {
      parts.add(_ratingBadge(theme, item.officialRating!));
    }

    if (item.itemType != 'Series' && item.runtime != null) {
      final h = item.runtime!.inHours;
      final m = item.runtime!.inMinutes.remainder(60);
      parts.add(_infoText(theme, h > 0 ? '${h}h ${m}m' : '${m}m'));
    }

    if (item.genres.isNotEmpty) {
      parts.add(_infoText(theme, item.genres.join(' \u2022 ')));
    }

    if (parts.isEmpty) return const SizedBox.shrink();

    final separated = <Widget>[];
    for (var i = 0; i < parts.length; i++) {
      separated.add(parts[i]);
      if (i < parts.length - 1) {
        separated.add(
          Text(
            ' \u2022 ',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.5),
              shadows: _textShadows,
            ),
          ),
        );
      }
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 2,
      runSpacing: 4,
      children: separated,
    );
  }

  Widget _infoText(ThemeData theme, String value) {
    return Text(
      value,
      style: theme.textTheme.bodySmall?.copyWith(
        color: AppColorScheme.onSurface.withValues(alpha: 0.9),
        fontWeight: FontWeight.w600,
        shadows: _textShadows,
      ),
    );
  }

  Widget _ratingBadge(ThemeData theme, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: ThemeRegistry.active.borders.chipBorder.color,
          ),
        ),
        borderRadius: AppRadius.circular(3),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: AppColorScheme.onSurface.withValues(alpha: 0.9),
          shadows: _textShadows,
        ),
      ),
    );
  }
}

class _IndicatorDots extends StatelessWidget {
  final int count;
  final int current;
  final Color overlayColor;
  final double overlayOpacity;

  const _IndicatorDots({
    required this.count,
    required this.current,
    required this.overlayColor,
    required this.overlayOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: overlayColor.withValues(alpha: overlayOpacity * 0.6),
          borderRadius: AppRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (i) {
            final isActive = i == current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 10 : 8,
              height: isActive ? 10 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? AppColorScheme.onSurface
                    : AppColorScheme.onSurface.withValues(alpha: 0.5),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _MakdDots extends StatelessWidget {
  final int count;
  final int current;

  const _MakdDots({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: isActive ? 9 : 7,
          height: isActive ? 9 : 7,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? AppColorScheme.onSurface
                : AppColorScheme.onSurface.withValues(alpha: 0.45),
          ),
        );
      }),
    );
  }
}

class _MakdContent extends StatelessWidget {
  final MediaBarSlideItem item;
  final Map<String, double> ratings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;
  final bool isMobile;
  final VoidCallback onPlay;
  final VoidCallback onInfo;

  const _MakdContent({
    super.key,
    required this.item,
    required this.ratings,
    required this.enableAdditionalRatings,
    required this.enabledRatings,
    required this.showLabels,
    required this.showBadges,
    required this.isMobile,
    required this.onPlay,
    required this.onInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final crossAxis = isMobile
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: crossAxis,
      mainAxisSize: MainAxisSize.min,
      children: [
        _MetadataRow(item: item),
        if (ratings.isNotEmpty ||
            item.communityRating != null ||
            item.criticRating != null) ...[
          const SizedBox(height: 6),
          RatingsRow(
            ratings: ratings,
            communityRating: item.communityRating,
            criticRating: item.criticRating,
            enableAdditionalRatings: enableAdditionalRatings,
            enabledRatings: enabledRatings,
            showLabels: showLabels,
            showBadges: showBadges,
          ),
        ],
        if (!isMobile && (item.overview?.isNotEmpty ?? false)) ...[
          const SizedBox(height: 10),
          Text(
            cleanOverview(item.overview),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.88),
              height: 1.38,
              shadows: _textShadows,
            ),
          ),
        ],
        const SizedBox(height: 14),
        if (!PlatformDetection.isTV)
          _MakdActionButtons(
            onPlay: onPlay,
            onInfo: onInfo,
            isMobile: isMobile,
          ),
      ],
    );
  }
}

class _MakdActionButtons extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onInfo;
  final bool isMobile;

  const _MakdActionButtons({
    required this.onPlay,
    required this.onInfo,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPlay,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 14 : 18,
              vertical: isMobile ? 7 : 10,
            ),
            decoration: BoxDecoration(
              color: AppColorScheme.buttonFocused,
              borderRadius: AppRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.play_arrow_rounded,
                  color: AppColorScheme.onButtonFocused,
                  size: isMobile ? 20 : 24,
                ),
                const SizedBox(width: 4),
                Text(
                  l10n.play,
                  style: TextStyle(
                    color: AppColorScheme.onButtonFocused,
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 14 : 17,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onInfo,
          child: Container(
            width: isMobile ? 36 : 46,
            height: isMobile ? 36 : 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorScheme.onSurface.withValues(alpha: 0.18),
              border: Border.all(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                width: 1.5,
              ),
            ),
            child: Icon(
              Icons.info_outline_rounded,
              color: AppColorScheme.onSurface,
              size: isMobile ? 18 : 22,
            ),
          ),
        ),
      ],
    );
  }
}

/// Theater-style loading treatment shown when Play is pressed in the Bookshelf
/// MediaBar style.
class _TheaterLoadingOverlay extends StatelessWidget {
  const _TheaterLoadingOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: AppColorScheme.scrim.withValues(alpha: 0.86),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColorScheme.accent,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'BUFFERING',
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColorScheme.onSurface,
                fontWeight: FontWeight.w900,
                letterSpacing: 4.0,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'OPTIMIZING FOR YOU',
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
