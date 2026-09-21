import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/skipped_episode_endings.dart';

Map<String, dynamic> episode(
  String id,
  int? season,
  int? number,
  Map<String, dynamic> userData, {
  String? seriesId = 'series',
  String type = 'Episode',
}) =>
    {
      'Id': id,
      'Name': id,
      'Type': type,
      if (seriesId != null) 'SeriesId': seriesId,
      if (season != null) 'ParentIndexNumber': season,
      if (number != null) 'IndexNumber': number,
      'UserData': userData,
    };

void main() {
  group('skipped episode ending classification', () {
    test('clamps the leftover progress threshold to 1 through 100', () {
      expect(skippedEpisodeProgressThreshold(null), 50);
      expect(
        skippedEpisodeProgressThreshold('x'),
        defaultSkippedEpisodeProgressThreshold,
      );
      expect(skippedEpisodeProgressThreshold(80.4), 80);
      expect(skippedEpisodeProgressThreshold(0), 1);
      expect(skippedEpisodeProgressThreshold(140), 100);
    });

    test('requires 50 percent and genuine later viewing activity', () {
      final laterWatched = episode('e2', 1, 2, {
        'Played': true,
        'LastPlayedDate': '2026-08-23T19:00:00Z',
      });
      expect(
        isStaleSkippedEpisode(
          episode('e1', 1, 1, {
            'PlayedPercentage': 49,
            'LastPlayedDate': '2026-08-23T18:00:00Z',
          }),
          [laterWatched],
        ),
        isFalse,
      );
      expect(
        isStaleSkippedEpisode(
          episode('e1', 1, 1, {
            'PlayedPercentage': 50,
            'LastPlayedDate': '2026-08-23T18:00:00Z',
          }),
          [laterWatched],
        ),
        isTrue,
      );
      expect(
        isStaleSkippedEpisode(
          episode('e1', 1, 1, {'PlayedPercentage': 50}),
          [episode('e2', 1, 2, {})],
        ),
        isFalse,
      );
    });

    test('uses tick progress and clamps it to the valid range', () {
      expect(
        episodeProgress(
          episode('e1', 1, 1, {
            'PlaybackPositionTicks': 50,
            'RunTimeTicks': 100,
          }),
        ),
        50,
      );
      expect(
        episodeProgress(
          episode('e1', 1, 1, {
            'PlaybackPositionTicks': 200,
            'RunTimeTicks': 100,
          }),
        ),
        100,
      );
    });

    test('accepts partial later playback and orders across regular seasons', () {
      expect(
        isStaleSkippedEpisode(
          episode('e1', 1, 12, {'PlayedPercentage': 50}),
          [episode('e2', 2, 1, {'PlaybackPositionTicks': 1})],
        ),
        isTrue,
      );
    });

    test('ignores other series, specials, movies, and missing coordinates', () {
      final candidate = episode('e1', 1, 1, {'PlayedPercentage': 75});
      expect(
        isStaleSkippedEpisode(candidate, [
          episode('other', 1, 2, {'Played': true}, seriesId: 'other-series'),
        ]),
        isFalse,
      );
      expect(
        isStaleSkippedEpisode(candidate, [
          episode('special', 0, 99, {'Played': true}),
        ]),
        isFalse,
      );
      expect(
        isStaleSkippedEpisode(
          episode('movie', 1, 1, {'PlayedPercentage': 75}, type: 'Movie'),
          [episode('e2', 1, 2, {'Played': true})],
        ),
        isFalse,
      );
      expect(
        isStaleSkippedEpisode(
          episode('missing', null, 1, {'PlayedPercentage': 75}),
          [episode('e2', 1, 2, {'Played': true})],
        ),
        isFalse,
      );
    });

    test('identifies multiple stale episodes but retains the newest active one', () {
      final e1 = episode('e1', 1, 1, {'PlayedPercentage': 70});
      final e2 = episode('e2', 1, 2, {'PlayedPercentage': 60});
      final e3 = episode('e3', 1, 3, {'PlayedPercentage': 20});
      final all = [e1, e2, e3];
      expect(isStaleSkippedEpisode(e1, all), isTrue);
      expect(isStaleSkippedEpisode(e2, all), isTrue);
      expect(isStaleSkippedEpisode(e3, all), isFalse);
    });

    test(
      'does not mark a season finale when only later seasons were watched earlier',
      () {
        final finale = episode('finale', 5, 10, {
          'PlayedPercentage': 60,
          'LastPlayedDate': '2026-08-23T20:00:00Z',
        });
        final nextSeason = episode('s6e1', 6, 1, {
          'Played': true,
          'LastPlayedDate': '2026-06-01T12:00:00Z',
        });
        expect(isStaleSkippedEpisode(finale, [finale, nextSeason]), isFalse);
      },
    );

    test('marks a skipped ending when a later episode was started more recently', () {
      final skipped = episode('e5', 1, 5, {
        'PlayedPercentage': 70,
        'LastPlayedDate': '2026-08-23T18:00:00Z',
      });
      final startedLater = episode('e6', 1, 6, {
        'Played': true,
        'LastPlayedDate': '2026-08-23T19:00:00Z',
      });
      expect(
        isStaleSkippedEpisode(skipped, [skipped, startedLater]),
        isTrue,
      );
    });

    test('does not mark the frontier episode even when it is above 50 percent', () {
      final frontier = episode('e10', 1, 10, {'PlayedPercentage': 65});
      expect(isStaleSkippedEpisode(frontier, [frontier]), isFalse);
    });

    test('still treats a played leftover resume point as stale', () {
      final leftover = episode('e1', 1, 1, {
        'Played': true,
        'PlayedPercentage': 88,
        'LastPlayedDate': '2026-08-25T14:42:00Z',
      });
      final later = episode('e2', 1, 2, {'PlaybackPositionTicks': 1});
      expect(isStaleSkippedEpisode(leftover, [leftover, later]), isTrue);
    });

    test('honors a custom leftover progress threshold', () {
      final leftover = episode('e1', 1, 1, {'PlayedPercentage': 40});
      final later = episode('e2', 1, 2, {'PlaybackPositionTicks': 1});
      expect(isStaleSkippedEpisode(leftover, [leftover, later]), isFalse);
      expect(isStaleSkippedEpisode(leftover, [leftover, later], 40), isTrue);
      expect(isStaleSkippedEpisode(leftover, [leftover, later], 41), isFalse);
    });

    test('picks the leading in-progress episode as the frontier', () {
      final e10 = episode('e10', 1, 10, {'PlayedPercentage': 70});
      final e12 = episode('e12', 1, 12, {'PlayedPercentage': 65});
      final e13 = episode('e13', 1, 13, {'PlayedPercentage': 60});
      final e15 = episode('e15', 1, 15, {'PlayedPercentage': 55});
      expect(frontierEpisodeId([e10, e12, e13, e15]), 'e15');
      final e16 = episode('e16', 1, 16, {'PlaybackPositionTicks': 1});
      expect(frontierEpisodeId([e10, e12, e13, e15, e16]), 'e16');
    });
  });
}
