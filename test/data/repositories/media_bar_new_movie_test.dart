import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';
import 'package:moonfin/preference/user_preferences.dart';

final _now = DateTime.utc(2026, 11, 13, 12);

// Jellyfin writes seven fractional digits.
String _date(DateTime day) =>
    '${day.toIso8601String().substring(0, 19)}.0000000Z';

Map<String, dynamic> _movie({
  DateTime? released,
  DateTime? added,
  List<String>? taglines,
}) => {
  'Type': 'Movie',
  'PremiereDate': ?released == null ? null : _date(released),
  'DateCreated': ?added == null ? null : _date(added),
  'Taglines': ?taglines,
};

MediaBarNewReleaseInfo? _byRelease(Map<String, dynamic> item) =>
    mediaBarNewMovieOf(
      item,
      byDateAdded: false,
      days: 120,
      maxAgeMonths: 12,
      now: _now,
    );

MediaBarNewReleaseInfo? _byAdded(Map<String, dynamic> item) =>
    mediaBarNewMovieOf(
      item,
      byDateAdded: true,
      days: 30,
      maxAgeMonths: 12,
      now: _now,
    );

void main() {
  group('a new movie by release date', () {
    test('came out within the window', () {
      final released = _now.subtract(const Duration(days: 100));
      final release = _byRelease(_movie(released: released));

      expect(release?.kind, MediaBarNewRelease.newMovie);
      expect(release?.date, released);
    });

    test('came out before the window', () {
      expect(
        _byRelease(_movie(released: _now.subtract(const Duration(days: 121)))),
        isNull,
      );
    });

    test('has not come out yet', () {
      expect(
        _byRelease(_movie(released: _now.add(const Duration(days: 1)))),
        isNull,
      );
    });

    test('has no date', () {
      expect(_byRelease(_movie()), isNull);
    });

    test('a series is never a new movie', () {
      expect(
        _byRelease({
          'Type': 'Series',
          'PremiereDate': _date(_now.subtract(const Duration(days: 1))),
        }),
        isNull,
      );
    });
  });

  group('a new movie by date added', () {
    test('arrived lately and came out this year', () {
      final added = _now.subtract(const Duration(days: 3));
      final release = _byAdded(
        _movie(
          added: added,
          released: _now.subtract(const Duration(days: 200)),
        ),
      );

      expect(release?.date, added);
    });

    test('an old film that just arrived is not new', () {
      expect(
        _byAdded(
          _movie(
            added: _now.subtract(const Duration(days: 3)),
            released: DateTime.utc(1994, 9, 23),
          ),
        ),
        isNull,
      );
    });

    test('arrived before the window', () {
      expect(
        _byAdded(
          _movie(
            added: _now.subtract(const Duration(days: 31)),
            released: _now.subtract(const Duration(days: 40)),
          ),
        ),
        isNull,
      );
    });

    test('a movie with no release date does not pass the limit', () {
      expect(
        _byAdded(_movie(added: _now.subtract(const Duration(days: 3)))),
        isNull,
      );
    });
  });

  group('the line under a new movie', () {
    final released = _now.subtract(const Duration(days: 10));

    test('takes the tagline the server has', () {
      expect(
        _byRelease(
          _movie(
            released: released,
            taglines: ['  ', "Dans l'espace, personne ne vous entendra crier."],
          ),
        )?.tagline,
        "Dans l'espace, personne ne vous entendra crier.",
      );
    });

    test('has no tagline when the server has none', () {
      expect(_byRelease(_movie(released: released))?.tagline, isNull);
    });
  });

  group('the minimum rating', () {
    test('off lets everything through, unrated included', () {
      expect(mediaBarMeetsMinRating(minTenths: 0), isTrue);
    });

    test('the cached score wins over the server rating', () {
      expect(
        mediaBarMeetsMinRating(cached: 6.4, community: 7.7, minTenths: 70),
        isFalse,
      );
      expect(
        mediaBarMeetsMinRating(cached: 7.2, community: 5.0, minTenths: 70),
        isTrue,
      );
    });

    test('the server rating stands in when the cache has none', () {
      expect(mediaBarMeetsMinRating(community: 7.0, minTenths: 70), isTrue);
    });

    test('a half point minimum', () {
      expect(mediaBarMeetsMinRating(cached: 6.5, minTenths: 65), isTrue);
      expect(mediaBarMeetsMinRating(cached: 6.4, minTenths: 65), isFalse);
      expect(mediaBarMeetsMinRating(cached: 6.4999, minTenths: 65), isTrue);
    });

    test('a movie with no rating does not pass a minimum', () {
      expect(mediaBarMeetsMinRating(minTenths: 60), isFalse);
    });
  });

  group('a followed series', () {
    test('has part of it watched', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Series',
          'UserData': {'PlayedPercentage': 12.5},
        }),
        isTrue,
      );
    });

    test('was watched in full', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Series',
          'UserData': {'Played': true},
        }),
        isTrue,
      );
    });

    test('was never started', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Series',
          'UserData': {'PlayedPercentage': 0},
        }),
        isFalse,
      );
    });

    test('a movie is never followed', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Movie',
          'UserData': {'Played': true},
        }),
        isFalse,
      );
    });
  });

  group('mixing movies and series', () {
    Map<String, dynamic> series(String id) => {'Id': id, 'Type': 'Series'};
    Map<String, dynamic> movie(String id) => {'Id': id, 'Type': 'Movie'};
    List<String?> ids(List<Map<String, dynamic>> items) => [
      for (final item in items) item['Id'] as String?,
    ];

    test('they take turns, starting with the first kind', () {
      expect(
        ids(
          mediaBarAlternateTypes([
            movie('m1'),
            movie('m2'),
            series('s1'),
            series('s2'),
          ]),
        ),
        ['m1', 's1', 'm2', 's2'],
      );
    });

    test('the other kind fills in when one runs out', () {
      expect(
        ids(
          mediaBarAlternateTypes([
            series('s1'),
            movie('m1'),
            series('s2'),
            series('s3'),
          ]),
        ),
        ['s1', 'm1', 's2', 's3'],
      );
    });

    test('one kind alone keeps its order', () {
      expect(ids(mediaBarAlternateTypes([movie('m1'), movie('m2')])), [
        'm1',
        'm2',
      ]);
    });

    test('an empty list stays empty', () {
      expect(mediaBarAlternateTypes(const []), isEmpty);
    });
  });

  test('the stored kinds read back as names, each kind matching its name', () {
    expect(mediaBarNewReleaseKindsOf(' newSeason, newMovie ,'), {
      UserPreferences.mediaBarNewSeason,
      UserPreferences.mediaBarNewMovie,
    });
    // The upcoming kinds have their own switches, not a place in the list.
    for (final kind in MediaBarNewRelease.values.where((k) => !k.isUpcoming)) {
      expect(
        mediaBarNewReleaseKindsOf(
          UserPreferences.mediaBarNewReleaseKinds.defaultValue,
        ),
        contains(mediaBarNewReleaseKindName(kind)),
      );
    }
  });
}
