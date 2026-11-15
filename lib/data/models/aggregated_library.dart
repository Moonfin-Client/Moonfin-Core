class AggregatedLibrary {
  final String id;
  final String name;
  final String collectionType;
  final String serverId;
  final double? primaryImageAspectRatio;
  final Map<String, dynamic>? imageTags;
  final List<String>? backdropImageTags;

  /// The library a merged library borrows its artwork from, since it has
  /// none of its own.
  final String? imageItemId;

  const AggregatedLibrary({
    required this.id,
    required this.name,
    required this.collectionType,
    required this.serverId,
    this.primaryImageAspectRatio,
    this.imageTags,
    this.backdropImageTags,
    this.imageItemId,
  });
}
