import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() => GetIt.instance.reset());

  Future<void> preferSeriesType(RecentlyReleasedSeriesType type) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.recentlyReleasedSeriesType, type);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
  }

  Future<({String types, bool recursive})> requestFor(
    String? collectionType,
  ) async {
    final itemsApi = _MockItemsApi();
    when(
      () => itemsApi.getRecentlyReleasedItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: any(named: 'recursive'),
      ),
    ).thenAnswer((_) async => {'Items': <dynamic>[], 'TotalRecordCount': 0});

    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);

    await RowDataSource(
      client,
    ).loadRecentlyReleased('lib1', 'A library', 'srv1', collectionType);

    final captured = verify(
      () => itemsApi.getRecentlyReleasedItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: captureAny(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: captureAny(named: 'recursive'),
      ),
    ).captured;
    // Named arguments come back in whatever order the call recorded them.
    final types = captured.whereType<List<String>>();
    return (
      types: types.isEmpty ? 'anything' : types.first.join(','),
      recursive: captured.whereType<bool>().first,
    );
  }

  group('a library the row knows the shape of', () {
    test('movies are asked for below the library too', () async {
      final request = await requestFor('movies');
      expect(request.types, 'Movie');
      expect(request.recursive, isTrue);
    });

    test('books ask for both kinds a books library holds', () async {
      final request = await requestFor('books');
      expect(request.types, 'Book,AudioBook');
      expect(request.recursive, isTrue);
    });

    test('music stops at the album so tracks stay out of the row', () async {
      final request = await requestFor('music');
      expect(request.types, 'MusicAlbum');
      expect(request.recursive, isTrue);
    });

    test('a TV library follows the setting', () async {
      await preferSeriesType(RecentlyReleasedSeriesType.episode);
      final request = await requestFor('tvshows');
      expect(request.types, 'Episode');
      expect(request.recursive, isTrue);
    });
  });

  group('a library the row knows nothing about', () {
    // Going below it with nothing to ask for reaches every episode and track
    // under the library, and only a TV row folds those back up.
    test('a mixed library keeps to its top level', () async {
      final request = await requestFor('');
      expect(request.types, 'anything');
      expect(request.recursive, isFalse);
    });

    test('so does one whose kind is not covered', () async {
      final request = await requestFor('homevideos');
      expect(request.types, 'anything');
      expect(request.recursive, isFalse);
    });
  });

  test('a library that is not TV never reaches for the setting', () async {
    expect(GetIt.instance.isRegistered<UserPreferences>(), isFalse);
    final request = await requestFor('movies');
    expect(request.types, 'Movie');
    expect(request.recursive, isTrue);
  });
}
