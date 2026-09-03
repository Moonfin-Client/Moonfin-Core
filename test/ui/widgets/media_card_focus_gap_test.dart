import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

void main() {
  const posterRatio = 2 / 3;
  const bannerRatio = 1000 / 185;

  Widget twoCards({
    required double width,
    required double aspectRatio,
    required double gap,
  }) => MaterialApp(
    home: Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaCard(
            title: 'Focused',
            width: width,
            aspectRatio: aspectRatio,
            itemType: 'Movie',
            externalIsFocused: true,
            onTap: () {},
          ),
          SizedBox(width: gap),
          MediaCard(
            title: 'Beside it',
            width: width,
            aspectRatio: aspectRatio,
            itemType: 'Movie',
            onTap: () {},
          ),
        ],
      ),
    ),
  );

  // The layout box stays where it was put, so the growth only shows up on what
  // sits under it. That is the rectangle the card really paints into.
  Rect painted(WidgetTester tester, int index) => tester.getRect(
    find
        .descendant(
          of: find.byType(MediaCard).at(index),
          matching: find.byType(Column),
        )
        .first,
  );

  Future<double> overlap(
    WidgetTester tester, {
    required double width,
    required double aspectRatio,
    required double gap,
  }) async {
    await tester.binding.setSurfaceSize(const Size(2000, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      twoCards(width: width, aspectRatio: aspectRatio, gap: gap),
    );
    await tester.pumpAndSettle();
    return painted(tester, 0).right - painted(tester, 1).left;
  }

  group('the gap a row leaves beside a card', () {
    testWidgets('keeps a focused poster off the card next to it', (
      tester,
    ) async {
      const width = 150.0;
      expect(
        await overlap(
          tester,
          width: width,
          aspectRatio: posterRatio,
          gap: MediaCard.focusGap(width),
        ),
        lessThanOrEqualTo(0.0),
      );
    });

    testWidgets('keeps a focused banner off it as well', (tester) async {
      const width = 600.0;
      expect(
        await overlap(
          tester,
          width: width,
          aspectRatio: bannerRatio,
          gap: MediaCard.focusGap(width),
        ),
        lessThanOrEqualTo(0.0),
      );
    });

    testWidgets('the flat gap the rows used to carry is not enough', (
      tester,
    ) async {
      expect(
        await overlap(
          tester,
          width: 600.0,
          aspectRatio: bannerRatio,
          gap: 12.0,
        ),
        greaterThan(0.0),
      );
    });

    test('the floor holds until the card outgrows it', () {
      expect(MediaCard.focusGap(80), 12.0);
      expect(MediaCard.focusGap(80, minimum: 8), 8.0);
      expect(MediaCard.focusGap(600), greaterThan(12.0));
    });
  });
}
