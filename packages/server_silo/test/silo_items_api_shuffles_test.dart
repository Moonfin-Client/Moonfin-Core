import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _caps = '/api/v2/shuffles/capabilities';
const _series = 'series-imdb-tt1641384';

/// An episode card of Young Justice, as a shuffle lists it.
Map<String, dynamic> siloEpisodeCard(int season, int episode) => {
  'content_id': 'episode-imdb-tt1641384-$season-$episode',
  'type': 'episode',
  'title': 'Episode $episode',
  'series_id': _series,
  'series_title': 'Young Justice',
  'season_number': season,
  'episode_number': episode,
  'genres': <String>[],
  'keywords': <String>[],
  'status': 'matched',
};

Map<String, dynamic> siloShuffle(
  Map<String, dynamic> current,
  Map<String, dynamic> next,
) => {
  'id': 'sh-1',
  'scope': {'kind': 'series', 'id': _series, 'title': 'Young Justice'},
  'current': current,
  'next': next,
  'created_at': '2026-10-17T12:00:00.000Z',
  'updated_at': '2026-10-17T12:00:00.000Z',
};

ResponseBody Function(RequestOptions) _capabilities({
  String state = 'available',
  List<String> kinds = const ['library', 'series', 'season', 'user_collection'],
}) => siloJson({
  'revision': 'r1',
  'state': state,
  'allowed': true,
  'scope_kinds': kinds,
});

void main() {
  group('scopes', () {
    test('series, season, library and collections', () {
      expect(SiloShuffles.scopeOf({'Id': _series, 'Type': 'Series'}), (
        kind: 'series',
        id: _series,
      ));
      expect(
        SiloShuffles.scopeOf({
          'Id': 'season-imdb-tt1641384-2',
          'Type': 'Season',
        }),
        (kind: 'season', id: 'season-imdb-tt1641384-2'),
      );
      expect(SiloShuffles.scopeOf({'Id': '5', 'Type': 'CollectionFolder'}), (
        kind: 'library',
        id: '5',
      ));
      expect(
        SiloShuffles.scopeOf({
          'Id': '${siloCollectionIdPrefix}12',
          'Type': 'BoxSet',
        }),
        (kind: 'user_collection', id: '12'),
      );
      expect(
        SiloShuffles.scopeOf({
          'Id': '${siloLibraryCollectionIdPrefix}5:40',
          'Type': 'BoxSet',
        }),
        (kind: 'library_collection', id: '40'),
      );
      // A person's id is a number too, and a film has nothing to shuffle.
      expect(SiloShuffles.scopeOf({'Id': '77', 'Type': 'Person'}), isNull);
      expect(
        SiloShuffles.scopeOf({'Id': 'movie-imdb-tt0295701', 'Type': 'Movie'}),
        isNull,
      );
    });

    test('only the kinds Silo takes, while shuffles are available', () async {
      var server = FixtureServer({_caps: _capabilities()});
      final api = siloTestClient(server).itemsApi as ServerShuffleApi;
      expect(await api.canShuffle({'Id': _series, 'Type': 'Series'}), isTrue);
      expect(
        await api.canShuffle({
          'Id': '${siloLibraryCollectionIdPrefix}5:40',
          'Type': 'BoxSet',
        }),
        isFalse,
      );
      expect(server.requests, hasLength(1), reason: 'read once');

      server = FixtureServer({_caps: _capabilities(state: 'disabled')});
      expect(
        await siloTestClient(
          server,
        ).itemsApi.canShuffle({'Id': _series, 'Type': 'Series'}),
        isFalse,
      );
    });
  });

  test('a start: the scope, and the first two items', () async {
    final server = FixtureServer({
      '/api/v2/shuffles': siloJson(
        siloShuffle(siloEpisodeCard(2, 4), siloEpisodeCard(1, 9)),
      ),
    });
    final shuffle = await siloTestClient(
      server,
    ).itemsApi.startShuffle({'Id': _series, 'Type': 'Series'});
    expect(shuffle.id, 'sh-1');
    expect(shuffle.current['Id'], 'episode-imdb-tt1641384-2-4');
    expect(shuffle.current['SeriesId'], _series);
    expect(shuffle.current['SeasonId'], 'season-imdb-tt1641384-2');
    expect(shuffle.next?['Id'], 'episode-imdb-tt1641384-1-9');
    final request = server.requests.single;
    expect(request.method, 'POST');
    expect(request.data, {
      'scope': {'kind': 'series', 'id': _series},
    });
  });

  test('a scope with one item has no next', () async {
    final server = FixtureServer({
      '/api/v2/shuffles': siloJson(
        siloShuffle(siloEpisodeCard(1, 1), siloEpisodeCard(1, 1)),
      ),
    });
    final shuffle = await siloTestClient(
      server,
    ).itemsApi.startShuffle({'Id': 'season-imdb-tt1641384-1'});
    expect(shuffle.next, isNull);
  });

  test('moving on names the item that was current', () async {
    final server = FixtureServer({
      '/api/v2/shuffles/sh-1/advance': siloJson(
        siloShuffle(siloEpisodeCard(1, 9), siloEpisodeCard(3, 2)),
      ),
    });
    final moved = await siloTestClient(
      server,
    ).itemsApi.advanceShuffle('sh-1', fromItemId: 'episode-imdb-tt1641384-2-4');
    expect(moved?.current['Id'], 'episode-imdb-tt1641384-1-9');
    expect(moved?.next?['Id'], 'episode-imdb-tt1641384-3-2');
    expect(
      jsonEncode(server.requests.single.data),
      jsonEncode({'from_content_id': 'episode-imdb-tt1641384-2-4'}),
    );
  });

  test('a shuffle that is gone', () async {
    final server = FixtureServer({});
    expect(
      await siloTestClient(
        server,
      ).itemsApi.advanceShuffle('sh-1', fromItemId: 'x'),
      isNull,
    );
  });
}
