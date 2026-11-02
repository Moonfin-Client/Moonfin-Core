import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

Map<String, dynamic> _json(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;

/// Every object in [node] that has a string `Type` and an `Id`: the items in
/// an Emby fixture.
Iterable<Map<String, dynamic>> _embyItems(Object? node) sync* {
  if (node is Map<String, dynamic>) {
    if (node['Type'] is String && node.containsKey('Id')) yield node;
    for (final v in node.values) {
      yield* _embyItems(v);
    }
  } else if (node is List) {
    for (final v in node) {
      yield* _embyItems(v);
    }
  }
}

void main() {
  group('ticks', () {
    test('seconds, minutes and milliseconds convert to Jellyfin ticks', () {
      expect(secondsToTicks(1), 10000000);
      expect(secondsToTicks(1.5), 15000000);
      expect(minutesToTicks(1), 600000000);
      expect(millisecondsToTicks(250), 2500000);
    });

    test('round-trip without drift', () {
      for (final seconds in [0, 1, 59.5, 7445, 86399.999]) {
        expect(ticksToSeconds(secondsToTicks(seconds)), closeTo(seconds, 1e-7));
      }
      for (final ms in [0, 1, 999, 7445000]) {
        expect(ticksToMilliseconds(millisecondsToTicks(ms)), ms);
      }
    });

    test('the movie fixture: runtime in minutes, file duration in seconds', () {
      final movie = _json('silo/catalog_item_movie.json');
      expect(minutesToTicksOrNull(movie['runtime']), minutesToTicks(124));
      final version = (movie['versions'] as List).first as Map;
      expect(secondsToTicksOrNull(version['duration']), secondsToTicks(7445));
      // The two describe the same film, a minute or so apart.
      expect((ticksToSeconds(minutesToTicks(124)) - 7445).abs(), lessThan(60));
    });

    test('missing or unknown values give null', () {
      expect(secondsToTicksOrNull(null), isNull);
      expect(secondsToTicksOrNull('12'), isNull);
      expect(minutesToTicksOrNull(0), isNull);
      expect(minutesToTicksOrNull(null), isNull);
    });
  });

  group('ids', () {
    test('Silo ids pass through as strings', () {
      expect(siloIdOf('movie-imdb-tt0295701'), 'movie-imdb-tt0295701');
      expect(siloIdOf(146552272560604468), '146552272560604468');
      expect(siloIdOf('  9 '), '9');
      expect(siloIdOf(''), isNull);
      expect(siloIdOf(null), isNull);
    });

    test('genre and studio ids round-trip any name', () {
      for (final name in [
        'Action',
        'Science Fiction',
        'Action & Adventure',
        'Sci-Fi: Classics / 50%',
        'Ciencia ficción',
      ]) {
        expect(siloGenreNameOf(siloGenreId(name)), name);
        expect(siloStudioNameOf(siloStudioId(name)), name);
      }
    });

    test('a genre id is not a studio id and vice versa', () {
      final genre = siloGenreId('Action');
      final studio = siloStudioId('Revolution Studios');
      expect(genre, 'silo-genre:Action');
      expect(siloStudioNameOf(genre), isNull);
      expect(siloGenreNameOf(studio), isNull);
      expect(isSyntheticSiloId(genre), isTrue);
      expect(isSyntheticSiloId(studio), isTrue);
      expect(isSyntheticSiloId('movie-imdb-tt0295701'), isFalse);
      expect(siloGenreNameOf('silo-genre:'), isNull);
    });
  });

  group('item types', () {
    test('every Silo type with a Jellyfin equivalent maps', () {
      expect(siloItemTypeOf('movie')?.jellyfinType, 'Movie');
      expect(siloItemTypeOf('series')?.jellyfinType, 'Series');
      expect(siloItemTypeOf('season')?.jellyfinType, 'Season');
      expect(siloItemTypeOf('episode')?.jellyfinType, 'Episode');
      expect(siloItemTypeOf('audiobook')?.jellyfinType, 'AudioBook');
      expect(siloItemTypeOf('ebook')?.jellyfinType, 'Book');
      expect(siloItemTypeOf('Movie')?.jellyfinType, 'Movie');
    });

    test('podcasts and unknown types do not map', () {
      expect(siloItemTypeOf('podcast'), isNull);
      expect(siloItemTypeOf('podcast_episode'), isNull);
      expect(siloItemTypeOf('hologram'), isNull);
      expect(siloItemTypeOf(null), isNull);
    });

    test('MediaType and IsFolder match what Emby sends', () {
      final seen = <String, (String?, bool?)>{};
      for (final file in [
        'emby/item_movie.json',
        'emby/item_episode.json',
        'emby/item_series.json',
        'emby/series_seasons.json',
      ]) {
        for (final item in _embyItems(jsonDecode(fixture(file)))) {
          seen[item['Type'] as String] = (
            item['MediaType'] as String?,
            item['IsFolder'] as bool?,
          );
        }
      }
      for (final type in ['movie', 'series', 'season', 'episode']) {
        final mapping = siloItemTypes[type]!;
        expect(seen[mapping.jellyfinType], (
          mapping.mediaType,
          mapping.isFolder,
        ), reason: type);
      }
    });

    test('the Silo fixtures only use types that map', () {
      for (final file in [
        'silo/catalog_item_movie.json',
        'silo/catalog_item_series.json',
        'silo/catalog_item_episode.json',
      ]) {
        expect(siloItemTypeOf(_json(file)['type']), isNotNull, reason: file);
      }
    });
  });

  group('reverse map for queries', () {
    test('no type filter means not narrowed', () {
      expect(siloTypesForQuery(), isNull);
      expect(siloTypesForQuery(includeItemTypes: const []), isNull);
      expect(siloTypesForQuery(mediaTypes: ''), isNull);
    });

    test('Jellyfin types map to Silo types', () {
      expect(siloTypesForQuery(includeItemTypes: const ['Movie']), {'movie'});
      expect(siloTypesForQuery(includeItemTypes: const ['Movie', 'Series']), {
        'movie',
        'series',
      });
      expect(siloTypesForQuery(includeItemTypes: const ['episode']), {
        'episode',
      });
    });

    test('types Silo lacks answer empty', () {
      for (final types in [
        ['MusicArtist'],
        ['MusicAlbum'],
        ['Audio'],
        ['Playlist'],
        ['TvChannel'],
        ['MusicAlbum', 'Playlist'],
      ]) {
        expect(
          siloTypesForQuery(includeItemTypes: types),
          isEmpty,
          reason: '$types',
        );
      }
      // Audiobooks have MediaType Audio, but Moonfin can't open them yet.
      expect(siloTypesForQuery(mediaTypes: 'Audio'), isEmpty);
      expect(siloTypesForQuery(includeItemTypes: const ['AudioBook']), isEmpty);
    });

    test('a mix keeps what Silo has', () {
      expect(
        siloTypesForQuery(includeItemTypes: const ['Movie', 'MusicAlbum']),
        {'movie'},
      );
    });

    test('types and media types narrow together', () {
      expect(siloTypesForQuery(mediaTypes: 'Video'), {'movie', 'episode'});
      expect(
        siloTypesForQuery(
          includeItemTypes: const ['Episode', 'Series'],
          mediaTypes: 'Video',
        ),
        {'episode'},
      );
      expect(
        siloTypesForQuery(
          includeItemTypes: const ['Movie'],
          mediaTypes: 'Audio',
        ),
        isEmpty,
      );
    });

    test('books open up once supported', () {
      const withBooks = {...siloSupportedTypes, 'audiobook', 'ebook'};
      expect(siloTypesForQuery(mediaTypes: 'Audio', supported: withBooks), {
        'audiobook',
      });
      expect(
        siloTypesForQuery(
          includeItemTypes: const ['Book'],
          supported: withBooks,
        ),
        {'ebook'},
      );
    });

    test('catalog scope for one request', () {
      expect(siloCatalogScopeFor({'movie'}), 'movie');
      expect(siloCatalogScopeFor({'series'}), 'series');
      expect(siloCatalogScopeFor({'episode'}), 'episode');
      expect(siloCatalogScopeFor({'movie', 'series'}), 'video');
      expect(siloCatalogScopeFor({'season'}), isNull);
      expect(siloCatalogScopeFor({'movie', 'episode'}), isNull);
      expect(siloCatalogScopeFor({}), isNull);
    });
  });
}
