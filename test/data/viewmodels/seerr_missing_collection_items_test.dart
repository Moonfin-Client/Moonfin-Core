// The Spotlight collection cards fill in titles the library lacks from
// Seerr. Those items must look like every other Seerr item in the app so the
// Seerr detail route resolves them, must honour the adult-content filter, and
// must land in release order among the library's own members.
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';

AggregatedItem _library(String id, {String? tmdbId, String? premiere, int? year}) =>
    AggregatedItem(
      id: id,
      serverId: 'server-1',
      rawData: {
        'Id': id,
        'Name': id,
        'Type': 'Movie',
        if (tmdbId != null) 'ProviderIds': {'Tmdb': tmdbId},
        if (premiere != null) 'PremiereDate': premiere,
        if (year != null) 'ProductionYear': year,
      },
    );

void main() {
  group('seerrMissingCollectionItems', () {
    test('skips parts the library holds and shapes the rest as Seerr items', () {
      final missing = seerrMissingCollectionItems(
        parts: const [
          SeerrDiscoverItem(id: 603, title: 'In Library'),
          SeerrDiscoverItem(
            id: 604,
            title: 'Missing Sequel',
            posterPath: '/p.jpg',
            releaseDate: '2003-05-15',
            mediaInfo: SeerrMediaInfo(status: 3),
          ),
        ],
        libraryTmdbIds: {'603'},
        blockNsfw: true,
      );

      final item = missing.single;
      // A bare TMDB id plus the media type, never a pre-prefixed id: the
      // router adds the prefix itself and would otherwise double it.
      expect(item.id, '604');
      expect(item.serverId, 'seerr');
      expect(item.seerrMediaType, 'movie');
      expect(item.seerrStatus, 3);
      expect(item.tmdbId, '604');
      expect(item.name, 'Missing Sequel');
      expect(item.productionYear, 2003);
      expect(item.rawData['PosterPath'], '/p.jpg');
    });

    test('drops adult titles only while the NSFW filter is on', () {
      const parts = [
        SeerrDiscoverItem(id: 1, title: 'Fine'),
        SeerrDiscoverItem(id: 2, title: 'Adult', adult: true),
      ];

      expect(
        seerrMissingCollectionItems(
          parts: parts,
          libraryTmdbIds: const {},
          blockNsfw: true,
        ).map((i) => i.id),
        ['1'],
      );
      expect(
        seerrMissingCollectionItems(
          parts: parts,
          libraryTmdbIds: const {},
          blockNsfw: false,
        ).map((i) => i.id),
        ['1', '2'],
      );
    });
  });

  group('mergeMissingByReleaseOrder', () {
    test('slots missing titles by date without reordering the library', () {
      final library = [
        _library('a', premiere: '2010-01-01'),
        _library('b', premiere: '2013-01-01'),
      ];
      final missing = [
        _library('x', premiere: '2012-06-01'),
        _library('y', year: 2024),
      ];

      expect(
        mergeMissingByReleaseOrder(library, missing).map((i) => i.id),
        ['a', 'x', 'b', 'y'],
      );
    });

    test('an undated missing title goes last', () {
      final library = [_library('a', premiere: '2010-01-01')];
      expect(
        mergeMissingByReleaseOrder(library, [_library('z')]).map((i) => i.id),
        ['a', 'z'],
      );
    });

    test('nothing missing hands the library list back as is', () {
      final library = [_library('a')];
      expect(identical(mergeMissingByReleaseOrder(library, const []), library), isTrue);
    });
  });
}
