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

/// Shared accept/reject rules for a detected crop rectangle.
abstract final class LetterboxCrop {
  /// Drop a detect that would keep less than this fraction of the source.
  static const minRatio = 0.5;

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
    if (sourceWidth <= 0 || sourceHeight <= 0) return null;
    if (width <= 0 || height <= 0) return null;

    final effective =
        x > 0 || y > 0 || width < sourceWidth || height < sourceHeight;
    if (!effective) return null;

    final minW = sourceWidth * minRatio;
    final minH = sourceHeight * minRatio;
    if (width < minW || height < minH) return null;

    return LetterboxCropRect(w: width, h: height, x: x, y: y);
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

  /// New title. Detect is one-shot per [url].
  Future<void> onSourceOpened(String url);

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
  Future<void> onSourceOpened(String url) async {}

  @override
  Future<void> reset() async {}
}
