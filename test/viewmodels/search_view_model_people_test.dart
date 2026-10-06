import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/viewmodels/search_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  late _MockClient client;
  late _MockItemsApi itemsApi;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    client = _MockClient();
    itemsApi = _MockItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.gamesApi).thenReturn(null);
  });

  tearDown(() => GetIt.instance.reset());

  void itemsFor(String term, List<(String, String)> items) {
    when(
      () => itemsApi.getItems(
        searchTerm: term,
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        recursive: any(named: 'recursive'),
        fields: any(named: 'fields'),
        studios: any(named: 'studios'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          for (final (id, type) in items) {'Id': id, 'Type': type, 'Name': id},
        ],
      },
    );
  }

  Completer<Map<String, dynamic>> peopleFor(String term) {
    final people = Completer<Map<String, dynamic>>();
    when(
      () => itemsApi.getPersons(
        searchTerm: term,
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
      ),
    ).thenAnswer((_) => people.future);
    return people;
  }

  Map<String, dynamic> person(String id) => {
    'Items': [
      {'Id': id, 'Name': id},
    ],
  };

  List<String> groupTypes(SearchViewModel vm) => [
    for (final group in vm.results) group.itemTypes.first,
  ];

  test('a slow people search fills in after the other results are up', () {
    fakeAsync((async) {
      itemsFor('alien', [('m1', 'Movie'), ('f1', 'Folder')]);
      final people = peopleFor('alien');
      final vm = SearchViewModel(SearchRepository(client), client);

      vm.searchImmediate('alien');
      async.elapse(const Duration(seconds: 1));

      expect(vm.state, SearchState.ready);
      expect(groupTypes(vm), ['Movie', 'Folder']);

      people.complete(person('p1'));
      async.flushMicrotasks();

      expect(groupTypes(vm), ['Movie', 'Person', 'Folder']);
      vm.dispose();
    });
  });

  test('people that answer in time come up with the rest at once', () {
    fakeAsync((async) {
      itemsFor('alien', [('m1', 'Movie')]);
      peopleFor('alien').complete(person('p1'));
      final vm = SearchViewModel(SearchRepository(client), client);
      var updates = 0;
      vm.addListener(() => updates++);

      vm.searchImmediate('alien');
      async.flushMicrotasks();

      expect(vm.state, SearchState.ready);
      expect(groupTypes(vm), ['Movie', 'Person']);
      async.elapse(const Duration(seconds: 15));
      expect(updates, 2);
      vm.dispose();
    });
  });

  test('with nothing else found the search waits for people', () {
    fakeAsync((async) {
      itemsFor('hanks', []);
      final people = peopleFor('hanks');
      final vm = SearchViewModel(SearchRepository(client), client);

      vm.searchImmediate('hanks');
      async.elapse(const Duration(seconds: 3));

      expect(vm.state, SearchState.loading);

      people.complete(person('p1'));
      async.flushMicrotasks();

      expect(vm.state, SearchState.ready);
      expect(groupTypes(vm), ['Person']);
      vm.dispose();
    });
  });

  test('a people search that never answers is given up on', () {
    fakeAsync((async) {
      itemsFor('hanks', []);
      peopleFor('hanks');
      final vm = SearchViewModel(SearchRepository(client), client);

      vm.searchImmediate('hanks');
      async.elapse(const Duration(seconds: 10));

      expect(vm.state, SearchState.ready);
      expect(vm.results, isEmpty);
      vm.dispose();
    });
  });

  test('people that answer late stay out of a newer search', () {
    fakeAsync((async) {
      itemsFor('alien', [('m1', 'Movie')]);
      final alienPeople = peopleFor('alien');
      itemsFor('aliens', [('m2', 'Movie')]);
      peopleFor('aliens').complete({'Items': []});
      final vm = SearchViewModel(SearchRepository(client), client);

      vm.searchImmediate('alien');
      async.elapse(const Duration(seconds: 1));
      vm.searchImmediate('aliens');
      async.flushMicrotasks();
      alienPeople.complete(person('p1'));
      async.flushMicrotasks();

      expect(groupTypes(vm), ['Movie']);
      expect(vm.results.single.items.single.id, 'm2');
      vm.dispose();
    });
  });

  test('people that answer after the screen closed are dropped', () {
    fakeAsync((async) {
      itemsFor('alien', [('m1', 'Movie')]);
      final people = peopleFor('alien');
      final vm = SearchViewModel(SearchRepository(client), client);

      vm.searchImmediate('alien');
      async.elapse(const Duration(seconds: 1));
      vm.dispose();
      people.complete(person('p1'));
      async.flushMicrotasks();

      expect(groupTypes(vm), ['Movie']);
    });
  });

  test('a library scoped search never asks for people', () {
    fakeAsync((async) {
      itemsFor('dune', [('b1', 'Book')]);
      final vm = SearchViewModel(
        SearchRepository(client),
        client,
        scopedParentId: 'books',
      );

      vm.searchImmediate('dune');
      async.flushMicrotasks();

      expect(vm.state, SearchState.ready);
      expect(groupTypes(vm), ['Book', 'AudioBook']);
      verifyNever(
        () => itemsApi.getPersons(
          searchTerm: any(named: 'searchTerm'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
        ),
      );
      vm.dispose();
    });
  });
}
