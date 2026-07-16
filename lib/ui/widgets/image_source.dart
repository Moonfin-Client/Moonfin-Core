import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  );
  if (maxWidth != null || maxHeight != null) {
    return ResizeImage.resizeIfNeeded(maxWidth, maxHeight, provider);
  }
  return provider;
}
