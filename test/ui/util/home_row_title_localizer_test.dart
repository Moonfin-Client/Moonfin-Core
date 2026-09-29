import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_discover_sliders.dart';
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

// Foreseerr's own English wording for the rows it ships with, from its
// discover page, so Moonfin names them the same way.
const _foreseerrTitles = {
  ForeseerrSliderType.traktRecommendations: 'Trakt Recommendations',
  ForeseerrSliderType.traktWatchlist: 'Trakt Watchlist',
  ForeseerrSliderType.traktHistory: 'Trakt History',
  ForeseerrSliderType.anilistTrending: 'AniList Trending',
  ForeseerrSliderType.anilistSeason: 'AniList This Season',
  ForeseerrSliderType.anilistPopular: 'AniList Popular',
  ForeseerrSliderType.anilistTop: 'AniList Top 100',
  ForeseerrSliderType.anilistNextSeason: 'AniList Next Season',
  ForeseerrSliderType.anilistWatching: 'AniList Watching',
  ForeseerrSliderType.anilistPlanning: 'AniList Planning',
  ForeseerrSliderType.anilistCompleted: 'AniList Completed',
  ForeseerrSliderType.simklTrending: 'Simkl Trending',
  ForeseerrSliderType.simklPlanToWatch: 'Simkl Plan to Watch',
  ForeseerrSliderType.simklWatching: 'Simkl Watching',
  ForeseerrSliderType.simklOnHold: 'Simkl On Hold',
  ForeseerrSliderType.simklCompleted: 'Simkl Completed',
  ForeseerrSliderType.simklDropped: 'Simkl Dropped',
};

SeerrDiscoverSlider _builtIn(int type) => SeerrDiscoverSlider(
  id: 1,
  type: type,
  endpoint: '/api/v1/discover/x',
  defaultTitle: 'Server Name',
);

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

  group('discover sliders', () {
    test('Foreseerr built-in rows get Foreseerr\'s English titles', () {
      for (final entry in _foreseerrTitles.entries) {
        expect(
          localizeSeerrSliderTitle(_builtIn(entry.key), _l10n),
          entry.value,
          reason: 'type ${entry.key}',
        );
      }
    });

    test('a row this client has no name for uses the server\'s', () {
      expect(localizeSeerrSliderTitle(_builtIn(1099), _l10n), 'Server Name');
    });

    test('an admin slider keeps the title it was given', () {
      const slider = SeerrDiscoverSlider(
        id: 3,
        type: ForeseerrSliderType.traktList,
        title: 'Staff Picks',
        data: 'https://trakt.tv/users/a/lists/b',
      );
      expect(localizeSeerrSliderTitle(slider, _l10n), 'Staff Picks');
    });
  });
}
