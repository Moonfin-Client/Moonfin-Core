import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

HomeRow _row(String id, [HomeRowType rowType = HomeRowType.pluginDynamic]) =>
    HomeRow(id: id, title: id, rowType: rowType);

/// Every built-in section, the way the sections screen fills the list in,
/// with the media bar first since it also matches recently released rows.
List<HomeSectionConfig> _everySection({bool radarrEnabled = true}) => [
  const HomeSectionConfig(type: HomeSectionType.mediaBar),
  for (final type in HomeSectionType.values)
    if (type != HomeSectionType.none && type != HomeSectionType.mediaBar)
      HomeSectionConfig(
        type: type,
        enabled: type != HomeSectionType.radarrCalendar || radarrEnabled,
      ),
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('which section a Home row comes from', () {
    // The ids and row types HomeViewModel and RowDataSource give each row.
    final rows = <HomeRow, HomeSectionType>{
      _row('resume', HomeRowType.resume): HomeSectionType.resume,
      _row('resumeAudio', HomeRowType.resumeAudio): HomeSectionType.resumeAudio,
      _row('nextUp', HomeRowType.nextUp): HomeSectionType.nextUp,
      _row('latestMedia', HomeRowType.latestMedia): HomeSectionType.latestMedia,
      _row('latest_lib1', HomeRowType.latestMedia): HomeSectionType.latestMedia,
      _row('latest_srv_lib1', HomeRowType.latestMedia):
          HomeSectionType.latestMedia,
      _row('recentlyReleased', HomeRowType.recentlyReleased):
          HomeSectionType.recentlyReleased,
      _row('recently_released_lib1', HomeRowType.recentlyReleased):
          HomeSectionType.recentlyReleased,
      _row('playlists', HomeRowType.playlists): HomeSectionType.playlists,
      _row('audioArtists', HomeRowType.audioArtists):
          HomeSectionType.audioArtists,
      _row('audioAlbums', HomeRowType.audioAlbums): HomeSectionType.audioAlbums,
      _row('audioPlaylists', HomeRowType.audioPlaylists):
          HomeSectionType.audioPlaylists,
      _row('favorites_movies', HomeRowType.favorites):
          HomeSectionType.favoriteMovies,
      _row('favorites_series', HomeRowType.favorites):
          HomeSectionType.favoriteSeries,
      _row('favorites_episodes', HomeRowType.favorites):
          HomeSectionType.favoriteEpisodes,
      _row('favorites_people', HomeRowType.favorites):
          HomeSectionType.favoritePeople,
      _row('favorites_artists', HomeRowType.favorites):
          HomeSectionType.favoriteArtists,
      _row('favorites_musicvideos', HomeRowType.favorites):
          HomeSectionType.favoriteMusicVideos,
      _row('favorites_albums', HomeRowType.favorites):
          HomeSectionType.favoriteAlbums,
      _row('favorites_songs', HomeRowType.favorites):
          HomeSectionType.favoriteSongs,
      _row('collections', HomeRowType.collections): HomeSectionType.collections,
      _row('genres', HomeRowType.genres): HomeSectionType.genres,
      _row('studios', HomeRowType.studios): HomeSectionType.studios,
      _row('libraryTiles', HomeRowType.libraryTiles):
          HomeSectionType.libraryTilesSmall,
      _row('libraryTilesSmall', HomeRowType.libraryTilesSmall):
          HomeSectionType.libraryButtons,
      _row('liveTv', HomeRowType.liveTv): HomeSectionType.liveTv,
      _row('liveTvOnNow', HomeRowType.liveTvOnNow): HomeSectionType.liveTv,
      _row('onNow', HomeRowType.liveTvOnNow): HomeSectionType.onNow,
      _row('liveTvFavorites', HomeRowType.liveTvFavorites):
          HomeSectionType.liveTv,
      _row('activeRecordings', HomeRowType.activeRecordings):
          HomeSectionType.activeRecordings,
      _row('seerr_shortcuts'): HomeSectionType.seerrShortcuts,
      _row('seerr_recent_requests'): HomeSectionType.seerrRecentRequests,
      _row('seerr_watchlist'): HomeSectionType.seerrWatchlist,
      _row('seerr_recently_added'): HomeSectionType.seerrRecentlyAdded,
      _row('seerr_popular_movies'): HomeSectionType.seerrPopularMovies,
      _row('seerr_upcoming_movies'): HomeSectionType.seerrUpcomingMovies,
      _row('seerr_popular_series'): HomeSectionType.seerrPopularSeries,
      _row('seerr_upcoming_series'): HomeSectionType.seerrUpcomingSeries,
      _row('seerr_trending'): HomeSectionType.seerrTrending,
      _row('seerr_movie_genres'): HomeSectionType.seerrMovieGenres,
      _row('seerr_studios'): HomeSectionType.seerrStudios,
      _row('seerr_series_genres'): HomeSectionType.seerrSeriesGenres,
      _row('seerr_networks'): HomeSectionType.seerrNetworks,
      _row('imdb_top_250_movies'): HomeSectionType.imdbTop250Movies,
      _row('imdb_top_250_tv_shows'): HomeSectionType.imdbTop250TvShows,
      _row('imdb_most_popular_movies'): HomeSectionType.imdbMostPopularMovies,
      _row('imdb_most_popular_tv_shows'):
          HomeSectionType.imdbMostPopularTvShows,
      _row('imdb_lowest_rated_movies'): HomeSectionType.imdbLowestRatedMovies,
      _row('imdb_top_english_movies'): HomeSectionType.imdbTopEnglishMovies,
      _row('tmdb_popular_movies'): HomeSectionType.tmdbPopularMovies,
      _row('tmdb_top_rated_movies'): HomeSectionType.tmdbTopRatedMovies,
      _row('tmdb_now_playing_movies'): HomeSectionType.tmdbNowPlayingMovies,
      _row('tmdb_upcoming_movies'): HomeSectionType.tmdbUpcomingMovies,
      _row('tmdb_popular_tv'): HomeSectionType.tmdbPopularTv,
      _row('tmdb_top_rated_tv'): HomeSectionType.tmdbTopRatedTv,
      _row('tmdb_airing_today_tv'): HomeSectionType.tmdbAiringTodayTv,
      _row('tmdb_on_the_air_tv'): HomeSectionType.tmdbOnTheAirTv,
      _row('tmdb_trending_movie_daily'): HomeSectionType.tmdbTrendingMovieDaily,
      _row('tmdb_trending_movie_weekly'):
          HomeSectionType.tmdbTrendingMovieWeekly,
      _row('tmdb_trending_tv_daily'): HomeSectionType.tmdbTrendingTvDaily,
      _row('tmdb_trending_tv_weekly'): HomeSectionType.tmdbTrendingTvWeekly,
      _row('tmdb_trending_all_weekly'): HomeSectionType.tmdbTrendingAllWeekly,
      _row('radarr_calendar'): HomeSectionType.radarrCalendar,
      _row('sonarr_calendar'): HomeSectionType.sonarrCalendar,
      _row('merged_calendar'): HomeSectionType.radarrCalendar,
      _row('seasonal'): HomeSectionType.seasonal,
      _row('sinceYouWatched1', HomeRowType.latestMedia):
          HomeSectionType.sinceYouWatched1,
      _row('sinceYouWatched2', HomeRowType.latestMedia):
          HomeSectionType.sinceYouWatched2,
      _row('sinceYouWatched3', HomeRowType.latestMedia):
          HomeSectionType.sinceYouWatched3,
      _row('sinceYouWatched4', HomeRowType.latestMedia):
          HomeSectionType.sinceYouWatched4,
      _row('sinceYouWatched5', HomeRowType.latestMedia):
          HomeSectionType.sinceYouWatched5,
      _row('rewatch', HomeRowType.latestMedia): HomeSectionType.rewatch,
    };

    for (final MapEntry(key: row, value: type) in rows.entries) {
      test('${row.id} belongs to ${type.serializedName}', () {
        final config = HomeViewModel.sectionConfigForRow(row, _everySection());
        expect(config?.type, type);
      });
    }

    test('the merged calendar falls to Sonarr when Radarr is off', () {
      final config = HomeViewModel.sectionConfigForRow(
        _row('merged_calendar'),
        _everySection(radarrEnabled: false),
      );
      expect(config?.type, HomeSectionType.sonarrCalendar);
    });

    test('plugin rows belong to the plugin section with their id', () {
      final plugin = HomeSectionConfig.pluginDynamic(
        serverId: 'srv',
        pluginSection: 'section',
        pluginAdditionalData: 'data',
      );
      final config = HomeViewModel.sectionConfigForRow(
        _row(plugin.stableId, HomeRowType.collections),
        [..._everySection(), plugin],
      );
      expect(config?.stableId, plugin.stableId);
    });

    test('a row no section claims has none', () {
      expect(
        HomeViewModel.sectionConfigForRow(
          _row('imdb_top_250_movies'),
          HomeSectionConfig.defaults(),
        ),
        isNull,
      );
    });
  });

  group('Classic per-row image type', () {
    Future<UserPreferences> createPreferences() async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.setHomeSectionsConfig([
        ...HomeSectionConfig.defaults(),
        const HomeSectionConfig(type: HomeSectionType.imdbTop250Movies),
        const HomeSectionConfig(type: HomeSectionType.tmdbPopularMovies),
      ]);
      return prefs;
    }

    ImageType imageType(HomeRow row, UserPreferences prefs) =>
        HomeScreen.homeRowImageTypeForRow(row, prefs);

    test('reaches the rows keyed apart from their section id', () async {
      final prefs = await createPreferences();
      final rows = <HomeSectionType, HomeRow>{
        HomeSectionType.seasonal: _row('seasonal'),
        HomeSectionType.seerrTrending: _row('seerr_trending'),
        HomeSectionType.imdbTop250Movies: _row('imdb_top_250_movies'),
        HomeSectionType.tmdbPopularMovies: _row('tmdb_popular_movies'),
        HomeSectionType.radarrCalendar: _row('radarr_calendar'),
        HomeSectionType.liveTv: _row('liveTvOnNow', HomeRowType.liveTvOnNow),
        HomeSectionType.onNow: _row('onNow', HomeRowType.liveTvOnNow),
      };

      for (final row in rows.values) {
        expect(imageType(row, prefs), ImageType.poster, reason: row.id);
      }

      for (final MapEntry(key: type, value: row) in rows.entries) {
        await prefs.set(UserPreferences.homeRowImageType(type), ImageType.thumb);
        expect(imageType(row, prefs), ImageType.thumb, reason: row.id);
        await prefs.set(UserPreferences.homeRowImageType(type), ImageType.banner);
        expect(imageType(row, prefs), ImageType.banner, reason: row.id);
      }
    });

    for (final style in HomeRowsStyle.values) {
      test('On Now follows shared artwork behavior in ${style.name} home style', () async {
        final prefs = await createPreferences();
        await prefs.set(UserPreferences.homeRowsStyle, style);
        final standalone = _row('onNow', HomeRowType.liveTvOnNow);
        final bundled = _row('liveTvOnNow', HomeRowType.liveTvOnNow);
        final resume = _row('resume', HomeRowType.resume);
        await prefs.set(
          UserPreferences.homeRowImageType(HomeSectionType.liveTv),
          ImageType.banner,
        );

        for (final selected in ImageType.values) {
          await prefs.set(
            UserPreferences.homeRowImageType(HomeSectionType.onNow),
            selected,
          );
          expect(
            HomeScreen.isRowModern(standalone, prefs),
            HomeScreen.isRowModern(resume, prefs),
          );
          expect(imageType(standalone, prefs), selected);
          expect(
            HomeScreen.isRowModern(bundled, prefs),
            HomeScreen.isRowModern(resume, prefs),
          );
          expect(imageType(bundled, prefs), ImageType.banner);
        }

        await prefs.set(UserPreferences.homeRowsUniversalOverride, true);
        await prefs.set(
          UserPreferences.homeRowsUniversalImageType,
          ImageType.thumb,
        );
        expect(imageType(standalone, prefs), ImageType.thumb);
        expect(imageType(bundled, prefs), ImageType.thumb);
      });
    }

    test('Since You Watched and Rewatch follow their own rows, not Latest Media',
        () async {
      final prefs = await createPreferences();
      await prefs.set(
        UserPreferences.homeRowImageType(HomeSectionType.latestMedia),
        ImageType.banner,
      );
      await prefs.set(
        UserPreferences.homeRowImageType(HomeSectionType.sinceYouWatched2),
        ImageType.thumb,
      );

      expect(
        imageType(_row('sinceYouWatched2', HomeRowType.latestMedia), prefs),
        ImageType.thumb,
      );
      expect(
        imageType(_row('rewatch', HomeRowType.latestMedia), prefs),
        ImageType.poster,
      );
      expect(
        imageType(_row('latest_lib1', HomeRowType.latestMedia), prefs),
        ImageType.banner,
      );
    });

    test('Seerr filter rows keep their tile art whatever their row says',
        () async {
      final prefs = await createPreferences();
      const filterRows = {
        'seerr_shortcuts': HomeSectionType.seerrShortcuts,
        'seerr_movie_genres': HomeSectionType.seerrMovieGenres,
        'seerr_series_genres': HomeSectionType.seerrSeriesGenres,
        'seerr_studios': HomeSectionType.seerrStudios,
        'seerr_networks': HomeSectionType.seerrNetworks,
      };

      for (final MapEntry(key: id, value: type) in filterRows.entries) {
        await prefs.set(UserPreferences.homeRowImageType(type), ImageType.poster);
        expect(imageType(_row(id), prefs), ImageType.thumb, reason: id);
      }
    });

    test('the universal override still wins', () async {
      final prefs = await createPreferences();
      await prefs.set(
        UserPreferences.homeRowImageType(HomeSectionType.seasonal),
        ImageType.thumb,
      );
      await prefs.set(UserPreferences.homeRowsUniversalOverride, true);
      await prefs.set(
        UserPreferences.homeRowsUniversalImageType,
        ImageType.banner,
      );

      expect(imageType(_row('seasonal'), prefs), ImageType.banner);
    });
  });
}
