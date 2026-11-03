import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/scroll_edge_arrows.dart';
import 'package:moonfin/util/platform_detection.dart';

void main() {
  tearDown(
    () => PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic),
  );

  Future<ScrollController> pumpRow(WidgetTester tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SizedBox(
            width: 400,
            height: 60,
            child: ScrollEdgeArrows(
              controller: controller,
              child: ListView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i = 0; i < 10; i++) const SizedBox(width: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    return controller;
  }

  testWidgets('a desktop row shows an arrow each way it can go, and a click '
      'pages it', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    final controller = await pumpRow(tester);
    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pumpAndSettle();
    expect(controller.offset, closeTo(320, 0.1));
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);

    controller.jumpTo(controller.position.maxScrollExtent);
    await tester.pump();
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });

  testWidgets('a TV row has no arrows', (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await pumpRow(tester);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });
}
