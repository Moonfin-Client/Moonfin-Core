import '../../data/models/home_row.dart';
import '../../data/services/seerr/seerr_slider_catalog.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/preference_constants.dart';

/// The Seerr page builds its rows from the type alone, so it localizes the
/// title here rather than carrying one around.
String localizeSeerrRowTitle(SeerrRowType type, AppLocalizations l10n) =>
    switch (type) {
      SeerrRowType.shortcuts => l10n.seerrShortcutsRow,
      SeerrRowType.recentRequests => l10n.recentRequests,
      SeerrRowType.recentlyAdded => l10n.recentlyAdded,
      SeerrRowType.yourWatchlist => l10n.yourWatchlist,
      SeerrRowType.trending => l10n.trending,
      SeerrRowType.popularMovies => l10n.popularMovies,
      SeerrRowType.movieGenres => l10n.movieGenres,
      SeerrRowType.upcomingMovies => l10n.upcomingMovies,
      SeerrRowType.studios => l10n.studios,
      SeerrRowType.popularSeries => l10n.popularSeries,
      SeerrRowType.seriesGenres => l10n.seriesGenres,
      SeerrRowType.upcomingSeries => l10n.upcomingSeries,
      SeerrRowType.networks => l10n.networks,
    };

/// Admin-named custom sliders keep [serverTitle]. Built-in Foreseerr rows
/// use the translation catalog.
String localizeSeerrSliderTitle(
  int type,
  AppLocalizations l10n, {
  String? serverTitle,
}) {
  final server = serverTitle?.trim() ?? '';
  if (server.isNotEmpty && seerrSliderUsesServerTitle(type)) return server;
  return switch (type) {
    SeerrSliderType.traktRecommendations => l10n.seerrTraktRecommendations,
    SeerrSliderType.traktWatchlist => l10n.seerrTraktWatchlist,
    SeerrSliderType.traktHistory => l10n.seerrTraktHistory,
    SeerrSliderType.traktList => l10n.seerrTraktList,
    SeerrSliderType.anilistTrending => l10n.seerrAnilistTrending,
    SeerrSliderType.anilistSeason => l10n.seerrAnilistThisSeason,
    SeerrSliderType.anilistWatching => l10n.seerrAnilistWatching,
    SeerrSliderType.anilistPlanning => l10n.seerrAnilistPlanning,
    SeerrSliderType.anilistCompleted => l10n.seerrAnilistCompleted,
    SeerrSliderType.anilistList => l10n.seerrAnilistList,
    SeerrSliderType.anilistPopular => l10n.seerrAnilistPopular,
    SeerrSliderType.anilistTop => l10n.seerrAnilistTop100,
    SeerrSliderType.anilistNextSeason => l10n.seerrAnilistNextSeason,
    SeerrSliderType.mdblistList => l10n.seerrMdblistList,
    SeerrSliderType.simklTrending => l10n.seerrSimklTrending,
    SeerrSliderType.simklPlanToWatch => l10n.seerrSimklPlanToWatch,
    SeerrSliderType.simklWatching => l10n.seerrSimklWatching,
    SeerrSliderType.simklOnHold => l10n.seerrSimklOnHold,
    SeerrSliderType.simklCompleted => l10n.seerrSimklCompleted,
    SeerrSliderType.simklDropped => l10n.seerrSimklDropped,
    _ => server.isNotEmpty ? server : seerrSliderFallbackTitle(type),
  };
}

String localizeHomeRowTitle({
  required HomeRow row,
  required AppLocalizations l10n,
  bool mergeContinueWatchingAndNextUp = false,
}) {
  switch (row.id) {
    case 'resume':
      return mergeContinueWatchingAndNextUp
          ? l10n.continueWatchingAndNextUp
          : l10n.continueWatching;
    case 'resumeAudio':
      return l10n.continueListening;
    case 'nextUp':
      return l10n.nextUp;
    case 'latestMedia':
      return l10n.latestMedia;
    case 'playlists':
      return l10n.playlists;
    case 'audioPlaylists':
      return l10n.audioPlaylists;
    case 'audioArtists':
      return l10n.artists;
    case 'audioAlbums':
      return l10n.albums;
    case 'collections':
      return l10n.collections;
    case 'genres':
      return l10n.genres;
    case 'libraryTiles':
    case 'libraryTilesSmall':
      return l10n.myMedia;
    case 'liveTv':
      return l10n.liveTv;
    case 'liveTvOnNow':
      return l10n.onNow;
    case 'liveTvFavorites':
      return l10n.favoriteChannels;
    case 'activeRecordings':
      return l10n.activeRecordings;
    case 'radarr_calendar':
      return 'Upcoming Movies (Radarr)';
    case 'sonarr_calendar':
      return 'Upcoming TV Shows (Sonarr)';
    case 'seerr_recent_requests':
      return l10n.recentRequests;
    case 'seerr_recently_added':
      return l10n.recentlyAdded;
    case 'seerr_popular_movies':
      return l10n.popularMovies;
    case 'seerr_upcoming_movies':
      return l10n.upcomingMovies;
    case 'seerr_popular_series':
      return l10n.popularSeries;
    case 'seerr_upcoming_series':
      return l10n.upcomingSeries;
    case 'seerr_shortcuts':
      return l10n.seerrShortcutsRow;
    case 'seerr_trending':
      return l10n.trending;
    case 'seerr_movie_genres':
      return l10n.movieGenres;
    case 'seerr_studios':
      return l10n.studios;
    case 'seerr_series_genres':
      return l10n.seriesGenres;
    case 'seerr_networks':
      return l10n.networks;
    case 'rewatch':
      return 'Rewatch';
  }

  if (row.id.startsWith('resume_')) return l10n.continueWatching;
  if (row.id.startsWith('nextUp_')) return l10n.nextUp;
  if (row.id.startsWith('lastPlayed_')) return l10n.lastPlayed;
  if (row.id.startsWith('albumartist_')) return l10n.albumArtists;
  if (row.id.startsWith('musicartist_')) return l10n.artists;
  if (row.id.startsWith('musicalbum_')) return l10n.albums;

  if (row.id.startsWith('latest_')) {
    return _localizeLatestRowTitle(row.title, l10n);
  }

  if (row.id.startsWith('imdb_')) {
    return row.title.replaceAll('IMDb ', '').replaceAll('IMDb', '').trim();
  }
  return row.title;
}

String _localizeLatestRowTitle(String title, AppLocalizations l10n) {
  const latestPrefix = 'Latest ';
  if (!title.startsWith(latestPrefix)) return title;
  final libraryName = title.substring(latestPrefix.length);
  return l10n.latestLibraryName(libraryName);
}
