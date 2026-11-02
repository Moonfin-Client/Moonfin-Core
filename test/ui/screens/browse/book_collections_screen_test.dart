import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/book/book_cover_strip_card.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';

import 'book_category_test_harness.dart';

void main() {
  late UserPreferences prefs;

  Future<void> setUpWith(Map<String, List<String>> collections) async {
    prefs = await setUpBookScreens(FakeBookLibrary(collections: collections));
    await prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic);
  }

  tearDown(tearDownBookScreens);

  group('with collections', () {
    setUp(
      () => setUpWith({
        'box-1': ['lc1', 'ho1'],
        'box-2': ['lc2'],
        'box-3': ['ma1'],
      }),
    );

    testWidgets('shows a card per collection with its covers, count and '
        'description', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.collections);

      expect(find.text('3 collections'), findsOneWidget);
      expect(find.byType(BookCoverStripCard), findsNWidgets(3));
      final first = tester.widget<BookCoverStripCard>(
        find.byType(BookCoverStripCard).first,
      );
      expect(first.covers, hasLength(2));
      expect(find.text('2 titles'), findsOneWidget);
      expect(find.text('1 title'), findsNWidgets(2));
      expect(find.text('This year\'s picks.'), findsNWidgets(3));
    });

    testWidgets('the D-pad lands on the first card and stays inside the grid', (
      tester,
    ) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.collections);
      expect(focusedBookNode(), 'book:collection:0');

      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:nav:strip');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:collection:0');

      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      expect(focusedBookNode(), 'book:collection:1');
      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      expect(focusedBookNode(), 'book:collection:1');
      // Nothing sits under it, so Down steps onto the last card.
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:collection:2');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:collection:2');

      await pressKey(tester, LogicalKeyboardKey.enter);
      expect(find.text('/collection/box-3'), findsOneWidget);
    });

    testWidgets('Left from the first column reaches the rail', (tester) async {
      await prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.bookstore,
      );
      await pumpWideBookScreen(tester, kind: BookCategoryKind.collections);

      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:nav:collections');
    });
  });

  testWidgets('phones show one card across', (tester) async {
    await setUpWith({
      'box-1': ['lc1'],
      'box-2': ['lc2'],
    });
    await pumpBookScreen(tester, kind: BookCategoryKind.collections);

    final cards = find.byType(BookCoverStripCard);
    expect(
      tester.getTopLeft(cards.at(1)).dy,
      greaterThan(tester.getBottomLeft(cards.at(0)).dy),
    );
  });

  testWidgets('a library without collections says so', (tester) async {
    await setUpWith({});
    await pumpWideBookScreen(tester, kind: BookCategoryKind.collections);

    expect(find.byType(BookCoverStripCard), findsNothing);
    expect(find.text('No items found'), findsOneWidget);
  });
}
