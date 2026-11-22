import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/deep_link_navigator.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

/// The signed-in server's libraries, held back until [views] completes.
class _Views extends UserViewsRepository {
  _Views() : super(_Client());

  Completer<List<AggregatedLibrary>> views = Completer();

  @override
  Future<List<AggregatedLibrary>> getUserViews() => views.future;
}

const _movies = AggregatedLibrary(
  id: 'movies1',
  name: 'Movies',
  collectionType: 'movies',
  serverId: 's1',
);
const _games = AggregatedLibrary(
  id: 'games1',
  name: 'Games',
  collectionType: 'mixed',
  serverId: 's1',
);

void main() {
  GoRouter buildRouter() => GoRouter(
    initialLocation: '/search',
    routes: [
      for (final path in [
        '/home',
        '/search',
        '/item/1',
        '/watch-party',
        '/library/:id',
        '/games/:id',
      ])
        GoRoute(
          path: path,
          builder: (_, state) => Scaffold(body: Text(state.uri.path)),
        ),
      GoRoute(
        path: '/live-tv',
        builder: (_, _) => const Scaffold(body: Text('/live-tv')),
        routes: [
          GoRoute(
            path: 'guide',
            builder: (_, _) => const Scaffold(body: Text('/live-tv/guide')),
          ),
        ],
      ),
    ],
  );

  testWidgets('a Live TV link opens over Home', (tester) async {
    final router = buildRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    unawaited(openLinkedRoute(router, '/live-tv/guide'));
    await tester.pumpAndSettle();
    expect(find.text('/live-tv/guide'), findsOneWidget);

    router.pop();
    await tester.pumpAndSettle();
    expect(find.text('/home'), findsOneWidget);
    expect(router.canPop(), isFalse);
  });

  testWidgets('a watch party link opens over Home, so it has a way back', (
    tester,
  ) async {
    final router = buildRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    unawaited(openLinkedRoute(router, '/watch-party?code=K7Q29M'));
    await tester.pumpAndSettle();
    expect(find.text('/watch-party'), findsOneWidget);
    expect(router.canPop(), isTrue);
  });

  testWidgets('other links replace the stack', (tester) async {
    final router = buildRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    unawaited(openLinkedRoute(router, '/item/1'));
    await tester.pumpAndSettle();
    expect(find.text('/item/1'), findsOneWidget);
    expect(router.canPop(), isFalse);
  });

  group('library links', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance
        ..registerSingleton<UserPreferences>(UserPreferences(store))
        ..registerSingleton<GameLibraryRegistry>(
          GameLibraryRegistry()..seed([_games.id]),
        );
    });

    tearDown(GetIt.instance.reset);

    // Made inside each test, so the lookup's future settles in its fake time.
    _Views registerViews() =>
        GetIt.instance.registerSingleton<UserViewsRepository>(_Views())
            as _Views;

    testWidgets('open the screen the library\'s nav entry opens', (
      tester,
    ) async {
      registerViews().views.complete([_movies, _games]);
      final router = buildRouter();
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));

      unawaited(openLinkedRoute(router, '/library/movies1'));
      await tester.pumpAndSettle();
      expect(find.text('/library/movies1'), findsOneWidget);

      unawaited(openLinkedRoute(router, '/library/games1'));
      await tester.pumpAndSettle();
      expect(find.text('/games/games1'), findsOneWidget);
    });

    testWidgets('an id that isn\'t a library opens Home', (tester) async {
      registerViews().views.complete([_movies]);
      final router = buildRouter();
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      unawaited(openLinkedRoute(router, '/library/unknown'));
      await tester.pumpAndSettle();
      expect(find.text('/home'), findsOneWidget);
    });

    testWidgets('a lookup that ends after a newer link leaves it open', (
      tester,
    ) async {
      final views = registerViews();
      final router = buildRouter();
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      unawaited(openLinkedRoute(router, '/library/movies1'));
      unawaited(openLinkedRoute(router, '/item/1'));
      await tester.pumpAndSettle();

      views.views.complete([_movies]);
      await tester.pumpAndSettle();
      expect(find.text('/item/1'), findsOneWidget);
    });
  });
}
