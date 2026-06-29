import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
