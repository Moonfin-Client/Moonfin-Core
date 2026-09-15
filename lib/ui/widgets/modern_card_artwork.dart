import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/vibrance.dart';
import 'bounded_network_image.dart';
import 'image_source.dart';

/// Artwork for a modern home card whose bounds expand from poster to landscape.
/// Decode dimensions come from the two endpoints, never the animated width.
/// The poster remains underneath until the landscape has a decoded frame.
class ModernCardArtwork extends StatefulWidget {
  final String? posterImageUrl;
  final String? expandedImageUrl;
  final double collapsedWidth;
  final double expandedWidth;
  final double imageHeight;
  final double expansionProgress;
  final Duration duration;
  final BoxFit fit;
  final Widget placeholder;

  @visibleForTesting
  final ImageProvider Function(String imageUrl, int cacheWidth)?
  imageProviderBuilder;

  const ModernCardArtwork({
    super.key,
    required this.posterImageUrl,
    required this.expandedImageUrl,
    required this.collapsedWidth,
    required this.expandedWidth,
    required this.imageHeight,
    required this.expansionProgress,
    required this.duration,
    this.fit = BoxFit.cover,
    this.placeholder = const SizedBox.shrink(),
    this.imageProviderBuilder,
  });

  @override
  State<ModernCardArtwork> createState() => _ModernCardArtworkState();
}

class _ModernCardArtworkState extends State<ModernCardArtwork> {
  ImageProvider? _poster;
  ImageProvider? _expanded;
  bool _loadExpanded = false;
  String? _resolvedBaseUrl;
  bool _posterHasFrame = false;
  double? _devicePixelRatio;

  String? _usableUrl(String? url) => url == null || url.isEmpty ? null : url;

  String? get _posterUrl => _usableUrl(widget.posterImageUrl);
  String? get _expandedUrl => _usableUrl(widget.expandedImageUrl);

  bool get _hasSeparateLandscape =>
      _posterUrl != null && _expandedUrl != null && _posterUrl != _expandedUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dpr = MediaQuery.devicePixelRatioOf(context);
    if (dpr != _devicePixelRatio) {
      _devicePixelRatio = dpr;
      _resolveProviders();
    }
  }

  @override
  void didUpdateWidget(covariant ModernCardArtwork oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.posterImageUrl != widget.posterImageUrl ||
        oldWidget.expandedImageUrl != widget.expandedImageUrl ||
        oldWidget.collapsedWidth != widget.collapsedWidth ||
        oldWidget.expandedWidth != widget.expandedWidth ||
        oldWidget.imageProviderBuilder != widget.imageProviderBuilder) {
      _loadExpanded = false;
      _resolveProviders();
    }
  }

  ImageProvider _provider(String url, double width, int maxWidth) {
    final cacheWidth = BoundedNetworkImage.cacheWidthFor(
      width,
      _devicePixelRatio!,
      maxWidth: maxWidth,
    );
    return widget.imageProviderBuilder?.call(url, cacheWidth) ??
        offlineAwareImageProvider(url, maxWidth: cacheWidth);
  }

  void _resolveProviders() {
    final baseUrl = _posterUrl ?? _expandedUrl;
    if (baseUrl != _resolvedBaseUrl) {
      _resolvedBaseUrl = baseUrl;
      _posterHasFrame = false;
    }
    _poster = baseUrl == null
        ? null
        : _provider(
            baseUrl,
            _hasSeparateLandscape
                ? widget.collapsedWidth
                : widget.expandedWidth,
            _hasSeparateLandscape ? 640 : 960,
          );
    _expanded = _hasSeparateLandscape
        ? _provider(_expandedUrl!, widget.expandedWidth, 960)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    _loadExpanded = _loadExpanded || widget.expansionProgress > 0;
    final landscape = _loadExpanded && _expanded != null
        ? _LandscapeImage(
            key: ValueKey(_expanded),
            image: _expanded!,
            expansionProgress: widget.expansionProgress,
            duration: widget.duration,
            fit: widget.fit,
          )
        : null;
    return Vibrance.wrap(
      Stack(
        fit: StackFit.expand,
        children: [
          if (_poster != null)
            Image(
              key: ValueKey(_posterUrl ?? _expandedUrl),
              image: _poster!,
              fit: widget.fit,
              // A newly discovered landscape can change the fallback's
              // endpoint decode size; keep its current frame in that case.
              gaplessPlayback: true,
              excludeFromSemantics: true,
              // A hidden text/gradient fallback still costs layout and paint.
              // Drop it once the image has a frame, including during resizing.
              frameBuilder: (_, child, frame, synchronous) {
                _posterHasFrame =
                    _posterHasFrame || frame != null || synchronous;
                // gaplessPlayback keeps the old frame when only the decode
                // size changes, even though the new stream's frame is null.
                return _posterHasFrame ? child : widget.placeholder;
              },
              errorBuilder: (_, _, _) => widget.placeholder,
            )
          else
            widget.placeholder,
          if (landscape != null)
            ClipRect(
              child: widget.fit == BoxFit.cover
                  ? OverflowBox(
                      alignment: Alignment.center,
                      minWidth: widget.expandedWidth,
                      maxWidth: widget.expandedWidth,
                      minHeight: widget.imageHeight,
                      maxHeight: widget.imageHeight,
                      child: landscape,
                    )
                  : landscape,
            ),
        ],
      ),
    );
  }
}

/// Uses a second fade only for an image that arrives after expansion begins.
/// Cached frames follow expansion directly, including immediate reversals.
class _LandscapeImage extends StatefulWidget {
  final ImageProvider image;
  final double expansionProgress;
  final Duration duration;
  final BoxFit fit;

  const _LandscapeImage({
    super.key,
    required this.image,
    required this.expansionProgress,
    required this.duration,
    required this.fit,
  });

  @override
  State<_LandscapeImage> createState() => _LandscapeImageState();
}

class _LandscapeImageState extends State<_LandscapeImage>
    with SingleTickerProviderStateMixin {
  late final _readiness = AnimationController(vsync: this);
  bool _hasFrame = false;
  bool _frameScheduled = false;
  bool _failed = false;
  bool _retrying = false;
  int _attempt = 0;

  @override
  void didUpdateWidget(covariant _LandscapeImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_failed &&
        !_retrying &&
        oldWidget.expansionProgress <= 0 &&
        widget.expansionProgress > 0) {
      // An Image retains its error state when only its surrounding geometry
      // changes. Retry at the next expansion, leaving healthy images intact.
      unawaited(_retryLandscape());
    }
  }

  Future<void> _retryLandscape() async {
    _retrying = true;
    try {
      // The failed completer can remain in the live image cache while this
      // widget is mounted. Evict it before resolving the same decode key.
      await widget.image.evict();
    } catch (_) {
      _retrying = false;
      return;
    }
    if (!mounted) return;
    _readiness.value = 0;
    setState(() {
      _attempt++;
      _retrying = false;
      _failed = false;
      _hasFrame = false;
      _frameScheduled = false;
    });
  }

  @override
  void dispose() {
    _readiness.dispose();
    super.dispose();
  }

  void _onFrame(bool synchronous) {
    if (_hasFrame || _frameScheduled) return;
    _frameScheduled = true;
    final attempt = _attempt;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || attempt != _attempt) return;
      _hasFrame = true;
      if (synchronous || widget.duration == Duration.zero) {
        _readiness.value = 1;
      } else {
        _readiness.animateTo(
          1,
          duration: widget.duration,
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      key: ValueKey(_attempt),
      image: widget.image,
      fit: widget.fit,
      excludeFromSemantics: true,
      errorBuilder: (_, _, _) {
        _failed = true;
        return const SizedBox.shrink();
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame != null || wasSynchronouslyLoaded) {
          _onFrame(wasSynchronouslyLoaded);
        }
        return AnimatedBuilder(
          animation: _readiness,
          child: child,
          builder: (context, child) => Opacity(
            opacity:
                widget.expansionProgress.clamp(0.0, 1.0) * _readiness.value,
            child: child,
          ),
        );
      },
    );
  }
}
