// The filler tops up a thin candidate pool and stops after a fixed number of
// extras, so asking for more than it can add must not cost a fetch.
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _RecordingItemsApi extends Fake implements ItemsApi {
  final List<Map<Symbol, dynamic>> calls = [];
  List<Map<String, dynamic>> pool = const [];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    calls.add(invocation.namedArguments);
    return Future.value(<String, dynamic>{'Items': pool});
  }

  bool get fetchedFiller =>
      calls.any((c) => c[#sortBy] == 'ProductionYear,SortName');
}

List<Map<String, dynamic>> _pool(int count) => [
      for (var i = 0; i < count; i++)
        <String, dynamic>{
          'Id': 'cand$i',
          'Name': 'Candidate $i',
          'Genres': ['Action'],
        },
    ];

final _seed = AggregatedItem(
  id: 'seed',
  serverId: 'srv',
  rawData: const {
    'Id': 'seed',
    'Name': 'Seed',
    'Type': 'Movie',
    'Genres': ['Action'],
  },
);

void main() {
  late _RecordingItemsApi api;
  late RowDataSource dataSource;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    RowDataSource.clearRecommendationCache();
    api = _RecordingItemsApi();
    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(api);
    dataSource = RowDataSource(client);
  });

  test("a home row over fetching does not pay for filler it can't use", () async {
    api.pool = _pool(40);

    await dataSource.getRecommendations(
      serverId: 'srv',
      baseItem: _seed,
      isLocal: true,
      limit: 100,
      includeWatched: true,
    );

    expect(api.fetchedFiller, isFalse);
  });

  test('a thin pool still gets topped up', () async {
    api.pool = _pool(5);

    await dataSource.getRecommendations(
      serverId: 'srv',
      baseItem: _seed,
      isLocal: true,
      limit: 20,
      includeWatched: true,
    );

    expect(api.fetchedFiller, isTrue);
  });
}
