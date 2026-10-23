import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/context_action.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockMutations extends Mock implements ItemMutationRepository {}

AggregatedItem _item(
  String type, {
  String id = 'item-1',
  Map<String, dynamic>? userData,
  int? recursiveItemCount,
}) => AggregatedItem(
  id: id,
  serverId: 'server-1',
  rawData: {
    'Id': id,
    'Type': type,
    'Name': 'Something',
    'UserData': ?userData,
    'RecursiveItemCount': ?recursiveItemCount,
  },
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();

    final client = _MockClient();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);

    final users = UserRepository();
    users.setCurrentUser(
      PrivateUser(
        id: 'u1',
        name: 'Test',
        serverId: 'server-1',
        accessToken: 'token',
        lastUsed: DateTime(2026),
      ),
    );

    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<UserRepository>(users);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<ItemMutationRepository>(_MockMutations());
  });

  tearDown(() => GetIt.instance.reset());

  Future<({List<ItemContextAction> actions, GoRouter router})> buildActions(
    WidgetTester tester,
    AggregatedItem item, {
    bool isContinueWatchingOrNextUp = false,
  }) async {
    late List<ItemContextAction> actions;
    final router = GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            actions = contextActionsFor(
              context,
              item,
              isContinueWatchingOrNextUp: isContinueWatchingOrNextUp,
            );
            return const SizedBox.shrink();
          },
        ),
        GoRoute(
          path: '/item/:itemId',
          builder: (context, state) => const SizedBox.shrink(),
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    return (actions: actions, router: router);
  }

  for (final type in ['Movie', 'Episode', 'Series', 'Season', 'Audio']) {
    testWidgets('$type offers Play as the first action', (tester) async {
      final built = await buildActions(tester, _item(type));
      expect(
        built.actions.first.label,
        'Play',
        reason:
            'Play has to lead so a remote lands on it with no extra presses',
      );
      expect(built.actions.first.icon, Icons.play_arrow);
    });
  }

  testWidgets('a part watched item offers Resume instead', (tester) async {
    final built = await buildActions(
      tester,
      _item('Movie', userData: {'PlaybackPositionTicks': 6000000000}),
    );
    expect(built.actions.first.label, 'Resume');
  });

  testWidgets('progress recorded as a percentage also reads as Resume', (
    tester,
  ) async {
    final built = await buildActions(
      tester,
      _item('Episode', userData: {'PlayedPercentage': 42.0}),
    );
    expect(built.actions.first.label, 'Resume');
  });

  testWidgets('a part watched series offers Resume', (tester) async {
    final built = await buildActions(
      tester,
      _item(
        'Series',
        recursiveItemCount: 10,
        userData: {'UnplayedItemCount': 4},
      ),
    );
    expect(
      built.actions.first.label,
      'Resume',
      reason:
          'a series carries no position of its own, so part watched is '
          'the only thing that can stand in for progress',
    );
  });

  testWidgets('a series nobody has started still offers Play', (tester) async {
    final built = await buildActions(
      tester,
      _item(
        'Series',
        recursiveItemCount: 10,
        userData: {'UnplayedItemCount': 10},
      ),
    );
    expect(built.actions.first.label, 'Play');
  });

  testWidgets('a type that cant be played offers no Play', (tester) async {
    final built = await buildActions(tester, _item('Person'));
    expect(built.actions.map((a) => a.label), isNot(contains('Play')));
  });

  testWidgets('choosing Play opens the item asking it to start', (
    tester,
  ) async {
    final built = await buildActions(tester, _item('Episode', id: 'ep-9'));
    await built.actions.first.onSelect();
    await tester.pumpAndSettle();

    expect(
      built.router.state.uri.toString(),
      '/item/ep-9?serverId=server-1&autoPlay=true',
      reason:
          'without autoPlay the user lands on the detail screen and has to '
          'press play themselves',
    );
  });

  testWidgets(
    'flipping default action to play shows Go to Details screen in Continue Watching',
    (tester) async {
      final prefs = GetIt.instance<UserPreferences>();
      await prefs.set(
        UserPreferences.continueWatchingDefaultAction,
        ContinueWatchingDefaultAction.play,
      );

      final built = await buildActions(
        tester,
        _item('Episode', id: 'ep-9'),
        isContinueWatchingOrNextUp: true,
      );

      expect(built.actions.first.label, 'Go to Details');
      expect(built.actions.first.icon, Icons.info_outline);

      await built.actions.first.onSelect();
      await tester.pumpAndSettle();

      expect(
        built.router.state.uri.toString(),
        '/item/ep-9?serverId=server-1',
      );
    },
  );
}
