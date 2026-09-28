import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'resilient_event_stream.dart';
import '../../../util/platform_detection.dart';

class NativeAirPlayChannel {
  static const _channel = MethodChannel('com.moonfin/native_cast');
  static Stream<Map<String, dynamic>>? _cachedEventStream;

  const NativeAirPlayChannel();

  static bool get _supported => PlatformDetection.isIOS;

  Future<void> pauseAirPlay() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('pauseAirPlay');
  }

  Future<void> playAirPlay() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('playAirPlay');
  }

  Future<void> seekAirPlay({required int positionTicks}) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('seekAirPlay', {'positionTicks': positionTicks});
  }

  Future<void> stopAirPlay() async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('stopAirPlay');
  }

  Future<void> loadAirPlay({
    required String url,
    String? title,
    int positionTicks = 0,
  }) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('loadAirPlay', {
      'url': url,
      'title': ?title,
      'positionTicks': positionTicks,
    });
  }

  Future<void> updateAirPlayPlaybackState({
    required bool isPlaying,
    required bool isBuffering,
    required int positionTicks,
  }) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('updateAirPlayPlaybackState', {
      'isPlaying': isPlaying,
      'isBuffering': isBuffering,
      'positionTicks': positionTicks,
    });
  }

  Stream<Map<String, dynamic>> airPlayEventStream() {
    if (!_supported) {
      return const Stream<Map<String, dynamic>>.empty();
    }
    return _cachedEventStream ??= resilientEventChannelStream(
      'com.moonfin/native_airplay_events',
    ).map((event) {
      if (event is Map) {
        return event.cast<String, dynamic>();
      }
      return <String, dynamic>{};
    }).where((event) => event.isNotEmpty);
  }

  @visibleForTesting
  static void resetForTesting() {
    _cachedEventStream = null;
  }
}
