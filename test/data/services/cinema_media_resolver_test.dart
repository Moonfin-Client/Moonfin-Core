import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/cinema_media_resolver.dart';
import 'package:server_core/server_core.dart';

void main() {
  test('a TMDB ID must identify the correct movie or series', () {
    CinemaMedia? direct(String type, Map<String, String> ids) =>
        CinemaMediaResolver.directMedia({'Type': type, 'ProviderIds': ids});

    expect(direct('Movie', {'Tmdb': '42'})?.type, CinemaMediaType.movie);
    expect(direct('Series', {'Tmdb': '42'})?.type, CinemaMediaType.tv);
    expect(direct('Video', {'Tmdb': '42'}), isNull);
    expect(
      direct('Movie', {'Tmdb': '42', 'TmdbMediaType': 'tv'}),
      isNull,
    );
    expect(
      direct('Video', {'Tmdb': '42', 'TmdbMediaType': 'tv'})?.type,
      CinemaMediaType.tv,
    );
    expect(direct('Video', {'Tmdb': '-4', 'TmdbMediaType': 'movie'}), isNull);
    expect(
      CinemaMediaResolver.directMedia({
        'Type': 'Trailer',
        'OwnerId': 'movie-owner',
        '__moonfinCinemaFeatureType': 'Episode',
        'ProviderIds': {'Tmdb': '42', 'TmdbMediaType': 'movie'},
      })?.type,
      CinemaMediaType.movie,
    );
  });

  test('untyped trailer IDs go to Moonbase with playback context', () async {
    for (final feature in ['Movie', 'Episode']) {
      final item = <String, dynamic>{
        'Type': 'Trailer',
        'ProviderIds': {'Tmdb': '42'},
        '__moonfinCinemaFeatureType': feature,
      };
      expect(CinemaMediaResolver.directMedia(item), isNull);
      final client = _ResolverClient();
      final media = await CinemaMediaResolver.resolve(
        client: client,
        itemId: 'trailer',
        item: item,
      );
      expect(
        client.expectedType,
        feature == 'Movie' ? CinemaMediaType.movie : CinemaMediaType.tv,
      );
      expect(media?.tmdbId, 42);
      expect(media?.type, CinemaMediaType.movie);
    }
  });
}

class _ResolverClient implements MediaServerClient {
  CinemaMediaType? expectedType;

  @override
  Future<CinemaMedia?> resolveCinemaMedia(
    String itemId, {
    CinemaMediaType? expectedMediaType,
  }) async {
    expectedType = expectedMediaType;
    return const CinemaMedia(42, CinemaMediaType.movie);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
