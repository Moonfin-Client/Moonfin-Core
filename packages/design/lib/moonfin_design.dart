// GlassAdaptiveScope is experimental upstream, but adaptive quality is the
// point of adopting the package and the version is pinned exact.
// ignore_for_file: experimental_member_use
library;

// Re-exported so the app can wire the adaptive scope and startup shader
// warm-up without depending on liquid_glass_widgets directly.
export 'package:liquid_glass_widgets/liquid_glass_widgets.dart'
    show GlassQuality, GlassAdaptiveScope, LiquidGlassWidgets;

export 'src/tokens.dart';
export 'src/theme/app_colors.dart';
export 'src/theme/color_alpha.dart';
export 'src/theme/app_color_scheme.dart';
export 'src/theme/app_radius.dart';
export 'src/theme/app_typography.dart';
export 'src/theme/app_spacing.dart';
export 'src/theme/app_shapes.dart';
export 'src/theme/theme_spec.dart';
export 'src/theme/theme_registry.dart';
export 'src/theme/oled_tuning.dart';
export 'src/theme/oled_derivation.dart';
export 'src/theme/glass_settings.dart';
export 'src/widgets/ambient_background.dart';
export 'src/widgets/glass_surface.dart';
export 'src/widgets/glass_backdrop.dart';
export 'src/widgets/glass_recipe.dart';
export 'src/widgets/pixel_border_painter.dart';
