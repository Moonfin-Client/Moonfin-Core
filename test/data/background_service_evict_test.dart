import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/ui/widgets/image_source.dart';

import '../support/artwork_fixture.dart';

void main() {
  late Directory temp;
  late File png;
  late FakeArtworkCacheManager cacheManager;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('moonfin-evict');
    png = await writeTestPng(temp, width: 64, height: 36);
    cacheManager = FakeArtworkCacheManager(png);
    CachedNetworkImageProvider.defaultCacheManager = cacheManager;
    PaintingBinding.instance.imageCache.clear();
    ArtworkDecode.resetRememberedBounds();
  });

  tearDown(() async {
    PaintingBinding.instance.imageCache.clear();
    await temp.delete(recursive: true);
  });

  testWidgets('clearBackgrounds evicts the resized backdrop decodes', (
    tester,
  ) async {
    await tester.runAsync(() async {
      const url = 'http://server/Items/1/Images/Backdrop/0?maxWidth=1920';
      final imageCache = PaintingBinding.instance.imageCache;
      // Built the way every backdrop widget builds its provider, so the
      // eviction can find the sizes that were inserted.
      final full = ArtworkDecode.provider(
        url,
        width: BackgroundService.backdropMaxWidth,
      );
      final blurred = ArtworkDecode.provider(
        url,
        width: BackgroundService.backdropBlurredDecodeWidth,
      );

      await tester.pumpWidget(const SizedBox());
      final context = tester.element(find.byType(SizedBox));
      await precacheImage(full, context);
      await precacheImage(blurred, context);
      expect(imageCache.currentSize, 2);

      final service = BackgroundService();
      service.setBackgroundUrl(url);
      service.clearBackgrounds();
      // ImageProvider.evict obtains the key asynchronously.
      await Future<void>.delayed(Duration.zero);
      await tester.pump();

      expect(imageCache.currentSize, 0);
      service.dispose();
    });
  });
}
