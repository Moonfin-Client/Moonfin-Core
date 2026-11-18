import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cast_target.dart';
import 'resilient_event_stream.dart';
import '../../../l10n/current_app_localizations.dart';
import '../../../util/platform_detection.dart';

class NativeDlnaChannel {
  static const MethodChannel _channel = MethodChannel(
    'com.moonfin/native_dlna',
  );
  static Stream<Map<String, dynamic>>? _cachedEventStream;

  /// Where the stream on the renderer starts on the media's timeline. A
  /// renderer counts from its stream's start, so a stream Silo started past
  /// the beginning (a seek or resume of a remux) reports positions that need
  /// it added.
  static int _positionOffsetTicks = 0;

  /// The renderer's last reported position, on the media's timeline.
  static int _lastPositionTicks = 0;

  const NativeDlnaChannel();

  static bool get _supported => PlatformDetection.isMobile;

  Future<List<CastTarget>> discoverDlnaTargets() async {
    if (!_supported) {
      return const [];
    }
    final l10n = currentAppLocalizations();
    final raw = await _channel.invokeMethod<List<dynamic>>(
      'discoverDlnaTargets',
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
            kind: CastTargetKind.dlna,
            title: entry['title'] as String? ?? l10n.castDlna,
            subtitle: entry['subtitle'] as String? ?? '',
          ),
        )
        .where((target) => target.id.isNotEmpty)
        .toList();
  }

  /// Starts a continuous DLNA (SSDP) scan. Newly discovered renderers are
  /// emitted on [dlnaEventStream] as `{state: 'deviceFound', ...}` events.
  Future<void> startDlnaDiscovery() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('startDlnaDiscovery');
  }

  /// Stops the continuous DLNA scan started by [startDlnaDiscovery].
  Future<void> stopDlnaDiscovery() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('stopDlnaDiscovery');
  }

  Future<void> playToDlnaDevice({
    required String targetId,
    required String streamUrl,
    required String title,
    required String mimeType,
    required String dlnaFeatures,
    int? startPositionTicks,
    int? durationTicks,
    int positionOffsetTicks = 0,
  }) async {
    if (!_supported) {
      return;
    }
    _positionOffsetTicks = positionOffsetTicks;
    _lastPositionTicks = positionOffsetTicks;
    await _channel.invokeMethod<void>('playToDlnaDevice', {
      'targetId': targetId,
      'streamUrl': streamUrl,
      'title': title,
      'mimeType': mimeType,
      'dlnaFeatures': dlnaFeatures,
      'startPositionTicks': ?startPositionTicks,
      'durationTicks': ?durationTicks,
    });
  }

  Future<void> pauseDlna() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('pauseDlna');
  }

  Future<void> playDlna() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('playDlna');
  }

  Future<void> seekDlna({required int positionTicks}) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('seekDlna', {
      'positionTicks': positionTicks,
    });
  }

  Future<void> stopDlna() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('stopDlna');
  }

  Future<double?> getDlnaVolume() async {
    if (!_supported) {
      return null;
    }
    return _channel.invokeMethod<double>('getDlnaVolume');
  }

  Future<void> setDlnaVolume({required double volume}) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('setDlnaVolume', {'volume': volume});
  }

  Stream<Map<String, dynamic>> dlnaEventStream() {
    if (!_supported) {
      return const Stream<Map<String, dynamic>>.empty();
    }
    return _cachedEventStream ??= resilientEventChannelStream(
      'com.moonfin/native_dlna_events',
    )
        .map((event) {
          if (event is Map) {
            final map = Map<String, dynamic>.of(event.cast<String, dynamic>());
            final position = map['positionTicks'];
            if (position is int) {
              map['positionTicks'] = position + _positionOffsetTicks;
              _lastPositionTicks = map['positionTicks'] as int;
            }
            return map;
          }
          return <String, dynamic>{};
        })
        .where((event) => event.isNotEmpty);
  }

  /// The renderer's last reported position, on the media's timeline.
  int get lastPositionTicks => _lastPositionTicks;

  @visibleForTesting
  static void resetForTesting() {
    _cachedEventStream = null;
    _positionOffsetTicks = 0;
    _lastPositionTicks = 0;
  }
}
