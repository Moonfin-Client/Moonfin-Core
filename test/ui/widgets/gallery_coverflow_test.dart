import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/ui/widgets/mediabar/gallery_coverflow.dart';

const _trailerKey = Key('test-trailer');

List<MediaBarSlideItem> _items(int count) => List.generate(
  count,
  (i) => MediaBarSlideItem(
    itemId: 'item-$i',
    serverId: 'server',
    title: 'Item $i',
  ),
);

Widget _host({
  required bool fullWidthTrailer,
  required bool trailerActive,
  Widget? activeTrailer,
}) {
  return MaterialApp(
    home: Scaffold(
      body: GalleryCoverflow(
        items: _items(3),
        activeIndex: 0,
        onSelect: (_) {},
        onInfo: () {},
        onPlay: () {},
        activeTrailer: activeTrailer,
        trailerActive: trailerActive,
        fullWidthTrailer: fullWidthTrailer,
      ),
    ),
  );
}

void main() {
  testWidgets('keeps the covers below a top navbar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GalleryCoverflow(
            items: _items(3),
            activeIndex: 0,
            onSelect: (_) {},
            onInfo: () {},
            onPlay: () {},
            topInset: 100,
          ),
        ),
      ),
    );
    expect(tester.getTopLeft(find.byType(PageView)).dy, 108);
  });

  testWidgets(
    'full-width mode mounts the trailer subtree while still invisible',
    (tester) async {
      // The embedded player has to be in the tree before it can report
      // playback and let the reveal opacity rise.
      await tester.pumpWidget(
        _host(
          fullWidthTrailer: true,
          trailerActive: false,
          activeTrailer: const SizedBox(key: _trailerKey),
        ),
      );
      expect(find.byKey(_trailerKey), findsOneWidget);
    },
  );

  testWidgets('card mode keeps the trailer unmounted until it reveals', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        fullWidthTrailer: false,
        trailerActive: false,
        activeTrailer: const SizedBox(key: _trailerKey),
      ),
    );
    expect(find.byKey(_trailerKey), findsNothing);

    await tester.pumpWidget(
      _host(
        fullWidthTrailer: false,
        trailerActive: true,
        activeTrailer: const SizedBox(key: _trailerKey),
      ),
    );
    expect(find.byKey(_trailerKey), findsOneWidget);
  });

  testWidgets('active full-width trailer spans the screen width at 16:9', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      _host(
        fullWidthTrailer: true,
        trailerActive: true,
        activeTrailer: const SizedBox.expand(key: _trailerKey),
      ),
    );
    final size = tester.getSize(find.byKey(_trailerKey));
    expect(size.width, 400);
    expect(size.height, moreOrLessEquals(400 * 9 / 16, epsilon: 0.1));
  });
}
