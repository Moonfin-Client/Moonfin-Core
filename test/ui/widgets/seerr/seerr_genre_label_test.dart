import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_genre_label.dart';

const _cardSize = Size(200, 300);

/// The home rows hand the label to the card as a filled overlay, while the
/// discover grid drops it straight into a stack. Both have to darken the whole
/// card, so both are covered here.
Future<void> _pump(
  WidgetTester tester, {
  required bool positioned,
  Size size = _cardSize,
}) async {
  const label = SeerrGenreLabel(name: 'Science Fiction');
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                if (positioned) const Positioned.fill(child: label) else label,
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

final _scrim = find.descendant(
  of: find.byType(SeerrGenreLabel),
  matching: find.byType(Container),
);

void main() {
  for (final positioned in [true, false]) {
    final where = positioned ? 'as a filled overlay' : 'as a bare stack child';

    group(where, () {
      testWidgets('shows the genre name in capitals', (tester) async {
        await _pump(tester, positioned: positioned);
        expect(find.text('SCIENCE FICTION'), findsOneWidget);
      });

      // Without this the name sits straight on the duotone artwork, and the
      // lighter genre colours leave it barely readable.
      testWidgets('darkens the artwork behind the name', (tester) async {
        await _pump(tester, positioned: positioned);

        final color = tester.widget<Container>(_scrim).color;
        expect(color, isNotNull);
        expect(color!.a, closeTo(SeerrGenreLabel.scrimOpacity, 0.001));
      });

      testWidgets('the darkening covers the whole card', (tester) async {
        await _pump(tester, positioned: positioned);

        final box = tester.renderObject<RenderBox>(_scrim);
        expect(box.size, _cardSize);
      });
    });
  }

  testWidgets('the lettering grows with the card', (tester) async {
    await _pump(tester, positioned: true);
    final small = tester.widget<Text>(find.text('SCIENCE FICTION')).style!;

    await _pump(tester, positioned: true, size: const Size(600, 900));
    final large = tester.widget<Text>(find.text('SCIENCE FICTION')).style!;

    expect(large.fontSize, greaterThan(small.fontSize!));
    expect(
      small.fontSize,
      MediaCard.genreLabelFontSize(_cardSize.width),
      reason: 'it sizes off the card, same as the jellyfin genre row',
    );
  });
}
