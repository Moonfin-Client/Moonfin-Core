import '../../data/models/home_row.dart';
import '../../l10n/app_localizations.dart';

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

  return row.title;
}

String _localizeLatestRowTitle(String title, AppLocalizations l10n) {
  const latestPrefix = 'Latest ';
  if (!title.startsWith(latestPrefix)) return title;
  final libraryName = title.substring(latestPrefix.length);
  return l10n.latestLibraryName(libraryName);
}
