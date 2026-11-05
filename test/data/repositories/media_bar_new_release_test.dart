import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';

final _now = DateTime.utc(2026, 11, 2, 12);

Map<String, dynamic> _episode(
  int season,
  DateTime aired, {
  bool virtual = false,
  int? number,
}) => {
  'ParentIndexNumber': season,
  'IndexNumber': ?number,
  'SeasonId': 'season-$season',
  // Jellyfin writes seven fractional digits.
  'PremiereDate': '${aired.toIso8601String().substring(0, 19)}.0000000Z',
  'LocationType': virtual ? 'Virtual' : 'FileSystem',
};

List<Map<String, dynamic>> _sameDay(int season, int count, DateTime day) => [
  for (var i = 0; i < count; i++) _episode(season, day),
];

List<Map<String, dynamic>> _recent(List<Map<String, dynamic>> season) => [
  for (final episode in season)
    if (isRecentlyAiredEpisode(episode, now: _now, days: 30)) episode,
];

/// Runs the two steps the media bar does: the recent episodes first, then the
/// whole season when the first step asks for it.
MediaBarNewReleaseInfo? _infoOf(List<Map<String, dynamic>> season) {
  final recent = _recent(season);
  final seasonId = mediaBarSeasonToCheck(recent, now: _now, days: 30);
  return mediaBarNewReleaseOf(
    recent,
    latestSeason: seasonId == null ? null : season,
    now: _now,
    days: 30,
  );
}

MediaBarNewRelease? _releaseOf(List<Map<String, dynamic>> season) =>
    _infoOf(season)?.kind;

void main() {
  final day = DateTime.utc(2026, 10, 28);

  group('a series in the media bar', () {
    test('a season out all on one day is a new season', () {
      expect(_releaseOf(_sameDay(3, 8, day)), MediaBarNewRelease.newSeason);
    });

    test('a first season out all at once is a new series', () {
      expect(_releaseOf(_sameDay(1, 6, day)), MediaBarNewRelease.newSeries);
    });

    test(
      'a weekly season ending on three episodes in one day has new episodes',
      () {
        final season = [
          for (var week = 0; week < 6; week++)
            _episode(2, DateTime.utc(2026, 9, 1).add(Duration(days: 7 * week))),
          ..._sameDay(2, 3, day),
        ];
        expect(_releaseOf(season), MediaBarNewRelease.newEpisodes);
      },
    );

    test("a split season's second part has new episodes", () {
      final season = [
        ..._sameDay(4, 4, DateTime.utc(2026, 7, 1)),
        ..._sameDay(4, 4, day),
      ];
      expect(_releaseOf(season), MediaBarNewRelease.newEpisodes);
    });

    test('a season aired week by week has new episodes', () {
      expect(
        _releaseOf([
          _episode(2, DateTime.utc(2026, 10, 19)),
          _episode(2, DateTime.utc(2026, 10, 26)),
          _episode(2, DateTime.utc(2026, 11, 2)),
        ]),
        MediaBarNewRelease.newEpisodes,
      );
      expect(
        _releaseOf([_episode(2, DateTime.utc(2026, 11, 2))]),
        MediaBarNewRelease.newEpisodes,
      );
    });

    test('a two episode premiere is not a whole season', () {
      expect(_releaseOf(_sameDay(4, 2, day)), MediaBarNewRelease.newEpisodes);
    });

    test('episodes not on the server do not count against a drop', () {
      final season = [
        ..._sameDay(3, 5, day),
        _episode(3, DateTime.utc(2026, 12, 1), virtual: true),
      ];
      expect(_releaseOf(season), MediaBarNewRelease.newSeason);
    });

    test('an old show added today has nothing new', () {
      expect(_releaseOf(_sameDay(1, 10, DateTime.utc(2005, 6, 1))), isNull);
    });

    test('episodes known only from metadata or not aired yet do not count', () {
      expect(
        _releaseOf([
          for (var i = 0; i < 8; i++)
            _episode(5, DateTime.utc(2026, 10, 30), virtual: true),
          _episode(5, DateTime.utc(2026, 12, 1)),
        ]),
        isNull,
      );
    });
  });

  group('the line under the label', () {
    test('a season out at once names the season', () {
      expect(_infoOf(_sameDay(3, 8, day))?.season, 3);
    });

    test('new episodes name the latest one', () {
      final info = _infoOf([
        _episode(2, DateTime.utc(2026, 10, 23), number: 4),
        _episode(2, DateTime.utc(2026, 10, 30), number: 5),
      ]);
      expect(info?.season, 2);
      expect(info?.episode, 5);
    });
  });
}
