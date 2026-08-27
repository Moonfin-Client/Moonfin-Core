import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_request_tile_caption.dart';

void main() {
  // The grid reserves a fixed height for the caption before layout. Adding a
  // line to the caption without raising the reservation clips the poster on
  // every tile, and nothing else would notice.
  testWidgets('the fullest caption fits the height the grid reserves', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 220,
              child: SeerrRequestTileCaption(
                title: 'Toy Story 5',
                requestedBy: 'Requested by Axel',
                date: '26 August 2026',
                scale: 1,
                status: const SizedBox.shrink(),
                // The approve and decline buttons set a minimum height
                // of 32, and the caption gives the status its own slot.
                actions: const [SizedBox(width: 32, height: 32)],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final height = tester.getSize(find.byType(SeerrRequestTileCaption)).height;
    expect(height, lessThanOrEqualTo(SeerrRequestTileCaption.reservedHeight));
    // And not far under it, or the reservation has drifted above what the
    // caption draws and every tile carries dead space.
    expect(height, greaterThan(SeerrRequestTileCaption.reservedHeight - 16));
  });
}
