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
import 'di/injection.dart';
import 'playback/audio_capability_profile.dart';
import 'playback/audio_handler.dart';
import 'playback/playback_lifecycle_handler.dart';
import 'platform/web_runtime_config.dart';
import 'preference/preference_constants.dart';
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
  if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) return;
  try {
    const channel = MethodChannel('org.moonfin.androidtv/platform');
    final audioCaps = await channel.invokeMethod<Map<dynamic, dynamic>>(
      'audioCapabilities',
    );
    if (audioCaps == null) {
      PlatformDetection.setAudioCapabilities(null);
      return;
    }

    final profile = AudioCapabilityProfile.fromMap(
      audioCaps.map((key, value) => MapEntry(key.toString(), value)),
    );

    PlatformDetection.setAudioCapabilities(profile.toMap());

    final hasAutoDetected = prefs.get(UserPreferences.audioPrefsAutoDetected);
    final hasPassthroughProbeSeeding =
        prefs.get(UserPreferences.audioPassthroughProbeSeeded);
    final hasOutputModeProbeSeeding =
        prefs.get(UserPreferences.audioOutputModeProbeSeeded);
    final hasSplitPrefsConfigured =
        prefs.containsPreference(UserPreferences.audioOutputMode) &&
        prefs.containsPreference(UserPreferences.ac3PassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.eac3PassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.eac3JocPassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.dtsCorePassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.dtsHdPassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.dtsXPassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.trueHdPassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.trueHdAtmosPassthroughEnabled) &&
        prefs.containsPreference(UserPreferences.audioFallbackCodec);

    if (hasAutoDetected &&
        hasSplitPrefsConfigured &&
        hasPassthroughProbeSeeding &&
        hasOutputModeProbeSeeding) {
      return;
    }

    final hasReceiverRoute =
        profile.activeRouteType == AudioRouteType.arc ||
        profile.activeRouteType == AudioRouteType.earc;

    final currentOutputMode = prefs.get(UserPreferences.audioOutputMode);
    if (!hasOutputModeProbeSeeding &&
        (currentOutputMode == AudioOutputMode.auto ||
            currentOutputMode == AudioOutputMode.avrPassthrough)) {
      final outputMode = hasReceiverRoute && profile.hasCompressedPassthroughRoute
          ? AudioOutputMode.avrPassthrough
          : AudioOutputMode.auto;
      await prefs.set(UserPreferences.audioOutputMode, outputMode);
    }

    if (!prefs.containsPreference(UserPreferences.audioFallbackCodec)) {
      await prefs.set(UserPreferences.audioFallbackCodec, AudioFallbackCodec.auto);
    }

    if (!hasPassthroughProbeSeeding) {
      await prefs.set(
        UserPreferences.ac3PassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughAc3,
      );
      await prefs.set(
        UserPreferences.eac3PassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughEac3,
      );
      await prefs.set(
        UserPreferences.eac3JocPassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughEac3Joc,
      );
      await prefs.set(
        UserPreferences.dtsCorePassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughDts,
      );
      await prefs.set(
        UserPreferences.dtsHdPassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughDtsHd,
      );
      await prefs.set(
        UserPreferences.dtsXPassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughDtsX,
      );
      await prefs.set(
        UserPreferences.trueHdPassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughTrueHd,
      );
      await prefs.set(
        UserPreferences.trueHdAtmosPassthroughEnabled,
        hasReceiverRoute && profile.canPassthroughTrueHdJoc,
      );
      await prefs.set(UserPreferences.audioPassthroughProbeSeeded, true);
    }

    if (!hasOutputModeProbeSeeding) {
      await prefs.set(UserPreferences.audioOutputModeProbeSeeded, true);
    }
    await prefs.set(UserPreferences.audioPrefsAutoDetected, true);
  } catch (_) {}
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

  if (PlatformDetection.isDesktop) {
    await _restoreWindowGeometry();
  }

  final notificationService = GetIt.instance<DownloadNotificationService>();
  try {
    await notificationService.initialize();
  } catch (_) {}

  if (PlatformDetection.isMobile) {
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
  // - iOS: audio_service owns the AVAudioSession so that lock-screen / Control
  //   Center Now Playing works. Configuring/activating it again here would detach
  //   audio_service's Now Playing wiring, so we don't. Route handling (pause on
  //   disconnect, A/V re-sync on connect) is done in _attachIosAudioRouteHandling.
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
