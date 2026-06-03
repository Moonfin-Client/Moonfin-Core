import 'package:flutter/services.dart';

import 'cast_target.dart';
import '../../../l10n/current_app_localizations.dart';
import '../../../util/platform_detection.dart';

class NativeDlnaChannel {
  static const MethodChannel _channel = MethodChannel('com.moonfin/native_dlna');
  static const EventChannel _events = EventChannel('com.moonfin/native_dlna_events');
  static Stream<Map<String, dynamic>>? _cachedEventStream;

  const NativeDlnaChannel();

  static bool get _supported => PlatformDetection.isMobile;

  Future<List<CastTarget>> discoverDlnaTargets() async {
    if (!_supported) {
      return const [];
    }
    final l10n = currentAppLocalizations();
    final raw = await _channel.invokeMethod<List<dynamic>>('discoverDlnaTargets');
    if (raw == null) {
      return const [];
    }

    return raw
        .whereType<Map>()
        .map((entry) => entry.cast<String, dynamic>())
        .map(
          (entry) => CastTarget(
            id: entry['id'] as String? ?? '',
            kind: CastTargetKind.dlna,
            title: entry['title'] as String? ?? l10n.castDlna,
            subtitle: entry['subtitle'] as String? ?? '',
          ),
        )
        .where((target) => target.id.isNotEmpty)
        .toList();
  }

  Future<void> playToDlnaDevice({
    required String targetId,
    required String streamUrl,
    required String title,
    int? startPositionTicks,
  }) async {
    if (!_supported) {
      return;
    }
    await _channel.invokeMethod<void>('playToDlnaDevice', {
      'targetId': targetId,
      'streamUrl': streamUrl,
      'title': title,
      'startPositionTicks': ?startPositionTicks,
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
    await _channel.invokeMethod<void>('setDlnaVolume', {
      'volume': volume,
    });
  }

  Stream<Map<String, dynamic>> dlnaEventStream() {
    if (!_supported) {
      return const Stream<Map<String, dynamic>>.empty();
    }
    return _cachedEventStream ??= _events.receiveBroadcastStream().map((event) {
      if (event is Map) {
        return event.cast<String, dynamic>();
      }
      return <String, dynamic>{};
    }).where((event) => event.isNotEmpty);
  }
}
