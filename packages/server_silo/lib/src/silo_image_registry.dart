import 'dart:convert';

import 'package:crypto/crypto.dart';

/// The Jellyfin image types Moonfin asks for, and the Silo artwork each one
/// comes from.
enum SiloImageType {
  /// `poster_url` for movies, series and seasons, `still_url` for episodes
  /// and `photo_url` for people.
  primary('Primary'),
  backdrop('Backdrop'),
  logo('Logo'),
  banner('Banner'),
  thumb('Thumb'),

  /// Clear art.
  art('Art'),
  disc('Disc'),

  /// A chapter's `thumbnail_url`, kept per chapter by its index
  /// (`getChapterImageUrl`). Not one of an item's `ImageTags`: the tag goes
  /// in the chapter's own `ImageTag`.
  chapter('Chapter'),

  /// A trickplay sheet of `/watch/{id}/trickplay`, kept under the **file id**
  /// by its sheet index (`getTrickplayTileImageUrl`). Sheet URLs carry their
  /// own authorization and expire.
  trickplay('Trickplay');

  const SiloImageType(this.jellyfinName);

  /// The name in Jellyfin's `ImageTags` and `BackdropImageTags`.
  final String jellyfinName;
}

/// A stable image tag for a Silo artwork [url]: a hash of its **path**.
///
/// Silo signs artwork URLs with a query that rotates (`?exp=…&sig=…`), while
/// the path names the image itself (it carries a content hash:
/// `poster/w500.f6c3….webp`). Hashing only the path gives the same tag every
/// day for the same picture, so image caches keyed by tag stay valid, and a
/// new tag only when the picture changes.
///
/// The first 16 hex digits of the path's SHA-1: short, and only compared
/// for equality.
String siloImageTag(String url) {
  final queryAt = url.indexOf('?');
  final hashAt = url.indexOf('#');
  var end = url.length;
  if (queryAt >= 0) end = queryAt;
  if (hashAt >= 0 && hashAt < end) end = hashAt;
  return sha1
      .convert(utf8.encode(url.substring(0, end)))
      .toString()
      .substring(0, 16);
}

/// Turns a URL from a Silo answer (artwork, a theme song's stream, a
/// playback plan's media) into one Moonfin can load.
///
/// Silo sends most as a path on the server (`/api/v2/artwork/…`), which gets
/// [baseUrl] in front (keeping any sub-path a reverse proxy adds).
/// Absolute URLs (TMDB, TVDB, an S3 bucket) pass through, and a
/// scheme-relative `//host/…` takes [baseUrl]'s scheme. **No token is ever
/// appended**: the URLs are already signed, and a token in an image URL would
/// leak the session into caches and logs.
///
/// Null or blank gives null.
String? resolveSiloUrl(String? url, String baseUrl) {
  final trimmed = url?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  final lower = trimmed.toLowerCase();
  if (lower.startsWith('http://') || lower.startsWith('https://')) {
    return trimmed;
  }
  if (trimmed.startsWith('//')) {
    final scheme = Uri.tryParse(baseUrl)?.scheme;
    return '${scheme == null || scheme.isEmpty ? 'https' : scheme}:$trimmed';
  }
  final base = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;
  return trimmed.startsWith('/') ? '$base$trimmed' : '$base/$trimmed';
}

/// Where the Silo client keeps the artwork URLs it saw while mapping items,
/// so `ImageApi`, which asks by item id and image type only, can answer.
///
/// Jellyfin builds image URLs from an item id, but Silo hands out ready,
/// signed URLs inside each item. The mappers call [register] for every
/// artwork URL they meet and put the returned tag in the item's `ImageTags`,
/// and `ImageApi` calls [urlFor]. A newer URL for the same image replaces
/// the older one, which keeps the signature fresh.
///
/// An id never seen (cold start from cached rows, a deep link) is resolved
/// by loading the item (`SiloImageResolver`).
class SiloImageRegistry {
  SiloImageRegistry(this._baseUrl);

  /// The server's base URL, read on every call so a changed address applies.
  final String Function() _baseUrl;

  final Map<String, _SiloImage> _images = {};

  /// Every registered URL by its tag, so an image asked for with the tag an
  /// item carries gets exactly that picture, even after the same slot was
  /// registered again at another size.
  final Map<String, String> _byTag = {};

  /// Items, people and libraries whose artwork has been read (see [note]).
  final Set<String> _known = {};

  static String _key(String itemId, SiloImageType type, int index) =>
      '$itemId|${type.name}|$index';

  /// Records [url] as image [index] of [type] for [itemId], and returns its
  /// tag. Returns null, and records nothing, when [url] is null or blank.
  String? register(
    String itemId,
    SiloImageType type,
    String? url, {
    int index = 0,
  }) {
    final resolved = resolveSiloUrl(url, _baseUrl());
    if (resolved == null) return null;
    // Tagged as Silo sent it, before the base URL goes in front: the same
    // picture reached at a LAN and a public address keeps one tag.
    final tag = siloImageTag(url!.trim());
    _images[_key(itemId, type, index)] = _SiloImage(resolved, tag);
    _byTag[tag] = resolved;
    return tag;
  }

  /// The loadable URL of image [index] of [type] for [itemId], or null when
  /// none was registered.
  String? urlFor(String itemId, SiloImageType type, {int index = 0}) =>
      _images[_key(itemId, type, index)]?.url;

  /// The tag of that image, or null when none was registered.
  String? tagFor(String itemId, SiloImageType type, {int index = 0}) =>
      _images[_key(itemId, type, index)]?.tag;

  /// Records that [itemId]'s artwork fields were read, whether or not it had
  /// any: an image missing for a known item is absent, not merely unseen, so
  /// `ImageApi` answers with no URL instead of resolving it.
  void note(String itemId) => _known.add(itemId);

  /// Whether [note] was called for [itemId].
  bool knows(String itemId) => _known.contains(itemId);

  /// The latest URL registered with [tag], or null.
  String? urlForTag(String tag) => _byTag[tag];

  /// How many images are registered.
  int get length => _images.length;

  /// Forgets everything, for a sign-out or a different server.
  void clear() {
    _images.clear();
    _byTag.clear();
    _known.clear();
  }
}

class _SiloImage {
  const _SiloImage(this.url, this.tag);

  final String url;
  final String tag;
}
