import 'package:server_core/server_core.dart';

import '../models/aggregated_library.dart';
import '../repositories/user_views_repository.dart';

/// Which libraries a query is allowed to touch.
///
/// Two separate ideas live here on purpose, because they behave differently:
///
/// * **Access** is what the server's admin granted the account
///   (`Policy.EnableAllFolders` / `EnabledFolders`). It's a hard boundary the
///   server enforces on every user scoped endpoint, so [permittedLibraryIds]
///   is a second opinion rather than the gate.
/// * **Visibility** is what the user themselves hid from My Media
///   (`UserConfiguration.MyMediaExcludes`). Neither server applies it to a
///   recursive or search query, so a row that would sweep the whole server has
///   to narrow the search itself. That's what [visibleLibraryIds] is for.
///
/// Visibility deliberately fails open. Showing a row beats showing an empty
/// one, and nothing here guards anything the server wouldn't already refuse.
class LibraryScopeService {
  final MediaServerClient _client;
  final UserViewsRepository _views;

  LibraryScopeService(this._client, this._views);

  /// Collection types that can hold each item type, so a search only visits
  /// the libraries worth visiting. A library that declares no type holds
  /// anything, so it's always worth a look.
  static const _libraryTypesByItemType = <String, String>{
    'Movie': 'movies',
    'Series': 'tvshows',
    'Episode': 'tvshows',
    'BoxSet': 'boxsets',
  };

  Set<String>? _permitted;
  bool _permittedResolved = false;

  /// Library ids the account is allowed to see, or null when the policy places
  /// no restriction. Null is "everything", never "nothing".
  ///
  /// Cached for the session. Policy changes land on the next sign in, which is
  /// also when the rest of the app re-reads it.
  Future<Set<String>?> permittedLibraryIds() async {
    if (_permittedResolved) return _permitted;
    try {
      final policy = (await _client.usersApi.getCurrentUser()).policy;
      if (policy == null || policy.enableAllFolders) {
        _permitted = null;
      } else {
        final blocked = policy.blockedMediaFolders.toSet();
        final allowed = policy.enabledFolders
            .where((id) => id.isNotEmpty && !blocked.contains(id))
            .toSet();
        // An empty allow list with EnableAllFolders off would mean no library
        // at all, which is almost always a parse problem rather than intent.
        // Defer to the server instead of blanking the app.
        _permitted = allowed.isEmpty ? null : allowed;
      }
    } catch (_) {
      _permitted = null;
    }
    _permittedResolved = true;
    return _permitted;
  }

  /// The libraries to search for [includeItemTypes], or null when one sweep of
  /// the server is still right because nothing is hidden.
  Future<List<String>?> visibleLibraryIds(List<String> includeItemTypes) async {
    try {
      if ((await _views.getMyMediaExcludes()).isEmpty) return null;

      final wanted = includeItemTypes
          .map((type) => _libraryTypesByItemType[type])
          .whereType<String>()
          .toSet();
      final permitted = await permittedLibraryIds();
      final ids = <String>[];
      for (final view in await _views.getUserViews()) {
        final type = view.collectionType.toLowerCase();
        if (view.id.isEmpty) continue;
        if (permitted != null && !permitted.contains(view.id)) continue;
        if (type.isEmpty || wanted.isEmpty || wanted.contains(type)) {
          ids.add(view.id);
        }
      }
      // Nothing left to search would empty the row, so let the sweep stand and
      // show something rather than nothing.
      return ids.isEmpty ? null : ids;
    } catch (_) {
      return null;
    }
  }

  /// Drops the libraries the user hid from My Media.
  ///
  /// For the multi server library list, which is assembled per server and so
  /// never passed through the filtering a single server's /UserViews does.
  Future<List<AggregatedLibrary>> withoutHiddenLibraries(
    List<AggregatedLibrary> libraries,
  ) async {
    try {
      final hidden = await _views.getMyMediaExcludes();
      if (hidden.isEmpty) return libraries;
      return libraries.where((lib) => !hidden.contains(lib.id)).toList();
    } catch (_) {
      return libraries;
    }
  }

  /// Drops any id the account isn't permitted to see, for the places a stored
  /// preference names libraries access may have been revoked for since.
  Future<List<String>> retainPermitted(Iterable<String> ids) async {
    final permitted = await permittedLibraryIds();
    if (permitted == null) return ids.toList(growable: false);
    return ids.where(permitted.contains).toList(growable: false);
  }
}
