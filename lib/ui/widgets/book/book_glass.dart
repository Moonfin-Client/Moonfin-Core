import 'package:flutter/widgets.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/idiom/glass_capability.dart';

bool get bookGlassEligible => GlassCapability.glassLookActive;

Widget bookGlassOrSolid({
  required Widget child,
  required Color fallbackColor,
  double cornerRadius = 16,
  double blur = 16,
  Color? tint,
  BuildContext? context,
}) {
  return glassPane(
    tier: bookGlassEligible ? GlassSettings.tier : GlassTier.solid,
    fallbackColor: fallbackColor,
    cornerRadius: cornerRadius,
    sigma: blur,
    tint: tint,
    context: context,
    child: child,
  );
}
