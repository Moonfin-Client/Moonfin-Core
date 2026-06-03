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

    final routePrefersAvrMode =
        profile.hasCompressedPassthroughRoute &&
        (profile.activeRouteType == AudioRouteType.arc ||
            profile.activeRouteType == AudioRouteType.earc);
    final outputMode = routePrefersAvrMode
        ? AudioOutputMode.avrPassthrough
        : AudioOutputMode.auto;

    final currentOutputMode = prefs.get(UserPreferences.audioOutputMode);
    if (!hasOutputModeProbeSeeding &&
        (currentOutputMode == AudioOutputMode.auto ||
            currentOutputMode == AudioOutputMode.avrPassthrough)) {
      await prefs.set(UserPreferences.audioOutputMode, outputMode);
    }

    if (!prefs.containsPreference(UserPreferences.audioFallbackCodec)) {
      await prefs.set(UserPreferences.audioFallbackCodec, AudioFallbackCodec.auto);
    }

    if (!hasPassthroughProbeSeeding) {
      await prefs.set(
        UserPreferences.ac3PassthroughEnabled,
        profile.canPassthroughAc3,
      );
      await prefs.set(
        UserPreferences.eac3PassthroughEnabled,
        profile.canPassthroughEac3,
      );
      await prefs.set(
        UserPreferences.eac3JocPassthroughEnabled,
        profile.canPassthroughEac3Joc,
      );
      await prefs.set(
        UserPreferences.dtsCorePassthroughEnabled,
        profile.canPassthroughDts,
      );
      await prefs.set(
        UserPreferences.dtsHdPassthroughEnabled,
        profile.canPassthroughDtsHd,
      );
      await prefs.set(
        UserPreferences.dtsXPassthroughEnabled,
        profile.canPassthroughDtsX,
      );
      await prefs.set(
        UserPreferences.trueHdPassthroughEnabled,
        profile.canPassthroughTrueHd,
      );
      await prefs.set(
        UserPreferences.trueHdAtmosPassthroughEnabled,
        profile.canPassthroughTrueHdJoc,
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

  if (PlatformDetection.isWeb) {
    await loadWebRuntimeConfig();
  }

  if (PlatformDetection.isDesktop) {
    await windowManager.ensureInitialized();
  }

  // media_kit (libmpv) has no Tizen implementation; Tizen plays via
  // TizenPlayerBackend (the native AVPlay-backed video_player). Initializing it
  // there would fail to load libmpv.
  if (!PlatformDetection.isTizen) {
    MediaKit.ensureInitialized();
  }

  await _detectAndSetTvMode();
  await Future.wait([
    _detectAndSetDisplayCapabilities(),
    _detectAndSetCodecCapabilities(),
  ]);

  _configureImageCache();

  // On Linux the GTK font pipeline loads fonts asynchronously. The first frame
  // can render before MaterialIcons and other fonts are ready, causing icons to
  // appear blank. Pumping a warm-up frame gives the font loader time to finish.
  // The issue is intermittent and goes away on re-run once the OS font cache
  // is warm, which confirms the timing root cause.
  if (PlatformDetection.isLinux || PlatformDetection.isTizen) {
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
    } catch (_) {}
  }

  try {
    final session = await AudioSession.instance;
    final iosCategoryOptions =
        AVAudioSessionCategoryOptions.allowAirPlay |
        AVAudioSessionCategoryOptions.allowBluetooth |
        AVAudioSessionCategoryOptions.allowBluetoothA2dp;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playback,
      avAudioSessionCategoryOptions: iosCategoryOptions,
      androidAudioAttributes: AndroidAudioAttributes(
        contentType: AndroidAudioContentType.music,
        usage: AndroidAudioUsage.media,
      ),
    ));
    await session.setActive(true);
  } catch (_) {}

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
