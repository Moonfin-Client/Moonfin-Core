import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:playback_core/playback_core.dart';

/// libmpv cropdetect helpers. Matching stock mpv `autocrop.lua` without Lua.
class MpvLetterboxCrop {
  /// Persistent lavfi crop applied after detect. Label must differ from detect.
  static const appliedFilterLabel = 'moonfin-letterbox-applied';

  static const filterLabel = 'moonfin-letterbox';
  static const detectLimit = '24/255';
  static const detectRound = 2;
  static const minRatio = LetterboxCrop.minRatio;
  static const autoDelay = Duration(seconds: 4);
  static const detectDuration = Duration(seconds: 1);

  static const _lavfiPrefix = 'lavfi.cropdetect.';

  /// `vf pre @label:cropdetect=...`
  static String get filterSpec =>
      '@$filterLabel:cropdetect=limit=$detectLimit:round=$detectRound:reset=0';

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
  MpvLetterboxCropper(this._host, {required bool supported})
    : _supported = supported;

  final MpvLetterboxHost _host;
  final bool _supported;

  int _generation = 0;
  String? _hwdecBackup;
  bool _enabled = false;
  String? _doneUrl;
  bool _inFlight = false;

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
    if (!_host.hasNativePlayer) return;
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
    if (!_host.hasNativePlayer) return;
    await _removeDetectFilter();
    await _clearVideoCrop();
    await _restoreHwdec();
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

    LetterboxCropRect? rect;
    try {
      try {
        if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
        if (_host.position < MpvLetterboxCrop.autoDelay) {
          if (!await _delay(generation, MpvLetterboxCrop.autoDelay)) {
            return;
          }
        }
        if (_host.isPlaying != true) {
          if (!await _waitWhileCurrent(generation, untilPlaying: true)) return;
        }

        final remaining = _host.duration - _host.position;
        if (_host.duration > Duration.zero &&
            remaining <
                MpvLetterboxCrop.detectDuration + const Duration(seconds: 1)) {
          debugPrint('[letterbox_crop] skip: not enough time left');
          return;
        }
        if (!_isCurrent(generation)) return;

        final hwdecCurrent = await _host.getProperty('hwdec-current');
        final detectHwdec = MpvLetterboxCrop.hwdecForCropdetect(hwdecCurrent);
        if (detectHwdec != null) {
          _hwdecBackup = await _host.getProperty('hwdec');
          debugPrint(
            '[letterbox_crop] hwdec $hwdecCurrent -> $detectHwdec '
            '(was $_hwdecBackup)',
          );
          await _host.setProperty('hwdec', detectHwdec);
          if (!await _delay(generation, const Duration(milliseconds: 400))) {
            return;
          }
        }

        final inserted = await _host.command([
          'vf',
          'pre',
          MpvLetterboxCrop.filterSpec,
        ]);
        debugPrint(
          '[letterbox_crop] vf insert=$inserted spec=${MpvLetterboxCrop.filterSpec}',
        );
        if (!inserted || !_isCurrent(generation)) return;

        if (!await _delay(generation, MpvLetterboxCrop.detectDuration)) {
          return;
        }

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
          debugPrint('[letterbox_crop] vf-metadata blob=$blob');
          lavfi.addAll(MpvLetterboxCrop.parseVfMetadata(blob));
        }

        final width = int.tryParse(await _host.getProperty('width') ?? '') ?? 0;
        final height =
            int.tryParse(await _host.getProperty('height') ?? '') ?? 0;
        rect = MpvLetterboxCrop.decide(
          lavfi: lavfi,
          sourceWidth: width,
          sourceHeight: height,
        );
        debugPrint(
          '[letterbox_crop] lavfi=$lavfi ${width}x$height -> ${rect?.videoCrop}',
        );
      } finally {
        await _removeDetectFilter();
        if (rect == null) {
          await _restoreHwdec();
        }
      }

      if (rect == null || !_isCurrent(generation)) return;
      if (!await _delay(generation, const Duration(milliseconds: 200))) {
        await _restoreHwdec();
        return;
      }
      await _applyVideoCrop(rect);
      final hwdecNow = await _host.getProperty('hwdec-current');
      debugPrint('[letterbox_crop] applied ${rect.videoCrop} hwdec=$hwdecNow');
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
    await _host.command([
      'vf',
      'add',
      MpvLetterboxCrop.appliedFilterSpec(rect),
    ]);
    debugPrint('[letterbox_crop] vf crop ${rect.videoCrop}');
  }

  Future<void> _clearVideoCrop() async {
    await _host.command([
      'vf',
      'remove',
      '@${MpvLetterboxCrop.appliedFilterLabel}',
    ]);
    await _host.command(['set', 'video-crop', '']);
    await _host.command(['set', 'file-local-options/video-crop', '']);
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
