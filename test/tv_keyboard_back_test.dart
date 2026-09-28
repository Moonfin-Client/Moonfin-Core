import 'dart:async';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// The caret blink never stops on its own, so settle with fixed pumps
/// instead of pumpAndSettle.
Future<void> _settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

/// The app's back handling asks the keyboard to claim the press before it
/// pops anything, so these pin the answers it relies on.
void main() {
  testWidgets('dismissed native keyboard cannot overwrite newer remote text', (
    tester,
  ) async {
    const channel = MethodChannel('moonfin/appletv_system');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    final nativeResult = Completer<String>();
    final calls = <String>[];
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call.method);
      return call.method == 'showTextInput' ? nativeResult.future : null;
    });
    addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
    final controller = TextEditingController(text: 'old');
    addTearDown(controller.dispose);
    final key = GlobalKey<CustomTVTextFieldState>();
    var submitted = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTVTextField(
            key: key,
            controller: controller,
            preferSystemIme: true,
            popParentOnKeyboardClose: false,
            onFieldSubmitted: (_) => submitted++,
          ),
        ),
      ),
    );
    key.currentState!.openKeyboard();
    await _settle(tester);
    expect(calls, ['showTextInput']);
    key.currentState!.closeKeyboard(submit: false);
    controller.text = 'new phone query';
    await _settle(tester);
    nativeResult.complete('old native snapshot');
    await _settle(tester);
    expect(controller.text, 'new phone query');
    expect(submitted, 0);
    expect(calls, ['showTextInput', 'hideTextInput']);
    expect(CustomTVTextField.closeTopKeyboard(), false);
  }, skip: !const bool.fromEnvironment('MOONFIN_TVOS'));

  testWidgets('closing the top keyboard leaves the page it belongs to up', (
    tester,
  ) async {
    final controller = TextEditingController(text: 'dune');
    addTearDown(controller.dispose);
    final fieldKey = GlobalKey<CustomTVTextFieldState>();
    var submitted = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const Text('search results'),
              CustomTVTextField(
                key: fieldKey,
                controller: controller,
                popParentOnKeyboardClose: false,
                onFieldSubmitted: (_) => submitted++,
              ),
            ],
          ),
        ),
      ),
    );

    expect(
      CustomTVTextField.closeTopKeyboard(),
      isFalse,
      reason: 'nothing open, so back belongs to whoever asks next',
    );

    fieldKey.currentState!.openKeyboard();
    await _settle(tester);
    expect(find.byType(CustomKeyboard), findsOneWidget);

    expect(CustomTVTextField.closeTopKeyboard(), isTrue);
    await _settle(tester);

    expect(find.byType(CustomKeyboard), findsNothing);
    expect(find.text('search results'), findsOneWidget);
    expect(controller.text, 'dune');
    expect(submitted, 0);
    expect(CustomTVTextField.closeTopKeyboard(), isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a disposed field stops claiming back', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    final fieldKey = GlobalKey<CustomTVTextFieldState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTVTextField(
            key: fieldKey,
            controller: controller,
            popParentOnKeyboardClose: false,
          ),
        ),
      ),
    );

    fieldKey.currentState!.openKeyboard();
    await _settle(tester);

    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Text('somewhere else'))),
    );
    await _settle(tester);

    expect(CustomTVTextField.closeTopKeyboard(), isFalse);
  });
}
