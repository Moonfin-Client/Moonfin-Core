import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/widgets/backdrop_render_profile.dart';

void main() {
  test('automatic uses the performance profile on TV', () {
    final profile = BackdropRenderProfile.resolve(
      BackdropRenderMode.automatic,
      isTv: true,
    );

    expect(profile.maxDecodeWidth, 720);
    expect(profile.animateTransitions, isFalse);
  });

  test('automatic preserves the quality profile off TV', () {
    final profile = BackdropRenderProfile.resolve(
      BackdropRenderMode.automatic,
      isTv: false,
    );

    expect(profile.maxDecodeWidth, 1280);
    expect(profile.animateTransitions, isTrue);
    expect(profile.transitionDuration, const Duration(milliseconds: 800));
  });

  test('explicit modes override the device default', () {
    expect(
      BackdropRenderProfile.resolve(
        BackdropRenderMode.quality,
        isTv: true,
      ),
      same(BackdropRenderProfile.quality),
    );
    expect(
      BackdropRenderProfile.resolve(
        BackdropRenderMode.performance,
        isTv: false,
      ),
      same(BackdropRenderProfile.performance),
    );
  });
}
