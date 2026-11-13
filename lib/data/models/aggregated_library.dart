class AggregatedLibrary {
  final String id;
  final String name;
  final String collectionType;
  final String serverId;
  final double? primaryImageAspectRatio;
  final Map<String, dynamic>? imageTags;
  final List<String>? backdropImageTags;

  /// The `UnifiedLibraryKind` name a merged tile opens. Its id and server are
  /// those of the first library in [mergedFrom].
  final String? unifiedKindName;

  /// The libraries a merged tile stands for. Empty on every other tile, and on
  /// a merged tile none of whose servers could be asked.
  final List<AggregatedLibrary> mergedFrom;

  const AggregatedLibrary({
    required this.id,
    required this.name,
    required this.collectionType,
    required this.serverId,
    this.primaryImageAspectRatio,
    this.imageTags,
    this.backdropImageTags,
    this.unifiedKindName,
    this.mergedFrom = const [],
  });

  /// One tile for [libraries], with the first one's place and artwork.
  factory AggregatedLibrary.merged({
    required String name,
    required String unifiedKindName,
    required List<AggregatedLibrary> libraries,
  }) {
    final first = libraries.first;
    return AggregatedLibrary(
      id: first.id,
      name: name,
      collectionType: first.collectionType,
      serverId: first.serverId,
      primaryImageAspectRatio: first.primaryImageAspectRatio,
      imageTags: first.imageTags,
      backdropImageTags: first.backdropImageTags,
      unifiedKindName: unifiedKindName,
      mergedFrom: List.unmodifiable(libraries),
    );
  }

  /// This tile without the libraries in [hiddenIds], or null when none is left.
  /// A merged tile then draws its artwork from the first one remaining.
  AggregatedLibrary? withoutHidden(Set<String> hiddenIds) {
    final kindName = unifiedKindName;
    if (kindName == null) return hiddenIds.contains(id) ? null : this;
    if (mergedFrom.isEmpty) return this;
    final shown = [
      for (final library in mergedFrom)
        if (!hiddenIds.contains(library.id)) library,
    ];
    if (shown.isEmpty) return null;
    if (shown.length == mergedFrom.length) return this;
    return AggregatedLibrary.merged(
      name: name,
      unifiedKindName: kindName,
      libraries: shown,
    );
  }
}
