import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/calendar_entry.dart';
import 'package:moonfin/data/models/media_bar_slide_item.dart';
import 'package:moonfin/data/repositories/media_bar_repository.dart';

final _now = DateTime(2026, 11, 13, 12);

CalendarEntry _episode({
  required int season,
  required int episode,
  DateTime? date,
  String? itemId = 'series-1',
  CalendarBadge? badge,
  bool hasFile = false,
}) => CalendarEntry(
  key: 'sonarr:$itemId:$season:$episode',
  kind: CalendarEntryKind.episode,
  release: CalendarRelease.airing,
  date: date ?? _now.add(const Duration(days: 1)),
  hasTime: true,
  title: 'A series',
  seasonNumber: season,
  episodeNumber: episode,
  itemId: itemId,
  badge: badge,
  hasFile: hasFile,
);

// Jellyfin writes seven fractional digits.
Map<String, dynamic> _aired(DateTime day, {bool played = false}) => {
  'ParentIndexNumber': 2,
  'IndexNumber': 4,
  'PremiereDate': '${day.toUtc().toIso8601String().substring(0, 19)}.0000000Z',
  'LocationType': 'FileSystem',
  'UserData': {'Played': played},
};

MediaBarSlideItem _slide(String id, String type) =>
    MediaBarSlideItem(itemId: id, serverId: 's', title: id, itemType: type);

void main() {
  group('what an upcoming calendar entry announces', () {
    test('an episode mid season is a new episode', () {
      final info = mediaBarUpcomingOf(_episode(season: 2, episode: 5));
      expect(info?.kind, MediaBarNewRelease.upcomingEpisode);
      expect(info?.date, _now.add(const Duration(days: 1)));
    });

    test("a season's first episode announces the season", () {
      final info = mediaBarUpcomingOf(_episode(season: 3, episode: 1));
      expect(info?.kind, MediaBarNewRelease.upcomingSeason);
      expect(info?.season, 3);
    });

    test("season 1's first episode announces the series", () {
      expect(
        mediaBarUpcomingOf(
          _episode(season: 1, episode: 1, badge: CalendarBadge.seriesPremiere),
        )?.kind,
        MediaBarNewRelease.upcomingSeries,
      );
    });

    test('specials are left out', () {
      expect(mediaBarUpcomingOf(_episode(season: 0, episode: 3)), isNull);
    });

    test('a movie is coming soon', () {
      final movie = CalendarEntry(
        key: 'radarr:1:digital',
        kind: CalendarEntryKind.movie,
        release: CalendarRelease.digital,
        date: DateTime(2026, 11, 20),
        hasTime: false,
        title: 'A movie',
      );
      expect(mediaBarUpcomingOf(movie)?.kind, MediaBarNewRelease.upcomingMovie);
    });
  });

  group('the date a movie comes home', () {
    CalendarEntry release(
      CalendarRelease kind, {
      bool hasDigitalDate = false,
    }) => CalendarEntry(
      key: 'radarr:1:${kind.name}',
      kind: CalendarEntryKind.movie,
      release: kind,
      date: DateTime(2026, 11, 20),
      hasTime: false,
      title: 'A movie',
      hasDigitalDate: hasDigitalDate,
    );

    test('the digital release counts', () {
      expect(
        mediaBarIsHomeRelease(
          release(CalendarRelease.digital, hasDigitalDate: true),
        ),
        isTrue,
      );
    });

    test('the physical one only stands in when there is no digital date', () {
      expect(mediaBarIsHomeRelease(release(CalendarRelease.physical)), isTrue);
      expect(
        mediaBarIsHomeRelease(
          release(CalendarRelease.physical, hasDigitalDate: true),
        ),
        isFalse,
      );
    });

    test('the cinema release never counts', () {
      expect(mediaBarIsHomeRelease(release(CalendarRelease.cinema)), isFalse);
    });
  });

  group('the next episode of each series', () {
    test('the soonest one wins', () {
      final soon = _now.add(const Duration(days: 2));
      final later = _now.add(const Duration(days: 5));
      final bySeries = mediaBarUpcomingBySeries([
        _episode(season: 2, episode: 6, date: later),
        _episode(season: 2, episode: 5, date: soon),
      ], now: _now);
      expect(bySeries['series-1']?.episode, 5);
    });

    test(
      'what already aired, is on the server or has no series is left out',
      () {
        final bySeries = mediaBarUpcomingBySeries([
          _episode(
            season: 2,
            episode: 4,
            date: _now.subtract(const Duration(hours: 2)),
          ),
          _episode(season: 2, episode: 5, hasFile: true),
          _episode(season: 2, episode: 6, itemId: null),
        ], now: _now);
        expect(bySeries, isEmpty);
      },
    );
  });

  group('nothing new left to watch', () {
    test('the latest aired episode is watched', () {
      expect(
        mediaBarCaughtUp(
          [
            _aired(_now.subtract(const Duration(days: 8)), played: true),
            _aired(_now.subtract(const Duration(days: 1)), played: true),
          ],
          now: _now,
          days: 30,
        ),
        isTrue,
      );
    });

    test('the latest aired episode is not watched yet', () {
      expect(
        mediaBarCaughtUp(
          [
            _aired(_now.subtract(const Duration(days: 8)), played: true),
            _aired(_now.subtract(const Duration(days: 1))),
          ],
          now: _now,
          days: 30,
        ),
        isFalse,
      );
    });

    test('nothing aired within the window', () {
      expect(mediaBarCaughtUp(const [], now: _now, days: 30), isTrue);
    });

    test('an older episode in the window is still not watched', () {
      expect(
        mediaBarCaughtUp(
          [
            _aired(_now.subtract(const Duration(days: 8))),
            _aired(_now.subtract(const Duration(days: 1)), played: true),
          ],
          now: _now,
          days: 30,
        ),
        isFalse,
      );
    });

    test('a season out in one day needs every episode watched', () {
      final day = _now.subtract(const Duration(days: 2));
      expect(
        mediaBarCaughtUp(
          [_aired(day, played: true), _aired(day), _aired(day)],
          now: _now,
          days: 30,
        ),
        isFalse,
      );
    });
  });

  group('the label a series gets', () {
    const past = MediaBarNewReleaseInfo(
      kind: MediaBarNewRelease.newEpisodes,
      season: 2,
      episode: 4,
    );
    final upcoming = MediaBarNewReleaseInfo(
      kind: MediaBarNewRelease.upcomingEpisode,
      season: 2,
      episode: 5,
      date: _now.add(const Duration(days: 1)),
    );

    test('what aired wins while some of it is left to watch', () {
      expect(
        mediaBarSeriesLabel(past: past, upcoming: upcoming, caughtUp: false),
        same(past),
      );
    });

    test('once caught up, what comes next', () {
      expect(
        mediaBarSeriesLabel(past: past, upcoming: upcoming, caughtUp: true),
        same(upcoming),
      );
    });

    test('caught up with nothing coming keeps what aired', () {
      expect(mediaBarSeriesLabel(past: past, caughtUp: true), same(past));
    });
  });

  group('placing what comes next among the slides', () {
    List<String> ids(List<MediaBarSlideItem> slides) => [
      for (final slide in slides) slide.itemId,
    ];

    test('never first, and in place of a slide of the same type', () {
      final slides = [
        _slide('s1', 'Series'),
        _slide('m1', 'Movie'),
        _slide('s2', 'Series'),
        _slide('m2', 'Movie'),
      ];
      expect(ids(mediaBarPlaceReserved(slides, [_slide('up', 'Movie')], 4)), [
        's1',
        'up',
        's2',
        'm2',
      ]);
    });

    test('two of them spread out', () {
      final slides = [for (var i = 0; i < 6; i++) _slide('m$i', 'Movie')];
      expect(
        ids(
          mediaBarPlaceReserved(slides, [
            _slide('a', 'Movie'),
            _slide('b', 'Movie'),
          ], 6),
        ),
        ['m0', 'a', 'm2', 'b', 'm4', 'm5'],
      );
    });

    test('goes in when no slide of its type is left, within the count', () {
      final slides = [_slide('s1', 'Series'), _slide('s2', 'Series')];
      expect(ids(mediaBarPlaceReserved(slides, [_slide('up', 'Movie')], 2)), [
        's1',
        'up',
      ]);
    });

    test('titles already on the bar move without pushing others out', () {
      final slides = [
        for (final id in 'ABCDEF'.split('')) _slide(id, 'Series'),
      ];
      expect(
        ids(
          mediaBarPlaceReserved(slides, [
            _slide('B', 'Series'),
            _slide('D', 'Series'),
          ], 6),
        ),
        ['A', 'B', 'C', 'D', 'E', 'F'],
      );
    });

    test('an outside title never leads an empty bar', () {
      final outside = MediaBarSlideItem(
        itemId: 'up',
        serverId: MediaBarSlideItem.externalServerId,
        title: 'up',
      );
      expect(ids(mediaBarPlaceReserved(const [], [outside], 4)), isEmpty);
      expect(
        ids(
          mediaBarPlaceReserved(const [], [_slide('s1', 'Series'), outside], 4),
        ),
        ['s1', 'up'],
      );
    });

    test('a title already on the bar is not shown twice', () {
      final slides = [_slide('s1', 'Series'), _slide('s2', 'Series')];
      expect(ids(mediaBarPlaceReserved(slides, [_slide('s2', 'Series')], 2)), [
        's1',
        's2',
      ]);
    });
  });
}
