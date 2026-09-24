/// The one place the size to ask the server for is worked out.
///
/// The URL is the disk cache key and the server encodes one file per size it
/// is asked for, so every screen that asks for the same poster at a slightly
/// different width costs a server encode, a download and a cache file of its
/// own. Rounding up in coarse steps means a poster is asked for at one of a
/// handful of widths across the whole app, and a card that grows a few
/// points under a different layout still hits the file already on disk.
library;

/// Server requests and decodes both stop scaling here, so a phone that
/// reports 3 asks for and decodes the same 2x image.
const maxArtworkDevicePixelRatio = 2.0;

/// [logical] points as pixels on this display, rounded up so nothing painted
/// at this size is ever stretched.
int artworkPhysicalPixels(double logical, double devicePixelRatio) {
  final dpr = devicePixelRatio.clamp(1.0, maxArtworkDevicePixelRatio);
  return (logical * dpr).ceil();
}

/// The shape of the box the artwork fills, which picks the step.
enum ArtworkShape {
  /// Two by three posters and square covers. Step 140: 140, 280, 420, 560,
  /// 700, 840.
  poster(140),

  /// Sixteen by nine thumbs, banners and backdrops. Step 240: 240, 480, 720,
  /// 960, 1200, 1440, 1680, 1920.
  landscape(240);

  const ArtworkShape(this.step);

  /// The request widths climb in multiples of this. Both steps are multiples
  /// of the twenty pixel decode step, so the decode is never wider than the
  /// request and the decoder is never asked to upscale.
  final int step;

  /// The shape for a card of this aspect ratio, width over height.
  static ArtworkShape forAspectRatio(double aspectRatio) =>
      aspectRatio > 1.2 ? landscape : poster;
}

/// The width to ask the server for so artwork covers [logicalWidth] points
/// at this display's density, rounded up to the next step for [shape].
int artworkRequestWidth(
  double logicalWidth,
  double devicePixelRatio,
  ArtworkShape shape,
) {
  final pixels = artworkPhysicalPixels(logicalWidth, devicePixelRatio);
  if (pixels <= 0) return shape.step;
  return ((pixels + shape.step - 1) ~/ shape.step) * shape.step;
}
