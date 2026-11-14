import 'package:flutter_test/flutter_test.dart';
import 'package:server_core/server_core.dart';
import 'package:moonfin/data/models/calendar_entry.dart';
import 'package:moonfin/data/repositories/calendar_repository.dart';

Map<String, dynamic> _episode({
  int id = 11,
  int season = 1,
  int episode = 1,
  String airUtc = '2026-11-06T02:00:00Z',
  bool hasFile = false,
  String? finale,
  String? episodeId,
  List<String> libraries = const ['lib-tv'],
}) =>
    {
      'id': id,
      'seasonNumber': season,
      'episodeNumber': episode,
      'title': 'Good News About Hell',
      'airDate': '2026-11-05',
      'airDateUtc': airUtc,
      'hasFile': hasFile,
      'monitored': true,
      'finaleType': ?finale,
      'images': [
        {
          'coverType': 'screenshot',
          'remoteUrl': 'https://image.tmdb.org/t/p/original/still.jpg',
        },
        {'coverType': 'screenshot', 'url': '/MediaCover/1/still.jpg'},
      ],
      'series': {
        'title': 'Severance',
        'tvdbId': 100,
        'tmdbId': 95396,
        'imdbId': 'tt11280740',
        'network': 'Apple TV+',
        'images': [
          {'coverType': 'poster', 'url': '/MediaCover/1/poster.jpg'},
          {
            'coverType': 'poster',
            'remoteUrl': 'https://image.tmdb.org/t/p/original/poster.jpg',
          },
          {'coverType': 'fanart', 'remoteUrl': 'https://artworks.thetvdb.com/fan.jpg'},
        ],
      },
      'moonfinItemId': '500',
      'moonfinEpisodeId': ?episodeId,
      'moonfinLibraryIds': libraries,
    };

class _SignedOut extends Fake implements MediaServerClient {
  @override
  String get baseUrl => 'http://server';
  @override
  String? get accessToken => null;
  @override
  ServerType get serverType => ServerType.jellyfin;
}

void main() {
  test('a load finishes and later loads reuse nothing in flight', () async {
    final repo = CalendarRepository(_SignedOut());
    addTearDown(repo.dispose);
    final start = DateTime(2026, 11, 1);
    final end = DateTime(2026, 12, 1);
    final first = await repo
        .load(start: start, end: end)
        .timeout(const Duration(seconds: 2));
    expect(first.problem, CalendarProblem.notConfigured);
    final again = await repo
        .load(start: start, end: end)
        .timeout(const Duration(seconds: 2));
    expect(again.problem, CalendarProblem.notConfigured);
  });

  group('parseSonarrEntry', () {
    test('reads the episode, its series and the Moonbase fields', () {
      final e = parseSonarrEntry(_episode(episodeId: '501'))!;
      expect(e.key, 'sonarr:11');
      expect(e.isEpisode, isTrue);
      expect(e.title, 'Severance');
      expect(e.episodeTitle, 'Good News About Hell');
      expect(e.hasTime, isTrue);
      expect(e.date, DateTime.utc(2026, 11, 6, 2).toLocal());
      expect(e.network, 'Apple TV+');
      expect(e.itemId, '500');
      expect(e.episodeId, '501');
      expect(e.libraryIds, ['lib-tv']);
      expect(e.inLibrary, isTrue);
      expect(e.reminderKey, 'episode:100:1:1');
    });

    test('keeps only external art and asks TMDB for a sized file', () {
      final e = parseSonarrEntry(_episode())!;
      expect(e.posterUrl, 'https://image.tmdb.org/t/p/w500/poster.jpg');
      expect(e.backdropUrl, 'https://artworks.thetvdb.com/fan.jpg');
      expect(e.stillUrl, 'https://image.tmdb.org/t/p/w780/still.jpg');
    });

    test('tags premieres and finales', () {
      expect(parseSonarrEntry(_episode())!.badge, CalendarBadge.seriesPremiere);
      expect(
        parseSonarrEntry(_episode(season: 3))!.badge,
        CalendarBadge.seasonPremiere,
      );
      expect(
        parseSonarrEntry(_episode(episode: 9, finale: 'season'))!.badge,
        CalendarBadge.seasonFinale,
      );
      expect(parseSonarrEntry(_episode(episode: 4))!.badge, isNull);
      expect(parseSonarrEntry(_episode(season: 0))!.badge, isNull);
    });

    test('drops TBA episode names and entries without a series', () {
      final raw = _episode()..['title'] = 'TBA';
      expect(parseSonarrEntry(raw)!.episodeTitle, isNull);
      expect(parseSonarrEntry({'id': 1, 'airDateUtc': '2026-11-06T02:00:00Z'}), isNull);
    });
  });

  group('parseRadarrEntries', () {
    final movie = {
      'id': 7,
      'title': 'Wicked: For Good',
      'tmdbId': 967941,
      'year': 2025,
      'inCinemas': '2026-11-21T00:00:00Z',
      'digitalRelease': '2026-12-30T00:00:00Z',
      'physicalRelease': '2027-02-10T00:00:00Z',
      'hasFile': false,
      'moonfinItemId': null,
      'moonfinLibraryIds': ['lib-movies'],
    };

    test('makes one entry per release date inside the range', () {
      final list = parseRadarrEntries(
        movie,
        start: DateTime(2026, 11, 1),
        end: DateTime(2027, 1, 1),
      );
      expect(list.map((e) => e.release), [
        CalendarRelease.cinema,
        CalendarRelease.digital,
      ]);
      expect(list.first.date, DateTime(2026, 11, 21));
      expect(list.first.hasTime, isFalse);
      expect(list.first.reminderKey, 'movie:967941');
      expect(list.first.inLibrary, isFalse);
    });

    test('every entry knows whether the movie has a digital date', () {
      final withDigital = parseRadarrEntries(
        movie,
        start: DateTime(2027, 2, 1),
        end: DateTime(2027, 3, 1),
      ).single;
      expect(withDigital.release, CalendarRelease.physical);
      expect(withDigital.hasDigitalDate, isTrue);
      final withoutDigital = parseRadarrEntries(
        {...movie, 'digitalRelease': null},
        start: DateTime(2027, 2, 1),
        end: DateTime(2027, 3, 1),
      ).single;
      expect(withoutDigital.hasDigitalDate, isFalse);
    });

    test('a movie needs its file before it counts as in the library', () {
      final listed = parseRadarrEntries(
        {...movie, 'moonfinItemId': '900'},
        start: DateTime(2026, 11, 1),
        end: DateTime(2026, 12, 1),
      ).single;
      expect(listed.inLibrary, isFalse);
      final downloaded = parseRadarrEntries(
        {...movie, 'moonfinItemId': '900', 'hasFile': true},
        start: DateTime(2026, 11, 1),
        end: DateTime(2026, 12, 1),
      ).single;
      expect(downloaded.playableId, '900');
    });
  });

  group('CalendarFilter', () {
    final ep = parseSonarrEntry(_episode())!;
    final special = parseSonarrEntry(_episode(id: 12, season: 0))!;
    final unplaced = parseSonarrEntry(_episode(id: 13, libraries: const []))!;
    final digital = parseRadarrEntries(
      {
        'title': 'Movie',
        'tmdbId': 1,
        'digitalRelease': '2026-11-10T00:00:00Z',
        'moonfinLibraryIds': ['lib-movies'],
      },
      start: DateTime(2026, 11, 1),
      end: DateTime(2026, 12, 1),
    ).single;

    test('hides specials unless asked', () {
      expect(const CalendarFilter().allows(special), isFalse);
      expect(const CalendarFilter(showSpecials: true).allows(special), isTrue);
    });

    test('follows the type and release type switches', () {
      expect(const CalendarFilter(showEpisodes: false).allows(ep), isFalse);
      expect(const CalendarFilter(showMovies: false).allows(digital), isFalse);
      expect(const CalendarFilter(digital: false).allows(digital), isFalse);
      expect(const CalendarFilter(cinema: false).allows(digital), isTrue);
    });

    test('a picked library hides other and unplaced titles', () {
      const tvOnly = CalendarFilter(libraryIds: {'lib-tv'});
      expect(tvOnly.allows(ep), isTrue);
      expect(tvOnly.allows(digital), isFalse);
      expect(tvOnly.allows(unplaced), isFalse);
      expect(const CalendarFilter().allows(unplaced), isTrue);
    });

    test('My shows keeps followed series and leaves movies alone', () {
      const mine = CalendarFilter(myShowsOnly: true, followedSeriesIds: {'500'});
      expect(mine.allows(ep), isTrue);
      expect(const CalendarFilter(myShowsOnly: true).allows(ep), isFalse);
      expect(const CalendarFilter(myShowsOnly: true).allows(digital), isTrue);
    });
  });

  test('status reads ready, upcoming and missing', () {
    final now = DateTime(2026, 11, 10, 12);
    final ready = parseSonarrEntry(_episode(episodeId: '501'))!;
    final aired = parseSonarrEntry(_episode())!;
    final later = parseSonarrEntry(_episode(airUtc: '2026-11-20T02:00:00Z'))!;
    expect(ready.statusAt(now), CalendarStatus.ready);
    expect(aired.statusAt(now), CalendarStatus.missing);
    expect(later.statusAt(now), CalendarStatus.upcoming);
  });

  test('entries sort by day, timed episodes before all-day movies', () {
    final movie = parseRadarrEntries(
      {'title': 'A', 'tmdbId': 1, 'inCinemas': '2026-11-06T00:00:00Z'},
      start: DateTime(2026, 11, 1),
      end: DateTime(2026, 12, 1),
    ).single;
    final afternoon = DateTime(2026, 11, 6, 15).toUtc().toIso8601String();
    final ep = parseSonarrEntry(_episode(airUtc: afternoon))!;
    expect(ep.day, movie.day);
    final list = [movie, ep]..sort(compareCalendarEntries);
    expect(list, [ep, movie]);
  });

  test('CalendarSeriesProgress', () {
    expect(const CalendarSeriesProgress(favorite: true).followed, isTrue);
    expect(const CalendarSeriesProgress(started: true, unplayed: 2).behind, isTrue);
    expect(const CalendarSeriesProgress(started: true).behind, isFalse);
    expect(const CalendarSeriesProgress(unplayed: 3).behind, isFalse);
  });
}
