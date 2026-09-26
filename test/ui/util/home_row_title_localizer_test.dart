import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/util/home_row_title_localizer.dart';

final _l10n = AppLocalizationsEn();

// The wording the Seerr page showed while these titles were hardcoded in the
// view model. They are spelled out as literals on purpose, because comparing
// against the l10n getters would restate the implementation and pass either
// way.
const _englishTitles = {
  SeerrRowType.shortcuts: 'Seerr Browse',
  SeerrRowType.recentRequests: 'Recent Requests',
  SeerrRowType.yourWatchlist: 'Your Watchlist',
  SeerrRowType.recentlyAdded: 'Recently Added',
  SeerrRowType.trending: 'Trending',
  SeerrRowType.popularMovies: 'Popular Movies',
  SeerrRowType.movieGenres: 'Movie Genres',
  SeerrRowType.upcomingMovies: 'Upcoming Movies',
  SeerrRowType.studios: 'Studios',
  SeerrRowType.popularSeries: 'Popular Series',
  SeerrRowType.seriesGenres: 'Series Genres',
  SeerrRowType.upcomingSeries: 'Upcoming Series',
  SeerrRowType.networks: 'Networks',
};

void main() {
  test('every row keeps the English title it had before', () {
    for (final entry in _englishTitles.entries) {
      expect(
        localizeSeerrRowTitle(entry.key, _l10n),
        entry.value,
        reason: 'the ${entry.key.name} row changed wording in English',
      );
    }
  });

  test('the pinned wording covers every row type', () {
    expect(_englishTitles.keys.toSet(), SeerrRowType.values.toSet());
  });

  group('localizeHomeSectionTitle', () {
    // Spelled out rather than read from the l10n getters, which would pass either way.
    test('tells audio playlists apart from playlists', () {
      expect(
        localizeHomeSectionTitle(HomeSectionType.audioPlaylists, _l10n),
        'Audio Playlists',
      );
      expect(
        localizeHomeSectionTitle(HomeSectionType.playlists, _l10n),
        'Playlists',
      );
    });

    test('names the sections it is asked about', () {
      expect(
        localizeHomeSectionTitle(HomeSectionType.mediaBar, _l10n),
        'Media Bar',
      );
      expect(
        localizeHomeSectionTitle(HomeSectionType.resume, _l10n),
        'Continue Watching',
      );
      expect(localizeHomeSectionTitle(HomeSectionType.none, _l10n), 'None');
    });

    // A new section missing here would throw.
    test('has something to say about every section there is', () {
      for (final type in HomeSectionType.values) {
        expect(
          localizeHomeSectionTitle(type, _l10n),
          isNotEmpty,
          reason: 'no title for $type',
        );
      }
    });
  });
}
