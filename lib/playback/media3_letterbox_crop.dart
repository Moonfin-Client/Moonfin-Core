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
    final sample = classify(detected);
    return sample.kind == LetterboxSampleKind.crop ? sample.rect : null;
  }

  static LetterboxSample classify(Map<String, int> detected) {
    return LetterboxCrop.classify(
      width: detected['w'],
      height: detected['h'],
      x: detected['x'],
      y: detected['y'],
      sourceWidth: detected['sourceWidth'] ?? 0,
      sourceHeight: detected['sourceHeight'] ?? 0,
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

  /// Position advances this much faster than the wall clock.
  double get playbackSpeed;
}

class Media3LetterboxCropper extends LetterboxCropper {
  Media3LetterboxCropper(
    this._host, {
    required bool supported,
    this.autoDelay = Media3LetterboxCrop.autoDelay,
    this.sampleCount = Media3LetterboxCrop.sampleCount,
    this.sampleGap = Media3LetterboxCrop.sampleGap,
    this.windowboxGap = LetterboxCrop.windowboxGap,
    LetterboxCropStabilizer? stabilizer,
  }) : _supported = supported,
       _stabilizer = stabilizer ?? LetterboxCropStabilizer();

  final Media3LetterboxHost _host;
  final bool _supported;
  final LetterboxCropStabilizer _stabilizer;
  final _appliedController = StreamController<bool>.broadcast();

  @visibleForTesting
  final Duration autoDelay;

  @visibleForTesting
  final int sampleCount;

  @visibleForTesting
  final Duration sampleGap;

  @visibleForTesting
  final Duration windowboxGap;

  int _generation = 0;
  bool _enabled = false;
  Duration _recropInterval = Duration.zero;
  bool _skipStartDelay = false;
  bool _forceRestart = false;
  bool _keepAppliedCrop = false;
  bool _applied = false;
  String? _doneUrl;
  String? _loopUrl;
  bool _inFlight = false;

  bool get _continuous => _recropInterval > Duration.zero;

  @override
  bool get isApplied => _applied;

  @override
  Stream<bool> get appliedStream => _appliedController.stream;

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
  Future<void> setRecropInterval(Duration interval) async {
    if (interval.isNegative) interval = Duration.zero;
    if (_recropInterval == interval) return;
    final wasContinuous = _continuous;
    _recropInterval = interval;
    if (!isSupported || !_enabled) return;
    final url = _host.currentUrl;
    if (url == null || url.isEmpty) return;
    if (_continuous && !wasContinuous) {
      _skipStartDelay = true;
      _forceRestart = true;
      _keepAppliedCrop = _applied;
      await _sync();
    } else if (!_continuous && wasContinuous) {
      _generation++;
      _inFlight = false;
      _loopUrl = null;
      _doneUrl = url;
    }
  }

  @override
  Future<void> onSourceOpened(String url) async {
    if (_doneUrl != url && _loopUrl != url) {
      _doneUrl = null;
      _loopUrl = null;
      _stabilizer.reset();
    }
    if (!isSupported) return;
    await _sync();
  }

  @override
  Future<void> recrop() async {
    if (!isSupported || !_enabled) return;
    _skipStartDelay = true;
    _forceRestart = true;
    _keepAppliedCrop = _applied;
    await _sync();
  }

  Future<void> _sync() async {
    if (!_enabled) {
      _generation++;
      _doneUrl = null;
      _loopUrl = null;
      _stabilizer.reset();
      await reset();
      return;
    }
    final url = _host.currentUrl;
    if (url == null || url.isEmpty) return;

    if (!_forceRestart) {
      if (_continuous) {
        if (_inFlight && _loopUrl == url) return;
      } else if (_doneUrl == url || _inFlight) {
        return;
      }
    }
    final keepCrop = _keepAppliedCrop;
    _forceRestart = false;
    _keepAppliedCrop = false;

    _inFlight = true;
    _loopUrl = url;
    _doneUrl = null;
    if (keepCrop) {
      _stabilizer.resetCandidate();
    } else {
      _stabilizer.reset();
    }
    final generation = ++_generation;
    if (!keepCrop) await reset();
    if (!_isCurrent(generation)) {
      if (generation == _generation) _inFlight = false;
      return;
    }
    unawaited(_run(generation));
  }

  @override
  Future<void> reset() async {
    if (!isSupported) return;
    _setApplied(false);
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
      if (!_skipStartDelay && _host.position < autoDelay) {
        if (!await _delay(generation, autoDelay)) {
          return;
        }
      }
      _skipStartDelay = false;
      if (_host.isPlaying != true) {
        if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
      }

      final remaining = _host.duration - _host.position;
      final need = _continuous ? _recropInterval : autoDelay;
      if (_host.duration > Duration.zero &&
          remaining < need + const Duration(seconds: 1)) {
        return;
      }
      if (!_isCurrent(generation)) return;

      if (_continuous) {
        await _runContinuous(generation);
      } else {
        await _runOnce(generation);
      }
    } finally {
      if (generation == _generation) {
        _inFlight = false;
      }
    }
  }

  Future<void> _runOnce(int generation) async {
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

    // Every PixelCopy failed, e.g. the surface was still attaching. Leave
    // the title open so the next sync can scan again.
    final merged = Media3LetterboxCrop.widest(samples);
    if (merged == null) return;
    final sample = Media3LetterboxCrop.classify(merged);
    final rect = sample.kind == LetterboxSampleKind.crop ? sample.rect : null;
    if (!_isCurrent(generation)) return;
    if (rect == null || !await _windowboxHolds(generation, sample)) {
      if (_isCurrent(generation)) _doneUrl = _host.currentUrl;
      return;
    }
    await _host.setLetterboxCrop(rect);
    _setApplied(true);
    _doneUrl = _host.currentUrl;
  }

  /// The widest-of-three merge is not enough for bars on all four sides: a
  /// centred title card fills every sample. Later reads must still agree.
  Future<bool> _windowboxHolds(int generation, LetterboxSample sample) async {
    final rect = sample.rect;
    if (!sample.windowbox || rect == null) return true;
    for (var i = 0; i < LetterboxCrop.windowboxConfirmations; i++) {
      if (!await _delay(generation, windowboxGap)) return false;
      if (!await _waitWhileCurrent(generation, untilPlaying: true)) {
        return false;
      }
      final next = await _host.detectLetterbox().timeout(
        Media3LetterboxCrop.detectTimeout,
        onTimeout: () => null,
      );
      if (next == null || !_isCurrent(generation)) return false;
      final nextRect = Media3LetterboxCrop.decide(next);
      if (nextRect == null || !LetterboxCrop.similar(nextRect, rect)) {
        return false;
      }
    }
    return true;
  }

  Future<void> _runContinuous(int generation) async {
    while (_isCurrent(generation) && _enabled && _continuous) {
      if (_host.isPlaying != true) {
        if (!await _waitWhileCurrent(generation, untilPlaying: true)) {
          return;
        }
      }
      final before = _host.position;
      if (!await _delay(generation, _recropInterval)) return;
      if (!_enabled || !_continuous || !_isCurrent(generation)) return;
      if (_host.isPlaying != true) continue;

      if (LetterboxCrop.seeked(
        before: before,
        after: _host.position,
        elapsed: _recropInterval,
        speed: _host.playbackSpeed,
      )) {
        _stabilizer.resetCandidate();
      }

      final sample = await _host.detectLetterbox().timeout(
        Media3LetterboxCrop.detectTimeout,
        onTimeout: () => null,
      );
      if (!_isCurrent(generation)) return;

      final decision = _stabilizer.observe(
        width: sample?['w'],
        height: sample?['h'],
        x: sample?['x'],
        y: sample?['y'],
        sourceWidth: sample?['sourceWidth'] ?? 0,
        sourceHeight: sample?['sourceHeight'] ?? 0,
      );
      if (!decision.changed || !_isCurrent(generation)) continue;
      await _host.setLetterboxCrop(decision.rect);
      _setApplied(decision.rect != null);
    }
  }

  bool _isCurrent(int generation) {
    return !_host.isDisposed && generation == _generation;
  }

  void _setApplied(bool value) {
    if (_applied == value) return;
    _applied = value;
    _appliedController.add(value);
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
    while (_isCurrent(generation) && _host.isPlaying != untilPlaying) {
      try {
        await _host.playingStream
            .firstWhere((playing) => playing == untilPlaying)
            .timeout(const Duration(seconds: 30));
      } on TimeoutException {
        // A long pause is normal. Keep waiting for playback to resume.
      } catch (_) {
        return false;
      }
    }
    return _isCurrent(generation);
  }
}
