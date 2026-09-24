import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/tv_ui_scale.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';

void main() {
  group('the TV design canvas', () {
    test('is the same whatever density the panel reports', () {
      // tvOS hands Flutter 1920 points across. A 1080p Android TV at density
      // two hands it 960. Both have to lay out on the same canvas, or the ten
      // foot constants land at different sizes on each.
      final tvos = tvUiLogicalSize(const Size(1920, 1080));
      final androidTv = tvUiLogicalSize(const Size(960, 540));

      expect(tvos.width, closeTo(kTvDesignWidth, 0.01));
      expect(androidTv.width, closeTo(kTvDesignWidth, 0.01));
      expect(tvos.height, closeTo(androidTv.height, 0.01));
      expect(tvos.height, closeTo(745.0, 0.5));
    });

    test('drives a 1080p panel at the scale the layouts were drawn for', () {
      expect(tvUiScaleFor(1920), closeTo(kTvTargetScale, 0.001));
      expect(tvUiScaleFor(960), closeTo(kTvTargetScale / 2, 0.001));
    });

    test('leaves the effective density the same on both', () {
      // What the panel ends up painting at is the density it reported times
      // the magnification. Both land on 1.45, which is 1920 real pixels.
      const tvosReported = 1.0;
      const androidTvReported = 2.0;
      expect(
        tvosReported * tvUiScaleFor(1920),
        closeTo(androidTvReported * tvUiScaleFor(960), 0.001),
      );
    });

    test('is a no-op on a panel already at the design width', () {
      expect(tvUiScaleIsNegligible(kTvDesignWidth), isTrue);
      expect(tvUiScaleIsNegligible(1920), isFalse);
      expect(tvUiScaleIsNegligible(960), isFalse);
    });

    test("doesn't divide by a width the platform hasn't reported yet", () {
      expect(tvUiScaleFor(0), 1.0);
      expect(tvUiLogicalSize(Size.zero), Size.zero);
    });

    test('a 4K panel lands on the same canvas as a 1080p one', () {
      expect(
        tvUiLogicalSize(const Size(3840, 2160)).width,
        closeTo(tvUiLogicalSize(const Size(1920, 1080)).width, 0.01),
      );
    });
  });

  group('a player put back on the panel', () {
    Future<({Size laidOut, Rect onScreen, int transforms, double dpr})> pump(
      WidgetTester tester, {
      required Size panel,
      required double density,
      Rect? slot,
    }) async {
      tester.view.physicalSize = panel * density;
      tester.view.devicePixelRatio = density;
      addTearDown(tester.view.reset);

      final key = GlobalKey();
      late double seenDpr;
      final surface = UnscaledPlatformView(
        child: Builder(
          builder: (context) {
            seenDpr = MediaQuery.devicePixelRatioOf(context);
            return SizedBox.expand(key: key);
          },
        ),
      );

      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData.fromView(tester.view),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: TvUiScale(
              child: Stack(
                children: [
                  if (slot == null)
                    Positioned.fill(child: surface)
                  else
                    Positioned.fromRect(rect: slot, child: surface),
                ],
              ),
            ),
          ),
        ),
      );

      return (
        laidOut: tester.getSize(find.byKey(key)),
        onScreen: tester.getRect(find.byKey(key)),
        transforms: find.byType(Transform).evaluate().length,
        dpr: seenDpr,
      );
    }

    testWidgets('lays out on the panel rather than the canvas', (tester) async {
      // A 1080p Android TV at density two, where the canvas is 1324 across.
      final result = await pump(
        tester,
        panel: const Size(960, 540),
        density: 2.0,
      );

      expect(
        result.laidOut,
        const Size(960, 540),
        reason: 'the buffer the engine builds from this has to match the panel',
      );
    });

    testWidgets('lands in the same place on screen', (tester) async {
      final result = await pump(
        tester,
        panel: const Size(960, 540),
        density: 2.0,
      );

      expect(result.onScreen, const Rect.fromLTRB(0, 0, 960, 540));
    });

    testWidgets('hands the panel its own density back', (tester) async {
      // Anything sizing itself against the density, artwork requests among
      // them, has to see the one the display really reports.
      final result = await pump(
        tester,
        panel: const Size(960, 540),
        density: 2.0,
      );

      expect(result.dpr, 2.0);
    });

    testWidgets("keeps a slot that isn't the whole screen", (tester) async {
      // The Live TV mini player is a small box inside the guide.
      final result = await pump(
        tester,
        panel: const Size(960, 540),
        density: 2.0,
        slot: const Rect.fromLTWH(40, 32, 300, 168),
      );

      expect(result.laidOut.width, closeTo(217.5, 0.1));
      expect(result.onScreen.width, closeTo(217.5, 0.1));
      expect(result.onScreen.left, closeTo(29, 0.1));
    });

    testWidgets('adds nothing on a panel already at the design width', (
      tester,
    ) async {
      final result = await pump(
        tester,
        panel: const Size(1324, 745),
        density: 1.0,
      );

      expect(
        result.transforms,
        0,
        reason: "there's nothing to undo, so there should be no layer",
      );
      expect(result.laidOut, const Size(1324, 745));
    });
  });
}
