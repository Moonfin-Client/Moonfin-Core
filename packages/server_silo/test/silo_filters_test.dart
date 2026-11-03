import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

void main() {
  group('filter values', () {
    test('the captured filter document', () {
      final values = siloFiltersToQueryFilterValues(
        siloFixture('catalog_filters.json'),
      );
      expect(values.genres, containsAll(['Action', 'Adventure', 'Animation']));
      expect(values.officialRatings, containsAll(['G', 'NC-17', 'NR']));
      expect(values.years, isEmpty, reason: 'Silo has no year facet');
      final english = values.audioLanguages.firstWhere((l) => l.value == 'en');
      expect(english.name, 'English');
      expect(
        values.audioLanguages.where((l) => l.value == 'und'),
        isEmpty,
        reason: 'undetermined is not a language to pick',
      );
      expect(values.subtitleLanguages, isNotEmpty);
    });

    test('getQueryFilters asks for the library and scope', () async {
      final server = FixtureServer({
        '/api/v2/catalog/filters': FixtureServer.file(
          'silo/catalog_filters.json',
        ),
      });
      final values = await siloTestClient(
        server,
      ).itemsApi.getQueryFilters(parentId: '1', includeItemTypes: ['Movie']);
      expect(values.genres, isNotEmpty);
      final q = server.requests.single.uri.queryParameters;
      expect(q['library_id'], '1');
      expect(q['type'], 'movie');
    });
  });

  group('rule groups', () {
    test('nothing asked, no groups', () {
      expect(siloRuleGroups(), isEmpty);
      expect(siloRuleGroups(genres: [], filters: ['Likes']), isEmpty);
    });

    test('each filter is a group; values within one match any', () {
      final groups = siloRuleGroups(
        genres: ['Action', 'Comedy'],
        years: [1999, 2002],
        officialRatings: ['PG-13'],
      );
      expect(groups, [
        {
          'match': 'any',
          'rules': [
            {'field': 'genre', 'op': 'is', 'value': 'Action'},
            {'field': 'genre', 'op': 'is', 'value': 'Comedy'},
          ],
        },
        {
          'match': 'any',
          'rules': [
            {'field': 'year', 'op': 'is', 'value': 1999},
            {'field': 'year', 'op': 'is', 'value': 2002},
          ],
        },
        {
          'match': 'any',
          'rules': [
            {'field': 'content_rating', 'op': 'is', 'value': 'PG-13'},
          ],
        },
      ]);
    });

    test('played state, favorites, quality, languages', () {
      Iterable<String> rules(List<Map<String, Object?>> g) => [
        for (final group in g)
          for (final r in (group['rules'] as List).cast<Map>())
            '${r['field']} ${r['op']} ${r['value']}',
      ];
      expect(rules(siloRuleGroups(filters: ['IsPlayed'])), ['watched is true']);
      expect(rules(siloRuleGroups(filters: ['IsUnplayed'])), [
        'watched is false',
      ]);
      expect(rules(siloRuleGroups(filters: ['IsResumable'])), [
        'in_progress is true',
      ]);
      expect(rules(siloRuleGroups(isFavorite: true)), ['favorited is true']);
      expect(rules(siloRuleGroups(filters: ['IsInWatchlist'])), [
        'in_watchlist is true',
      ]);
      expect(rules(siloRuleGroups(is4K: true)), ['resolution is 2160p']);
      expect(rules(siloRuleGroups(isHd: true)), [
        'resolution is 1080p',
        'resolution is 720p',
      ]);
      expect(siloRuleGroups(isHd: false), hasLength(3));
      expect(rules(siloRuleGroups(audioLanguages: ['en'])), [
        'audio_language is en',
      ]);
    });

    test('getItems sends them, and they key the cursors', () async {
      final server = FixtureServer({
        '/api/v2/catalog': siloJson({
          'items': [],
          'page': {'has_more': false},
        }),
      });
      final api = siloTestClient(server).itemsApi;
      await api.getItems(parentId: '1', genres: ['Action']);
      await api.getItems(parentId: '1', genres: ['Comedy']);

      final sent = [
        for (final r in server.requests) r.uri.queryParameters['groups'],
      ];
      expect(jsonDecode(sent[0]!), [
        {
          'match': 'any',
          'rules': [
            {'field': 'genre', 'op': 'is', 'value': 'Action'},
          ],
        },
      ]);
      expect(sent[1], contains('Comedy'));
    });

    test('series status is applied to the page', () async {
      final server = FixtureServer({
        '/api/v2/catalog': siloJson({
          'items': [
            {
              'content_id': 'series-a',
              'type': 'series',
              'title': 'A',
              'show_status': 'ended',
            },
            {
              'content_id': 'series-b',
              'type': 'series',
              'title': 'B',
              'show_status': 'returning series',
            },
          ],
          'page': {'has_more': false},
        }),
      });
      final page = await siloTestClient(
        server,
      ).itemsApi.getItems(parentId: '3', seriesStatus: ['Ended']);
      expect((page['Items'] as List).map((i) => (i as Map)['Name']), ['A']);
    });

    test('series status pages the whole filtered list', () async {
      // 450 series, every third still airing. Silo pages by cursor.
      final server = FixtureServer({
        '/api/v2/catalog': (RequestOptions o) {
          final q = o.queryParameters;
          final limit = int.parse('${q['limit']}');
          final cursor = q['cursor'] as String?;
          final start = cursor == null
              ? 0
              : cursor == 'w'
              ? int.parse('${q['seek']}')
              : int.parse(cursor.substring(2));
          final end = start + limit > 450 ? 450 : start + limit;
          return FixtureServer.json(
            200,
            jsonEncode({
              'items': [
                for (var i = start; i < end; i++)
                  {
                    'content_id': 'series-$i',
                    'type': 'series',
                    'title': 'Show $i',
                    'show_status': i % 3 == 0 ? 'returning series' : 'ended',
                  },
              ],
              'page': {
                'has_more': end < 450,
                if (end < 450) 'next_cursor': 'n:$end',
              },
              'window_cursor': 'w',
              'total': 450,
              'total_exact': true,
            }),
          );
        },
      });
      final items = siloTestClient(server).itemsApi;
      final first = await items.getItems(
        parentId: '3',
        seriesStatus: ['Continuing'],
        startIndex: 0,
        limit: 100,
      );
      expect(first['TotalRecordCount'], 150);
      expect(first['Items'], hasLength(100));
      final second = await items.getItems(
        parentId: '3',
        seriesStatus: ['Continuing'],
        startIndex: 100,
        limit: 100,
      );
      expect(second['Items'], hasLength(50));
      expect((second['Items'] as List).first['Name'], 'Show 300');
      final requests = server.requests.length;
      expect(requests, greaterThan(0));
      // The second page came from the list already read.
      await items.getItems(
        parentId: '3',
        seriesStatus: ['Continuing'],
        startIndex: 50,
        limit: 10,
      );
      expect(server.requests.length, requests);
      // Ended reads its own list.
      final ended = await items.getItems(
        parentId: '3',
        seriesStatus: ['Ended'],
        startIndex: 0,
        limit: 10,
      );
      expect(ended['TotalRecordCount'], 300);
    });
  });
}
