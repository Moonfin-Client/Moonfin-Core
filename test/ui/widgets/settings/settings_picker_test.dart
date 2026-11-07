import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/settings/preference_tiles.dart';
import 'package:moonfin/util/idiom/app_ui_idiom.dart';

void main() {
  String? picked;

  Future<void> openPicker(WidgetTester tester) async {
    picked = null;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              picked = await showSettingsPicker<String>(
                context,
                title: 'Music Library Style',
                values: const ['classic', 'quick', 'immersive'],
                current: 'immersive',
                labelOf: (v) => switch (v) {
                  'classic' => 'Classic',
                  'quick' => 'Quick Access',
                  _ => 'Immersive',
                },
              );
            },
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  Finder checkedRow() => find.byWidgetPredicate(
    (w) => w is Semantics && w.properties.checked == true,
  );

  testWidgets('marks the current value with a radio and returns the pick', (
    tester,
  ) async {
    await openPicker(tester);

    expect(find.byType(SettingsPickerOption), findsNWidgets(3));
    expect(find.byIcon(Icons.check), findsNothing);
    expect(
      find.descendant(of: checkedRow(), matching: find.text('Immersive')),
      findsOneWidget,
    );

    await tester.tap(find.text('Quick Access'));
    await tester.pumpAndSettle();
    expect(picked, 'quick');
    expect(find.byType(SettingsPickerDialog), findsNothing);
  });

  testWidgets('the Apple idiom keeps its trailing check', (tester) async {
    AppUiIdiomResolver.setOverride(InterfaceStyle.apple);
    addTearDown(() => AppUiIdiomResolver.setOverride(InterfaceStyle.automatic));

    await openPicker(tester);

    expect(
      find.descendant(
        of: find.widgetWithText(ListTile, 'Immersive'),
        matching: find.byIcon(Icons.check),
      ),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
