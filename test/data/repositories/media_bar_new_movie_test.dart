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

  group('a followed series', () {
    // As the server sends a series when asked for RecursiveItemCount: no
    // PlayedPercentage, only counts.
    Map<String, dynamic> series({
      int unplayed = 10,
      int total = 10,
      bool played = false,
      bool favorite = false,
      String? lastPlayed,
    }) => {
      'Type': 'Series',
      'RecursiveItemCount': total,
      'UserData': {
        'UnplayedItemCount': unplayed,
        'Played': played,
        'IsFavorite': favorite,
        'LastPlayedDate': ?lastPlayed,
      },
    };

    test('has part of it watched', () {
      expect(mediaBarIsFollowedSeries(series(unplayed: 4)), isTrue);
    });

    test('was watched in full', () {
      expect(
        mediaBarIsFollowedSeries(series(unplayed: 0, played: true)),
        isTrue,
      );
    });

    test('is a favorite not started yet', () {
      expect(mediaBarIsFollowedSeries(series(favorite: true)), isTrue);
    });

    test('was played without the episode count', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Series',
          'UserData': {'LastPlayedDate': '2026-11-01T20:00:00Z'},
        }),
        isTrue,
      );
    });

    test('was never started', () {
      expect(mediaBarIsFollowedSeries(series()), isFalse);
    });

    test('a missing unplayed count is not progress', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Series',
          'RecursiveItemCount': 10,
          'UserData': {'Played': false},
        }),
        isFalse,
      );
    });

    test('a movie is never followed', () {
      expect(
        mediaBarIsFollowedSeries({
          'Type': 'Movie',
          'UserData': {'Played': true, 'IsFavorite': true},
        }),
        isFalse,
      );
    });
  });

  group('the bar order', () {
    Map<String, dynamic> series(String id, {bool followed = false}) => {
      'Id': id,
      'Type': 'Series',
      'UserData': {'IsFavorite': followed},
    };
    Map<String, dynamic> movie(String id) => {'Id': id, 'Type': 'Movie'};
    List<String?> ids(List<Map<String, dynamic>> items) => [
      for (final item in items) item['Id'] as String?,
    ];
    List<Map<String, dynamic>> order(
      List<Map<String, dynamic>> items, {
      bool followedFirst = false,
      int maxItems = 10,
    }) => mediaBarOrder(
      items,
      isFollowed: mediaBarIsFollowedSeries,
      followedFirst: followedFirst,
      maxItems: maxItems,
    );

    test('followed series lead, the rest keeps its order', () {
      expect(
        ids(
          order([
            movie('m1'),
            series('s1'),
            series('f1', followed: true),
            movie('m2'),
            series('f2', followed: true),
          ], followedFirst: true),
        ),
        ['f1', 'f2', 'm1', 's1', 'm2'],
      );
    });

    test('a followed series past the cut still makes it', () {
      expect(
        ids(
          order(
            [movie('m1'), movie('m2'), series('f1', followed: true)],
            followedFirst: true,
            maxItems: 1,
          ),
        ),
        ['f1'],
      );
    });

    test('when off, the order stays as it came', () {
      expect(
        ids(order([movie('m1'), series('f1', followed: true), movie('m2')])),
        ['m1', 'f1', 'm2'],
      );
    });

    test('an empty list stays empty', () {
      expect(order(const [], followedFirst: true), isEmpty);
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
