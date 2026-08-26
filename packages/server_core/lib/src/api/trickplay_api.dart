class TrickplayThumbnail {
  final int positionTicks;
  final String imageTag;

  const TrickplayThumbnail({
    required this.positionTicks,
    required this.imageTag,
  });

  static TrickplayThumbnail? fromJson(Map<String, dynamic> json) {
    final positionTicks = (json['PositionTicks'] as num?)?.toInt();
    final imageTag = json['ImageTag']?.toString().trim();
    if (positionTicks == null ||
        positionTicks < 0 ||
        imageTag == null ||
        imageTag.isEmpty) {
      return null;
    }
    return TrickplayThumbnail(positionTicks: positionTicks, imageTag: imageTag);
  }
}

class TrickplayThumbnailSet {
  final double aspectRatio;
  final List<TrickplayThumbnail> thumbnails;

  const TrickplayThumbnailSet({
    required this.aspectRatio,
    required this.thumbnails,
  });

  bool get isValid => aspectRatio > 0 && thumbnails.isNotEmpty;

  static TrickplayThumbnailSet? fromJson(Map<String, dynamic> json) {
    final aspectRatio = (json['AspectRatio'] as num?)?.toDouble();
    final rawThumbnails = json['Thumbnails'];
    if (aspectRatio == null ||
        !aspectRatio.isFinite ||
        aspectRatio <= 0 ||
        rawThumbnails is! List) {
      return null;
    }

    final thumbnails = rawThumbnails
        .whereType<Map>()
        .map(
          (entry) => TrickplayThumbnail.fromJson(entry.cast<String, dynamic>()),
        )
        .whereType<TrickplayThumbnail>()
        .toList(growable: false);
    if (thumbnails.isEmpty) return null;

    return TrickplayThumbnailSet(
      aspectRatio: aspectRatio,
      thumbnails: thumbnails,
    );
  }
}

abstract class TrickplayApi {
  Future<TrickplayThumbnailSet?> getThumbnailSet(
    String itemId, {
    required int width,
    String? mediaSourceId,
  });

  String getFrameImageUrl(
    String itemId, {
    required int width,
    required int positionTicks,
    required String imageTag,
    String? mediaSourceId,
  });
}
