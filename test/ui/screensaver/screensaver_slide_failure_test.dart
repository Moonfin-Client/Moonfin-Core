import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screensaver/screensaver_content_service.dart';
import 'package:moonfin/ui/screensaver/screensaver_view.dart';
import 'package:server_core/server_core.dart';

import '../../support/artwork_fixture.dart';

/// Rebuilds whenever a log line lands, the way the diagnostics screen does.
/// If the slide reported during its own build this would be marked dirty
/// mid build and the framework would throw.
class _LogWatcher extends ChangeNotifier {
  void poke() => notifyListeners();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory temp;
  final imageCache = PaintingBinding.instance.imageCache;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('moonfin-slide');
    // Not an image, so the decode fails and the slide's error widget runs.
    final notAnImage = File('${temp.path}/broken.jpg')
      ..writeAsStringSync('this is not a jpeg');
    CachedNetworkImageProvider.defaultCacheManager = FakeArtworkCacheManager(
      notAnImage,
    );
    imageCache.clear();
  });

  tearDown(() async {
    ServerLog.sink = null;
    imageCache.clear();
    await temp.delete(recursive: true);
  });

  testWidgets('a slide that fails to decode reports once, after the frame', (
    tester,
  ) async {
    final lines = <String>[];
    final watcher = _LogWatcher();
    ServerLog.sink = (category, level, message, {error}) {
      if (category != 'artwork') return;
      lines.add(message);
      watcher.poke();
    };

    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Stack(
            fit: StackFit.expand,
            children: [
              ListenableBuilder(
                listenable: watcher,
                builder: (context, _) => Text('lines ${lines.length}'),
              ),
              const ScreensaverSlide(
                item: ScreensaverItem(
                  name: 'Broken',
                  backdropUrl: 'http://server/Items/1/Images/Backdrop/0',
                ),
              ),
            ],
          ),
        ),
      );
      for (var i = 0; i < 30 && lines.isEmpty; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 20));
        await tester.pump();
      }
      await tester.pump();
      await tester.pump();
    });

    expect(tester.takeException(), isNull);
    expect(lines, hasLength(1));
    expect(
      lines.single,
      startsWith('art screensaver slide failed /Items/1/Images/Backdrop/0: '),
    );
  });
}
