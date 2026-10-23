import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockImageApi extends Mock implements ImageApi {}

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  // Home opens episode 1, whose page lists episode 2, then picks it and presses Back.
  Future<void> pickNextThenGoBack(
    WidgetTester tester, {
    required bool replacePage,
  }) async {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const Text('home')),
        GoRoute(
          path: '/item/:id',
          builder: (_, state) => Scaffold(
            body: Column(
              children: [
                Text('page ${state.pathParameters['id']}'),
                DetailEpisodeCard(
                  episode: AggregatedItem(
                    id: 'episode-2',
                    serverId: 'server-1',
                    rawData: const {
                      'Id': 'episode-2',
                      'Name': 'Episode 2',
                      'Type': 'Episode',
                    },
                  ),
                  imageApi: MockImageApi(),
                  replacePage: replacePage,
                ),
              ],
            ),
          ),
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
    router.push('/item/episode-1');
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DetailEpisodeCard));
    await tester.pumpAndSettle();
    expect(find.text('page episode-2'), findsOneWidget);

    router.pop();
    await tester.pumpAndSettle();
  }

  testWidgets('an episode picked from an episode page takes its place', (
    tester,
  ) async {
    await pickNextThenGoBack(tester, replacePage: true);
    expect(find.text('home'), findsOneWidget);
  });

  testWidgets('an episode picked from any other page stacks on it', (
    tester,
  ) async {
    await pickNextThenGoBack(tester, replacePage: false);
    expect(find.text('page episode-1'), findsOneWidget);
  });

  testWidgets('the episode on screen picked from its own list plays in place', (
    tester,
  ) async {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const Text('home')),
        GoRoute(
          path: '/item/:id',
          builder: (_, state) => DetailEpisodeCard(
            episode: AggregatedItem(
              id: 'episode-1',
              serverId: 'server-1',
              rawData: const {
                'Id': 'episode-1',
                'Name': 'Episode 1',
                'Type': 'Episode',
              },
            ),
            imageApi: MockImageApi(),
            replacePage: true,
            isOnScreen: true,
          ),
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
    router.push('/item/episode-1');
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DetailEpisodeCard));
    await tester.pumpAndSettle();
    expect(router.state.uri.toString(), '/item/episode-1?autoPlay=true');

    router.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
  });
}
