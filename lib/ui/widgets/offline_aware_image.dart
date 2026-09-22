import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../util/image_fetch_priority.dart';
import '../theme/vibrance.dart';
import 'image_source.dart';

export 'image_source.dart'
    show
        ArtworkDecode,
        DecodeBound,
        ImageFetchPriority,
        isLocalImagePath,
        offlineAwareImageProvider;

/// Drop-in replacement for [CachedNetworkImage] that renders downloaded
/// local file paths (produced by the offline image API) with [Image.file],
/// and defers to [CachedNetworkImage] for real URLs.
///
/// Images appear the moment they decode: every fade defaults to zero. A load
/// fade only ever played on disk and network loads, so it delayed each first
/// appearance by its own length and read as flicker on a fast scroll. The
/// crossfade between one image and the next lives in the switchers and
/// media bars and is a different thing.
///
/// The decode is bounded to the painted size by default, see [ArtworkBound].
/// Left unbounded, every poster decodes at the full size the server sent and
/// a screen of cards fills the memory cache several times over, which is what
/// made detail layouts re-decode on every scroll.
class OfflineAwareImage extends StatelessWidget {
  final String imageUrl;
  final Map<String, String>? httpHeaders;
  final Widget Function(BuildContext, ImageProvider)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, DownloadProgress)?
  progressIndicatorBuilder;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final Duration? placeholderFadeInDuration;
  final Duration? fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;
  final bool useOldImageOnUrlChange;
  final Color? color;
  final FilterQuality filterQuality;
  final BlendMode? colorBlendMode;

  /// An explicit decode width or height. Used verbatim when given, so a
  /// caller that has already chosen a size keeps its cache key.
  final int? memCacheWidth;
  final int? memCacheHeight;
  final String? cacheKey;
  final BaseCacheManager? cacheManager;

  /// How the decode size is chosen when [memCacheWidth] and [memCacheHeight]
  /// are null.
  final DecodeBound decodeBound;

  /// The image's own aspect ratio, for cover fits into a box narrower than
  /// the source. See [ArtworkDecode.widthFor].
  final double? sourceAspectRatio;

  /// Multiplier on the painted size before clamping. Below 1 only inside a
  /// tight box, for blurred backdrops.
  final double decodeScale;
  final int minDecodeWidth;
  final int maxDecodeWidth;

  /// Which lane the fetch goes in. See [ImageFetchPriority].
  final ImageFetchPriority priority;

  const OfflineAwareImage({
    super.key,
    required this.imageUrl,
    this.httpHeaders,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.placeholderFadeInDuration = Duration.zero,
    this.fadeOutDuration = Duration.zero,
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = Duration.zero,
    this.fadeInCurve = Curves.easeIn,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.useOldImageOnUrlChange = false,
    this.color,
    this.filterQuality = FilterQuality.low,
    this.colorBlendMode,
    this.memCacheWidth,
    this.memCacheHeight,
    this.cacheKey,
    this.cacheManager,
    this.decodeBound = DecodeBound.layout,
    this.sourceAspectRatio,
    this.decodeScale = 1.0,
    this.minDecodeWidth = 64,
    this.maxDecodeWidth = ArtworkDecode.maxSourceWidth,
    this.priority = ImageFetchPriority.normal,
  });

  @override
  Widget build(BuildContext context) {
    // Wrapping out here rather than at each return covers the `imageBuilder`
    // path below, which several callers rely on.
    return Vibrance.wrap(
      ArtworkBound(
        width: width,
        height: height,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
        bound: decodeBound,
        sourceAspectRatio: sourceAspectRatio,
        scale: decodeScale,
        minWidth: minDecodeWidth,
        maxWidth: maxDecodeWidth,
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
    final headers = local
        ? httpHeaders
        : artworkFetchHeaders(imageUrl, priority, headers: httpHeaders);
    final bounded = ArtworkDecode.provider(
      imageUrl,
      width: decodeWidth,
      height: decodeHeight,
      cacheKey: cacheKey,
      headers: headers,
      cacheManager: cacheManager,
    );
    if (local) {
      if (imageBuilder != null) return imageBuilder!(context, bounded);
      return Image(
        image: bounded,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        color: color,
        colorBlendMode: colorBlendMode,
        filterQuality: filterQuality,
        errorBuilder: errorWidget == null
            ? null
            : (c, error, stack) => errorWidget!(c, imageUrl, error),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      httpHeaders: headers,
      cacheManager: cacheManager,
      // CachedNetworkImage hands its builder the bare provider, not the
      // resized one it decoded. Painting that would start a second decode at
      // the full source size, so the builder gets the bounded provider, which
      // is the entry already in the cache.
      imageBuilder: imageBuilder == null
          ? null
          : (c, _) => imageBuilder!(c, bounded),
      placeholder: placeholder,
      progressIndicatorBuilder: progressIndicatorBuilder,
      errorWidget: errorWidget,
      placeholderFadeInDuration: placeholderFadeInDuration,
      fadeOutDuration: fadeOutDuration,
      fadeOutCurve: fadeOutCurve,
      fadeInDuration: fadeInDuration,
      fadeInCurve: fadeInCurve,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      color: color,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      memCacheWidth: decodeWidth,
      memCacheHeight: decodeHeight,
      cacheKey: cacheKey,
    );
  }
}
