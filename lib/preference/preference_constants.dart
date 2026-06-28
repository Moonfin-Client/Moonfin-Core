enum SubtitleMode {
  flagged,
  always,
  foreign,
  forced,
  none,
}

enum AudioOutputMode {
  auto,
  forceStereo,
  avrPassthrough,
}

enum AudioFallbackCodec {
  auto,
  aac,
  ac3,
  eac3,
  truehd,
  mp3,
  opus,
  flac,
}

/// High-level audio output choice shown to the user. It is a convenience that
/// bulk-writes through to [AudioOutputMode] and the individual passthrough
/// toggles, so the device-profile builder never needs to know about it.
/// - [auto]: decode locally / let detection drive passthrough (toggles unset).
/// - [surroundReceiver]: AVR passthrough; advertise everything the receiver
///   reports it supports (toggles unset, capability-authoritative).
/// - [stereo]: force a stereo downmix.
/// - [advanced]: user manages [AudioOutputMode] + per-codec toggles directly.
enum AudioPassthroughPreset {
  auto,
  surroundReceiver,
  stereo,
  advanced,
}

enum PlaybackEnginePreference {
  media3,
  mpv,
}

enum DolbyVisionFallbackBehavior {
  ask,
  hdr10Fallback,
  transcode,
}

enum DolbyVisionProfile7DirectPlayBehavior {
  auto,
  enabled,
  disabled,
}

enum ClockBehavior {
  always,
  inMenus,
  never,
}

enum MaxVideoResolution {
  auto(width: 0, height: 0),
  res480p(width: 720, height: 480),
  res720p(width: 1280, height: 720),
  res1080p(width: 1920, height: 1080),
  res2160p(width: 3840, height: 2160);

  const MaxVideoResolution({required this.width, required this.height});
  final int width;
  final int height;
}

enum NavbarPosition {
  top,
  left,
  bottom,
}

enum NextUpBehavior {
  extended,
  minimal,
  disabled;

  static const nextUpTimerDisabled = 0;
}

enum PosterSize {
  small(portraitHeight: 120, landscapeHeight: 88),
  medium(portraitHeight: 150, landscapeHeight: 110),
  large(portraitHeight: 180, landscapeHeight: 132),
  extraLarge(portraitHeight: 210, landscapeHeight: 154);

  const PosterSize({required this.portraitHeight, required this.landscapeHeight});
  final int portraitHeight;
  final int landscapeHeight;
}

enum FavoritesViewStyle {
  home,
  library,
}

enum HomeRowsStyle {
  v1,
  v2,
}

enum DesktopUiScale {
  small(0.9),
  medium(1.0),
  large(1.15),
  extraLarge(1.3);

  const DesktopUiScale(this.scaleFactor);
  final double scaleFactor;
}

enum RefreshRateSwitchingBehavior {
  disabled,
  scaleOnTv,
  scaleOnDevice,
}

enum AutoHdrSwitchingBehavior {
  disabled,
  whenFullscreen,
  always,
}

enum StillWatchingBehavior {
  short_(episodes: 2, hours: 1.0),
  medium(episodes: 3, hours: 1.5),
  long_(episodes: 5, hours: 2.5),
  veryLong(episodes: 8, hours: 4.0),
  disabled(episodes: 0, hours: 0);

  const StillWatchingBehavior({required this.episodes, required this.hours});
  final int episodes;
  final double hours;
}

enum WatchedIndicatorBehavior {
  always,
  hideUnwatched,
  episodesOnly,
  never,
}

enum ZoomMode {
  fit,
  autoCrop,
  stretch,
}

enum DesktopScrollWheelAction {
  off,
  seek,
  volume,
}

enum AppTheme {
  white(0xFFFFFFFF),
  black(0xFF000000),
  gray(0xFF808080),
  darkBlue(0xFF003366),
  purple(0xFF6A0DAD),
  teal(0xFF008080),
  navy(0xFF000080),
  charcoal(0xFF36454F),
  brown(0xFF8B4513),
  darkRed(0xFF8B0000),
  darkGreen(0xFF006400),
  slate(0xFF708090),
  indigo(0xFF4B0082),
  moonfinCyan(0xFF00A4DC),
  neonPulseMagenta(0xFFFF2E92);

  const AppTheme(this.colorValue);
  final int colorValue;
}

enum VisualThemeId {
  moonfin,
  neonPulse,
  glass,
}

enum RatingType {
  tomatoes,
  rtAudience,
  stars,
  imdb,
  tmdb,
  metacritic,
  metacriticUser,
  trakt,
  letterboxd,
  myAnimeList,
  aniList,
  hidden,
}

enum MediaSegmentAction {
  nothing,
  skip,
  askToSkip,
}

enum MediaSegmentCountdown {
  progressBar,
  timer,
  both,
  none,
}

enum ImageType {
  poster,
  thumb,
  banner,
}

enum UserSelectBehavior {
  disabled,
  lastUser,
  currentUser,
}

enum HomeSectionType {
  mediaBar('mediabar'),
  latestMedia('latestmedia'),
  recentlyReleased('recentlyreleased'),
  libraryTilesSmall('smalllibrarytiles'),
  libraryButtons('librarybuttons'),
  resume('resume'),
  resumeAudio('resumeaudio'),
  resumeBook('resumebook'),
  activeRecordings('activerecordings'),
  nextUp('nextup'),
  playlists('playlists'),
  audioArtists('audioartists'),
  audioAlbums('audioalbums'),
  audioPlaylists('audioplaylists'),
  favoriteMovies('favoritemovies'),
  favoriteSeries('favoriteseries'),
  favoriteEpisodes('favoriteepisodes'),
  favoritePeople('favoritepeople'),
  favoriteArtists('favoriteartists'),
  favoriteMusicVideos('favoritemusicvideos'),
  favoriteAlbums('favoritealbums'),
  favoriteSongs('favoritesongs'),
  collections('collections'),
  genres('genres'),
  liveTv('livetv'),
  seerrRecentRequests('seerr_recent_requests'),
  seerrRecentlyAdded('seerr_recently_added'),
  seerrPopularMovies('seerr_popular_movies'),
  seerrUpcomingMovies('seerr_upcoming_movies'),
  seerrPopularSeries('seerr_popular_series'),
  seerrUpcomingSeries('seerr_upcoming_series'),
  seerrTrending('seerr_trending'),
  seerrMovieGenres('seerr_movie_genres'),
  seerrStudios('seerr_studios'),
  seerrSeriesGenres('seerr_series_genres'),
  seerrNetworks('seerr_networks'),
  imdbTop250Movies('imdb_top_250_movies'),
  imdbTop250TvShows('imdb_top_250_tv_shows'),
  imdbMostPopularMovies('imdb_most_popular_movies'),
  imdbMostPopularTvShows('imdb_most_popular_tv_shows'),
  imdbLowestRatedMovies('imdb_lowest_rated_movies'),
  imdbTopEnglishMovies('imdb_top_english_movies'),
  tmdbPopularMovies('tmdb_popular_movies'),
  tmdbTopRatedMovies('tmdb_top_rated_movies'),
  tmdbNowPlayingMovies('tmdb_now_playing_movies'),
  tmdbUpcomingMovies('tmdb_upcoming_movies'),
  tmdbPopularTv('tmdb_popular_tv'),
  tmdbTopRatedTv('tmdb_top_rated_tv'),
  tmdbAiringTodayTv('tmdb_airing_today_tv'),
  tmdbOnTheAirTv('tmdb_on_the_air_tv'),
  tmdbTrendingMovieDaily('tmdb_trending_movie_daily'),
  tmdbTrendingMovieWeekly('tmdb_trending_movie_weekly'),
  tmdbTrendingTvDaily('tmdb_trending_tv_daily'),
  tmdbTrendingTvWeekly('tmdb_trending_tv_weekly'),
  tmdbTrendingAllWeekly('tmdb_trending_all_weekly'),
  radarrCalendar('radarr_calendar'),
  sonarrCalendar('sonarr_calendar'),
  none('none');

  const HomeSectionType(this.serializedName);
  final String serializedName;

  static HomeSectionType fromSerialized(String name) {
    if (name == 'watchlist') return HomeSectionType.playlists;
    return HomeSectionType.values.firstWhere(
      (e) => e.serializedName == name,
      orElse: () => HomeSectionType.none,
    );
  }
}

enum LibrarySortBy {
  name('SortName', 'Name'),
  dateAdded('DateCreated', 'Date Added'),
  premiereDate('PremiereDate', 'Premiere Date'),
  rating('OfficialRating', 'Rating'),
  runtime('Runtime', 'Runtime'),
  random('Random', 'Random'),
  criticRating('CriticRating', 'Critic Rating'),
  communityRating('CommunityRating', 'Community Rating');

  const LibrarySortBy(this.apiValue, this.displayName);
  final String apiValue;
  final String displayName;
}

enum GenresRowItemFilter {
  movies(['Movie'], 'Movies'),
  series(['Series'], 'Series'),
  both(['Movie', 'Series'], 'Both');

  const GenresRowItemFilter(this.includeItemTypes, this.displayName);
  final List<String> includeItemTypes;
  final String displayName;
}

enum SortDirection {
  ascending,
  descending,
}

enum PlayedStatusFilter {
  all,
  watched,
  unwatched,
}

enum SeriesStatusFilter {
  all,
  continuing,
  ended,
}

enum FavoriteTypeFilter {
  all,
  movie,
  series,
  episode,
  person,
  musicVideo,
  musicAlbum,
  musicArtist,
  audio,
  collection;

  String get displayName => switch (this) {
    all => 'All',
    movie => 'Movies',
    series => 'Series',
    episode => 'Episodes',
    person => 'People',
    musicVideo => 'Music Videos',
    musicAlbum => 'Albums',
    musicArtist => 'Artists',
    audio => 'Songs',
    collection => 'Collections',
  };

  List<String>? get itemTypes => switch (this) {
    all => null,
    movie => ['Movie'],
    series => ['Series'],
    episode => ['Episode'],
    person => ['Person'],
    musicVideo => ['MusicVideo'],
    musicAlbum => ['MusicAlbum'],
    musicArtist => ['MusicArtist'],
    audio => ['Audio'],
    collection => ['BoxSet'],
  };

  static FavoriteTypeFilter fromRowId(String id) {
    return switch (id) {
      'favorites_movies' => FavoriteTypeFilter.movie,
      'favorites_series' => FavoriteTypeFilter.series,
      'favorites_episodes' => FavoriteTypeFilter.episode,
      'favorites_people' => FavoriteTypeFilter.person,
      'favorites_artists' => FavoriteTypeFilter.musicArtist,
      'favorites_musicvideos' => FavoriteTypeFilter.musicVideo,
      'favorites_albums' => FavoriteTypeFilter.musicAlbum,
      'favorites_songs' => FavoriteTypeFilter.audio,
      'favorites_collections' => FavoriteTypeFilter.collection,
      _ => FavoriteTypeFilter.all,
    };
  }
}

enum SeerrFetchLimit {
  small(25),
  medium(50),
  large(75);

  const SeerrFetchLimit(this.limit);
  final int limit;
}

enum SeerrRowType {
  recentRequests('recent_requests'),
  recentlyAdded('recently_added'),
  trending('trending'),
  popularMovies('popular_movies'),
  movieGenres('movie_genres'),
  upcomingMovies('upcoming_movies'),
  studios('studios'),
  popularSeries('popular_series'),
  seriesGenres('series_genres'),
  upcomingSeries('upcoming_series'),
  networks('networks');

  const SeerrRowType(this.serializedName);
  final String serializedName;

  static SeerrRowType fromSerialized(String name) =>
      SeerrRowType.values.firstWhere(
        (e) => e.serializedName == name,
        orElse: () => SeerrRowType.trending,
      );
}

enum ScreensaverMode { library, logo }

enum ScreensaverClockMode { off, staticCorner, bouncing }

enum ScreensaverTimeout {
  m1(1),
  m2(2),
  m3(3),
  m5(5),
  m10(10),
  m15(15),
  m30(30);

  const ScreensaverTimeout(this.minutes);
  final int minutes;
}
