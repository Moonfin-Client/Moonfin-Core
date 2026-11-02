import 'dart:convert';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/book/discover/discover_book_detail_screen.dart';
import 'package:moonfin/ui/widgets/book/book_navigation.dart';
import 'package:moonfin/ui/widgets/book/discover/book_discover_tab.dart';
import 'package:moonfin/ui/widgets/book/discover/book_discovery_models.dart';
import 'package:moonfin/ui/widgets/music/music_widgets.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'book_category_test_harness.dart';

Map<String, dynamic> _work(String title, String author, int year) => {
  'key': 'test:$title',
  'title': title,
  'author_name': [author],
  'first_publish_year': year,
};

/// Answers Open Library and LibriVox from canned lists, so nothing reaches
/// the network.
class _FakeCatalog implements HttpClientAdapter {
  final requests = <Uri>[];

  static final _subjects = {
    'fantasy': [
      _work('The Hobbit', 'J. R. R. Tolkien', 1937),
      _work('A Wizard of Earthsea', 'Ursula K. Le Guin', 1968),
    ],
    'romance': [_work('Pride and Prejudice', 'Jane Austen', 1813)],
    'science_fiction': [_work('Dune', 'Frank Herbert', 1965)],
    'poetry': [_work('Leaves of Grass', 'Walt Whitman', 1855)],
  };

  static Map<String, dynamic> _audiobook(String id, String title) => {
    'id': id,
    'title': title,
    'authors': [
      {'first_name': 'H. G.', 'last_name': 'Wells'},
    ],
    'url_iarchive': 'https://archive.org/details/$id',
  };

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final uri = options.uri;
    requests.add(uri);
    final params = uri.queryParameters;
    Object body;
    if (uri.host == 'librivox.org') {
      final title = params['title'];
      body = {
        'books': [
          if (title == null) _audiobook('lv-${params['genre']}', 'War of the Worlds'),
          if (title == '^time') _audiobook('lv-time', 'Time Machine'),
        ],
      };
    } else {
      final q = params['q'] ?? '';
      final subject = RegExp(r'subject_key:"(.+)"').firstMatch(q)?.group(1);
      body = {
        'docs': subject != null
            ? _subjects[subject] ?? const []
            : [
                if (q == 'time') _work('The Time Machine', 'H. G. Wells', 1895),
              ],
      };
    }
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  final realDio = bookDiscoverDio;
  late _FakeCatalog catalog;

  setUp(() {
    catalog = _FakeCatalog();
    bookDiscoverDio = () => Dio()..httpClientAdapter = catalog;
  });

  tearDown(() => bookDiscoverDio = realDio);

  group('Discover screen', () {
    late UserPreferences prefs;

    setUp(() async {
      prefs = await setUpBookScreens(FakeBookLibrary());
    });

    tearDown(tearDownBookScreens);

    Future<void> pumpDiscover(WidgetTester tester) =>
        pumpWideBookScreen(tester, kind: BookCategoryKind.discover);

    Iterable<String> chipLabels(WidgetTester tester) => tester
        .widgetList<MusicChip>(find.byType(MusicChip))
        .map((chip) => chip.label);

    testWidgets('features the first subject\'s first title over a shelf per '
        'subject', (tester) async {
      await pumpDiscover(tester);

      expect(find.text('FEATURED · FANTASY'), findsOneWidget);
      expect(find.text('J. R. R. Tolkien · 1937'), findsOneWidget);
      // The hero and the first card of the Fantasy shelf.
      expect(find.text('The Hobbit'), findsNWidgets(2));
      expect(find.text('Pride and Prejudice'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text('Dune'),
        300,
        scrollable: find
            .descendant(
              of: find.byType(RefreshIndicator),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      expect(find.text('Dune'), findsOneWidget);
      expect(catalog.requests.map((uri) => uri.host).toSet(), {
        'openlibrary.org',
      });
    });

    testWidgets('Details on the hero opens the title\'s detail screen', (
      tester,
    ) async {
      await pumpDiscover(tester);
      focusBookNode('book:hero:details');
      await tester.pumpAndSettle();

      await pressKey(tester, LogicalKeyboardKey.enter);
      final detail = tester.widget<DiscoverBookDetailScreen>(
        find.byType(DiscoverBookDetailScreen),
      );
      expect(detail.book.title, 'The Hobbit');
    });

    testWidgets('chips come from the stored subjects and filter to one', (
      tester,
    ) async {
      await (await SharedPreferences.getInstance()).setStringList(
        bookDiscoverSubjectsPrefKey,
        ['romance', 'poetry', 'not_a_subject'],
      );
      await pumpDiscover(tester);
      expect(chipLabels(tester), ['All', 'Poetry', 'Romance']);
      expect(find.text('Leaves of Grass'), findsNWidgets(2));

      await tester.tap(find.widgetWithText(MusicChip, 'Romance'));
      await tester.pumpAndSettle();
      expect(find.text('Pride and Prejudice'), findsOneWidget);
      expect(find.text('Leaves of Grass'), findsNothing);
      expect(find.textContaining('FEATURED'), findsNothing);

      await tester.tap(find.widgetWithText(MusicChip, 'All'));
      await tester.pumpAndSettle();
      expect(find.text('Leaves of Grass'), findsNWidgets(2));
    });

    testWidgets('typing searches Open Library once it pauses, and the results '
        'replace the shelves', (tester) async {
      await pumpDiscover(tester);
      expect(find.text('Search Open Library'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'ti');
      await tester.pump(const Duration(milliseconds: 100));
      await tester.enterText(find.byType(TextField), 'time');
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpAndSettle();

      final searches = catalog.requests
          .where((uri) => !uri.queryParameters['q']!.startsWith('subject_key'))
          .map((uri) => uri.queryParameters['q']);
      expect(searches, ['time']);
      expect(find.text('The Time Machine'), findsOneWidget);
      expect(find.text('Pride and Prejudice'), findsNothing);
      expect(find.textContaining('FEATURED'), findsNothing);
      expect(chipLabels(tester), contains('Fantasy'));

      await tester.enterText(find.byType(TextField), 'nothing like it');
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpAndSettle();
      expect(find.text('No items found'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '');
      await tester.pumpAndSettle();
      expect(find.text('Pride and Prejudice'), findsOneWidget);
    });

    testWidgets('the D-pad goes nav, search, chips, hero, then the shelves, '
        'and back up the same way', (tester) async {
      await prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.classic,
      );
      await pumpDiscover(tester);
      expect(focusedBookNode(), 'book:search');

      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:nav:strip');
      const down = [
        'book:search',
        'book:chip:all',
        'book:hero:details',
        'book:shelf:fantasy:0',
        'book:shelf:romance:0',
        'book:shelf:science_fiction:0',
      ];
      for (final label in down) {
        await pressKey(tester, LogicalKeyboardKey.arrowDown);
        expect(focusedBookNode(), label);
      }
      for (final label in down.reversed.skip(1)) {
        await pressKey(tester, LogicalKeyboardKey.arrowUp);
        expect(focusedBookNode(), label);
      }
    });

    testWidgets('Down from the search reaches the results, and Up goes back '
        'through the chips', (tester) async {
      await pumpDiscover(tester);
      await tester.enterText(find.byType(TextField), 'time');
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpAndSettle();
      focusBookNode('book:search');
      await tester.pumpAndSettle();

      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:result:0');
      await pressKey(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:chip:all');
    });

    testWidgets('on a TV the arrows leave the search, and Select opens its '
        'keyboard', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      // The TV field blinks its cursor while focused, so nothing settles and
      // the harness's pump can't be used.
      Future<void> frames() async {
        for (var i = 0; i < 10; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
      }

      Future<void> press(LogicalKeyboardKey key) async {
        await tester.sendKeyEvent(key);
        await frames();
      }

      await tester.pumpWidget(bookScreenApp(kind: BookCategoryKind.discover));
      await frames();
      expect(focusedBookNode(), 'book:search');

      await press(LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:nav:discover');
      await press(LogicalKeyboardKey.arrowRight);
      expect(focusedBookNode(), 'book:search');
      await press(LogicalKeyboardKey.arrowDown);
      expect(focusedBookNode(), 'book:chip:all');
      await press(LogicalKeyboardKey.arrowUp);
      expect(focusedBookNode(), 'book:search');

      await press(LogicalKeyboardKey.select);
      expect(CustomTVTextField.isKeyboardVisibleNotifier.value, isTrue);
    });

    testWidgets('Left from a shelf\'s first card reaches the Bookstore rail', (
      tester,
    ) async {
      await pumpDiscover(tester);
      focusBookNode('book:shelf:romance:0');
      await tester.pumpAndSettle();

      await pressKey(tester, LogicalKeyboardKey.arrowLeft);
      expect(focusedBookNode(), 'book:nav:discover');
    });
  });

  group('Discover feed', () {
    setUp(() => SharedPreferences.setMockInitialValues(<String, Object>{}));

    test('an audiobook library reads LibriVox genres and searches titles '
        'from their start without the article', () async {
      final feed = BookDiscoverFeed(isAudiobook: true);
      addTearDown(feed.dispose);
      await feed.load();

      expect(feed.subjects.first, 'Fantasy Fiction');
      final row = feed.rows['Fantasy Fiction']!.cast<LibrivoxBook>();
      expect(row.single.title, 'War of the Worlds');
      expect(
        feed.covers[row.single.id],
        'https://archive.org/services/img/lv-Fantasy Fiction',
      );

      feed.search('The time');
      expect(feed.results, isNull);
      await Future<void>.delayed(const Duration(milliseconds: 450));
      expect(feed.describe(feed.results!.single).title, 'Time Machine');
      expect(catalog.requests.map((uri) => uri.host).toSet(), {'librivox.org'});
    });
  });
}
