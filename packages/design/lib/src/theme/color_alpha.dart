import 'dart:ui';

extension ColorAlphaScaling on Color {
  /// Multiplies the existing alpha instead of replacing it. Glass themes
  /// define surface tokens as translucent tints, so replacing their alpha
  /// with a high value turns them into near-solid fills that clash with the
  /// paired text color. Opaque themes are unaffected by scaling.
  Color scaleAlpha(double factor) => withValues(alpha: a * factor);
}
