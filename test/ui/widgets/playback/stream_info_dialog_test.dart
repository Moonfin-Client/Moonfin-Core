import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/playback/stream_info_dialog.dart';

void main() {
  var actionPresses = 0;

  Future<void> open(WidgetTester tester) async {
    actionPresses = 0;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => showStreamInfoDialog(
              context: context,
              title: 'Playback Information',
              streamInfoSections: const [
                {
                  'title': 'Playback',
                  'rows': [
                    {
                      'label': 'Play Method',
                      'value': 'Direct Play',
                      'bold': true,
                    },
                    {'note': 'Playing the original file as is.'},
                  ],
                },
              ],
              actions: [
                (
                  label: 'Keyboard Shortcuts',
                  icon: Icons.keyboard_outlined,
                  onPressed: () => actionPresses++,
                ),
              ],
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('OK closes the dialog', (tester) async {
    await open(tester);
    expect(find.text('Playing the original file as is.'), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();

    expect(find.byType(Dialog), findsNothing);
  });

  testWidgets('Enter on a focused button presses it instead', (tester) async {
    await open(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();

    expect(actionPresses, 1);
    expect(find.byType(Dialog), findsOneWidget);
  });
}
