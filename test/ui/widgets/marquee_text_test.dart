import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';

const _description =
    'A long program description that runs well past the three lines the '
    'guide has room for, so the rest of it has to scroll into view while '
    'the viewer reads it from across the room, and then it goes on a while.';

void main() {
  Future<ScrollPosition> pumpDescription(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Column(
          children: [
            SizedBox(
              width: 400,
              child: MarqueeText(
                text: _description,
                maxLines: 3,
                style: TextStyle(fontSize: 16, height: 1.2),
                pauseDurationMs: 1600,
                showDotSeparator: false,
              ),
            ),
          ],
        ),
      ),
    );
    await tester.pump();
    return tester.state<ScrollableState>(find.byType(Scrollable)).position;
  }

  Future<void> pumpUntil(WidgetTester tester, bool Function() done) async {
    for (var i = 0; i < 600 && !done(); i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(done(), isTrue);
  }

  testWidgets('a description holds still long enough to read the first lines', (
    tester,
  ) async {
    final position = await pumpDescription(tester);

    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(position.pixels, 0);
  });

  testWidgets('new lines scroll in at reading pace', (tester) async {
    final position = await pumpDescription(tester);
    await pumpUntil(tester, () => position.pixels > 0);

    final start = position.pixels;
    await tester.pump(const Duration(seconds: 1));
    final textHeight = position.maxScrollExtent + position.viewportDimension;
    final charsPerSecond =
        (position.pixels - start) / textHeight * _description.length;
    expect(charsPerSecond, closeTo(17, 2));
  });

  testWidgets('it stops on the last line, holds it, then starts over', (
    tester,
  ) async {
    final position = await pumpDescription(tester);
    var furthest = 0.0;
    await pumpUntil(tester, () {
      if (position.pixels > furthest) furthest = position.pixels;
      return position.pixels >= position.maxScrollExtent;
    });
    expect(furthest, lessThanOrEqualTo(position.maxScrollExtent));

    await tester.pump(const Duration(milliseconds: 1500));
    expect(position.pixels, position.maxScrollExtent);

    await pumpUntil(tester, () => position.pixels == 0);
  });
}
