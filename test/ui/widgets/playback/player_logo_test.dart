import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/playback/player_logo.dart';

void main() {
  const tvWidth = 960.0;
  const capWidth = tvWidth * 0.34;

  test('keeps the normal height before the aspect ratio is known', () {
    expect(playerLogoHeight(aspectRatio: null, screenWidth: tvWidth), 64);
  });

  test('keeps the normal height for a standard clear logo', () {
    expect(playerLogoHeight(aspectRatio: 800 / 310, screenWidth: tvWidth), 64);
  });

  test('shrinks a wide wordmark until its width fits the cap', () {
    final height = playerLogoHeight(aspectRatio: 6, screenWidth: tvWidth);
    expect(height * 6, closeTo(capWidth, 0.001));
  });

  test('stops shrinking at the floor for a very wide wordmark', () {
    expect(playerLogoHeight(aspectRatio: 14, screenWidth: tvWidth), 40);
  });

  test('leaves the same wordmark alone on a wider screen', () {
    expect(playerLogoHeight(aspectRatio: 6, screenWidth: 1920), 64);
  });

  group('PlayerLogo', () {
    Future<BuildContext> useTvView(WidgetTester tester) async {
      tester.view.physicalSize = const Size(tvWidth, 540);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(const SizedBox());
      return tester.element(find.byType(SizedBox));
    }

    Future<MemoryImage> logoImage(
      WidgetTester tester,
      int width,
      int height,
    ) async {
      final bytes = await tester.runAsync(() async {
        final recorder = ui.PictureRecorder();
        Canvas(recorder).drawRect(
          Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
          Paint()..color = Colors.white,
        );
        final image = await recorder.endRecording().toImage(width, height);
        final data = await image.toByteData(format: ui.ImageByteFormat.png);
        image.dispose();
        return data!.buffer.asUint8List();
      });
      return MemoryImage(bytes!);
    }

    Future<void> pumpLogo(WidgetTester tester, ImageProvider image) {
      return tester.pumpWidget(
        MaterialApp(
          home: Align(
            alignment: Alignment.topLeft,
            child: PlayerLogo(image: image),
          ),
        ),
      );
    }

    void expectFitsCap(WidgetTester tester) {
      final size = tester.getSize(find.byType(Image));
      expect(size.width, closeTo(capWidth, 0.001));
      expect(size.height, closeTo(capWidth / 6, 0.001));
    }

    testWidgets('sizes a cached logo right away and again when it changes', (
      tester,
    ) async {
      final context = await useTvView(tester);
      final wide = await logoImage(tester, 600, 100);
      final square = await logoImage(tester, 300, 200);
      await tester.runAsync(
        () => Future.wait([
          precacheImage(wide, context),
          precacheImage(square, context),
        ]),
      );

      await pumpLogo(tester, wide);
      expectFitsCap(tester);

      await pumpLogo(tester, square);
      expect(tester.getSize(find.byType(Image)), const Size(96, 64));
    });

    testWidgets('resizes a logo once it finishes decoding', (tester) async {
      final context = await useTvView(tester);
      final wide = await logoImage(tester, 600, 100);
      late Future<void> decoding;
      await tester.runAsync(() async {
        decoding = precacheImage(wide, context);
      });

      await pumpLogo(tester, wide);
      expect(tester.getSize(find.byType(Image)), const Size(0, 64));

      await tester.runAsync(() => decoding);
      await tester.pump();
      expectFitsCap(tester);
    });
  });
}
