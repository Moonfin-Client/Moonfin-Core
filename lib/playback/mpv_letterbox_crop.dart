import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

import 'mpv_frame_sample.dart';

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

  /// Long enough for cropdetect to see a few frames, short enough that a 4K
  /// download does not stay on the playback path.
  static const downloadWindow = Duration(milliseconds: 250);
  static const pollInterval = Duration(seconds: 1);

  static const _lavfiPrefix = 'lavfi.cropdetect.';

  /// `vf pre @label:cropdetect=...`. [resetEachFrame] (`reset=1`) lets a later
  /// IMAX/1.85 scene expand; the stabilizer rejects a single dark frame.
  ///
  /// [download] keeps zero-copy hwdec. One lavfi graph downloads the hardware
  /// frame and runs cropdetect; splitting them lets mpv insert a scaler that
  /// cannot read the hardware surface. The decoder is not restarted.
  ///
  /// `hwdownload` is the generic ffmpeg filter (VAAPI, Vulkan, D3D11,
  /// VideoToolbox, nvdec). nv12 is the usual 8-bit layout and p010le the
  /// usual 10-bit layout; neither names a GPU vendor.
  static String filterSpec({
    bool resetEachFrame = false,
    bool download = false,
  }) {
    final detect =
        'cropdetect=limit=$detectLimit:round=$detectRound:reset=${resetEachFrame ? 1 : 0}';
    if (!download) return '@$filterLabel:$detect';
    return '@$filterLabel:lavfi=[hwdownload,format=nv12|p010le,$detect]';
  }

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

  /// Fallback when the hwdownload graph cannot run.
  /// Copy-back restarts the decoder, so it is not the first attempt.
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

abstract class MpvFrameSampleHost {
  /// [window] is the crop already on screen. A VO screenshot of that window
  /// is not the coded frame.
  Future<MpvFrameSample?> sampleFrame(
    int width,
    int height, {
    LetterboxCropRect? window,
  });
}

class MpvCropGeometry {
  const MpvCropGeometry(this.rect, this.sourceWidth, this.sourceHeight);

  final LetterboxCropRect rect;
  final int sourceWidth;
  final int sourceHeight;
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
  final _geometryController = StreamController<MpvCropGeometry?>.broadcast();

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
  MpvCropGeometry? _geometry;
  String? _doneUrl;
  String? _loopUrl;
  bool _inFlight = false;

  bool get _continuous => _recropInterval > Duration.zero;

  void _log(String message) {
    if (kDebugMode) debugPrint('[letterbox_crop/mpv] $message');
  }

  @override
  bool get isApplied => _applied;

  @override
  Stream<bool> get appliedStream => _appliedController.stream;

  MpvCropGeometry? get geometry => _geometry;

  Stream<MpvCropGeometry?> get geometryStream => _geometryController.stream;

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
    if (changed) _log('enabled=$enabled supported=$isSupported');
    if (!isSupported || !changed) return;
    if (!enabled) {
      await _sync();
      return;
    }
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
    _log('interval=${interval.inSeconds}s wasContinuous=$wasContinuous');
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
      await _restoreHwdec();
    }
  }

  @override
  Future<void> onSourceOpened(String url) async {
    _log('source opened; restarting detection');
    // Opening the same URL again is still a new playback session.
    _doneUrl = null;
    _loopUrl = null;
    _stabilizer.reset();
    if (!isSupported) return;
    await _sync();
  }

  @override
  Future<void> recrop() async {
    if (!isSupported || !_enabled) return;
    _log('manual recrop requested');
    _skipStartDelay = true;
    _forceRestart = true;
    _keepAppliedCrop = _applied;
    await _sync();
  }

  Future<void> _sync() async {
    if (!_enabled) {
      _log('disabled; clearing crop and detector');
      _generation++;
      _doneUrl = null;
      _loopUrl = null;
      _stabilizer.reset();
      await reset();
      return;
    }
    if (!_host.hasNativePlayer) {
      _log('cannot detect: native mpv player unavailable');
      return;
    }
    final url = _host.currentUrl;
    if (url == null || url.isEmpty) {
      _log('cannot detect: no source URL');
      return;
    }

    if (!_forceRestart) {
      if (_continuous) {
        if (_inFlight && _loopUrl == url) {
          _log('continuous detector already running');
          return;
        }
      } else if (_doneUrl == url || (_inFlight && _loopUrl == url)) {
        _log('one-shot detector already running or completed');
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
    _log(
      'start generation=$generation continuous=$_continuous keepCrop=$keepCrop',
    );
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
    _setGeometry(null);
  }

  Future<void> _run(int generation) async {
    if (!_host.hasNativePlayer) {
      if (generation == _generation) _inFlight = false;
      return;
    }

    try {
      _log('generation=$generation waiting for playback');
      if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
      if (!_skipStartDelay && _host.position < autoDelay) {
        _log('generation=$generation start delay=${autoDelay.inSeconds}s');
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
        _log(
          'generation=$generation skipped: only ${remaining.inSeconds}s left',
        );
        return;
      }
      if (!_isCurrent(generation)) return;

      final hwdecCurrent = await _host.getProperty('hwdec-current');
      final source = await _sourceSize();
      if (!_isCurrent(generation)) return;
      // screenshot-sw converts off the video-output thread, so it does not
      // reinitialize the renderer. A zero-copy hwdec frame is a hardware
      // surface, which libswscale cannot read, and a frame that is already
      // video-cropped is not the coded picture. Both stay on cropdetect.
      final softwareShot =
          _geometry == null && !MpvLetterboxCrop.mustDisableHwdec(hwdecCurrent);
      if (_host is MpvFrameSampleHost && softwareShot) {
        if (await _runFrameSamples(generation)) return;
        if (!_isCurrent(generation)) return;
      }
      final highResolution = source.$1 * source.$2 >= 3840 * 2160;
      final expensiveDecode =
          highResolution &&
          (hwdecCurrent == 'no' || (hwdecCurrent?.endsWith('-copy') ?? false));
      // Zero-copy hwdec used to force one scan because switching to copy-back
      // restarted the decoder. A short hwdownload does not, so repeated scans
      // stay cheap.
      final download = MpvLetterboxCrop.mustDisableHwdec(hwdecCurrent);
      final scanContinuously = _continuous && !expensiveDecode;
      if (_continuous && !scanContinuously) {
        _log(
          'generation=$generation using one scan for '
          '${source.$1}x${source.$2} hwdec=$hwdecCurrent; '
          'manual recrop remains available',
        );
      }
      _log('generation=$generation hwdec=$hwdecCurrent download=$download');

      if (scanContinuously) {
        await _runContinuous(generation, download: download);
      } else {
        await _runOnce(generation, download: download);
      }
    } finally {
      if (generation == _generation) {
        _inFlight = false;
        await _removeDetectFilter();
        await _restoreHwdec();
      }
    }
  }

  Future<bool> _runFrameSamples(int generation) async {
    final sampler = _host as MpvFrameSampleHost;
    var failures = 0;
    var samples = 0;
    var adaptiveInterval = Duration.zero;
    while (_isCurrent(generation) && _enabled) {
      if (_geometry != null) {
        if (!_continuous) {
          _doneUrl = _host.currentUrl;
          return true;
        }
        _log(
          'generation=$generation cropped frame is not the coded picture; '
          'switching to filter detection',
        );
        return false;
      }
      if (!await _waitWhileCurrent(generation, untilPlaying: true)) return true;
      final size = await _sourceSize();
      if (!_isCurrent(generation)) return true;
      final dropsBefore = int.tryParse(
        await _host.getProperty('frame-drop-count') ?? '',
      );
      MpvFrameSample? frame;
      try {
        frame = await sampler.sampleFrame(
          size.$1,
          size.$2,
          window: _geometry?.rect,
        );
      } catch (error) {
        _log('generation=$generation frame capture failed: $error');
      }
      if (!_isCurrent(generation)) return true;
      if (frame == null) {
        if (++failures >= 3) {
          _log('frame capture unavailable; using filter detection fallback');
          return false;
        }
      } else {
        failures = 0;
        samples++;
        final rect = frame.rect;
        final decision = _stabilizer.observe(
          width: rect?.w,
          height: rect?.h,
          x: rect?.x,
          y: rect?.y,
          sourceWidth: size.$1,
          sourceHeight: size.$2,
        );
        _log(
          'generation=$generation frame=${frame.width}x${frame.height} '
          'rect=${rect?.videoCrop} captureMs=${frame.elapsed.inMilliseconds}',
        );
        await _applyDecision(generation, decision, size);
        if (!_isCurrent(generation)) return true;
        final geometry = _geometry;
        // The VO image is already video-cropped, so a full-bleed sample cannot
        // see a later wider shot. Filter detection still reads the coded frame.
        if (_continuous &&
            geometry != null &&
            screenshotIsCropWindow(
              shotWidth: frame.width,
              shotHeight: frame.height,
              sourceWidth: size.$1,
              sourceHeight: size.$2,
              windowW: geometry.rect.w,
              windowH: geometry.rect.h,
            )) {
          _log(
            'generation=$generation cropped frame hides the surrounding '
            'picture; switching to filter detection',
          );
          return false;
        }
        final dropsAfter = int.tryParse(
          await _host.getProperty('frame-drop-count') ?? '',
        );
        // Keep capture duty below roughly 5%; slower readbacks get more time
        // between samples. There is never a backlog of captured frames.
        var nextMillis = (frame.elapsed.inMilliseconds * 20).clamp(0, 10000);
        if (dropsBefore != null &&
            dropsAfter != null &&
            dropsAfter > dropsBefore) {
          nextMillis = (adaptiveInterval.inMilliseconds + 1000).clamp(
            1000,
            10000,
          );
        }
        if (nextMillis > adaptiveInterval.inMilliseconds) {
          adaptiveInterval = Duration(milliseconds: nextMillis);
          _log('generation=$generation sample backoff=${nextMillis}ms');
        }
        if (!_continuous &&
            (decision.changed ||
                samples >= 6 ||
                (samples >= 3 && !_applied && rect != null))) {
          _doneUrl = _host.currentUrl;
          return true;
        }
      }
      final requested = _continuous
          ? _recropInterval
          : const Duration(milliseconds: 250);
      final delay = requested > adaptiveInterval ? requested : adaptiveInterval;
      if (!await _delay(generation, delay)) return true;
    }
    return true;
  }

  Future<void> _runOnce(int generation, {required bool download}) async {
    final measured = await _measure(
      generation,
      download: download,
      resetEachFrame: false,
      window: download ? MpvLetterboxCrop.downloadWindow : detectDuration,
    );
    if (measured == null || !_isCurrent(generation)) return;
    var sample = measured.sample;
    var source = measured.source;
    if (measured.failed) {
      final fallback = await _copyBackSample(generation, resetEachFrame: false);
      if (fallback == null || !_isCurrent(generation)) return;
      sample = fallback.sample;
      source = fallback.source;
    }
    if (sample == null) return;
    _log(
      'generation=$generation sample=${sample.kind.name} rect=${sample.rect?.videoCrop}',
    );
    if (sample.kind == LetterboxSampleKind.fullFrame) {
      _log('generation=$generation full frame; clearing previous crop');
      if (_applied) {
        await _clearVideoCrop();
        if (!_isCurrent(generation)) return;
        _setApplied(false);
      }
      _doneUrl = _host.currentUrl;
      return;
    }
    final rect = sample.rect;
    if (rect == null) {
      _log('generation=$generation no valid crop rectangle');
      _doneUrl = _host.currentUrl;
      return;
    }
    if (!await _applyVideoCrop(rect, source)) return;
    if (!_isCurrent(generation)) return;
    _doneUrl = _host.currentUrl;
  }

  Future<void> _runContinuous(int generation, {required bool download}) async {
    var samples = 0;
    var scanDrops = 0;
    try {
      while (_isCurrent(generation) && _enabled && _continuous) {
        if (kDebugMode && samples++ % 5 == 0) {
          _log(
            'generation=$generation playback '
            'drops=${await _host.getProperty('frame-drop-count')} '
            'decoderDrops=${await _host.getProperty('decoder-frame-drop-count')} '
            'late=${await _host.getProperty('vo-delayed-frame-count')} '
            'mistimed=${await _host.getProperty('mistimed-frame-count')} '
            'hwdec=${await _host.getProperty('hwdec-current')}',
          );
        }
        if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
        final before = _host.position;
        final dropsBefore = int.tryParse(
          await _host.getProperty('frame-drop-count') ?? '',
        );
        final measured = await _measure(
          generation,
          download: download,
          resetEachFrame: true,
          window: download
              ? MpvLetterboxCrop.downloadWindow
              : const Duration(milliseconds: 250),
        );
        if (measured == null || !_isCurrent(generation)) return;
        if (measured.failed) {
          _log(
            'generation=$generation hardware download unavailable; '
            'one copy-back scan',
          );
          final fallback = await _copyBackSample(
            generation,
            resetEachFrame: true,
          );
          if (fallback == null || !_isCurrent(generation)) return;
          await _applyMeasured(generation, fallback);
          return;
        }
        await _applyMeasured(generation, measured);
        if (!await _delay(generation, const Duration(milliseconds: 100))) {
          return;
        }
        final dropsAfter = int.tryParse(
          await _host.getProperty('frame-drop-count') ?? '',
        );
        if (dropsBefore != null && dropsAfter != null) {
          if (dropsAfter > dropsBefore) {
            scanDrops += dropsAfter - dropsBefore;
          }
          if (scanDrops >= 3) {
            _log(
              'generation=$generation repeated scans stopped after '
              '$scanDrops playback frame drops; manual recrop remains available',
            );
            return;
          }
        }
        if (!await _delay(generation, _recropInterval)) return;
        final jumped =
            _host.position -
            before -
            _recropInterval -
            const Duration(milliseconds: 250);
        if (jumped.abs() > const Duration(seconds: 2)) {
          _stabilizer.resetCandidate();
        }
      }
    } finally {
      if (generation == _generation) {
        await _removeDetectFilter();
        await _restoreHwdec();
      }
    }
  }

  Future<_Measurement?> _measure(
    int generation, {
    required bool download,
    required bool resetEachFrame,
    required Duration window,
  }) async {
    final inserted = await _host.command([
      'vf',
      'pre',
      MpvLetterboxCrop.filterSpec(
        resetEachFrame: resetEachFrame,
        download: download,
      ),
    ]);
    _log(
      'generation=$generation detector inserted=$inserted download=$download',
    );
    if (!inserted) {
      return _Measurement.failed();
    }
    try {
      if (!await _delay(generation, window)) return null;
      if (!_isCurrent(generation)) return null;
      final source = await _sourceSize();
      final lavfi = await _readLavfi();
      _log('detect metadata=$lavfi source=${source.$1}x${source.$2}');
      if (lavfi.length < 4) return _Measurement.failed(source);
      return _Measurement.fromLavfi(lavfi, source);
    } finally {
      if (_isCurrent(generation)) await _removeDetectFilter();
    }
  }

  /// Copy-back restarts the decoder. Used only when hwdownload produced nothing.
  Future<_Measurement?> _copyBackSample(
    int generation, {
    required bool resetEachFrame,
  }) async {
    final mode = MpvLetterboxCrop.hwdecForCropdetect(
      await _host.getProperty('hwdec-current'),
    );
    if (mode != null && _hwdecBackup == null) {
      _hwdecBackup = await _host.getProperty('hwdec');
      await _host.setProperty('hwdec', mode);
      if (!await _delay(generation, const Duration(milliseconds: 400))) {
        return null;
      }
      _log(
        'generation=$generation hwdec after switch='
        '${await _host.getProperty('hwdec-current')}',
      );
    }
    try {
      return await _measure(
        generation,
        download: false,
        resetEachFrame: resetEachFrame,
        window: detectDuration,
      );
    } finally {
      await _restoreHwdec();
    }
  }

  Future<void> _applyMeasured(int generation, _Measurement measured) async {
    if (!_isCurrent(generation)) return;
    final decision = _stabilizer.observe(
      width: measured.width,
      height: measured.height,
      x: measured.x,
      y: measured.y,
      sourceWidth: measured.source.$1,
      sourceHeight: measured.source.$2,
    );
    _log(
      'generation=$generation poll metadata='
      '{w: ${measured.width}, h: ${measured.height}, '
      'x: ${measured.x}, y: ${measured.y}} '
      'source=${measured.source.$1}x${measured.source.$2}',
    );
    await _applyDecision(generation, decision, measured.source);
  }

  Future<void> _applyDecision(
    int generation,
    LetterboxCropDecision decision,
    (int, int) size,
  ) async {
    if (!decision.changed || !_isCurrent(generation)) return;
    _log(
      'generation=$generation decision=${decision.rect?.videoCrop ?? 'full frame'}',
    );

    if (decision.rect == null) {
      if (_applied) {
        await _clearVideoCrop();
        if (!_isCurrent(generation)) return;
        _setApplied(false);
      }
      return;
    }
    if (!await _applyVideoCrop(decision.rect!, size)) {
      _stabilizer.reset();
    }
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
      _log('metadata fallback=$blob');
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
    return !_host.isDisposed &&
        generation == _generation &&
        _host.currentUrl == _loopUrl;
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

  Future<bool> _applyVideoCrop(
    LetterboxCropRect rect,
    (int, int) source,
  ) async {
    await _moveSubtitlesIntoCrop(rect, source.$2);
    if (_applied) {
      await _host.command([
        'vf',
        'remove',
        '@${MpvLetterboxCrop.appliedFilterLabel}',
      ]);
    }
    final applied = await _host.command([
      'set',
      'file-local-options/video-crop',
      rect.videoCrop,
    ]);
    _log('apply rect=${rect.videoCrop} videoCropAccepted=$applied');
    if (!applied) {
      await _clearVideoCrop();
      _setApplied(false);
      return false;
    }
    _setGeometry(MpvCropGeometry(rect, source.$1, source.$2));
    _setApplied(true);
    if (kDebugMode) unawaited(_logAppliedOutput(rect));
    return true;
  }

  Future<void> _logAppliedOutput(LetterboxCropRect rect) async {
    final source = _host.currentUrl;
    await Future<void>.delayed(const Duration(milliseconds: 250));
    if (_host.isDisposed || _host.currentUrl != source) return;
    final width = await _host.getProperty('video-out-params/w');
    final height = await _host.getProperty('video-out-params/h');
    final cropWidth = await _host.getProperty('video-out-params/crop-w');
    final cropHeight = await _host.getProperty('video-out-params/crop-h');
    final displayWidth = await _host.getProperty('dwidth');
    final displayHeight = await _host.getProperty('dheight');
    final panscan = await _host.getProperty('panscan');
    final filters = await _host.getProperty('vf');
    _log(
      'applied rect=${rect.videoCrop} output=${width}x$height '
      'crop=${cropWidth}x$cropHeight display=${displayWidth}x$displayHeight '
      'panscan=$panscan vf=$filters',
    );
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
    _setGeometry(null);
  }

  void _setGeometry(MpvCropGeometry? geometry) {
    _geometry = geometry;
    _geometryController.add(geometry);
  }

  /// libmpv positions its native subtitles against the uncropped frame. A
  /// bottom-aligned subtitle can therefore land in a letterbox bar that this
  /// filter removes. Map the original requested position into the retained
  /// rectangle before applying the crop, then restore it when crop is off.
  Future<void> _moveSubtitlesIntoCrop(
    LetterboxCropRect rect,
    int sourceHeight,
  ) async {
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
    _log('applied=$value');
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

class _Measurement {
  const _Measurement({
    required this.source,
    required this.failed,
    this.width,
    this.height,
    this.x,
    this.y,
    this.sample,
  });

  factory _Measurement.failed([(int, int) source = (0, 0)]) {
    return _Measurement(source: source, failed: true);
  }

  factory _Measurement.fromLavfi(Map<String, String> lavfi, (int, int) source) {
    final width = int.tryParse(lavfi['w'] ?? '');
    final height = int.tryParse(lavfi['h'] ?? '');
    final x = int.tryParse(lavfi['x'] ?? '');
    final y = int.tryParse(lavfi['y'] ?? '');
    return _Measurement(
      source: source,
      failed: false,
      width: width,
      height: height,
      x: x,
      y: y,
      sample: LetterboxCrop.classify(
        width: width,
        height: height,
        x: x,
        y: y,
        sourceWidth: source.$1,
        sourceHeight: source.$2,
        minRatio: MpvLetterboxCrop.minRatio,
      ),
    );
  }

  final (int, int) source;
  final bool failed;
  final int? width;
  final int? height;
  final int? x;
  final int? y;
  final LetterboxSample? sample;
}
