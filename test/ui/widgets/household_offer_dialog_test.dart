import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/household_offer_dialog.dart';

void main() {
  group('HouseholdOfferDialog', () {
    testWidgets('shows the message and pops with the picked answer',
        (tester) async {
      HouseholdOfferChoice? choice;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  HouseholdOfferDialog.show(
                    context,
                    message: 'You manage teen, toddler and cousin.',
                    onAddThem: () async {},
                  ).then((picked) => choice = picked);
                },
                child: const Text('Show'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('You manage teen, toddler and cousin.'), findsOneWidget);

      await tester.tap(find.text('Not Now'));
      await tester.pumpAndSettle();
      expect(choice, HouseholdOfferChoice.notNow);
      expect(find.text('Not Now'), findsNothing);
    });

    testWidgets('Don\u0027t Ask Again is kept as its own answer', (tester) async {
      HouseholdOfferChoice? choice;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  HouseholdOfferDialog.show(
                    context,
                    message: 'msg',
                    onAddThem: () async {},
                  ).then((picked) => choice = picked);
                },
                child: const Text('Show'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Don't Ask Again"));
      await tester.pumpAndSettle();
      expect(choice, HouseholdOfferChoice.dontAskAgain);
    });

    testWidgets('waits out Add Them, then closes with that answer',
        (tester) async {
      HouseholdOfferChoice? choice;
      var addingStarted = false;
      final added = Completer<void>();
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  HouseholdOfferDialog.show(
                    context,
                    message: 'msg',
                    onAddThem: () {
                      addingStarted = true;
                      return added.future;
                    },
                  ).then((picked) => choice = picked);
                },
                child: const Text('Show'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Them'));
      await tester.pump();
      expect(addingStarted, isTrue);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      added.complete();
      await tester.pumpAndSettle();
      expect(choice, HouseholdOfferChoice.addThem);
    });

    testWidgets('Back dismisses without an answer', (tester) async {
      HouseholdOfferChoice? choice;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  HouseholdOfferDialog.show(
                    context,
                    message: 'msg',
                    onAddThem: () async {},
                  ).then((picked) => choice = picked);
                },
                child: const Text('Show'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      // Escape is the keyboard form of the TV back key.
      await tester.sendKeyDownEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(choice, isNull);
      expect(find.text('msg'), findsNothing);
    });
  });

  group('HouseholdNoticeDialog', () {
    testWidgets('reports the result with one answer', (tester) async {
      var dismissed = false;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  HouseholdNoticeDialog.show(
                    context,
                    "Added teen, toddler and cousin. They can now be picked from Who's watching.",
                  ).then((_) => dismissed = true);
                },
                child: const Text('Show'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(
        find.text(
          "Added teen, toddler and cousin. They can now be picked from Who's watching.",
        ),
        findsOneWidget,
      );

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(dismissed, isTrue);
    });
  });
}
