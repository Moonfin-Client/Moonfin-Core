import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/recent_searches_store.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/search/search_screen.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/ui/widgets/unified_server_picker.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/multi_server_fakes.dart';
import '../../unified_ui_fakes.dart';

// The search screen renders inside the navigation chrome, which needs these.
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
  bool get calendarAvailable => false;

  @override
  bool get smartSearchEnabled => false;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;

  @override
  String? get activeServerId => 'a';
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

class _FakeServerMessages extends ChangeNotifier
    implements ServerMessagesService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Client extends Mock implements MediaServerClient {}

class _Images extends Mock implements ImageApi {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _ItemsApi extends Fake implements ItemsApi {
  _ItemsApi(this.items);

  final List<Map<String, dynamic>> items;

  /// The id of each item whose details were requested.
  final requestedItemIds = <String>[];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems) {
      return Future.value(<String, dynamic>{'Items': items});
    }
    if (invocation.memberName == #getItem) {
      final id = invocation.positionalArguments.first as String;
      requestedItemIds.add(id);
      return Future.value(<String, dynamic>{'Id': id, 'Type': 'Movie'});
    }
    return Future.value(const <String, dynamic>{'Items': []});
  }
}

void main() {
  late UserPreferences prefs;
  late Map<String, _ItemsApi> itemsApis;
  late Map<String, _UserLibraryApi> libraries;
  late GoRouter router;
  OfflineDatabase? db;
  UnifiedCatalogService? catalog;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await turnOnMergedLibraries(prefs);

    // Altovar and an episode are on both servers, Hodrimel and Rusquin on one
    // server each.
    final found = {
      'a': [
        catalogMovie('a1', 'Altovar', tmdb: '1001'),
        catalogMovie('a2', 'Hodrimel', tmdb: '1002'),
        catalogMovie('a3', 'Pivendo', type: 'Episode', tmdb: '7'),
      ],
      'b': [
        catalogMovie('b1', 'Altovar', tmdb: '1001'),
        catalogMovie('b2', 'Rusquin', tmdb: '1007'),
        catalogMovie('b3', 'Pivendo', type: 'Episode', tmdb: '7'),
      ],
    };
    final clients = <String, _Client>{};
    itemsApis = {};
    libraries = {};
    for (final id in ['a', 'b']) {
      final client = _Client();
      final library = _UserLibraryApi();
      when(() => library.markPlayed(any())).thenAnswer((_) async {});
      when(() => client.itemsApi)
          .thenReturn(itemsApis[id] = _ItemsApi(found[id]!));
      when(() => client.userLibraryApi).thenReturn(libraries[id] = library);
      when(() => client.imageApi).thenReturn(_Images());
      when(() => client.gamesApi).thenReturn(null);
      when(() => client.baseUrl).thenReturn('http://$id.test');
      when(() => client.serverType).thenReturn(ServerType.jellyfin);
      clients[id] = client;
    }
    final factory = _Factory();
    when(
      () => factory.getClientIfExists(any()),
    ).thenAnswer((invocation) => clients[invocation.positionalArguments.first]);
    registerFallbackValue(clients['a']!);
    when(() => factory.serverIdOf(any())).thenReturn('a');
    when(() => factory.clientForServerOrActive(any())).thenAnswer(
      (invocation) =>
          clients[invocation.positionalArguments.first] ?? clients['a']!,
    );
    final sessions = [
      for (final id in ['a', 'b'])
        fakeSession(id, client: clients[id]!),
    ];

    final session = _FakeSessionRepository();
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<UserRepository>(_FakeUserRepository())
      ..registerSingleton<UserViewsRepository>(_FakeUserViewsRepository())
      ..registerSingleton<PluginSyncService>(_FakePluginSyncService())
      ..registerSingleton<SessionRepository>(session)
      ..registerSingleton<SeerrPreferences>(SeerrPreferences(store, session))
      ..registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry())
      ..registerSingleton<PlaybackManager>(_FakePlaybackManager())
      ..registerSingleton<MediaServerClientFactory>(factory)
      ..registerSingleton<ServerMessagesService>(_FakeServerMessages())
      ..registerSingleton<MediaServerClient>(clients['a']!)
      ..registerSingleton<ItemMutationRepository>(
        ItemMutationRepository(clients['a']!),
      )
      ..registerSingleton<MultiServerRepository>(
        FakeMultiServerRepository(sessions),
      )
      ..registerSingleton<SearchRepository>(SearchRepository(clients['a']!))
      ..registerSingleton<RecentSearchesStore>(RecentSearchesStore(store));
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);

    router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => const SearchScreen(initialQuery: 'a'),
        ),
      ],
      // Stands in for the detail screen, and shows where the card led.
      errorBuilder: (_, state) => Scaffold(body: Text('opened ${state.uri}')),
    );
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    userDataSync.reset();
    catalog?.dispose();
    catalog = null;
    await db?.close();
    db = null;
    await GetIt.instance.reset();
  });

  // The TV field's cursor keeps blinking, so the screen never settles there.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 3; i++) {
      await tester.pump(const Duration(seconds: 1));
    }
  }

  Future<void> open(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await settle(tester);
  }

  List<String> serverNames(WidgetTester tester, String title) => [
    for (final text in tester.widgetList<Text>(
      find.descendant(
        of: cardFinder(title),
        matching: find.textContaining('Server '),
      ),
    ))
      text.data!,
  ];

  testWidgets('a movie both servers hold is one card with a server count '
      'badge', (tester) async {
    await open(tester);

    expect(cardTitles(tester), [
      'Altovar',
      'Hodrimel',
      'Rusquin',
      'Pivendo',
      'Pivendo',
    ]);
    expect(
      find.descendant(
        of: cardFinder('Altovar'),
        matching: find.byType(UnifiedServerCountBadge),
      ),
      findsOneWidget,
    );
    expect(
      tester
          .widget<UnifiedServerCountBadge>(find.byType(UnifiedServerCountBadge))
          .count,
      2,
    );
    // The count stands in for the name of the one server it is shown from.
    expect(serverNames(tester, 'Altovar'), isEmpty);
    expect(serverNames(tester, 'Hodrimel'), ['Server a']);
    expect(serverNames(tester, 'Rusquin'), ['Server b']);
    expect(serverNames(tester, 'Pivendo'), ['Server a', 'Server b']);
    expect(tester.takeException(), isNull);
  });

  testWidgets('with merged libraries off, each server has its own card', (
    tester,
  ) async {
    await prefs.set(UserPreferences.mergeLibrariesByType, false);
    await open(tester);

    expect(cardTitles(tester), [
      'Altovar',
      'Altovar',
      'Hodrimel',
      'Rusquin',
      'Pivendo',
      'Pivendo',
    ]);
    expect(find.byType(UnifiedServerCountBadge), findsNothing);
    expect(serverNames(tester, 'Altovar'), ['Server a', 'Server b']);

    await tester.tap(cardFinder('Altovar').last);
    await tester.pumpAndSettle();
    expect(find.text('Select Server'), findsNothing);
    expect(find.textContaining('opened /item/b1'), findsOneWidget);
  });

  testWidgets('with multi-server libraries off, only this server is searched', (
    tester,
  ) async {
    await prefs.set(UserPreferences.enableMultiServerLibraries, false);
    await open(tester);

    expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Pivendo']);
    expect(find.byType(UnifiedServerCountBadge), findsNothing);
    expect(find.textContaining('Server '), findsNothing);
  });

  testWidgets('a tap on a shared movie opens the server picker, then opens '
      'the copy on the server chosen', (tester) async {
    await open(tester);

    await tester.tap(cardFinder('Altovar'));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsOneWidget);
    expect(find.textContaining('opened'), findsNothing);
    expect(itemsApis['a']!.requestedItemIds, ['a1']);
    expect(itemsApis['b']!.requestedItemIds, ['b1']);

    await tester.tap(inPicker('Server b'));
    await tester.pumpAndSettle();

    expect(find.textContaining('opened /item/b1'), findsOneWidget);
    expect(find.textContaining('serverId=b'), findsOneWidget);
  });

  testWidgets('a shared movie is one card on the Movies tab too', (
    tester,
  ) async {
    await open(tester);

    await tester.tap(find.text('Movies: 3'));
    await tester.pumpAndSettle();
    expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);
    expect(find.byType(UnifiedServerCountBadge), findsOneWidget);

    await tester.tap(cardFinder('Altovar'));
    await tester.pumpAndSettle();
    await tester.tap(inPicker('Server a'));
    await tester.pumpAndSettle();

    expect(find.textContaining('opened /item/a1'), findsOneWidget);
    expect(find.textContaining('serverId=a'), findsOneWidget);
  });

  testWidgets('a movie on one server opens straight away', (tester) async {
    await open(tester);

    await tester.tap(cardFinder('Rusquin'));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsNothing);
    expect(find.textContaining('opened /item/b2'), findsOneWidget);
    expect(find.textContaining('serverId=b'), findsOneWidget);
    expect(itemsApis['b']!.requestedItemIds, isEmpty);
  });

  testWidgets('an episode both servers hold opens from its own card', (
    tester,
  ) async {
    await open(tester);

    await tester.tap(cardFinder('Pivendo').last);
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsNothing);
    expect(find.textContaining('opened /item/b3'), findsOneWidget);
  });

  group('on a TV', () {
    FocusNode nodeOf(WidgetTester tester, String title) =>
        Focus.of(tester.element(find.text(title).first));

    bool pickerFocusOn(WidgetTester tester, String server) =>
        Focus.of(tester.element(inPicker(server))).hasFocus;

    testWidgets('select on a shared movie opens the server picker with focus '
        'on the first server, and opens the one chosen', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester);
      nodeOf(tester, 'Altovar').requestFocus();
      await settle(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await settle(tester);

      expect(find.text('Select Server'), findsOneWidget);
      expect(pickerFocusOn(tester, 'Server a'), isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await settle(tester);
      expect(pickerFocusOn(tester, 'Server b'), isTrue);
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await settle(tester);

      expect(find.textContaining('opened /item/b1'), findsOneWidget);
    });

    testWidgets('backing out of the server picker puts focus back on the '
        'card', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester);
      final card = nodeOf(tester, 'Altovar')..requestFocus();
      await settle(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await settle(tester);
      expect(find.text('Select Server'), findsOneWidget);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await settle(tester);

      expect(find.text('Select Server'), findsNothing);
      expect(find.textContaining('opened'), findsNothing);
      expect(card.hasFocus, isTrue);
    });

    testWidgets('the play key on a shared movie opens the server picker, '
        'then plays from the server chosen', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester);
      nodeOf(tester, 'Altovar').requestFocus();
      await settle(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.mediaPlay);
      await settle(tester);

      expect(find.text('Select Server'), findsOneWidget);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await settle(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await settle(tester);

      expect(find.textContaining('opened /item/b1'), findsOneWidget);
      expect(find.textContaining('autoPlay=true'), findsOneWidget);
    });

    testWidgets('the play key on a movie on one server plays it straight '
        'away', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await open(tester);
      nodeOf(tester, 'Hodrimel').requestFocus();
      await settle(tester);

      await tester.sendKeyEvent(LogicalKeyboardKey.mediaPlay);
      await settle(tester);

      expect(find.text('Select Server'), findsNothing);
      expect(find.textContaining('opened /item/a2'), findsOneWidget);
      expect(find.textContaining('autoPlay=true'), findsOneWidget);
    });
  });

  // What each menu action does to a shared title is covered in
  // context_action_unified_test.dart. This checks that a search card hands
  // its menu every copy.
  testWidgets('the menu of a shared movie marks it watched on every server, '
      'under its own id', (tester) async {
    await open(tester);
    await tester.longPress(cardFinder('Altovar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mark as Watched'));
    await tester.pumpAndSettle();

    verify(() => libraries['a']!.markPlayed('a1')).called(1);
    verify(() => libraries['b']!.markPlayed('b1')).called(1);
  });

  group('with the merged library\'s stored catalog', () {
    /// The stored catalog holds Hodrimel on server b as Chirond, which b's
    /// search did not answer with.
    Future<void> openWithStoredCatalog(WidgetTester tester) async {
      await tester.runAsync(() async {
        final database = db = OfflineDatabase(
          DatabaseConnection(NativeDatabase.memory()),
        );
        await seedCatalog(database, 'a', [
          catalogMovie('a2', 'Hodrimel', tmdb: '1002'),
        ], markFullyRead: false);
        await seedCatalog(database, 'b', [
          catalogMovie('b7', 'Chirond', tmdb: '1002'),
          catalogMovie('b2', 'Rusquin'),
        ], markFullyRead: false);
        final service = catalog = UnifiedCatalogService(
          database: database,
          loadSessions: () =>
              GetIt.instance<MultiServerRepository>().getLoggedInServers(),
          activeServerId: () => 'a',
        );
        GetIt.instance.registerSingleton<UnifiedCatalogService>(service);
      });
      await open(tester);
    }

    Finder serverCountBadge(String title) => find.descendant(
      of: cardFinder(title),
      matching: find.byType(UnifiedServerCountBadge),
    );

    testWidgets('a movie only one server\'s search found shows the count of '
        'every server holding it, and opens the server picker', (tester) async {
      await openWithStoredCatalog(tester);

      expect(cardTitles(tester), [
        'Altovar',
        'Hodrimel',
        'Rusquin',
        'Pivendo',
        'Pivendo',
      ]);
      expect(
        tester
            .widget<UnifiedServerCountBadge>(serverCountBadge('Hodrimel'))
            .count,
        2,
      );
      expect(serverNames(tester, 'Hodrimel'), isEmpty);
      expect(serverCountBadge('Rusquin'), findsNothing);
      expect(serverNames(tester, 'Rusquin'), ['Server b']);

      await tester.tap(cardFinder('Hodrimel'));
      await tester.pumpAndSettle();

      expect(find.text('Select Server'), findsOneWidget);
      expect(inPicker('Server a'), findsOneWidget);

      await tester.tap(inPicker('Server b'));
      await tester.pumpAndSettle();

      expect(find.textContaining('opened /item/b7'), findsOneWidget);
      expect(find.textContaining('serverId=b'), findsOneWidget);
    });

    testWidgets('with merged libraries off, a movie one server found opens '
        'from that server alone', (tester) async {
      await prefs.set(UserPreferences.mergeLibrariesByType, false);
      await openWithStoredCatalog(tester);

      expect(find.byType(UnifiedServerCountBadge), findsNothing);
      expect(serverNames(tester, 'Hodrimel'), ['Server a']);

      await tester.tap(cardFinder('Hodrimel'));
      await tester.pumpAndSettle();

      expect(find.text('Select Server'), findsNothing);
      expect(find.textContaining('opened /item/a2'), findsOneWidget);
    });
  });
}
