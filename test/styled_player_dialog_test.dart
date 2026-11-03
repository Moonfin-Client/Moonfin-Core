import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/track_selector_dialog.dart';

const _bodyKey = Key('body');

void main() {
  Future<void> open(
    WidgetTester tester, {
    bool sidePanel = false,
    ImageProvider? titleImage,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => showStyledPlayerDialog<void>(
              context,
              title: 'The Series',
              titleImage: titleImage,
              maxWidth: 760,
              sidePanel: sidePanel,
              builder: (_) =>
                  const SizedBox(key: _bodyKey, height: double.infinity),
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('the side panel runs down the right edge', (tester) async {
    await open(tester, sidePanel: true);

    final screen = tester.view.physicalSize / tester.view.devicePixelRatio;
    final panel = tester.getRect(
      find.ancestor(of: find.byKey(_bodyKey), matching: find.byType(Column)),
    );
    expect(panel.right, greaterThan(screen.width - 40));
    expect(panel.left, greaterThan(screen.width * 0.3));
    expect(panel.height, greaterThan(screen.height * 0.8));
  });

  testWidgets('the centered dialog stays in the middle', (tester) async {
    await open(tester);

    final screen = tester.view.physicalSize / tester.view.devicePixelRatio;
    final dialog = tester.getRect(find.byType(Dialog));
    expect(dialog.center.dx, closeTo(screen.width / 2, 1));
  });

  testWidgets('a logo that fails to load falls back to the title', (
    tester,
  ) async {
    await open(tester, titleImage: MemoryImage(Uint8List(0)));

    expect(find.text('The Series'), findsOneWidget);
  });

  testWidgets('without a logo the title is text', (tester) async {
    await open(tester);

    expect(find.byType(Image), findsNothing);
    expect(find.text('The Series'), findsOneWidget);
  });
}
