class AggregatedLibrary {
  final String id;
  final String name;
  final String collectionType;
  final String serverId;
  final double? primaryImageAspectRatio;
  final Map<String, dynamic>? imageTags;
  final List<String>? backdropImageTags;

  const AggregatedLibrary({
    required this.id,
    required this.name,
    required this.collectionType,
    required this.serverId,
    this.primaryImageAspectRatio,
    this.imageTags,
    this.backdropImageTags,
  });
}
