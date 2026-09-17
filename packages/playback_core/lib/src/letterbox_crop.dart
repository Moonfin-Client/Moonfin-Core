/// Encoded-letterbox crop. Not cover-zoom.
///
/// Cover-zoom scales the whole coded picture to fill the window, so black bars
/// baked into a 16:9 file stay. A [LetterboxCropper] finds those bars and
/// removes them; the player can then fill the cropped picture.
///
/// Shipping implementations: desktop libmpv (`cropdetect` → `vf crop`) and
/// Android Media3 (PixelCopy scan → layout zoom into the crop).
/// Other engines return [UnsupportedLetterboxCropper] until they grow a
/// detector and a crop path.
library;

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

/// What a raw cropdetect / PixelCopy sample means.
enum LetterboxSampleKind {
  /// Letterbox or pillarbox that spans a source edge.
  crop,

  /// No bars. IMAX / full-frame; may mean uncrop.
  fullFrame,

  /// Dark frame, over-crop, or a blob that does not span a source edge.
  ignore,
}

class LetterboxSample {
  const LetterboxSample({required this.kind, this.rect});

  final LetterboxSampleKind kind;
  final LetterboxCropRect? rect;
}

/// Apply a new crop (or `null` to uncrop). [hold] means keep the last apply.
class LetterboxCropDecision {
  const LetterboxCropDecision.hold() : changed = false, rect = null;

  const LetterboxCropDecision.apply(this.rect) : changed = true;

  final bool changed;
  final LetterboxCropRect? rect;
}

/// Shared accept/reject rules for a detected crop rectangle.
abstract final class LetterboxCrop {
  /// Drop a detect that would keep less than this fraction of the source.
  static const minRatio = 0.5;

  /// Same list as mpv `dynamic-crop.lua`. Known ratios confirm faster.
  static const knownRatios = <double>[
    2.76,
    2.55,
    24 / 9,
    2.4,
    2.39,
    2.35,
    2.2,
    2.1,
    2.0,
    1.9,
    1.85,
    16 / 9,
    5 / 3,
    1.5,
    1.43,
    4 / 3,
    1.25,
    9 / 16,
  ];

  /// [null] when the detect is missing, full-frame, or an over-crop.
  static LetterboxCropRect? decide({
    required int width,
    required int height,
    required int x,
    required int y,
    required int sourceWidth,
    required int sourceHeight,
    double minRatio = LetterboxCrop.minRatio,
  }) {
    final sample = classify(
      width: width,
      height: height,
      x: x,
      y: y,
      sourceWidth: sourceWidth,
      sourceHeight: sourceHeight,
      minRatio: minRatio,
    );
    return sample.kind == LetterboxSampleKind.crop ? sample.rect : null;
  }

  /// Sort a raw detect the way `dynamic-crop.lua` does: ignore dark / inner
  /// blobs, treat a full-frame as uncrop, keep letterbox that hugs an edge.
  static LetterboxSample classify({
    int? width,
    int? height,
    int? x,
    int? y,
    required int sourceWidth,
    required int sourceHeight,
    double minRatio = LetterboxCrop.minRatio,
    int round = 2,
    int linkedTolerance = 2,
  }) {
    if (sourceWidth <= 0 || sourceHeight <= 0) {
      return const LetterboxSample(kind: LetterboxSampleKind.ignore);
    }
    if (width == null || height == null || x == null || y == null) {
      return const LetterboxSample(kind: LetterboxSampleKind.ignore);
    }
    if (width <= 0 || height <= 0) {
      return const LetterboxSample(kind: LetterboxSampleKind.ignore);
    }

    final minW = sourceWidth * minRatio;
    final minH = sourceHeight * minRatio;
    if (width < minW || height < minH) {
      return const LetterboxSample(kind: LetterboxSampleKind.ignore);
    }

    final margin = round * linkedTolerance;
    final top = y;
    final bottom = sourceHeight - height - y;
    final left = x;
    final right = sourceWidth - width - x;
    final linkedToSource =
        (top <= margin && bottom <= margin) ||
        (left <= margin && right <= margin);
    if (!linkedToSource) {
      return const LetterboxSample(kind: LetterboxSampleKind.ignore);
    }

    final fullFrame =
        top <= margin && bottom <= margin && left <= margin && right <= margin;
    if (fullFrame) {
      return const LetterboxSample(kind: LetterboxSampleKind.fullFrame);
    }

    return LetterboxSample(
      kind: LetterboxSampleKind.crop,
      rect: LetterboxCropRect(w: width, h: height, x: x, y: y),
    );
  }

  static bool isKnownRatio({
    required int width,
    required int height,
    required int sourceWidth,
    required int sourceHeight,
    int ratioTolerance = 2,
    int linkedTolerance = 2,
  }) {
    if (width >= sourceWidth - linkedTolerance &&
        height >= sourceHeight - linkedTolerance) {
      return false;
    }
    for (final ratio in knownRatios) {
      final expectedW = (sourceHeight * ratio).floor();
      final expectedH = (sourceWidth / ratio).floor();
      if ((width - expectedW).abs() <= ratioTolerance ||
          (height - expectedH).abs() <= ratioTolerance) {
        return true;
      }
    }
    return false;
  }

  static bool similar(
    LetterboxCropRect a,
    LetterboxCropRect b, {
    int round = 2,
  }) {
    final margin = round * 4;
    return (a.w - b.w).abs() <= margin &&
        (a.h - b.h).abs() <= margin &&
        (a.x - b.x).abs() <= margin &&
        (a.y - b.y).abs() <= margin;
  }
}

/// Consecutive-sample hysteresis from mpv `dynamic-crop.lua`.
///
/// One dark frame cannot retarget the crop. A known cinema ratio needs
/// [newCropHits] matching samples; a previously trusted crop needs
/// [trustedHits]; an unknown ratio needs [unknownHits].
class LetterboxCropStabilizer {
  LetterboxCropStabilizer({
    this.round = 2,
    this.linkedTolerance = 2,
    this.minRatio = LetterboxCrop.minRatio,
    this.newCropHits = 2,
    this.trustedHits = 1,
    this.unknownHits = 3,
  });

  final int round;
  final int linkedTolerance;
  final double minRatio;
  final int newCropHits;
  final int trustedHits;
  final int unknownHits;

  LetterboxSampleKind? _candidateKind;
  LetterboxCropRect? _candidateRect;
  int _hits = 0;
  LetterboxCropRect? _applied;
  final _trusted = <LetterboxCropRect>[];
  bool _trustedFullFrame = false;
  int _sourceWidth = 0;
  int _sourceHeight = 0;

  LetterboxCropRect? get applied => _applied;

  void reset() {
    resetCandidate();
    _applied = null;
    _trusted.clear();
    _trustedFullFrame = false;
    _sourceWidth = 0;
    _sourceHeight = 0;
  }

  /// Seek / discontinuity. Keep trusted crops; drop the in-progress streak.
  void resetCandidate() {
    _hits = 0;
    _candidateKind = null;
    _candidateRect = null;
  }

  LetterboxCropDecision observe({
    int? width,
    int? height,
    int? x,
    int? y,
    required int sourceWidth,
    required int sourceHeight,
  }) {
    _sourceWidth = sourceWidth;
    _sourceHeight = sourceHeight;
    final sample = LetterboxCrop.classify(
      width: width,
      height: height,
      x: x,
      y: y,
      sourceWidth: sourceWidth,
      sourceHeight: sourceHeight,
      minRatio: minRatio,
      round: round,
      linkedTolerance: linkedTolerance,
    );

    if (sample.kind == LetterboxSampleKind.ignore) {
      resetCandidate();
      return const LetterboxCropDecision.hold();
    }

    if (_matchesApplied(sample)) {
      resetCandidate();
      return const LetterboxCropDecision.hold();
    }

    if (_sameCandidate(sample)) {
      _hits++;
    } else {
      _candidateKind = sample.kind;
      _candidateRect = sample.rect;
      _hits = 1;
    }

    if (_hits < _hitsNeeded(sample)) {
      return const LetterboxCropDecision.hold();
    }

    _applied = sample.rect;
    if (sample.kind == LetterboxSampleKind.fullFrame) {
      _trustedFullFrame = true;
    } else if (sample.rect != null) {
      _trust(sample.rect!);
    }
    resetCandidate();
    return LetterboxCropDecision.apply(sample.rect);
  }

  bool _matchesApplied(LetterboxSample sample) {
    if (sample.kind == LetterboxSampleKind.fullFrame) {
      return _applied == null;
    }
    final rect = sample.rect;
    final applied = _applied;
    if (rect == null || applied == null) return false;
    return LetterboxCrop.similar(rect, applied, round: round);
  }

  bool _sameCandidate(LetterboxSample sample) {
    if (_candidateKind != sample.kind) return false;
    if (sample.kind == LetterboxSampleKind.fullFrame) return true;
    final a = _candidateRect;
    final b = sample.rect;
    if (a == null || b == null) return false;
    return LetterboxCrop.similar(a, b, round: round);
  }

  int _hitsNeeded(LetterboxSample sample) {
    if (_isTrusted(sample)) return trustedHits;
    if (sample.kind == LetterboxSampleKind.fullFrame) return newCropHits;
    final rect = sample.rect;
    if (rect != null &&
        LetterboxCrop.isKnownRatio(
          width: rect.w,
          height: rect.h,
          sourceWidth: _sourceWidth,
          sourceHeight: _sourceHeight,
        )) {
      return newCropHits;
    }
    return unknownHits;
  }

  bool _isTrusted(LetterboxSample sample) {
    if (sample.kind == LetterboxSampleKind.fullFrame) {
      return _trustedFullFrame;
    }
    final rect = sample.rect;
    if (rect == null) return false;
    for (final trusted in _trusted) {
      if (LetterboxCrop.similar(rect, trusted, round: round)) return true;
    }
    return false;
  }

  void _trust(LetterboxCropRect rect) {
    for (final trusted in _trusted) {
      if (LetterboxCrop.similar(rect, trusted, round: round)) return;
    }
    _trusted.add(rect);
  }
}

/// Per-engine letterbox crop. Backends own detection and applying the crop.
///
/// Implement this on a new player; do not special-case platforms in the UI.
/// Settings and the zoom lock after detect both key off [isSupported].
abstract class LetterboxCropper {
  const LetterboxCropper();

  /// Detector + crop path exist on this engine.
  bool get isSupported;

  /// Why this engine cannot crop yet. Null when [isSupported] is true.
  String? get unimplementedReason =>
      isSupported ? null : 'Letterbox crop is not implemented on this player.';

  /// User preference flipped. No-op when unsupported.
  Future<void> setEnabled(bool enabled);

  /// Keep scanning on [interval]. [Duration.zero] = one-shot after the title
  /// starts.
  Future<void> setRecropInterval(Duration interval);

  /// New title. One-shot unless [setRecropInterval] is greater than zero.
  Future<void> onSourceOpened(String url);

  /// Run detect now, skipping the start delay. No-op when disabled.
  Future<void> recrop();

  /// Drop an applied crop (preference off, failed detect). Not dispose.
  Future<void> reset();
}

/// Default for engines with no detector yet.
class UnsupportedLetterboxCropper extends LetterboxCropper {
  const UnsupportedLetterboxCropper({this.unimplementedReason});

  @override
  final String? unimplementedReason;

  @override
  bool get isSupported => false;

  @override
  Future<void> setEnabled(bool enabled) async {}

  @override
  Future<void> setRecropInterval(Duration interval) async {}

  @override
  Future<void> onSourceOpened(String url) async {}

  @override
  Future<void> recrop() async {}

  @override
  Future<void> reset() async {}
}
