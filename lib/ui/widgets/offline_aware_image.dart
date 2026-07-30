import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image_source.dart';

export 'image_source.dart' show isLocalImagePath, offlineAwareImageProvider;

/// Drop-in replacement for [CachedNetworkImage] that renders downloaded
/// local file paths (produced by the offline image API) with [Image.file],
/// and defers to [CachedNetworkImage] for real URLs.
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
  final int? memCacheWidth;
  final int? memCacheHeight;
  final String? cacheKey;

  const OfflineAwareImage({
    super.key,
    required this.imageUrl,
    this.httpHeaders,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.placeholderFadeInDuration,
    this.fadeOutDuration,
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 500),
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
  });

  @override
  Widget build(BuildContext context) {
    if (isLocalImagePath(imageUrl)) {
      final provider = offlineAwareImageProvider(
        imageUrl,
        maxWidth: memCacheWidth,
        maxHeight: memCacheHeight,
      );
      if (imageBuilder != null) return imageBuilder!(context, provider);
      return Image(
        image: provider,
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
      httpHeaders: httpHeaders,
      imageBuilder: imageBuilder,
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
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      cacheKey: cacheKey,
    );
  }
}
