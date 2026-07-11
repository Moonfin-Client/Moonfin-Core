import '../../l10n/current_app_localizations.dart';

/// Synthetic library views presented when browsing offline. Ids are stable
/// strings so routes/caches keyed by view id keep working across sessions.
class OfflineViews {
  static const movies = 'offline-view-movies';
  static const tvshows = 'offline-view-tvshows';
  static const music = 'offline-view-music';
  static const books = 'offline-view-books';
  static const videos = 'offline-view-videos';

  static const all = [movies, tvshows, music, books, videos];

  static bool isOfflineView(String id) => id.startsWith('offline-view-');

  static String collectionTypeFor(String viewId) {
    switch (viewId) {
      case movies:
        return 'movies';
      case tvshows:
        return 'tvshows';
      case music:
        return 'music';
      case books:
        return 'books';
      default:
        return 'homevideos';
    }
  }

  static String nameFor(String viewId) {
    final l10n = currentAppLocalizations();
    switch (viewId) {
      case movies:
        return l10n.movies;
      case tvshows:
        return l10n.tvShows;
      case music:
        return l10n.music;
      case books:
        return l10n.books;
      default:
        return l10n.videos;
    }
  }

  /// Which view an item type belongs to.
  static String viewForType(String type) {
    switch (type) {
      case 'Movie':
        return movies;
      case 'Series':
      case 'Season':
      case 'Episode':
        return tvshows;
      case 'Audio':
      case 'MusicAlbum':
      case 'MusicArtist':
        return music;
      case 'Book':
      case 'AudioBook':
        return books;
      default:
        return videos;
    }
  }

  /// The types shown when browsing a view's top level (no includeItemTypes).
  static List<String> topLevelTypesFor(String viewId) {
    switch (viewId) {
      case movies:
        return const ['Movie'];
      case tvshows:
        return const ['Series'];
      case music:
        return const ['MusicAlbum'];
      case books:
        return const ['Book', 'AudioBook'];
      default:
        return const ['Video', 'MusicVideo'];
    }
  }

  static Map<String, dynamic> viewStub(String viewId, String serverId) {
    return {
      'Id': viewId,
      'Name': nameFor(viewId),
      'Type': 'CollectionFolder',
      'CollectionType': collectionTypeFor(viewId),
      'ServerId': serverId,
      'IsFolder': true,
      'ImageTags': const <String, dynamic>{},
      'BackdropImageTags': const <dynamic>[],
    };
  }
}
