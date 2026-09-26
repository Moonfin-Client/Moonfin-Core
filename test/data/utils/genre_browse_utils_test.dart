import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/utils/genre_browse_utils.dart';
import 'package:server_core/server_core.dart';

class _FakeImageApi implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'primary:$itemId';

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'backdrop:$itemId';

  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) =>
      'thumb:$itemId';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  // Asking for types this list doesn't carry falls back to the whole list, so
  // dropping one here doesn't narrow a caller, it widens it to everything.
  group('narrowing the types a genre row is built from', () {
    test('keeps the audio types a book library browses', () {
      expect(
        normalizeBrowsableGenreItemTypes(const ['AudioBook', 'Audio']),
        ['Audio'],
      );
      expect(normalizeBrowsableGenreItemTypes(const ['MusicAlbum']), [
        'MusicAlbum',
      ]);
    });

    test('counts a music genre off its own fields', () {
      final rock = <String, dynamic>{'AlbumCount': 12, 'SongCount': 140};
      expect(
        browsableGenreCount(rock, normalizedItemTypes: const ['Audio']),
        140,
      );
      expect(
        browsableGenreCount(rock, normalizedItemTypes: const ['MusicAlbum']),
        12,
      );
    });
  });

  // Both genre screens read a genre's own art through this.
  group("a genre's own artwork", () {
    test('takes a Thumb ahead of a Primary', () {
      final genre = <String, dynamic>{
        'Id': 'g1',
        'PrimaryImageTag': 'p1',
        'PrimaryImageAspectRatio': 0.66,
        'ImageTags': {'Thumb': 't1'},
      };

      final (imageUrl, backdropUrl, hasOwnArtwork) = resolveGenreOwnArtwork(
        genreData: genre,
        imageApi: _FakeImageApi(),
        maxWidth: 400,
      );

      expect(hasOwnArtwork, isTrue);
      expect(imageUrl, 'thumb:g1');
      expect(backdropUrl, isNull);
    });

    test('takes a portrait Primary when there is no Thumb', () {
      final genre = <String, dynamic>{
        'Id': 'g2',
        'PrimaryImageTag': 'p1',
        'PrimaryImageAspectRatio': 0.66,
        'BackdropImageTags': ['b1'],
      };

      final (imageUrl, backdropUrl, hasOwnArtwork) = resolveGenreOwnArtwork(
        genreData: genre,
        imageApi: _FakeImageApi(),
        maxWidth: 400,
      );

      expect(hasOwnArtwork, isTrue);
      expect(imageUrl, 'primary:g2');
      expect(backdropUrl, 'backdrop:g2');
    });

    // A landscape Primary comes from an item inside the genre.
    test('leaves a landscape Primary to the fallback', () {
      final genre = <String, dynamic>{
        'Id': 'g3',
        'PrimaryImageTag': 'p1',
        'PrimaryImageAspectRatio': 1.78,
        'BackdropImageTags': ['b1'],
      };

      final (imageUrl, backdropUrl, hasOwnArtwork) = resolveGenreOwnArtwork(
        genreData: genre,
        imageApi: _FakeImageApi(),
        maxWidth: 400,
      );

      expect(hasOwnArtwork, isFalse);
      expect(imageUrl, isNull);
      expect(backdropUrl, isNull);
    });

    test('reports no artwork for a genre carrying none', () {
      final (_, _, hasOwnArtwork) = resolveGenreOwnArtwork(
        genreData: <String, dynamic>{'Id': 'g4', 'Name': 'Rock'},
        imageApi: _FakeImageApi(),
        maxWidth: 400,
      );

      expect(hasOwnArtwork, isFalse);
    });
  });

  // A grid of genres wants a different picture on each tile, which means
  // knowing which item each tile took rather than working it out again.
  test('fallback artwork reports the item it drew', () {
    final poster = <String, dynamic>{
      'Id': 'portrait-only',
      'PrimaryImageTag': 'p1',
      'PrimaryImageAspectRatio': 0.66,
    };
    final backdrop = <String, dynamic>{
      'Id': 'has-backdrop',
      'BackdropImageTags': ['b1'],
    };

    final (imageUrl, _, usedId) = resolveGenreFallbackArtwork(
      items: [poster, backdrop],
      imageApi: _FakeImageApi(),
      maxWidth: 400,
    );

    expect(imageUrl, 'backdrop:has-backdrop');
    expect(usedId, 'has-backdrop');
  });

  test('fallback artwork steps around art another tile took', () {
    final taken = <String, dynamic>{
      'Id': 'taken',
      'BackdropImageTags': ['b1'],
    };
    final free = <String, dynamic>{
      'Id': 'free',
      'BackdropImageTags': ['b2'],
    };

    final (_, _, usedId) = resolveGenreFallbackArtwork(
      items: [taken, free],
      imageApi: _FakeImageApi(),
      maxWidth: 400,
      avoidIds: const {'taken'},
    );
    expect(usedId, 'free');

    // With nothing left to move to, a repeat beats an empty tile.
    final (imageUrl, _, _) = resolveGenreFallbackArtwork(
      items: [taken],
      imageApi: _FakeImageApi(),
      maxWidth: 400,
      avoidIds: const {'taken'},
    );
    expect(imageUrl, 'backdrop:taken');
  });

  test('fallback artwork reports nothing when there is nothing to draw', () {
    final (imageUrl, backdropUrl, usedId) = resolveGenreFallbackArtwork(
      items: const [],
      imageApi: _FakeImageApi(),
      maxWidth: 400,
    );

    expect(imageUrl, isNull);
    expect(backdropUrl, isNull);
    expect(usedId, isNull);
  });
}
