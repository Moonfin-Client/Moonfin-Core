import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/pin_guard.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/pin_entry_dialog.dart';

void main() {
  testWidgets('PinEntryDialog allows numeric input through keyboard/remote keys', (
    WidgetTester tester,
  ) async {
    String? enteredPin;
    bool onVerifyCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                PinEntryDialog.show(
                  context,
                  mode: PinEntryMode.verify,
                  onVerify: (pin) {
                    enteredPin = pin;
                    onVerifyCalled = true;
                    return true;
                  },
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
        ),
      ),
    );

    // Open the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Verify dialog is open
    expect(find.byType(PinEntryDialog), findsOneWidget);

    // Press '1'
    await tester.sendKeyEvent(LogicalKeyboardKey.digit1);
    await tester.pump();

    // Press '2' (numpad)
    await tester.sendKeyEvent(LogicalKeyboardKey.numpad2);
    await tester.pump();

    // Press '3'
    await tester.sendKeyEvent(LogicalKeyboardKey.digit3);
    await tester.pump();

    // Press '4'
    await tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    await tester.pumpAndSettle();

    // Check if onVerify was called with correct pin
    expect(onVerifyCalled, true);
    expect(enteredPin, '1234');
  });

  group('a PIN that may have to ask the server', () {
    Future<void> open(
      WidgetTester tester,
      Future<PinOutcome> Function(String pin) onVerifyAsync,
      void Function(bool? result) done,
    ) async {
      // The error line takes room the default test screen does not have.
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async => done(
                  await PinEntryDialog.show(
                    context,
                    mode: PinEntryMode.verify,
                    onVerifyAsync: onVerifyAsync,
                  ),
                ),
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
    }

    const digitKeys = [
      LogicalKeyboardKey.digit0,
      LogicalKeyboardKey.digit1,
      LogicalKeyboardKey.digit2,
      LogicalKeyboardKey.digit3,
      LogicalKeyboardKey.digit4,
      LogicalKeyboardKey.digit5,
      LogicalKeyboardKey.digit6,
      LogicalKeyboardKey.digit7,
      LogicalKeyboardKey.digit8,
      LogicalKeyboardKey.digit9,
    ];

    Future<void> type(WidgetTester tester, String digits) async {
      for (final digit in digits.split('')) {
        await tester.sendKeyEvent(digitKeys[int.parse(digit)]);
        await tester.pump();
      }
    }

    testWidgets('an accepted PIN closes the dialog with true', (tester) async {
      bool? result;
      await open(tester, (_) async => const PinAccepted(), (r) => result = r);

      await type(tester, '1234');
      await tester.pumpAndSettle();

      expect(result, isTrue);
      expect(find.byType(PinEntryDialog), findsNothing);
    });

    testWidgets('a wrong PIN says so and clears what was typed', (tester) async {
      await open(tester, (_) async => const PinRejected(), (_) {});

      await type(tester, '1234');
      await tester.pumpAndSettle();

      expect(find.text(AppLocalizations.of(tester.element(find.byType(PinEntryDialog))).pinIncorrect), findsOneWidget);
      expect(find.byType(PinEntryDialog), findsOneWidget);
    });

    testWidgets('a lockout says how long to wait', (tester) async {
      await open(
        tester,
        (_) async => const PinLockedOut(Duration(seconds: 45)),
        (_) {},
      );

      await type(tester, '1234');
      await tester.pumpAndSettle();

      expect(
        find.text(AppLocalizations.of(tester.element(find.byType(PinEntryDialog))).pinTryAgainIn('45s')),
        findsOneWidget,
      );
    });

    testWidgets('digits typed while the server is being asked are ignored', (
      tester,
    ) async {
      final answer = Completer<PinOutcome>();
      final asked = <String>[];
      await open(tester, (pin) {
        asked.add(pin);
        return answer.future;
      }, (_) {});

      await type(tester, '1234');
      await type(tester, '5678');
      answer.complete(const PinRejected());
      await tester.pumpAndSettle();

      expect(asked, ['1234']);
    });
  });

  group('setting a PIN the server may turn down', () {
    Future<void> openSet(
      WidgetTester tester,
      Future<void> Function(String pin) onPinSet,
      void Function(bool? result) done,
    ) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async => done(
                  await PinEntryDialog.show(
                    context,
                    mode: PinEntryMode.set,
                    onPinSet: onPinSet,
                  ),
                ),
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
    }

    Future<void> typeTwice(WidgetTester tester) async {
      for (var round = 0; round < 2; round++) {
        for (final key in [
          LogicalKeyboardKey.digit1,
          LogicalKeyboardKey.digit2,
          LogicalKeyboardKey.digit3,
          LogicalKeyboardKey.digit4,
        ]) {
          await tester.sendKeyEvent(key);
          await tester.pump();
        }
        await tester.pumpAndSettle();
      }
    }

    testWidgets('a refused PIN keeps the dialog open and says so', (
      tester,
    ) async {
      bool? result;
      await openSet(
        tester,
        (_) async => throw const PinChangeRefused(PinRejected()),
        (r) => result = r,
      );

      await typeTwice(tester);

      final l10n = AppLocalizations.of(
        tester.element(find.byType(PinEntryDialog)),
      );
      expect(find.text(l10n.pinIncorrect), findsOneWidget);
      expect(find.byType(PinEntryDialog), findsOneWidget);
      expect(result, isNull);
    });

    testWidgets('an unreachable server says so and keeps the dialog open', (
      tester,
    ) async {
      await openSet(
        tester,
        (_) async => throw const PinChangeRefused.unreachable(),
        (_) {},
      );

      await typeTwice(tester);

      final l10n = AppLocalizations.of(
        tester.element(find.byType(PinEntryDialog)),
      );
      expect(find.text(l10n.unableToConnectToServer), findsOneWidget);
      expect(find.byType(PinEntryDialog), findsOneWidget);
    });

    testWidgets('a locked server says how long to wait', (tester) async {
      await openSet(
        tester,
        (_) async =>
            throw const PinChangeRefused(PinLockedOut(Duration(seconds: 45))),
        (_) {},
      );

      await typeTwice(tester);

      final l10n = AppLocalizations.of(
        tester.element(find.byType(PinEntryDialog)),
      );
      expect(find.text(l10n.pinTryAgainIn('45s')), findsOneWidget);
    });
  });

  group('a title and subtitle saying what the PIN is for', () {
    Future<void> open(
      WidgetTester tester, {
      String? title,
      String? subtitle,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => PinEntryDialog.show(
                  context,
                  mode: PinEntryMode.verify,
                  onVerify: (_) => true,
                  title: title,
                  subtitle: subtitle,
                ),
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
    }

    testWidgets('replace the generic wording', (tester) async {
      await open(
        tester,
        title: 'Kids Mode',
        subtitle: 'Enter the Kids Mode PIN to switch to Alex',
      );

      expect(find.text('Kids Mode'), findsOneWidget);
      expect(
        find.text('Enter the Kids Mode PIN to switch to Alex'),
        findsOneWidget,
      );
      expect(find.text('Enter PIN'), findsNothing);
    });

    testWidgets('leave the generic wording when not given', (tester) async {
      await open(tester);

      expect(find.text('Enter PIN'), findsOneWidget);
      expect(find.text('Enter your 4-digit PIN'), findsOneWidget);
    });
  });
}
