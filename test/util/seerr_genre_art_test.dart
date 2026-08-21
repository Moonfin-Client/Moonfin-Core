import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/seerr_genre_art.dart';

/// TMDB paths carry their leading slash, so the built URL joins without one.
const _backdrops = [
  '/first.jpg',
  '/second.jpg',
  '/third.jpg',
  '/fourth.jpg',
  '/fifth.jpg',
  '/sixth.jpg',
];

const _action = 28;
const _horror = 27;
const _sciFi = 878;

void main() {
  group('which backdrop it picks', () {
    test('takes the fifth, past the popular films at the front', () {
      expect(
        seerrGenreBackdropUrl(_action, _backdrops),
        endsWith('/fifth.jpg'),
      );
    });

    test('a short list falls back to the last entry', () {
      expect(
        seerrGenreBackdropUrl(_action, const ['/only.jpg', '/second.jpg']),
        endsWith('/second.jpg'),
      );
    });

    test('a single backdrop is still usable', () {
      expect(
        seerrGenreBackdropUrl(_action, const ['/only.jpg']),
        endsWith('/only.jpg'),
      );
    });

    test('exactly five takes the last, which is also the fifth', () {
      expect(
        seerrGenreBackdropUrl(_action, _backdrops.take(5).toList()),
        endsWith('/fifth.jpg'),
      );
    });

    test('no artwork gives no url', () {
      expect(seerrGenreBackdropUrl(_action, const []), isNull);
    });
  });

  group('the duotone it asks TMDB for', () {
    test('builds the filter url around the genre colours', () {
      expect(
        seerrGenreBackdropUrl(_action, _backdrops),
        'https://image.tmdb.org/t/p/w1280_filter(duotone,991B1B,FCA5A5)/fifth.jpg',
      );
    });

    // Two genres often share the same popular film, which is what used to
    // make their cards identical. The colours are what keep them apart.
    test('two genres sharing a backdrop still get different art', () {
      final action = seerrGenreBackdropUrl(_action, _backdrops);
      final sciFi = seerrGenreBackdropUrl(_sciFi, _backdrops);

      expect(action, isNot(sciFi));
      expect(action, endsWith('/fifth.jpg'));
      expect(sciFi, endsWith('/fifth.jpg'));
    });

    test('a genre the list doesn\'t name still gets a colour', () {
      final unknown = seerrGenreBackdropUrl(-1, _backdrops);

      expect(unknown, isNotNull);
      expect(unknown, contains('_filter(duotone,'));
      expect(
        unknown,
        seerrGenreBackdropUrl(_horror, _backdrops),
        reason: 'the fallback is the same tone horror uses',
      );
    });
  });
}
