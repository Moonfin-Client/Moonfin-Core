import 'dart:async';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/playback/episode_browser.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds every request until the test answers it, so the order answers land
/// in is the test's to choose.
class _ItemsApi implements ItemsApi {
  final seasonRequests = <Completer<Map<String, dynamic>>>[];
  final episodeRequests = <(String, Completer<Map<String, dynamic>>)>[];

  List<String> get requestedSeasons => [
    for (final (id, _) in episodeRequests) id,
  ];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getSeasons) {
      final answer = Completer<Map<String, dynamic>>();
      seasonRequests.add(answer);
      return answer.future;
    }
    if (invocation.memberName == #getEpisodes) {
      final answer = Completer<Map<String, dynamic>>();
      episodeRequests.add((
        invocation.namedArguments[#seasonId] as String,
        answer,
      ));
      return answer.future;
    }
    return super.noSuchMethod(invocation);
  }
}

class _Client implements MediaServerClient {
  final items = _ItemsApi();

  @override
  ItemsApi get itemsApi => items;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Manager extends Mock implements PlaybackManager {}

AggregatedItem _playing({String id = 's2-e2', String seasonId = 's2'}) =>
    AggregatedItem(
      id: id,
      serverId: 'srv',
      rawData: {
        'Id': id,
        'Type': 'Episode',
        'SeriesId': 'series',
        'SeasonId': seasonId,
        'SeriesName': 'The Show',
      },
    );

Map<String, dynamic> _raw(
  String id,
  int number, [
  Map<String, dynamic>? extra,
]) => {
  'Id': id,
  'Type': 'Episode',
  'Name': id,
  'SeriesId': 'series',
  'ParentIndexNumber': 2,
  'IndexNumber': number,
  ...?extra,
};

Map<String, dynamic> _items(List<Map<String, dynamic>> items) => {
  'Items': items,
};

final _seasons = _items([
  {'Id': 's1', 'Name': 'Season 1', 'IndexNumber': 1},
  {'Id': 's2', 'Name': 'Season 2', 'IndexNumber': 2},
]);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late EpisodeBrowserController browser;

  setUpAll(() {
    registerFallbackValue(Duration.zero);
    registerFallbackValue(<dynamic>[]);
  });

  setUp(() {
    client = _Client();
    browser = EpisodeBrowserController(client: client, playing: _playing());
  });

  tearDown(() async {
    browser.dispose();
    await GetIt.instance.reset();
    resetParentalFilterCache();
  });

  test('is offered for an episode of a series and nothing else', () {
    expect(canBrowseEpisodes(_playing()), isTrue);
    expect(
      canBrowseEpisodes(
        AggregatedItem(
          id: 'm',
          serverId: 'srv',
          rawData: {'Id': 'm', 'Type': 'Movie'},
        ),
      ),
      isFalse,
    );
    expect(
      canBrowseEpisodes(
        AggregatedItem(
          id: 'e',
          serverId: 'srv',
          rawData: {'Id': 'e', 'Type': 'Episode'},
        ),
      ),
      isFalse,
    );
    expect(canBrowseEpisodes('/downloads/episode.mkv'), isFalse);
    expect(canBrowseEpisodes(_playing(), offline: true), isFalse);
    expect(canBrowseEpisodes(_playing(), inSyncPlay: true), isFalse);
  });

  test(
    'opens on the playing season, leaving out missing and unaired episodes',
    () async {
      browser.open(_playing());
      expect(client.items.requestedSeasons, ['s2']);

      client.items.episodeRequests.single.$2.complete(
        _items([
          _raw('s2-e3', 3),
          _raw('s2-e1', 1),
          _raw('s2-missing', 4, {'LocationType': 'Virtual'}),
          _raw('s2-unaired', 5, {'PremiereDate': '2999-01-01T00:00:00Z'}),
        ]),
      );
      client.items.seasonRequests.single.complete(_seasons);
      await pumpEventQueue();

      expect(browser.selectedSeasonId, 's2');
      expect(browser.seasons!.map((season) => season.id), ['s1', 's2']);
      expect(browser.episodes!.map((episode) => episode.id), [
        's2-e1',
        's2-e3',
      ]);
    },
  );

  test('falls back to the first season when the server no longer lists the playing one', () async {
    browser.open(_playing(seasonId: 'gone'));
    client.items.seasonRequests.single.complete(_seasons);
    await pumpEventQueue();

    expect(browser.selectedSeasonId, 's1');
    expect(client.items.requestedSeasons, ['gone', 's1']);
  });

  test(
    'asks for a season once per open, and again the next time it opens',
    () async {
      browser.open(_playing());
      browser.selectSeason('s1');
      browser.selectSeason('s2');
      browser.selectSeason('s1');
      expect(client.items.requestedSeasons, ['s2', 's1']);

      browser.close();
      browser.open(_playing());
      expect(client.items.requestedSeasons, ['s2', 's1', 's2']);
    },
  );

  test('drops a list that lands after the browser closed, and keeps it out of memory', () async {
    browser.open(_playing());
    browser.close();
    client.items.episodeRequests.single.$2.complete(_items([_raw('s2-e1', 1)]));
    await pumpEventQueue();
    expect(browser.episodes, isNull);

    browser.open(_playing());
    expect(browser.episodes, isNull);
  });

  test(
    'never lets a closed request replace the list a newer open fetched',
    () async {
      browser.open(_playing());
      browser.close();
      browser.open(_playing());
      final [(_, older), (_, newer)] = client.items.episodeRequests;

      newer.complete(_items([_raw('new', 1)]));
      await pumpEventQueue();
      older.complete(_items([_raw('old', 1)]));
      await pumpEventQueue();

      expect(browser.episodes!.map((episode) => episode.id), ['new']);
    },
  );

  test('keeps a season it already drew when a refresh fails, and says so when it never loaded', () async {
    browser.open(_playing());
    client.items.episodeRequests.single.$2.completeError(Exception('down'));
    await pumpEventQueue();
    expect(browser.failed, isTrue);

    browser.open(_playing());
    client.items.episodeRequests.last.$2.complete(_items([_raw('s2-e1', 1)]));
    await pumpEventQueue();
    browser.open(_playing());
    client.items.episodeRequests.last.$2.completeError(Exception('down'));
    await pumpEventQueue();

    expect(browser.failed, isFalse);
    expect(browser.episodes!.map((episode) => episode.id), ['s2-e1']);
  });

  test('hides episodes a blocked rating covers', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    await prefs.set(UserPreferences.blockedParentalRatings, 'TV-MA');

    browser.open(_playing());
    client.items.episodeRequests.single.$2.complete(
      _items([
        _raw('mild', 1, {'OfficialRating': 'TV-14'}),
        _raw('harsh', 2, {'OfficialRating': 'TV-MA'}),
      ]),
    );
    await pumpEventQueue();

    expect(browser.episodes!.map((episode) => episode.id), ['mild']);
  });

  group('picking an episode', () {
    late _Manager manager;

    setUp(() async {
      manager = _Manager();
      when(
        () => manager.playItems(
          any(),
          startIndex: any(named: 'startIndex'),
          startPosition: any(named: 'startPosition'),
          carryTrackSelections: any(named: 'carryTrackSelections'),
        ),
      ).thenAnswer((_) async {});
      browser.open(_playing());
      client.items.episodeRequests.single.$2.complete(
        _items([
          _raw('s2-e1', 1),
          _raw('s2-e2', 2),
          _raw('s2-e3', 3, {
            'UserData': {'PlaybackPositionTicks': 6000000000},
          }),
        ]),
      );
      await pumpEventQueue();
    });

    test(
      'plays it with its season queued behind it, carrying on where it stopped',
      () async {
        final picked = browser.episodes!.last;
        expect(await browser.play(manager, picked), isTrue);

        final call = verify(
          () => manager.playItems(
            captureAny(),
            startIndex: captureAny(named: 'startIndex'),
            startPosition: captureAny(named: 'startPosition'),
            carryTrackSelections: captureAny(named: 'carryTrackSelections'),
          ),
        )..called(1);
        final [queue, startIndex, startPosition, carry] = call.captured;
        expect((queue as List).map((episode) => episode.id), [
          's2-e1',
          's2-e2',
          's2-e3',
        ]);
        expect(startIndex, 2);
        expect(startPosition, const Duration(minutes: 10));
        expect(carry, isTrue);
      },
    );

    test('starts an unwatched one from the top', () async {
      await browser.play(manager, browser.episodes!.first);
      final call = verify(
        () => manager.playItems(
          any(),
          startIndex: any(named: 'startIndex'),
          startPosition: captureAny(named: 'startPosition'),
          carryTrackSelections: any(named: 'carryTrackSelections'),
        ),
      );
      expect(call.captured.single, Duration.zero);
    });

    test('leaves playback alone for the episode already on, or one no longer listed', () async {
      expect(await browser.play(manager, browser.episodes![1]), isFalse);
      expect(await browser.play(manager, _playing(id: 'gone')), isFalse);
      verifyNever(
        () => manager.playItems(
          any(),
          startIndex: any(named: 'startIndex'),
          startPosition: any(named: 'startPosition'),
          carryTrackSelections: any(named: 'carryTrackSelections'),
        ),
      );
    });
  });

  group('labels', () {
    final l10n = lookupAppLocalizations(const Locale('en'));

    AggregatedItem episode(Map<String, dynamic> raw) =>
        AggregatedItem(id: 'e', serverId: 'srv', rawData: {'Id': 'e', ...raw});

    test('name the season and episode, and leave out a number the server has none for', () {
      expect(
        episodeBrowserLine(
          l10n,
          episode({'ParentIndexNumber': 2, 'IndexNumber': 5}),
        ),
        'Season 2 · Episode 5',
      );
      expect(
        episodeBrowserLine(
          l10n,
          episode({'ParentIndexNumber': 0, 'IndexNumber': 3}),
        ),
        'Specials · Episode 3',
      );
      expect(
        episodeBrowserLine(l10n, episode({'IndexNumber': 4})),
        'Episode 4',
      );
    });

    test('use the server name for a season and fall back to its number', () {
      expect(
        episodeBrowserSeasonLabel(l10n, episode({'Name': 'Sezonul 6'})),
        'Sezonul 6',
      );
      expect(
        episodeBrowserSeasonLabel(l10n, episode({'IndexNumber': 3})),
        'Season 3',
      );
      expect(episodeBrowserSeasonLabel(l10n, episode({})), 'Specials');
    });

    test(
      'work out progress from the position when the server sends no percentage',
      () {
        expect(
          episodeProgress(
            episode({
              'UserData': {'PlayedPercentage': 40.0},
            }),
          ),
          closeTo(0.4, 0.001),
        );
        expect(
          episodeProgress(
            episode({
              'RunTimeTicks': 1000,
              'UserData': {'PlaybackPositionTicks': 250},
            }),
          ),
          closeTo(0.25, 0.001),
        );
        expect(episodeProgress(episode({})), 0);
      },
    );
  });
}
