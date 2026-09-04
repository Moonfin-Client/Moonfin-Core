import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/marquee_text.dart';

void main() {
  const maxLabelWidth = 119.0;
  const textStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 1.1,
  );

  Widget buildTestWidget(
    String text, {
    TextStyle style = textStyle,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: maxLabelWidth),
                child: MarqueeText(
                  text: text,
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets('short button label stays static and does not scroll', (tester) async {
    await tester.pumpWidget(buildTestWidget('Play'));
    await tester.pumpAndSettle();

    expect(find.text('Play'), findsOneWidget);
    // SingleChildScrollView inside MarqueeText is only built when overflowing
    expect(find.descendant(
      of: find.byType(MarqueeText),
      matching: find.byType(SingleChildScrollView),
    ), findsNothing);
  });

  testWidgets('long button label triggers marquee scrolling within constrained bounds', (tester) async {
    // "Informar d'una incidència" is 24 characters and overflows the 119px available width
    await tester.pumpWidget(buildTestWidget("Informar d'una incidència"));
    await tester.pump();

    // MarqueeText builds the scrolling row with duplicated text for looping
    expect(find.descendant(
      of: find.byType(MarqueeText),
      matching: find.byType(SingleChildScrollView),
    ), findsOneWidget);

    final marqueeSize = tester.getSize(find.byType(MarqueeText));
    expect(marqueeSize.width, lessThanOrEqualTo(maxLabelWidth));

    // Verify circular dot separator is rendered between repeated texts
    expect(
      find.descendant(
        of: find.byType(MarqueeText),
        matching: find.byWidgetPredicate((widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).shape == BoxShape.circle),
      ),
      findsOneWidget,
    );
  });

  testWidgets('typeface variations affect overflow detection', (tester) async {
    // Under Ahem test font, each character is square (13px wide at fontSize 13).
    // 'Resume' is 6 chars = ~78px normally (fits in 119px).
    // With fontSize 24, 'Resume' is 6 chars * 24px = ~144px (overflows 119px).
    const text = 'Resume';
    const normalStyle = TextStyle(fontSize: 13);
    const wideStyle = TextStyle(fontSize: 24);

    await tester.pumpWidget(buildTestWidget(text, style: normalStyle));
    await tester.pump();
    final scrollsNormal = find.descendant(
      of: find.byType(MarqueeText),
      matching: find.byType(SingleChildScrollView),
    ).evaluate().isNotEmpty;

    await tester.pumpWidget(buildTestWidget(text, style: wideStyle));
    await tester.pump();
    final scrollsWide = find.descendant(
      of: find.byType(MarqueeText),
      matching: find.byType(SingleChildScrollView),
    ).evaluate().isNotEmpty;

    expect(scrollsNormal, isFalse);
    expect(scrollsWide, isTrue);
  });
}
