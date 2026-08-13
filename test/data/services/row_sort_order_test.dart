import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

/// Only the count matters, since it is what leaves the row with more to page.
AggregatedItem _item() =>
    const AggregatedItem(id: 'a', serverId: 'srv1', rawData: {});

/// Descending is the opposite of what the old hardcoded direction sent, so a
/// call site that kept it comes back as ascending.
Future<void> _preferDescending() async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  final prefs = UserPreferences(store);
  await prefs.set(UserPreferences.genresRowSortOrder, SortDirection.descending);
  await prefs.set(UserPreferences.audioRowsSortOrder, SortDirection.descending);
  GetIt.instance.registerSingleton<UserPreferences>(prefs);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(_preferDescending);
  tearDown(() => GetIt.instance.reset());

  Future<String?> capturedOrderFor(HomeRow row) async {
    final itemsApi = _MockItemsApi();
    when(
      () => itemsApi.getItems(
        genreIds: any(named: 'genreIds'),
        includeItemTypes: any(named: 'includeItemTypes'),
        excludeItemTypes: any(named: 'excludeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
      ),
    ).thenAnswer((_) async => {'Items': <dynamic>[], 'TotalRecordCount': 0});

    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);

    await RowDataSource(client).loadMore(row: row, serverId: 'srv1');

    final captured = verify(
      () => itemsApi.getItems(
        genreIds: any(named: 'genreIds'),
        includeItemTypes: any(named: 'includeItemTypes'),
        excludeItemTypes: any(named: 'excludeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: captureAny(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
      ),
    ).captured;
    return captured.first as String?;
  }

  test(
    'paging inside a genre keeps the direction the genre row was sorted by',
    () async {
      // A row id other than the whole genres list pages the items inside one
      // genre, which read ascending whatever the row was set to.
      final order = await capturedOrderFor(
        HomeRow(
          id: 'genre-42',
          title: 'Action',
          rowType: HomeRowType.genres,
          items: [_item()],
          totalCount: 50,
        ),
      );

      expect(order, SortDirection.descending.apiValue);
    },
  );

  test('paging an audio row keeps the direction it was sorted by', () async {
    final order = await capturedOrderFor(
      HomeRow(
        id: 'audio_artists',
        title: 'Artists',
        rowType: HomeRowType.audioArtists,
        items: [_item()],
        totalCount: 50,
      ),
    );

    expect(order, SortDirection.descending.apiValue);
  });
}
