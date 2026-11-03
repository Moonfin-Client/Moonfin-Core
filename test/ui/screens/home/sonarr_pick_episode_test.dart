import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

Map<String, Object> _episode(int number, DateTime airsLocal, {bool hasFile = false}) => {
      'SeasonNumber': '1',
      'EpisodeNumber': '$number',
      'AirDateUtc': airsLocal.toUtc().toIso8601String(),
      'HasFile': hasFile,
    };

void main() {
  final now = DateTime(2026, 10, 31, 12);

  group('the Sonarr row picks the episode to show for a series', () {
    test('an episode that aired yesterday is skipped for the next one', () {
      final episodes = [
        _episode(1, DateTime(2026, 10, 30, 21)),
        _episode(2, DateTime(2026, 11, 6, 21)),
      ];

      final picked = HomeViewModel.pickSonarrEpisode(episodes, now: now, hideDownloaded: false);

      expect(picked?['EpisodeNumber'], '2');
    });

    test('an episode airing earlier today still counts', () {
      final episodes = [_episode(1, DateTime(2026, 10, 31, 1))];

      final picked = HomeViewModel.pickSonarrEpisode(episodes, now: now, hideDownloaded: false);

      expect(picked?['EpisodeNumber'], '1');
    });

    test('a downloaded episode is skipped only when hiding them', () {
      final episodes = [
        _episode(1, DateTime(2026, 11, 1, 21), hasFile: true),
        _episode(2, DateTime(2026, 11, 8, 21)),
      ];

      expect(
        HomeViewModel.pickSonarrEpisode(episodes, now: now, hideDownloaded: true)?['EpisodeNumber'],
        '2',
      );
      expect(
        HomeViewModel.pickSonarrEpisode(episodes, now: now, hideDownloaded: false)?['EpisodeNumber'],
        '1',
      );
    });

    test('a series with nothing left to show gets no episode', () {
      final episodes = [_episode(1, DateTime(2026, 11, 1, 21), hasFile: true)];

      expect(HomeViewModel.pickSonarrEpisode(episodes, now: now, hideDownloaded: true), isNull);
    });
  });
}
