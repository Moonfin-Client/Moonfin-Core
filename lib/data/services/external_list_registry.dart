import 'dart:convert';

import '../../l10n/app_localizations.dart';
import '../../preference/home_section_config.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';

/// Shared definitions for the external lists (custom lists plus built-in IMDb and
/// TMDB charts) that can feed both the home screen rows and the media bar. Keeping
/// the config building in one place means the media bar source picker and the home
/// rows always resolve to the same [HomeSectionConfig.stableId], so a selection made
/// in one place fetches the same list in the other.

/// The TMDB chart endpoint path for a chart section, as sent to the plugin.
String tmdbChartTypeForSection(HomeSectionType section) {
  return switch (section) {
    HomeSectionType.tmdbPopularMovies => 'movie/popular',
    HomeSectionType.tmdbTopRatedMovies => 'movie/top_rated',
    HomeSectionType.tmdbNowPlayingMovies => 'movie/now_playing',
    HomeSectionType.tmdbUpcomingMovies => 'movie/upcoming',
    HomeSectionType.tmdbPopularTv => 'tv/popular',
    HomeSectionType.tmdbTopRatedTv => 'tv/top_rated',
    HomeSectionType.tmdbAiringTodayTv => 'tv/airing_today',
    HomeSectionType.tmdbOnTheAirTv => 'tv/on_the_air',
    HomeSectionType.tmdbTrendingMovieDaily => 'trending/movie/day',
    HomeSectionType.tmdbTrendingMovieWeekly => 'trending/movie/week',
    HomeSectionType.tmdbTrendingTvDaily => 'trending/tv/day',
    HomeSectionType.tmdbTrendingTvWeekly => 'trending/tv/week',
    HomeSectionType.tmdbTrendingAllWeekly => 'trending/all/week',
    _ => 'movie/popular',
  };
}

/// Builds the config for an IMDb chart row. The title doesn't affect the stable id.
HomeSectionConfig imdbRowConfig({required String rowId, String title = ''}) {
  return HomeSectionConfig.pluginDynamic(
    serverId: 'seerr',
    pluginSection: rowId,
    pluginDisplayText: title,
    pluginSource: HomeSectionPluginSource.custom,
    pluginAdditionalData: jsonEncode({'source': 'imdb', 'type': rowId}),
  );
}

/// Builds the config for a TMDB chart row. The title doesn't affect the stable id.
HomeSectionConfig tmdbChartConfig({
  required HomeSectionType section,
  required String rowId,
  String title = '',
}) {
  return HomeSectionConfig.pluginDynamic(
    serverId: 'seerr',
    pluginSection: rowId,
    pluginDisplayText: title,
    pluginSource: HomeSectionPluginSource.custom,
    pluginAdditionalData: jsonEncode({
      'source': 'tmdb_chart',
      'type': tmdbChartTypeForSection(section),
    }),
  );
}

/// A built-in IMDb or TMDB chart that can be selected as a source.
class BuiltinExternalList {
  final HomeSectionType section;
  final String rowId;
  final bool isImdb;
  final String Function(AppLocalizations l10n) label;

  const BuiltinExternalList({
    required this.section,
    required this.rowId,
    required this.isImdb,
    required this.label,
  });

  HomeSectionConfig config([String title = '']) => isImdb
      ? imdbRowConfig(rowId: rowId, title: title)
      : tmdbChartConfig(section: section, rowId: rowId, title: title);
}

/// Every built-in chart, in the order shown on the External Lists screen. The row
/// ids and titles mirror the home screen dispatch so the stable ids line up.
final List<BuiltinExternalList> kBuiltinExternalLists = [
  BuiltinExternalList(
    section: HomeSectionType.imdbTop250Movies,
    rowId: 'imdb_top_250_movies',
    isImdb: true,
    label: (l10n) => l10n.imdbTop250Movies,
  ),
  BuiltinExternalList(
    section: HomeSectionType.imdbTop250TvShows,
    rowId: 'imdb_top_250_tv_shows',
    isImdb: true,
    label: (l10n) => l10n.imdbTop250TvShows,
  ),
  BuiltinExternalList(
    section: HomeSectionType.imdbMostPopularMovies,
    rowId: 'imdb_most_popular_movies',
    isImdb: true,
    label: (l10n) => l10n.imdbMostPopularMovies,
  ),
  BuiltinExternalList(
    section: HomeSectionType.imdbMostPopularTvShows,
    rowId: 'imdb_most_popular_tv_shows',
    isImdb: true,
    label: (l10n) => l10n.imdbMostPopularTvShows,
  ),
  BuiltinExternalList(
    section: HomeSectionType.imdbLowestRatedMovies,
    rowId: 'imdb_lowest_rated_movies',
    isImdb: true,
    label: (l10n) => l10n.imdbLowestRatedMovies,
  ),
  BuiltinExternalList(
    section: HomeSectionType.imdbTopEnglishMovies,
    rowId: 'imdb_top_english_movies',
    isImdb: true,
    label: (l10n) => l10n.imdbTopEnglishMovies,
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbPopularMovies,
    rowId: 'tmdb_popular_movies',
    isImdb: false,
    label: (l10n) => 'Popular Movies',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTopRatedMovies,
    rowId: 'tmdb_top_rated_movies',
    isImdb: false,
    label: (l10n) => 'Top Rated Movies',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbNowPlayingMovies,
    rowId: 'tmdb_now_playing_movies',
    isImdb: false,
    label: (l10n) => 'Now Playing Movies',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbUpcomingMovies,
    rowId: 'tmdb_upcoming_movies',
    isImdb: false,
    label: (l10n) => 'Upcoming Movies',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbPopularTv,
    rowId: 'tmdb_popular_tv',
    isImdb: false,
    label: (l10n) => 'Popular TV',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTopRatedTv,
    rowId: 'tmdb_top_rated_tv',
    isImdb: false,
    label: (l10n) => 'Top Rated TV',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbAiringTodayTv,
    rowId: 'tmdb_airing_today_tv',
    isImdb: false,
    label: (l10n) => 'Airing Today TV',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbOnTheAirTv,
    rowId: 'tmdb_on_the_air_tv',
    isImdb: false,
    label: (l10n) => 'On The Air TV',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTrendingMovieDaily,
    rowId: 'tmdb_trending_movie_daily',
    isImdb: false,
    label: (l10n) => 'Trending Movies (Daily)',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTrendingMovieWeekly,
    rowId: 'tmdb_trending_movie_weekly',
    isImdb: false,
    label: (l10n) => 'Trending Movies (Weekly)',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTrendingTvDaily,
    rowId: 'tmdb_trending_tv_daily',
    isImdb: false,
    label: (l10n) => 'Trending TV (Daily)',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTrendingTvWeekly,
    rowId: 'tmdb_trending_tv_weekly',
    isImdb: false,
    label: (l10n) => 'Trending TV (Weekly)',
  ),
  BuiltinExternalList(
    section: HomeSectionType.tmdbTrendingAllWeekly,
    rowId: 'tmdb_trending_all_weekly',
    isImdb: false,
    label: (l10n) => 'Trending All (Weekly)',
  ),
];

/// A selectable external list source with its display label and resolved config.
class ExternalListOption {
  final String stableId;
  final String label;
  final HomeSectionConfig config;

  const ExternalListOption({
    required this.stableId,
    required this.label,
    required this.config,
  });
}

/// The user's configured custom lists (the ones added through the Custom wizard).
List<HomeSectionConfig> _customExternalListConfigs(UserPreferences prefs) {
  return prefs.homeSectionsConfig
      .where(
        (c) =>
            c.isPluginDynamic &&
            c.pluginSource == HomeSectionPluginSource.custom,
      )
      .toList();
}

/// The options shown in the media bar External Media picker: every custom list plus
/// every built-in chart. Charts are offered regardless of whether they are also
/// enabled as home rows, so the media bar source can be set on its own.
List<ExternalListOption> externalListOptions(
  UserPreferences prefs,
  AppLocalizations l10n,
) {
  final options = <ExternalListOption>[];

  for (final config in _customExternalListConfigs(prefs)) {
    options.add(
      ExternalListOption(
        stableId: config.stableId,
        label: config.pluginDisplayText?.isNotEmpty == true
            ? config.pluginDisplayText!
            : (config.pluginSection ?? 'List'),
        config: config,
      ),
    );
  }

  for (final chart in kBuiltinExternalLists) {
    final label = chart.label(l10n);
    final config = chart.config(label);
    options.add(
      ExternalListOption(
        stableId: config.stableId,
        label: label,
        config: config,
      ),
    );
  }

  return options;
}

/// Resolves the stored stable ids back to their configs for fetching. Ids that no
/// longer match a configured list (a deleted custom list) are skipped.
List<HomeSectionConfig> resolveExternalListConfigs(
  UserPreferences prefs,
  Iterable<String> stableIds,
) {
  final wanted = stableIds.toSet();
  if (wanted.isEmpty) return const [];

  final byId = <String, HomeSectionConfig>{};
  for (final config in _customExternalListConfigs(prefs)) {
    byId[config.stableId] = config;
  }
  for (final chart in kBuiltinExternalLists) {
    // The title doesn't affect the stable id or the fetch, so an empty one is fine.
    final config = chart.config();
    byId[config.stableId] = config;
  }

  return [
    for (final id in wanted)
      if (byId[id] != null) byId[id]!,
  ];
}
