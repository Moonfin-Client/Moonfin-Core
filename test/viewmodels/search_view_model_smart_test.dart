import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/viewmodels/search_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockPluginSync extends Mock implements PluginSyncService {}

Map<String, dynamic> _answer(List<String> itemIds) => {
  'Ready': true,
  'Items': [
    for (final id in itemIds) {'Id': id, 'Name': id, 'Type': 'Movie'},
  ],
  'Seerr': <Object>[],
};

void main() {
  group('SmartSearchResults.fromJson', () {
    test('reads library items and Seerr titles', () {
      final results = SmartSearchResults.fromJson({
        'Ready': true,
        'Items': [
          {
            'Id': 'a1',
            'Name': 'The Mask',
            'Type': 'Movie',
            'ProductionYear': 1994,
            'ImageTags': {'Primary': 'tag'},
            'UserData': {'Played': true},
          },
          {'Id': 'p1', 'Name': 'Jim Carrey', 'Type': 'Person'},
        ],
        'Seerr': [
          {
            'id': 8844,
            'mediaType': 'movie',
            'title': 'Jumanji',
            'name': null,
            'releaseDate': '1995-12-15',
            'firstAirDate': null,
            'posterPath': '/abc.jpg',
            'backdropPath': '/def.jpg',
            'overview': 'A board game.',
            'voteAverage': 7.2,
          },
        ],
      }, serverId: 'http://jf');

      expect([for (final i in results.items) i.type], ['Movie', 'Person']);
      expect(results.items.first.serverId, 'http://jf');
      expect(results.items.first.productionYear, 1994);
      expect(results.items.first.isPlayed, isTrue);
      expect(results.seerr.single.id, 8844);
      expect(results.seerr.single.displayTitle, 'Jumanji');
      expect(results.seerr.single.posterPath, '/abc.jpg');
    });

    test('maps a Plex answer through the Plex mappers', () {
      final results = SmartSearchResults.fromJson({
        'Ready': true,
        'Items': [
          {
            'ratingKey': '512',
            'key': '/library/metadata/512',
            'type': 'movie',
            'title': 'Cast Away',
            'year': 2000,
            'thumb': '/library/metadata/512/thumb/1700000000',
            'art': '/library/metadata/512/art/1700000000',
            'summary': 'A man is stranded on an island.',
            'Genre': [
              {'tag': 'Drama'},
            ],
          },
          {
            'type': 'person',
            'id': 12345,
            'tag': 'Tom Hanks',
            'thumb': 'https://metadata-static.plex.tv/people/hanks.jpg',
          },
          {'type': 'person', 'id': 678, 'tag': 'Helen Hunt'},
        ],
        'Seerr': <Object>[],
      }, serverId: 'http://plex', plex: true);

      final [movie, hanks, hunt] = results.items;
      expect(movie.id, '512');
      expect(movie.type, 'Movie');
      expect(movie.name, 'Cast Away');
      expect(movie.serverId, 'http://plex');
      expect(movie.productionYear, 2000);
      expect(movie.genres, ['Drama']);
      expect(movie.primaryImageTag, '/library/metadata/512/thumb/1700000000');
      expect(movie.backdropImageTags, ['/library/metadata/512/art/1700000000']);
      expect(hanks.id, 'person-12345');
      expect(hanks.type, 'Person');
      expect(hanks.name, 'Tom Hanks');
      expect(
        hanks.primaryImageTag,
        'https://metadata-static.plex.tv/people/hanks.jpg',
      );
      expect(hunt.id, 'person-678');
      expect(hunt.primaryImageTag, isNull);
    });

    test('a server still building its index gives nothing', () {
      final results = SmartSearchResults.fromJson({
        'Ready': false,
        'Items': <Object>[],
        'Seerr': <Object>[],
      }, serverId: 'http://jf');

      expect(results.isEmpty, isTrue);
    });

    test('leaves Seerr titles out when Seerr is not usable', () {
      final results = SmartSearchResults.fromJson({
        'Ready': true,
        'Items': <Object>[],
        'Seerr': [
          {'id': 1, 'mediaType': 'movie', 'title': 'Jumanji'},
        ],
      }, serverId: 'http://jf', includeSeerr: false);

      expect(results.isEmpty, isTrue);
    });
  });

  group('SearchViewModel smart search', () {
    late _MockClient client;
    late _MockItemsApi itemsApi;
    late _MockPluginSync pluginSync;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
      client = _MockClient();
      itemsApi = _MockItemsApi();
      pluginSync = _MockPluginSync();
      when(() => client.itemsApi).thenReturn(itemsApi);
      when(() => client.gamesApi).thenReturn(null);
      when(() => client.baseUrl).thenReturn('http://jf');
      when(() => client.serverType).thenReturn(ServerType.jellyfin);
      when(() => pluginSync.smartSearchEnabled).thenReturn(true);
      when(
        () => itemsApi.getItems(
          searchTerm: any(named: 'searchTerm'),
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          excludeItemTypes: any(named: 'excludeItemTypes'),
          limit: any(named: 'limit'),
          recursive: any(named: 'recursive'),
          fields: any(named: 'fields'),
          studios: any(named: 'studios'),
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'm1', 'Type': 'Movie', 'Name': 'm1'},
          ],
        },
      );
    });

    tearDown(() => GetIt.instance.reset());

    Completer<Map<String, dynamic>?> smartFor(String query) {
      final answer = Completer<Map<String, dynamic>?>();
      when(
        () => pluginSync.fetchSmartSearch(client, query),
      ).thenAnswer((_) => answer.future);
      return answer;
    }

    SearchViewModel newViewModel() => SearchViewModel(
      SearchRepository(client),
      client,
      pluginSync: pluginSync,
    );

    test('a slow answer fills in after the normal results are up', () {
      fakeAsync((async) {
        final answer = smartFor('jim carey mask');
        final vm = newViewModel();

        vm.searchImmediate('jim carey mask');
        async.elapse(const Duration(seconds: 2));

        expect(vm.state, SearchState.ready);
        expect(vm.smartResults.isEmpty, isTrue);

        answer.complete(_answer(['s1']));
        async.flushMicrotasks();

        expect(vm.smartResults.items.single.id, 's1');
        vm.dispose();
      });
    });

    test('an answer for an older query is ignored', () {
      fakeAsync((async) {
        final oldAnswer = smartFor('jim carey mask');
        smartFor('tom hanks island').complete(_answer(['s2']));
        final vm = newViewModel();

        vm.searchImmediate('jim carey mask');
        async.elapse(const Duration(seconds: 2));
        vm.searchImmediate('tom hanks island');
        async.elapse(const Duration(seconds: 2));
        oldAnswer.complete(_answer(['s1']));
        async.flushMicrotasks();

        expect(vm.smartResults.items.single.id, 's2');
        vm.dispose();
      });
    });

    test('a single word never asks the server', () {
      fakeAsync((async) {
        final vm = newViewModel();

        vm.searchImmediate('jumanji');
        async.elapse(const Duration(seconds: 2));

        expect(vm.state, SearchState.ready);
        verifyNever(() => pluginSync.fetchSmartSearch(client, any()));
        vm.dispose();
      });
    });
  });
}
