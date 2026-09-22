import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_request_tile_caption.dart';

Widget _caption({
  required double width,
  required List<Widget> actions,
  bool marqueeTitle = false,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          child: SeerrRequestTileCaption(
            title: 'Toy Story 5',
            requestedByLabel: 'Requested by',
            requester: 'Axel Whitfield-Mortensen',
            date: '26 August 2026',
            scale: 1,
            status: const SizedBox.shrink(),
            marqueeTitle: marqueeTitle,
            actions: actions,
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
  testWidgets('the fullest caption fits the height the grid reserves', (
    tester,
  ) async {
    await tester.pumpWidget(
      // The widest a tile can ever be.
      _caption(
        width: 220,
        // The approve and decline buttons set a minimum height
        // of 32, and the caption gives the status its own slot.
        actions: const [SizedBox(width: 32, height: 32)],
      ),
    );
    await tester.pumpAndSettle();

    final height = tester.getSize(find.byType(SeerrRequestTileCaption)).height;
    expect(height, lessThanOrEqualTo(SeerrRequestTileCaption.reservedHeight));
    // And not far under it, or the reservation has drifted above what the
    // caption draws and every tile carries dead space.
    expect(height, greaterThan(SeerrRequestTileCaption.reservedHeight - 16));
  });

  // The action row is a plain Row inside a card that clips, so an overflow
  // takes the second button off the tile instead of showing the usual
  // stripes, and leaves it focusable where nobody can see it.
  testWidgets('both actions fit the narrowest tile', (tester) async {
    await tester.pumpWidget(
      // A TV tile, less the widest card border a theme draws on both sides.
      _caption(
        width: 150 - 3 * 2,
        // The compact footprint: a 36 by 32 minimum and the 8 between them.
        actions: const [
          SizedBox(width: 36, height: 32),
          SizedBox(width: 8),
          SizedBox(width: 36, height: 32),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    final height = tester.getSize(find.byType(SeerrRequestTileCaption)).height;
    expect(height, lessThanOrEqualTo(SeerrRequestTileCaption.reservedHeight));
  });

  testWidgets('the requester sits under its own label', (tester) async {
    await tester.pumpWidget(_caption(width: 150, actions: const []));
    await tester.pumpAndSettle();

    final label = tester.getTopLeft(find.text('Requested by'));
    final name = tester.getTopLeft(find.text('Axel Whitfield-Mortensen'));
    expect(name.dy, greaterThan(label.dy));
    expect(name.dx, label.dx);
  });

  testWidgets('the title only scrolls when the tile asks for it', (
    tester,
  ) async {
    await tester.pumpWidget(_caption(width: 150, actions: const []));
    await tester.pumpAndSettle();
    expect(find.byType(MarqueeText), findsNothing);

    await tester.pumpWidget(
      _caption(width: 150, actions: const [], marqueeTitle: true),
    );
    await tester.pump();
    expect(find.byType(MarqueeText), findsOneWidget);
  });
}
