import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';
import 'package:moonfin/ui/widgets/media_card.dart';

import 'book_category_test_harness.dart';

/// The title of the book a shelf has focused.
String? focusedBook(WidgetTester tester) => tester
    .widgetList<MediaCard>(find.byType(MediaCard))
    .where((card) => card.externalIsFocused ?? false)
    .firstOrNull
    ?.title;

void main() {
  late UserPreferences prefs;

  setUp(() async {
    prefs = await setUpBookScreens(
      FakeBookLibrary(
        titles: [
          bookTitle(
            'lc1',
            'The Lantern Coast',
            series: 'Lantern',
            index: 1,
            finished: true,
          ),
          bookTitle(
            'lc2',
            'Tidewright',
            series: 'Lantern',
            index: 2,
            played: 42,
          ),
          bookTitle('lc3', 'The Glass Harbor', series: 'Lantern', index: 3),
          bookTitle(
            'm1',
            'Reeds',
            series: 'Marsh',
            index: 1,
            author: 'August Lowe',
          ),
          bookTitle(
            'm2',
            'Fen',
            series: 'Marsh',
            index: 2,
            author: 'August Lowe',
          ),
        ],
      ),
    );
    await prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic);
  });

  tearDown(tearDownBookScreens);

  testWidgets('shows a shelf per series with where the reader is in it', (
    tester,
  ) async {
    await pumpWideBookScreen(tester, kind: BookCategoryKind.series);

    expect(find.text('2 series'), findsOneWidget);
    expect(find.text('Lantern'), findsOneWidget);
    expect(find.text('Mara Ellison'), findsOneWidget);
    expect(find.text('August Lowe'), findsOneWidget);
    // The book underway is up next, and a series nobody started opens on its
    // first book.
    expect(find.text('Book 2 of 3'), findsOneWidget);
    expect(find.text('Book 1 of 2'), findsOneWidget);
    expect(find.text('UP NEXT'), findsNWidgets(2));
    expect(find.text('3'), findsOneWidget);
    expect(find.text('Finished'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
  });

  testWidgets('Down from the header lands on the first book, and Up and Down '
      'move between shelves', (tester) async {
    await pumpWideBookScreen(tester, kind: BookCategoryKind.series);
    expect(focusedBookNode(), 'book:series:0');
    expect(focusedBook(tester), 'The Lantern Coast');

    for (var i = 0; i < 3; i++) {
      await pressKey(tester, LogicalKeyboardKey.arrowRight);
    }
    expect(focusedBookNode(), 'book:series:0');
    expect(focusedBook(tester), 'The Glass Harbor');

    await pressKey(tester, LogicalKeyboardKey.arrowDown);
    expect(focusedBookNode(), 'book:series:1');
    expect(focusedBook(tester), 'Reeds');
    await pressKey(tester, LogicalKeyboardKey.arrowDown);
    expect(focusedBookNode(), 'book:series:1');

    await pressKey(tester, LogicalKeyboardKey.arrowUp);
    expect(focusedBook(tester), 'The Glass Harbor');
    await pressKey(tester, LogicalKeyboardKey.arrowUp);
    expect(focusedBookNode(), 'book:nav:strip');
    await pressKey(tester, LogicalKeyboardKey.arrowDown);
    expect(focusedBookNode(), 'book:series:0');
    expect(focusedBook(tester), 'The Lantern Coast');
  });

  testWidgets('Left from a shelf\'s first book reaches the rail', (
    tester,
  ) async {
    await prefs.set(
      UserPreferences.bookLibraryStyle,
      BookLibraryStyle.bookstore,
    );
    await pumpWideBookScreen(tester, kind: BookCategoryKind.series);
    expect(focusedBookNode(), 'book:series:0');

    await pressKey(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedBookNode(), 'book:nav:series');
  });

  testWidgets('a book opens its details', (tester) async {
    await pumpWideBookScreen(tester, kind: BookCategoryKind.series);
    await pressKey(tester, LogicalKeyboardKey.arrowRight);

    await pressKey(tester, LogicalKeyboardKey.enter);
    expect(find.textContaining('/item/lc2'), findsOneWidget);
  });

  testWidgets('phones put the info above its shelf', (tester) async {
    await pumpBookScreen(tester, kind: BookCategoryKind.series);

    expect(
      tester.getBottomLeft(find.text('Book 2 of 3')).dy,
      lessThan(tester.getTopLeft(find.text('The Lantern Coast')).dy),
    );
  });
}
