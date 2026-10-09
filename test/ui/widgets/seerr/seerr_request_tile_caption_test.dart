import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_request_tile_caption.dart';

Widget _caption({
  required double width,
  bool marqueeTitle = false,
  double textScale = 1,
  String requester = 'Axel Whitfield-Mortensen',
  bool split = true,
}) {
  return MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: width,
            child: SeerrRequestTileCaption(
              title: 'Toy Story 5',
              requestedByLine: 'Requested by $requester',
              requestedByLabel: 'Requested by',
              requester: requester,
              splitRequester: split,
              date: '26 August 2026',
              scale: 1,
              status: const SizedBox.shrink(),
              marqueeTitle: marqueeTitle,
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  // The grid reserves a fixed height for the caption before layout. Adding a
  // line to the caption without raising the reservation clips the poster on
  // every tile, and nothing else would notice.
  for (final (name, requester, split) in [
    ('a short requester', 'Al', false),
    ('a long requester', 'Axel Whitfield-Mortensen', true),
  ]) {
    testWidgets('$name fits the height the grid reserves', (tester) async {
      // The widest a tile can ever be.
      await tester.pumpWidget(
        _caption(width: 220, requester: requester, split: split),
      );
      await tester.pumpAndSettle();

      final reserved = SeerrRequestTileCaption.heightFor(
        1,
        TextScaler.noScaling,
        splitRequester: split,
      );
      final height = tester
          .getSize(find.byType(SeerrRequestTileCaption))
          .height;
      expect(height, lessThanOrEqualTo(reserved));
      // And not far under it, or the reservation has drifted above what the
      // caption draws and every tile carries dead space.
      expect(height, greaterThan(reserved - 16));
    });
  }

  testWidgets('the reservation grows with the system text size', (
    tester,
  ) async {
    await tester.pumpWidget(_caption(width: 220, textScale: 1.5));
    await tester.pumpAndSettle();

    final height = tester.getSize(find.byType(SeerrRequestTileCaption)).height;
    expect(
      height,
      lessThanOrEqualTo(
        SeerrRequestTileCaption.heightFor(
          1,
          const TextScaler.linear(1.5),
          splitRequester: true,
        ),
      ),
    );
  });

  testWidgets('a short requester stays on the label line', (tester) async {
    // The test font draws every glyph a full em wide, so keep it short.
    await tester.pumpWidget(
      _caption(width: 220, requester: 'Al', split: false),
    );
    await tester.pumpAndSettle();

    expect(find.text('Requested by Al'), findsOneWidget);
    expect(find.text('Requested by'), findsNothing);
  });

  // The grid's call for all tiles. It measures from outside the card, so it
  // has to match what the caption draws or a tile keeps a blank line.
  testWidgets('the grid measures the requester at the tile width', (
    tester,
  ) async {
    await tester.pumpWidget(_caption(width: 220));
    final context = tester.element(find.byType(SeerrRequestTileCaption));

    bool fits(String line, double tileWidth) =>
        SeerrRequestTileCaption.requesterFitsTile(
          context,
          line,
          tileWidth,
          1,
          3,
        );
    expect(fits('Requested by Al', 220), isTrue);
    expect(fits('Requested by Axel Whitfield-Mortensen', 150), isFalse);
  });

  testWidgets('a long requester moves under its own label', (tester) async {
    await tester.pumpWidget(_caption(width: 150));
    await tester.pumpAndSettle();

    final label = tester.getTopLeft(find.text('Requested by'));
    final name = tester.getTopLeft(find.text('Axel Whitfield-Mortensen'));
    expect(name.dy, greaterThan(label.dy));
    expect(name.dx, label.dx);
  });

  testWidgets('the title only scrolls when the tile asks for it', (
    tester,
  ) async {
    await tester.pumpWidget(_caption(width: 150));
    await tester.pumpAndSettle();
    expect(find.byType(MarqueeText), findsNothing);

    await tester.pumpWidget(
      _caption(width: 150, marqueeTitle: true),
    );
    await tester.pump();
    expect(find.byType(MarqueeText), findsOneWidget);
  });
}
