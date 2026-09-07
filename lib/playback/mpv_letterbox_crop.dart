import 'dart:convert';

/// One-shot letterbox crop, matching stock mpv `autocrop.lua` without Lua.
///
/// Insert lavfi `cropdetect`, read `vf-metadata`, then set `video-crop`.
class MpvLetterboxCrop {
  /// Persistent lavfi crop applied after detect. Label must differ from detect.
  static const appliedFilterLabel = 'moonfin-letterbox-applied';

  static const filterLabel = 'moonfin-letterbox';
  static const detectLimit = '24/255';
  static const detectRound = 2;
  static const minRatio = 0.5;
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
    if (sourceWidth <= 0 || sourceHeight <= 0) return null;
    final w = int.tryParse(lavfi['w'] ?? '');
    final h = int.tryParse(lavfi['h'] ?? '');
    final x = int.tryParse(lavfi['x'] ?? '');
    final y = int.tryParse(lavfi['y'] ?? '');
    if (w == null || h == null || x == null || y == null) return null;
    if (w <= 0 || h <= 0) return null;

    final effective = x > 0 || y > 0 || w < sourceWidth || h < sourceHeight;
    if (!effective) return null;

    final minW = sourceWidth * minRatio;
    final minH = sourceHeight * minRatio;
    if (w < minW || h < minH) return null;

    return LetterboxCropRect(w: w, h: h, x: x, y: y);
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

class LetterboxCropRect {
  const LetterboxCropRect({
    required this.w,
    required this.h,
    required this.x,
    required this.y,
  });

  final int w;
  final int h;
  final int x;
  final int y;

  String get videoCrop => '${w}x$h+$x+$y';

  @override
  bool operator ==(Object other) =>
      other is LetterboxCropRect &&
      other.w == w &&
      other.h == h &&
      other.x == x &&
      other.y == y;

  @override
  int get hashCode => Object.hash(w, h, x, y);
}
