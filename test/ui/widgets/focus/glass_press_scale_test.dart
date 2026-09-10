import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/focus/glass_press_scale.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The grow only exists under the glass look, and only while a pointer is
/// actually down.
void main() {
  // Both ends, so a previous file can't leak a glass theme in and this one
  // can't leak one out.
  void reset() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);

  setUp(reset);
  tearDown(reset);

  Widget host(Widget child) => Directionality(
        textDirection: TextDirection.ltr,
        child: Center(child: child),
      );

  const target = SizedBox(width: 80, height: 80);

  testWidgets('grows on pointer down and settles back on release',
      (tester) async {
    ThemeRegistry.setActiveById(ThemeRegistry.glassId);
    await tester.pumpWidget(host(const GlassPressScale(child: target)));

    AnimatedScale scale() =>
        tester.widget<AnimatedScale>(find.byType(AnimatedScale));
    expect(scale().scale, 1.0);

    final gesture =
        await tester.startGesture(tester.getCenter(find.byType(SizedBox)));
    await tester.pump();
    // 17px on an 80px box, comfortably inside the ceiling.
    expect(scale().scale, closeTo(97 / 80, 0.001));

    await gesture.up();
    await tester.pump();
    expect(scale().scale, 1.0);
  });

  testWidgets('a small target is capped rather than ballooning',
      (tester) async {
    ThemeRegistry.setActiveById(ThemeRegistry.glassId);
    await tester.pumpWidget(
      host(const GlassPressScale(child: SizedBox(width: 12, height: 12))),
    );
    await tester.startGesture(tester.getCenter(find.byType(SizedBox)));
    await tester.pump();
    expect(
      tester.widget<AnimatedScale>(find.byType(AnimatedScale)).scale,
      1.3,
    );
  });

  testWidgets('inert under a non-glass theme', (tester) async {
    await tester.pumpWidget(host(const GlassPressScale(child: target)));
    expect(find.byType(AnimatedScale), findsNothing);
  });

  testWidgets('a growth of 0 opts out', (tester) async {
    ThemeRegistry.setActiveById(ThemeRegistry.glassId);
    await tester.pumpWidget(
      host(const GlassPressScale(growth: 0, child: target)),
    );
    expect(find.byType(AnimatedScale), findsNothing);
  });

  testWidgets('inert when the platform asks for reduced motion',
      (tester) async {
    ThemeRegistry.setActiveById(ThemeRegistry.glassId);
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true),
        child: host(const GlassPressScale(child: target)),
      ),
    );
    expect(find.byType(AnimatedScale), findsNothing);
  });
}
