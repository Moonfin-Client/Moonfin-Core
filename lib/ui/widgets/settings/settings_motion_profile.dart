import 'package:flutter/widgets.dart';

import '../../../util/platform_detection.dart';

/// Rendering policy for settings surfaces.
///
/// TV clients trade decorative motion for immediate D-pad feedback. This is
/// especially important on older Android TV renderers, where sliding and
/// fading a clipped full-height panel can queue seconds of main/render-thread
/// work after a single key press.
class SettingsMotionProfile {
  final Duration panelTransitionDuration;
  final Duration nestedTransitionDuration;
  final Duration nestedReverseTransitionDuration;
  final Duration tileFocusDuration;
  final Duration focusScrollDuration;
  final bool animateTransitions;
  final bool showFocusGlow;
  final bool useHardEdgeClip;

  const SettingsMotionProfile({
    required this.panelTransitionDuration,
    required this.nestedTransitionDuration,
    required this.nestedReverseTransitionDuration,
    required this.tileFocusDuration,
    required this.focusScrollDuration,
    required this.animateTransitions,
    required this.showFocusGlow,
    required this.useHardEdgeClip,
  });

  static const quality = SettingsMotionProfile(
    panelTransitionDuration: Duration(milliseconds: 220),
    nestedTransitionDuration: Duration(milliseconds: 160),
    nestedReverseTransitionDuration: Duration(milliseconds: 130),
    tileFocusDuration: Duration(milliseconds: 90),
    focusScrollDuration: Duration(milliseconds: 120),
    animateTransitions: true,
    showFocusGlow: true,
    useHardEdgeClip: false,
  );

  static const performance = SettingsMotionProfile(
    panelTransitionDuration: Duration.zero,
    nestedTransitionDuration: Duration.zero,
    nestedReverseTransitionDuration: Duration.zero,
    tileFocusDuration: Duration.zero,
    focusScrollDuration: Duration.zero,
    animateTransitions: false,
    showFocusGlow: false,
    useHardEdgeClip: true,
  );

  static SettingsMotionProfile resolve({
    required bool isTv,
    bool disableAnimations = false,
  }) => isTv || disableAnimations ? performance : quality;

  static SettingsMotionProfile of(BuildContext context) => resolve(
    isTv: PlatformDetection.isTV,
    disableAnimations: MediaQuery.maybeOf(context)?.disableAnimations ?? false,
  );
}
