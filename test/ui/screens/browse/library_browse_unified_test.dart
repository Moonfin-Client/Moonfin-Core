import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/poster_badge_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/app_router.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/browse/library_browse_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/unified_server_picker.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

import '../../../data/repositories/multi_server_fakes.dart';
import '../../unified_ui_fakes.dart';

/// Labels the admin put on server a's copy of Altovar, one per bottom corner.
class _Badges extends Fake implements PosterBadgeRepository {
  static const _sharedMovieBadges = [
    PosterBadge(
      label: '4K',
      color: '#2563EB',
      corner: PosterBadgeCorner.bottomLeft,
    ),
    PosterBadge(
      label: 'HDR',
      color: '#2563EB',
      corner: PosterBadgeCorner.bottomRight,
    ),
  ];

  @override
  final rulesChanged = ValueNotifier<int>(0);

  @override
  int maxPerCorner = 2;

  @override
  List<PosterBadge>? peek(String itemId) =>
      itemId == 'a1' ? _sharedMovieBadges : const [];

  @override
  Future<List<PosterBadge>> getForItem(String itemId) async => peek(itemId)!;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UnifiedBrowseHarness harness;
  late UserPreferences prefs;
  // Per server, so a request can be pinned to the server it went to.
  late Map<String, MockItemsApi> itemsApis;

  setUp(() async {
    final clients = <String, MockMediaServerClient>{};
    itemsApis = {};
    for (final id in ['a', 'b']) {
      final client = MockMediaServerClient();
      final itemsApi = MockItemsApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
      when(() => itemsApi.getItem(any(), fields: any(named: 'fields')))
          .thenAnswer(
            (invocation) async => {
              'Id': invocation.positionalArguments.first,
              'Type': 'Movie',
              'UserData': {'Played': false},
            },
          );
      when(() => client.imageApi).thenReturn(MockImageApi());
      when(() => client.baseUrl).thenReturn('http://$id');
      when(() => client.userId).thenReturn('user');
      when(() => client.serverType).thenReturn(ServerType.jellyfin);
      clients[id] = client;
      itemsApis[id] = itemsApi;
    }
    harness = await UnifiedBrowseHarness.setUp(
      sessions: () async => [
        for (final id in ['a', 'b'])
          fakeSession(id, client: clients[id]!),
      ],
      clientFor: (id) => clients[id],
      activeClient: clients['a']!,
    );
    prefs = harness.prefs;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(() => harness.tearDown());

  /// By default Altovar is on both servers, Hodrimel on a and Rusquin on b.
  Future<void> open(
    WidgetTester tester, {
    List<Map<String, dynamic>>? onA,
    List<Map<String, dynamic>>? onB,
  }) async {
    await tester.runAsync(() async {
      await seedCatalog(
        harness.db,
        'a',
        onA ??
            [
              catalogMovie('a1', 'Altovar', tmdb: '1001'),
              catalogMovie('a2', 'Hodrimel'),
            ],
      );
      await seedCatalog(
        harness.db,
        'b',
        onB ??
            [
              catalogMovie('b1', 'Altovar', tmdb: '1001', played: true),
              catalogMovie('b2', 'Rusquin'),
            ],
      );
      await harness.catalog.ensureLoaded();
    });
    await harness.pumpLibrary(tester);
  }

  MediaCard cardWidget(WidgetTester tester, String title) =>
      tester.widget<MediaCard>(cardFinder(title));

  Finder serverCountBadge(String title) => find.descendant(
    of: cardFinder(title),
    matching: find.byType(UnifiedServerCountBadge),
  );

  Future<void> tapCard(WidgetTester tester, String title) async {
    await tester.tap(cardFinder(title));
    await tester.pumpAndSettle();
  }

  testWidgets('draws one card per title across both servers', (tester) async {
    await open(tester);

    expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Rusquin']);
    expect(cardWidget(tester, 'Altovar').isPlayed, isTrue);
    expect(serverCountBadge('Altovar'), findsOneWidget);
    expect(
      tester.widget<UnifiedServerCountBadge>(serverCountBadge('Altovar')).count,
      2,
    );
    expect(
      find.descendant(
        of: cardFinder('Altovar'),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Semantics && widget.properties.label == 'On 2 servers',
        ),
      ),
      findsOneWidget,
    );
    expect(serverCountBadge('Hodrimel'), findsNothing);
    expect(serverCountBadge('Rusquin'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('only the active server\'s items keep their poster badges', (
    tester,
  ) async {
    await open(tester);

    // Hodrimel is on server a, the one signed in to. Badge lookups never
    // reach server b.
    expect(cardWidget(tester, 'Hodrimel').posterBadgeItemId, 'a2');
    expect(cardWidget(tester, 'Hodrimel').animeMarkerItemId, 'a2');
    expect(cardWidget(tester, 'Hodrimel').recordingItemId, 'a2');
    expect(cardWidget(tester, 'Rusquin').posterBadgeItemId, isNull);
    expect(cardWidget(tester, 'Rusquin').animeMarkerItemId, isNull);
    expect(cardWidget(tester, 'Rusquin').recordingItemId, isNull);
  });

  testWidgets('the server count badge sits clear of a progress bar', (
    tester,
  ) async {
    await open(
      tester,
      onA: [catalogMovie('a1', 'Altovar', tmdb: '1001', percent: 40)],
      onB: [catalogMovie('b1', 'Altovar', tmdb: '1001')],
    );

    expect(cardWidget(tester, 'Altovar').playedPercentage, 40);
    final badge = tester.getRect(serverCountBadge('Altovar'));
    final bar = tester.getRect(
      find.descendant(
        of: cardFinder('Altovar'),
        matching: find.byType(LinearProgressIndicator),
      ),
    );
    expect(badge.overlaps(bar), isFalse);
    expect(badge.bottom, lessThanOrEqualTo(bar.top));
  });

  testWidgets('the server count badge sits clear of the poster badges', (
    tester,
  ) async {
    GetIt.instance.registerSingleton<PosterBadgeRepository>(_Badges());
    await open(
      tester,
      onA: [catalogMovie('a1', 'Altovar', tmdb: '1001', percent: 40)],
      onB: [catalogMovie('b1', 'Altovar', tmdb: '1001')],
    );
    await tester.pump();

    // Server a is the one signed in to, so its copy keeps its poster badges.
    final inCard = cardFinder('Altovar');
    final badge = tester.getRect(serverCountBadge('Altovar'));
    final cornerLabel = tester.getRect(
      find.descendant(of: inCard, matching: find.text('4K')),
    );
    final otherCorner = tester.getRect(
      find.descendant(of: inCard, matching: find.text('HDR')),
    );
    final bar = tester.getRect(
      find.descendant(
        of: inCard,
        matching: find.byType(LinearProgressIndicator),
      ),
    );
    final poster = tester.getRect(inCard);

    expect(badge.overlaps(cornerLabel), isFalse);
    expect(badge.overlaps(otherCorner), isFalse);
    expect(badge.overlaps(bar), isFalse);
    expect(cornerLabel.overlaps(bar), isFalse);
    // The poster badge shares the server count badge's corner and stacks
    // above it.
    expect(cornerLabel.bottom, lessThanOrEqualTo(badge.top));
    expect(poster.contains(badge.topLeft), isTrue);
    expect(poster.contains(cornerLabel.topLeft), isTrue);
  });

  testWidgets('two copies on one server show no server count and still open '
      'the server picker', (tester) async {
    // Server a keeps Altovar twice, as a 4K library beside an HD one would.
    await open(
      tester,
      onA: [
        catalogMovie('a1', 'Altovar', tmdb: '1001'),
        catalogMovie('a3', 'Altovar 4K', tmdb: '1001'),
      ],
      onB: [catalogMovie('b2', 'Rusquin')],
    );

    expect(cardTitles(tester), ['Altovar', 'Rusquin']);
    expect(serverCountBadge('Altovar'), findsNothing);

    await tapCard(tester, 'Altovar');

    expect(find.text('Select Version'), findsOneWidget);
    expect(find.text('Select Server'), findsNothing);
    expect(find.text('Server a'), findsNWidgets(2));
    expect(find.text('Altovar 4K'), findsOneWidget);

    await tester.tap(find.text('Altovar 4K'));
    await tester.pumpAndSettle();
    expect(find.textContaining('opened /item/a3'), findsOneWidget);
  });

  testWidgets('the horizontal grid badges shared titles too', (tester) async {
    await prefs.set(
      UserPreferences.libraryScrollDirection('unified_movies'),
      LibraryScrollDirection.horizontal,
    );
    await open(tester);

    expect(serverCountBadge('Altovar'), findsOneWidget);
    expect(serverCountBadge('Hodrimel'), findsNothing);
    expect(cardWidget(tester, 'Hodrimel').posterBadgeItemId, 'a2');
    expect(cardWidget(tester, 'Rusquin').posterBadgeItemId, isNull);
    expect(cardWidget(tester, 'Rusquin').recordingItemId, isNull);

    await tapCard(tester, 'Altovar');
    expect(find.text('Select Server'), findsOneWidget);
  });

  testWidgets('a title on one server opens straight away', (tester) async {
    await open(tester);

    await tapCard(tester, 'Rusquin');

    expect(find.textContaining('opened /item/b2'), findsOneWidget);
    expect(find.textContaining('serverId=b'), findsOneWidget);
  });

  testWidgets('a shared title opens the server picker, then the copy picked', (
    tester,
  ) async {
    await open(tester);

    await tapCard(tester, 'Altovar');

    expect(find.text('Select Server'), findsOneWidget);
    expect(find.text('Server a'), findsOneWidget);
    expect(find.text('Server b'), findsOneWidget);
    expect(find.textContaining('opened'), findsNothing);
    verify(() => itemsApis['a']!.getItem('a1', fields: any(named: 'fields')))
        .called(1);
    verify(() => itemsApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .called(1);
    verifyNever(
      () => itemsApis['a']!.getItem('b1', fields: any(named: 'fields')),
    );
    verifyNever(
      () => itemsApis['b']!.getItem('a1', fields: any(named: 'fields')),
    );

    await tester.tap(find.text('Server b'));
    await tester.pumpAndSettle();

    expect(find.textContaining('opened /item/b1'), findsOneWidget);
    expect(find.textContaining('serverId=b'), findsOneWidget);
  });

  testWidgets('a copy its server answers 404 for cannot be picked', (
    tester,
  ) async {
    when(() => itemsApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) async => throw httpError(404));
    await open(tester);

    await tapCard(tester, 'Altovar');

    expect(find.text('Unavailable'), findsOneWidget);
    await tester.tap(find.text('Server b'));
    await tester.pumpAndSettle();

    expect(find.text('Select Server'), findsOneWidget);
    expect(find.textContaining('opened'), findsNothing);

    await tester.tap(find.text('Server a'));
    await tester.pumpAndSettle();
    expect(find.textContaining('opened /item/a1'), findsOneWidget);
    expect(find.textContaining('serverId=a'), findsOneWidget);
  });

  testWidgets('a copy whose server answers 500 is marked "Details '
      'unavailable" and can still be picked', (tester) async {
    when(() => itemsApis['b']!.getItem('b1', fields: any(named: 'fields')))
        .thenAnswer((_) async => throw httpError(500));
    await open(tester);

    await tapCard(tester, 'Altovar');

    expect(find.text('Details unavailable'), findsOneWidget);
    expect(find.text('Unavailable'), findsNothing);
    expect(find.text('Watched'), findsOneWidget);

    await tester.tap(find.text('Server b'));
    await tester.pumpAndSettle();
    expect(find.textContaining('opened /item/b1'), findsOneWidget);
  });

  group('the route', () {
    /// The app's own route to a merged library, beside a stand-in for Home.
    Future<void> go(WidgetTester tester, String location) async {
      tester.view.physicalSize = const Size(1600, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final route = appRouter.configuration.routes
          .whereType<GoRoute>()
          .firstWhere(
            (route) => route.path == Destinations.unifiedLibraryBrowse,
          );
      final router = GoRouter(
        initialLocation: location,
        routes: [
          GoRoute(
            path: Destinations.home,
            builder: (_, _) => const Scaffold(body: Text('home')),
          ),
          route,
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
      await pumpUntil(
        tester,
        () =>
            find.text('home').evaluate().isNotEmpty ||
            find.text('No items found').evaluate().isNotEmpty,
      );
    }

    LibraryBrowseScreen screen(WidgetTester tester) =>
        tester.widget(find.byType(LibraryBrowseScreen));

    testWidgets('opens the merged Movies library', (tester) async {
      await turnOnMergedLibraries(prefs);

      await go(tester, Destinations.unifiedLibrary('movies'));

      expect(screen(tester).unifiedKind, UnifiedLibraryKind.movies);
      expect(screen(tester).unifiedTitle, 'Movies');
      expect(screen(tester).includeItemTypes, ['Movie']);
    });

    testWidgets('opens the merged TV Shows library', (tester) async {
      await turnOnMergedLibraries(prefs);

      await go(tester, Destinations.unifiedLibrary('series'));

      expect(screen(tester).unifiedKind, UnifiedLibraryKind.series);
      expect(screen(tester).unifiedTitle, 'TV Shows');
      expect(screen(tester).includeItemTypes, ['Series']);
    });

    for (final (why, kindName, multiServer, merged) in [
      ('a library that does not exist', 'bogus', true, true),
      ('a link that outlived multi-server libraries', 'movies', false, true),
      ('a link that outlived the merge setting', 'movies', true, false),
    ]) {
      testWidgets('sends $why to Home', (tester) async {
        await prefs.set(
          UserPreferences.enableMultiServerLibraries,
          multiServer,
        );
        await prefs.set(UserPreferences.mergeLibrariesByType, merged);

        await go(tester, Destinations.unifiedLibrary(kindName));

        expect(find.text('home'), findsOneWidget);
        expect(find.byType(LibraryBrowseScreen), findsNothing);
      });
    }

    test('the redirect is decided without building a screen', () async {
      await turnOnMergedLibraries(prefs);

      expect(unifiedLibraryRedirect('bogus'), Destinations.home);
      expect(unifiedLibraryRedirect(null), Destinations.home);
      expect(unifiedLibraryRedirect('movies'), isNull);
      expect(unifiedLibraryRedirect('series'), isNull);
    });
  });
}
