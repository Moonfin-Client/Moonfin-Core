import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/preference/user_preferences.dart';

final _now = DateTime.utc(2026, 11, 13, 12);

// Jellyfin writes seven fractional digits.
String _date(DateTime day) =>
    '${day.toIso8601String().substring(0, 19)}.0000000Z';

Map<String, dynamic> _movie({DateTime? released, List<String>? taglines}) => {
  'Type': 'Movie',
  'PremiereDate': ?released == null ? null : _date(released),
  'Taglines': ?taglines,
};

MediaBarNewReleaseInfo? _newMovie(Map<String, dynamic> item) =>
    mediaBarNewMovieOf(item, days: 120, now: _now);

void main() {
  group('a new movie', () {
    test('came out within the window', () {
      final release = _newMovie(
        _movie(released: _now.subtract(const Duration(days: 100))),
      );

      expect(release?.kind, MediaBarNewRelease.newMovie);
    });

    test('came out before the window', () {
      expect(
        _newMovie(_movie(released: _now.subtract(const Duration(days: 121)))),
        isNull,
      );
    });

    test('has not come out yet', () {
      expect(
        _newMovie(_movie(released: _now.add(const Duration(days: 1)))),
        isNull,
      );
    });

    test('has no date', () {
      expect(_newMovie(_movie()), isNull);
    });

    test('a series is never a new movie', () {
      expect(
        _newMovie({
          'Type': 'Series',
          'PremiereDate': _date(_now.subtract(const Duration(days: 1))),
        }),
        isNull,
      );
    });
  });

  group('the line under a new movie', () {
    final released = _now.subtract(const Duration(days: 10));

    test('takes the tagline the server has', () {
      expect(
        _newMovie(
          _movie(
            released: released,
            taglines: ['  ', "Dans l'espace, personne ne vous entendra crier."],
          ),
        )?.tagline,
        "Dans l'espace, personne ne vous entendra crier.",
      );
    });

    test('has no tagline when the server has none', () {
      expect(_newMovie(_movie(released: released))?.tagline, isNull);
    });
  });

  test('the stored kinds read back as names, each kind matching its name', () {
    expect(mediaBarNewReleaseKindsOf(' newSeason, newMovie ,'), {
      UserPreferences.mediaBarNewSeason,
      UserPreferences.mediaBarNewMovie,
    });
    for (final kind in MediaBarNewRelease.values) {
      expect(
        mediaBarNewReleaseKindsOf(
          UserPreferences.mediaBarNewReleaseKinds.defaultValue,
        ),
        contains(mediaBarNewReleaseKindName(kind)),
      );
    }
  });
}
