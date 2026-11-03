import 'dart:convert';

import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _xxx = 'movie-imdb-tt0295701';
const _episode = 'episode-imdb-tt1641384-1-1';

/// A frame as Silo's events socket sends it.
SiloEventFrame _frame(Map<String, Object?> json) =>
    SiloEventFrame.parse(jsonEncode(json))!;

SiloEventFrame _userState(
  String contentId,
  String change, {
  String profileId = 'p1',
  bool? played,
  bool? isFavorite,
}) => _frame({
  'type': 'event',
  'channel': 'user_state',
  'event': 'user_state.changed',
  'event_id': 'e-$contentId-$change',
  'timestamp': '2026-10-18T12:00:00Z',
  'data': {
    'profile_id': profileId,
    'content_id': contentId,
    'change': change,
    'played': ?played,
    'is_favorite': ?isFavorite,
  },
});

SiloEventFrame _catalog(String event, Map<String, Object?> data) => _frame({
  'type': 'event',
  'channel': 'catalog',
  'event': event,
  'event_id': 'c-$event',
  'timestamp': '2026-10-18T12:00:00Z',
  'data': data,
});

/// xXx's detail as Silo answers it once the web watched half of it and
/// favorited it.
Map<String, dynamic> _xxxInProgress() => siloFixture('catalog_item_movie.json')
  ..['user_state'] = {
    'played': false,
    'is_favorite': true,
    'in_watchlist': false,
  }
  ..['user_data'] = {
    'position_seconds': 3600,
    'duration_seconds': 7440,
    'is_in_progress': true,
    'watched_count': 0,
    'unplayed_count': 0,
    'played': false,
  };

void main() {
  group('user_state', () {
    test('a change on the web passes on the item\'s user data as Silo now '
        'has it', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': siloJson(_xxxInProgress()),
      });
      final client = siloTestClient(server)..userId = 'p1';

      final messages = await SiloEventsTranslator(
        client,
      ).translate([_userState(_xxx, 'progress')]);

      final message = messages.single as UserDataChangedMessage;
      expect(message.userId, 'p1');
      final entry = message.userDataList.single;
      expect(entry['ItemId'], _xxx);
      expect(entry['PlaybackPositionTicks'], 3600 * 10000000);
      expect(entry['IsFavorite'], isTrue);
      expect(entry['Played'], isFalse);
    });

    test('several events for one item read it once', () async {
      final server = FixtureServer({
        '/api/v2/catalog/items/$_xxx': siloJson(_xxxInProgress()),
      });
      final client = siloTestClient(server)..userId = 'p1';

      final messages = await SiloEventsTranslator(client).translate([
        _userState(_xxx, 'favorite', isFavorite: true),
        _userState(_xxx, 'progress'),
      ]);

      expect(
        (messages.single as UserDataChangedMessage).userDataList,
        hasLength(1),
      );
      expect(server.requests, hasLength(1));
    });

    test('another profile\'s change is not this one\'s', () async {
      final server = FixtureServer({});
      final client = siloTestClient(server)..userId = 'p1';

      final messages = await SiloEventsTranslator(
        client,
      ).translate([_userState(_xxx, 'watched', profileId: 'p2', played: true)]);

      expect(messages, isEmpty);
      expect(server.requests, isEmpty);
    });

    test('an item that can\'t be read passes on what the event said', () async {
      final client = siloTestClient(FixtureServer({}))..userId = 'p1';

      final messages = await SiloEventsTranslator(
        client,
      ).translate([_userState(_episode, 'watched', played: true)]);

      expect((messages.single as UserDataChangedMessage).userDataList.single, {
        'ItemId': _episode,
        'Played': true,
      });
    });

    test('a change Moonfin shows nothing for only clears the reads', () async {
      final server = FixtureServer({});
      final client = siloTestClient(server)..userId = 'p1';

      final messages = await SiloEventsTranslator(client).translate([
        _userState(_xxx, 'watchlist'),
        _userState(_xxx, 'home_dismissal'),
        _userState(_xxx, 'not_interested'),
      ]);

      expect(messages, isEmpty);
      expect(server.requests, isEmpty);
      // Remembered as changed, so a screen's refresh reads it again.
      expect(client.itemsApi.userDataMayHaveChanged([_xxx, _episode]), [_xxx]);
    });

    test('a burst reads back at most maxReadBacks items', () async {
      final server = FixtureServer({});
      final client = siloTestClient(server)..userId = 'p1';
      final ids = [
        for (var e = 1; e <= SiloEventsTranslator.maxReadBacks + 5; e++)
          'movie-$e',
      ];

      final messages = await SiloEventsTranslator(client).translate([
        for (final id in ids) _userState(id, 'watched', played: true),
      ]);

      expect(
        (messages.single as UserDataChangedMessage).userDataList,
        hasLength(ids.length),
      );
      expect(server.requests, hasLength(SiloEventsTranslator.maxReadBacks));
    });

    test('a season\'s episodes are read back from its list, once', () async {
      final season = 'season-imdb-tt1641384-1';
      final server = FixtureServer({
        '/api/v2/catalog/items/$season/episodes': siloJson({
          'items': [
            for (var e = 1; e <= 30; e++)
              {
                'content_id': 'episode-imdb-tt1641384-1-$e',
                'season_number': 1,
                'episode_number': e,
                'title': 'Episode $e',
                'user_state': {'played': true},
              },
          ],
        }),
      });
      final client = siloTestClient(server)..userId = 'p1';
      final ids = [
        for (var e = 1; e <= SiloEventsTranslator.maxReadBacks + 5; e++)
          'episode-imdb-tt1641384-1-$e',
      ];

      final messages = await SiloEventsTranslator(client).translate([
        for (final id in ids) _userState(id, 'watched', played: true),
      ]);

      expect(
        (messages.single as UserDataChangedMessage).userDataList,
        hasLength(ids.length),
      );
      expect(server.requests, hasLength(1));
      final read = (messages.single as UserDataChangedMessage).userDataList;
      expect(
        read.take(SiloEventsTranslator.maxReadBacks).map((e) => e['Played']),
        everyElement(isTrue),
      );
    });
  });

  group('catalog', () {
    test('an item\'s metadata changed: LibraryChanged with the item', () async {
      final client = siloTestClient(FixtureServer({}));

      final messages = await SiloEventsTranslator(client).translate([
        _catalog('catalog.item.changed', {
          'library_id': 1,
          'content_id': _xxx,
          'change': 'metadata_updated',
        }),
        // The legacy name for the same change.
        _catalog('metadata.updated', {'library_id': 1, 'content_id': _xxx}),
      ]);

      expect((messages.single as LibraryChangedMessage).itemsUpdated, [_xxx]);
    });

    test('a scan names no items, so nothing is passed on', () async {
      final client = siloTestClient(FixtureServer({}));

      final messages = await SiloEventsTranslator(client).translate([
        _catalog('catalog.library.changed', {
          'library_id': 1,
          'reason': 'scan',
          'new': 3,
          'updated': 0,
          'missing': 0,
        }),
      ]);

      expect(messages, isEmpty);
    });
  });

  test('a snapshot passes nothing on', () async {
    final client = siloTestClient(FixtureServer({}));

    final messages = await SiloEventsTranslator(client).translate([
      _frame({
        'type': 'snapshot',
        'channel': 'user_state',
        'timestamp': 't',
        'data': null,
      }),
    ]);

    expect(messages, isEmpty);
  });
}
