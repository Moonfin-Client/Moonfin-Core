import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';

import 'book_category_test_harness.dart';

void main() {
  // Most Titles and A to Z put these three genres in opposite orders. Of the
  // mysteries only Mist is unread.
  setUp(
    () => setUpBookScreens(
      FakeBookLibrary(
        titles: [
          bookTitle('a1', 'Atlas', genres: const ['Adventure']),
          bookTitle('h1', 'Hush', genres: const ['Horror']),
          bookTitle('h2', 'Howl', genres: const ['Horror']),
          bookTitle('m1', 'Mire', genres: const ['Mystery'], finished: true),
          bookTitle('m2', 'Murk', genres: const ['Mystery'], played: 20),
          bookTitle('m3', 'Mist', genres: const ['Mystery']),
        ],
      ),
    ),
  );

  tearDown(tearDownBookScreens);

  double top(WidgetTester tester, String text) =>
      tester.getTopLeft(find.text(text)).dy;

  testWidgets('stations come by most titles, then A to Z', (tester) async {
    await pumpWideBookScreen(tester, kind: BookCategoryKind.genres);

    expect(find.text('3 genres'), findsOneWidget);
    expect(find.text('3 titles'), findsOneWidget);
    expect(top(tester, 'Mystery'), lessThan(top(tester, 'Horror')));
    expect(top(tester, 'Horror'), lessThan(top(tester, 'Adventure')));

    await tester.tap(find.text('A to Z'));
    await tester.pumpAndSettle();

    expect(top(tester, 'Adventure'), lessThan(top(tester, 'Horror')));
    expect(top(tester, 'Horror'), lessThan(top(tester, 'Mystery')));
  });

  testWidgets('Surprise Me opens an unread title on its details', (
    tester,
  ) async {
    await pumpBookScreen(tester, kind: BookCategoryKind.genres);

    await tester.tap(find.text('Mystery'));
    await tester.pumpAndSettle();

    expect(find.textContaining('/item/m3'), findsOneWidget);
  });

  testWidgets('D-pad edges', (tester) async {
    await pumpWideBookScreen(tester, kind: BookCategoryKind.genres);

    expect(focusedBookNode(), 'book:surprise:Mystery');
    await pressKey(tester, LogicalKeyboardKey.arrowUp);
    expect(focusedBookNode(), 'book:order');
    await pressKey(tester, LogicalKeyboardKey.arrowDown);
    expect(focusedBookNode(), 'book:surprise:Mystery');

    await pressKey(tester, LogicalKeyboardKey.arrowRight);
    expect(focusedBookNode(), 'book:shelf:Mystery');
    await pressKey(tester, LogicalKeyboardKey.arrowDown);
    expect(focusedBookNode(), 'book:shelf:Horror');
    await pressKey(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedBookNode(), 'book:surprise:Horror');

    // The Bookstore rail sits to the left of the stations.
    await pressKey(tester, LogicalKeyboardKey.arrowLeft);
    expect(focusedBookNode(), 'book:nav:genres');
  });
}
