import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Inline preview player for Apple TV backed by a native AVPlayer rendering
/// into a Flutter texture, so previews composite inside the Flutter UI
/// (media bar trailers, episode focus previews) without presenting the
/// full-screen native player.
class AppleTvPreviewPlayer {
  AppleTvPreviewPlayer() : _playerId = _nextPlayerId++;

  static const _control = MethodChannel('moonfin/appletv_preview');
  static const _events = EventChannel('moonfin/appletv_preview_events');
  static Stream<Map<String, dynamic>>? _sharedEvents;
  static int _nextPlayerId = 1;

  final int _playerId;
  int? textureId;
  final ValueNotifier<int?> textureIdListenable = ValueNotifier<int?>(null);
  bool _disposed = false;

  static Stream<Map<String, dynamic>> get _eventStream {
    return _sharedEvents ??= _events
        .receiveBroadcastStream()
        .where((event) => event is Map)
        .map((event) => (event as Map).cast<String, dynamic>())
        .asBroadcastStream();
  }

  Stream<void> get completedStream => _eventStream
      .where(
        (e) => e['playerId'] == _playerId && e['event'] == 'completed',
      )
      .map((_) {});

  Stream<void> get errorStream => _eventStream
      .where((e) => e['playerId'] == _playerId && e['event'] == 'error')
      .map((_) {});

  Future<void> open(
    String url, {
    Map<String, String>? headers,
    double volume = 0,
    String? backend,
    bool live = false,
  }) async {
    if (_disposed) return;
    final result = await _control.invokeMethod<Map<dynamic, dynamic>>('open', {
      'playerId': _playerId,
      'url': url,
      if (headers != null && headers.isNotEmpty) 'headers': headers,
      'volume': volume,
      'backend': ?backend,
      if (live) 'live': true,
    });
    textureId = (result?['textureId'] as num?)?.toInt();
    if (textureId == null) {
      throw PlatformException(code: 'open_failed');
    }
    if (!_disposed) {
      textureIdListenable.value = textureId;
    }
  }

  Future<void> resume() => _invoke('resume');

  Future<void> pause() => _invoke('pause');

  Future<void> stop() => _invoke('stop');

  Future<void> setVolume(double volume) async {
    if (_disposed) return;
    try {
      await _control.invokeMethod<void>('setVolume', {
        'playerId': _playerId,
        'volume': volume,
      });
    } catch (_) {}
  }

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    textureId = null;
    textureIdListenable.value = null;
    textureIdListenable.dispose();
    try {
      await _control.invokeMethod<void>('dispose', {'playerId': _playerId});
    } catch (_) {}
  }

  Future<void> _invoke(String method) async {
    if (_disposed) return;
    try {
      await _control.invokeMethod<void>(method, {'playerId': _playerId});
    } catch (_) {}
  }
}
