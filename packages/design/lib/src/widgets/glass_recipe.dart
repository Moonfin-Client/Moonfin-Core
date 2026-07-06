import 'dart:ui';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

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
}

/// Renders [child] on a glass pane of the requested [tier].
///
/// - [GlassTier.solid]: flat [fallbackColor].
/// - [GlassTier.sheen]: zero-blur fake frost built from a translucent base
///   derived from [fallbackColor], a white veil, a top highlight and a
///   gradient hairline.
/// - [GlassTier.frost]/[GlassTier.liquid]: real backdrop blur (joined to the
///   nearest [BackdropGroup] when [context] is provided) under the same veil,
///   highlight and hairline.
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
        content: content,
      );
    case GlassTier.frost:
    case GlassTier.liquid:
      final capped = GlassSettings.capSigmaFor(tier, sigma);
      final blur = ImageFilter.blur(sigmaX: capped, sigmaY: capped);
      Widget frost = ColoredBox(color: veilOverride ?? GlassRecipe.veil);
      final grouped = context != null && BackdropGroup.of(context) != null;
      frost = grouped
          ? BackdropFilter.grouped(filter: blur, child: frost)
          : BackdropFilter(filter: blur, child: frost);
      return _pane(
        radius: radius,
        cornerRadius: cornerRadius,
        shadow: shadow,
        backdrop: frost,
        tint: tint,
        reinforced: reinforced,
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
      const Positioned.fill(
        child: IgnorePointer(
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: GlassRecipe.topHighlight),
          ),
        ),
      ),
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
