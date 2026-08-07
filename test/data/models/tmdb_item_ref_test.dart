import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/tmdb_item_ref.dart';

void main() {
  group('TmdbItemRef.tryParse', () {
    test('leaves an ordinary library id alone', () {
      expect(TmdbItemRef.tryParse('a1b2c3d4'), isNull);
      expect(TmdbItemRef.tryParse(''), isNull);
    });

    test('reads the kind and the id', () {
      expect(
        TmdbItemRef.tryParse('tmdb:movie:603'),
        const TmdbItemRef(TmdbItemKind.movie, '603'),
      );
      expect(
        TmdbItemRef.tryParse('tmdb:tv:1399'),
        const TmdbItemRef(TmdbItemKind.tv, '1399'),
      );
      expect(
        TmdbItemRef.tryParse('tmdb:person:6384'),
        const TmdbItemRef(TmdbItemKind.person, '6384'),
      );
    });

    test('still reads the older person-only form', () {
      expect(
        TmdbItemRef.tryParse('tmdb:6384'),
        const TmdbItemRef(TmdbItemKind.person, '6384'),
      );
    });

    test('keeps an IMDb keyed id, which home rows emit', () {
      expect(
        TmdbItemRef.tryParse('tmdb:movie:tt0816692'),
        const TmdbItemRef(TmdbItemKind.movie, 'tt0816692'),
      );
    });

    test('rejects a kind it does not know and an empty id', () {
      expect(TmdbItemRef.tryParse('tmdb:episode:1'), isNull);
      expect(TmdbItemRef.tryParse('tmdb:movie:'), isNull);
      expect(TmdbItemRef.tryParse('tmdb:'), isNull);
    });

    test('round trips through the route id', () {
      for (final id in ['tmdb:movie:603', 'tmdb:tv:1399', 'tmdb:person:6384']) {
        expect(TmdbItemRef.tryParse(id)!.itemId, id);
      }
    });

    test('tells Seerr which endpoint to ask', () {
      expect(
        TmdbItemRef.tryParse('tmdb:tv:1399')!.seerrMediaType,
        'tv',
      );
      expect(
        TmdbItemRef.tryParse('tmdb:movie:603')!.seerrMediaType,
        'movie',
      );
    });
  });
}
