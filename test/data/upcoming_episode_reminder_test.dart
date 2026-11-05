import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/upcoming_episode_info.dart';
import 'package:moonfin/data/services/upcoming_episode_service.dart';

UpcomingEpisodeInfo _info(int season, int episode, {String? title}) =>
    UpcomingEpisodeInfo(
      seasonNumber: season,
      episodeNumber: episode,
      airDate: DateTime.utc(2026, 11, 12, 2),
      title: title,
    );

AggregatedItem _series(Map<String, String> providerIds) => AggregatedItem(
  id: 'series',
  serverId: 'server',
  rawData: {'Name': 'Severance', 'ProviderIds': providerIds},
);

void main() {
  group('the next air date only counts for the episode right after', () {
    test('the next episode of the season', () {
      expect(_info(2, 4).follows(2, 3), isTrue);
    });

    test('the first episode of the next season', () {
      expect(_info(3, 1).follows(2, 10), isTrue);
    });

    test('not a season further on, which the library may already hold', () {
      expect(_info(4, 1).follows(2, 10), isFalse);
    });

    test('not an episode further on', () {
      expect(_info(2, 6).follows(2, 3), isFalse);
    });

    test('not when the episode has no numbers', () {
      expect(_info(2, 4).follows(null, 3), isFalse);
      expect(_info(2, 4).follows(2, null), isFalse);
    });
  });

  group('the end card reminder', () {
    test('is keyed and shaped the way the calendar sends it', () {
      final entry = upcomingEpisodeReminder(
        _series({'Tvdb': '371980', 'Tmdb': '95396', 'Imdb': 'tt11280740'}),
        _info(2, 4, title: 'Woe\'s Hollow'),
      )!;

      expect(entry.reminderKey, 'episode:371980:2:4');
      expect(entry.reminderBody(), {
        'kind': 'episode',
        'tvdbId': 371980,
        'tmdbId': 95396,
        'imdbId': 'tt11280740',
        'seasonNumber': 2,
        'episodeNumber': 4,
        'title': 'Severance',
        'subtitle': 'Woe\'s Hollow',
      });
    });

    test('drops the TBA placeholder title', () {
      final entry = upcomingEpisodeReminder(
        _series({'Tvdb': '371980'}),
        _info(2, 4, title: 'TBA'),
      )!;

      expect(entry.reminderBody()['subtitle'], isNull);
    });

    test('needs a TVDB id, which the server matches episodes by', () {
      expect(
        upcomingEpisodeReminder(_series({'Tmdb': '95396'}), _info(2, 4)),
        isNull,
      );
    });
  });
}
