import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/horizontal_scroll_section.dart';

void main() {
  Future<void> pump(
    WidgetTester tester, {
    required String title,
    bool showControls = true,
  }) => tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: HorizontalScrollSection(
          title: title,
          showControls: showControls,
          contentSpacing: 12,
          builder: (context, controller) => SizedBox(
            height: 80,
            child: ListView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: const [SizedBox(key: Key('row'), width: 2000)],
            ),
          ),
        ),
      ),
    ),
  );

  Finder chevrons() => find.byIcon(Icons.chevron_right);

  testWidgets('a titled section keeps its title and its chevrons', (
    tester,
  ) async {
    await pump(tester, title: 'Recommendations');

    expect(find.text('Recommendations'), findsOneWidget);
    expect(chevrons(), findsOneWidget);
  });

  testWidgets('an untitled section still shows the chevrons', (tester) async {
    await pump(tester, title: '');

    expect(chevrons(), findsOneWidget);
  });

  testWidgets('an untitled section with no controls has no header at all', (
    tester,
  ) async {
    // What a TV build gets. There is nothing to put in a header, so neither
    // the header nor the gap that separates it from the row is built.
    await pump(tester, title: '', showControls: false);

    expect(chevrons(), findsNothing);
    // The Spacer only exists to push chevrons right, so its absence is how
    // "no header was built" reads from the outside.
    expect(find.byType(Spacer), findsNothing);
    // 80 is the row on its own: no header, and no contentSpacing above it.
    expect(tester.getSize(find.byType(HorizontalScrollSection)).height, 80);
  });

  testWidgets('the chevrons scroll the row they were given', (tester) async {
    await pump(tester, title: '');
    final controller = tester
        .widget<ListView>(find.byType(ListView))
        .controller!;
    expect(controller.offset, 0);

    await tester.tap(chevrons());
    await tester.pumpAndSettle();

    expect(controller.offset, greaterThan(0));
  });
}
