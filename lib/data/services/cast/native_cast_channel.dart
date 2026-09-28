import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cast_target.dart';
import 'resilient_event_stream.dart';
import '../../../l10n/current_app_localizations.dart';
import '../../../util/platform_detection.dart';

class NativeCastChannel {
  static const MethodChannel _channel = MethodChannel(
    'com.moonfin/native_cast',
  );
  static Stream<Map<String, dynamic>>? _cachedEventStream;

  const NativeCastChannel();

  static bool get _supported => PlatformDetection.isMobile;

  Future<List<CastTarget>> discoverGoogleCastTargets() async {
    if (!_supported) {
      return const [];
    }
    final l10n = currentAppLocalizations();
    final raw = await _channel.invokeMethod<List<dynamic>>(
      'discoverGoogleCastTargets',
    );
    if (raw == null) {
      return const [];
    }

    return raw
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .map(
          (entry) => CastTarget(
            id: entry['id']?.toString() ?? '',
            kind: CastTargetKind.googleCast,
            title: entry['title'] as String? ?? l10n.castGoogleCast,
            subtitle: entry['subtitle'] as String? ?? '',
          ),
        )
        .where((target) => target.id.isNotEmpty)
        .toList();
  }

  /// Starts a continuous Google Cast (mDNS) scan. Newly discovered devices are
  /// emitted on [googleCastEventStream] as `{state: 'deviceFound', ...}` events.
  Future<void> startGoogleCastDiscovery() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('startGoogleCastDiscovery');
  }

  /// Stops the continuous Google Cast scan started by
  /// [startGoogleCastDiscovery].
  Future<void> stopGoogleCastDiscovery() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('stopGoogleCastDiscovery');
  }

  Future<void> startGoogleCastSession({
    required String targetId,
    required String streamUrl,
    required String title,
    String? contentType,
    String? subtitle,
    String? posterUrl,
    List<Map<String, dynamic>>? queueItems,
    int? startPositionTicks,
  }) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('startGoogleCastSession', {
      'targetId': targetId,
      'streamUrl': streamUrl,
      'contentType': ?contentType,
      'title': title,
      'subtitle': ?subtitle,
      'posterUrl': ?posterUrl,
      'queueItems': ?queueItems,
      'startPositionTicks': ?startPositionTicks,
    });
  }

  Future<void> showAirPlayRoutePicker() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('showAirPlayRoutePicker');
  }

  Future<bool> isAirPlayRoutePickerAvailable() async {
    if (!_supported) {
      return false;
    }
    return await _channel.invokeMethod<bool>('isAirPlayRoutePickerAvailable') ??
        false;
  }

  Future<void> pauseGoogleCast() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('pauseGoogleCast');
  }

  Future<void> playGoogleCast() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('playGoogleCast');
  }

  Future<void> seekGoogleCast({required int positionTicks}) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('seekGoogleCast', {
      'positionTicks': positionTicks,
    });
  }

  Future<void> stopGoogleCastSession() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('stopGoogleCastSession');
  }

  Future<double?> getGoogleCastVolume() async {
    if (!_supported) {
      return null;
    }
    return _channel.invokeMethod<double>('getGoogleCastVolume');
  }

  Future<void> setGoogleCastVolume({required double volume}) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('setGoogleCastVolume', {
      'volume': volume,
    });
  }

  Stream<Map<String, dynamic>> googleCastEventStream() {
    if (!_supported) {
      return const Stream<Map<String, dynamic>>.empty();
    }
    return _cachedEventStream ??= resilientEventChannelStream(
      'com.moonfin/native_cast_events',
    )
        .map((event) {
          if (event is Map) {
            return event.cast<String, dynamic>();
          }
          return <String, dynamic>{};
        })
        .where((event) => event.isNotEmpty);
  }

  @visibleForTesting
  static void resetForTesting() {
    _cachedEventStream = null;
  }
}
