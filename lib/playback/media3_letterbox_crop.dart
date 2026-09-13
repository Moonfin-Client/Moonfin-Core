import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

/// Android Media3 letterbox crop. Sample via PixelCopy, apply as layout
/// zoom into the crop rectangle (SurfaceView / tunneling cannot use Effects).
class Media3LetterboxCrop {
  static const lumaLimit = 24;
  static const round = 2;
  static const minRatio = LetterboxCrop.minRatio;
  static const autoDelay = Duration(seconds: 4);

  /// One PixelCopy is one frame, so a fade or a dark scene at that moment would
  /// crop real picture for the rest of the title. mpv's cropdetect avoids that
  /// by accumulating, and taking the widest of a few frames is the same idea.
  static const sampleCount = 3;
  static const sampleGap = Duration(milliseconds: 700);

  /// A PixelCopy that never answers would otherwise hold the detect open for
  /// as long as the player lives.
  static const detectTimeout = Duration(seconds: 2);

  /// The widest rectangle across [samples], so the darkest frame cant decide
  /// the crop on its own. Null when nothing usable came back.
  static Map<String, int>? widest(List<Map<String, int>> samples) {
    int? left;
    int? top;
    int? right;
    int? bottom;
    int? sourceWidth;
    int? sourceHeight;
    for (final sample in samples) {
      final x = sample['x'];
      final y = sample['y'];
      final w = sample['w'];
      final h = sample['h'];
      if (x == null || y == null || w == null || h == null) continue;
      left = (left == null || x < left) ? x : left;
      top = (top == null || y < top) ? y : top;
      right = (right == null || x + w > right) ? x + w : right;
      bottom = (bottom == null || y + h > bottom) ? y + h : bottom;
      sourceWidth ??= sample['sourceWidth'];
      sourceHeight ??= sample['sourceHeight'];
    }
    if (left == null ||
        top == null ||
        right == null ||
        bottom == null ||
        sourceWidth == null ||
        sourceHeight == null) {
      return null;
    }
    return <String, int>{
      'w': right - left,
      'h': bottom - top,
      'x': left,
      'y': top,
      'sourceWidth': sourceWidth,
      'sourceHeight': sourceHeight,
    };
  }

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
    this.sampleCount = Media3LetterboxCrop.sampleCount,
    this.sampleGap = Media3LetterboxCrop.sampleGap,
  }) : _supported = supported;

  final Media3LetterboxHost _host;
  final bool _supported;

  @visibleForTesting
  final Duration autoDelay;

  @visibleForTesting
  final int sampleCount;

  @visibleForTesting
  final Duration sampleGap;

  int _generation = 0;
  bool _enabled = false;
  String? _doneUrl;
  bool _inFlight = false;

  @override
  bool get isSupported => _supported;

  @override
  String? get unimplementedReason =>
      _supported ? null : 'Letterbox crop on Media3 ships on Android only.';

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
        return;
      }
      if (!_isCurrent(generation)) return;

      final samples = <Map<String, int>>[];
      for (var i = 0; i < sampleCount; i++) {
        if (i > 0 && !await _delay(generation, sampleGap)) return;
        final sample = await _host.detectLetterbox().timeout(
          Media3LetterboxCrop.detectTimeout,
          onTimeout: () => null,
        );
        if (!_isCurrent(generation)) return;
        if (sample != null) samples.add(sample);
      }

      final merged = Media3LetterboxCrop.widest(samples);
      if (merged == null) return;
      final rect = Media3LetterboxCrop.decide(merged);
      if (rect == null || !_isCurrent(generation)) return;

      await _host.setLetterboxCrop(rect);
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
