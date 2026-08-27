import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/settings/settings_motion_profile.dart';

void main() {
  test('TV settings use immediate low-cost motion', () {
    final profile = SettingsMotionProfile.resolve(isTv: true);

    expect(profile.panelTransitionDuration, Duration.zero);
    expect(profile.nestedTransitionDuration, Duration.zero);
    expect(profile.tileFocusDuration, Duration.zero);
    expect(profile.focusScrollDuration, Duration.zero);
    expect(profile.animateTransitions, isFalse);
    expect(profile.showFocusGlow, isFalse);
    expect(profile.useHardEdgeClip, isTrue);
  });

  test('non-TV settings preserve the existing presentation', () {
    final profile = SettingsMotionProfile.resolve(isTv: false);

    expect(
      profile.panelTransitionDuration,
      const Duration(milliseconds: 220),
    );
    expect(
      profile.nestedTransitionDuration,
      const Duration(milliseconds: 160),
    );
    expect(profile.tileFocusDuration, const Duration(milliseconds: 90));
    expect(profile.focusScrollDuration, const Duration(milliseconds: 120));
    expect(profile.animateTransitions, isTrue);
    expect(profile.showFocusGlow, isTrue);
    expect(profile.useHardEdgeClip, isFalse);
  });

  test('reduced-motion accessibility uses the performance profile', () {
    expect(
      SettingsMotionProfile.resolve(
        isTv: false,
        disableAnimations: true,
      ),
      same(SettingsMotionProfile.performance),
    );
  });
}
