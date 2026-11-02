import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/book_discover_screen.dart';
import 'package:moonfin/ui/widgets/book/book_browse_nav.dart';
import 'package:moonfin/ui/widgets/book/book_card.dart';
import 'package:moonfin/ui/widgets/book/book_category_nav.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';
import 'package:moonfin/ui/widgets/music/music_widgets.dart';

import 'book_category_test_harness.dart';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    prefs = await setUpBookScreens(FakeBookLibrary());
  });

  tearDown(tearDownBookScreens);

  group('Bookstore', () {
    testWidgets('opens on All Titles beside its rail', (tester) async {
      await pumpWideBookScreen(tester);

      expect(find.byType(BookLibraryRail), findsOneWidget);
      expect(find.text('All Titles'), findsWidgets);
      expect(find.byType(BookCard), findsNWidgets(5));
      // Two titles are underway, so the Continue row comes first.
      expect(focusedBookNode(), 'LockedFocusRow:books_lib-1_resume');
    });

    testWidgets('Left from the first column reaches the rail, and the rail '
        'switches in place', (tester) async {
      await pumpWideBookScreen(tester);
      focusBookNode('book:title:0');
      await tester.pumpAndSettle();

      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:nav:scope:all');
      for (var i = 0; i < 3; i++) {
        await pressKey(tester, LogicalKeyboardKey.arrowDown);
      }
      expect(focusedBookNode(), 'book:nav:series');
      await pressKey(tester, LogicalKeyboardKey.enter);
      expect(find.byType(BookCard), findsNothing);
      expect(focusedBookNode(), 'book:nav:series');
    });

    testWidgets('Back on another destination returns to All Titles', (
      tester,
    ) async {
      await pumpWideBookScreen(tester);
      await tester.tap(find.text('Series').first);
      await tester.pumpAndSettle();
      expect(find.byType(BookCard), findsNothing);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.byType(BookCard), findsNWidgets(5));
    });

    testWidgets('the sidebar moves the rail past it', (tester) async {
      await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
      await pumpWideBookScreen(tester);

      expect(
        tester.getTopLeft(find.byType(BookLibraryRail)).dx,
        closeTo(52, 1.0),
      );
    });

    testWidgets('the rail offers Discover behind its setting', (tester) async {
      await pumpWideBookScreen(tester);
      final discover = find.descendant(
        of: find.byType(BookLibraryRail),
        matching: find.text('Discover'),
      );

      await tester.tap(discover);
      await tester.pumpAndSettle();
      expect(find.byType(BookDiscoverScreen), findsOneWidget);

      await prefs.set(UserPreferences.showBookDiscoverTab, false);
      await tester.pumpAndSettle();
      expect(discover, findsNothing);
      expect(find.byType(BookDiscoverScreen), findsNothing);
      expect(find.byType(BookCard), findsNWidgets(5));
    });

    testWidgets('an update leaves focus where the viewer put it', (
      tester,
    ) async {
      await pumpWideBookScreen(tester);
      focusBookNode('book:nav:scope:all');
      await tester.pump();

      await prefs.set(UserPreferences.osdLockEnabled, true);
      await tester.pumpAndSettle();

      expect(focusedBookNode(), 'book:nav:scope:all');
    });

    testWidgets('focus that falls off the page comes back to the content', (
      tester,
    ) async {
      await pumpWideBookScreen(tester);
      FocusManager.instance.primaryFocus!.unfocus();
      await tester.pump();

      await prefs.set(UserPreferences.osdLockEnabled, true);
      await tester.pumpAndSettle();

      expect(focusedBookNode(), 'LockedFocusRow:books_lib-1_resume');
    });

    testWidgets('phones swap the rail for chips with the current one filled', (
      tester,
    ) async {
      await pumpBookScreen(tester);

      expect(find.byType(BookLibraryRail), findsNothing);
      final picked = tester
          .widgetList<MusicChip>(find.byType(MusicChip))
          .where((chip) => chip.selected);
      expect(picked.single.label, 'All Titles');
    });
  });

  group('Titles', () {
    setUp(
      () => prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic),
    );

    testWidgets('picking a card opens its panel, and again closes it', (
      tester,
    ) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.titles);

      await pressKey(tester, LogicalKeyboardKey.enter);
      expect(find.textContaining('An overview of'), findsOneWidget);
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:panel:read');

      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      await pressKey(tester, LogicalKeyboardKey.enter);
      expect(find.textContaining('An overview of'), findsNothing);
    });

    testWidgets('Back closes an open panel before leaving', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.titles);
      await pressKey(tester, LogicalKeyboardKey.enter);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.textContaining('An overview of'), findsNothing);
      expect(focusedBookNode(), 'book:title:0');
    });

    testWidgets('Up from the grid goes to the header, then the nav', (
      tester,
    ) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.titles);

      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:scope');
      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:nav:strip');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:scope');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:title:0');
    });
  });

  group('Classic and Reading Room', () {
    testWidgets('Classic keeps its pill strip on every destination', (
      tester,
    ) async {
      await prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic);
      await pumpBookScreen(tester, kind: BookCategoryKind.series);

      final strip = tester.widget<BookCategoryStrip>(
        find.byType(BookCategoryStrip),
      );
      expect(strip.entries.first.label, 'Overview');
      expect(strip.entries.singleWhere((e) => e.selected).label, 'Series');
    });

    testWidgets('Reading Room keeps its icon chips', (tester) async {
      await prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.readingRoom,
      );
      await pumpBookScreen(tester, kind: BookCategoryKind.authors);

      final chips = tester.widget<BookCategoryChips>(
        find.byType(BookCategoryChips),
      );
      expect(chips.icons, isTrue);
      expect(chips.entries.singleWhere((e) => e.selected).label, 'Authors');
    });
  });
}
