import 'dart:async';
import 'dart:convert';

import 'package:playback_core/playback_core.dart';

/// libmpv cropdetect helpers. One-shot matches stock mpv `autocrop.lua`.
/// Continuous matches `dynamic-crop.lua` without Lua.
class MpvLetterboxCrop {
  /// Persistent lavfi crop applied after detect. Label must differ from detect.
  static const appliedFilterLabel = 'moonfin-letterbox-applied';

  static const filterLabel = 'moonfin-letterbox';
  static const detectLimit = '24/255';
  static const detectRound = 2;
  static const minRatio = LetterboxCrop.minRatio;
  static const autoDelay = Duration(seconds: 4);
  static const detectDuration = Duration(seconds: 1);
  static const pollInterval = Duration(seconds: 1);

  static const _lavfiPrefix = 'lavfi.cropdetect.';

  /// `vf pre @label:cropdetect=...`. [resetEachFrame] (`reset=1`) lets a later
  /// IMAX/1.85 scene expand; the stabilizer rejects a single dark frame.
  static String filterSpec({bool resetEachFrame = false}) =>
      '@$filterLabel:cropdetect=limit=$detectLimit:round=$detectRound:reset=${resetEachFrame ? 1 : 0}';

  static String metadataProperty(String key) =>
      'vf-metadata/$filterLabel/$_lavfiPrefix$key';

  /// Non-copy hwdec cannot feed cropdetect. Same exceptions as autocrop.lua.
  static bool mustDisableHwdec(String? hwdecCurrent) {
    if (hwdecCurrent == null || hwdecCurrent.isEmpty) return false;
    if (hwdecCurrent == 'no' ||
        hwdecCurrent == 'crystalhd' ||
        hwdecCurrent == 'rkmpp') {
      return false;
    }
    return !hwdecCurrent.endsWith('-copy');
  }

  /// Keep GPU decode; copy-back is enough for cropdetect. `no` is software.
  static const copyHwdec = 'auto-copy';

  static String? hwdecForCropdetect(String? hwdecCurrent) {
    if (!mustDisableHwdec(hwdecCurrent)) return null;
    return copyHwdec;
  }

  static String appliedFilterSpec(LetterboxCropRect rect) =>
      '@$appliedFilterLabel:crop=${rect.w}:${rect.h}:${rect.x}:${rect.y}';

  static Map<String, String> parseVfMetadata(String? raw) {
    if (raw == null || raw.isEmpty || raw == 'null') return const {};
    final out = <String, String>{};

    final jsonStart = raw.trimLeft();
    if (jsonStart.startsWith('{')) {
      final decoded = _tryDecodeJsonMap(jsonStart);
      if (decoded != null) {
        for (final entry in decoded.entries) {
          final name = _stripLavfiPrefix(entry.key);
          if (name != null) out[name] = '${entry.value}';
        }
        if (out.isNotEmpty) return out;
      }
    }

    final pattern = RegExp(
      r'lavfi\.cropdetect\.([a-z]+)\s*[:=]\s*"?(-?\d+(?:\.\d+)?)"?',
      caseSensitive: false,
    );
    for (final match in pattern.allMatches(raw)) {
      out[match.group(1)!] = match.group(2)!;
    }
    return out;
  }

  static LetterboxCropRect? decide({
    required Map<String, String> lavfi,
    required int sourceWidth,
    required int sourceHeight,
  }) {
    final w = int.tryParse(lavfi['w'] ?? '');
    final h = int.tryParse(lavfi['h'] ?? '');
    final x = int.tryParse(lavfi['x'] ?? '');
    final y = int.tryParse(lavfi['y'] ?? '');
    if (w == null || h == null || x == null || y == null) return null;
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

  static String? _stripLavfiPrefix(String key) {
    if (key.startsWith(_lavfiPrefix)) {
      return key.substring(_lavfiPrefix.length);
    }
    if (key.length == 1 && 'whxy'.contains(key)) return key;
    return null;
  }

  static Map<String, Object?>? _tryDecodeJsonMap(String raw) {
    try {
      final value = jsonDecode(raw);
      if (value is Map) {
        return value.map((key, v) => MapEntry(key.toString(), v));
      }
    } catch (_) {}
    return null;
  }
}

/// libmpv property/command surface the desktop cropper needs.
abstract class MpvLetterboxHost {
  bool get hasNativePlayer;
  Future<String?> getProperty(String key);
  Future<void> setProperty(String key, String value);
  Future<bool> command(List<String> args);
  bool get isPlaying;
  Duration get position;
  Duration get duration;
  Stream<bool> get playingStream;
  String? get currentUrl;
  bool get isDisposed;
}

/// Desktop libmpv [LetterboxCropper]. The only shipping implementation.
class MpvLetterboxCropper extends LetterboxCropper {
  MpvLetterboxCropper(
    this._host, {
    required bool supported,
    this.autoDelay = MpvLetterboxCrop.autoDelay,
    this.detectDuration = MpvLetterboxCrop.detectDuration,
    LetterboxCropStabilizer? stabilizer,
  }) : _supported = supported,
       _stabilizer = stabilizer ?? LetterboxCropStabilizer();

  final MpvLetterboxHost _host;
  final bool _supported;
  final LetterboxCropStabilizer _stabilizer;
  final _appliedController = StreamController<bool>.broadcast();

  final Duration autoDelay;
  final Duration detectDuration;

  int _generation = 0;
  String? _hwdecBackup;
  String? _subtitlePositionBackup;
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
  String? get unimplementedReason => _supported
      ? null
      : 'Letterbox crop on libmpv ships on desktop and Android.';

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
      await _removeDetectFilter();
      if (!_applied) await _restoreHwdec();
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
    if (!_host.hasNativePlayer) return;
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
    await _removeDetectFilter();
    if (!keepCrop) {
      if (_applied || _hwdecBackup != null) {
        if (_applied) await _clearVideoCrop();
        _setApplied(false);
        await _restoreHwdec();
      }
    }
    if (!_isCurrent(generation)) {
      if (generation == _generation) _inFlight = false;
      return;
    }
    unawaited(_run(generation));
  }

  @override
  Future<void> reset() async {
    if (!_host.hasNativePlayer) return;
    await _removeDetectFilter();
    if (_applied || _hwdecBackup != null) {
      if (_applied) await _clearVideoCrop();
      _setApplied(false);
      await _restoreHwdec();
    }
  }

  /// Stale in-flight detect without touching filters during player teardown.
  void cancel() {
    _generation++;
    _inFlight = false;
  }

  Future<void> _run(int generation) async {
    if (!_host.hasNativePlayer) {
      if (generation == _generation) _inFlight = false;
      return;
    }

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
      final need = _continuous ? _recropInterval : detectDuration;
      if (_host.duration > Duration.zero &&
          remaining < need + const Duration(seconds: 1)) {
        return;
      }
      if (!_isCurrent(generation)) return;

      final hwdecCurrent = await _host.getProperty('hwdec-current');
      final detectHwdec = MpvLetterboxCrop.hwdecForCropdetect(hwdecCurrent);
      if (detectHwdec != null && _hwdecBackup == null) {
        _hwdecBackup = await _host.getProperty('hwdec');
        await _host.setProperty('hwdec', detectHwdec);
        if (!await _delay(generation, const Duration(milliseconds: 400))) {
          return;
        }
      }

      if (_continuous) {
        await _runContinuous(generation);
      } else {
        await _runOnce(generation);
      }
    } finally {
      if (generation == _generation) {
        _inFlight = false;
        if (!_applied && !_continuous) {
          await _removeDetectFilter();
          await _restoreHwdec();
        }
      }
    }
  }

  Future<void> _runOnce(int generation) async {
    LetterboxCropRect? rect;
    try {
      final inserted = await _host.command([
        'vf',
        'pre',
        MpvLetterboxCrop.filterSpec(),
      ]);
      if (!inserted || !_isCurrent(generation)) return;
      if (!await _delay(generation, detectDuration)) return;
      rect = await _readDetect();
    } finally {
      await _removeDetectFilter();
      if (rect == null && !_applied) {
        await _restoreHwdec();
      }
    }
    if (!_isCurrent(generation)) return;
    if (rect == null) {
      _doneUrl = _host.currentUrl;
      return;
    }
    await _applyVideoCrop(rect);
    _doneUrl = _host.currentUrl;
  }

  Future<void> _runContinuous(int generation) async {
    final inserted = await _host.command([
      'vf',
      'pre',
      MpvLetterboxCrop.filterSpec(resetEachFrame: true),
    ]);
    if (!inserted || !_isCurrent(generation)) return;

    try {
      while (_isCurrent(generation) && _enabled && _continuous) {
        if (_host.isPlaying != true) {
          if (!await _waitWhileCurrent(generation, untilPlaying: true)) {
            return;
          }
        }
        final before = _host.position;
        if (!await _delay(generation, _recropInterval)) return;
        if (!_enabled || !_continuous || !_isCurrent(generation)) {
          return;
        }
        if (_host.isPlaying != true) continue;

        final jumped = _host.position - before - _recropInterval;
        if (jumped.abs() > const Duration(seconds: 2)) {
          _stabilizer.resetCandidate();
        }

        await _pollContinuous(generation);
      }
    } finally {
      if (generation == _generation) {
        await _removeDetectFilter();
        if (!_applied) await _restoreHwdec();
      }
    }
  }

  Future<LetterboxCropRect?> _readDetect() async {
    final lavfi = await _readLavfi();
    final size = await _sourceSize();
    return MpvLetterboxCrop.decide(
      lavfi: lavfi,
      sourceWidth: size.$1,
      sourceHeight: size.$2,
    );
  }

  Future<void> _pollContinuous(int generation) async {
    final lavfi = await _readLavfi();
    if (!_isCurrent(generation)) return;
    final size = await _sourceSize();
    final decision = _stabilizer.observe(
      width: int.tryParse(lavfi['w'] ?? ''),
      height: int.tryParse(lavfi['h'] ?? ''),
      x: int.tryParse(lavfi['x'] ?? ''),
      y: int.tryParse(lavfi['y'] ?? ''),
      sourceWidth: size.$1,
      sourceHeight: size.$2,
    );
    if (!decision.changed || !_isCurrent(generation)) return;

    if (decision.rect == null) {
      if (_applied) {
        await _clearVideoCrop();
        _setApplied(false);
      }
      return;
    }
    await _applyVideoCrop(decision.rect!);
  }

  Future<Map<String, String>> _readLavfi() async {
    final lavfi = <String, String>{};
    for (final key in const ['w', 'h', 'x', 'y']) {
      final value = await _host.getProperty(
        MpvLetterboxCrop.metadataProperty(key),
      );
      if (value != null) lavfi[key] = value;
    }
    if (lavfi.length < 4) {
      final blob = await _host.getProperty(
        'vf-metadata/${MpvLetterboxCrop.filterLabel}',
      );
      lavfi.addAll(MpvLetterboxCrop.parseVfMetadata(blob));
    }
    return lavfi;
  }

  Future<(int, int)> _sourceSize() async {
    final width = int.tryParse(await _host.getProperty('width') ?? '') ?? 0;
    final height = int.tryParse(await _host.getProperty('height') ?? '') ?? 0;
    return (width, height);
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

  Future<void> _applyVideoCrop(LetterboxCropRect rect) async {
    await _moveSubtitlesIntoCrop(rect);
    if (_applied) {
      await _host.command([
        'vf',
        'remove',
        '@${MpvLetterboxCrop.appliedFilterLabel}',
      ]);
    }
    await _host.command([
      'vf',
      'add',
      MpvLetterboxCrop.appliedFilterSpec(rect),
    ]);
    _setApplied(true);
  }

  Future<void> _clearVideoCrop() async {
    await _host.command([
      'vf',
      'remove',
      '@${MpvLetterboxCrop.appliedFilterLabel}',
    ]);
    await _host.command(['set', 'video-crop', '']);
    await _host.command(['set', 'file-local-options/video-crop', '']);
    await _restoreSubtitlePosition();
  }

  /// libmpv positions its native subtitles against the uncropped frame. A
  /// bottom-aligned subtitle can therefore land in a letterbox bar that this
  /// filter removes. Map the original requested position into the retained
  /// rectangle before applying the crop, then restore it when crop is off.
  Future<void> _moveSubtitlesIntoCrop(LetterboxCropRect rect) async {
    final sourceHeight =
        int.tryParse(await _host.getProperty('height') ?? '') ?? 0;
    if (sourceHeight <= 0) return;

    final backup =
        _subtitlePositionBackup ?? await _host.getProperty('sub-pos') ?? '100';
    _subtitlePositionBackup ??= backup;
    final originalPosition = double.tryParse(backup) ?? 100;
    final position =
        (rect.y + rect.h * (originalPosition / 100)) / sourceHeight * 100;
    await _host.setProperty(
      'sub-pos',
      position.clamp(0, 150).toStringAsFixed(3),
    );
  }

  Future<void> _restoreSubtitlePosition() async {
    final backup = _subtitlePositionBackup;
    _subtitlePositionBackup = null;
    if (backup == null || backup.isEmpty) return;
    await _host.setProperty('sub-pos', backup);
  }

  void _setApplied(bool value) {
    if (_applied == value) return;
    _applied = value;
    _appliedController.add(value);
  }

  Future<void> _removeDetectFilter() async {
    await _host.command(['vf', 'remove', '@${MpvLetterboxCrop.filterLabel}']);
  }

  Future<void> _restoreHwdec() async {
    final backup = _hwdecBackup;
    _hwdecBackup = null;
    if (backup == null || backup.isEmpty) return;
    await _host.setProperty('hwdec', backup);
  }
}
