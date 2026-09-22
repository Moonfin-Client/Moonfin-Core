import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/image_source.dart';
import 'package:moonfin/ui/widgets/offline_aware_image.dart';

import '../../support/artwork_fixture.dart';

void main() {
  late Directory temp;
  late File png;
  late FakeArtworkCacheManager cacheManager;
  const url = 'http://server/Items/1/Images/Primary?maxWidth=420';

  TestWidgetsFlutterBinding.ensureInitialized();
  final imageCache = PaintingBinding.instance.imageCache;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('moonfin-decode');
    png = await writeTestPng(temp, width: 400, height: 600);
    cacheManager = FakeArtworkCacheManager(png);
    CachedNetworkImageProvider.defaultCacheManager = cacheManager;
    imageCache.clear();
    ArtworkDecode.resetRememberedBounds();
  });

  tearDown(() async {
    imageCache.clear();
    await temp.delete(recursive: true);
  });

  Widget host(Widget child, {double width = 150, double height = 225}) =>
      MaterialApp(
        home: Center(
          child: SizedBox(width: width, height: height, child: child),
        ),
      );

  Future<void> settle(WidgetTester tester) async {
    // Decoding runs on the engine, so give it real time inside runAsync.
    for (var i = 0; i < 20 && imageCache.currentSize == 0; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 20));
      await tester.pump();
    }
    await tester.pump();
  }

  testWidgets('a layout-derived bound decodes at the painted size', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.runAsync(() async {
      await tester.pumpWidget(
        host(const OfflineAwareImage(imageUrl: url, fit: BoxFit.cover)),
      );
      await settle(tester);

      final bounded = ArtworkDecode.provider(url, width: 300);
      final bare = CachedNetworkImageProvider(url);
      expect(
        imageCache.containsKey(
          await bounded.obtainKey(ImageConfiguration.empty),
        ),
        isTrue,
      );
      expect(
        imageCache.containsKey(await bare.obtainKey(ImageConfiguration.empty)),
        isFalse,
        reason: 'no unbounded decode should exist',
      );
      expect(imageCache.currentSize, 1);
      final decoded = await decodedImageFor(bounded);
      expect(decoded?.width, 300);
      expect(decoded?.height, 450);
    });
  });

  testWidgets('imageBuilder receives the bounded provider', (tester) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    ImageProvider? handed;
    await tester.runAsync(() async {
      await tester.pumpWidget(
        host(
          OfflineAwareImage(
            imageUrl: url,
            imageBuilder: (context, provider) {
              handed = provider;
              return Image(image: provider, fit: BoxFit.cover);
            },
          ),
        ),
      );
      await settle(tester);
      expect(handed, ArtworkDecode.provider(url, width: 300));
      expect(imageCache.currentSize, 1);
    });
  });

  testWidgets('an explicit bound is used verbatim without a LayoutBuilder', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.runAsync(() async {
      await tester.pumpWidget(
        host(const OfflineAwareImage(imageUrl: url, memCacheWidth: 137)),
      );
      await settle(tester);
      expect(
        find.descendant(
          of: find.byType(OfflineAwareImage),
          matching: find.byType(LayoutBuilder),
        ),
        findsNothing,
      );
      final key = await ArtworkDecode.provider(
        url,
        width: 137,
      ).obtainKey(ImageConfiguration.empty);
      expect(imageCache.containsKey(key), isTrue);
      expect(
        (await decodedImageFor(ArtworkDecode.provider(url, width: 137)))?.width,
        137,
      );
    });
  });

  testWidgets('a local file path decodes through the same bound', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.runAsync(() async {
      await tester.pumpWidget(
        host(OfflineAwareImage(imageUrl: png.path, fit: BoxFit.cover)),
      );
      await settle(tester);
      final key = await ArtworkDecode.provider(
        png.path,
        width: 300,
      ).obtainKey(ImageConfiguration.empty);
      expect(imageCache.containsKey(key), isTrue);
      expect(imageCache.currentSize, 1);
    });
  });

  testWidgets('an explicit width keeps IntrinsicHeight rows working', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.runAsync(() async {
      // The shape of the modern theme's up-next card.
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    const Expanded(child: Text('title')),
                    SizedBox(
                      width: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: const [
                          OfflineAwareImage(
                            imageUrl: url,
                            width: 150,
                            sourceAspectRatio: 16 / 9,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      await settle(tester);
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('without an explicit width an IntrinsicHeight row asserts', (
    tester,
  ) async {
    // Documents why up_next_card passes width: the layout-derived bound uses
    // a LayoutBuilder, which can't answer intrinsic size queries. The first
    // failure cascades into "was not laid out" errors, so collect them all.
    final errors = <FlutterErrorDetails>[];
    final previous = FlutterError.onError;
    FlutterError.onError = errors.add;
    try {
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    const Expanded(child: Text('title')),
                    SizedBox(
                      width: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: const [
                          OfflineAwareImage(imageUrl: url, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } finally {
      FlutterError.onError = previous;
    }
    expect(errors, isNotEmpty);
    expect(
      errors.first.exception.toString(),
      contains('LayoutBuilder does not support returning intrinsic'),
    );
  });

  testWidgets('a precache at the widget size is the entry the widget paints', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.runAsync(() async {
      await tester.pumpWidget(host(const SizedBox()));
      final context = tester.element(find.byType(SizedBox).first);
      await ArtworkDecode.precache(context, url, layoutWidth: 150);
      expect(imageCache.currentSize, 1);

      await tester.pumpWidget(
        host(const OfflineAwareImage(imageUrl: url, fit: BoxFit.cover)),
      );
      await settle(tester);
      expect(imageCache.currentSize, 1);
      expect(imageCache.pendingImageCount, 0);
    });
  });

  testWidgets('evict drops every size the url was decoded at', (tester) async {
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.runAsync(() async {
      await tester.pumpWidget(
        host(const OfflineAwareImage(imageUrl: url, fit: BoxFit.cover)),
      );
      await settle(tester);
      await tester.pumpWidget(
        host(
          const OfflineAwareImage(imageUrl: url, fit: BoxFit.cover),
          width: 100,
          height: 150,
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await tester.pump();
      expect(imageCache.currentSize, 2);

      await tester.pumpWidget(host(const SizedBox()));
      await ArtworkDecode.evict(url);
      expect(imageCache.currentSize, 0);
    });
  });
}
