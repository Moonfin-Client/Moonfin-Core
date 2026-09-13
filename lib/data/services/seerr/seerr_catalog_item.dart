/// TMDB id a catalog item can be opened with.
///
/// Stock Seerr / TMDB discover: `id` is the TMDB id.
/// List tiles may also send `tmdbId` plus `mappingState`. Only `mapped`
/// tiles are opened; unmapped / ambiguous / pending ids must not go to
/// `/movie/{id}` or `/tv/{id}`.
int? seerrCatalogTmdbId(Map<String, dynamic> item) {
  final state = seerrCatalogMappingState(item);
  if (state != null && state != 'mapped') return null;

  final tmdbId = item['tmdbId'];
  if (state != null || tmdbId != null) return _positiveInt(tmdbId);

  return _positiveInt(item['id']);
}

int? _positiveInt(Object? value) {
  final parsed = switch (value) {
    num number => number.toInt(),
    String text => int.tryParse(text),
    _ => null,
  };
  if (parsed != null && parsed > 0) return parsed;
  return null;
}

String? seerrCatalogMappingState(Map<String, dynamic> item) {
  final raw = item['mappingState'];
  if (raw is Map) return raw['state']?.toString();
  if (raw is String) return raw;
  return null;
}

/// Shapes a catalog result for [SeerrDiscoverItem], or `null` when there
/// is no TMDB id to open.
Map<String, dynamic>? normalizeSeerrCatalogItem(
  Map<String, dynamic> raw, {
  String? mediaTypeHint,
}) {
  final item = Map<String, dynamic>.from(raw);
  if (item['mediaType'] == 'person') return null;

  final tmdbId = seerrCatalogTmdbId(item);
  if (tmdbId == null) return null;
  item['id'] = tmdbId;

  if (item.containsKey('media') && !item.containsKey('mediaInfo')) {
    item['mediaInfo'] = item['media'];
  }
  if (item['mediaType'] == null && mediaTypeHint != null) {
    item['mediaType'] = mediaTypeHint;
  }
  return item;
}
