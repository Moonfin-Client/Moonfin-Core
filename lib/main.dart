import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:media_kit/media_kit.dart';
import 'package:moonfin_design/moonfin_design.dart' show LiquidGlassWidgets;
import 'package:path_provider/path_provider.dart';
import 'package:playback_core/playback_core.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'data/models/aggregated_item.dart';
import 'background/watch_next_background.dart' as watch_next_bg;
import 'data/services/carplay_service.dart';
import 'data/services/cast/airplay_command_bridge.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'data/services/background_download_coordinator.dart';
import 'data/services/download_notification_service.dart';
import 'data/services/push_messaging_service.dart';
import 'data/services/seerr_notification_service.dart';
import 'data/services/media_server_client_factory.dart';
import 'data/services/storage_path_service.dart';
import 'util/webview_environment.dart';
import 'data/services/theme_store_service.dart';
import 'di/injection.dart';
import 'playback/appletv_audio_now_playing_feeder.dart';
import 'playback/appletv_backend.dart';
import 'playback/audio_capability_profile.dart';
import 'playback/audio_capability_probe.dart';
import 'playback/audio_handler.dart';
import 'playback/codec_caps_repair.dart';
import 'playback/media_browse_service.dart';
import 'playback/mpris_service.dart';
import 'playback/playback_lifecycle_handler.dart';
import 'platform/web_runtime_config.dart';
import 'preference/preference_constants.dart';
import 'preference/user_preferences.dart';
import 'util/fullscreen_helper.dart';
import 'util/http_overrides_stub.dart'
    if (dart.library.io) 'util/http_overrides_io.dart';
import 'util/game_core_licenses.dart';
import 'util/platform_detection.dart';
import 'util/tv_image_cache_stub.dart'
    if (dart.library.io) 'util/tv_image_cache_io.dart';

DateTime? _lastIosRouteResync;

/// iOS-only audio route handling: observe output route changes to (a) pause when
/// the current output device disappears (AirPods removed, cable unplugged) and
/// (b) re-sync A/V when the output switches mid-playback (a new device connects,
/// or AirPlay/HomePod is selected), which otherwise leaves the player writing
/// to a stale clock and drifts audio out of sync.
void _attachIosAudioRouteHandling() {
  final session = AVAudioSession();
  session.routeChangeStream.listen((change) async {
    final manager = GetIt.instance<PlaybackManager>();
    switch (change.reason) {
      case AVAudioSessionRouteChangeReason.oldDeviceUnavailable:
        manager.pause();
        break;
      case AVAudioSessionRouteChangeReason.newDeviceAvailable:
      case AVAudioSessionRouteChangeReason.override:
        if (!manager.state.isPlaying) return;
        final now = DateTime.now();
        final last = _lastIosRouteResync;
        if (last != null &&
            now.difference(last) < const Duration(milliseconds: 500)) {
          return;
        }
        _lastIosRouteResync = now;
        // A same-position seek re-primes the player's audio/video clock without
        // an audible pause, realigning A/V after the output switch.
        await manager.seekTo(manager.state.position);
        break;
      default:
        break;
    }
  });
}

// The entry counts are generous on purpose: a library grid shows dozens of
// posters at once, so a small count evicts them after about two screenfuls and
// scrolling back re-decodes everything. maximumSizeBytes is what really bounds
// memory here.
void _configureImageCache() {
  final imageCache = PaintingBinding.instance.imageCache;
  if (PlatformDetection.isWeb) {
    imageCache.maximumSize = 400;
    imageCache.maximumSizeBytes = 96 << 20;
    return;
  }
  if (PlatformDetection.isMobile) {
    imageCache.maximumSize = 400;
    imageCache.maximumSizeBytes = 120 << 20;
    return;
  }

  if (PlatformDetection.isTV) {
    imageCache.maximumSize = 500;
    imageCache.maximumSizeBytes = 96 << 20;
    return;
  }

  imageCache.maximumSize = 600;
  imageCache.maximumSizeBytes = 256 << 20;
}

Future<void> _restoreWindowGeometry() async {
  final prefs = GetIt.instance<UserPreferences>();
  final w = prefs.get(UserPreferences.windowWidth);
  final h = prefs.get(UserPreferences.windowHeight);
  final x = prefs.get(UserPreferences.windowX);
  final y = prefs.get(UserPreferences.windowY);
  final startFullscreen = prefs.get(UserPreferences.windowFullscreen);
  final startMaximized =
      prefs.get(UserPreferences.windowMaximized) && !startFullscreen;

  const minW = 800.0;
  const minH = 500.0;
  final hasSavedGeometry = w >= minW && h >= minH;

  final options = WindowOptions(
    size: hasSavedGeometry ? Size(w, h) : const Size(1280, 720),
    minimumSize: const Size(minW, minH),
    center: !hasSavedGeometry && !startMaximized,
    skipTaskbar: false,
  );

  await windowManager.waitUntilReadyToShow(options, () async {
    if (hasSavedGeometry) {
      await windowManager.setPosition(Offset(x, y));
    }
    // Before show, so platforms that apply it right away never draw the
    // windowed size first.
    if (startMaximized) {
      await windowManager.maximize();
    }
    await windowManager.show();
    await windowManager.focus();
    if (startFullscreen) {
      // Delay slightly to let the window render its first frame before transitioning to fullscreen.
      // This avoids graphics context race conditions (black screens) and window layout artifacts.
      unawaited(Future.delayed(const Duration(milliseconds: 150), () async {
        await FullscreenHelper.setFullscreen(true);
      }));
    }
  });
}

/// Resolves whether this Android device is a TV, which decides the leanback UI
/// and the default playback engine.
Future<void> _detectAndSetTvMode() async {
  if (const bool.fromEnvironment('MOONFIN_FORCE_TV')) {
    PlatformDetection.setTvMode(true);
    return;
  }
  if (!PlatformDetection.isAndroid) return;
  const channel = MethodChannel('org.moonfin.androidtv/platform');
  const attempts = 3;
  for (var attempt = 0; attempt < attempts; attempt++) {
    try {
      final isTV = await channel.invokeMethod<bool>('isTvDevice');
      if (isTV != null) {
        PlatformDetection.setTvMode(isTV);
        return;
      }
    } catch (_) {}
    if (attempt < attempts - 1) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
  }
  debugPrint(
    'TV detection failed after $attempts attempts, continuing as a non-TV device',
  );
}

Future<void> _detectAndSetDisplayCapabilities() async {
  if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) return;
  try {
    const channel = MethodChannel('org.moonfin.androidtv/platform');
    final hdrTypes = await channel.invokeMethod<List<dynamic>>('displayHdrTypes');
    PlatformDetection.setDisplayHdrTypes(
      hdrTypes?.map((value) => value.toString()),
    );
  } catch (_) {}
}

Future<Map<String, dynamic>?> _queryCodecCaps(MethodChannel channel) async {
  final raw = await channel.invokeMethod<Map<dynamic, dynamic>>(
    'mediaCodecCapabilities',
    <String, dynamic>{
      'includeSoftwareDecoders': !PlatformDetection.isTV,
    },
  );
  return raw?.map((key, value) => MapEntry(key.toString(), value));
}

/// Re-probes in the background when the startup result looked degenerate.
/// The native query enumerates codecs on the platform main thread, so the
/// retries must never extend the launch path. The device profile is built
/// per playback, so a corrected result applied here still fixes the next
/// playback without a restart.
///
/// Backs off between attempts, since enumeration loses the race when the
/// device is busiest right after boot. Whatever the outcome the AVC floor
/// stays in place, so giving up degrades to extra transcodes rather than to
/// failed playback.
Future<void> _retryCodecCapsOffLaunchPath(MethodChannel channel) async {
  var delay = const Duration(seconds: 2);
  for (var i = 0; i < 4; i++) {
    await Future<void>.delayed(delay);
    delay *= 2;
    try {
      final caps = await _queryCodecCaps(channel);
      if (caps != null && !codecCapsLookDegenerate(caps)) {
        PlatformDetection.setMediaCodecCapabilities(caps);
        return;
      }
    } catch (_) {
      // A failed probe says nothing about the next one, so keep trying.
    }
  }
}

Future<void> _detectAndSetCodecCapabilities() async {
  if (!PlatformDetection.isAndroid) return;
  try {
    const channel = MethodChannel('org.moonfin.androidtv/platform');

    final codecCaps = await _queryCodecCaps(channel);
    if (codecCaps != null) {
      // A degenerate cold-start result would otherwise poison the device
      // profile until app restart, leaving playback broken rather than just
      // inefficient.
      final degenerate = codecCapsLookDegenerate(codecCaps);
      PlatformDetection.setMediaCodecCapabilities(
        degenerate ? withAvcFloor(codecCaps) : codecCaps,
      );
      if (degenerate) {
        unawaited(_retryCodecCapsOffLaunchPath(channel));
      }
      return;
    }

    final legacyDvCaps = await channel.invokeMethod<Map<dynamic, dynamic>>(
      'dolbyVisionCodecCapabilities',
    );
    PlatformDetection.setDolbyVisionCodecCapabilities(
      legacyDvCaps?.map(
        (key, value) => MapEntry(key.toString(), value == true),
      ),
    );
  } catch (_) {}
}

Future<void> _detectAndSetAetherCapabilities() async {
  const channel = MethodChannel('moonfin/ios_aether_control');
  Map<String, dynamic>? caps;
  try {
    final raw = await channel.invokeMethod<Map<dynamic, dynamic>>(
      'getCapabilities',
    );
    if (raw != null) {
      caps = raw.map((key, value) => MapEntry(key.toString(), value));
    }
  } catch (_) {}

  // Fallback mirrors AetherEngine's guaranteed baseline on the hardware the
  // deployment floors allow (iOS 16, macOS 14).
  PlatformDetection.setMediaCodecCapabilities(
    caps ??
        const {
          'supportsAvc': true,
          'avcMainLevel': 52,
          'supportsAvcHigh10': true,
          'avcHigh10Level': 52,
          'supportsHevc': true,
          'hevcMainLevel': 153,
          'supportsHevcMain10': true,
          'hevcMain10Level': 153,
          'supportsHevcDolbyVision': true,
          'supportsHevcHdr10': true,
          'supportsDvP5': true,
          'supportsDvP7': true,
          'supportsDvP8': true,
          'maxResolutionAvc': {'width': 3840, 'height': 2160},
          'maxResolutionHevc': {'width': 3840, 'height': 2160},
        },
  );
}

Future<void> _detectAndSetAppleTvCapabilities() async {
  const channel = MethodChannel('moonfin/appletv_video_control');
  Map<String, dynamic>? caps;
  try {
    final raw = await channel.invokeMethod<Map<dynamic, dynamic>>(
      'getCapabilities',
    );
    if (raw != null) {
      caps = raw.map((key, value) => MapEntry(key.toString(), value));
    }
  } catch (_) {}

  PlatformDetection.setMediaCodecCapabilities(
    caps ??
        const {
          'supportsAvc': true,
          'avcMainLevel': 52,
          'supportsAvcHigh10': true,
          'avcHigh10Level': 52,
          'supportsHevc': true,
          'hevcMainLevel': 153,
          'supportsHevcMain10': true,
          'hevcMain10Level': 153,
          'supportsHevcDolbyVision': true,
          'supportsHevcHdr10': true,
          'supportsDvP5': true,
          'supportsDvP8': true,
          'maxResolutionAvc': {'width': 3840, 'height': 2160},
          'maxResolutionHevc': {'width': 3840, 'height': 2160},
        },
  );
}

Future<void> _detectAndApplyAudioCapabilities(UserPreferences prefs) async {
  if (!AudioCapabilityProbe.isSupported) return;
  try {
    // Probe with a short retry so a startup enumeration race doesn't strand us
    // on an empty result, then publish so getDeviceProfile() picks it up.
    final profile = await AudioCapabilityProbe.queryWithRetry();
    AudioCapabilityProbe.apply(profile);

    // Installs migrated into manual mode carry only the toggles they had set
    // by hand, so fill the rest from the probe and every switch has a real
    // value.
    if (profile != null &&
        prefs.get(UserPreferences.audioPassthroughMode) ==
            AudioPassthroughMode.manual) {
      await prefs.seedAbsentPassthroughToggles();
    }

    // Re-probe whenever the audio route changes (e.g. the AVR is powered on
    // after launch) so detection self-heals without an app restart.
    AudioCapabilityProbe.listenForRouteChanges();
  } catch (_) {}
}

void _sweepImageCache(UserPreferences prefs, {bool throttle = false}) {
  final mb = prefs.get(UserPreferences.imageCacheLimitMb);
  unawaited(enforceImageCacheBudget(mb * 1024 * 1024, throttle: throttle));
}

class _ImageCacheSweepObserver with WidgetsBindingObserver {
  _ImageCacheSweepObserver(this._prefs);

  final UserPreferences _prefs;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    _sweepImageCache(_prefs, throttle: true);
  }
}

class _PreferenceWriteFlushObserver with WidgetsBindingObserver {
  _PreferenceWriteFlushObserver(this._prefs);

  final UserPreferences _prefs;
  bool _flushInProgress = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      unawaited(_flushPendingWrites());
    }
  }

  Future<void> _flushPendingWrites() async {
    if (_flushInProgress) {
      return;
    }
    _flushInProgress = true;
    try {
      await _prefs.flushPendingWrites();
    } catch (_) {
    } finally {
      _flushInProgress = false;
    }
  }
}

@pragma('vm:entry-point')
Future<void> watchNextBackgroundMain() => watch_next_bg.watchNextBackgroundMain();

void main() async {
  configureHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-warms the liquid_glass_widgets shader programs so the first glass
  // pane doesn't white-flash. Cheap no-op on tiers where the package
  // renderer is disabled, and the Impeller pipeline warm-up is deferred
  // past the first frame internally.
  await LiquidGlassWidgets.initialize();

  registerGameCoreLicenses();

  if (!PlatformDetection.isWeb && PlatformDetection.isWindows) {
    try {
      final appDataDir = await getApplicationSupportDirectory();
      final customPath = '${appDataDir.path}\\WebView2Data';
      gWebViewEnvironment = await WebViewEnvironment.create(
        settings: WebViewEnvironmentSettings(userDataFolder: customPath),
      );
    } catch (_) {}
  }

  if (PlatformDetection.isAppleTV) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          color: const Color(0xF2000000),
          padding: const EdgeInsets.all(28),
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Text(
              '${details.exceptionAsString()}\n\n${details.stack ?? ''}',
              style: const TextStyle(color: Color(0xFFFF6E6E), fontSize: 15),
            ),
          ),
        ),
      );
    };
  }

  if (PlatformDetection.isWeb) {
    await loadWebRuntimeConfig();
  }

  if (PlatformDetection.isDesktop) {
    await windowManager.ensureInitialized();
  }

  // Apple runs entirely on AetherEngine, so media_kit isn't initialized there
  // and its native libs are out of those builds.
  if (!PlatformDetection.isTizen &&
      !PlatformDetection.isAppleTV &&
      !PlatformDetection.isIOS &&
      !PlatformDetection.isMacOS) {
    MediaKit.ensureInitialized();
  }

  await _detectAndSetTvMode();
  await Future.wait([
    _detectAndSetDisplayCapabilities(),
    _detectAndSetCodecCapabilities(),
  ]);

  if (PlatformDetection.isAppleTV) {
    await _detectAndSetAppleTvCapabilities();
  }
  if (PlatformDetection.isIOS || PlatformDetection.isMacOS) {
    await _detectAndSetAetherCapabilities();
  }

  _configureImageCache();
  await configureImageDiskCache();

  // On Linux the GTK font pipeline loads fonts asynchronously. The first frame
  // can render before MaterialIcons and other fonts are ready, causing icons to
  // appear blank. Pumping a warm-up frame gives the font loader time to finish.
  // The issue is intermittent and goes away on re-run once the OS font cache
  // is warm, which confirms the timing root cause.
  if (PlatformDetection.isLinux ||
      PlatformDetection.isTizen ||
      PlatformDetection.isAppleTV) {
    WidgetsBinding.instance.scheduleWarmUpFrame();
  }

  if (PlatformDetection.isMobile) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    // Registered before runApp so a background/terminated push can be handled.
    // The handler itself is a no-op; the OS draws these notifications.
    try {
      FirebaseMessaging.onBackgroundMessage(pushBackgroundHandler);
    } catch (_) {}
  }

  await configureDependencies();

  // Registered before runApp so a CarPlay-only launch (no window scene, no
  // widgets) can browse and start playback.
  if (PlatformDetection.isIOS && !GetIt.instance.isRegistered<CarPlayService>()) {
    try {
      final carPlayService = CarPlayService(
        browse: GetIt.instance<MediaBrowseService>(),
        manager: GetIt.instance<PlaybackManager>(),
      )..start();
      GetIt.instance.registerSingleton<CarPlayService>(carPlayService);
    } catch (_) {}
  }

  final prefs = GetIt.instance<UserPreferences>();
  WidgetsBinding.instance.addObserver(_PreferenceWriteFlushObserver(prefs));
  WidgetsBinding.instance.addObserver(_ImageCacheSweepObserver(prefs));
  WidgetsBinding.instance.addPostFrameCallback((_) => _sweepImageCache(prefs));

  GetIt.instance<PlaybackManager>().queueService.queueChangedStream.listen((_) {
    final activeItem = GetIt.instance<PlaybackManager>().queueService.currentItem;
    if (activeItem is AggregatedItem) {
      prefs.unhideFromContinueWatching(activeItem.id);
      if (activeItem.seriesId != null && activeItem.seriesId!.isNotEmpty) {
        prefs.unhideFromContinueWatching(activeItem.seriesId!);
        prefs.unhideFromNextUp(activeItem.seriesId!);
      }
    }
  });

  // Register Theme Store themes before the active theme is resolved so a
  // store-saved theme applies on launch.
  await ThemeStoreService(
    GetIt.instance<StoragePathService>(),
  ).loadAndRegister();

  if (PlatformDetection.isDesktop) {
    await _restoreWindowGeometry();
  }

  // Audio and notification services are only needed once playback or a
  // download can happen, so they initialize after the first frame.
  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(_initDeferredStartupServices(prefs));
  });

  // tvOS: keep the system Now Playing card fed for music (the native
  // NowPlayingController handles video; audio has no view controller to feed it).
  if (PlatformDetection.isAppleTV &&
      !GetIt.instance.isRegistered<AppleTvAudioNowPlayingFeeder>()) {
    try {
      final feeder = AppleTvAudioNowPlayingFeeder(
        manager: GetIt.instance<PlaybackManager>(),
        clientFactory: GetIt.instance<MediaServerClientFactory>(),
        backend: GetIt.instance<AppleTvBackend>(),
      )..start();
      GetIt.instance.registerSingleton<AppleTvAudioNowPlayingFeeder>(feeder);
    } catch (_) {}
  }

  if (!GetIt.instance.isRegistered<PlaybackLifecycleHandler>()) {
    GetIt.instance.registerSingleton<PlaybackLifecycleHandler>(
      PlaybackLifecycleHandler(GetIt.instance<PlaybackManager>()),
    );
  }

  try {
    GetIt.instance<AirPlayCommandBridge>().start();
  } catch (_) {}

  runApp(const MoonfinApp());
}

/// Startup work that runs after the first frame. The internal order matters:
/// the Android audio session configuration must follow initAudioService.
Future<void> _initDeferredStartupServices(UserPreferences prefs) async {
  if (PlatformDetection.isMobile ||
      (PlatformDetection.isAndroid && PlatformDetection.isTV)) {
    try {
      await initAudioService(
        manager: GetIt.instance<PlaybackManager>(),
        clientFactory: GetIt.instance<MediaServerClientFactory>(),
      );
    } catch (e, st) {
      debugPrint('initAudioService failed (lock-screen controls disabled): $e\n$st');
    }
  }

  if (PlatformDetection.isLinux) {
    try {
      await initMprisService(
        manager: GetIt.instance<PlaybackManager>(),
        clientFactory: GetIt.instance<MediaServerClientFactory>(),
      );
    } catch (e, st) {
      debugPrint('initMprisService failed (MPRIS controls disabled): $e\n$st');
    }
  }

  await _detectAndApplyAudioCapabilities(prefs);

  try {
    await GetIt.instance<DownloadNotificationService>().initialize();
  } catch (_) {}

  // Starts the native download engine and re-attaches to any downloads that
  // ran while the app was suspended or dead. No-op where unsupported.
  try {
    await GetIt.instance<BackgroundDownloadCoordinator>().ensureInitialized();
  } catch (_) {}

  try {
    await GetIt.instance<SeerrNotificationService>().initialize();
    await GetIt.instance<SeerrNotificationService>().handleColdStart();
  } catch (_) {}

  if (PlatformDetection.isMobile) {
    try {
      await GetIt.instance<PushMessagingService>().initialize();
    } catch (_) {}
  }

  // Audio session ownership differs per platform:
  // - Android: MoonfinAudioHandler acquires audio focus per playback, and skips
  //   it when the backend manages focus itself like media3. We only configure
  //   the attributes here so the becomingNoisy handler below can pause on
  //   headphone unplug. We deliberately do not setActive(true) at startup: that
  //   focus grab goes stale before playback begins, which left Android Auto
  //   music muted, and it fights ExoPlayer's own focus.
  // - iOS: MoonfinAudioHandler claims a non-mixing `.playback` session when
  //   playback starts and releases it on stop, so the in-app player owns Control
  //   Center / lock-screen Now Playing and AirPods/remote controls. Here we only
  //   attach route handling (pause on disconnect, A/V re-sync on connect).
  if (PlatformDetection.isAndroid) {
    try {
      final session = await AudioSession.instance;
      await session.configure(AudioSessionConfiguration(
        androidAudioAttributes: AndroidAudioAttributes(
          contentType: AndroidAudioContentType.music,
          usage: AndroidAudioUsage.media,
        ),
      ));
      session.becomingNoisyEventStream.listen((_) {
        GetIt.instance<PlaybackManager>().pause();
      });
    } catch (_) {}
  } else if (PlatformDetection.isIOS) {
    try {
      _attachIosAudioRouteHandling();
    } catch (_) {}
  }
}
