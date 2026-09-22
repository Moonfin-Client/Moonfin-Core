import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/game/game_card_focus_frame.dart';
import 'package:moonfin/ui/widgets/game/game_poster_card.dart';
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
          matching: find.byType(AspectRatio),
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

    test('preserves the minimum clearance plus expansion growth', () {
      expect(MediaCard.focusGap(80), closeTo(14.0, 0.0001));
      expect(MediaCard.focusGap(80, minimum: 8), closeTo(10.0, 0.0001));
      expect(MediaCard.focusGap(600), greaterThan(12.0));
    });

    testWidgets('keeps a focused game poster off the card next to it', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(2000, 1200));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      const cardWidth = 120.0;

      Future<double> gameOverlap(double gap) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GamePosterCard(
                    title: 'Focused',
                    fileName: 'game1.iso',
                    seed: 'seed1',
                    width: cardWidth,
                    autofocus: true,
                    onTap: () {},
                  ),
                  SizedBox(width: gap),
                  GamePosterCard(
                    title: 'Beside it',
                    fileName: 'game2.iso',
                    seed: 'seed2',
                    width: cardWidth,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        // The frame is the part under the scale, so the box the card was laid
        // out in is the wrong thing to measure here.
        Rect frame(int index) =>
            tester.getRect(find.byType(GameCardFocusFrame).at(index));
        return frame(0).right - frame(1).left;
      }

      expect(
        await gameOverlap(MediaCard.focusGap(cardWidth)),
        lessThanOrEqualTo(0.0),
      );
      // Packed together the cards do overlap, so the measurement above is
      // reading what the card paints and not where it was laid out.
      expect(await gameOverlap(0.0), greaterThan(0.0));
    });
  });
}
