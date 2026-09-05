enum SubtitleMode {
  flagged,
  always,
  foreign,
  forced,
  none,
}

/// What the server re-encodes audio to when it has no choice. TrueHD isn't an
/// option, since Jellyfin can't repackage it into a streaming container and the
/// track lands silent.
enum AudioFallbackCodec {
  auto,
  aac,
  ac3,
  eac3,
  mp3,
  opus,
  flac,
}

/// How compressed surround audio reaches the output device.
/// - [disabled]: never bitstream, every codec decodes locally.
/// - [auto]: bitstream whatever the platform reports the route can take.
/// - [manual]: bitstream only the codecs the user toggled on.
enum AudioPassthroughMode {
  disabled,
  auto,
  manual,
}

/// Passthrough-controllable base codecs. Variants ride inside the base
/// bitstream: Atmos (JOC) in eac3, DTS:X in dtsHd, Atmos in trueHd.
enum PassthroughCodec {
  ac3('ac3'),
  eac3('eac3'),
  dtsCore('dts'),
  dtsHd('dtshd'),
  trueHd('truehd');

  const PassthroughCodec(this.wireName);

  /// The codec token shared with the native player and mpv synthesis.
  final String wireName;
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

/// What a trailing time label next to a progress bar shows.
enum PlaybackTimeDisplay {
  /// Total runtime of the item, e.g. `1:58:33`.
  totalDuration,

  /// Time left until the item ends, e.g. `-1:16:23`.
  timeRemaining,

  /// Wall-clock time the item will finish at, e.g. `Ends at 21:45`.
  endsAt,
}

/// What one of the six configurable slots around the video progress bar shows.
enum PlaybackTimeSlot {
  /// Nothing is rendered and the slot collapses.
  none,

  /// How far into the item playback is, e.g. `42:10`.
  elapsed,

  /// Total runtime of the item, e.g. `1:58:33`.
  totalDuration,

  /// Time left until the item ends, e.g. `-1:16:23`.
  timeRemaining,

  /// Wall-clock time the item will finish at, e.g. `Ends at 21:45`.
  endsAt,
}

enum DesktopScrollWheelAction {
  off,
  seek,
  volume,
}

/// Glass rendering budget. `auto` picks per-device (real blur on capable
/// hardware, zero-blur sheen on TV boxes/web); `full` forces real blur;
/// `reduced` forces the zero-blur sheen everywhere.
enum GlassQualityMode { auto, full, reduced }

/// How much this device is asked to spend on decoded images and inline video.
/// [DevicePerformanceMode.auto] measures the device, the other two pin it.
enum DevicePerformanceMode { auto, standard, reduced }

/// Persisted settled quality of the adaptive glass renderer, mirroring the
/// package's GlassQuality tiers. `unset` means no benchmark has settled yet,
/// so the adaptive scope runs its warm-up pass on next launch. Kept as a
/// Moonfin enum so the preference layer doesn't depend on
/// liquid_glass_widgets.
enum GlassSettledQuality { unset, minimal, standard, premium }

/// Layered on top of whichever theme is active. `subtle` and `vivid` crush
/// chrome toward pure black so OLED pixels switch off, and boost artwork
/// saturation/contrast. `off` leaves every theme exactly as authored.
enum OledMode { off, subtle, vivid }

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
  neonPulseMagenta(0xFFFF2E92),
  eightBitGold(0xFFFFCD75);

  const AppTheme(this.colorValue);
  final int colorValue;
}

enum VisualThemeId {
  moonfin,
  neonPulse,
  glass,
  eightbitHero,
}

/// Selectable structural style for the media detail screen.
///
/// [classic] is the original centered-stack layout. [modern] is the responsive
/// cinematic layout (landscape two-pane / portrait stack) and is the default.
/// Stored per server and user.
enum DetailScreenStyle {
  classic,
  modern;
}

/// Selectable algorithm source for similarity recommendation system.
enum RecommendationSystemSource {
  local,
  online;
}

/// Default mobile (portrait phone) view for the Live TV guide: a Now/Next
/// channel card list or the compact time grid.
enum EpgMobileView {
  list,
  grid,
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

enum PersonalRatingStyle {
  thumbs,
  stars,
  numeric,
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

/// How long the skip intro and outro button stays up before it hides itself.
/// Off is zero, which means no timer runs.
enum MediaSegmentAutoHide {
  s5(5),
  s10(10),
  off(0);

  const MediaSegmentAutoHide(this.seconds);
  final int seconds;
}

/// Banner artwork is authored at 1000x185. Card geometry and image requests
/// both use this so the artwork that comes back matches what gets drawn.
const double kBannerAspectRatio = 1000 / 185;

/// Card height for banner mode. Banner mode hides the poster size control, so
/// it reads this instead of PosterSize.landscapeHeight, which would otherwise
/// keep resizing banners with no way to change them.
const double kBannerCardHeight = 110;

/// [strip] shows a Netflix-style filmstrip spanning the scrub position.
/// [full] temporarily replaces the video with the trickplay image while
/// scrubbing.
enum TrickplayMode {
  disabled,
  single,
  strip,
  full,
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
  studios('studios'),
  liveTv('livetv'),
  seerrShortcuts('seerr_shortcuts'),
  seerrRecentRequests('seerr_recent_requests'),
  seerrWatchlist('seerr_watchlist'),
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
  sinceYouWatched1('sinceyouwatched1'),
  sinceYouWatched2('sinceyouwatched2'),
  sinceYouWatched3('sinceyouwatched3'),
  sinceYouWatched4('sinceyouwatched4'),
  sinceYouWatched5('sinceyouwatched5'),
  rewatch('rewatch'),
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

/// Every sort ends on SortName so items the server ranks equally keep a stable
/// order between pages, which a bare key leaves to whatever the database
/// returns.
enum LibrarySortBy {
  playlistOrder('SortName', 'Playlist Order', usesDedicatedEndpoint: true),
  name('SortName', 'Name'),
  dateAdded('DateCreated,SortName', 'Date Added'),
  dateEpisodeAdded('DateLastContentAdded,SortName', 'Date Episode Added'),
  premiereDate('PremiereDate,SortName', 'Premiere Date'),
  rating('OfficialRating,SortName', 'Rating'),
  runtime('Runtime,SortName', 'Runtime'),
  random('Random', 'Random'),
  criticRating('CriticRating,SortName', 'Critic Rating'),
  communityRating('CommunityRating,SortName', 'Community Rating'),

  /// Served by the Moonfin plugin rather than the Items API, since neither
  /// server sorts on the user's own rating. The api value is the fallback for
  /// consumers without the dedicated path.
  myRating('SortName', 'My Rating', usesDedicatedEndpoint: true),
  datePlayed('DatePlayed,SortName', 'Last Played'),
  playCount('PlayCount,SortName', 'Play Count'),
  albumArtist('AlbumArtist,Album,SortName', 'Album Artist'),
  album('Album,SortName', 'Album'),
  artist('Artist,Album,SortName', 'Artist'),
  trackNumber('IndexNumber,SortName', 'Number'),
  genre('Genre,SortName', 'Genre'),
  foldersFirst('IsFolder,SortName', 'Folders First');

  const LibrarySortBy(
    this.apiValue,
    this.displayName, {
    this.usesDedicatedEndpoint = false,
  });

  /// Always a value the Items API accepts, so any caller can pass it through.
  final String apiValue;
  final String displayName;

  /// Whether the row this option belongs to reads from its own endpoint rather
  /// than sorting through the Items API. Rows that know about the endpoint act
  /// on this, and everything else falls back to [apiValue].
  final bool usesDedicatedEndpoint;

  /// The options a row can offer when it only ever sorts through the Items API.
  static List<LibrarySortBy> get itemsApiValues =>
      values.where((v) => !v.usesDedicatedEndpoint).toList();

  /// What a library offers, since a sort is only worth showing when the items
  /// carry the field it reads. Album and track ordering belong to music,
  /// episode dates to series, and folders to the libraries that show them.
  static List<LibrarySortBy> optionsFor({
    bool isSongsBrowse = false,
    bool isMusicBrowse = false,
    bool isSeriesLibrary = false,
    bool isBookLibrary = false,
    bool isFolderyLibrary = false,
    bool isMovieOrSeriesLibrary = false,
    bool supportsMyRating = false,
  }) {
    if (isFolderyLibrary) {
      return const [
        name,
        dateAdded,
        datePlayed,
        playCount,
        runtime,
        random,
        foldersFirst,
      ];
    }

    if (isSongsBrowse) {
      return const [
        name,
        dateAdded,
        albumArtist,
        album,
        artist,
        trackNumber,
        premiereDate,
        datePlayed,
        playCount,
        runtime,
        random,
      ];
    }

    return [
      if (supportsMyRating) myRating,
      name,
      dateAdded,
      if (isSeriesLibrary) dateEpisodeAdded,
      premiereDate,
      // Group By covers parental rating better than a sort does, so the
      // libraries offering it drop the duplicate.
      if (!isMovieOrSeriesLibrary && !isMusicBrowse) rating,
      datePlayed,
      if (!isMusicBrowse) playCount,
      if (isBookLibrary) trackNumber,
      if (!isMusicBrowse) criticRating,
      if (!isMusicBrowse) communityRating,
      if (isMusicBrowse) albumArtist,
      if (isMusicBrowse) album,
      if (isMusicBrowse) genre,
      runtime,
      random,
    ];
  }
}

enum LibraryGroupBy {
  none,
  genres,
  parentalRatings,
  decade,
  studio,
}

enum ChannelSortBy {
  number('Channel Number'),
  name('Name'),
  favoritesFirst('Favorites First');

  const ChannelSortBy(this.displayName);
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
  ascending('Ascending'),
  descending('Descending');

  const SortDirection(this.apiValue);

  final String apiValue;
}

enum PlayedStatusFilter {
  all,
  watched,
  unwatched,
  inProgress,
}

/// Filters a library on the viewer's own like or dislike, which both server
/// types expose as the Likes and Dislikes item filters.
enum LikedStatusFilter {
  all,
  liked,
  disliked,
}

enum SeriesStatusFilter {
  all,
  continuing,
  ended,
  unreleased,
}

/// Extras an item can carry, each its own flag on the items query rather than
/// a value in the shared Filters list.
enum LibraryFeatureFilter {
  subtitles,
  trailer,
  extras,
  themeSong,
  themeVideo,
}

/// Picture qualities, which the servers answer with a plain flag each. SD is
/// the same flag as HD asked the other way round, so the two cancel out and
/// selecting both is the same as selecting neither.
enum LibraryVideoQualityFilter {
  sd,
  hd,
  uhd,
  threeD,
}

/// What the file was ripped from, passed through as the server's VideoType.
enum LibraryVideoSourceFilter {
  dvd('Dvd', 'DVD'),
  bluray('BluRay', 'Blu-ray'),
  iso('Iso', 'ISO');

  const LibraryVideoSourceFilter(this.apiValue, this.displayName);

  final String apiValue;
  final String displayName;
}

enum LibraryScrollDirection {
  vertical,
  horizontal,
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
  shortcuts('shortcuts'),
  recentRequests('recent_requests'),
  yourWatchlist('watchlist'),
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

extension SeerrRowTypeHomeSection on SeerrRowType {
  HomeSectionType get homeSectionType => switch (this) {
        SeerrRowType.shortcuts => HomeSectionType.seerrShortcuts,
        SeerrRowType.recentRequests => HomeSectionType.seerrRecentRequests,
        SeerrRowType.yourWatchlist => HomeSectionType.seerrWatchlist,
        SeerrRowType.recentlyAdded => HomeSectionType.seerrRecentlyAdded,
        SeerrRowType.trending => HomeSectionType.seerrTrending,
        SeerrRowType.popularMovies => HomeSectionType.seerrPopularMovies,
        SeerrRowType.movieGenres => HomeSectionType.seerrMovieGenres,
        SeerrRowType.upcomingMovies => HomeSectionType.seerrUpcomingMovies,
        SeerrRowType.studios => HomeSectionType.seerrStudios,
        SeerrRowType.popularSeries => HomeSectionType.seerrPopularSeries,
        SeerrRowType.seriesGenres => HomeSectionType.seerrSeriesGenres,
        SeerrRowType.upcomingSeries => HomeSectionType.seerrUpcomingSeries,
        SeerrRowType.networks => HomeSectionType.seerrNetworks,
      };
}

extension HomeSectionTypeSeerrRow on HomeSectionType {
  SeerrRowType? get seerrRowType => switch (this) {
        HomeSectionType.seerrShortcuts => SeerrRowType.shortcuts,
        HomeSectionType.seerrRecentRequests => SeerrRowType.recentRequests,
        HomeSectionType.seerrWatchlist => SeerrRowType.yourWatchlist,
        HomeSectionType.seerrRecentlyAdded => SeerrRowType.recentlyAdded,
        HomeSectionType.seerrTrending => SeerrRowType.trending,
        HomeSectionType.seerrPopularMovies => SeerrRowType.popularMovies,
        HomeSectionType.seerrMovieGenres => SeerrRowType.movieGenres,
        HomeSectionType.seerrUpcomingMovies => SeerrRowType.upcomingMovies,
        HomeSectionType.seerrStudios => SeerrRowType.studios,
        HomeSectionType.seerrPopularSeries => SeerrRowType.popularSeries,
        HomeSectionType.seerrSeriesGenres => SeerrRowType.seriesGenres,
        HomeSectionType.seerrUpcomingSeries => SeerrRowType.upcomingSeries,
        HomeSectionType.seerrNetworks => SeerrRowType.networks,
        _ => null,
      };
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

enum SinceYouWatchedSource {
  local,
  online;

  String get displayName => this == local ? 'Local' : 'Online';
}

enum SinceYouWatchedSourceType {
  movies,
  shows,
  both;

  String get displayName {
    switch (this) {
      case movies: return 'Movies';
      case shows: return 'Shows';
      case both: return 'Both';
    }
  }
}

enum SinceYouWatchedSourceItem {
  recentlyWatched,
  favorites,
  random;

  String get displayName {
    switch (this) {
      case recentlyWatched: return 'Recently Watched';
      case favorites: return 'Favorites';
      case random: return 'Random';
    }
  }
}

enum SinceYouWatchedNumRows {
  one(1),
  two(2),
  three(3),
  four(4),
  five(5);

  const SinceYouWatchedNumRows(this.value);
  final int value;

  String get displayName => value.toString();
}

enum RewatchSortBy {
  recentlyWatched,
  random;

  String get displayName => this == recentlyWatched ? 'Recently Watched' : 'Random';
}

/// Which record dates a show in the recently released row of a TV library. A
/// series carries its first episode's date, so a long running show stops
/// surfacing. The row shows series cards whichever of these is picked.
enum RecentlyReleasedSeriesType { series, season, episode }

/// When a home row card shows its MOVIE or SERIES label. Only external rows
/// carry a media type, so the rest are unaffected either way.
enum MediaTypeBadgeBehavior { always, mixedRowsOnly, never }

enum LoadingAnimationImage {
  none,
  moonfinLogo,
  spinner,
  runner,
  moonPhases,
  moonfinPhases,
  neonfinPhases,
}

enum LoadingAnimationSize {
  thumbnail,
  small,
  medium,
  large,
}

enum LoadingAnimationPosition {
  topLeft,
  topCenter,
  topRight,
  middleLeft,
  middle,
  middleRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  bouncing,
}

enum LoadingAnimationSpeed {
  slow,
  moderate,
  fast,
  ultra,
}

