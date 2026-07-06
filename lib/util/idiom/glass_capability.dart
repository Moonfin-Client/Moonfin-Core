import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:moonfin_design/moonfin_design.dart'
    show AppColorScheme, GlassSettings, GlassTier;

import '../../preference/preference_constants.dart';
import '../platform_detection.dart';
import 'app_ui_idiom.dart';

export 'package:moonfin_design/moonfin_design.dart' show GlassTier;

class GlassCapability {
  GlassCapability._();

  /// Whether the glass look applies at adaptive call sites. Always true under
  /// Apple idioms (including leanback), and under the glass theme on every
  /// platform. Sites where this is false fall back to solid surfaces.
  static bool get glassLookActive =>
      AppColorScheme.isGlass ||
      AppUiIdiomResolver.isApple ||
      AppUiIdiomResolver.current == AppUiIdiom.tvosLeanback;

  /// Resolves the glass rendering tier from platform capability and the
  /// Glass Quality preference. This only decides how glass is drawn; whether
  /// a call site draws glass at all is gated there (glass theme or Apple
  /// idiom).
  static GlassTier resolve(GlassQualityMode quality) {
    if (quality == GlassQualityMode.reduced) return GlassTier.sheen;
    // CanvasKit backdrop blur across the shell is a known jank source.
    if (kIsWeb) return GlassTier.sheen;
    if (PlatformDetection.isAppleTV) return GlassTier.frost;
    // TV boxes are the weakest GPUs we ship to and default to Skia, where
    // BackdropFilter is most expensive, so real blur is opt-in via full.
    if (PlatformDetection.isTV) {
      return quality == GlassQualityMode.full
          ? GlassTier.frost
          : GlassTier.sheen;
    }
    if ((PlatformDetection.isIOS || PlatformDetection.isMacOS) &&
        PlatformDetection.osMajor >= 26) {
      return GlassTier.liquid;
    }
    // Older Apple, Android mobile, Windows/Linux desktop.
    return GlassTier.frost;
  }

  /// Recomputes the tier and pushes it into the design package. Called at
  /// startup (after TV-mode detection) and whenever the Glass Quality or
  /// interface-style preference changes.
  static void apply(GlassQualityMode quality) {
    final tier = resolve(quality);
    GlassSettings.tier = tier;
    GlassSettings.animatedBackdrop = tier == GlassTier.liquid;
  }
}
