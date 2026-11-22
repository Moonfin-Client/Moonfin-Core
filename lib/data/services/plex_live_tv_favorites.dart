import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/server_plex.dart';

import '../../auth/models/user.dart';
import '../../auth/repositories/user_repository.dart';
import '../../auth/store/authentication_store.dart';
import '../../preference/user_preferences.dart';
import 'user_data_sync.dart';
import 'media_server_client_factory.dart';

bool isPlexFreeTvChannel(MediaServerClient client, String channelId) =>
    client.serverType == ServerType.plex &&
    channelId.startsWith('channel-plex-');

/// Guide IDs are synthetic, but Plex Cloud favorites identify channels by
/// source URI and provider channel ID. DVR channels cannot be rated.
bool isPlexLiveTvChannel(MediaServerClient client, String channelId) =>
    client.serverType == ServerType.plex &&
    channelId.startsWith('channel-');

/// Plex owns both Free TV and DVR favorites. Cache source+provider IDs rather
/// than synthetic guide IDs, which can collide between PMS servers.
class PlexLiveTvFavorites {
  static const _freePrefix = 'channel-plex-';
  static const _freeSource = 'provider://tv.plex.provider.epg';
  static final _api = PlexLiveTvFavoritesApi();

  // Tests inject only the provider transport; user and cache logic stays here.
  @visibleForTesting
  static PlexLiveTvFavoritesApi? testApi;

  static final _pending = <String, Future<void>>{};
  // A short-lived successful read is shared by Home and search.
  static const _browseRefreshAge = Duration(seconds: 30);
  static final _lastRefresh = <String, DateTime>{};

  /// A cached account list changed, including when it came from another PMS.
  /// Home can rebuild favorite-channel row membership without polling.
  static final ValueNotifier<({String userId, int revision})?>
      favoriteListChanged = ValueNotifier(null);
  static int _favoriteListRevision = 0;

  // Keep DVR metadata with the client across address changes. When the
  // client is discarded, the cached metadata can be collected too.
  static Expando<_PlexFavoriteCatalog> _known =
      Expando<_PlexFavoriteCatalog>('Plex favorite channels');
  static Expando<int> _clientIds = Expando<int>('Plex favorite clients');
  static int _nextClientId = 0;

  static _PlexFavoriteCatalog _catalog(MediaServerClient client) {
    final cached = _known[client];
    if (cached != null && cached.userId == client.userId) return cached;
    final catalog = _PlexFavoriteCatalog(client.userId);
    _known[client] = catalog;
    return catalog;
  }

  static String _catalogKey(MediaServerClient client) =>
      '${client.userId ?? ''}\u0000${_clientIds[client] ??= ++_nextClientId}';

  @visibleForTesting
  static void resetForTesting() {
    _pending.clear();
    _known = Expando<_PlexFavoriteCatalog>('Plex favorite channels');
    _lastRefresh.clear();
    favoriteListChanged.value = null;
    _favoriteListRevision = 0;
    _clientIds = Expando<int>('Plex favorite clients');
    _nextClientId = 0;
    testApi = null;
  }

  static Preference<List<String>> _preference(String userId) =>
      Preference<List<String>>(
        key: 'plex_live_tv_favorite_keys_' + Uri.encodeComponent(userId),
        defaultValue: const [],
      );

  static ({String id, String token}) _account(MediaServerClient client) {
    final userId = client.userId;
    if (client.serverType != ServerType.plex ||
        userId == null ||
        userId.isEmpty) {
      throw StateError('No Plex account token for this user');
    }
    final getIt = GetIt.instance;
    final serverId = getIt.isRegistered<MediaServerClientFactory>()
        ? getIt<MediaServerClientFactory>().serverIdOf(client)
        : null;
    // Multi-server browsing supplies a saved client's session, not necessarily
    // the currently signed-in user. Resolve the account attached to that client.
    final stored = serverId != null && getIt.isRegistered<AuthenticationStore>()
        ? getIt<AuthenticationStore>().getUser(serverId, userId)
        : null;
    final current = getIt.isRegistered<UserRepository>()
        ? getIt<UserRepository>().currentUser
        : null;
    final user = stored ??
        (current is PrivateUser &&
                current.id == userId &&
                (serverId == null || current.serverId == serverId)
            ? current
            : null);
    final token = user?.plexToken;
    if (token == null || token.isEmpty) {
      throw StateError('No Plex account token for this user');
    }
    // The caller's user ID and token are checked again before applying a read.
    return (id: userId, token: token);
  }

  static void _checkAccount(MediaServerClient client, String token) {
    if (_account(client).token != token) {
      throw StateError('Plex account changed while saving favorites');
    }
  }

  static Future<T> _serial<T>(String id, Future<T> Function() operation) async {
    final previous = _pending[id];
    final gate = Completer<void>();
    _pending[id] = gate.future;
    try {
      if (previous != null) await previous;
      return await operation();
    } finally {
      gate.complete();
      if (identical(_pending[id], gate.future)) _pending.remove(id);
    }
  }

  static Future<List<Map<String, dynamic>>> _read(
    MediaServerClient client,
    String token,
  ) => (testApi ?? _api).readFavorites(
    deviceInfo: client.deviceInfo,
    accountToken: token,
  );

  static Future<void> _write(
    MediaServerClient client,
    String token,
    List<Map<String, dynamic>> rows,
  ) => (testApi ?? _api).writeFavorites(
    deviceInfo: client.deviceInfo,
    accountToken: token,
    rows: rows,
  );

  static String _key(Map<String, dynamic> info) =>
      (info['source'] as String) + '\u0000' + (info['id'] as String);

  /// Sync favorites across connections to the same Plex account, not across users.
  static String syncKey(MediaServerClient client, String channelId) {
    if (!isPlexLiveTvChannel(client, channelId)) return channelId;
    final account = client.userId;
    final scope = account == null || account.isEmpty
        ? _catalogKey(client)
        : account;
    if (isPlexFreeTvChannel(client, channelId)) {
      return 'plex-free:$scope\u0000$channelId';
    }
    final info = _catalog(client).channels[channelId];
    return info == null
        ? 'plex-dvr:$scope\u0000${_catalogKey(client)}\u0000$channelId'
        : 'plex-dvr:$scope\u0000${_key(info)}';
  }

  static bool _matches(
    Map<String, dynamic> info,
    Map<String, dynamic> row,
  ) => row['id'] == info['id'] && row['source'] == info['source'];

  static Map<String, dynamic>? _info(
    MediaServerClient client,
    Map<String, dynamic> item,
    String channelId,
  ) {
    final free = isPlexFreeTvChannel(client, channelId);
    final source = item['PlexFavoriteSource'] ?? (free ? _freeSource : null);
    final id = item['PlexFavoriteId'] ??
        (free ? channelId.substring(_freePrefix.length) : null);
    if (source is! String || source.isEmpty || id is! String || id.isEmpty) {
      return null;
    }
    return {
      'source': source,
      'id': id,
      if (item['Name'] is String) 'title': item['Name'],
      if ((item['ImageTags'] as Map?)?['Primary'] is String)
        'thumb': (item['ImageTags'] as Map)['Primary'],
      if (item['ChannelNumber'] is String) 'vcn': item['ChannelNumber'],
    };
  }

  static Future<void> _cache(
    MediaServerClient client,
    String token,
    List<Map<String, dynamic>> rows,
  ) async {
    _checkAccount(client, token);
    final userId = client.userId!;
    final pref = _preference(userId);
    final prefs = GetIt.instance<UserPreferences>();
    final previous = prefs.get(pref).toSet();
    // Cache the full Plex favorites list, even if only some channels are loaded.
    final favorites = <String>{
      for (final row in rows)
        if (row['source'] is String && row['id'] is String) _key(row),
    };
    await prefs.set(pref, favorites.toList()..sort());
    _checkAccount(client, token);
    _publishCached(client, token);
    _lastRefresh[userId] = DateTime.now();
    if (!setEquals(previous, favorites)) {
      favoriteListChanged.value = (
        userId: userId,
        revision: ++_favoriteListRevision,
      );
    }
  }

  /// A recent refresh may have come from a different PMS on this Plex account.
  /// Apply its stored results to this client's DVR catalog without another GET.
  /// Update this client's known channels when another Plex connection for
  /// the same account fetches a changed favorites list. No network request.
  static void applyCachedToClient(MediaServerClient client) {
    final change = favoriteListChanged.value;
    if (change == null ||
        client.serverType != ServerType.plex ||
        change.userId != client.userId ||
        !GetIt.instance.isRegistered<UserPreferences>()) {
      return;
    }
    _publishCached(client, _account(client).token);
  }

  static bool _publishCached(MediaServerClient client, String token) {
    _checkAccount(client, token);
    final userId = client.userId!;
    final favorites = GetIt.instance<UserPreferences>()
        .get(_preference(userId)).toSet();
    final changes = {
      for (final entry in _catalog(client).channels.entries)
        syncKey(client, entry.key): <String, dynamic>{
          'IsFavorite': favorites.contains(_key(entry.value)),
        },
    };
    final changed = changes.entries.any(
      (entry) => userDataSync.favoriteFor(entry.key) != entry.value['IsFavorite'],
    );
    userDataSync.publishAll(changes);
    return changed;
  }

  static Future<bool> _refresh(
    MediaServerClient client, {
    required bool ifStale,
  }) async {
    final account = _account(client);
    return _serial(account.id, () async {
      final last = _lastRefresh[account.id];
      if (ifStale &&
          last != null &&
          DateTime.now().difference(last) < _browseRefreshAge) {
        return _publishCached(client, account.token);
      }
      final remote = await _read(client, account.token);
      _checkAccount(client, account.token);
      await _cache(client, account.token, remote);
      return true;
    });
  }

  static Future<void> refresh(
    MediaServerClient client, {
    bool ifStale = false,
  }) async {
    await _refresh(client, ifStale: ifStale);
  }

  /// Read account favorites without holding up browsing. Also returns true
  /// when a different PMS has refreshed this account and we publish its cache.
  static Future<bool> refreshForBrowse(MediaServerClient client) async {
    try {
      if (client.serverType != ServerType.plex) return false;
      return await _refresh(client, ifStale: true);
    } catch (_) {
      // Missing token, network failure or malformed response: use cached data.
      return false;
    }
  }

  static Map<String, dynamic> applyToItem(
    MediaServerClient client,
    Map<String, dynamic> item,
  ) {
    final channelId = item['Id']?.toString() ?? '';
    final userId = client.userId;
    if (item['Type'] != 'TvChannel' ||
        !isPlexLiveTvChannel(client, channelId) ||
        userId == null ||
        userId.isEmpty ||
        !GetIt.instance.isRegistered<UserPreferences>()) {
      return item;
    }
    final info = _info(client, item, channelId);
    // Without a verified machine ID, keep this favorite local to its PMS.
    if (info == null) {
      // Don't reuse an old DVR provider if the current row can't verify its
      // machine ID, such as after a server address changes.
      _catalog(client).channels.remove(channelId);
      return {...item, 'PlexFavoriteSyncKey': syncKey(client, channelId)};
    }
    _catalog(client).channels[channelId] = info;
    final favorites = GetIt.instance<UserPreferences>().get(_preference(userId));
    final userData = item['UserData'];
    return {
      ...item,
      'PlexFavoriteSyncKey': syncKey(client, channelId),
      'UserData': {
        if (userData is Map) ...userData,
        'IsFavorite': favorites.contains(_key(info)),
      },
    };
  }

  static Future<void> setFavorite(
    MediaServerClient client,
    String channelId, {
    required bool isFavorite,
  }) async {
    if (!isPlexLiveTvChannel(client, channelId)) {
      throw ArgumentError.value(channelId, 'channelId');
    }
    final account = _account(client);
    await _serial(account.id, () async {
      final info = _catalog(client).channels[channelId] ??
          (isPlexFreeTvChannel(client, channelId)
              ? <String, dynamic>{
                  'source': _freeSource,
                  'id': channelId.substring(_freePrefix.length),
                }
              : null);
      if (info == null) {
        throw StateError('Plex DVR channel has no verified EPG provider identity');
      }
      final remote = await _read(client, account.token);
      _checkAccount(client, account.token);
      final rows = [...remote];
      final hadFavorite = rows.any((row) => _matches(info, row));
      if (isFavorite && !hadFavorite) {
        rows.add({...info});
      } else if (!isFavorite && hadFavorite) {
        rows.removeWhere((row) => _matches(info, row));
      }
      // Plex replaces the full favorites list on write, so keep other PMS entries.
      if (isFavorite != hadFavorite) {
        await _write(client, account.token, rows);
      }
      try {
        await _cache(client, account.token, rows);
      } catch (_) {
        // Plex saved the favorite even though the local cache write failed.
        // Keep that value and refresh it next time, unless the account changed.
        _checkAccount(client, account.token);
        _lastRefresh.remove(account.id);
        userDataSync.publish(
          syncKey(client, channelId),
          {'IsFavorite': isFavorite},
        );
      }
    });
  }
}

class _PlexFavoriteCatalog {
  _PlexFavoriteCatalog(this.userId);

  final String? userId;
  final Map<String, Map<String, dynamic>> channels = {};
}
