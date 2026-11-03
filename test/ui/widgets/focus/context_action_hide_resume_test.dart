import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/focus/context_action.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockMutations extends Mock implements ItemMutationRepository {}

/// An ItemsApi without Silo's server-side Home hides.
class _ItemsApi extends Mock implements ItemsApi {}

AggregatedItem _episode() => AggregatedItem(
  id: 'ep-1',
  serverId: 'server-1',
  rawData: {
    'Id': 'ep-1',
    'Type': 'Episode',
    'Name': 'Pilot',
    'SeriesId': 'series-1',
    'UserData': {'PlaybackPositionTicks': 6000000000, 'Played': false},
  },
);

AggregatedItem _audiobookChapter() => AggregatedItem(
  id: 'chapter-1',
  serverId: 'server-1',
  rawData: {
    'Id': 'chapter-1',
    'Type': 'Audio',
    'Name': 'Chapter 1',
    'UserData': {'PlaybackPositionTicks': 6000000000, 'Played': false},
  },
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMutations mutations;
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    final client = _MockClient();
    when(() => client.serverType).thenReturn(ServerType.emby);
    // The menu asks the item's server whether it hides Home cards itself
    // (Silo), and Emby doesn't.
    when(() => client.baseUrl).thenReturn('https://emby.example');
    when(() => client.itemsApi).thenReturn(_ItemsApi());

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

    mutations = _MockMutations();
    when(
      () => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')),
    ).thenAnswer((_) async {});

    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<UserRepository>(users);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<ItemMutationRepository>(mutations);
  });

  tearDown(() => GetIt.instance.reset());

  Future<ItemContextAction> action(
    WidgetTester tester,
    String label, {
    AggregatedItem? item,
  }) async {
    late List<ItemContextAction> actions;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            actions = contextActionsFor(context, item ?? _episode());
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    return actions.firstWhere((a) => a.label == label);
  }

  group('Hide from Continue Watching', () {
    testWidgets('on Emby hides it on the server too and keeps the progress', (
      tester,
    ) async {
      when(() => mutations.hideFromResume('ep-1')).thenAnswer((_) async => true);

      await (await action(tester, 'Hide from Continue Watching')).onSelect();

      verify(() => mutations.hideFromResume('ep-1')).called(1);
      verifyNever(
        () => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')),
      );
      expect(prefs.getHiddenContinueWatchingItems().keys, ['series-1']);
    });

    testWidgets('on Emby audio still resets', (tester) async {
      when(() => mutations.hideFromResume(any())).thenAnswer((_) async => true);

      await (await action(
        tester,
        'Hide from Continue Watching',
        item: _audiobookChapter(),
      )).onSelect();

      verifyNever(() => mutations.hideFromResume(any()));
      verify(() => mutations.setPlayed('chapter-1', isPlayed: false)).called(1);
    });

    testWidgets('without server support hides locally and resets as before', (
      tester,
    ) async {
      when(
        () => mutations.hideFromResume('ep-1'),
      ).thenAnswer((_) async => false);

      await (await action(tester, 'Hide from Continue Watching')).onSelect();

      verify(() => mutations.setPlayed('ep-1', isPlayed: false)).called(1);
      expect(prefs.getHiddenContinueWatchingItems().keys, ['series-1']);
    });

    testWidgets('a failed Emby call hides locally but never resets', (
      tester,
    ) async {
      when(
        () => mutations.hideFromResume('ep-1'),
      ).thenThrow(Exception('offline'));

      await (await action(tester, 'Hide from Continue Watching')).onSelect();

      verifyNever(
        () => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')),
      );
      expect(prefs.getHiddenContinueWatchingItems().keys, ['series-1']);
    });
  });

  group('Hide from Next Up', () {
    testWidgets('on Emby flags the episode instead of resetting it', (
      tester,
    ) async {
      when(() => mutations.hideFromResume('ep-1')).thenAnswer((_) async => true);

      await (await action(tester, 'Hide from Next Up')).onSelect();

      verify(() => mutations.hideFromResume('ep-1')).called(1);
      verifyNever(
        () => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')),
      );
      expect(prefs.getHiddenNextUpSeries().keys, ['series-1']);
    });

    testWidgets('without server support still resets as before', (
      tester,
    ) async {
      when(
        () => mutations.hideFromResume('ep-1'),
      ).thenAnswer((_) async => false);

      await (await action(tester, 'Hide from Next Up')).onSelect();

      verify(() => mutations.setPlayed('ep-1', isPlayed: false)).called(1);
    });
  });
}
