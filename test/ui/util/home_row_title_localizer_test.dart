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
}
