import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/alphabet_scrub_rail.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';

import 'book_category_test_harness.dart';

void main() {
  tearDown(tearDownBookScreens);

  group('phones', () {
    // One author for every letter, so the wall runs well past the screen.
    setUp(
      () => setUpBookScreens(
        FakeBookLibrary(
          titles: [
            for (final letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''))
              bookTitle(
                't$letter',
                'Title $letter',
                author: '${letter}ane Doe',
              ),
          ],
        ),
      ),
    );

    Finder inList(Finder finder) =>
        find.descendant(of: find.byType(RefreshIndicator), matching: finder);

    testWidgets('shows portraits under letter headings', (tester) async {
      await pumpBookScreen(tester, kind: BookCategoryKind.authors);

      expect(find.text('26 authors'), findsOneWidget);
      expect(inList(find.text('A')), findsOneWidget);
      expect(find.text('Aane Doe'), findsOneWidget);
      expect(find.text('1 book'), findsWidgets);
      // No author has a picture, so their initials stand in.
      expect(find.text('AD'), findsOneWidget);
    });

    testWidgets('the rail jumps to a letter', (tester) async {
      await pumpBookScreen(tester, kind: BookCategoryKind.authors);
      expect(find.text('Tane Doe'), findsNothing);

      final rail = tester.getRect(find.byType(AlphabetScrubRail));
      final slot = rail.height / kAlphabetLetters.length;
      await tester.tapAt(
        Offset(
          rail.center.dx,
          rail.top + (kAlphabetLetters.indexOf('T') + 0.5) * slot,
        ),
      );
      await tester.pumpAndSettle();

      expect(inList(find.text('T')), findsOneWidget);
      expect(find.text('Tane Doe'), findsOneWidget);
      expect(find.text('Aane Doe'), findsNothing);
    });

    testWidgets('the sort button turns the wall Z to A', (tester) async {
      await pumpBookScreen(tester, kind: BookCategoryKind.authors);

      await tester.tap(find.text('A to Z'));
      await tester.pumpAndSettle();

      expect(find.text('Z to A'), findsOneWidget);
      expect(inList(find.text('Z')), findsOneWidget);
      expect(find.text('Zane Doe'), findsOneWidget);
      expect(find.text('Aane Doe'), findsNothing);
    });
  });

  group('wide screens', () {
    // The default library: August Lowe has an audiobook, Mara Ellison a
    // series of three with the first finished.
    setUp(() async {
      final prefs = await setUpBookScreens(FakeBookLibrary());
      await prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.classic,
      );
    });

    testWidgets('the spotlight follows focus after a pause', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.authors);

      expect(focusedBookNode(), 'book:author:0');
      expect(find.text('An overview of person-August Lowe.'), findsOneWidget);
      expect(find.text('Shuffle Audiobooks'), findsOneWidget);

      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();

      expect(focusedBookNode(), 'book:author:1');
      expect(find.text('An overview of person-Mara Ellison.'), findsOneWidget);
      expect(find.text('Lantern'), findsOneWidget);
    });

    testWidgets('Start Reading opens the first unfinished book', (
      tester,
    ) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.authors);
      focusBookNode('book:author:1');
      await tester.pumpAndSettle();

      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      expect(focusedBookNode(), 'book:spot:main');
      expect(find.text('Start Reading'), findsOneWidget);
      await pressKey(tester, LogicalKeyboardKey.enter);

      expect(find.textContaining('/player/book/lc2'), findsOneWidget);
    });

    testWidgets('Shuffle Audiobooks opens one of their audiobooks', (
      tester,
    ) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.authors);

      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      await pressKey(tester, LogicalKeyboardKey.enter);

      expect(find.textContaining('/item/ho1'), findsOneWidget);
    });

    testWidgets('D-pad edges', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.authors);

      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:nav:strip');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:author:0');

      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      expect(focusedBookNode(), 'book:spot:main');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(
        focusedBookNode(),
        startsWith('LockedFocusRow:books_lib-1_spot:'),
      );
      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:author:0');

      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:author:0');
    });
  });
}
