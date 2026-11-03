/// Returns the adjusted gap as a fraction of the height, with a minimum of 0.002
/// (0.2%). Positive offsets increase the gap.
double middleSubtitleGap(double gap, double offset) =>
    (gap + offset).clamp(0.002, 1.0).toDouble();

/// The primary edge in screen coordinates. mpv measures its vertical margin on a
/// 720-line canvas. Callers convert sub-margin-y to a fraction before passing it.
double mpvPrimaryStackingAnchor(int alignment, {double margin = 0.04}) =>
    switch ((alignment - 1) ~/ 3) {
      2 => margin,
      1 => 0.5,
      _ => 1 - margin,
    };

/// Match Media3's 8 px/dp inter-subtitle clearance on mpv's 720-line
/// subtitle layout canvas.
const double mpvSecondarySubtitleGap = 8 / 720;

/// mpv's text size for a saved [fontSize], on the same 720-line canvas.
double mpvSubtitleFontSize(double fontSize) =>
    (fontSize / 24.0 * 55.0).clamp(24.0, 120.0);

/// Returns the secondary subtitle's top edge as a fraction of the height. Place it
/// below a top-aligned primary and above a middle- or bottom-aligned primary. The
/// caller adds secondaryHeight to get the bottom edge required by mpv.
double stackedSecondaryTop({
  required int alignment,
  required double primaryAnchor,
  required double primaryHeight,
  required double secondaryHeight,
  required double offset,
  double gap = mpvSecondarySubtitleGap,
}) {
  final row = (alignment - 1) ~/ 3;
  final top = switch (row) {
    2 => primaryAnchor + primaryHeight + gap + offset,
    1 => primaryAnchor -
        primaryHeight / 2 - secondaryHeight - middleSubtitleGap(gap, offset),
    _ => primaryAnchor - primaryHeight - secondaryHeight - gap - offset,
  };
  return top.clamp(0.0, (1 - secondaryHeight).clamp(0.0, 1.0))
      .toDouble();
}
