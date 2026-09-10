import 'dart:ui';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart' as lgw;

import '../theme/glass_settings.dart';

/// The single visual recipe shared by every glass surface in the app, so
/// Apple TV, desktop and Android TV render the same look at different costs.
class GlassRecipe {
  GlassRecipe._();

  /// White veil laid over the blurred backdrop on frost/liquid tiers.
  static const veil = Color(0x1FFFFFFF);

  /// Stronger veil used when no blur backs the surface (web, sheen tier).
  static const webVeil = Color(0x40FFFFFF);
  static const sheenVeil = Color(0x24FFFFFF);

  /// Opacity multiplier applied to the caller's fallback color to form the
  /// translucent base of a sheen pane (lets the background show through).
  static const sheenBaseOpacity = 0.62;

  /// Dark base under every sheen pane; carries the legibility work that the
  /// backdrop blur would otherwise do on frost/liquid tiers.
  static const sheenTint = Color(0x66101620);

  static const hairlineTop = Color(0x59FFFFFF);
  static const hairlineBottom = Color(0x0FFFFFFF);

  static const reinforceScrim = Color(0x73000000);

  static const topHighlight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.35],
    colors: [Color(0x14FFFFFF), Color(0x00FFFFFF)],
  );

  static const panelShadow = BoxShadow(
    color: Color(0x59000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );

  static const double panelSigma = 14;

  /// Glass depth handed to the package renderer.
  ///
  /// The shader treats 10 as neutral and bends the refracted backdrop by
  /// `surfaceNormal * edgeInfluence * thickness * 0.5`, so the distortion
  /// stays on the rim and the interior of a pane stays flat. 20 is the
  /// library's own default and gives a large chrome surface a visible edge
  /// without warping what sits behind it.
  ///
  /// Don't zero this to save GPU. The shader has no thickness-gated branches,
  /// so the rim maths runs every frame regardless. Zero just takes 0.10 off
  /// the rim's brightness and 15% off its alpha.
  static const double thickness = 20;

  /// Scales the shader's key and kick specular highlights and feeds the rim's
  /// base opacity. At zero the specular vanishes outright and takes most of
  /// what separates glass from a blur with it.
  static const double lightIntensity = 0.5;

  /// Meniscus darkening at the rim. Physical glass is thickest at the curve,
  /// so light crossing it loses energy and the bright rim reads as an edge
  /// rather than a drawn stroke. 0.12 is upstream's dark-mode suggestion, and
  /// Moonfin is dark everywhere the glass theme is on.
  static const double edgeAbsorption = 0.12;
}

/// Renders [child] on a glass pane of the requested [tier].
///
/// - [GlassTier.solid]: flat [fallbackColor].
/// - [GlassTier.sheen]: zero-blur fake frost built from a translucent base
///   derived from [fallbackColor], a white veil, a top highlight and a
///   gradient hairline.
/// - [GlassTier.frost]/[GlassTier.liquid]: real backdrop blur under the same
///   veil. On the package renderer the shader draws the rim and highlight
///   itself. Otherwise a raw [BackdropFilter] (joined to the nearest
///   [BackdropGroup] when [context] is provided) sits under the same
///   highlight and hairline as sheen.
Widget glassPane({
  required GlassTier tier,
  required Color fallbackColor,
  Widget? child,
  double cornerRadius = 12,
  double sigma = GlassRecipe.panelSigma,
  Color? tint,
  Color? veilOverride,
  bool reinforced = false,
  bool shadow = false,
  EdgeInsetsGeometry? padding,
  BuildContext? context,
}) {
  final radius = BorderRadius.circular(cornerRadius);
  final content =
      padding == null ? child : Padding(padding: padding, child: child);

  switch (tier) {
    case GlassTier.solid:
      return DecoratedBox(
        decoration: BoxDecoration(color: fallbackColor, borderRadius: radius),
        child: content,
      );
    case GlassTier.sheen:
      // Scaled-down fallback over a dark tint, under a white veil: keeps the
      // pane legible over bright artwork without any blur to hide it.
      final scaled = fallbackColor.withValues(
        alpha: fallbackColor.a * GlassRecipe.sheenBaseOpacity,
      );
      final base = Color.alphaBlend(scaled, GlassRecipe.sheenTint);
      final veil =
          veilOverride ?? (kIsWeb ? GlassRecipe.webVeil : GlassRecipe.sheenVeil);
      return _pane(
        radius: radius,
        cornerRadius: cornerRadius,
        shadow: shadow,
        backdrop: ColoredBox(
          color: Color.alphaBlend(veil, base),
        ),
        tint: tint,
        reinforced: reinforced,
        shaderRim: false,
        content: content,
      );
    case GlassTier.frost:
    case GlassTier.liquid:
      final capped = GlassSettings.capSigmaFor(tier, sigma);
      final packaged = GlassSettings.usePackageRenderer;
      Widget frost;
      if (packaged) {
        // Package-backed frosted layer. Quality resolves from the app's
        // ambient GlassAdaptiveScope, so panes cheapen under GPU and thermal
        // pressure and recover when the device cools.
        //
        // Aberration stays off because any non-zero value takes the shader's
        // three-sample branch instead of its one, tripling the dependent
        // backdrop reads for a fringe upstream still calls rough. Glow and
        // shadow stay off because _pane draws its own shadow and the glow
        // would add a layer for nothing.
        frost = lgw.GlassContainer(
          shape: lgw.LiquidRoundedRectangle(borderRadius: cornerRadius),
          settings: lgw.LiquidGlassSettings(
            glassColor: veilOverride ?? GlassRecipe.veil,
            blur: capped,
            thickness: GlassRecipe.thickness,
            lightIntensity: GlassRecipe.lightIntensity,
            edgeAbsorption: GlassRecipe.edgeAbsorption,
            chromaticAberration: 0,
            saturation: 1.0,
            glowIntensity: 0,
            shadowElevation: 0,
          ),
        );
      } else {
        final blur = ImageFilter.blur(sigmaX: capped, sigmaY: capped);
        frost = ColoredBox(color: veilOverride ?? GlassRecipe.veil);
        final grouped = context != null && BackdropGroup.of(context) != null;
        frost = grouped
            ? BackdropFilter.grouped(filter: blur, child: frost)
            : BackdropFilter(filter: blur, child: frost);
      }
      return _pane(
        radius: radius,
        cornerRadius: cornerRadius,
        shadow: shadow,
        backdrop: frost,
        tint: tint,
        reinforced: reinforced,
        shaderRim: packaged,
        content: content,
      );
  }
}

Widget _pane({
  required BorderRadius radius,
  required double cornerRadius,
  required bool shadow,
  required Widget backdrop,
  required Color? tint,
  required bool reinforced,
  required bool shaderRim,
  required Widget? content,
}) {
  final surface = Stack(
    fit: StackFit.passthrough,
    children: [
      Positioned.fill(child: backdrop),
      if (tint != null) Positioned.fill(child: ColoredBox(color: tint)),
      if (reinforced)
        const Positioned.fill(
          child: ColoredBox(color: GlassRecipe.reinforceScrim),
        ),
      ?content,
      // The package renderer draws its own directional specular and a rim
      // whose alpha rides thickness. Painting these on top as well would
      // double the edge, so only the raw BackdropFilter and sheen tiers keep
      // them.
      if (!shaderRim)
        const Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: GlassRecipe.topHighlight),
            ),
          ),
        ),
      if (!shaderRim)
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: GlassHairlinePainter(radius: cornerRadius),
            ),
          ),
        ),
    ],
  );

  final clipped = ClipRRect(borderRadius: radius, child: surface);
  if (!shadow) return clipped;
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: radius,
      boxShadow: const [GlassRecipe.panelShadow],
    ),
    child: clipped,
  );
}

class GlassHairlinePainter extends CustomPainter {
  const GlassHairlinePainter({required this.radius});

  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(0.5),
      Radius.circular(radius),
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [GlassRecipe.hairlineTop, GlassRecipe.hairlineBottom],
      ).createShader(rect);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(GlassHairlinePainter oldDelegate) =>
      oldDelegate.radius != radius;
}
