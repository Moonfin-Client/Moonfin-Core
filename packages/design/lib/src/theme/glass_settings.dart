/// Rendering tier for glass surfaces, from richest to cheapest.
///
/// [liquid] and [frost] draw a real backdrop blur. [sheen] fakes the frosted
/// look with translucent tints, a hairline and a top highlight, using no blur
/// at all, which keeps it cheap on weak GPUs such as Android TV boxes running
/// Skia. [solid] is the flat fallback used by non-glass themes.
enum GlassTier { liquid, frost, sheen, solid }

/// Session-wide glass configuration for the design package.
///
/// The design package cannot see platform detection or user preferences, so
/// the app resolves the tier (GlassCapability.apply) at startup and on every
/// Glass Quality or interface-style change, then pushes it here, following
/// the same convention as ThemeRegistry.active.
class GlassSettings {
  GlassSettings._();

  static const double liquidSigmaCap = 32;
  static const double frostSigmaCap = 24;

  static GlassTier tier = GlassTier.solid;

  /// Whether the root GlassBackdrop may animate. Liquid tier only.
  static bool animatedBackdrop = false;

  /// True when the current tier renders a real BackdropFilter.
  static bool get blursBackdrop =>
      tier == GlassTier.liquid || tier == GlassTier.frost;

  /// Clamps a requested blur sigma to the current tier's budget.
  static double capSigma(double requested) => capSigmaFor(tier, requested);

  static double capSigmaFor(GlassTier tier, double requested) {
    switch (tier) {
      case GlassTier.liquid:
        return requested > liquidSigmaCap ? liquidSigmaCap : requested;
      case GlassTier.frost:
        return requested > frostSigmaCap ? frostSigmaCap : requested;
      case GlassTier.sheen:
      case GlassTier.solid:
        return 0;
    }
  }

  /// Sigma for decorative blurs of a widget's own image, where the blur is
  /// part of the artwork treatment. Blur tiers get the normal cap; sheen
  /// keeps a reduced blur instead of dropping the effect, because these
  /// images look broken when shown sharp.
  static double decorativeSigma(double requested) {
    if (blursBackdrop) return capSigma(requested);
    return requested > 12 ? 12 : requested;
  }
}
