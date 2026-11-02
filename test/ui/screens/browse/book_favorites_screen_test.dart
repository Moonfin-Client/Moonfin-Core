import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/book/book_card.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/music/music_widgets.dart';

import 'book_category_test_harness.dart';

/// The focus labels of the book cards on screen.
List<String?> cardLabels(WidgetTester tester) => [
  for (final card in tester.widgetList<BookCard>(find.byType(BookCard)))
    card.focusNode?.debugLabel,
];

void main() {
  late UserPreferences prefs;

  Future<void> setUpWith({required bool favorites}) async {
    prefs = await setUpBookScreens(
      FakeBookLibrary(
        titles: [
          for (var i = 0; i < 5; i++)
            bookTitle('b$i', 'Book $i', favorite: favorites),
          bookTitle(
            'a1',
            'The Hollow House',
            type: 'AudioBook',
            favorite: favorites,
          ),
          bookTitle('c1', 'Inkwell', favorite: favorites)
            ..['Container'] = 'cbz',
        ],
        artists: [
          {
            'Id': 'ar1',
            'Name': 'Mara Ellison',
            'Type': 'MusicArtist',
            'UserData': {'IsFavorite': favorites},
          },
        ],
      ),
    );
    await prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic);
  }

  tearDown(tearDownBookScreens);

  group('with favorites', () {
    setUp(() => setUpWith(favorites: true));

    testWidgets('shows a panel per kind with its first few, and hides the '
        'empty ones', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.favorites);

      expect(find.text('8 favorites'), findsOneWidget);
      expect(
        [
          for (final button in tester.widgetList<MusicPillButton>(
            find.byType(MusicPillButton),
          ))
            if (button.label == 'See All') button.focusNode.debugLabel,
        ],
        [
          'book:fav:books:all',
          'book:fav:audiobooks:all',
          'book:fav:comics:all',
          'book:fav:authors:all',
        ],
      );
      expect(cardLabels(tester), [
        'book:fav:books:0',
        'book:fav:books:1',
        'book:fav:books:2',
        'book:fav:books:3',
        'book:fav:audiobooks:0',
        'book:fav:comics:0',
      ]);
      final author = tester.widget<MediaCard>(
        find.byWidgetPredicate(
          (widget) => widget is MediaCard && widget.itemType == 'Person',
        ),
      );
      expect(author.title, 'Mara Ellison');
    });

    testWidgets('the D-pad moves around the board', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.favorites);
      expect(focusedBookNode(), 'book:fav:books:0');

      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:fav:books:all');
      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:nav:strip');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:fav:books:0');

      for (var i = 0; i < 4; i++) {
        await pressKey(tester, LogicalKeyboardKey.arrowRight);
      }
      expect(focusedBookNode(), 'book:fav:audiobooks:0');
      await pressKey(tester, LogicalKeyboardKey.arrowRight);
      expect(focusedBookNode(), 'book:fav:audiobooks:0');

      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:fav:authors:0');
      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:fav:authors:all');
      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:fav:audiobooks:0');

      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:fav:books:3');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:fav:comics:0');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:fav:comics:0');
    });

    testWidgets('See All opens the whole kind with a back button, and Back '
        'returns to its See All', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.favorites);
      focusBookNode('book:fav:books:all');
      await tester.pumpAndSettle();

      await pressKey(tester, LogicalKeyboardKey.enter);
      expect(find.text('5 favorites'), findsOneWidget);
      expect(cardLabels(tester), [for (var i = 0; i < 5; i++) 'book:all:$i']);
      expect(focusedBookNode(), 'book:all:0');
      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:back');

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('8 favorites'), findsOneWidget);
      expect(focusedBookNode(), 'book:fav:books:all');
    });

    testWidgets('phones stack the panels and show three of each', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await pumpBookScreen(tester, kind: BookCategoryKind.favorites);

      expect(
        cardLabels(tester)
            .where((label) => label!.startsWith('book:fav:books:')),
        hasLength(3),
      );
      expect(
        tester.getTopLeft(find.text('Audiobooks').last).dy,
        greaterThan(tester.getTopLeft(find.text('Books').last).dy),
      );
    });

    testWidgets('a title opens its details', (tester) async {
      await pumpWideBookScreen(tester, kind: BookCategoryKind.favorites);

      await pressKey(tester, LogicalKeyboardKey.enter);
      expect(find.textContaining('/item/b0'), findsOneWidget);
    });

    testWidgets('Left from the first column reaches the rail', (tester) async {
      await prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.bookstore,
      );
      await pumpWideBookScreen(tester, kind: BookCategoryKind.favorites);

      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:nav:favorites');
    });
  });

  testWidgets('a library without favorites says so', (tester) async {
    await setUpWith(favorites: false);
    await pumpWideBookScreen(tester, kind: BookCategoryKind.favorites);

    expect(find.text('No items found'), findsOneWidget);
  });
}
