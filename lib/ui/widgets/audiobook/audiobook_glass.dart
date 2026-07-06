import 'package:flutter/widgets.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/idiom/glass_capability.dart';

const double kAudiobookButtonSize = 46;

bool get audiobookGlassEligible => GlassCapability.glassLookActive;

Widget audiobookGlassOrSolid({
  required Widget child,
  required Color fallbackColor,
  double cornerRadius = 14,
  double blur = 14,
  Color? veilColor,
  Color? tint,
  Border? border,
  BuildContext? context,
}) {
  if (!audiobookGlassEligible) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: fallbackColor,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: border,
      ),
      child: child,
    );
  }

  return glassPane(
    tier: GlassSettings.tier,
    fallbackColor: fallbackColor,
    cornerRadius: cornerRadius,
    sigma: blur,
    veilOverride: veilColor,
    tint: tint,
    context: context,
    child: child,
  );
}
