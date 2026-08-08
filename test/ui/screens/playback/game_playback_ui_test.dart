import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/playback/game_playback_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('wrapGamePlaybackMenuSelection', () {
    test('wraps forward and backward through index-driven menus', () {
      expect(wrapGamePlaybackMenuSelection(2, 1, 3), 0);
      expect(wrapGamePlaybackMenuSelection(0, -1, 3), 2);
      expect(wrapGamePlaybackMenuSelection(1, 7, 3), 2);
    });

    test('keeps an empty menu on its safe default index', () {
      expect(wrapGamePlaybackMenuSelection(4, -1, 0), 0);
    });
  });

  testWidgets('scroll helper reveals a selected row', (tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 100,
            child: ListView.builder(
              controller: controller,
              itemExtent: 20,
              itemCount: 20,
              itemBuilder: (_, index) => Text('Row $index'),
            ),
          ),
        ),
      ),
    );

    ensureGamePlaybackMenuSelectionVisible(controller, 8, rowExtent: 20);
    await tester.pumpAndSettle();

    expect(controller.offset, greaterThan(0));
  });

  testWidgets('message helper uses the surrounding scaffold messenger', (
    tester,
  ) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (buildContext) {
              context = buildContext;
              return const SizedBox();
            },
          ),
        ),
      ),
    );

    showGamePlaybackMessage(context, 'Could not save state.');
    await tester.pump();

    expect(find.text('Could not save state.'), findsOneWidget);
  });
}
