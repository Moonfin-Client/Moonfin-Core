import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:media_kit/media_kit.dart';
import 'package:playback_core/playback_core.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'data/services/cast/airplay_command_bridge.dart';
import 'data/services/download_notification_service.dart';
import 'data/services/media_server_client_factory.dart';
import 'data/services/storage_path_service.dart';
import 'data/services/theme_store_service.dart';
import 'di/injection.dart';
import 'playback/appletv_audio_now_playing_feeder.dart';
import 'playback/appletv_mpv_backend.dart';
import 'playback/audio_capability_profile.dart';
import 'playback/audio_capability_probe.dart';
import 'playback/audio_handler.dart';
import 'playback/playback_lifecycle_handler.dart';
import 'platform/web_runtime_config.dart';
import 'preference/user_preferences.dart';
import 'util/platform_detection.dart';
import 'util/tv_image_cache_stub.dart'
    if (dart.library.io) 'util/tv_image_cache_io.dart';

DateTime? _lastIosRouteResync;

/// iOS-only audio route handling. audio_service owns the AVAudioSession, so we
/// observe route changes directly to (a) pause when the current output device
/// disappears (AirPods removed, cable unplugged) and (b) re-sync A/V when a new
/// output is connected mid-playback (AirPlay/HomePod), which otherwise leaves
/// libmpv writing to a stale clock and drifts audio out of sync.
void _attachIosAudioRouteHandling() {
  final session = AVAudioSession();
  session.routeChangeStream.listen((change) async {
    final manager = GetIt.instance<PlaybackManager>();
    switch (change.reason) {
      case AVAudioSessionRouteChangeReason.oldDeviceUnavailable:
        manager.pause();
        break;
      case AVAudioSessionRouteChangeReason.newDeviceAvailable:
        if (!manager.state.isPlaying) return;
        final now = DateTime.now();
        final last = _lastIosRouteResync;
        if (last != null &&
            now.difference(last) < const Duration(milliseconds: 500)) {
          return;
        }
        _lastIosRouteResync = now;
        // A same-position seek re-primes libmpv's audio/video clock without an
        // audible pause, realigning A/V after the output switch.
        await manager.seekTo(manager.state.position);
        break;
      default:
        break;
    }
  });
}

void _configureImageCache() {
  final imageCache = PaintingBinding.instance.imageCache;
  if (PlatformDetection.isWeb) {
    imageCache.maximumSize = 200;
    imageCache.maximumSizeBytes = 96 << 20;
    return;
  }
  if (PlatformDetection.isMobile) {
    imageCache.maximumSize = 100;
    imageCache.maximumSizeBytes = 120 << 20;
    return;
  }

  if (PlatformDetection.isTV) {
    imageCache.maximumSize = 120;
    imageCache.maximumSizeBytes = 96 << 20;
    return;
  }

  imageCache.maximumSize = 200;
  imageCache.maximumSizeBytes = 256 << 20;
}

Future<void> _restoreWindowGeometry() async {
  final prefs = GetIt.instance<UserPreferences>();
  final w = prefs.get(UserPreferences.windowWidth);
  final h = prefs.get(UserPreferences.windowHeight);
  final x = prefs.get(UserPreferences.windowX);
  final y = prefs.get(UserPreferences.windowY);

  const minW = 800.0;
  const minH = 500.0;
  final hasSavedGeometry = w >= minW && h >= minH;

  final options = WindowOptions(
    size: hasSavedGeometry ? Size(w, h) : const Size(1280, 720),
    minimumSize: const Size(minW, minH),
    center: !hasSavedGeometry,
    skipTaskbar: false,
  );

  await windowManager.waitUntilReadyToShow(options, () async {
    if (hasSavedGeometry) {
      await windowManager.setPosition(Offset(x, y));
    }
    await windowManager.show();
    await windowManager.focus();
  });
}

Future<void> _detectAndSetTvMode() async {
  if (!PlatformDetection.isAndroid) return;
  try {
    const channel = MethodChannel('org.moonfin.androidtv/platform');
    final isTV = await channel.invokeMethod<bool>('isTvDevice') ?? false;
    PlatformDetection.setTvMode(isTV);
  } catch (_) {}
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

Future<void> _detectAndSetCodecCapabilities() async {
  if (!PlatformDetection.isAndroid) return;
  try {
    const channel = MethodChannel('org.moonfin.androidtv/platform');

    final codecCaps = await channel.invokeMethod<Map<dynamic, dynamic>>(
      'mediaCodecCapabilities',
      <String, dynamic>{
        'includeSoftwareDecoders': !PlatformDetection.isTV,
      },
    );
    if (codecCaps != null) {
      PlatformDetection.setMediaCodecCapabilities(
        codecCaps.map((key, value) => MapEntry(key.toString(), value)),
      );
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

    // Passthrough is no longer seeded into the toggle prefs: the tri-state
    // resolvers compute it live from the detected capability, which also
    // auto-adapts to later route changes. Existing installs whose toggles were
    // auto-seeded by the old one-shot probe are migrated back to "Auto" once.
    if (profile != null) {
      await _migrateSeededPassthroughTogglesToAuto(prefs, profile);
    }

    // Re-probe whenever the audio route changes (e.g. the AVR is powered on
    // after launch) so detection self-heals without an app restart.
    AudioCapabilityProbe.listenForRouteChanges();
  } catch (_) {}
}

/// One-time migration for installs that ran the old startup seeding, which
/// copied probe results into the 8 passthrough toggle prefs. A stored value
/// that still matches what the probe would have seeded was almost certainly
/// auto-seeded (not a deliberate choice), so it is cleared to return the toggle
/// to tri-state "Auto". A value that differs is treated as a deliberate user
/// override and preserved.
Future<void> _migrateSeededPassthroughTogglesToAuto(
  UserPreferences prefs,
  AudioCapabilityProfile profile,
) async {
  if (prefs.get(UserPreferences.audioPassthroughMigratedToAuto)) return;

  if (prefs.get(UserPreferences.audioPassthroughProbeSeeded)) {
    final hasReceiverRoute =
        profile.activeRouteType == AudioRouteType.arc ||
        profile.activeRouteType == AudioRouteType.earc;
    final seededValues = {
      UserPreferences.ac3PassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughAc3,
      UserPreferences.eac3PassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughEac3,
      UserPreferences.eac3JocPassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughEac3Joc,
      UserPreferences.dtsCorePassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughDts,
      UserPreferences.dtsHdPassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughDtsHd,
      UserPreferences.dtsXPassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughDtsX,
      UserPreferences.trueHdPassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughTrueHd,
      UserPreferences.trueHdAtmosPassthroughEnabled:
          hasReceiverRoute && profile.canPassthroughTrueHdJoc,
    };
    for (final entry in seededValues.entries) {
      if (prefs.containsPreference(entry.key) &&
          prefs.get(entry.key) == entry.value) {
        await prefs.removePreference(entry.key);
      }
    }
  }

  await prefs.set(UserPreferences.audioPassthroughMigratedToAuto, true);
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  if (!PlatformDetection.isTizen && !PlatformDetection.isAppleTV) {
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

  _configureImageCache();
  await configureAppleTvImageCache();

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
  }

  await configureDependencies();

  final prefs = GetIt.instance<UserPreferences>();
  WidgetsBinding.instance.addObserver(_PreferenceWriteFlushObserver(prefs));
  await _detectAndApplyAudioCapabilities(prefs);

  // Register Theme Store themes before the active theme is resolved so a
  // store-saved theme applies on launch.
  await ThemeStoreService(
    GetIt.instance<StoragePathService>(),
  ).loadAndRegister();

  if (PlatformDetection.isDesktop) {
    await _restoreWindowGeometry();
  }

  final notificationService = GetIt.instance<DownloadNotificationService>();
  try {
    await notificationService.initialize();
  } catch (_) {}

  // Android TV also gets the MediaSession so music is controllable from the
  // system quick-access / screensaver after leaving the app. Apple
  // TV and Tizen are excluded: they have no audio_service backend (tvOS uses the
  // native NowPlayingController instead).
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

  // Audio session ownership differs per platform:
  // - Android: the audio_session package configures and activates the session for
  //   the foreground media notification.
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
      await session.setActive(true);
      session.becomingNoisyEventStream.listen((_) {
        GetIt.instance<PlaybackManager>().pause();
      });
    } catch (_) {}
  } else if (PlatformDetection.isIOS) {
    try {
      _attachIosAudioRouteHandling();
    } catch (_) {}
  }

  // tvOS: keep the system Now Playing card fed for music (the native
  // NowPlayingController handles video; audio has no view controller to feed it).
  if (PlatformDetection.isAppleTV &&
      !GetIt.instance.isRegistered<AppleTvAudioNowPlayingFeeder>()) {
    try {
      final feeder = AppleTvAudioNowPlayingFeeder(
        manager: GetIt.instance<PlaybackManager>(),
        clientFactory: GetIt.instance<MediaServerClientFactory>(),
        backend: GetIt.instance<AppleTvMpvBackend>(),
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
