import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/app_router.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/browse/all_genres_screen.dart';
import 'package:moonfin/ui/screens/browse/library_browse_screen.dart';
import 'package:moonfin/ui/widgets/genre_grid_card.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/unified_server_picker.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';

import '../../../data/repositories/multi_server_fakes.dart';
import '../../unified_ui_fakes.dart';

/// A title filed under Drama unless [genres] says otherwise.
Map<String, dynamic> _dramaTitle(
  String id,
  String name, {
  String type = 'Movie',
  String? tmdb,
  List<String> genres = const ['Drama'],
}) => catalogMovie(id, name, type: type, tmdb: tmdb, genres: genres);

const _dramaPage = LibraryBrowseScreen(
  libraryId: '',
  genreName: 'Drama',
  unifiedGenreKinds: UnifiedLibraryKind.values,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UnifiedBrowseHarness harness;
  late UserPreferences prefs;
  late Map<String, MockItemsApi> itemsApis;

  /// Altovar is on both servers, and only server b files it under Horror.
  Future<void> seedBoth(WidgetTester tester) => tester.runAsync(() async {
    await seedCatalog(harness.db, 'a', [
      _dramaTitle('a1', 'Altovar', tmdb: '1001'),
      _dramaTitle('a2', 'Hodrimel'),
      _dramaTitle('a3', 'Umbrel', genres: ['Family']),
    ]);
    await seedCatalog(harness.db, 'b', [
      _dramaTitle('b1', 'Altovar', tmdb: '1001', genres: ['drama', 'Horror']),
      _dramaTitle('b2', 'Mivel Dorn', type: 'Series', genres: ['DRAMA']),
      _dramaTitle('b3', 'Ambréval', genres: ['Comédie']),
    ]);
    await harness.catalog.ensureLoaded();
  });

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
    GetIt.instance.registerSingleton<MediaServerClient>(clients['a']!);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(() => harness.tearDown());

  group('the merged genre page', () {
    testWidgets('lists both servers\' titles, a shared one once', (
      tester,
    ) async {
      await seedBoth(tester);

      await harness.pumpLibrary(tester, screen: _dramaPage);

      expect(cardTitles(tester), ['Altovar', 'Hodrimel', 'Mivel Dorn']);
      expect(find.text('Drama'), findsWidgets);
      expect(
        find.descendant(
          of: cardFinder('Altovar'),
          matching: find.byType(UnifiedServerCountBadge),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: cardFinder('Hodrimel'),
          matching: find.byType(UnifiedServerCountBadge),
        ),
        findsNothing,
      );
      expect(find.byTooltip('Refresh'), findsOneWidget);
    });

    testWidgets('a shared title opens the copy on the server picked', (
      tester,
    ) async {
      await seedBoth(tester);
      await harness.pumpLibrary(tester, screen: _dramaPage);

      await tester.tap(cardFinder('Altovar'));
      await tester.pumpAndSettle();
      expect(find.text('Select Server'), findsOneWidget);
      await tester.tap(find.text('Server b'));
      await tester.pumpAndSettle();

      expect(find.textContaining('opened /item/b1'), findsOneWidget);
      expect(find.textContaining('serverId=b'), findsOneWidget);
    });

    testWidgets('a title on one server opens straight away', (tester) async {
      await seedBoth(tester);
      await harness.pumpLibrary(tester, screen: _dramaPage);

      await tester.tap(cardFinder('Mivel Dorn'));
      await tester.pumpAndSettle();

      expect(find.textContaining('opened /item/b2'), findsOneWidget);
    });

    testWidgets('lists a title that only one of its copies files under the '
        'genre', (
      tester,
    ) async {
      await seedBoth(tester);

      await harness.pumpLibrary(
        tester,
        screen: const LibraryBrowseScreen(
          libraryId: '',
          genreName: 'Horror',
          unifiedGenreKinds: UnifiedLibraryKind.values,
        ),
      );

      expect(cardTitles(tester), ['Altovar']);
    });

    testWidgets('fits a phone', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
      await seedBoth(tester);

      await harness.pumpLibrary(
        tester,
        screen: _dramaPage,
        size: const Size(400, 800),
      );

      expect(
        cardTitles(tester),
        containsAll(['Altovar', 'Hodrimel', 'Mivel Dorn']),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('on TV, Down moves the focus from the header to the first '
        'card', (tester) async {
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await seedBoth(tester);
      await harness.pumpLibrary(tester, screen: _dramaPage);
      expect(
        FocusManager.instance.primaryFocus?.debugLabel,
        'library_home_button',
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump(const Duration(milliseconds: 200));

      final focus = FocusManager.instance.primaryFocus;
      expect(
        tester
            .widgetList<MediaCard>(find.byType(MediaCard))
            .where((card) => identical(card.focusNode, focus))
            .map((card) => card.title),
        ['Altovar'],
      );
      expect(tester.takeException(), isNull);
    });
  });

  group('the route', () {
    Future<void> go(WidgetTester tester, String location) async {
      tester.view.physicalSize = const Size(1600, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final routes = appRouter.configuration.routes.whereType<GoRoute>();
      final router = GoRouter(
        initialLocation: location,
        routes: [
          GoRoute(
            path: Destinations.home,
            builder: (_, _) => const Scaffold(body: Text('home')),
          ),
          for (final path in [
            Destinations.unifiedGenreBrowse,
            Destinations.genreBrowse,
          ])
            routes.firstWhere((route) => route.path == path),
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
      await pumpTurns(tester);
    }

    LibraryBrowseScreen screen(WidgetTester tester) =>
        tester.widget(find.byType(LibraryBrowseScreen));

    testWidgets('opens a genre across movies and series', (tester) async {
      await turnOnMergedLibraries(prefs);
      await seedBoth(tester);

      await go(tester, Destinations.unifiedGenre('Comédie'));
      await pumpUntil(
        tester,
        () => find.byType(MediaCard).evaluate().isNotEmpty,
      );

      expect(screen(tester).genreName, 'Comédie');
      expect(screen(tester).genreId, isNull);
      expect(screen(tester).unifiedGenreKinds, UnifiedLibraryKind.values);
      expect(screen(tester).includeItemTypes, isNull);
      expect(cardTitles(tester), ['Ambréval']);
    });

    testWidgets('opens a genre of one kind', (tester) async {
      await turnOnMergedLibraries(prefs);
      await seedBoth(tester);

      await go(tester, Destinations.unifiedGenre('Drama', kindName: 'series'));
      await pumpUntil(
        tester,
        () => find.byType(MediaCard).evaluate().isNotEmpty,
      );

      expect(screen(tester).unifiedGenreKinds, [UnifiedLibraryKind.series]);
      expect(screen(tester).includeItemTypes, ['Series']);
      expect(cardTitles(tester), ['Mivel Dorn']);
    });

    for (final (why, kindName, merged) in [
      ('a link that outlived the merge setting', null, false),
      ('a kind that does not exist', 'music', true),
    ]) {
      testWidgets('sends $why to Home', (tester) async {
        await prefs.set(UserPreferences.enableMultiServerLibraries, true);
        await prefs.set(UserPreferences.mergeLibrariesByType, merged);

        await go(
          tester,
          Destinations.unifiedGenre('Drama', kindName: kindName),
        );

        expect(find.text('home'), findsOneWidget);
        expect(find.byType(LibraryBrowseScreen), findsNothing);
      });
    }

    test('the redirect is decided without building a screen', () async {
      expect(unifiedGenreRedirect(null), Destinations.home);
      await turnOnMergedLibraries(prefs);
      expect(unifiedGenreRedirect(null), isNull);
      expect(unifiedGenreRedirect('movies'), isNull);
      expect(unifiedGenreRedirect('bogus'), Destinations.home);
    });

    for (final includeType in [null, 'MusicAlbum', 'Book']) {
      testWidgets('a server\'s own genre link still opens that server\'s '
          'genre ($includeType)', (tester) async {
        await turnOnMergedLibraries(prefs);

        await go(
          tester,
          Destinations.genre(
            'Rock',
            genreId: 'g1',
            includeType: includeType,
            serverId: 'b',
          ),
        );

        expect(screen(tester).genreId, 'g1');
        expect(screen(tester).serverId, 'b');
        expect(screen(tester).unifiedGenreKinds, isNull);
        expect(
          screen(tester).includeItemTypes,
          includeType == null ? isNull : [includeType],
        );
      });
    }
  });

  group('all genres', () {
    Future<void> pumpGenres(WidgetTester tester, {Finder? until}) async {
      tester.view.physicalSize = const Size(1600, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final router = GoRouter(
        routes: [
          GoRoute(path: '/', builder: (_, _) => const AllGenresScreen()),
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
        () => (until ?? find.byType(GenreGridCard)).evaluate().isNotEmpty,
        reason: 'the genres never loaded',
      );
    }

    List<String> tiles(WidgetTester tester) => [
      for (final card in tester.widgetList<GenreGridCard>(
        find.byType(GenreGridCard),
      ))
        '${card.genre.name} ${card.genre.itemCount}',
    ];

    void mergedServers(Set<String> ids) => when(
      () => GetIt.instance<MultiServerRepository>().mergedGenreServerIds(),
    ).thenAnswer((_) async => ids);

    void stubOwnGenres() {
      when(
        () => itemsApis['a']!.getGenres(
          sortBy: any(named: 'sortBy'),
          sortOrder: any(named: 'sortOrder'),
          recursive: any(named: 'recursive'),
          startIndex: any(named: 'startIndex'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          includeItemTypes: any(named: 'includeItemTypes'),
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'g1', 'Name': 'Drama', 'MovieCount': 2},
          ],
          'TotalRecordCount': 1,
        },
      );
    }

    testWidgets('shows one tile per genre name across the merged servers', (
      tester,
    ) async {
      mergedServers({'a', 'b'});
      await seedBoth(tester);

      await pumpGenres(tester);

      expect(tiles(tester), ['Comédie 1', 'Drama 3', 'Family 1', 'Horror 1']);

      await tester.tap(find.byType(GenreGridCard).at(1));
      await tester.pumpAndSettle();
      expect(find.text('opened /unified-genre/Drama'), findsOneWidget);
    });

    group('with a rating blocked', () {
      /// Altovar is rated R on server b only, and Umbrel, the one Family
      /// title, on its only copy.
      Future<void> seedRated(WidgetTester tester) => tester.runAsync(() async {
        await seedCatalog(harness.db, 'a', [
          _dramaTitle('a1', 'Altovar', tmdb: '1001'),
          _dramaTitle('a2', 'Hodrimel'),
          {
            ..._dramaTitle('a3', 'Umbrel', genres: ['Family', 'Drama']),
            'OfficialRating': 'R',
            'ImageTags': {'Primary': 'tag-a3'},
          },
        ]);
        await seedCatalog(harness.db, 'b', [
          {
            ..._dramaTitle('b1', 'Altovar', tmdb: '1001', genres: ['Horror']),
            'OfficialRating': 'R',
          },
        ]);
        await harness.catalog.ensureLoaded();
      });

      setUp(() {
        final imageApi = MockImageApi();
        when(
          () => imageApi.getPrimaryImageUrl(
            any(),
            tag: any(named: 'tag'),
            maxWidth: any(named: 'maxWidth'),
          ),
        ).thenAnswer(
          (invocation) => 'art-of-${invocation.positionalArguments.first}',
        );
        when(
          () => GetIt.instance<MultiServerRepository>().getImageApiForServer(
            any(),
          ),
        ).thenReturn(imageApi);
      });

      testWidgets('a title with a blocked copy is not counted, and a genre '
          'left with no title is not shown', (tester) async {
        mergedServers({'a', 'b'});
        await prefs.set(UserPreferences.blockedParentalRatings, 'R');
        await seedRated(tester);

        await pumpGenres(tester);

        expect(tiles(tester), ['Drama 1']);
      });

      testWidgets('a tile takes no artwork from a blocked title', (
        tester,
      ) async {
        mergedServers({'a', 'b'});
        await prefs.set(UserPreferences.blockedParentalRatings, 'R');
        await seedRated(tester);

        await pumpGenres(tester);

        // Umbrel is the only title with artwork, and it is blocked.
        final drama = tester
            .widgetList<GenreGridCard>(find.byType(GenreGridCard))
            .firstWhere((card) => card.genre.name == 'Drama');
        expect(drama.genre.imageUrl, isNull);
        expect(drama.genre.backdropUrl, isNull);
      });

      testWidgets('nothing is left out when the rating is not blocked', (
        tester,
      ) async {
        mergedServers({'a', 'b'});
        await seedRated(tester);

        await pumpGenres(tester);

        expect(tiles(tester), ['Drama 3', 'Family 1', 'Horror 1']);
      });

      testWidgets('with every title blocked there is no genre to show, not '
          'the server\'s own list', (tester) async {
        mergedServers({'a', 'b'});
        stubOwnGenres();
        await prefs.set(UserPreferences.blockedParentalRatings, 'R');
        await tester.runAsync(() async {
          await seedCatalog(harness.db, 'a', [
            {..._dramaTitle('a1', 'Altovar'), 'OfficialRating': 'R'},
          ]);
          await harness.catalog.ensureLoaded();
        });

        await pumpGenres(tester, until: find.text('No genres found'));

        expect(find.byType(GenreGridCard), findsNothing);
      });
    });

    testWidgets('lists the server\'s own genres when nothing merges', (
      tester,
    ) async {
      mergedServers(const {});
      stubOwnGenres();
      await seedBoth(tester);

      await pumpGenres(tester);

      expect(tiles(tester), ['Drama 2']);
      await tester.tap(find.byType(GenreGridCard));
      await tester.pumpAndSettle();
      expect(find.text('opened /genre/Drama?genreId=g1'), findsOneWidget);
    });

    testWidgets('lists the server\'s own genres when it is not a merged one', (
      tester,
    ) async {
      mergedServers({'b', 'c'});
      stubOwnGenres();
      await seedBoth(tester);

      await pumpGenres(tester);

      expect(tiles(tester), ['Drama 2']);
      await tester.tap(find.byType(GenreGridCard));
      await tester.pumpAndSettle();
      expect(find.text('opened /genre/Drama?genreId=g1'), findsOneWidget);
    });

    testWidgets('while the stored catalog is empty, the server\'s own list '
        'opens the merged genres', (tester) async {
      mergedServers({'a', 'b'});
      stubOwnGenres();

      await pumpGenres(tester);

      expect(tiles(tester), ['Drama 2']);
      await tester.tap(find.byType(GenreGridCard));
      await tester.pumpAndSettle();
      expect(find.text('opened /unified-genre/Drama'), findsOneWidget);
    });
  });
}
