import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A [CachedNetworkImage] whose decoded pixel width is bounded to the
/// rendered widget width times the device pixel ratio, optionally clamped
/// and/or scaled. This keeps the in-memory image cache from holding decodes
/// far larger than what is actually painted (a common source of jank and
/// large RAM usage on web).
class BoundedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final Alignment alignment;
  final Duration fadeInDuration;
  final Widget Function(BuildContext context, String url, Object error)?
      errorBuilder;

  /// Multiplier applied to the resolved width before clamping. Useful for
  /// blurred images where a low-resolution decode is acceptable.
  final double scale;

  /// Lower bound for the decoded width in physical pixels.
  final int minWidth;

  /// Upper bound for the decoded width in physical pixels.
  final int maxWidth;

  const BoundedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.fadeInDuration = Duration.zero,
    this.errorBuilder,
    this.scale = 1.0,
    this.minWidth = 64,
    this.maxWidth = 1024,
  });

  static int _cacheWidthFor(
    double layoutWidth,
    double devicePixelRatio, {
    double scale = 1.0,
    int minWidth = 64,
    int maxWidth = 1024,
  }) {
    return (layoutWidth * devicePixelRatio * scale)
        .round()
        .clamp(minWidth, maxWidth);
  }

  static Future<void> precache(
    BuildContext context,
    String imageUrl, {
    required double layoutWidth,
    double scale = 1.0,
    int minWidth = 64,
    int maxWidth = 1024,
  }) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final cacheW = _cacheWidthFor(
      layoutWidth,
      dpr,
      scale: scale,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
    return precacheImage(
      ResizeImage.resizeIfNeeded(
        cacheW,
        null,
        CachedNetworkImageProvider(imageUrl, maxWidth: cacheW),
      ),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final cacheW = _cacheWidthFor(
          constraints.maxWidth,
          dpr,
          scale: scale,
          minWidth: minWidth,
          maxWidth: maxWidth,
        );
        return CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          alignment: alignment,
          fadeInDuration: fadeInDuration,
          memCacheWidth: cacheW,
          maxWidthDiskCache: cacheW,
          errorWidget: errorBuilder == null
              ? null
              : (context, url, error) => errorBuilder!(context, url, error),
        );
      },
    );
  }
}
