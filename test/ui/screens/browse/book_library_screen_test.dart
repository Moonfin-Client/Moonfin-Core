import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin/ui/screens/browse/book_category_screen.dart';
import 'package:moonfin/ui/screens/browse/book_library_screen.dart';
import 'package:moonfin/ui/screens/browse/classic_book_browse_screen.dart';
import 'package:moonfin/ui/screens/browse/reading_room_book_screen.dart';
import 'package:moonfin/ui/widgets/book/reading_room/reading_room_continue_card.dart';
import 'package:moonfin/ui/widgets/book/book_category_nav.dart';
import 'package:moonfin/ui/widgets/left_sidebar.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The book screen renders inside the navigation chrome, so the whole chrome's
// dependency set has to be standing.
class _FakeUserRepository extends Fake implements UserRepository {
  @override
  User? get currentUser => null;

  @override
  Stream<User?> get currentUserStream => const Stream.empty();
}

class _FakeUserViewsRepository extends ChangeNotifier
    implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getUserViews() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakePluginSyncService extends ChangeNotifier
    implements PluginSyncService {
  @override
  bool get seerrAvailable => false;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;
}

class _FakeGameLibraryRegistry extends Fake implements GameLibraryRegistry {
  @override
  Future<void> refresh() async {}
}

class _FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeServerMessages extends ChangeNotifier
    implements ServerMessagesService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

/// An empty library, so the nav only offers Overview, Titles and Discover.
class _FakeItemsApi extends Fake implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      Future.value(const {'Items': <dynamic>[], 'TotalRecordCount': 0});
}

/// One started book, which every query answers with, so each section shows.
class _OneBookItemsApi extends Fake implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => Future.value(const {
    'Items': [
      {
        'Id': 'book-1',
        'Name': 'Dune',
        'Type': 'Book',
        'ServerId': 'server',
        'UserData': {'PlayedPercentage': 40.0},
      },
    ],
    'TotalRecordCount': 1,
  });
}

void main() {
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    final client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user-1');
    when(() => client.itemsApi).thenReturn(_FakeItemsApi());
    when(() => client.imageApi).thenReturn(_MockImageApi());

    final getIt = GetIt.instance;
    getIt.registerSingleton<PreferenceStore>(store);
    getIt.registerSingleton<UserPreferences>(prefs);
    getIt.registerSingleton<UserRepository>(_FakeUserRepository());
    getIt.registerSingleton<UserViewsRepository>(_FakeUserViewsRepository());
    getIt.registerSingleton<PluginSyncService>(_FakePluginSyncService());
    getIt.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, _FakeSessionRepository()),
    );
    getIt.registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry());
    getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
    getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
    getIt.registerSingleton<ServerMessagesService>(_FakeServerMessages());
    getIt.registerSingleton<MediaServerClient>(client);
    getIt.registerSingleton<RowDataSource>(RowDataSource(client));
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    Widget shows(GoRouterState state) =>
        Scaffold(body: Text(state.uri.toString()));
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) =>
              const BookLibraryScreen(libraryId: 'lib-1', collectionType: 'books'),
        ),
        GoRoute(path: '/item/:id', builder: (_, state) => shows(state)),
        GoRoute(path: '/player/book/:id', builder: (_, state) => shows(state)),
        GoRoute(
          path: '/books/:id/:category',
          builder: (_, state) => shows(state),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await tester.pumpAndSettle();
  }

  group('style', () {
    testWidgets('Bookstore is the default', (tester) async {
      await pumpScreen(tester);

      expect(find.byType(BookCategoryScreen), findsOneWidget);
    });

    testWidgets('changing the style swaps the screen while it\'s open', (
      tester,
    ) async {
      await pumpScreen(tester);

      await prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic);
      await tester.pumpAndSettle();
      expect(find.byType(ClassicBookBrowseScreen), findsOneWidget);
      expect(find.byType(BookCategoryScreen), findsNothing);

      await prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.readingRoom,
      );
      await tester.pumpAndSettle();
      expect(find.byType(ReadingRoomBookScreen), findsOneWidget);
      expect(find.byType(ClassicBookBrowseScreen), findsNothing);
    });
  });

  group('Classic', () {
    setUp(
      () => prefs.set(UserPreferences.bookLibraryStyle, BookLibraryStyle.classic),
    );

    List<String> stripLabels(WidgetTester tester) => [
      for (final entry in tester
          .widget<BookCategoryStrip>(find.byType(BookCategoryStrip))
          .entries)
        entry.label,
    ];

    testWidgets('the strip offers Discover by default', (tester) async {
      await pumpScreen(tester);

      expect(stripLabels(tester), ['Overview', 'Titles', 'Discover']);
    });

    testWidgets('turning Discover off takes it out of the strip', (
      tester,
    ) async {
      await prefs.set(UserPreferences.showBookDiscoverTab, false);
      await pumpScreen(tester);

      expect(stripLabels(tester), isNot(contains('Discover')));
    });

    testWidgets('the strip follows the setting while the screen is open', (
      tester,
    ) async {
      await prefs.set(UserPreferences.showBookDiscoverTab, false);
      await pumpScreen(tester);
      expect(stripLabels(tester), isNot(contains('Discover')));

      await prefs.set(UserPreferences.showBookDiscoverTab, true);
      await tester.pumpAndSettle();

      expect(stripLabels(tester), contains('Discover'));
    });

    testWidgets('the strip opens a destination', (tester) async {
      await pumpScreen(tester);

      await tester.tap(find.text('Titles'));
      await tester.pumpAndSettle();

      expect(find.text('/books/lib-1/titles'), findsOneWidget);
    });

    testWidgets('the sidebar moves the strip past it on wide layouts', (
      tester,
    ) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
      await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
      await pumpScreen(tester);

      expect(
        tester.getTopLeft(find.byType(BookCategoryStrip)).dx,
        closeTo(16 + 52, 1.0),
      );
    });

    testWidgets('phones keep the strip at the edge with the sidebar on', (
      tester,
    ) async {
      await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
      await pumpScreen(tester);

      expect(tester.getTopLeft(find.byType(BookCategoryStrip)).dx, 16);
    });

    group('focus on wide layouts', () {
      Future<void> pumpWithBook(WidgetTester tester) async {
        when(() => GetIt.instance<MediaServerClient>().itemsApi)
            .thenReturn(_OneBookItemsApi());
        PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
        await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
        await pumpScreen(tester);
      }

      String? focused() => FocusManager.instance.primaryFocus?.debugLabel;

      Future<void> somethingChanges(WidgetTester tester) async {
        await prefs.set(UserPreferences.osdLockEnabled, true);
        await tester.pumpAndSettle();
      }

      testWidgets('the content takes focus once it loads, not the sidebar', (
        tester,
      ) async {
        await pumpWithBook(tester);

        expect(focused(), 'bookHeroCta');
        expect(LeftSidebar.isFocusedNotifier.value, isFalse);
      });

      testWidgets('an update leaves focus where the viewer put it', (
        tester,
      ) async {
        await pumpWithBook(tester);
        FocusManager.instance.rootScope.descendants
            .firstWhere((node) => node.debugLabel == 'bookNav')
            .requestFocus();
        await tester.pump();

        await somethingChanges(tester);

        expect(focused(), 'bookNav');
      });

      testWidgets('focus that falls off the page comes back to the content', (
        tester,
      ) async {
        await pumpWithBook(tester);
        FocusManager.instance.primaryFocus!.unfocus();
        await tester.pump();

        await somethingChanges(tester);

        expect(focused(), 'bookHeroCta');
      });
    });
  });

  group('Reading Room', () {
    setUp(
      () => prefs.set(
        UserPreferences.bookLibraryStyle,
        BookLibraryStyle.readingRoom,
      ),
    );

    List<String> chipLabels(WidgetTester tester) => [
      for (final entry in tester
          .widget<BookCategoryChips>(find.byType(BookCategoryChips))
          .entries)
        entry.label,
    ];

    testWidgets('the chips offer Discover by default', (tester) async {
      await pumpScreen(tester);

      expect(chipLabels(tester), ['Overview', 'Titles', 'Discover']);
    });

    testWidgets('turning Discover off takes it out of the chips', (
      tester,
    ) async {
      await prefs.set(UserPreferences.showBookDiscoverTab, false);
      await pumpScreen(tester);

      expect(chipLabels(tester), isNot(contains('Discover')));
    });

    group('on wide layouts', () {
      Future<void> pumpWithBook(WidgetTester tester) async {
        when(() => GetIt.instance<MediaServerClient>().itemsApi)
            .thenReturn(_OneBookItemsApi());
        PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
        await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
        await pumpScreen(tester);
      }

      String? focused() => FocusManager.instance.primaryFocus?.debugLabel;

      Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
        await tester.sendKeyEvent(key);
        await tester.pumpAndSettle();
      }

      ReadingRoomContinueCard card(WidgetTester tester) =>
          tester.widget(find.byType(ReadingRoomContinueCard));

      testWidgets('the sidebar moves the content past it', (tester) async {
        await pumpWithBook(tester);

        expect(
          tester.getTopLeft(find.text('Continue Reading')).dx,
          closeTo(48 + 52, 1.0),
        );
      });

      testWidgets('focus lands on Continue and walks every section', (
        tester,
      ) async {
        await pumpWithBook(tester);
        expect(focused(), 'LockedFocusRow:books_lib-1_continue');
        expect(LeftSidebar.isFocusedNotifier.value, isFalse);

        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(card(tester).buttonFocused, isTrue);
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(card(tester).focused, isTrue);
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'bookSearch');
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'bookNav:overview');

        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'bookSearch');
        await press(tester, LogicalKeyboardKey.arrowDown);
        await press(tester, LogicalKeyboardKey.arrowDown);
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'bookBrowseAll');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'LockedFocusRow:books_lib-1_recent_all');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'bookTile:author:0');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'bookTile:genre:0');

        // Up from a section reaches its See all before the section above.
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'bookTile:seeAll:genres');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'bookTile:genre:0');
        await press(tester, LogicalKeyboardKey.arrowUp);
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'LockedFocusRow:books_lib-1_recent_all');
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'bookTile:seeAll:recent');
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'bookBrowseAll');
      });

      testWidgets('select opens details from the card and reads from its '
          'button', (tester) async {
        await pumpWithBook(tester);

        await press(tester, LogicalKeyboardKey.enter);
        final details = find.textContaining('/item/book-1');
        expect(details, findsOneWidget);
        GoRouter.of(tester.element(details)).pop();
        await tester.pumpAndSettle();

        await press(tester, LogicalKeyboardKey.arrowDown);
        await press(tester, LogicalKeyboardKey.enter);
        expect(find.textContaining('/player/book/book-1'), findsOneWidget);
      });
    });
  });
}
