import '../../preference/preference_constants.dart';

/// Concrete rendering limits resolved from the user's backdrop preference.
///
/// Keeping this policy outside the widget makes the automatic TV behavior
/// deterministic and testable without pretending that every TV GPU has the
/// same capabilities as a phone or desktop GPU.
class BackdropRenderProfile {
  final int maxDecodeWidth;
  final Duration transitionDuration;
  final bool animateTransitions;

  const BackdropRenderProfile({
    required this.maxDecodeWidth,
    required this.transitionDuration,
    required this.animateTransitions,
  });

  static const quality = BackdropRenderProfile(
    maxDecodeWidth: 1280,
    transitionDuration: Duration(milliseconds: 800),
    animateTransitions: true,
  );

  static const performance = BackdropRenderProfile(
    maxDecodeWidth: 720,
    transitionDuration: Duration.zero,
    animateTransitions: false,
  );

  static BackdropRenderProfile resolve(
    BackdropRenderMode mode, {
    required bool isTv,
  }) => switch (mode) {
    BackdropRenderMode.automatic => isTv ? performance : quality,
    BackdropRenderMode.quality => quality,
    BackdropRenderMode.performance => performance,
  };
}
