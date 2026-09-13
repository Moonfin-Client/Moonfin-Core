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
