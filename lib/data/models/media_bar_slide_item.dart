class MediaBarSlideItem {
  final String itemId;
  final String serverId;
  final String title;
  final String? overview;
  final String? backdropUrl;
  final String? logoUrl;
  final String? posterUrl;
  final String? officialRating;
  final int? year;
  final List<String> genres;
  final Duration? runtime;
  final double? communityRating;
  final int? criticRating;
  final String? tmdbId;
  final String? imdbId;
  final String itemType;
  final List<Map<String, dynamic>> remoteTrailers;

  const MediaBarSlideItem({
    required this.itemId,
    required this.serverId,
    required this.title,
    this.overview,
    this.backdropUrl,
    this.logoUrl,
    this.posterUrl,
    this.officialRating,
    this.year,
    this.genres = const [],
    this.runtime,
    this.communityRating,
    this.criticRating,
    this.tmdbId,
    this.imdbId,
    this.itemType = 'Movie',
    this.remoteTrailers = const [],
  });

  MediaBarSlideItem copyWith({
    String? logoUrl,
    String? overview,
    List<String>? genres,
    Duration? runtime,
    double? communityRating,
    List<Map<String, dynamic>>? remoteTrailers,
  }) {
    return MediaBarSlideItem(
      itemId: itemId,
      serverId: serverId,
      title: title,
      overview: overview ?? this.overview,
      backdropUrl: backdropUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      posterUrl: posterUrl,
      officialRating: officialRating,
      year: year,
      genres: genres ?? this.genres,
      runtime: runtime ?? this.runtime,
      communityRating: communityRating ?? this.communityRating,
      criticRating: criticRating,
      tmdbId: tmdbId,
      imdbId: imdbId,
      itemType: itemType,
      remoteTrailers: remoteTrailers ?? this.remoteTrailers,
    );
  }
}
