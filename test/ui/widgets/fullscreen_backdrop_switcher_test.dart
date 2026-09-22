import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/fullscreen_backdrop_switcher.dart';
import 'package:moonfin/ui/widgets/image_source.dart';

import '../../support/artwork_fixture.dart';

void main() {
  group('decode bound', _decodeTests);

  Widget app(String? imageUrl) {
    return MaterialApp(
      home: FullscreenBackdropSwitcher(
        imageUrl: imageUrl,
        duration: const Duration(milliseconds: 800),
        imageBuilder: (url) => Text(url),
      ),
    );
  }

  testWidgets('does not restart the backdrop fade during rapid changes', (
    tester,
  ) async {
    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));
    await tester.pump(const Duration(milliseconds: 400));

    await tester.pumpWidget(app('c'));

    final fadeFinder = find.descendant(
      of: find.byType(FullscreenBackdropSwitcher),
      matching: find.byType(FadeTransition),
    );

    final fade = tester.widget<FadeTransition>(fadeFinder);

    expect(
      fade.opacity.value,
      greaterThan(0),
      reason: 'rapid changes should not restart the active fade from zero',
    );
  });

  testWidgets('clears all backdrop layers immediately when URL becomes null', (
    tester,
  ) async {
    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));
    await tester.pump(const Duration(milliseconds: 300));

    await tester.pumpWidget(app('c'));

    expect(find.text('a'), findsOneWidget);
    expect(find.text('b'), findsOneWidget);

    await tester.pumpWidget(app(null));

    expect(find.text('a'), findsNothing);
    expect(find.text('b'), findsNothing);
    expect(find.text('c'), findsNothing);

    final fadeFinder = find.descendant(
      of: find.byType(FullscreenBackdropSwitcher),
      matching: find.byType(FadeTransition),
    );

    expect(fadeFinder, findsNothing);
  });

  testWidgets('drops stale pending backdrop when focus returns to incoming', (
    tester,
  ) async {
    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));
    await tester.pump(const Duration(milliseconds: 200));

    await tester.pumpWidget(app('a'));

    await tester.pumpWidget(app('b'));

    await tester.pumpAndSettle();

    expect(find.text('b'), findsOneWidget);
    expect(find.text('a'), findsNothing);
  });
}

void _decodeTests() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final imageCache = PaintingBinding.instance.imageCache;
  late Directory temp;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('moonfin-switcher');
    final png = await writeTestPng(temp, width: 1920, height: 1080);
    CachedNetworkImageProvider.defaultCacheManager = FakeArtworkCacheManager(
      png,
    );
    imageCache.clear();
    ArtworkDecode.resetRememberedBounds();
  });

  tearDown(() async {
    imageCache.clear();
    await temp.delete(recursive: true);
  });

  testWidgets('the default image path decodes a portrait cover at full width', (
    tester,
  ) async {
    // A 390 by 844 phone at 2x. A bound taken from the box width alone would
    // be 780 pixels for a backdrop that paints about 3000 wide.
    tester.view.physicalSize = const Size(780, 1688);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    const url = 'http://server/Items/1/Images/Backdrop/0?maxWidth=1920';
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: FullscreenBackdropSwitcher(
            imageUrl: url,
            duration: Duration(milliseconds: 300),
          ),
        ),
      );
      for (var i = 0; i < 25 && imageCache.currentSize == 0; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 20));
        await tester.pump();
      }
      final key = await ArtworkDecode.provider(
        url,
        width: 1920,
      ).obtainKey(ImageConfiguration.empty);
      expect(imageCache.containsKey(key), isTrue);
      expect(imageCache.currentSize, 1);
    });
  });
}
