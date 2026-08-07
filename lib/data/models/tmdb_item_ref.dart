/// What a `tmdb:` item id points at.
enum TmdbItemKind { person, movie, tv }

/// A details screen item that lives in Seerr rather than in the library.
///
/// The id travels in the route, so it has to say both what kind of thing it is
/// and how to find it: `tmdb:movie:603`, `tmdb:tv:1399`, `tmdb:person:6384`.
/// A bare `tmdb:6384` is the older person-only form and still parses.
///
/// The id half is a TMDB number for most things, but home rows key some titles
/// by IMDb, so a `tt...` id gets resolved by search instead.
class TmdbItemRef {
  final TmdbItemKind kind;
  final String id;

  const TmdbItemRef(this.kind, this.id);

  static const _prefix = 'tmdb:';

  /// Null when [itemId] is an ordinary library id.
  static TmdbItemRef? tryParse(String itemId) {
    if (!itemId.startsWith(_prefix)) return null;
    final rest = itemId.substring(_prefix.length);
    if (rest.isEmpty) return null;

    final split = rest.indexOf(':');
    if (split < 0) {
      return TmdbItemRef(TmdbItemKind.person, rest);
    }

    final kind = switch (rest.substring(0, split)) {
      'movie' => TmdbItemKind.movie,
      'tv' => TmdbItemKind.tv,
      'person' => TmdbItemKind.person,
      _ => null,
    };
    final id = rest.substring(split + 1);
    if (kind == null || id.isEmpty) return null;
    return TmdbItemRef(kind, id);
  }

  /// The id to put in a route.
  String get itemId => 'tmdb:${kind.name}:$id';

  /// What Seerr calls this kind in its own API.
  String get seerrMediaType => kind == TmdbItemKind.tv ? 'tv' : 'movie';

  @override
  bool operator ==(Object other) =>
      other is TmdbItemRef && other.kind == kind && other.id == id;

  @override
  int get hashCode => Object.hash(kind, id);
}
