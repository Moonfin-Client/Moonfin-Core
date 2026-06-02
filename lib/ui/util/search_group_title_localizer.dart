import '../../l10n/app_localizations.dart';

String localizeSearchGroupTitle(String title, AppLocalizations l10n) {
  return switch (title) {
    'Books' => l10n.books,
    'Audiobooks' => l10n.audiobooks,
    'Movies' => l10n.movies,
    'Series' => l10n.series,
    'Seasons' => l10n.seasons,
    'Episodes' => l10n.episodes,
    'Videos' => l10n.videos,
    'Music Videos' => l10n.musicVideos,
    'Trailers' => l10n.trailers,
    'Programs' => l10n.programs,
    'Channels' => l10n.channels,
    'Playlists' => l10n.playlists,
    'Artists' => l10n.artists,
    'Albums' => l10n.albums,
    'Songs' => l10n.songs,
    'Photo Albums' => l10n.photoAlbums,
    'Photos' => l10n.photos,
    'Collections' => l10n.collections,
    'People' => l10n.people,
    'Folders' => l10n.folders,
    _ => title,
  };
}