import 'package:flutter/material.dart';

import '../theme/app_color_scheme.dart';
import '../theme/glass_settings.dart';
import '../theme/theme_registry.dart';
import 'glass_recipe.dart';
import 'pixel_border_painter.dart';

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    this.cornerRadius = 12,
    this.reinforced = false,
    required this.fallbackColor,
    this.padding,
    this.child,
  });

  final double cornerRadius;
  final bool reinforced;
  final Color fallbackColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(cornerRadius);
    final content =
        padding == null ? child : Padding(padding: padding!, child: child);

    if (AppColorScheme.isPixel) {
      final border = ThemeRegistry.active.borders.cardBorder;
      final painter = PixelBorderPainter(
        fillColor: fallbackColor,
        borderColor: border.color,
        borderWidth: border.width,
        shadowColor: const Color(0xB3000000),
      );
      return CustomPaint(
        painter: painter,
        child: Padding(padding: painter.contentInsets, child: content),
      );
    }

    if (!AppColorScheme.isGlass) {
      return DecoratedBox(
        decoration: BoxDecoration(color: fallbackColor, borderRadius: radius),
        child: content,
      );
    }

    return glassPane(
      tier: GlassSettings.tier,
      fallbackColor: fallbackColor,
      cornerRadius: cornerRadius,
      sigma: GlassRecipe.panelSigma,
      reinforced: reinforced,
      shadow: true,
      context: context,
      child: content,
    );
  }
}
