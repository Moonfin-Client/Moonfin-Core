import 'package:flutter/material.dart';
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
import 'package:moonfin/ui/screens/browse/book_browse_screen.dart';
import 'package:moonfin/ui/widgets/book/book_segmented_control.dart';
import 'package:moonfin/ui/widgets/book/discover/book_discover_tab.dart';
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

/// An empty library is enough for the screen to settle, since the tabs are
/// built independently of the rows.
class _FakeItemsApi extends Fake implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      Future.value(const {'Items': <dynamic>[], 'TotalRecordCount': 0});
}

class _OneBookItemsApi extends Fake implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) => Future.value(const {
    'Items': [
      {'Id': 'book-1', 'Name': 'Dune', 'Type': 'Book', 'ServerId': 'server'},
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
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const BookBrowseScreen(
          libraryId: 'lib-1',
          collectionType: 'books',
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('the Discover tab is offered by default', (tester) async {
    await pumpScreen(tester);

    expect(find.byType(BookSegmentedControl), findsOneWidget);
  });

  testWidgets('turning the preference off removes the tab control and Discover',
      (tester) async {
    await prefs.set(UserPreferences.showBookDiscoverTab, false);
    await pumpScreen(tester);

    expect(find.byType(BookSegmentedControl), findsNothing);
    // A bare else fallback would still render Discover for any non-zero tab
    // index, so this half is the regression that matters.
    expect(find.byType(BookDiscoverTab), findsNothing);
  });

  testWidgets('the tab control follows the preference while the screen is open',
      (tester) async {
    await prefs.set(UserPreferences.showBookDiscoverTab, false);
    await pumpScreen(tester);
    expect(find.byType(BookSegmentedControl), findsNothing);

    await prefs.set(UserPreferences.showBookDiscoverTab, true);
    await tester.pumpAndSettle();

    expect(find.byType(BookSegmentedControl), findsOneWidget);
  });

  testWidgets('the sidebar moves the tab control past it on wide layouts',
      (tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
    await pumpScreen(tester);

    expect(
      tester.getTopLeft(find.byType(BookSegmentedControl)).dx,
      closeTo(60, 1.0),
    );
  });

  testWidgets('phones keep the tab control at the edge with the sidebar on',
      (tester) async {
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
    await pumpScreen(tester);

    expect(tester.getTopLeft(find.byType(BookSegmentedControl)).dx, 16);
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
          .firstWhere((node) => node.debugLabel == 'bookTabs')
          .requestFocus();
      await tester.pump();

      await somethingChanges(tester);

      expect(focused(), 'bookTabs');
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
}
