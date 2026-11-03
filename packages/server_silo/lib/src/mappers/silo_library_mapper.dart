import 'package:server_core/server_core.dart';

import '../silo_image_registry.dart';
import 'silo_ids.dart';
import 'silo_item_mapper.dart' show siloOriginalKey;

/// Maps a Silo library `type` to the Jellyfin `CollectionType` Moonfin uses
/// to pick the screen a library opens in and its icon.
///
/// Silo's types are `movies`, `series`, `mixed`, `audiobooks`, `ebooks`,
/// `podcasts` and `manga`. A `mixed` library has no collection type, as on
/// Jellyfin, so it opens in the general library grid. Audiobooks keep their
/// own type, as on Emby, because Moonfin's book screens tell an audiobook
/// library from an ebook one. Podcasts and manga have no Moonfin screen and
/// no entry.
const Map<String, String?> siloCollectionTypes = {
  'movies': 'movies',
  'series': 'tvshows',
  'mixed': null,
  'audiobooks': 'audiobooks',
  'ebooks': 'books',
};

/// The library types Moonfin shows today. Book libraries join once Moonfin
/// can open their items, the same rule as `siloSupportedTypes`: a library
/// that opened onto an empty grid would look broken.
const Set<String> siloSupportedLibraryTypes = {'movies', 'series', 'mixed'};

/// One of Silo's user libraries (`UserLibrary`: `id`, `name`, `type`,
/// `sort_order`, `poster_url`) as the Jellyfin `CollectionFolder` Moonfin
/// reads from `getUserViews`.
///
/// The `Id` is Silo's library id unchanged, because Moonfin's library order
/// and hidden libraries are stored in Silo's own settings by that id.
/// The poster is recorded in [images] under the library id as `Primary`.
///
/// Returns null for a library without an id or with a type that has no
/// collection type (podcasts, manga, an unknown future type).
Map<String, dynamic>? siloLibraryToCollectionFolder(
  Map<String, dynamic> library, {
  SiloImageRegistry? images,
}) {
  final id = siloIdOf(library['id']);
  if (id == null) return null;
  final type = _libraryType(library);
  if (type == null || !siloCollectionTypes.containsKey(type)) return null;
  final collectionType = siloCollectionTypes[type];
  final rawName = library['name'];
  final name = rawName is String ? rawName.trim() : '';
  images?.note(id);
  final posterTag = images?.register(
    id,
    SiloImageType.primary,
    library['poster_url'] as String?,
  );
  return {
    'Id': id,
    'Name': name,
    'SortName': name,
    'Type': 'CollectionFolder',
    'IsFolder': true,
    'CollectionType': ?collectionType,
    'ImageTags': {'Primary': ?posterTag},
    'BackdropImageTags': const <String>[],
    // A library has no watch state. Emby sends this same empty UserData.
    'UserData': const {
      'PlaybackPositionTicks': 0,
      'IsFavorite': false,
      'Played': false,
    },
    siloOriginalKey: library,
  };
}

/// Silo's library list (`GET /user/libraries`) as Moonfin's user views: the
/// libraries whose type is in [supported], in Silo's `sort_order` (libraries
/// with the same or no position keep Silo's order, unnumbered ones last).
List<Map<String, dynamic>> siloLibrariesToUserViews(
  Iterable<Object?> libraries, {
  SiloImageRegistry? images,
  Set<String> supported = siloSupportedLibraryTypes,
}) {
  final entries = <({int index, int? order, Map<String, dynamic> view})>[];
  var index = 0;
  for (final raw in libraries) {
    final library = asJsonMap(raw);
    if (library == null) continue;
    final type = _libraryType(library);
    if (type == null || !supported.contains(type)) continue;
    final view = siloLibraryToCollectionFolder(library, images: images);
    if (view == null) continue;
    final order = library['sort_order'];
    entries.add((
      index: index++,
      order: order is num ? order.toInt() : null,
      view: view,
    ));
  }
  entries.sort((a, b) {
    final ao = a.order, bo = b.order;
    if (ao != null && bo != null && ao != bo) return ao.compareTo(bo);
    if (ao == null && bo != null) return 1;
    if (ao != null && bo == null) return -1;
    return a.index.compareTo(b.index);
  });
  return [for (final e in entries) e.view];
}

String? _libraryType(Map<String, dynamic> library) {
  final type = library['type'];
  return type is String ? type.trim().toLowerCase() : null;
}
