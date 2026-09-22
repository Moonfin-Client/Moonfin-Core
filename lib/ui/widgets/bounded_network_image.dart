import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../util/image_fetch_priority.dart';
import '../theme/vibrance.dart';
import 'image_source.dart';

export '../../util/image_fetch_priority.dart' show ImageFetchPriority;

/// A [CachedNetworkImage] whose decoded pixel width is bounded to the
/// rendered widget width times the device pixel ratio, optionally clamped
/// and/or scaled. This keeps the in-memory image cache from holding decodes
/// far larger than what is actually painted (a common source of jank and
/// large RAM usage on web).
///
/// The sizing rules live in [ArtworkDecode]. This widget adds the
/// [onLoadFinished] contract the game screens depend on.
class BoundedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final Alignment alignment;
  final Duration fadeInDuration;
  final Widget Function(BuildContext context, String url, Object error)?
  errorBuilder;
  final VoidCallback? onLoadFinished;
  final BaseCacheManager? cacheManager;

  /// Multiplier applied to the resolved width before clamping. Useful for
  /// blurred images where a low-resolution decode is acceptable.
  final double scale;

  /// Lower bound for the decoded width in physical pixels.
  final int minWidth;

  /// Upper bound for the decoded width in physical pixels.
  final int maxWidth;

  /// The image's own aspect ratio, for cover fits into a box narrower than
  /// the source. See [ArtworkDecode.widthFor].
  final double? sourceAspectRatio;

  /// An explicit decode width, used verbatim instead of the layout. For a
  /// widget whose precache must land on exactly the same key.
  final int? memCacheWidth;

  /// Which lane the fetch goes in. See [ImageFetchPriority].
  final ImageFetchPriority priority;

  const BoundedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.fadeInDuration = Duration.zero,
    this.errorBuilder,
    this.onLoadFinished,
    this.cacheManager,
    this.scale = 1.0,
    this.minWidth = 64,
    this.maxWidth = 1024,
    this.sourceAspectRatio,
    this.memCacheWidth,
    this.priority = ImageFetchPriority.normal,
  });

  /// The decoded pixel width upstream uses for every bounded image: the painted
  /// width in physical pixels, stepped up and clamped. Public so the game
  /// artwork widgets, which decode from bytes rather than a URL and so can't
  /// use this widget itself, size their decodes by the same rule instead of
  /// a constant.
  static int cacheWidthFor(
    double layoutWidth,
    double devicePixelRatio, {
    double scale = 1.0,
    int minWidth = 64,
    int maxWidth = 1024,
  }) => ArtworkDecode.widthFor(
    layoutWidth,
    devicePixelRatio,
    scale: scale,
    minWidth: minWidth,
    maxWidth: maxWidth,
  );

  static Future<void> precache(
    BuildContext context,
    String imageUrl, {
    required double layoutWidth,
    double? layoutHeight,
    double? sourceAspectRatio,
    double scale = 1.0,
    int minWidth = 64,
    int maxWidth = 1024,
    ImageFetchPriority priority = ImageFetchPriority.low,
  }) => ArtworkDecode.precache(
    context,
    imageUrl,
    layoutWidth: layoutWidth,
    layoutHeight: layoutHeight,
    sourceAspectRatio: sourceAspectRatio,
    scale: scale,
    minWidth: minWidth,
    maxWidth: maxWidth,
    priority: priority,
  );

  @override
  Widget build(BuildContext context) {
    return Vibrance.wrap(
      ArtworkBound(
        memCacheWidth: memCacheWidth,
        scale: scale,
        minWidth: minWidth,
        maxWidth: maxWidth,
        sourceAspectRatio: sourceAspectRatio,
        builder: _buildImage,
      ),
    );
  }

  Widget _buildImage(
    BuildContext context,
    int? decodeWidth,
    int? decodeHeight,
  ) {
    final local = isLocalImagePath(imageUrl);
    final headers = local ? null : artworkFetchHeaders(imageUrl, priority);
    final bounded = ArtworkDecode.provider(
      imageUrl,
      width: decodeWidth,
      height: decodeHeight,
      headers: headers,
      cacheManager: cacheManager,
    );
    if (local) {
      return Image(
        image: bounded,
        fit: fit,
        alignment: alignment,
        frameBuilder: onLoadFinished == null
            ? null
            : (context, child, frame, wasSynchronouslyLoaded) {
                if (frame != null || wasSynchronouslyLoaded) {
                  _notifyLoadFinished();
                }
                return child;
              },
        errorBuilder: errorBuilder == null && onLoadFinished == null
            ? null
            : (context, error, stackTrace) {
                _notifyLoadFinished();
                return errorBuilder?.call(context, imageUrl, error) ??
                    const SizedBox.shrink();
              },
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      httpHeaders: headers,
      cacheManager: cacheManager,
      fit: fit,
      alignment: alignment,
      fadeInDuration: fadeInDuration,
      memCacheWidth: decodeWidth,
      memCacheHeight: decodeHeight,
      imageBuilder: onLoadFinished == null
          ? null
          : (context, _) {
              _notifyLoadFinished();
              // CachedNetworkImage hands this builder the unwrapped provider,
              // so memCacheWidth above never reaches it and the bound has to
              // be applied again or the decode runs at the full source size.
              return Image(image: bounded, fit: fit, alignment: alignment);
            },
      errorWidget: errorBuilder == null && onLoadFinished == null
          ? null
          : (context, url, error) {
              _notifyLoadFinished();
              return errorBuilder?.call(context, url, error) ??
                  const SizedBox.shrink();
            },
    );
  }

  void _notifyLoadFinished() {
    final callback = onLoadFinished;
    if (callback == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }
}
