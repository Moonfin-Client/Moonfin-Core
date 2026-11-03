/// Optional extra for an `ItemsApi` whose server lets the user edit only
/// some of the collections they can see. On Silo a profile adds to and
/// removes from its own manual collections, while a library's collections
/// are the administrator's and another profile's shared ones are read-only.
///
/// Jellyfin and Emby let a user with collection rights edit every
/// collection, so the app lists every `BoxSet` in "Add to collection" and
/// offers "Remove from collection" on any collection page. With this
/// interface (`itemsApi is EditableCollectionsApi`) it lists and offers only
/// what the server allows.
abstract interface class EditableCollectionsApi {
  /// The collections the user may add items to, as Jellyfin `BoxSet`
  /// items, sorted by name.
  Future<List<Map<String, dynamic>>> getEditableCollections();

  /// Whether the user may add items to and remove items from [collection],
  /// a `BoxSet` item as this server returned it.
  bool canEditCollection(Map<String, dynamic> collection);
}
