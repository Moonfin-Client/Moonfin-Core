import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/overlay_sheet.dart';
import 'package:moonfin/ui/widgets/settings/settings_panel.dart';

// Issue #1704: before Android 13, a menu closed with Back in the player never
// got its follow-up popRoute, so the leftover mark swallowed the first Back on
// the page the player returned to.

void main() {
  tearDown(DialogBackSuppressor.newBackPress);

  test('a mark from an earlier press is dropped when a new press starts', () {
    DialogBackSuppressor.markDismissed();

    DialogBackSuppressor.newBackPress();

    expect(DialogBackSuppressor.consume(), isFalse);
  });

  test('a mark from the current press still swallows its follow-up', () {
    DialogBackSuppressor.newBackPress();
    DialogBackSuppressor.markDismissed();

    expect(DialogBackSuppressor.consume(), isTrue);
    expect(DialogBackSuppressor.consume(), isFalse);
  });

  // Issue #1943: Android 14 sends Back as a popRoute with no key events, and
  // the Settings panel closes inside that popRoute. A mark left there had no
  // follow-up to swallow, so it ate the next Back instead.
  testWidgets('the Settings panel closed by popRoute leaves no mark', (
    tester,
  ) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );
    unawaited(SettingsPanel.open(context, const Text('panel')));
    await tester.pumpAndSettle();
    expect(find.text('panel'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('panel'), findsNothing);
    expect(DialogBackSuppressor.consume(), isFalse);
  });
}
