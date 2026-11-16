import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/models/media_bar_state.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/custom_external_lists_service.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _ImageApi extends Mock implements ImageApi {}

class _UserViewsApi extends Mock implements UserViewsApi {}

class _Sync extends Mock implements PluginSyncService {}

class _Lists extends Mock implements CustomExternalListsService {}

class _Tmdb extends Mock implements TmdbRepository {}

ImdbExternalListItem _title(
  String tmdbId, {
  String type = 'Movie',
  String? rating = 'PG-13',
  String? backdrop = '/list.jpg',
}) => ImdbExternalListItem(
  imdbId: 'tt$tmdbId',
  tmdbId: tmdbId,
  title: 'Title $tmdbId',
  type: type,
  backdropUrl: backdrop,
  posterUrl: '/poster.jpg',
  rating: 7.0,
  officialRating: rating,
);

void main() {
  setUpAll(() {
    registerFallbackValue(
      HomeSectionConfig.pluginDynamic(
        serverId: 'seerr',
        pluginSection: 'x',
        pluginDisplayText: 'x',
        pluginSource: HomeSectionPluginSource.custom,
      ),
    );
  });

  tearDown(() => GetIt.instance.reset());

  Future<List<MediaBarSlideItem>> load({
    required Map<String, List<ImdbExternalListItem>> lists,
    String contentType = 'both',
    String libraryIds = '',
    String blocked = '',
    Map<String, Map<String, dynamic>> details = const {},
  }) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    await prefs.set(UserPreferences.mediaBarItemCount, '10');
    await prefs.set(UserPreferences.mediaBarContentType, contentType);
    await prefs.set(UserPreferences.mediaBarExternalLists, lists.keys.join(','));
    await prefs.set(UserPreferences.mediaBarLibraryIds, libraryIds);
    await prefs.set(UserPreferences.blockedParentalRatings, blocked);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final sync = _Sync();
    when(() => sync.pluginAvailable).thenReturn(true);
    when(() => sync.tmdbAvailable).thenReturn(true);
    when(() => sync.tmdbDetailsAvailable).thenReturn(true);
    when(() => sync.tmdbThumbsAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    final service = _Lists();
    when(
      () => service.loadCustomRowFromCache(any(), maxAge: any(named: 'maxAge')),
    ).thenAnswer((_) async => const []);
    when(() => service.fetchCustomRow(any())).thenAnswer((invocation) async {
      final config = invocation.positionalArguments.first as HomeSectionConfig;
      return lists[config.pluginSection] ?? const [];
    });
    GetIt.instance.registerSingleton<CustomExternalListsService>(service);

    final tmdb = _Tmdb();
    when(
      () => tmdb.titleDetails(
        type: any(named: 'type'),
        tmdbId: any(named: 'tmdbId'),
        imdbId: any(named: 'imdbId'),
      ),
    ).thenAnswer(
      (invocation) async => details[invocation.namedArguments[#tmdbId]],
    );
    GetIt.instance.registerSingleton<TmdbRepository>(tmdb);

    final views = _UserViewsApi();
    when(() => views.getUserViews()).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'lib', 'Name': 'Movies', 'CollectionType': 'movies'},
        ],
      },
    );
    final items = _ItemsApi();
    when(
      () => items.getItems(
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
      ),
    ).thenAnswer((invocation) async {
      if (invocation.namedArguments[#limit] == 1) {
        return {'Items': const [], 'TotalRecordCount': 3};
      }
      return {
        'Items': [
          for (var i = 0; i < 3; i++)
            {
              'Id': 'own$i',
              'Type': 'Movie',
              'BackdropImageTags': ['b'],
            },
        ],
      };
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
    return (state as MediaBarReady).items;
  }

  test('fills an outside slide in from TMDB', () async {
    final slides = await load(
      lists: {
        'imdb_top_250_movies': [_title('27205')],
      },
      details: {
        '27205': {
          'overview': 'A thief who steals secrets.',
          'rating': 8.4,
          'genres': ['Action', 'Science Fiction'],
          'runTimeTicks': 88800000000,
          'backdropPath': '/plain.jpg',
          'logoPath': '/logo.png',
          'trailerUrl': 'https://www.youtube.com/watch?v=abc',
        },
      },
    );

    final slide = slides.single;
    expect(slide.isExternal, isTrue);
    expect(slide.itemId, '27205');
    expect(slide.overview, 'A thief who steals secrets.');
    expect(slide.communityRating, 8.4);
    expect(slide.officialRating, 'PG-13');
    expect(slide.runtime, const Duration(minutes: 148));
    expect(slide.backdropUrl, 'https://image.tmdb.org/t/p/w1280/plain.jpg');
    expect(slide.logoUrl, 'https://image.tmdb.org/t/p/w500/logo.png');
    expect(slide.remoteTrailers.single['Url'], contains('abc'));
  });

  test('keeps to the content type and drops repeats and blocked titles', () async {
    final slides = await load(
      contentType: 'movies',
      blocked: 'R',
      lists: {
        'imdb_top_250_movies': [_title('1'), _title('2', rating: 'R')],
        'tmdb_popular_movies': [_title('1'), _title('3', rating: null)],
        'tmdb_popular_tv': [_title('4', type: 'Series')],
      },
    );

    expect(slides.map((s) => s.itemId), ['1']);
    expect(slides.single.backdropUrl, 'https://image.tmdb.org/t/p/w1280/list.jpg');
  });

  test('mixes picked lists in with a picked library', () async {
    final slides = await load(
      libraryIds: 'lib',
      lists: {
        'imdb_top_250_movies': [_title('1'), _title('2')],
      },
    );

    expect(slides.where((s) => s.isExternal), hasLength(2));
    expect(slides.where((s) => !s.isExternal), hasLength(3));
  });

  test('falls back to the libraries when the lists come back empty', () async {
    final slides = await load(lists: {'imdb_top_250_movies': const []});

    expect(slides, isNotEmpty);
    expect(slides.every((s) => !s.isExternal), isTrue);
  });
}
