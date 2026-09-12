import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:moonfin/data/models/upcoming_episode_info.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/detail_metadata_layout.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DetailMetadataItem', () {
    test('contains all expected metadata entries', () {
      final ids = DetailMetadataItem.values.map((e) => e.id).toList();
      expect(ids, contains('year'));
      expect(ids, contains('parentalRating'));
      expect(ids, contains('runtimeAndSeasons'));
      expect(ids, contains('status'));
      expect(ids, contains('genres'));
      expect(ids, contains('seerrAvailability'));
      expect(ids, contains('upcomingEpisodeDate'));
    });

    testWidgets('provides subtitles for relevant metadata items', (tester) async {
      late BuildContext testContext;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              testContext = context;
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      final l10n = AppLocalizations.of(testContext);
      expect(
        DetailMetadataItem.upcomingEpisodeDate.label(l10n),
        'Upcoming Episodes',
      );
      expect(
        DetailMetadataItem.upcomingEpisodeDate.subtitle(l10n),
        'Uses Sonarr and TMDB to show upcoming release dates',
      );
      expect(
        DetailMetadataItem.status.subtitle(l10n),
        'Shows whether the series is continuing, ended, or returning',
      );
      expect(
        DetailMetadataItem.seerrAvailability.subtitle(l10n),
        'Shows request and media availability status from Seerr',
      );
      expect(DetailMetadataItem.year.subtitle(l10n), isNull);
      expect(DetailMetadataItem.genres.subtitle(l10n), isNull);
      expect(DetailMetadataItem.parentalRating.subtitle(l10n), isNull);
      expect(DetailMetadataItem.runtimeAndSeasons.subtitle(l10n), isNull);
    });
  });

  group('UpcomingEpisodeInfo formatting', () {
    testWidgets('formats today, tomorrow, within 7 days, and beyond', (
      tester,
    ) async {
      late BuildContext testContext;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              testContext = context;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      final now = DateTime.now();

      // Today
      final todayInfo = UpcomingEpisodeInfo(
        seasonNumber: 2,
        episodeNumber: 1,
        airDate: now,
      );
      expect(todayInfo.format(testContext), 'Next: Today (S2:E1)');

      // Tomorrow
      final tomorrowInfo = UpcomingEpisodeInfo(
        seasonNumber: 2,
        episodeNumber: 2,
        airDate: now.add(const Duration(days: 1)),
      );
      expect(tomorrowInfo.format(testContext), 'Next: Tomorrow (S2:E2)');

      // 3 days away (within 7 days)
      final threeDays = now.add(const Duration(days: 3));
      final threeDaysInfo = UpcomingEpisodeInfo(
        seasonNumber: 2,
        episodeNumber: 3,
        airDate: threeDays,
      );
      final expectedWeekday = DateFormat.EEEE().format(threeDays.toLocal());
      expect(
        threeDaysInfo.format(testContext),
        'Next: $expectedWeekday (S2:E3)',
      );

      // 14 days away (beyond 7 days)
      final twoWeeks = now.add(const Duration(days: 14));
      final twoWeeksInfo = UpcomingEpisodeInfo(
        seasonNumber: 2,
        episodeNumber: 4,
        airDate: twoWeeks,
      );
      final expectedMonthDay = DateFormat.MMMd().format(twoWeeks.toLocal());
      expect(
        twoWeeksInfo.format(testContext),
        'Next: $expectedMonthDay (S2:E4)',
      );
    });
  });
}
