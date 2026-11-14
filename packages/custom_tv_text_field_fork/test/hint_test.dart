import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final hint = find.textContaining('Group name', findRichText: true);

  Future<CustomTVTextFieldState> pumpField(
    WidgetTester tester,
    KeyboardStyle style,
  ) async {
    final key = GlobalKey<CustomTVTextFieldState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTVTextField(
            key: key,
            controller: TextEditingController(),
            hint: 'Group name',
            isFocused: true,
            keyboardStyle: style,
            // Taller than the cursor, as real fonts are, so losing the
            // hint's line would show up as a shorter field.
            hintStyle: const TextStyle(fontSize: 16, height: 1.5),
            textStyle: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
    return key.currentState!;
  }

  Future<void> openKeyboard(
    WidgetTester tester,
    CustomTVTextFieldState field,
  ) async {
    field.openKeyboard();
    // The cursor blinks forever, so settle isn't available.
    await tester.pump(const Duration(milliseconds: 50));
  }

  for (final style in [KeyboardStyle.docked, KeyboardStyle.native]) {
    testWidgets('${style.name}: a focused field still shows its hint', (
      tester,
    ) async {
      await pumpField(tester, style);

      expect(hint, findsOneWidget);
    });

    testWidgets('${style.name}: opening the keyboard leaves only the cursor', (
      tester,
    ) async {
      final field = await pumpField(tester, style);
      final height = tester.getSize(find.byType(CustomTVTextField)).height;

      await openKeyboard(tester, field);

      expect(hint, findsNothing);
      expect(
        tester.getSize(find.byType(CustomTVTextField)).height,
        height,
        reason: "the field shouldn't jump when the hint goes",
      );
    });

    testWidgets('${style.name}: closing the keyboard brings the hint back', (
      tester,
    ) async {
      final field = await pumpField(tester, style);
      await openKeyboard(tester, field);

      field.closeKeyboard();
      await tester.pump(const Duration(milliseconds: 50));

      expect(hint, findsOneWidget);
    });
  }
}
