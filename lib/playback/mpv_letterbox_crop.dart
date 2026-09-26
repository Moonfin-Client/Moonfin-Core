import 'dart:async';
import 'dart:convert';

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

  static const _lavfiPrefix = 'lavfi.cropdetect.';

  /// `vf pre @label:cropdetect=...`. [resetEachFrame] (`reset=1`) lets a later
  /// IMAX/1.85 scene expand; the stabilizer rejects a single dark frame.
  ///
  /// [download] keeps zero-copy hwdec. One lavfi graph downloads the hardware
  /// frame and runs cropdetect; splitting them lets mpv insert a scaler that
  /// cannot read the hardware surface. The decoder is not restarted.
  ///
  /// `hwdownload` is the generic ffmpeg filter (VAAPI, Vulkan, D3D11,
  /// VideoToolbox, nvdec). Pass one layout only. A list such as
  /// `nv12|p010le` makes mpv try nv12 first and abort a 10-bit frame.
  static String filterSpec({
    bool resetEachFrame = false,
    String? downloadFormat,
  }) {
    final detect =
        'cropdetect=limit=$detectLimit:round=$detectRound:reset=${resetEachFrame ? 1 : 0}';
    if (downloadFormat == null) return '@$filterLabel:$detect';
    return '@$filterLabel:lavfi=[hwdownload,format=$downloadFormat,$detect]';
  }

  /// Software layout `hwdownload` can actually write for this hardware frame.
  /// `video-params/hw-pixelformat` is `nv12` or `p010` on every desktop hwdec.
  static String? downloadFormatFor(String? hwPixelFormat, {int? averageBpp}) {
    switch (hwPixelFormat) {
      case 'nv12':
      case 'nv21':
        return 'nv12';
      case 'p010':
      case 'p010le':
      case 'p016':
      case 'p016le':
        return 'p010le';
    }
    // cuda/vaapi/vulkan/drm name the surface, not the pixels. 4:2:0 8-bit is
    // about 12 bits per pixel; 10-bit is about 24.
    if (averageBpp != null && averageBpp >= 20) return 'p010le';
    if (averageBpp != null && averageBpp > 0) return 'nv12';
    return null;
  }

  static String metadataProperty(String key) =>
      'vf-metadata/$filterLabel/$_lavfiPrefix$key';

  /// How far to zoom a fitted crop so vertical bars disappear.
  ///
  /// A 2:1 picture in a 16:9 window is letterboxed again by fit, which hides
  /// the crop. Zooming by the aspect ratio fills the height and clips the
  /// sides. A wider window already has no vertical bars, so it stays at 1
  /// and keeps the side space.
  static double fillScale({
    required int cropWidth,
    required int cropHeight,
    required double windowWidth,
    required double windowHeight,
  }) {
    if (cropWidth <= 0 ||
        cropHeight <= 0 ||
        windowWidth <= 0 ||
        windowHeight <= 0) {
      return 1;
    }
    final cropAspect = cropWidth / cropHeight;
    final windowAspect = windowWidth / windowHeight;
    if (cropAspect <= windowAspect) return 1;
    return cropAspect / windowAspect;
  }

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
    // auto-copy may leave nvdec and come back as vulkan-copy. Stay on the
    // same accelerator.
    const sameApi = {
      'nvdec',
      'vaapi',
      'vulkan',
      'd3d11va',
      'videotoolbox',
      'qsv',
      'drm',
      'vdpau',
    };
    if (sameApi.contains(hwdecCurrent)) return '$hwdecCurrent-copy';
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
  /// Only called while no `video-crop` is on screen, so the shot is the
  /// coded frame.
  Future<MpvFrameSample?> sampleFrame(int width, int height);
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
    this.windowboxGap = LetterboxCrop.windowboxGap,
    this.managePanscan = true,
    LetterboxCropStabilizer? stabilizer,
  }) : _supported = supported,
       _stabilizer = stabilizer ?? LetterboxCropStabilizer();

  final MpvLetterboxHost _host;
  final bool _supported;
  final LetterboxCropStabilizer _stabilizer;
  final _appliedController = StreamController<bool>.broadcast();
  final _geometryController = StreamController<MpvCropGeometry?>.broadcast();

  /// Apply and clear each take several mpv calls. Running them one at a time
  /// keeps a disable from landing halfway through an apply.
  Future<void> _cropOps = Future<void>.value();

  final Duration autoDelay;
  final Duration detectDuration;
  final Duration windowboxGap;

  /// Set `panscan` to fill the frame. Off where the video view already owns
  /// `panscan` (Android native surface) and follows [fillsFrame] instead.
  final bool managePanscan;

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

  @override
  bool get isApplied => _applied;

  @override
  Stream<bool> get appliedStream => _appliedController.stream;

  MpvCropGeometry? get geometry => _geometry;

  Stream<MpvCropGeometry?> get geometryStream => _geometryController.stream;

  /// The applied crop is wider than the source frame, so fit would paint the
  /// removed bars back. The picture has to be zoomed to fill.
  bool get fillsFrame {
    final geometry = _geometry;
    if (!_applied || geometry == null) return false;
    return MpvLetterboxCrop.fillScale(
          cropWidth: geometry.rect.w,
          cropHeight: geometry.rect.h,
          windowWidth: geometry.sourceWidth.toDouble(),
          windowHeight: geometry.sourceHeight.toDouble(),
        ) >
        1;
  }

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
    if (!_host.hasNativePlayer) {
      return;
    }
    final url = _host.currentUrl;
    if (url == null || url.isEmpty) {
      return;
    }

    if (!_forceRestart) {
      if (_continuous) {
        if (_inFlight && _loopUrl == url) {
          return;
        }
      } else if (_doneUrl == url || (_inFlight && _loopUrl == url)) {
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
    if (keepCrop) {
      await _removeDetectFilter();
    } else {
      await reset();
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
    await _serialized(() async {
      await _removeDetectFilter();
      if (_applied || _hwdecBackup != null) {
        if (_applied) await _clearVideoCrop();
        _setApplied(false);
        await _restoreHwdec();
      }
    });
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
      final needsDownload = MpvLetterboxCrop.mustDisableHwdec(hwdecCurrent);
      final hwPixel = await _host.getProperty('video-params/hw-pixelformat');
      final averageBpp = int.tryParse(
        await _host.getProperty('video-params/average-bpp') ?? '',
      );
      final downloadFormat = needsDownload
          ? MpvLetterboxCrop.downloadFormatFor(hwPixel, averageBpp: averageBpp)
          : null;
      if (_continuous && !expensiveDecode) {
        await _runContinuous(
          generation,
          needsDownload: needsDownload,
          downloadFormat: downloadFormat,
        );
      } else {
        await _runOnce(
          generation,
          needsDownload: needsDownload,
          downloadFormat: downloadFormat,
        );
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
        frame = await sampler.sampleFrame(size.$1, size.$2);
      } catch (_) {
        // Counted as a failed shot below; cropdetect takes over after three.
        frame = null;
      }
      if (!_isCurrent(generation)) return true;
      if (frame == null) {
        if (++failures >= 3) {
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
        await _applyDecision(generation, decision, size);
        if (!_isCurrent(generation)) return true;
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
        }
        // Three quiet samples with nothing pending means no bars. A pending
        // candidate still needs its hits, which can take more than three.
        if (!_continuous &&
            (decision.changed ||
                samples >= 6 ||
                (samples >= 3 && !_applied && !_stabilizer.hasCandidate))) {
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

  Future<void> _runOnce(
    int generation, {
    required bool needsDownload,
    required String? downloadFormat,
  }) async {
    Future<_Measurement?> read() => _readOrCopyBack(
      generation,
      needsDownload: needsDownload,
      downloadFormat: downloadFormat,
      resetEachFrame: false,
      window: downloadFormat != null
          ? MpvLetterboxCrop.downloadWindow
          : detectDuration,
    );
    final measured = await read();
    if (measured == null || !_isCurrent(generation)) return;
    if (await _windowboxHolds(generation, measured, read)) {
      await _commitSample(generation, measured);
    }
    if (_isCurrent(generation)) _doneUrl = _host.currentUrl;
  }

  /// A single reading has no stabilizer behind it. Bars on all four sides
  /// could be a centred title card, so they must still be there on later
  /// reads. Any other reading passes straight through.
  Future<bool> _windowboxHolds(
    int generation,
    _Measurement measured,
    Future<_Measurement?> Function() read,
  ) async {
    final sample = measured.sample;
    final rect = sample?.rect;
    if (sample == null || !sample.windowbox || rect == null) return true;
    for (var i = 0; i < LetterboxCrop.windowboxConfirmations; i++) {
      if (!await _delay(generation, windowboxGap)) return false;
      if (!await _waitWhileCurrent(generation, untilPlaying: true)) {
        return false;
      }
      final next = await read();
      if (next == null || !_isCurrent(generation)) return false;
      final nextRect = next.sample?.rect;
      if (nextRect == null || !LetterboxCrop.similar(nextRect, rect)) {
        return false;
      }
    }
    return true;
  }

  Future<void> _runContinuous(
    int generation, {
    required bool needsDownload,
    required String? downloadFormat,
  }) async {
    var scanDrops = 0;
    try {
      while (_isCurrent(generation) && _enabled && _continuous) {
        if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
        final before = _host.position;
        final dropsBefore = int.tryParse(
          await _host.getProperty('frame-drop-count') ?? '',
        );
        final scanWindow = downloadFormat != null
            ? MpvLetterboxCrop.downloadWindow
            : const Duration(milliseconds: 250);
        final measured = await _readOrCopyBack(
          generation,
          needsDownload: needsDownload,
          downloadFormat: downloadFormat,
          resetEachFrame: downloadFormat != null,
          window: scanWindow,
        );
        if (measured == null || !_isCurrent(generation)) return;
        if (measured.copyBack) {
          // This reading already accumulated for a second, and the fallback
          // does not take a second one. Apply it instead of waiting for
          // another hit that never comes.
          final holds = await _windowboxHolds(
            generation,
            measured,
            () => _copyBackSample(generation),
          );
          if (holds) await _commitSample(generation, measured);
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
            return;
          }
        }
        if (!await _delay(generation, _recropInterval)) return;
        final speed =
            double.tryParse(await _host.getProperty('speed') ?? '') ?? 1;
        if (LetterboxCrop.seeked(
          before: before,
          after: _host.position,
          elapsed:
              scanWindow + const Duration(milliseconds: 100) + _recropInterval,
          speed: speed,
        )) {
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

  Future<_Measurement?> _readOrCopyBack(
    int generation, {
    required bool needsDownload,
    required String? downloadFormat,
    required bool resetEachFrame,
    required Duration window,
  }) async {
    if (!needsDownload) {
      return _measure(
        generation,
        downloadFormat: null,
        resetEachFrame: resetEachFrame,
        window: window,
      );
    }
    if (downloadFormat == null) {
      return _copyBackSample(generation);
    }
    final measured = await _measure(
      generation,
      downloadFormat: downloadFormat,
      resetEachFrame: resetEachFrame,
      window: window,
    );
    if (measured == null || !measured.failed) return measured;
    return _copyBackSample(generation);
  }

  Future<void> _commitSample(int generation, _Measurement measured) async {
    final sample = measured.sample;
    if (sample == null || !_isCurrent(generation)) return;
    if (sample.kind == LetterboxSampleKind.fullFrame) {
      await _clearCrop(generation);
      return;
    }
    final rect = sample.rect;
    if (rect == null) {
      return;
    }
    await _applyCrop(generation, rect, measured.source);
  }

  Future<_Measurement?> _measure(
    int generation, {
    required String? downloadFormat,
    required bool resetEachFrame,
    required Duration window,
  }) async {
    final inserted = await _host.command([
      'vf',
      'pre',
      MpvLetterboxCrop.filterSpec(
        resetEachFrame: resetEachFrame,
        downloadFormat: downloadFormat,
      ),
    ]);
    if (!inserted) {
      return _Measurement.failed();
    }
    try {
      if (!await _delay(generation, window)) return null;
      if (!_isCurrent(generation)) return null;
      final source = await _sourceSize();
      final lavfi = await _readLavfi();
      if (lavfi.length < 4) return _Measurement.failed(source);
      return _Measurement.fromLavfi(lavfi, source);
    } finally {
      if (_isCurrent(generation)) await _removeDetectFilter();
    }
  }

  /// Copy-back restarts the decoder. Used only when hwdownload produced nothing.
  Future<_Measurement?> _copyBackSample(int generation) async {
    final mode = MpvLetterboxCrop.hwdecForCropdetect(
      await _host.getProperty('hwdec-current'),
    );
    if (mode != null && _hwdecBackup == null) {
      _hwdecBackup = await _host.getProperty('hwdec');
      await _host.setProperty('hwdec', mode);
      if (!await _delay(generation, const Duration(milliseconds: 400))) {
        return null;
      }
    }
    try {
      final measured = await _measure(
        generation,
        downloadFormat: null,
        resetEachFrame: false,
        window: detectDuration,
      );
      return measured?.asCopyBack();
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
    await _applyDecision(generation, decision, measured.source);
  }

  Future<void> _applyDecision(
    int generation,
    LetterboxCropDecision decision,
    (int, int) size,
  ) async {
    if (!decision.changed || !_isCurrent(generation)) return;

    if (decision.rect == null) {
      await _clearCrop(generation);
      return;
    }
    if (!await _applyCrop(generation, decision.rect!, size)) {
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

  Future<T> _serialized<T>(Future<T> Function() op) {
    final result = _cropOps.then((_) => op());
    _cropOps = result.then<void>((_) {}, onError: (Object _) {});
    return result;
  }

  /// Checked inside the lock: a disable queued ahead of this apply has
  /// already bumped the generation, so the stale apply never starts.
  Future<bool> _applyCrop(
    int generation,
    LetterboxCropRect rect,
    (int, int) source,
  ) => _serialized(() async {
    if (!_enabled || !_isCurrent(generation)) return false;
    return _applyVideoCrop(rect, source);
  });

  Future<void> _clearCrop(int generation) => _serialized(() async {
    if (!_applied || !_isCurrent(generation)) return;
    await _clearVideoCrop();
    _setApplied(false);
  });

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
    if (!applied) {
      await _clearVideoCrop();
      _setApplied(false);
      return false;
    }
    _setGeometry(MpvCropGeometry(rect, source.$1, source.$2));
    _setApplied(true);
    await _syncPanscan();
    return true;
  }

  /// The rendered frame stays the source size. Fit then paints the removed
  /// bars back into that frame, which is why a 16:9 screen still shows them.
  /// Fill the frame when the cropped picture is wider than the source.
  Future<void> _syncPanscan() => _setPanscan(fillsFrame ? '1' : '0');

  /// Not cached: the video view can also write `panscan`, so a remembered
  /// value goes stale.
  Future<void> _setPanscan(String value) async {
    if (!managePanscan) return;
    await _host.setProperty('panscan', value);
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
    await _setPanscan('0');
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
    this.copyBack = false,
  });

  _Measurement asCopyBack() => _Measurement(
    source: source,
    failed: failed,
    width: width,
    height: height,
    x: x,
    y: y,
    sample: sample,
    copyBack: true,
  );

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
  final bool copyBack;
}
