import '../l10n/app_localizations.dart';
import '../preference/preference_constants.dart';

String localizedLibrarySortName(LibrarySortBy sort, AppLocalizations l10n) =>
    switch (sort) {
      LibrarySortBy.playlistOrder => l10n.spotlightPlaylistOrder,
      LibrarySortBy.name => l10n.sortByName,
      LibrarySortBy.dateAdded => l10n.sortByDateAdded,
      LibrarySortBy.dateEpisodeAdded => l10n.sortDateEpisodeAdded,
      LibrarySortBy.premiereDate => l10n.sortPremiereDate,
      LibrarySortBy.rating => l10n.sortRating,
      LibrarySortBy.runtime => l10n.runtimeLabel,
      LibrarySortBy.random => l10n.mediaBarSourceRandom,
      LibrarySortBy.criticRating => l10n.adminMetadataFieldCriticRating,
      LibrarySortBy.communityRating => l10n.communityRating,
      LibrarySortBy.myRating => l10n.personalRatingMine,
      LibrarySortBy.datePlayed => l10n.lastPlayed,
      LibrarySortBy.playCount => l10n.sortPlayCount,
      LibrarySortBy.albumArtist => l10n.adminMetadataPersonKindAlbumArtist,
      LibrarySortBy.album => l10n.album,
      LibrarySortBy.artist => l10n.adminMetadataPersonKindArtist,
      LibrarySortBy.trackNumber => l10n.sortTrackNumber,
      LibrarySortBy.genre => l10n.shuffleGenre,
      LibrarySortBy.foldersFirst => l10n.sortFoldersFirst,
    };
