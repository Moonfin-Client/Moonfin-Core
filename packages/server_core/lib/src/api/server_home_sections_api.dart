/// Optional extra for an `ItemsApi` whose server curates Home rows of its own
/// (Silo's home sections: trending, hidden gems, seasonal picks and the
/// like).
///
/// Moonfin builds its Home from its own row types. A server with rows of its
/// own offers them as extra rows the user can switch on in Home settings,
/// next to collection and genre rows. The app checks for it with
/// `itemsApi is ServerHomeSectionsApi`, and servers without one need nothing.
abstract interface class ServerHomeSectionsApi {
  /// The server's own Home rows for the signed-in user, in the server's
  /// order. Rows Moonfin already builds itself are left out. Throws when
  /// they can't be read, so callers don't take that for "no rows".
  Future<List<ServerHomeSection>> getServerHomeSections();

  /// The items of row [sectionId], as `{Items, TotalRecordCount, StartIndex}`
  /// with Jellyfin-shaped items. Empty when the server no longer has the row.
  Future<Map<String, dynamic>> getServerHomeSectionItems(
    String sectionId, {
    int? startIndex,
    int? limit,
  });
}

/// One of a server's own Home rows ([ServerHomeSectionsApi]).
class ServerHomeSection {
  const ServerHomeSection({
    required this.id,
    required this.title,
    required this.kind,
  });

  /// The row's id on the server, stable while the row exists.
  final String id;

  /// The row's title as the server shows it.
  final String title;

  /// What kind of row it is on the server (`trending_on_server`…). Moonbase's
  /// admin defaults name a row by it (`type:<kind>`), so it has to stay the
  /// server's own value, never a translated one.
  final String kind;
}
