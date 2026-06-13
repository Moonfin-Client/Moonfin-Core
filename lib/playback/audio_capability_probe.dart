import 'dart:async';

import 'package:flutter/services.dart';

import '../util/platform_detection.dart';
import 'audio_capability_profile.dart';

/// Cross-platform front-end for the native audio capability probe.
///
/// Android TV exposes a real probe (codec passthrough + route) over the
/// platform method channel; tvOS exposes a channel-count / route probe via
/// `AVAudioSession`. Both return a map shaped for
/// [AudioCapabilityProfile.fromMap]. Other platforms have no probe.
///
/// Used by app startup ([query]/[queryWithRetry]) and by the audio settings
/// screen's "Re-detect" action.
class AudioCapabilityProbe {
  AudioCapabilityProbe._();

  static const _androidMethodChannel = MethodChannel(
    'org.moonfin.androidtv/platform',
  );
  static const _androidEventChannel = EventChannel(
    'org.moonfin.androidtv/audioCapabilitiesEvents',
  );
  static const _tvosMethodChannel = MethodChannel('moonfin/appletv_audio');
  static const _tvosEventChannel = EventChannel(
    'moonfin/appletv_audio_events',
  );

  /// Whether the running platform exposes a native probe.
  static bool get isSupported =>
      (PlatformDetection.isAndroid && PlatformDetection.isTV) ||
      PlatformDetection.isAppleTV;

  static MethodChannel? get _methodChannel {
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
      return _androidMethodChannel;
    }
    if (PlatformDetection.isAppleTV) {
      return _tvosMethodChannel;
    }
    return null;
  }

  static EventChannel? get _eventChannel {
    if (PlatformDetection.isAndroid && PlatformDetection.isTV) {
      return _androidEventChannel;
    }
    if (PlatformDetection.isAppleTV) {
      return _tvosEventChannel;
    }
    return null;
  }

  /// Queries the native probe once. Returns null if unsupported or the probe
  /// returned nothing.
  static Future<AudioCapabilityProfile?> query() async {
    final channel = _methodChannel;
    if (channel == null) return null;
    try {
      final raw = await channel.invokeMethod<Map<dynamic, dynamic>>(
        'audioCapabilities',
      );
      if (raw == null) return null;
      return AudioCapabilityProfile.fromMap(
        raw.map((key, value) => MapEntry(key.toString(), value)),
      );
    } catch (_) {
      return null;
    }
  }

  // A result that looks like the "nothing connected / not yet enumerated"
  // fallback: no AVR route, no passthrough, stereo-only.
  static bool _looksEmpty(AudioCapabilityProfile p) =>
      p.activeRouteType == AudioRouteType.other &&
      !p.hasCompressedPassthroughRoute &&
      p.maxPcmChannels <= 2;

  /// Queries with a short backoff so a startup race (audio outputs not yet
  /// enumerated when the app launches) doesn't strand detection on an empty
  /// result. Returns the last non-null result, or null if every attempt failed.
  static Future<AudioCapabilityProfile?> queryWithRetry({
    int attempts = 3,
    Duration delay = const Duration(milliseconds: 200),
  }) async {
    AudioCapabilityProfile? last;
    for (var i = 0; i < attempts; i++) {
      final result = await query();
      if (result != null) {
        last = result;
        if (!_looksEmpty(result)) return result;
      }
      if (i < attempts - 1) {
        await Future<void>.delayed(delay);
      }
    }
    return last;
  }

  /// Publishes a freshly-detected profile to [PlatformDetection]; the next
  /// `getDeviceProfile()` (computed per playback) picks it up.
  static void apply(AudioCapabilityProfile? profile) {
    PlatformDetection.setAudioCapabilities(profile?.toMap());
  }

  /// Subscribes to native route-change events (HDMI/ARC/eARC connect/disconnect)
  /// and re-applies capabilities on each change. The subscription lives for the
  /// app's lifetime.
  static StreamSubscription<dynamic>? listenForRouteChanges() {
    final channel = _eventChannel;
    if (channel == null) return null;
    return channel.receiveBroadcastStream().listen(
      (event) {
        if (event is Map) {
          apply(
            AudioCapabilityProfile.fromMap(
              event.map((key, value) => MapEntry(key.toString(), value)),
            ),
          );
        }
      },
      onError: (_) {},
    );
  }
}
