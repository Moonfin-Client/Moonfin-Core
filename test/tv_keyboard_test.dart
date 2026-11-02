import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _keyboardApp(
  KeyboardController controller, {
  InputPurpose purpose = InputPurpose.text,
  List<String> recents = const [],
  Locale? locale,
  KeyboardStyle style = KeyboardStyle.classic,
}) {
  controller.style = style;
  return MaterialApp(
    locale: locale,
    supportedLocales: const [Locale('en'), Locale('fr'), Locale('de')],
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    home: Scaffold(
      body: CustomKeyboard(
        keyboardController: controller,
        focusNode: FocusNode(),
        inputPurpose: purpose,
        recentSuggestions: recents,
      ),
    ),
  );
}

void main() {
  group('KeyboardController cursor', () {
    test('inserts at the caret instead of appending', () {
      final controller = KeyboardController();
      controller.setText('moonfin');
      controller.moveCursor(-1);
      controller.moveCursor(-1);
      controller.moveCursor(-1);
      controller.addCharacter('X');
      expect(controller.text, 'moonXfin');
      expect(controller.cursor, 5);
    });

    test('backspace deletes before the caret only', () {
      final controller = KeyboardController();
      controller.setText('abc');
      controller.moveCursor(-1);
      controller.backspace();
      expect(controller.text, 'ac');
      expect(controller.cursor, 1);
      controller.backspace();
      controller.backspace();
      expect(controller.text, 'c');
      expect(controller.cursor, 0);
    });

    test('caret movement clamps at both ends', () {
      final controller = KeyboardController();
      controller.setText('ab');
      controller.moveCursor(1);
      expect(controller.cursor, 2);
      controller.moveCursor(-1);
      controller.moveCursor(-1);
      controller.moveCursor(-1);
      expect(controller.cursor, 0);
    });

    test('surrogate pairs move and delete as one character', () {
      final controller = KeyboardController();
      controller.setText('a\u{1F600}b');
      controller.moveCursor(-1);
      controller.moveCursor(-1);
      expect(controller.cursor, 1);
      controller.moveCursor(1);
      expect(controller.cursor, 3);
      controller.backspace();
      expect(controller.text, 'ab');
    });

    test('setText puts the caret at the end and clear resets it', () {
      final controller = KeyboardController();
      controller.setText('hello');
      expect(controller.cursor, 5);
      controller.clear();
      expect(controller.text, '');
      expect(controller.cursor, 0);
    });
  });

  group('KeyboardLayouts', () {
    test('locale picks the letter arrangement', () {
      expect(
        KeyboardLayouts.variantForLocale(const Locale('fr')),
        KeyboardLayoutVariant.azerty,
      );
      expect(
        KeyboardLayouts.variantForLocale(const Locale('de')),
        KeyboardLayoutVariant.qwertz,
      );
      expect(
        KeyboardLayouts.variantForLocale(const Locale('en')),
        KeyboardLayoutVariant.qwerty,
      );
      expect(
        KeyboardLayouts.variantForLocale(null),
        KeyboardLayoutVariant.qwerty,
      );
    });

    test('shifted layouts derive from the lowercase rows', () {
      final upper = KeyboardLayouts.upperFor(KeyboardLayoutVariant.azerty);
      expect(upper[0].first, 'A');
      expect(upper[1].last, 'M');
      final qwertyUpper = KeyboardLayouts.upperFor(KeyboardLayoutVariant.qwerty);
      expect(qwertyUpper[1].last, '"');
      expect(qwertyUpper[2], contains('BACKSPACE'));
    });
  });

  group('CustomKeyboard widget', () {
    testWidgets('caret keys let a character land mid-word', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(_keyboardApp(controller));
      await tester.pump();

      await tester.tap(find.text('a'));
      await tester.tap(find.text('b'));
      await tester.tap(find.byIcon(Icons.keyboard_arrow_left));
      await tester.tap(find.text('c'));
      await tester.pump();

      expect(controller.text, 'acb');
    });

    testWidgets('paste inserts sanitized clipboard text', (tester) async {
      final controller = KeyboardController()..show();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.getData') {
            return <String, dynamic>{'text': 'https://demo.moonfin.org\n'};
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );

      await tester.pumpWidget(_keyboardApp(controller));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.content_paste_rounded));
      await tester.pump();

      expect(controller.text, 'https://demo.moonfin.org');
    });

    testWidgets('long pressing backspace clears the whole field',
        (tester) async {
      final controller = KeyboardController()
        ..setText('a long server address')
        ..show();
      await tester.pumpWidget(_keyboardApp(controller));
      await tester.pump();

      await tester.longPress(find.byIcon(Icons.backspace_outlined));
      await tester.pump();

      expect(controller.text, '');
    });

    testWidgets('numeric purpose gets the large number pad', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(controller, purpose: InputPurpose.numeric),
      );
      await tester.pump();

      expect(find.text('5'), findsOneWidget);
      expect(find.text('q'), findsNothing);
      expect(find.text('SPACE'), findsNothing);

      await tester.tap(find.text('8'));
      await tester.tap(find.text('0'));
      await tester.tap(find.text('9'));
      await tester.tap(find.text('6'));
      await tester.pump();
      expect(controller.text, '8096');
    });

    testWidgets('French locale shows AZERTY rows', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(controller, locale: const Locale('fr')),
      );
      await tester.pumpAndSettle();

      // AZERTY starts its top row with a and z where QWERTY has q and w.
      final aCenter = tester.getCenter(find.text('a'));
      final qCenter = tester.getCenter(find.text('q'));
      expect(aCenter.dy < qCenter.dy, isTrue);
      expect(find.text('m'), findsOneWidget);
    });

    testWidgets('username field offers remembered names as chips',
        (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(
          controller,
          purpose: InputPurpose.username,
          recents: const ['Alice', 'Bob'],
        ),
      );
      await tester.pump();

      expect(find.text('Alice'), findsOneWidget);
      await tester.tap(find.text('Alice'));
      await tester.pump();

      expect(controller.text, 'Alice');
      expect(controller.isVisible, isFalse);
    });

    testWidgets('url field lists recent servers before the static helpers',
        (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(
          controller,
          purpose: InputPurpose.url,
          recents: const ['https://demo.moonfin.org:8096'],
        ),
      );
      await tester.pump();

      expect(find.text('https://demo.moonfin.org:8096'), findsOneWidget);
      await tester.tap(find.text('https://demo.moonfin.org:8096'));
      await tester.pump();

      // A recent address replaces the text but keeps the keyboard open for
      // edits, unlike a submit chip.
      expect(controller.text, 'https://demo.moonfin.org:8096');
      expect(controller.isVisible, isTrue);
    });
  });

  group('Docked keyboard', () {
    test('every docked row is twelve cells in each arrangement', () {
      for (final variant in KeyboardLayoutVariant.values) {
        for (final shifted in [false, true]) {
          final rows = KeyboardLayouts.dockedFor(variant, shifted: shifted);
          expect(rows.map((row) => row.length), everyElement(12));
          expect(rows[2].sublist(9, 11), ['.', '@']);
          expect(rows[2], isNot(contains('SHIFT')));
        }
      }
      expect(KeyboardLayouts.dockedNumeric.map((row) => row.length),
          everyElement(12));
      expect(
        KeyboardLayouts.dockedFor(KeyboardLayoutVariant.qwerty, shifted: true)
            [1][10],
        '"',
      );
    });

    testWidgets('spanning keys take one press to cross', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(controller, style: KeyboardStyle.docked),
      );
      await tester.pump();

      Future<void> press(List<LogicalKeyboardKey> keys) async {
        for (final key in keys) {
          await tester.sendKeyEvent(key);
          await tester.pump();
        }
      }

      const right = LogicalKeyboardKey.arrowRight;
      const left = LogicalKeyboardKey.arrowLeft;
      const up = LogicalKeyboardKey.arrowUp;
      const down = LogicalKeyboardKey.arrowDown;
      const ok = LogicalKeyboardKey.enter;

      // Focus starts on q, one step right of the rail.
      await press([ok]);
      expect(controller.text, 'q');

      // Three rows down is space, and up returns to the column it came from.
      await press([down, down, down, ok]);
      expect(controller.text, 'q ');
      await press([up, ok]);
      expect(controller.text, 'q z');

      // Left past the rail wraps to Done, and up from Done is Delete.
      await press([left, left, up, ok]);
      expect(controller.text, 'q ');

      // Right from the action column wraps to the rail, where ABC turns on
      // caps and keeps focus.
      await press([right, ok, right, ok]);
      expect(controller.text, 'q A');

      // Right off space skips its other cells, and Done spans two rows.
      await press([down, down, right, right, right, right, up, ok]);
      expect(controller.text, 'q ');
      await press([down, down, ok]);
      expect(controller.isVisible, isFalse);
    });

    testWidgets('the 123 rail key swaps in the symbols', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(controller, style: KeyboardStyle.docked),
      );
      await tester.pump();

      for (final key in [
        LogicalKeyboardKey.arrowLeft,
        LogicalKeyboardKey.arrowDown,
        LogicalKeyboardKey.arrowDown,
        LogicalKeyboardKey.enter,
        LogicalKeyboardKey.arrowRight,
        LogicalKeyboardKey.enter,
      ]) {
        await tester.sendKeyEvent(key);
        await tester.pump();
      }
      expect(controller.text, '-');
    });

    testWidgets('echo shows a ghost of the matching suggestion',
        (tester) async {
      final controller = KeyboardController()
        ..setText('ali')
        ..show();
      await tester.pumpWidget(
        _keyboardApp(
          controller,
          purpose: InputPurpose.username,
          recents: const ['Alice'],
          style: KeyboardStyle.docked,
        ),
      );
      await tester.pump();

      final echo = tester.widgetList<RichText>(find.byType(RichText)).firstWhere(
        (text) => text.text.toPlainText().startsWith('ali'),
      );
      expect(echo.text.toPlainText(), contains('ce'));
    });

    testWidgets('a helper that gets added on leaves no ghost', (tester) async {
      final controller = KeyboardController()
        ..setText('ht')
        ..show();
      await tester.pumpWidget(
        _keyboardApp(
          controller,
          purpose: InputPurpose.url,
          style: KeyboardStyle.docked,
        ),
      );
      await tester.pump();

      final echo = tester.widgetList<RichText>(find.byType(RichText)).firstWhere(
        (text) => text.text.toPlainText().startsWith('ht\u{FFFC}'),
      );
      expect(echo.text.toPlainText(), 'ht\u{FFFC}');
    });
  });

  group('Glass keyboard', () {
    testWidgets('labels space and the search key with words', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(
          controller,
          purpose: InputPurpose.search,
          style: KeyboardStyle.glass,
        ),
      );
      await tester.pump();

      expect(find.text('space'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      await tester.tap(find.text('a'));
      await tester.tap(find.text('space'));
      await tester.pump();
      expect(controller.text, 'a ');
    });
  });

  group('Style picker', () {
    final picked = <KeyboardStyle>[];

    setUp(() {
      picked.clear();
      CustomKeyboard.onStylePicked = picked.add;
    });
    tearDown(() => CustomKeyboard.onStylePicked = null);

    Future<void> press(WidgetTester tester, List<LogicalKeyboardKey> keys) async {
      for (final key in keys) {
        await tester.sendKeyEvent(key);
        await tester.pump();
      }
    }

    // From q on the dock, the keyboard key is the bottom of the rail.
    const toKeyboardKey = [
      LogicalKeyboardKey.arrowLeft,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowDown,
      LogicalKeyboardKey.arrowDown,
    ];

    testWidgets('the keyboard key picks a style and switches to it',
        (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(controller, style: KeyboardStyle.docked),
      );
      await tester.pump();

      await press(tester, [...toKeyboardKey, LogicalKeyboardKey.enter]);
      for (final name in ['Native', 'Classic', 'Glass', 'Docked']) {
        expect(find.text(name), findsOneWidget);
      }

      await press(tester, [
        LogicalKeyboardKey.arrowUp,
        LogicalKeyboardKey.enter,
      ]);
      expect(picked, [KeyboardStyle.glass]);
      expect(controller.style, KeyboardStyle.glass);
      expect(find.text('Docked'), findsNothing);
      expect(find.text('space'), findsOneWidget);
    });

    testWidgets('Native hands the field to the system keyboard',
        (tester) async {
      var requested = false;
      final controller = KeyboardController()
        ..onRequestSystemKeyboard = (() => requested = true)
        ..show();
      await tester.pumpWidget(
        _keyboardApp(controller, style: KeyboardStyle.docked),
      );
      await tester.pump();

      await press(tester, [
        ...toKeyboardKey,
        LogicalKeyboardKey.enter,
        LogicalKeyboardKey.arrowUp,
        LogicalKeyboardKey.arrowUp,
        LogicalKeyboardKey.arrowUp,
        LogicalKeyboardKey.enter,
      ]);
      expect(picked, [KeyboardStyle.native]);
      expect(controller.style, KeyboardStyle.native);
      expect(requested, isTrue);
    });

    testWidgets('Back closes the picker before the keyboard', (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(
        _keyboardApp(controller, style: KeyboardStyle.docked),
      );
      await tester.pump();

      await press(tester, [...toKeyboardKey, LogicalKeyboardKey.enter]);
      expect(controller.dismissPopup!(), isTrue);
      await tester.pump();
      expect(find.text('Classic'), findsNothing);
      expect(controller.isVisible, isTrue);
      expect(controller.dismissPopup!(), isFalse);
      expect(picked, isEmpty);
    });

    testWidgets('one Back closes only the picker beside the app handler',
        (tester) async {
      final controller = KeyboardController()..show();
      // Stands in for the app's own handler, which sees each key first.
      bool appBack(KeyEvent event) {
        if (event is! KeyDownEvent ||
            event.logicalKey != LogicalKeyboardKey.escape) {
          return false;
        }
        if (!(controller.dismissPopup?.call() ?? false)) controller.hide(false);
        return true;
      }

      HardwareKeyboard.instance.addHandler(appBack);
      addTearDown(() => HardwareKeyboard.instance.removeHandler(appBack));
      await tester.pumpWidget(
        _keyboardApp(controller, style: KeyboardStyle.docked),
      );
      await tester.pump();

      await press(tester, [...toKeyboardKey, LogicalKeyboardKey.enter]);
      await press(tester, [LogicalKeyboardKey.escape]);
      expect(find.text('Classic'), findsNothing);
      expect(controller.isVisible, isTrue);

      await press(tester, [LogicalKeyboardKey.escape]);
      expect(controller.isVisible, isFalse);
    });

    testWidgets('Classic opens the picker from its keyboard key',
        (tester) async {
      final controller = KeyboardController()..show();
      await tester.pumpWidget(_keyboardApp(controller));
      await tester.pump();

      await tester.tap(find.byIcon(Icons.keyboard_alt_outlined));
      await tester.pump();
      expect(find.text('Glass'), findsOneWidget);
      expect(controller.style, KeyboardStyle.classic);
    });
  });
}
