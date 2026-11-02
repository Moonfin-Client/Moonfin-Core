import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:server_core/server_core.dart';

import 'image_source.dart';
import 'paced_network_image.dart';

/// A user's avatar from [url], painted [size] points square, or [fallback]
/// when there's none or it fails to load.
///
/// Two things plain image widgets can't do:
///
/// - **Placeholder URLs.** A server can hand out a URL to be resolved first
///   (`CachedNetworkImageProvider.urlResolver`, which a Silo client does for
///   a profile it hasn't read yet). It's resolved here before loading.
/// - **SVG avatars.** Silo's preset avatars are SVG (its bundled set, or
///   DiceBear). Those are drawn with `flutter_svg`, and anything else loads
///   as a bitmap, decoded at the painted size.
class UserAvatarImage extends StatefulWidget {
  const UserAvatarImage({
    super.key,
    required this.url,
    required this.size,
    required this.fallback,
  });

  final String? url;
  final double size;
  final Widget fallback;

  @override
  State<UserAvatarImage> createState() => _UserAvatarImageState();
}

class _UserAvatarImageState extends State<UserAvatarImage> {
  String? _resolved;
  int _generation = 0;

  @override
  void initState() {
    super.initState();
    _resolve();
  }

  @override
  void didUpdateWidget(covariant UserAvatarImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) _resolve();
  }

  void _resolve() {
    final generation = ++_generation;
    final url = widget.url;
    if (url == null || url.isEmpty) {
      _resolved = null;
      return;
    }
    final pending = CachedNetworkImageProvider.urlResolver?.call(url);
    if (pending == null) {
      _resolved = url;
      return;
    }
    _resolved = null;
    pending.then((value) {
      if (mounted && generation == _generation) {
        setState(() => _resolved = value);
      }
    }, onError: (_) {});
  }

  @override
  Widget build(BuildContext context) {
    final url = _resolved;
    if (url == null || url.isEmpty) return widget.fallback;
    if (isSvgImageUrl(url)) {
      return SvgPicture.network(
        url,
        headers: serverImageHeaders,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.cover,
        placeholderBuilder: (_) => widget.fallback,
        errorBuilder: (_, _, _) => widget.fallback,
      );
    }
    return Image(
      image: ResizeImage.resizeIfNeeded(
        ArtworkDecode.widthFor(
          widget.size,
          MediaQuery.devicePixelRatioOf(context),
        ),
        null,
        PacedNetworkImage(url, headers: serverImageHeaders),
      ),
      fit: BoxFit.cover,
      width: widget.size,
      height: widget.size,
      errorBuilder: (_, _, _) => widget.fallback,
    );
  }
}

/// Whether [url] names an SVG image: an `.svg` path, or a path ending in
/// `/svg` (DiceBear's `…/9.x/<style>/svg?seed=…`).
bool isSvgImageUrl(String url) {
  final path = Uri.tryParse(url)?.path.toLowerCase() ?? '';
  return path.endsWith('.svg') || path.endsWith('/svg');
}
