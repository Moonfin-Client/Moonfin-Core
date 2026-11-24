import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _ImageApi extends Mock implements ImageApi {}

class _UserViewsApi extends Mock implements UserViewsApi {}

Map<String, dynamic> _movie(
  String id, {
  String? name,
  String? dateCreated,
  String? premiereDate,
  int? year,
}) => {
  'Id': id,
  'Name': name ?? id,
  'Type': 'Movie',
  'BackdropImageTags': const ['b'],
  'DateCreated': ?dateCreated,
  'PremiereDate': ?premiereDate,
  'ProductionYear': ?year,
};

void main() {
  tearDown(() => GetIt.instance.reset());

  Future<List<String>> loadBar({
    required String source,
    required String sortOrder,
    required int itemCount,
    required Map<String, List<Map<String, dynamic>>> libraryItems,
  }) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    await prefs.set(UserPreferences.mediaBarItemCount, '$itemCount');
    await prefs.set(UserPreferences.mediaBarSourceType, source);
    await prefs.set(UserPreferences.mediaBarSortOrder, sortOrder);
    await prefs.set(UserPreferences.mediaBarNewReleaseBanner, false);

    final views = _UserViewsApi();
    when(() => views.getUserViews()).thenAnswer(
      (_) async => {
        'Items': [
          for (final id in libraryItems.keys)
            {'Id': id, 'Name': id, 'CollectionType': 'movies'},
        ],
      },
    );

    final items = _ItemsApi();
    when(
      () => items.getLatestItems(
        includeItemTypes: any(named: 'includeItemTypes'),
        parentId: any(named: 'parentId'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
      ),
    ).thenAnswer((inv) async {
      final parentId = inv.namedArguments[#parentId] as String;
      return {'Items': libraryItems[parentId] ?? const []};
    });

    when(
      () => items.getRecentlyReleasedItems(
        includeItemTypes: any(named: 'includeItemTypes'),
        parentId: any(named: 'parentId'),
        recursive: any(named: 'recursive'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        hideWatched: any(named: 'hideWatched'),
      ),
    ).thenAnswer((inv) async {
      final parentId = inv.namedArguments[#parentId] as String;
      return {'Items': libraryItems[parentId] ?? const []};
    });

    when(
      () => items.getItems(
        ids: any(named: 'ids'),
        includeItemTypes: any(named: 'includeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        parentId: any(named: 'parentId'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableImageTypes: any(named: 'enableImageTypes'),
        minPremiereDate: any(named: 'minPremiereDate'),
        filters: any(named: 'filters'),
      ),
    ).thenAnswer((inv) async {
      final parentId = inv.namedArguments[#parentId] as String?;
      return {'Items': libraryItems[parentId] ?? const []};
    });

    final images = _ImageApi();
    when(
      () => images.getBackdropImageUrl(
        any(),
        tag: any(named: 'tag'),
        maxWidth: any(named: 'maxWidth'),
      ),
    ).thenReturn('backdrop');
    when(
      () => images.getPrimaryImageUrl(
        any(),
        tag: any(named: 'tag'),
        maxWidth: any(named: 'maxWidth'),
      ),
    ).thenReturn('primary');

    final client = _Client();
    when(() => client.userViewsApi).thenReturn(views);
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.imageApi).thenReturn(images);

    final repo = MediaBarRepository(client, prefs);
    GetIt.instance.registerSingleton<MediaBarRepository>(repo);
    final state = await repo.loadItems();
    return (state as MediaBarReady).items.map((item) => item.itemId).toList();
  }

  group('UserPreferences.normalizeMediaBarSortOrder', () {
    test('normalizes valid values case-insensitively and defaults to default', () {
      expect(
        UserPreferences.normalizeMediaBarSortOrder('DATEADDEDDESC'),
        UserPreferences.mediaBarSortDateAddedDesc,
      );
      expect(
        UserPreferences.normalizeMediaBarSortOrder(' releaseDateAsc '),
        UserPreferences.mediaBarSortReleaseDateAsc,
      );
      expect(
        UserPreferences.normalizeMediaBarSortOrder('random'),
        UserPreferences.mediaBarSortRandom,
      );
      expect(
        UserPreferences.normalizeMediaBarSortOrder('unknown'),
        UserPreferences.mediaBarSortDefault,
      );
      expect(
        UserPreferences.normalizeMediaBarSortOrder(null),
        UserPreferences.mediaBarSortDefault,
      );
    });
  });

  group('MediaBarRepository post-selection sort order', () {
    final libraries = {
      'libA': [
        _movie(
          'a1',
          dateCreated: '2026-11-20T12:00:00Z',
          premiereDate: '2020-05-01T00:00:00Z',
        ),
        _movie(
          'a2',
          dateCreated: '2026-11-18T12:00:00Z',
          premiereDate: '2026-10-01T00:00:00Z',
        ),
        _movie(
          'a3_unselected',
          dateCreated: '2026-10-01T12:00:00Z',
          premiereDate: '2026-11-22T00:00:00Z',
        ),
      ],
      'libB': [
        _movie(
          'b1',
          dateCreated: '2026-11-19T12:00:00Z',
          premiereDate: '2023-01-01T00:00:00Z',
        ),
      ],
    };

    test('default preserves the source round-robin order untouched', () async {
      final ids = await loadBar(
        source: UserPreferences.mediaBarSourceRecentlyAdded,
        sortOrder: UserPreferences.mediaBarSortDefault,
        itemCount: 3,
        libraryItems: libraries,
      );
      expect(ids, ['a1', 'b1', 'a2']);
    });

    test('dateAdded and releaseDate re-order only the selected set', () async {
      final addedDesc = await loadBar(
        source: UserPreferences.mediaBarSourceRecentlyAdded,
        sortOrder: UserPreferences.mediaBarSortDateAddedDesc,
        itemCount: 3,
        libraryItems: libraries,
      );
      expect(addedDesc, ['a1', 'b1', 'a2']);

      await GetIt.instance.reset();
      final addedAsc = await loadBar(
        source: UserPreferences.mediaBarSourceRecentlyAdded,
        sortOrder: UserPreferences.mediaBarSortDateAddedAsc,
        itemCount: 3,
        libraryItems: libraries,
      );
      expect(addedAsc, ['a2', 'b1', 'a1']);

      await GetIt.instance.reset();
      // a3_unselected has the newest premiere date but was not in the selected 3.
      final releaseDesc = await loadBar(
        source: UserPreferences.mediaBarSourceRecentlyAdded,
        sortOrder: UserPreferences.mediaBarSortReleaseDateDesc,
        itemCount: 3,
        libraryItems: libraries,
      );
      expect(releaseDesc, ['a2', 'b1', 'a1']);

      await GetIt.instance.reset();
      final releaseAsc = await loadBar(
        source: UserPreferences.mediaBarSourceRecentlyAdded,
        sortOrder: UserPreferences.mediaBarSortReleaseDateAsc,
        itemCount: 3,
        libraryItems: libraries,
      );
      expect(releaseAsc, ['a1', 'b1', 'a2']);

      await GetIt.instance.reset();
      final randomized = await loadBar(
        source: UserPreferences.mediaBarSourceRecentlyAdded,
        sortOrder: UserPreferences.mediaBarSortRandom,
        itemCount: 3,
        libraryItems: libraries,
      );
      expect(randomized.toSet(), {'a1', 'b1', 'a2'});
    });

    test('Series uses DateLastMediaAdded over original series DateCreated', () async {
      final mixed = {
        'lib': [
          {
            'Id': 'long_running_series',
            'Name': 'Yellowjackets',
            'Type': 'Series',
            'BackdropImageTags': const ['b'],
            'DateCreated': '2021-11-14T00:00:00Z',
            'DateLastMediaAdded': '2026-11-23T18:00:00Z',
            'PremiereDate': '2021-11-14T00:00:00Z',
          },
          _movie(
            'recent_movie',
            dateCreated: '2026-11-20T12:00:00Z',
            premiereDate: '2026-11-01T00:00:00Z',
          ),
        ],
      };

      final desc = await loadBar(
        source: UserPreferences.mediaBarSourceRandom,
        sortOrder: UserPreferences.mediaBarSortDateAddedDesc,
        itemCount: 2,
        libraryItems: mixed,
      );
      expect(desc, ['long_running_series', 'recent_movie']);
    });

    test('Items without dates sort to the end regardless of direction', () async {
      final undated = {
        'lib': [
          _movie('undated', name: 'A Undated'),
          _movie(
            'older',
            dateCreated: '2026-01-01T00:00:00Z',
            premiereDate: '2020-01-01T00:00:00Z',
          ),
          _movie(
            'newer',
            dateCreated: '2026-06-01T00:00:00Z',
            premiereDate: '2025-01-01T00:00:00Z',
          ),
        ],
      };

      final desc = await loadBar(
        source: UserPreferences.mediaBarSourceRandom,
        sortOrder: UserPreferences.mediaBarSortDateAddedDesc,
        itemCount: 3,
        libraryItems: undated,
      );
      expect(desc, ['newer', 'older', 'undated']);

      await GetIt.instance.reset();
      final asc = await loadBar(
        source: UserPreferences.mediaBarSourceRandom,
        sortOrder: UserPreferences.mediaBarSortDateAddedAsc,
        itemCount: 3,
        libraryItems: undated,
      );
      expect(asc, ['older', 'newer', 'undated']);
    });
  });
}
