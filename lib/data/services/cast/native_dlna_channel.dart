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

  /// The renderer's last playback state (`playing`, `paused`, ...).
  static String? _lastState;

  /// When the renderer was first seen paused, by the phone or its remote.
  static DateTime? _pausedSince;

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
    await _channel.invokeMethod<void>('playToDlnaDevice', {
      'targetId': targetId,
      'streamUrl': streamUrl,
      'title': title,
      'mimeType': mimeType,
      'dlnaFeatures': dlnaFeatures,
      'startPositionTicks': ?startPositionTicks,
      'durationTicks': ?durationTicks,
    });
    // The renderer took the stream: its positions count from its start now.
    _positionOffsetTicks = positionOffsetTicks;
    _lastPositionTicks = positionOffsetTicks;
    _pausedSince = null;
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
            final state = map['state'];
            if (state is String && _playbackStates.contains(state)) {
              // The native side leaves a position of 0 out.
              final position = map['positionTicks'];
              map['positionTicks'] =
                  (position is int ? position : 0) + _positionOffsetTicks;
              _lastPositionTicks = map['positionTicks'] as int;
              if (state == 'paused') {
                _pausedSince ??= DateTime.now();
              } else if (state == 'playing') {
                _pausedSince = null;
              }
              _lastState = state;
            }
            return map;
          }
          return <String, dynamic>{};
        })
        .where((event) => event.isNotEmpty);
  }

  static const _playbackStates = {'playing', 'paused', 'buffering', 'idle'};

  /// The renderer's last reported position, on the media's timeline.
  int get lastPositionTicks => _lastPositionTicks;

  /// Whether the renderer last said it was paused.
  bool get lastReportedPaused => _lastState == 'paused';

  /// When the renderer was first seen paused, or null when it isn't.
  DateTime? get pausedSince => _pausedSince;

  @visibleForTesting
  static void resetForTesting() {
    _cachedEventStream = null;
    _positionOffsetTicks = 0;
    _lastPositionTicks = 0;
    _lastState = null;
    _pausedSince = null;
  }
}
