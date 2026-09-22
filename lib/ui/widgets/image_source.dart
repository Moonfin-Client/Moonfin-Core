import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../util/artwork_request_size.dart';
import '../../util/image_fetch_priority.dart';

export '../../util/image_fetch_priority.dart' show ImageFetchPriority;

/// When offline, the image API resolves to downloaded local file paths
/// instead of server URLs. These helpers let network-image widgets render
/// either one transparently.
bool isLocalImagePath(String url) =>
    !kIsWeb && url.isNotEmpty && !url.startsWith('http');

/// Drop-in replacement for [CachedNetworkImageProvider] construction that
/// resolves local file paths to a [FileImage].
ImageProvider offlineAwareImageProvider(
  String url, {
  int? maxWidth,
  int? maxHeight,
  String? cacheKey,
  Map<String, String>? headers,
  BaseCacheManager? cacheManager,
}) {
  if (isLocalImagePath(url)) {
    final file = FileImage(File(url));
    if (maxWidth != null || maxHeight != null) {
      return ResizeImage.resizeIfNeeded(maxWidth, maxHeight, file);
    }
    return file;
  }
  // maxWidth/maxHeight bound the decode, matching the local-file branch above.
  // They are deliberately not passed to the provider: that would make the cache
  // manager keep the original and write a second, PNG re-encoded copy per size.
  final provider = CachedNetworkImageProvider(
    url,
    cacheKey: cacheKey,
    headers: headers,
    cacheManager: cacheManager,
  );
  if (maxWidth != null || maxHeight != null) {
    return ResizeImage.resizeIfNeeded(maxWidth, maxHeight, provider);
  }
  return provider;
}

/// The one set of rules for how large an image is decoded.
///
/// Every image widget, every precache and every eviction derives its decode
/// size from here, so a poster warmed by a prefetch is the same cache entry
/// the card later paints, and an eviction finds what was inserted. A decode
/// bound computed anywhere else is a second decode and a second entry.
class ArtworkDecode {
  ArtworkDecode._();

  /// The widest artwork the server is ever asked for, so a bound derived from
  /// a layout wider than that never asks the decoder to upscale.
  static const maxSourceWidth = 1920;

  /// Decode widths round up to a multiple of this.
  ///
  /// Two rows painting the same poster a few pixels apart, a fractional device
  /// pixel ratio, or a card growing under focus otherwise each produce a new
  /// cache key, a second decode, and a remount of the image element. Rounding
  /// up costs at most 19 pixels of width and never paints smaller than the
  /// box. Twenty divides both request steps the library grid uses (140 and
  /// 240), so the server is never asked for less than what is decoded.
  static const widthStep = 20;

  /// The next multiple of [widthStep] at or above [pixels].
  static int stepUp(int pixels) {
    if (pixels <= 0) return 0;
    return ((pixels + widthStep - 1) ~/ widthStep) * widthStep;
  }

  /// The decoded pixel width for an image painted [layoutWidth] points wide.
  ///
  /// With [sourceAspectRatio] and [layoutHeight] given, the width is first
  /// raised to what a cover fit needs to fill the height: a 16:9 backdrop in a
  /// portrait phone box paints far wider than the box, and bounding by the box
  /// width alone would decode it at a quarter of its painted size.
  ///
  /// [scale] below 1 is only correct inside a tight box (a blurred backdrop in
  /// an expanded stack). In a loose box the image would lay out at the smaller
  /// decoded size.
  static int widthFor(
    double layoutWidth,
    double devicePixelRatio, {
    double? layoutHeight,
    double? sourceAspectRatio,
    double scale = 1.0,
    int minWidth = 64,
    int maxWidth = maxSourceWidth,
  }) {
    var width = layoutWidth;
    if (layoutHeight != null &&
        layoutHeight.isFinite &&
        sourceAspectRatio != null &&
        sourceAspectRatio > 0) {
      width = math.max(width, layoutHeight * sourceAspectRatio);
    }
    final pixels = artworkPhysicalPixels(width * scale, devicePixelRatio);
    return stepUp(pixels).clamp(minWidth, maxWidth);
  }

  /// The decoded pixel height for an image painted [layoutHeight] points
  /// tall, for the few places that only know their height (a contain-fit
  /// cover in a row). The width follows the source aspect at decode time.
  static int heightFor(
    double layoutHeight,
    double devicePixelRatio, {
    double scale = 1.0,
    int minHeight = 64,
    int maxHeight = maxSourceWidth,
  }) {
    final pixels = artworkPhysicalPixels(
      layoutHeight * scale,
      devicePixelRatio,
    );
    return stepUp(pixels).clamp(minHeight, maxHeight);
  }

  /// The provider a widget paints and a precache warms. This is the only
  /// place a bounded artwork provider is built, so the two always agree.
  static ImageProvider provider(
    String url, {
    int? width,
    int? height,
    String? cacheKey,
    Map<String, String>? headers,
    BaseCacheManager? cacheManager,
  }) {
    _remember(url, width, height);
    return offlineAwareImageProvider(
      url,
      maxWidth: width,
      maxHeight: height,
      cacheKey: cacheKey,
      headers: headers,
      cacheManager: cacheManager,
    );
  }

  /// Warms the memory cache with the decode a widget will use.
  ///
  /// Pass the same layout inputs the widget will see. A precache at any other
  /// width is a second decode, not a warm-up. Goes out in the low lane unless
  /// told otherwise, so it never delays an image that is on screen.
  static Future<void> precache(
    BuildContext context,
    String url, {
    required double layoutWidth,
    double? layoutHeight,
    double? sourceAspectRatio,
    double scale = 1.0,
    int minWidth = 64,
    int maxWidth = maxSourceWidth,
    Map<String, String>? headers,
    ImageFetchPriority priority = ImageFetchPriority.low,
  }) {
    final width = widthFor(
      layoutWidth,
      MediaQuery.devicePixelRatioOf(context),
      layoutHeight: layoutHeight,
      sourceAspectRatio: sourceAspectRatio,
      scale: scale,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
    return precacheImage(
      provider(
        url,
        width: width,
        headers: artworkFetchHeaders(url, priority, headers: headers),
      ),
      context,
    );
  }

  /// Drops every decode of [url] from the memory cache, at every size it was
  /// built at through [provider], plus the unbounded one.
  static Future<void> evict(String url) async {
    final bounds = _boundsByUrl.remove(url);
    if (bounds != null) {
      for (final (width, height) in bounds) {
        await offlineAwareImageProvider(
          url,
          maxWidth: width,
          maxHeight: height,
        ).evict();
      }
    }
    await offlineAwareImageProvider(url).evict();
  }

  /// Which sizes each URL has been decoded at, so [evict] can rebuild the
  /// keys. Bounded because a long browse touches thousands of URLs, and
  /// losing old entries only means an eviction misses what the cache's own
  /// least-recently-used order will drop anyway.
  static final Map<String, Set<(int?, int?)>> _boundsByUrl =
      <String, Set<(int?, int?)>>{};
  static const _rememberedUrlLimit = 4096;

  static void _remember(String url, int? width, int? height) {
    if (width == null && height == null) return;
    if (_boundsByUrl.length >= _rememberedUrlLimit &&
        !_boundsByUrl.containsKey(url)) {
      _boundsByUrl.clear();
    }
    (_boundsByUrl[url] ??= <(int?, int?)>{}).add((width, height));
  }

  @visibleForTesting
  static void resetRememberedBounds() => _boundsByUrl.clear();
}

/// How an image widget chooses its decode size when the caller gave none.
enum DecodeBound {
  /// Derive it from the painted size (explicit width or height, else the
  /// layout constraints). The default.
  layout,

  /// Decode at the source size. For callers that need the raw provider.
  none,
}

typedef ArtworkBoundBuilder = Widget Function(
  BuildContext context,
  int? decodeWidth,
  int? decodeHeight,
);

/// Resolves the decode size for an image and hands it to [builder].
///
/// An explicit [memCacheWidth] or [memCacheHeight] is used verbatim, so the
/// call sites that already chose a size keep the keys they have. A finite
/// [width] or [height] is turned into a bound without a LayoutBuilder, which
/// is what keeps an image inside IntrinsicHeight or IntrinsicWidth from
/// asserting. Only when nothing is known does this ask the layout.
class ArtworkBound extends StatelessWidget {
  const ArtworkBound({
    super.key,
    required this.builder,
    this.width,
    this.height,
    this.memCacheWidth,
    this.memCacheHeight,
    this.bound = DecodeBound.layout,
    this.sourceAspectRatio,
    this.scale = 1.0,
    this.minWidth = 64,
    this.maxWidth = ArtworkDecode.maxSourceWidth,
  });

  final ArtworkBoundBuilder builder;
  final double? width;
  final double? height;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final DecodeBound bound;
  final double? sourceAspectRatio;
  final double scale;
  final int minWidth;
  final int maxWidth;

  static double? _finite(double? value) =>
      value != null && value.isFinite ? value : null;

  @override
  Widget build(BuildContext context) {
    if (memCacheWidth != null ||
        memCacheHeight != null ||
        bound == DecodeBound.none) {
      return builder(context, memCacheWidth, memCacheHeight);
    }
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final knownWidth = _finite(width);
    if (knownWidth != null) {
      return builder(
        context,
        _widthBound(knownWidth, _finite(height), dpr),
        null,
      );
    }
    final knownHeight = _finite(height);
    if (knownHeight != null) {
      return builder(context, null, _heightBound(knownHeight, dpr));
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth.isFinite) {
          return builder(
            context,
            _widthBound(
              constraints.maxWidth,
              _finite(constraints.maxHeight),
              dpr,
            ),
            null,
          );
        }
        if (constraints.maxHeight.isFinite) {
          return builder(
            context,
            null,
            _heightBound(constraints.maxHeight, dpr),
          );
        }
        // Unbounded both ways: the image lays out at its own size, which the
        // server already capped. The bound only guards a runaway source.
        return builder(context, maxWidth, null);
      },
    );
  }

  int _widthBound(double layoutWidth, double? layoutHeight, double dpr) =>
      ArtworkDecode.widthFor(
        layoutWidth,
        dpr,
        layoutHeight: layoutHeight,
        sourceAspectRatio: sourceAspectRatio,
        scale: scale,
        minWidth: minWidth,
        maxWidth: maxWidth,
      );

  int _heightBound(double layoutHeight, double dpr) => ArtworkDecode.heightFor(
    layoutHeight,
    dpr,
    scale: scale,
    minHeight: minWidth,
    maxHeight: maxWidth,
  );
}
