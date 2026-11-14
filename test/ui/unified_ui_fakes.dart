import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/library_browse_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/services/unified_catalog_fakes.dart';

export '../data/services/unified_catalog_fakes.dart';

class MockMediaServerClient extends Mock implements MediaServerClient {}

class MockItemsApi extends Mock implements ItemsApi {}

class MockImageApi extends Mock implements ImageApi {}

class MockClientFactory extends Mock implements MediaServerClientFactory {}

class _MdbList extends Mock implements MdbListRepository {}

class _Backdrops extends Mock implements BackgroundService {}

class _MultiServer extends Mock implements MultiServerRepository {}

class _Session extends Mock implements SessionRepository {}

class _Item extends Fake implements AggregatedItem {}

/// Pumps frames until [done] holds, giving real-time work (the database, the
/// pretend servers) a turn between them. Fails after [maxTurns].
Future<void> pumpUntil(
  WidgetTester tester,
  bool Function() done, {
  int maxTurns = 200,
  String? reason,
}) async {
  for (var turn = 0; turn < maxTurns; turn++) {
    if (done()) return;
    await pumpTurns(tester, 1);
  }
  if (done()) return;
  fail(
    'Still waiting after $maxTurns turns${reason == null ? '' : ': $reason'}',
  );
}

/// For checking that nothing more happens, with no condition to wait on.
Future<void> pumpTurns(WidgetTester tester, [int turns = 5]) async {
  for (var turn = 0; turn < turns; turn++) {
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump(const Duration(milliseconds: 100));
  }
}

List<String?> cardTitles(WidgetTester tester) => tester
    .widgetList<MediaCard>(find.byType(MediaCard))
    .map((card) => card.title)
    .toList();

/// Every card showing [title].
Finder cardFinder(String title) => find.byWidgetPredicate(
  (widget) => widget is MediaCard && widget.title == title,
);

/// [text] inside the open dialog, which for these tests is the server picker.
Finder inPicker(String text) =>
    find.descendant(of: find.byType(Dialog), matching: find.text(text));

/// An in-memory catalog over [sessions], signed in to server a. Its clock
/// stands at [unifiedTestNow], so nothing [seedCatalog] stores is stale.
class UnifiedBrowseHarness {
  UnifiedBrowseHarness._(this.prefs, this.db, this.catalog);

  final UserPreferences prefs;
  final OfflineDatabase db;
  final UnifiedCatalogService catalog;

  /// [activeClient] is the one a single server's library browses with.
  static Future<UnifiedBrowseHarness> setUp({
    required Future<List<ServerUserSession>> Function() sessions,
    required MediaServerClient? Function(String serverId) clientFor,
    required MediaServerClient activeClient,
  }) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    registerFallbackValue(BlurContext.browsing);
    registerFallbackValue(_Item());

    final factory = MockClientFactory();
    when(() => factory.clientForServerOrActive(any())).thenReturn(activeClient);
    when(() => factory.getClientIfExists(any())).thenAnswer(
      (invocation) => clientFor(invocation.positionalArguments.first as String),
    );
    final backdrops = _Backdrops();
    when(() => backdrops.backdropUrlsFor(any())).thenReturn(const []);
    when(() => backdrops.backgroundStream)
        .thenAnswer((_) => const Stream.empty());
    when(() => backdrops.currentUrl).thenReturn(null);
    final multiServer = _MultiServer();
    when(() => multiServer.getImageApiForServer(any()))
        .thenReturn(MockImageApi());
    final session = _Session();
    when(() => session.activeServerId).thenReturn('a');

    final db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    final catalog = UnifiedCatalogService(
      database: db,
      loadSessions: sessions,
      activeServerId: () => 'a',
      now: () => unifiedTestNow,
      retryDelay: Duration.zero,
    );

    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(prefs)
      ..registerSingleton<MediaServerClientFactory>(factory)
      ..registerSingleton<MdbListRepository>(_MdbList())
      ..registerSingleton<BackgroundService>(backdrops)
      ..registerSingleton<MultiServerRepository>(multiServer)
      ..registerSingleton<SessionRepository>(session)
      ..registerSingleton<UnifiedCatalogService>(catalog);
    return UnifiedBrowseHarness._(prefs, db, catalog);
  }

  Future<void> tearDown() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    catalog.dispose();
    await db.close();
    await GetIt.instance.reset();
  }

  static Widget library({bool unified = true}) => unified
      ? const LibraryBrowseScreen(
          libraryId: '',
          includeItemTypes: ['Movie'],
          unifiedKind: UnifiedLibraryKind.movies,
          unifiedTitle: 'Movies',
        )
      : const LibraryBrowseScreen(libraryId: 'lib');

  /// Waits for [until], by default the end of the catalog's first read. A
  /// pushed route shows as `opened <uri>`, standing in for the detail screen.
  Future<void> pumpLibrary(
    WidgetTester tester, {
    bool unified = true,
    Widget? screen,
    Size size = const Size(1600, 1000),
    bool Function()? until,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => screen ?? library(unified: unified),
        ),
      ],
      errorBuilder: (_, state) => Scaffold(body: Text('opened ${state.uri}')),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await pumpUntil(
      tester,
      until ??
          () =>
              find.byType(MediaCard).evaluate().isNotEmpty ||
              find.text('No items found').evaluate().isNotEmpty,
      reason: 'the library never finished loading',
    );
  }
}
