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

class _ItemsApi extends Mock implements ItemsApi {}

/// A server that hides Home cards itself (Silo).
class _DismissingItemsApi extends _ItemsApi implements HomeDismissalsApi {
  final hidden = <String>[];
  bool fails = false;

  @override
  Future<void> hideFromContinueWatching(Map<String, dynamic> item) async {
    if (fails) throw Exception('refused');
    hidden.add('continue_watching ${item['Id']}');
  }

  @override
  Future<void> hideFromNextUp(Map<String, dynamic> item) async {
    if (fails) throw Exception('refused');
    hidden.add('next_up ${item['Id']}');
  }
}

/// An episode part way through, of show `series-1`, as Home lists it: its
/// server named by address, not by the user's server id.
AggregatedItem _episode({String serverId = 'https://silo.example/'}) =>
    AggregatedItem(
      id: 'ep-1',
      serverId: serverId,
      rawData: {
        'Id': 'ep-1',
        'Type': 'Episode',
        'Name': 'Pilot',
        'SeriesId': 'series-1',
        'UserData': {'PlaybackPositionTicks': 6000000000, 'Played': false},
      },
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockClient client;
  late _MockMutations mutations;
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    client = _MockClient();
    when(() => client.serverType).thenReturn(ServerType.silo);
    when(() => client.baseUrl).thenReturn('https://silo.example');
    mutations = _MockMutations();
    when(() => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')))
        .thenAnswer((_) async {});

    final users = UserRepository()
      ..setCurrentUser(
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
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<ItemMutationRepository>(mutations);
  });

  tearDown(() => GetIt.instance.reset());

  /// Picks the menu entry labeled by [label] for the episode.
  Future<void> select(
    WidgetTester tester,
    String Function(AppLocalizations l10n) label, {
    AggregatedItem? item,
  }) async {
    late List<ItemContextAction> actions;
    late AppLocalizations l10n;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context);
            actions = contextActionsFor(context, item ?? _episode());
            return const SizedBox.shrink();
          },
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    await actions.firstWhere((a) => a.label == label(l10n)).onSelect();
  }

  testWidgets('Continue Watching: the server hides it, nothing kept here', (
    tester,
  ) async {
    final api = _DismissingItemsApi();
    when(() => client.itemsApi).thenReturn(api);

    await select(tester, (l) => l.contextMenuHideFromContinueWatching);

    expect(api.hidden, ['continue_watching ep-1']);
    expect(prefs.getHiddenContinueWatchingItems(), isEmpty);
    verifyNever(
      () => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')),
    );
  });

  testWidgets('Next Up: the server hides it, nothing kept here', (
    tester,
  ) async {
    final api = _DismissingItemsApi();
    when(() => client.itemsApi).thenReturn(api);

    await select(tester, (l) => l.contextMenuHideFromNextUp);

    expect(api.hidden, ['next_up ep-1']);
    expect(prefs.getHiddenNextUpSeries(), isEmpty);
    expect(prefs.getHiddenContinueWatchingItems(), isEmpty);
  });

  testWidgets('a card named by the user\'s server id counts too', (
    tester,
  ) async {
    final api = _DismissingItemsApi();
    when(() => client.itemsApi).thenReturn(api);

    await select(
      tester,
      (l) => l.contextMenuHideFromContinueWatching,
      item: _episode(serverId: 'server-1'),
    );

    expect(api.hidden, ['continue_watching ep-1']);
  });

  testWidgets('a card of another server: this device\'s list', (tester) async {
    final api = _DismissingItemsApi();
    when(() => client.itemsApi).thenReturn(api);

    await select(
      tester,
      (l) => l.contextMenuHideFromContinueWatching,
      item: _episode(serverId: 'https://other.example'),
    );

    expect(api.hidden, isEmpty);
    expect(prefs.getHiddenContinueWatchingItems().keys, ['series-1']);
  });

  testWidgets('a refused hide falls back to this device, history kept', (
    tester,
  ) async {
    final api = _DismissingItemsApi()..fails = true;
    when(() => client.itemsApi).thenReturn(api);

    await select(tester, (l) => l.contextMenuHideFromContinueWatching);

    expect(prefs.getHiddenContinueWatchingItems().keys, ['series-1']);
    verifyNever(
      () => mutations.setPlayed(any(), isPlayed: any(named: 'isPlayed')),
    );
  });

  testWidgets('a server without its own hide: as before', (tester) async {
    when(() => client.itemsApi).thenReturn(_ItemsApi());
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    // Jellyfin has no hide-from-resume call (upstream's Emby one answers
    // true), so the progress is reset instead.
    when(() => mutations.hideFromResume(any())).thenAnswer((_) async => false);

    await select(tester, (l) => l.contextMenuHideFromContinueWatching);

    expect(prefs.getHiddenContinueWatchingItems().keys, ['series-1']);
    verify(() => mutations.hideFromResume('ep-1')).called(1);
    verify(() => mutations.setPlayed('ep-1', isPlayed: false)).called(1);
  });
}
