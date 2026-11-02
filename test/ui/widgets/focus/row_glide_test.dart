import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/hub_focus_memory.dart';
import 'package:moonfin/ui/widgets/focus/locked_focus_row.dart';
import 'package:moonfin/ui/widgets/focus/row_glide.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late RowGlide glide;
  late FocusNode node;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    glide = RowGlide(UserPreferences(store))..growth = 80;
    HubFocusMemory.set('glide', 0);
  });

  tearDown(() => glide.dispose());

  Future<void> pumpRow(WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    node = FocusNode();
    addTearDown(node.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: LockedFocusRow<int>(
          items: List.generate(30, (i) => i),
          hubKey: 'glide',
          itemExtent: 40,
          height: 40,
          focusNode: node,
          glide: glide,
          itemBuilder: (context, item, index, isFocused) => ListenableBuilder(
            listenable: glide,
            builder: (context, _) => SizedBox(
              key: ValueKey('card-$index'),
              width: 40 + 80 * glide.openness(index),
              height: 40,
            ),
          ),
        ),
      ),
    );
    node.requestFocus();
    await tester.pumpAndSettle();
  }

  Rect card(WidgetTester tester, int index) =>
      tester.getRect(find.byKey(ValueKey('card-$index')));

  testWidgets('presses park the grown card at the start of the row', (
    tester,
  ) async {
    await pumpRow(tester);
    expect(card(tester, 0).width, 120);

    for (var i = 0; i < 5; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump(const Duration(milliseconds: 60));
    }
    await tester.pumpAndSettle();

    expect(card(tester, 5).left, 0);
    expect(card(tester, 5).width, 120);
    expect(card(tester, 6).width, 40);
  });

  testWidgets('holding a direction folds the row until the key comes up', (
    tester,
  ) async {
    await pumpRow(tester);

    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    for (var i = 0; i < 4; i++) {
      await tester.sendKeyRepeatEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump(const Duration(milliseconds: 50));
    }
    await tester.pumpAndSettle();
    expect(card(tester, 5).left, 0);
    expect(card(tester, 5).width, 40);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(card(tester, 5).left, 0);
    expect(card(tester, 5).width, 120);
  });

  testWidgets('a card only grows while its row has focus', (tester) async {
    await pumpRow(tester);
    node.unfocus();
    await tester.pumpAndSettle();
    expect(card(tester, 0).width, 40);

    node.requestFocus();
    await tester.pumpAndSettle();
    expect(card(tester, 0).width, 120);
  });
}
