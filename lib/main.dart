import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:media_kit/media_kit.dart';
import 'package:moonfin_design/moonfin_design.dart' show LiquidGlassWidgets;
import 'package:path_provider/path_provider.dart';
import 'package:playback_core/playback_core.dart';
import 'package:screen_retriever/screen_retriever.dart';
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
import 'data/services/crash_report_service.dart';
import 'data/services/log_service.dart';
import 'data/services/storage_path_service.dart';
import 'util/scroll_sensitivity_binding.dart';
import 'util/webview_environment.dart';
import 'data/services/theme_store_service.dart';
import 'di/injection.dart';
import 'playback/appletv_audio_now_playing_feeder.dart';
import 'playback/appletv_backend.dart';
import 'playback/audio_capability_profile.dart';
import 'playback/audio_capability_probe.dart';
import 'playback/audio_handler.dart';
import 'playback/codec_caps_repair.dart';
import 'playback/device_capability_cache.dart';
import 'playback/media_browse_service.dart';
import 'playback/mpris_service.dart';
import 'playback/playback_lifecycle_handler.dart';
import 'platform/web_runtime_config.dart';
import 'preference/preference_constants.dart';
import 'preference/user_preferences.dart';
import 'util/fullscreen_helper.dart';
import 'util/window_geometry.dart';
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

Timer? _crashFlushDebounce;

/// Routes uncaught Dart errors into the diagnostic buffer and the pending
/// crash store. Both handlers keep the console output they replace.
void _installCrashHandlers() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    _captureCrash(details.exception, details.stack);
  };
  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    // Returning true marks the error handled, which drops the engine's print.
    debugPrint('Uncaught: $error\n$stack');
    _captureCrash(error, stack);
    return true;
  };
}

void _captureCrash(Object error, StackTrace? stack) {
  try {
    final errorLine = error.toString().split('\n').first;
    final frameLine = stack?.toString().split('\n').first.trim() ?? '';
    final signature = '$errorLine @ $frameLine';

    final crashes = GetIt.instance<CrashReportService>();
    if (!crashes.shouldCapture(signature)) return;

    final logs = GetIt.instance<LogService>();
    logs.logCrash(
      'Uncaught: $errorLine',
      stack == null ? error : '$error\n$stack',
    );
    unawaited(crashes.record(signature, logs.exportText(maxEntries: 300)));

    // Debounced so a burst of errors settles before the upload, and so a
    // crash during startup waits for the session rather than racing it.
    _crashFlushDebounce?.cancel();
    _crashFlushDebounce = Timer(const Duration(seconds: 5), () {
      unawaited(crashes.flushPending());
    });
  } catch (_) {
    // The crash handler must never become a second crash.
  }
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
  final bounds = hasSavedGeometry
      ? fitBoundsToWorkAreas(Rect.fromLTWH(x, y, w, h), await _workAreas())
      : null;

  final options = WindowOptions(
    size: bounds?.size ?? const Size(1280, 720),
    minimumSize: const Size(minW, minH),
    center: !hasSavedGeometry && !startMaximized,
    skipTaskbar: false,
  );

  await windowManager.waitUntilReadyToShow(options, () async {
    if (bounds != null) {
      await windowManager.setPosition(bounds.topLeft);
    }
    // Before show, so platforms that apply it right away never draw the
    // windowed size first.
    if (startMaximized) {
      await windowManager.maximize();
    }
    await windowManager.show();
    await windowManager.focus();
  });

  // Fullscreen resizes the window, and doing that before the engine has drawn
  // leaves it laid out at the old size with the rest of the window black. The
  // timer this replaces was standing in for the first frame, which is a race
  // on a cold start.
  if (startFullscreen) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(FullscreenHelper.setFullscreen(true));
    });
  }
}

/// Usable areas of the attached displays, or an empty list when they cannot be
/// read, which leaves saved bounds alone rather than guessing at a screen.
Future<List<Rect>> _workAreas() async {
  try {
    return [
      for (final display in await screenRetriever.getAllDisplays())
        (display.visiblePosition ?? Offset.zero) &
            (display.visibleSize ?? display.size),
    ];
  } catch (_) {
    return const [];
  }
}

/// Applies the stored layout override before anything reads the platform
/// flags. Reads its own store instance because dependency injection has not
/// happened yet this early in startup.
Future<void> _applyInterfaceLayoutOverride() async {
  try {
    final store = PreferenceStore();
    await store.init();
    PlatformDetection.setInterfaceLayout(
      store.get(UserPreferences.interfaceLayout),
    );
  } catch (_) {}
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

/// Seeds the capability state from the last launch's good probe results.
///
/// On a cold boot the app can start before HDMI has finished negotiating, and
/// every probe then reports a device that can do nothing. Starting from the
/// persisted last-good answers means even the first playback of such a launch
/// gets a profile that matches the hardware. A probe that later succeeds
/// overwrites the seed in either direction.
Future<void> _seedCapabilitiesFromCache() async {
  final audio = await DeviceCapabilityCache.readMap(
    DeviceCapabilityCache.audioKey,
  );
  if (audio != null) {
    PlatformDetection.setAudioCapabilities(audio);
  }
  if (PlatformDetection.isAndroid) {
    // Read without the build key the probe path checks. Only a firmware
    // update can make this stale and the probe a moment later corrects it,
    // where a launch whose probe cant answer would otherwise run on the
    // H264 floor.
    final codecs = await DeviceCapabilityCache.readMap(
      DeviceCapabilityCache.codecKey,
    );
    if (codecs != null) {
      PlatformDetection.setMediaCodecCapabilities(codecs);
    }
  }
  if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
    final hdrTypes = await DeviceCapabilityCache.readStringList(
      DeviceCapabilityCache.displayHdrKey,
    );
    if (hdrTypes != null && hdrTypes.isNotEmpty) {
      PlatformDetection.setDisplayHdrTypes(hdrTypes);
    }
  }
}

/// Runs [attempt] with a doubling delay, first wait two seconds, and stops as
/// soon as one attempt reports done. An attempt that throws counts the same
/// as one that came up short, since a failed probe says nothing about the
/// next one.
Future<bool> _retryOffLaunchPath(Future<bool> Function() attempt) async {
  var delay = const Duration(seconds: 2);
  for (var i = 0; i < 4; i++) {
    await Future<void>.delayed(delay);
    delay *= 2;
    try {
      if (await attempt()) return true;
    } catch (_) {}
  }
  return false;
}

/// One display probe: applies and persists a non-empty answer. Returns false
/// on an empty one and throws when the channel does.
Future<bool> _probeDisplayHdrOnce() async {
  const channel = MethodChannel('org.moonfin.androidtv/platform');
  final hdrTypes = await channel.invokeMethod<List<dynamic>>('displayHdrTypes');
  final types = (hdrTypes ?? const [])
      .map((value) => value.toString())
      .toList(growable: false);
  if (types.isEmpty) return false;
  PlatformDetection.setDisplayHdrTypes(types);
  unawaited(
    DeviceCapabilityCache.writeStringList(
      DeviceCapabilityCache.displayHdrKey,
      types,
    ),
  );
  return true;
}

Future<void> _detectAndSetDisplayCapabilities() async {
  if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) return;
  try {
    if (await _probeDisplayHdrOnce()) return;
  } catch (_) {}
  // An empty list from a TV is a probe that ran before the display was up,
  // not an SDR panel, so the cached seed stays in place while the retries
  // run. Only a whole run of empty answers is believed.
  unawaited(_retryDisplayHdrOffLaunchPath());
}

/// When every retry still reports nothing, that emptiness is accepted as a
/// genuinely SDR display and the cache is cleared, which is how a box moved
/// to an SDR TV stops advertising HDR. A run where the channel only ever
/// threw proves nothing about the panel, so the seed stays.
Future<void> _retryDisplayHdrOffLaunchPath() async {
  var answered = false;
  final found = await _retryOffLaunchPath(() async {
    if (await _probeDisplayHdrOnce()) return true;
    answered = true;
    return false;
  });
  if (found || !answered) return;
  PlatformDetection.setDisplayHdrTypes(const []);
  await DeviceCapabilityCache.remove(DeviceCapabilityCache.displayHdrKey);
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

/// Re-probes in the background when the startup probe threw or came back
/// looking wrong. The native query enumerates codecs on the platform main
/// thread, so the retries must never extend the launch path. The device
/// profile is built per playback, so a corrected result applied here still
/// fixes the next playback without a restart.
///
/// Backs off between attempts, since enumeration loses the race when the
/// device is busiest right after boot. Every sound result is applied as it
/// arrives, and the retries only stop early once one carries HEVC, since a
/// result without it is either a partial enumeration worth another look or a
/// device that really lacks the decoder and loses nothing to the re-probes.
Future<void> _retryCodecCapsOffLaunchPath(MethodChannel channel) =>
    _retryOffLaunchPath(() => _applyCodecProbe(channel));

/// One probe: applies a sound answer and persists a complete one. Returns
/// true once the answer carries HEVC and throws when the channel does.
Future<bool> _applyCodecProbe(MethodChannel channel) async {
  final caps = await _queryCodecCaps(channel);
  if (caps == null || codecCapsLookDegenerate(caps)) return false;
  PlatformDetection.setMediaCodecCapabilities(caps);
  if (codecCapsLookIncomplete(caps)) return false;
  await _cacheCodecCaps(channel, caps);
  return true;
}

/// The OS build fingerprint, which is the key the codec cache is valid under.
/// Codec support only changes with a firmware update, and a firmware update
/// always changes the fingerprint.
Future<String?> _androidBuildFingerprint(MethodChannel channel) async {
  try {
    return await channel.invokeMethod<String>('buildFingerprint');
  } catch (_) {
    return null;
  }
}

Future<void> _cacheCodecCaps(
  MethodChannel channel,
  Map<String, dynamic> caps,
) async {
  final build = await _androidBuildFingerprint(channel);
  if (build == null) return;
  await DeviceCapabilityCache.writeMap(
    DeviceCapabilityCache.codecKey,
    caps,
    build: build,
  );
}

Future<void> _detectAndSetCodecCapabilities() async {
  if (!PlatformDetection.isAndroid) return;
  const channel = MethodChannel('org.moonfin.androidtv/platform');

  // What a chip decodes only changes with its firmware, so a sound result
  // saved under this build is the answer and the enumeration, the slowest
  // probe of the launch, is skipped entirely.
  final build = await _androidBuildFingerprint(channel);
  if (build != null) {
    final cached = await DeviceCapabilityCache.readMap(
      DeviceCapabilityCache.codecKey,
      build: build,
    );
    if (cached != null) {
      PlatformDetection.setMediaCodecCapabilities(cached);
      return;
    }
  }

  try {
    final codecCaps = await _queryCodecCaps(channel);
    if (codecCaps != null) {
      // A degenerate cold-start result would otherwise poison the device
      // profile until app restart, leaving playback broken rather than just
      // inefficient.
      final degenerate = codecCapsLookDegenerate(codecCaps);
      PlatformDetection.setMediaCodecCapabilities(
        degenerate ? withAvcFloor(codecCaps) : codecCaps,
      );
      // A result that cleared the AVC check can still be a partial
      // enumeration, seen in the field as a box whose HEVC decoder vanished
      // for one launch and every HEVC library transcoding until a restart.
      if (degenerate || codecCapsLookIncomplete(codecCaps)) {
        unawaited(_retryCodecCapsOffLaunchPath(channel));
      } else {
        unawaited(_cacheCodecCaps(channel, codecCaps));
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
  } catch (_) {
    // A probe that never answered, like a channel hit before the plugin
    // registered, leaves every codec flag false and the profile claiming the
    // device decodes nothing. The floor only lands when the seed left nothing
    // to keep, and the retries are the same recovery a degenerate answer gets.
    PlatformDetection.setMediaCodecCapabilities(
      codecCapsWithoutAProbe(PlatformDetection.mediaCodecCapabilitiesSnapshot),
    );
    unawaited(_retryCodecCapsOffLaunchPath(channel));
  }
}

Future<void> _detectAndSetAetherCapabilities() async {
  const channel = MethodChannel('moonfin/ios_aether_control');
  final caps = await _queryAppleVideoCaps(channel);

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

/// Queries an Apple video capability channel, preferring the last good
/// answer over the static baseline when the probe fails. Keyed to the OS
/// version, since that is what changes what these decoders can do.
Future<Map<String, dynamic>?> _queryAppleVideoCaps(
  MethodChannel channel,
) async {
  final build = PlatformDetection.osVersion;
  try {
    final raw = await channel.invokeMethod<Map<dynamic, dynamic>>(
      'getCapabilities',
    );
    if (raw != null) {
      final caps = raw.map((key, value) => MapEntry(key.toString(), value));
      unawaited(
        DeviceCapabilityCache.writeMap(
          DeviceCapabilityCache.appleVideoKey,
          caps,
          build: build,
        ),
      );
      return caps;
    }
  } catch (_) {}
  return DeviceCapabilityCache.readMap(
    DeviceCapabilityCache.appleVideoKey,
    build: build,
  );
}

Future<void> _detectAndSetAppleTvCapabilities() async {
  const channel = MethodChannel('moonfin/appletv_video_control');
  final caps = await _queryAppleVideoCaps(channel);

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
    // Probe with a retry window sized against an HDMI handshake, then publish
    // so getDeviceProfile() picks it up.
    final profile = await AudioCapabilityProbe.queryWithRetry();
    AudioCapabilityProbe.apply(profile);

    // A launch that still has no real answer keeps trying with a longer
    // backoff, since a box powered on with the app can take a while to bring
    // its audio outputs up.
    if (profile == null || AudioCapabilityProbe.looksEmpty(profile)) {
      unawaited(_retryAudioCapsOffLaunchPath());
    }

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

Future<void> _retryAudioCapsOffLaunchPath() =>
    _retryOffLaunchPath(() async {
      final profile = await AudioCapabilityProbe.query();
      if (profile == null || AudioCapabilityProbe.looksEmpty(profile)) {
        return false;
      }
      AudioCapabilityProbe.apply(profile);
      return true;
    });

void _sweepImageCache(UserPreferences prefs, {bool throttle = false}) {
  final mb = prefs.get(UserPreferences.imageCacheLimitMb);
  unawaited(enforceImageCacheBudget(mb * 1024 * 1024, throttle: throttle));
  unawaited(enforceGameArtworkCacheBudget(throttle: throttle));
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

/// Re-probes display, decoder and audio capabilities when the app comes back
/// to the foreground, which on a TV covers being woken from standby, the
/// moment the HDMI chain has just renegotiated, and is also the first moment
/// an engine that launched without an Activity has a platform channel to ask.
/// Only answers that carry something are applied here: an empty answer
/// mid-renegotiation must not clobber a good snapshot.
class _CapabilityRefreshObserver with WidgetsBindingObserver {
  static const _throttle = Duration(seconds: 30);
  DateTime? _lastRefresh;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final now = DateTime.now();
    final last = _lastRefresh;
    if (last != null && now.difference(last) < _throttle) return;
    _lastRefresh = now;
    unawaited(_refresh());
  }

  Future<void> _refresh() async {
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
      try {
        await _probeDisplayHdrOnce();
      } catch (_) {}
    }
    // The launch retries all run inside the first half minute, which covers
    // a slow enumeration but not an engine that had no Activity to answer
    // the probe until now. A device with no HEVC decoder pays one
    // enumeration per resume for this and keeps its answer.
    if (PlatformDetection.isAndroid &&
        codecCapsLookIncomplete(
          PlatformDetection.mediaCodecCapabilitiesSnapshot,
        )) {
      try {
        await _applyCodecProbe(
          const MethodChannel('org.moonfin.androidtv/platform'),
        );
      } catch (_) {}
    }
    if (AudioCapabilityProbe.isSupported) {
      // The guard inside apply keeps a null or unenumerated answer from
      // touching the last detection.
      AudioCapabilityProbe.apply(await AudioCapabilityProbe.query());
    }
  }
}

/// Desktop is the only place a mouse wheel is the main way to scroll, so the
/// setting stays inert elsewhere.
void _bindScrollSensitivity(UserPreferences prefs) {
  if (!PlatformDetection.useDesktopUi) return;
  void apply() {
    (WidgetsBinding.instance as ScrollSensitivityBinding).multiplier =
        prefs.get(UserPreferences.desktopScrollSensitivity) / 100;
  }

  apply();
  prefs.addListener(apply);
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
  ScrollSensitivityBinding.ensureInitialized();

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

  await _applyInterfaceLayoutOverride();
  await _detectAndSetTvMode();
  await _seedCapabilitiesFromCache();
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
  _installCrashHandlers();

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
  _bindScrollSensitivity(prefs);
  WidgetsBinding.instance.addObserver(_PreferenceWriteFlushObserver(prefs));
  WidgetsBinding.instance.addObserver(_ImageCacheSweepObserver(prefs));
  WidgetsBinding.instance.addObserver(_CapabilityRefreshObserver());
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
