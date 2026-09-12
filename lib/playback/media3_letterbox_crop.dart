import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

/// Android TV Media3 letterbox crop. Sample via PixelCopy, apply as layout
/// zoom into the crop rectangle (SurfaceView / tunneling cannot use Effects).
class Media3LetterboxCrop {
  static const lumaLimit = 24;
  static const round = 2;
  static const minRatio = LetterboxCrop.minRatio;
  static const autoDelay = Duration(seconds: 4);

  static LetterboxCropRect? decide(Map<String, int> detected) {
    final w = detected['w'];
    final h = detected['h'];
    final x = detected['x'];
    final y = detected['y'];
    final sourceWidth = detected['sourceWidth'];
    final sourceHeight = detected['sourceHeight'];
    if (w == null ||
        h == null ||
        x == null ||
        y == null ||
        sourceWidth == null ||
        sourceHeight == null) {
      return null;
    }
    return LetterboxCrop.decide(
      width: w,
      height: h,
      x: x,
      y: y,
      sourceWidth: sourceWidth,
      sourceHeight: sourceHeight,
      minRatio: minRatio,
    );
  }
}

/// Native detect/apply surface the Android TV cropper needs.
abstract class Media3LetterboxHost {
  Future<Map<String, int>?> detectLetterbox();
  Future<void> setLetterboxCrop(LetterboxCropRect? rect);
  bool get isPlaying;
  Duration get position;
  Duration get duration;
  Stream<bool> get playingStream;
  String? get currentUrl;
  bool get isDisposed;
}

class Media3LetterboxCropper extends LetterboxCropper {
  Media3LetterboxCropper(
    this._host, {
    required bool supported,
    this.autoDelay = Media3LetterboxCrop.autoDelay,
  }) : _supported = supported;

  final Media3LetterboxHost _host;
  final bool _supported;

  @visibleForTesting
  final Duration autoDelay;

  int _generation = 0;
  bool _enabled = false;
  String? _doneUrl;
  bool _inFlight = false;

  @override
  bool get isSupported => _supported;

  @override
  String? get unimplementedReason =>
      _supported ? null : 'Letterbox crop on Media3 ships on Android TV only.';

  @override
  Future<void> setEnabled(bool enabled) async {
    final changed = enabled != _enabled;
    _enabled = enabled;
    if (!isSupported || !changed) return;
    final url = _host.currentUrl;
    if (url == null || url.isEmpty) return;
    await _sync();
  }

  @override
  Future<void> onSourceOpened(String url) async {
    if (_doneUrl != url) _doneUrl = null;
    if (!isSupported) return;
    await _sync();
  }

  Future<void> _sync() async {
    if (!_enabled) {
      _generation++;
      await reset();
      _doneUrl = null;
      return;
    }
    final url = _host.currentUrl;
    if (url == null || url.isEmpty) return;
    if (_doneUrl == url) return;
    if (_inFlight) return;

    _inFlight = true;
    final generation = ++_generation;
    await reset();
    if (!_isCurrent(generation)) {
      if (generation == _generation) _inFlight = false;
      return;
    }
    unawaited(_run(generation));
  }

  @override
  Future<void> reset() async {
    if (!isSupported) return;
    await _host.setLetterboxCrop(null);
  }

  /// Stale in-flight detect without touching the view during teardown.
  void cancel() {
    _generation++;
    _inFlight = false;
  }

  Future<void> _run(int generation) async {
    try {
      if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
      if (_host.position < autoDelay) {
        if (!await _delay(generation, autoDelay)) {
          return;
        }
      }
      if (_host.isPlaying != true) {
        if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
      }

      final remaining = _host.duration - _host.position;
      if (_host.duration > Duration.zero &&
          remaining < autoDelay + const Duration(seconds: 1)) {
        debugPrint('[letterbox_crop] media3 skip: not enough time left');
        return;
      }
      if (!_isCurrent(generation)) return;

      final detected = await _host.detectLetterbox();
      if (!_isCurrent(generation) || detected == null) {
        debugPrint('[letterbox_crop] media3 detect missed');
        return;
      }
      final rect = Media3LetterboxCrop.decide(detected);
      debugPrint(
        '[letterbox_crop] media3 detect=$detected -> ${rect?.videoCrop}',
      );
      if (rect == null || !_isCurrent(generation)) return;

      await _host.setLetterboxCrop(rect);
      debugPrint('[letterbox_crop] media3 applied ${rect.videoCrop}');
      _doneUrl = _host.currentUrl;
    } finally {
      if (generation == _generation) {
        _inFlight = false;
      }
    }
  }

  bool _isCurrent(int generation) {
    return !_host.isDisposed && generation == _generation;
  }

  Future<bool> _delay(int generation, Duration duration) async {
    if (duration <= Duration.zero) return _isCurrent(generation);
    await Future<void>.delayed(duration);
    return _isCurrent(generation);
  }

  Future<bool> _waitWhileCurrent(
    int generation, {
    required bool untilPlaying,
  }) async {
    if (_host.isPlaying == untilPlaying) {
      return _isCurrent(generation);
    }
    try {
      await _host.playingStream
          .firstWhere((playing) => playing == untilPlaying)
          .timeout(const Duration(seconds: 30));
    } catch (_) {
      return false;
    }
    return _isCurrent(generation);
  }
}
