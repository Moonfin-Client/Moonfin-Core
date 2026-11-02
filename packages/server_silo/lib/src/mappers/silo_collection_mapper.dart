import 'package:server_core/server_core.dart';
import '../silo_image_registry.dart';
import 'silo_ids.dart';

/// A Silo collection as a Jellyfin `BoxSet`: a personal one
/// (`PersonalCollection`: `name`, `description`, `item_count`, `poster_url`)
/// when [libraryId] is null, else one of that library's curated collections
/// (`CuratedCollection` / `LibraryCollectionCard`: `title`, `poster_url`,
/// `backdrop_url`). Artwork is registered under the collection's Moonfin id.
///
/// Null without an id.
Map<String, dynamic>? siloCollectionToBoxSet(
  Map<String, dynamic> collection, {
  String? libraryId,
  SiloImageRegistry? images,
}) {
  final raw = siloIdOf(collection['id']);
  if (raw == null) return null;
  final id = libraryId == null
      ? siloCollectionId(raw)
      : siloLibraryCollectionId(libraryId, raw);
  final name =
      jsonText(collection['title']) ?? jsonText(collection['name']) ?? '';
  images?.note(id);
  final poster = images?.register(
    id,
    SiloImageType.primary,
    collection['poster_url'] as String?,
  );
  final backdrop = images?.register(
    id,
    SiloImageType.backdrop,
    collection['backdrop_url'] as String?,
  );
  final count = collection['item_count'];
  return {
    'Id': id,
    'Name': name,
    'SortName': name,
    'Type': 'BoxSet',
    'IsFolder': true,
    'CollectionType': 'boxsets',
    'Overview': ?jsonText(collection['description']),
    if (count is num) 'ChildCount': count.toInt(),
    'ParentId': ?libraryId,
    'ImageTags': {'Primary': ?poster},
    'BackdropImageTags': [?backdrop],
    if (poster != null) 'PrimaryImageAspectRatio': 2 / 3,
    '_silo': collection,
  };
}
