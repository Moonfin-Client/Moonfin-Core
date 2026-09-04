import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_slider_catalog.dart';

SeerrDiscoverSlider _slider({
  int id = 1,
  required int type,
  String? title = 'Custom Row',
  String? data = '123',
  bool enabled = true,
  bool isBuiltIn = false,
  int order = 0,
  String? sort,
}) => SeerrDiscoverSlider(
  id: id,
  type: type,
  title: title,
  data: data,
  enabled: enabled,
  isBuiltIn: isBuiltIn,
  order: order,
  sort: sort,
);

void main() {
  group('resolveSeerrSliderCatalog', () {
    test('maps TMDB movie keyword', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbMovieKeyword, data: '123,456'),
      );
      expect(catalog?.path, 'discover/movies');
      expect(catalog?.query, {'keywords': '123,456'});
      expect(catalog?.title, 'Custom Row');
      expect(catalog?.mediaTypeHint, 'movie');
    });

    test('maps TMDB tv keyword', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbTvKeyword),
      );
      expect(catalog?.path, 'discover/tv');
      expect(catalog?.query, {'keywords': '123'});
      expect(catalog?.mediaTypeHint, 'tv');
    });

    test('maps TMDB movie genre', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbMovieGenre, data: '28'),
      );
      expect(catalog?.path, 'discover/movies');
      expect(catalog?.query, {'genre': '28'});
      expect(catalog?.mediaTypeHint, 'movie');
    });

    test('maps TMDB tv genre', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbTvGenre, data: '18'),
      );
      expect(catalog?.path, 'discover/tv');
      expect(catalog?.query, {'genre': '18'});
      expect(catalog?.mediaTypeHint, 'tv');
    });

    test('maps TMDB search', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbSearch, data: 'star wars'),
      );
      expect(catalog?.path, 'search');
      expect(catalog?.query, {'query': 'star wars'});
      expect(catalog?.mediaTypeHint, isNull);
    });

    test('maps TMDB studio', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbStudio, data: '420'),
      );
      expect(catalog?.path, 'discover/movies/studio/420');
      expect(catalog?.query, isEmpty);
      expect(catalog?.mediaTypeHint, 'movie');
    });

    test('maps TMDB network', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbNetwork, data: '213'),
      );
      expect(catalog?.path, 'discover/tv/network/213');
      expect(catalog?.query, isEmpty);
      expect(catalog?.mediaTypeHint, 'tv');
    });

    test('maps TMDB movie streaming from region,provider', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbMovieStreaming, data: 'US,8'),
      );
      expect(catalog?.path, 'discover/movies');
      expect(catalog?.query, {'watchRegion': 'US', 'watchProviders': '8'});
      expect(catalog?.mediaTypeHint, 'movie');
    });

    test('maps TMDB tv streaming from region,provider', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.tmdbTvStreaming, data: 'GB,9'),
      );
      expect(catalog?.path, 'discover/tv');
      expect(catalog?.query, {'watchRegion': 'GB', 'watchProviders': '9'});
      expect(catalog?.mediaTypeHint, 'tv');
    });

    test('skips streaming data that is not region,provider', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(type: SeerrSliderType.tmdbMovieStreaming, data: 'US'),
        ),
        isNull,
      );
    });

    test('maps trakt list', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(
          type: SeerrSliderType.traktList,
          data: 'https://trakt.tv/users/foo/lists/bar',
        ),
      );
      expect(catalog?.path, 'discover/trakt/list');
      expect(catalog?.query, {'url': 'https://trakt.tv/users/foo/lists/bar'});
    });

    test('maps anilist list', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(type: SeerrSliderType.anilistList, data: 'Watching'),
      );
      expect(catalog?.path, 'discover/anilist/list');
      expect(catalog?.query, {'name': 'Watching'});
    });

    test('maps mdblist list', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(
          type: SeerrSliderType.mdblistList,
          data: 'https://mdblist.com/lists/foo/bar',
        ),
      );
      expect(catalog?.path, 'discover/mdblist/list');
      expect(catalog?.query, {'url': 'https://mdblist.com/lists/foo/bar'});
    });

    test('maps built-in trakt recommendations with no data', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(
          type: SeerrSliderType.traktRecommendations,
          title: null,
          data: '',
          isBuiltIn: true,
        ),
      );
      expect(catalog?.path, 'discover/trakt/recommendations');
      expect(catalog?.query, isEmpty);
      expect(catalog?.title, 'Trakt Recommendations');
      expect(catalog?.type, SeerrSliderType.traktRecommendations);
    });

    test('maps built-in anilist watching and simkl library status', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(
            type: SeerrSliderType.anilistWatching,
            title: null,
            data: '',
            isBuiltIn: true,
          ),
        )?.path,
        'discover/anilist/watching',
      );
      expect(
        resolveSeerrSliderCatalog(
          _slider(
            type: SeerrSliderType.simklPlanToWatch,
            title: null,
            data: '',
            isBuiltIn: true,
          ),
        )?.query,
        {'status': 'plantowatch'},
      );
    });

    test('passes sort through when set', () {
      final catalog = resolveSeerrSliderCatalog(
        _slider(
          type: SeerrSliderType.traktList,
          data: 'https://trakt.tv/users/foo/lists/bar',
          sort: 'rank',
        ),
      );
      expect(catalog?.query, {
        'url': 'https://trakt.tv/users/foo/lists/bar',
        'sort': 'rank',
      });
    });

    test('skips unknown types', () {
      expect(resolveSeerrSliderCatalog(_slider(type: 99)), isNull);
    });

    test('skips sliders without a usable id', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(id: 0, type: SeerrSliderType.tmdbMovieKeyword),
        ),
        isNull,
      );
    });

    test('skips stock built-in trending that Moonfin already renders locally', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(type: 4, title: 'Trending', data: '', isBuiltIn: true),
        ),
        isNull,
      );
    });

    test('skips retired simkl premiere types', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(type: 38, title: null, data: '', isBuiltIn: true),
        ),
        isNull,
      );
    });

    test('skips disabled sliders', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(type: SeerrSliderType.tmdbMovieKeyword, enabled: false),
        ),
        isNull,
      );
    });

    test('skips missing data', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(type: SeerrSliderType.tmdbMovieKeyword, data: ''),
        ),
        isNull,
      );
    });

    test('skips missing title', () {
      expect(
        resolveSeerrSliderCatalog(
          _slider(type: SeerrSliderType.tmdbMovieKeyword, title: '  '),
        ),
        isNull,
      );
    });
  });

  test('resolveSeerrCustomSliders keeps server order and drops skips', () {
    final resolved = resolveSeerrCustomSliders([
      _slider(
        id: 2,
        type: SeerrSliderType.tmdbTvGenre,
        order: 5,
        title: 'Drama',
      ),
      _slider(id: 1, type: 4, order: 1, title: 'Trending', isBuiltIn: true),
      _slider(
        id: 3,
        type: SeerrSliderType.tmdbMovieKeyword,
        order: 2,
        title: 'Christmas',
      ),
      _slider(
        id: 4,
        type: SeerrSliderType.traktRecommendations,
        order: 3,
        title: null,
        data: '',
        isBuiltIn: true,
      ),
    ]);
    expect(resolved.map((e) => e.$1.id), [3, 4, 2]);
    expect(resolved.map((e) => e.$2.title), [
      'Christmas',
      'Trakt Recommendations',
      'Drama',
    ]);
  });

  group('SeerrDiscoverSlider.fromJson', () {
    test('reads the fields settings/discover actually sends', () {
      final slider = SeerrDiscoverSlider.fromJson({
        'id': 12,
        'type': 13,
        'order': 4,
        'isBuiltIn': false,
        'enabled': true,
        'title': 'Christmas',
        'data': '123,456',
        'sort': 'rank',
      });
      expect(slider.id, 12);
      expect(slider.type, SeerrSliderType.tmdbMovieKeyword);
      expect(slider.order, 4);
      expect(slider.isBuiltIn, isFalse);
      expect(slider.enabled, isTrue);
      expect(slider.title, 'Christmas');
      expect(slider.data, '123,456');
      expect(slider.sort, 'rank');
    });

    test('treats a missing enabled flag as on, matching Seerr defaults', () {
      final slider = SeerrDiscoverSlider.fromJson({
        'id': 1,
        'type': 13,
        'title': 'X',
        'data': '1',
      });
      expect(slider.enabled, isTrue);
      expect(slider.isBuiltIn, isFalse);
      expect(slider.sort, isNull);
    });

    test('does not treat a built-in trending row as custom', () {
      final slider = SeerrDiscoverSlider.fromJson({
        'id': 1,
        'type': 4,
        'isBuiltIn': true,
        'enabled': true,
      });
      expect(resolveSeerrSliderCatalog(slider), isNull);
    });
  });

  group('seerrDiscoverFocusHubKey', () {
    test('keys a builtin by type name, not list index', () {
      expect(
        seerrDiscoverFocusHubKey(typeName: 'trending'),
        'seerr_discover_trending',
      );
    });

    test('keys a custom row by slider id', () {
      expect(
        seerrDiscoverFocusHubKey(sliderId: 42, typeName: 'trending'),
        'seerr_discover_slider_42',
      );
    });

    test('does not collide two custom rows', () {
      expect(
        seerrDiscoverFocusHubKey(sliderId: 1),
        isNot(seerrDiscoverFocusHubKey(sliderId: 2)),
      );
    });
  });
}
