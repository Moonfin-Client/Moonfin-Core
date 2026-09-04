import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_catalog_item.dart';

void main() {
  group('seerrCatalogTmdbId', () {
    test('stock TMDB discover uses id when mapping fields are absent', () {
      expect(seerrCatalogTmdbId({'id': 550, 'title': 'Fight Club'}), 550);
    });

    test('mapped list tile uses tmdbId, not the list id', () {
      expect(
        seerrCatalogTmdbId({
          'id': 999001,
          'tmdbId': 550,
          'mappingState': {'state': 'mapped'},
        }),
        550,
      );
    });

    test('accepts numeric ids encoded as strings', () {
      expect(seerrCatalogTmdbId({'tmdbId': '550'}), 550);
      expect(seerrCatalogTmdbId({'id': '551'}), 551);
    });

    test('unmapped list tile is not a TMDB id, even when id is set', () {
      expect(
        seerrCatalogTmdbId({
          'id': 999001,
          'title': 'Some anime',
          'mappingState': {'state': 'unmapped'},
        }),
        isNull,
      );
    });

    test('ambiguous and pending tiles are not TMDB ids', () {
      expect(
        seerrCatalogTmdbId({
          'id': 1,
          'tmdbId': 550,
          'mappingState': {'state': 'ambiguous'},
        }),
        isNull,
      );
      expect(
        seerrCatalogTmdbId({
          'id': 1,
          'mappingState': {'state': 'pending'},
        }),
        isNull,
      );
    });

    test('tmdbId of 0 is not usable', () {
      expect(seerrCatalogTmdbId({'id': 12, 'tmdbId': 0}), isNull);
    });

    test('mapped state without tmdbId does not fall back to a provider id', () {
      expect(
        seerrCatalogTmdbId({
          'id': 999001,
          'mappingState': {'state': 'mapped'},
        }),
        isNull,
      );
    });
  });

  group('normalizeSeerrCatalogItem', () {
    test('keeps a stock TMDB result', () {
      final item = normalizeSeerrCatalogItem({
        'id': 550,
        'title': 'Fight Club',
        'posterPath': '/poster.jpg',
      });
      expect(item?['id'], 550);
      expect(item?['posterPath'], '/poster.jpg');
    });

    test('rewrites id to tmdbId for a mapped list tile', () {
      final item = normalizeSeerrCatalogItem({
        'id': 999001,
        'tmdbId': 550,
        'title': 'Fight Club',
        'mappingState': {'state': 'mapped'},
      });
      expect(item?['id'], 550);
    });

    test('drops an unmapped list tile instead of opening /movie/{traktId}', () {
      expect(
        normalizeSeerrCatalogItem({
          'id': 999001,
          'title': 'Unmapped',
          'mappingState': {'state': 'unmapped'},
          'source': 'trakt',
        }),
        isNull,
      );
    });

    test('drops people', () {
      expect(
        normalizeSeerrCatalogItem({'id': 1, 'mediaType': 'person'}),
        isNull,
      );
    });

    test('fills mediaType from the catalog hint', () {
      final item = normalizeSeerrCatalogItem({
        'id': 550,
        'title': 'Fight Club',
      }, mediaTypeHint: 'movie');
      expect(item?['mediaType'], 'movie');
    });
  });
}
