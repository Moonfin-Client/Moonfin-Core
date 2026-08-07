import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockViewsRepository extends Mock implements UserViewsRepository {}

AggregatedLibrary _library(String id, String collectionType) =>
    AggregatedLibrary(
      id: id,
      name: id,
      collectionType: collectionType,
      serverId: 'srv1',
    );

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

/// Captures the parentId of every Movie search the Rewatch row makes.
List<String?> _movieParents(_MockItemsApi items) => verify(
  () => items.getItems(
    parentId: captureAny(named: 'parentId'),
    includeItemTypes: const ['Movie'],
    filters: any(named: 'filters'),
    sortBy: any(named: 'sortBy'),
    sortOrder: any(named: 'sortOrder'),
    recursive: any(named: 'recursive'),
    limit: any(named: 'limit'),
    fields: any(named: 'fields'),
    enableImageTypes: any(named: 'enableImageTypes'),
    imageTypeLimit: any(named: 'imageTypeLimit'),
  ),
).captured.cast<String?>();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockItemsApi items;
  late _MockViewsRepository views;

  setUp(() async {
    items = _MockItemsApi();
    views = _MockViewsRepository();

    when(
      () => items.getItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        filters: any(named: 'filters'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
      ),
    ).thenAnswer((_) async => {'Items': <dynamic>[], 'TotalRecordCount': 0});

    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(items);

    await GetIt.instance.reset();
    GetIt.instance.registerSingleton<UserPreferences>(await _prefs());
    GetIt.instance.registerSingleton<UserViewsRepository>(views);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() => GetIt.instance.reset());

  test('sweeps the server when nothing is hidden', () async {
    when(() => views.getMyMediaExcludes()).thenAnswer((_) async => <String>{});

    await RowDataSource(
      GetIt.instance<MediaServerClient>(),
    ).loadRewatchRow('srv1');

    expect(_movieParents(items), [null]);
    verifyNever(() => views.getUserViews());
  });

  test('searches only the libraries still on My Media', () async {
    when(
      () => views.getMyMediaExcludes(),
    ).thenAnswer((_) async => {'hidden-movies'});
    when(() => views.getUserViews()).thenAnswer(
      (_) async => [
        _library('movies-a', 'movies'),
        _library('movies-b', 'movies'),
        _library('shows', 'tvshows'),
      ],
    );

    await RowDataSource(
      GetIt.instance<MediaServerClient>(),
    ).loadRewatchRow('srv1');

    expect(_movieParents(items), unorderedEquals(['movies-a', 'movies-b']));
  });

  test(
    'takes a library that claims no type as able to hold anything',
    () async {
      when(
        () => views.getMyMediaExcludes(),
      ).thenAnswer((_) async => {'hidden'});
      when(() => views.getUserViews()).thenAnswer(
        (_) async => [_library('mixed', ''), _library('music', 'music')],
      );

      await RowDataSource(
        GetIt.instance<MediaServerClient>(),
      ).loadRewatchRow('srv1');

      expect(_movieParents(items), ['mixed']);
    },
  );

  test('falls back to the sweep when no library could hold the type', () async {
    when(() => views.getMyMediaExcludes()).thenAnswer((_) async => {'hidden'});
    when(
      () => views.getUserViews(),
    ).thenAnswer((_) async => [_library('music', 'music')]);

    await RowDataSource(
      GetIt.instance<MediaServerClient>(),
    ).loadRewatchRow('srv1');

    expect(_movieParents(items), [null]);
  });

  test('sweeps the server when the views cant be read', () async {
    when(() => views.getMyMediaExcludes()).thenThrow(Exception('offline'));

    await RowDataSource(
      GetIt.instance<MediaServerClient>(),
    ).loadRewatchRow('srv1');

    expect(_movieParents(items), [null]);
  });
}
