import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/admin/admin_analytics_items_screen.dart';
import 'package:moonfin/ui/screens/admin/admin_content_analytics_screen.dart';
import 'package:moonfin/ui/screens/admin/admin_draft.dart';
import 'package:moonfin/ui/screens/admin/providers/admin_media_analytics_provider.dart';
import 'package:moonfin/ui/screens/admin/providers/admin_user_providers.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _FakeLibraryApi extends Fake implements AdminLibraryApi {
  @override
  Future<List<VirtualFolderInfo>> getVirtualFolders() async => const [
    VirtualFolderInfo(name: 'Films', collectionType: 'movies', itemId: 'm1'),
    VirtualFolderInfo(name: 'Camera', collectionType: 'homevideos', itemId: 'h1'),
  ];
}

/// Records the named arguments of every getItems call.
class _FakeItemsApi extends Fake implements ItemsApi {
  final calls = <Map<Symbol, dynamic>>[];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName != #getItems) {
      return super.noSuchMethod(invocation);
    }
    calls.add(invocation.namedArguments);
    final fields = invocation.namedArguments[#fields] as String?;
    if (fields == null) {
      return Future.value(<String, dynamic>{'Items': [], 'TotalRecordCount': 2});
    }
    return Future.value(<String, dynamic>{
      'Items': [
        {
          'Id': 'film1',
          'Name': 'Night Film',
          'Type': 'Movie',
          'Genres': ['Drama'],
          'ProductionYear': 2021,
          'MediaSources': [
            {
              'Container': 'mkv',
              'MediaStreams': [
                {'Type': 'Video', 'Codec': 'hevc'},
                {'Type': 'Audio', 'Codec': 'eac3'},
              ],
            },
          ],
        },
      ],
      'TotalRecordCount': 1,
    });
  }
}

/// Pages through big libraries slowly and records how many reads overlap.
class _PagingItemsApi extends Fake implements ItemsApi {
  _PagingItemsApi(this.totals, {this.failAt = const {}});

  final Map<String, int> totals;

  /// Pages that throw, by library and start index.
  final Set<(String, int)> failAt;
  final limits = <int>{};
  final starts = <String, List<int>>{};
  var inFlight = 0;
  var maxInFlight = 0;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName != #getItems) {
      return super.noSuchMethod(invocation);
    }
    final args = invocation.namedArguments;
    final parentId = args[#parentId] as String;
    final start = args[#startIndex] as int;
    final limit = args[#limit] as int;
    final total = totals[parentId]!;
    return () async {
      inFlight++;
      maxInFlight = inFlight > maxInFlight ? inFlight : maxInFlight;
      limits.add(limit);
      (starts[parentId] ??= []).add(start);
      await Future<void>.delayed(const Duration(milliseconds: 2));
      inFlight--;
      if (failAt.contains((parentId, start))) {
        throw Exception('page $start of $parentId failed');
      }
      final end = start + limit < total ? start + limit : total;
      return <String, dynamic>{
        'Items': [
          for (var i = start; i < end; i++)
            {'Id': '$parentId-$i', 'Name': 'Item $i', 'Type': 'Episode'},
        ],
        'TotalRecordCount': total,
      };
    }();
  }
}

void main() {
  late _FakeItemsApi items;
  late _MockMediaServerClient client;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    items = _FakeItemsApi();
    client = _MockMediaServerClient();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('u1');
    when(() => client.adminLibraryApi).thenReturn(_FakeLibraryApi());
    when(() => client.itemsApi).thenReturn(items);
    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    AdminDraft.active.value = null;
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: AdminContentAnalyticsScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  List<String> typesOf(Map<Symbol, dynamic> call) =>
      (call[#includeItemTypes] as List<String>?) ?? const [];

  testWidgets('insights ask GET /Items with real ItemFields only', (
    tester,
  ) async {
    await pump(tester);

    final insights = items.calls.where((c) => c[#fields] != null).toList();
    expect(insights, hasLength(1));
    expect(insights.single[#serverWide], isTrue);
    expect(insights.single[#parentId], 'm1');
    expect(insights.single[#fields], 'Genres,MediaSources');
    expect(find.text('Films'), findsWidgets);
  });

  testWidgets('Emby is asked for the year and rating it leaves out', (
    tester,
  ) async {
    when(() => client.serverType).thenReturn(ServerType.emby);
    await pump(tester);

    final insights = items.calls.where((c) => c[#fields] != null);
    expect(
      insights.single[#fields],
      'Genres,MediaSources,ProductionYear,OfficialRating',
    );
  });

  testWidgets('a tapped codec lists its items, which open the editor', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) =>
              const Scaffold(body: AdminContentAnalyticsScreen()),
        ),
        GoRoute(
          path: Destinations.adminAnalyticsItems,
          builder: (_, state) => Scaffold(
            body: AdminAnalyticsItemsScreen(
              query: AdminAnalyticsQuery.fromUri(state.uri),
            ),
          ),
        ),
        GoRoute(
          path: Destinations.adminMetadataEdit,
          builder: (_, state) =>
              Text('editing ${state.pathParameters['itemId']}'),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('HEVC'));
    await tester.pumpAndSettle();
    expect(find.byType(AdminAnalyticsItemsScreen), findsOneWidget);
    expect(find.text('Night Film'), findsOneWidget);
    // The library's items were read once, for the charts.
    expect(items.calls.where((c) => c[#fields] != null), hasLength(1));

    await tester.tap(find.text('Night Film'));
    await tester.pumpAndSettle();
    expect(find.text('editing film1'), findsOneWidget);
  });

  test('a query survives the trip through its location', () {
    const query = AdminAnalyticsQuery(
      libraryId: 'm1',
      dimension: AdminAnalyticsDimension.year,
      values: ['1984', '1987'],
      title: '1980s',
    );
    expect(AdminAnalyticsQuery.fromUri(Uri.parse(query.location)), query);
    const item = AdminAnalyticsItem(id: 'a', name: 'A', type: 'Movie', year: 1987);
    expect(query.matches(item), isTrue);
    expect(
      query.matches(const AdminAnalyticsItem(id: 'b', name: 'B', type: 'Movie', year: 1990)),
      isFalse,
    );
  });

  test('a category groups episodes by series and keeps their order', () async {
    final container = ProviderContainer(
      overrides: [
        adminLibrariesProvider.overrideWith(
          (ref) async => const [
            VirtualFolderInfo(
              name: 'Shows',
              collectionType: 'tvshows',
              itemId: 't1',
            ),
          ],
        ),
        adminLibraryItemsProvider.overrideWith(
          (ref, library) async => const [
            AdminAnalyticsItem(id: 'b2', name: 'Pilot', type: 'Episode', parentName: 'Bravo', genres: ['Drama']),
            AdminAnalyticsItem(id: 'a1', name: 'Zebra', type: 'Episode', parentName: 'Alpha', genres: ['Drama']),
            AdminAnalyticsItem(id: 'b3', name: 'Another', type: 'Episode', parentName: 'Bravo', genres: ['Drama']),
            AdminAnalyticsItem(id: 's1', name: 'Alpha', type: 'Series', genres: ['Drama']),
          ],
        ),
      ],
    );
    addTearDown(container.dispose);
    const query = AdminAnalyticsQuery(
      dimension: AdminAnalyticsDimension.genre,
      values: ['drama'],
      title: 'Drama',
    );
    container.listen(adminAnalyticsItemsProvider(query), (_, _) {});

    final items = await container.read(adminAnalyticsItemsProvider(query).future);
    expect(items.map((item) => item.id), ['s1', 'a1', 'b2', 'b3']);
  });

  test('big libraries read small pages, a few at a time across all of them', () async {
    final paging = _PagingItemsApi({'t1': 1300, 't2': 950});
    when(() => client.itemsApi).thenReturn(paging);
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final lists = await Future.wait([
      for (final id in ['t1', 't2'])
        container.read(
          adminLibraryItemsProvider((itemId: id, collectionType: 'tvshows')).future,
        ),
    ]);

    expect(paging.maxInFlight, 4);
    expect(paging.limits, {300});
    expect(paging.starts['t1'], unorderedEquals([0, 300, 600, 900, 1200]));
    expect(paging.starts['t2'], unorderedEquals([0, 300, 600, 900]));
    expect(lists[0].map((item) => item.id), [for (var i = 0; i < 1300; i++) 't1-$i']);
    expect(lists[1], hasLength(950));
  });

  test('a failed page stops the library from asking for more', () async {
    final paging = _PagingItemsApi({'t1': 3000}, failAt: {('t1', 300)});
    when(() => client.itemsApi).thenReturn(paging);
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await expectLater(
      container.read(
        adminLibraryItemsProvider((itemId: 't1', collectionType: 'tvshows')).future,
      ),
      throwsException,
    );
    // The first page, then the batch holding the failure, and nothing after.
    expect(paging.starts['t1'], unorderedEquals([0, 300, 600, 900, 1200]));
  });

  testWidgets('home videos count videos and photos, collections need no /Items', (
    tester,
  ) async {
    await pump(tester);

    final camera = items.calls
        .where((c) => c[#parentId] == 'h1')
        .map(typesOf)
        .toList();
    expect(camera, unorderedEquals([['Video'], ['Photo']]));
    // Every count is asked per library.
    final serverWide = items.calls.where((c) => c[#parentId] == null);
    expect(serverWide, isEmpty);
  });
}
