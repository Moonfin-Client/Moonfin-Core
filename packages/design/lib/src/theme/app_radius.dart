import 'package:flutter/widgets.dart';

import 'app_color_scheme.dart';

/// Corner-radius helper. Collapses to square corners under the retro pixel
/// theme (`AppColorScheme.isPixel`) and returns the given rounded radius for
/// every other theme. Drop-in replacement for `BorderRadius.circular`.
abstract final class AppRadius {
  static BorderRadius circular(double radius) => AppColorScheme.isPixel
      ? BorderRadius.zero
      : BorderRadius.circular(radius);
}
