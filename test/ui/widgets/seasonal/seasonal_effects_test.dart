import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/ui/screensaver/screensaver_controller.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_effects.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_simulation.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_sprite_atlas.dart';

class _Screensaver extends Fake implements ScreensaverController {
  @override
  final visible = ValueNotifier<bool>(false);
}

Widget _host(
  String effect, {
  String density = 'normal',
  bool reducedFrameRate = false,
  double pixelRatio = 2,
  bool disableAnimations = false,
  bool tickersEnabled = true,
}) => MediaQuery(
  data: MediaQueryData(
    size: const Size(800, 600),
    devicePixelRatio: pixelRatio,
    disableAnimations: disableAnimations,
  ),
  child: Directionality(
    textDirection: TextDirection.ltr,
    child: TickerMode(
      enabled: tickersEnabled,
      child: SeasonalEffectsHost(
        effect: effect,
        density: density,
        reducedFrameRate: reducedFrameRate,
      ),
    ),
  ),
);

/// Whether the effect is still asking for frames once the tree has settled.
Future<bool> _keepsDrawing(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump(const Duration(milliseconds: 100));
  return tester.binding.hasScheduledFrame;
}

/// Whether the reduced rate's timer asks for a frame. A pump would draw that frame before
/// returning, so the clock is moved on without one.
Future<bool> _timerAsksForFrames(WidgetTester tester) async {
  await tester.pump();
  await tester.binding.delayed(const Duration(milliseconds: 100));
  return tester.binding.hasScheduledFrame;
}

void main() {
  late _Screensaver screensaver;

  setUp(() async {
    await GetIt.instance.reset();
    screensaver = _Screensaver();
    GetIt.instance.registerSingleton<ScreensaverController>(screensaver);
  });

  tearDown(() => GetIt.instance.reset());

  group('draws nothing and asks for no frames', () {
    for (final value in ['none', 'bogus', 'aurora']) {
      testWidgets('for $value', (tester) async {
        await tester.pumpWidget(_host(value));
        expect(find.byType(SeasonalEffectsLayer), findsNothing);
        expect(await _keepsDrawing(tester), isFalse);
      });
    }

    testWidgets('with reduce motion on', (tester) async {
      await tester.pumpWidget(_host('snow', disableAnimations: true));
      expect(find.byType(SeasonalEffectsLayer), findsNothing);
      expect(await _keepsDrawing(tester), isFalse);
    });

    testWidgets('while the screensaver is up', (tester) async {
      screensaver.visible.value = true;
      await tester.pumpWidget(_host('snow'));
      expect(find.byType(SeasonalEffectsLayer), findsNothing);
      expect(await _keepsDrawing(tester), isFalse);
    });
  });

  testWidgets('runs, stops for the screensaver, and comes back after it', (
    tester,
  ) async {
    await tester.pumpWidget(_host('fireworks'));
    expect(find.byType(SeasonalEffectsLayer), findsOneWidget);
    expect(await _keepsDrawing(tester), isTrue);

    screensaver.visible.value = true;
    await tester.pump();
    expect(find.byType(SeasonalEffectsLayer), findsNothing);
    expect(await _keepsDrawing(tester), isFalse);

    screensaver.visible.value = false;
    await tester.pump();
    expect(find.byType(SeasonalEffectsLayer), findsOneWidget);
    expect(await _keepsDrawing(tester), isTrue);
  });

  testWidgets("maps an older client's winter onto snow", (tester) async {
    await tester.pumpWidget(_host('winter'));
    final layer = tester.widget<SeasonalEffectsLayer>(
      find.byType(SeasonalEffectsLayer),
    );
    expect(layer.effect.name, 'snow');
  });

  testWidgets('runs without the screensaver registered', (tester) async {
    await GetIt.instance.reset();
    await tester.pumpWidget(_host('leaves', density: 'heavy'));
    final layer = tester.widget<SeasonalEffectsLayer>(
      find.byType(SeasonalEffectsLayer),
    );
    expect(layer.density.name, 'heavy');
    expect(await _keepsDrawing(tester), isTrue);
  });

  testWidgets('rebuilds the sprites when the pixel ratio changes', (
    tester,
  ) async {
    final before = SeasonalSpriteAtlas.debugBuildCount;
    await tester.pumpWidget(_host('confetti', pixelRatio: 2));
    await tester.pump(const Duration(milliseconds: 50));
    expect(SeasonalSpriteAtlas.debugBuildCount, before + 1);

    await tester.pumpWidget(_host('confetti', pixelRatio: 3));
    await tester.pump(const Duration(milliseconds: 50));
    expect(SeasonalSpriteAtlas.debugBuildCount, before + 2);

    await tester.pumpWidget(_host('confetti', pixelRatio: 3));
    expect(SeasonalSpriteAtlas.debugBuildCount, before + 2);
  });

  testWidgets('every effect paints frames without errors', (tester) async {
    for (final effect in SeasonalEffect.values) {
      await tester.pumpWidget(_host(effect.name));
      for (var i = 0; i < 30; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(tester.takeException(), isNull, reason: effect.name);
    }
    await tester.pumpWidget(const SizedBox.shrink());
    expect(await _keepsDrawing(tester), isFalse);
  });

  group('reduced frame rate', () {
    testWidgets('steps on a timer while Home is showing', (tester) async {
      await tester.pumpWidget(_host('snow', reducedFrameRate: true));
      expect(await _timerAsksForFrames(tester), isTrue);
      // And no ticker asks for frames at the full rate.
      expect(tester.binding.transientCallbackCount, 0);
    });

    testWidgets('stops its timer when a route covers Home', (tester) async {
      await tester.pumpWidget(
        _host('snow', reducedFrameRate: true, tickersEnabled: false),
      );
      expect(find.byType(SeasonalEffectsLayer), findsOneWidget);
      expect(await _timerAsksForFrames(tester), isFalse);

      await tester.pumpWidget(_host('snow', reducedFrameRate: true));
      expect(await _timerAsksForFrames(tester), isTrue);
    });
  });
}
