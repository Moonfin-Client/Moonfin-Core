import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/user_repository.dart';
import '../../data/models/aggregated_item.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../util/signed_in_server_features.dart';

class ItemPlaylistMembership {
  final String playlistId;
  final String playlistName;
  final String entryId;

  const ItemPlaylistMembership({
    required this.playlistId,
    required this.playlistName,
    required this.entryId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemPlaylistMembership &&
          runtimeType == other.runtimeType &&
          playlistId == other.playlistId &&
          entryId == other.entryId;

  @override
  int get hashCode => playlistId.hashCode ^ entryId.hashCode;

  @override
  String toString() =>
      'ItemPlaylistMembership(playlistId: $playlistId, playlistName: $playlistName, entryId: $entryId)';
}

class ItemCollectionMembership {
  final String collectionId;
  final String collectionName;

  const ItemCollectionMembership({
    required this.collectionId,
    required this.collectionName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCollectionMembership &&
          runtimeType == other.runtimeType &&
          collectionId == other.collectionId;

  @override
  int get hashCode => collectionId.hashCode;

  @override
  String toString() =>
      'ItemCollectionMembership(collectionId: $collectionId, collectionName: $collectionName)';
}

/// Discovers and caches whether an item belongs to any playlists or collections
/// on the media server (Jellyfin, Emby, Plex, Silo, etc.).
class ItemMembershipService {
  static final ItemMembershipService instance = ItemMembershipService._();
  ItemMembershipService._();
  factory ItemMembershipService() => instance;

  static const Duration _cacheTtl = Duration(minutes: 5);

  // canonicalServerKey -> (playlistId -> list of (itemId, entryId))
  final Map<String, Map<String, List<({String itemId, String entryId})>>>
      _playlistItems = {};
  // canonicalServerKey -> (playlistId -> playlistName)
  final Map<String, Map<String, String>> _playlistNames = {};
  final Map<String, DateTime> _playlistLastFetched = {};
  final Map<String, Completer<void>> _playlistInFlight = {};

  // canonicalServerKey -> (collectionId -> set of itemIds)
  final Map<String, Map<String, Set<String>>> _collectionMembers = {};
  // canonicalServerKey -> (collectionId -> collectionName)
  final Map<String, Map<String, String>> _collectionNames = {};
  final Map<String, DateTime> _collectionLastFetched = {};
  final Map<String, Completer<void>> _collectionInFlight = {};

  String _canonicalServerKey(String? serverId) {
    if (serverId == null || serverId.isEmpty || serverId == 'seerr') {
      if (GetIt.instance.isRegistered<MediaServerClient>()) {
        final client = GetIt.instance<MediaServerClient>();
        if (GetIt.instance.isRegistered<MediaServerClientFactory>()) {
          final factory = GetIt.instance<MediaServerClientFactory>();
          return factory.serverIdOf(client);
        }
        return client.baseUrl;
      }
      return '';
    }
    if (GetIt.instance.isRegistered<MediaServerClientFactory>()) {
      final factory = GetIt.instance<MediaServerClientFactory>();
      final client = factory.getClientIfExists(serverId);
      if (client != null) {
        return factory.serverIdOf(client);
      }
    }
    return serverId;
  }

  MediaServerClient _getClient(String? serverId) {
    if (GetIt.instance.isRegistered<MediaServerClientFactory>()) {
      final factory = GetIt.instance<MediaServerClientFactory>();
      if (serverId != null && serverId.isNotEmpty && serverId != 'seerr') {
        final client = factory.getClientIfExists(serverId);
        if (client != null) return client;
      }
    }
    return GetIt.instance<MediaServerClient>();
  }

  bool _canManageCollections(AggregatedItem item) {
    if (!GetIt.instance.isRegistered<UserRepository>()) return false;
    final client = _getClient(item.serverId);
    final currentUser = GetIt.instance<UserRepository>().currentUser;
    final isAdminUser = currentUser?.isAdministrator ?? false;
    final isSameServerItem = currentUser?.serverId == item.serverId;
    final requiresCollectionPermission =
        client.serverType == ServerType.jellyfin && isSameServerItem;
    return !requiresCollectionPermission ||
        currentUser?.canManageCollections == true ||
        isAdminUser;
  }

  /// Returns whether [item] belongs to any playlists and/or collections.
  /// Resolves playlists and collections with independent timeouts so slower
  /// collection scanning never blocks playlist answers.
  Future<
      ({
        List<ItemPlaylistMembership> playlists,
        List<ItemCollectionMembership> collections,
      })> getMemberships(
    AggregatedItem item, {
    Duration timeout = const Duration(milliseconds: 1500),
  }) async {
    if (item.serverId == 'seerr' || item.id.startsWith('tt')) {
      return (
        playlists: const <ItemPlaylistMembership>[],
        collections: const <ItemCollectionMembership>[],
      );
    }

    final serverKey = _canonicalServerKey(item.serverId);
    final cachedPlaylists = getCachedPlaylistsContaining(item);
    final cachedCollections = getCachedCollectionsContaining(item);

    final isPlaylistsFresh = _playlistLastFetched.containsKey(serverKey) &&
        DateTime.now().difference(_playlistLastFetched[serverKey]!) < _cacheTtl;
    final isCollectionsFresh = _collectionLastFetched.containsKey(serverKey) &&
        DateTime.now().difference(_collectionLastFetched[serverKey]!) <
            _cacheTtl;

    if (isPlaylistsFresh && isCollectionsFresh) {
      return (
        playlists: cachedPlaylists,
        collections: cachedCollections,
      );
    }

    try {
      final playlistsFuture = isPlaylistsFresh
          ? Future.value(cachedPlaylists)
          : getPlaylistsContaining(item).timeout(
              const Duration(milliseconds: 1000),
              onTimeout: () => getCachedPlaylistsContaining(item),
            );
      final collectionsFuture = isCollectionsFresh
          ? Future.value(cachedCollections)
          : getCollectionsContaining(item).timeout(
              timeout,
              onTimeout: () => getCachedCollectionsContaining(item),
            );

      final results = await Future.wait([playlistsFuture, collectionsFuture]);
      return (
        playlists: results[0] as List<ItemPlaylistMembership>,
        collections: results[1] as List<ItemCollectionMembership>,
      );
    } catch (_) {
      return (
        playlists: getCachedPlaylistsContaining(item),
        collections: getCachedCollectionsContaining(item),
      );
    }
  }

  /// Immediately returns whatever playlist memberships are currently cached.
  List<ItemPlaylistMembership> getCachedPlaylistsContaining(
      AggregatedItem item) {
    if (item.serverId == 'seerr' || item.id.startsWith('tt')) {
      return const [];
    }
    final serverKey = _canonicalServerKey(item.serverId);
    final pItems = _playlistItems[serverKey] ?? const {};
    final pNames = _playlistNames[serverKey] ?? const {};
    final result = <ItemPlaylistMembership>[];

    for (final entry in pItems.entries) {
      final playlistId = entry.key;
      final members = entry.value;
      for (final member in members) {
        if (member.itemId == item.id) {
          result.add(ItemPlaylistMembership(
            playlistId: playlistId,
            playlistName: pNames[playlistId] ?? '',
            entryId: member.entryId,
          ));
          break;
        }
      }
    }
    return result;
  }

  /// Immediately returns whatever collection memberships are currently cached.
  List<ItemCollectionMembership> getCachedCollectionsContaining(
      AggregatedItem item) {
    if (item.serverId == 'seerr' || item.id.startsWith('tt')) {
      return const [];
    }
    final serverKey = _canonicalServerKey(item.serverId);
    final cMembers = _collectionMembers[serverKey] ?? const {};
    final cNames = _collectionNames[serverKey] ?? const {};
    final result = <ItemCollectionMembership>[];

    for (final entry in cMembers.entries) {
      final collectionId = entry.key;
      final memberIds = entry.value;
      if (memberIds.contains(item.id)) {
        result.add(ItemCollectionMembership(
          collectionId: collectionId,
          collectionName: cNames[collectionId] ?? '',
        ));
      }
    }
    return result;
  }

  /// Returns all playlists containing [item] that the item can be removed from.
  Future<List<ItemPlaylistMembership>> getPlaylistsContaining(
    AggregatedItem item, {
    bool forceRefresh = false,
  }) async {
    if (item.serverId == 'seerr' || item.id.startsWith('tt')) {
      return const [];
    }
    final serverKey = _canonicalServerKey(item.serverId);
    if (!itemServerSupports(item.serverId, (f) => f.supportsPlaylists)) {
      return const [];
    }

    final isCached = _playlistLastFetched.containsKey(serverKey) &&
        DateTime.now().difference(_playlistLastFetched[serverKey]!) < _cacheTtl;

    if (forceRefresh || !isCached) {
      await _syncPlaylists(serverKey);
    }

    return getCachedPlaylistsContaining(item);
  }

  Future<void> _syncPlaylists(String serverKey) async {
    if (_playlistInFlight.containsKey(serverKey)) {
      return _playlistInFlight[serverKey]!.future;
    }

    final completer = Completer<void>();
    _playlistInFlight[serverKey] = completer;

    try {
      final client = _getClient(serverKey);
      final data = await client.itemsApi.getPlaylists();
      final items = (data['Items'] as List?) ?? const [];
      final playlistEntries = <String, String>{};

      final nameMap = _playlistNames.putIfAbsent(serverKey, () => {});
      final itemMap = _playlistItems.putIfAbsent(serverKey, () => {});

      final futures = <Future<void>>[];
      for (final raw in items.whereType<Map>()) {
        final pl = raw.cast<String, dynamic>();
        final id = pl['Id']?.toString();
        final name = pl['Name']?.toString();
        if (id == null || id.isEmpty || name == null) continue;
        playlistEntries[id] = name;
        nameMap[id] = name;

        futures.add(() async {
          try {
            Map<String, dynamic> res;
            try {
              res = await client.itemsApi.getPlaylistItems(id);
            } catch (_) {
              res = await client.itemsApi.getItems(
                parentId: id,
                fields: 'BasicSyncInfo,PlaylistItemId',
              );
            }
            final memberList = (res['Items'] as List?) ?? const [];
            final members = <({String itemId, String entryId})>[];
            for (final m in memberList.whereType<Map>()) {
              final map = m.cast<String, dynamic>();
              final itemId = map['Id']?.toString();
              final entryId = map['PlaylistItemId']?.toString() ?? itemId;
              if (itemId != null && entryId != null) {
                members.add((itemId: itemId, entryId: entryId));
              }
            }
            itemMap[id] = members;
          } catch (_) {}
        }());
      }

      await Future.wait(futures);

      _playlistNames[serverKey] = playlistEntries;
      _playlistLastFetched[serverKey] = DateTime.now();
    } catch (_) {
    } finally {
      _playlistInFlight.remove(serverKey);
      if (!completer.isCompleted) completer.complete();
    }
  }

  /// Returns all collections containing [item] that the item can be removed from.
  Future<List<ItemCollectionMembership>> getCollectionsContaining(
    AggregatedItem item, {
    bool forceRefresh = false,
  }) async {
    if (item.serverId == 'seerr' || item.id.startsWith('tt')) {
      return const [];
    }
    if (!_canManageCollections(item)) {
      return const [];
    }

    final serverKey = _canonicalServerKey(item.serverId);
    final client = _getClient(serverKey);

    final isCached = _collectionLastFetched.containsKey(serverKey) &&
        DateTime.now().difference(_collectionLastFetched[serverKey]!) <
            _cacheTtl;

    // Check ancestors fast-path (Emby / older Jellyfin versions report BoxSets in Ancestors)
    final ancestorBoxSets = <String, String>{};
    try {
      final ancestors = await client.itemsApi.getAncestors(item.id);
      for (final ancestor in ancestors) {
        if (ancestor['Type'] == 'BoxSet') {
          final id = ancestor['Id']?.toString();
          final name = ancestor['Name']?.toString();
          if (id != null && id.isNotEmpty && name != null && name.isNotEmpty) {
            ancestorBoxSets[id] = name;
          }
        }
      }
    } catch (_) {}

    if (forceRefresh || !isCached) {
      await _syncCollections(serverKey);
    }

    final results = <ItemCollectionMembership>[
      ...getCachedCollectionsContaining(item)
    ];

    // Merge any ancestors found directly
    for (final entry in ancestorBoxSets.entries) {
      if (!results.any((c) => c.collectionId == entry.key)) {
        results.add(ItemCollectionMembership(
          collectionId: entry.key,
          collectionName: entry.value,
        ));
      }
    }

    return results;
  }

  Future<void> _syncCollections(String serverKey) async {
    if (_collectionInFlight.containsKey(serverKey)) {
      return _collectionInFlight[serverKey]!.future;
    }

    final completer = Completer<void>();
    _collectionInFlight[serverKey] = completer;

    try {
      final client = _getClient(serverKey);
      final api = client.itemsApi;
      final List<dynamic> items;
      if (api is EditableCollectionsApi) {
        items = await (api as EditableCollectionsApi).getEditableCollections();
      } else {
        final data = await api.getItems(
          includeItemTypes: const ['BoxSet'],
          recursive: true,
          sortBy: 'SortName',
          fields: 'BasicSyncInfo',
        );
        items = (data['Items'] as List?) ?? const [];
      }

      final collectionEntries = <String, String>{};
      final candidates = <({String id, String name})>[];

      final nameMap = _collectionNames.putIfAbsent(serverKey, () => {});
      final memberMap = _collectionMembers.putIfAbsent(serverKey, () => {});

      for (final raw in items.whereType<Map>()) {
        final boxSet = raw.cast<String, dynamic>();
        final id = boxSet['Id']?.toString();
        final name = boxSet['Name']?.toString();
        if (id == null || id.isEmpty || name == null) continue;
        collectionEntries[id] = name;
        nameMap[id] = name;
        candidates.add((id: id, name: name));
      }

      // Batch membership lookups with maxConcurrent = 24
      const maxConcurrent = 24;
      for (var i = 0; i < candidates.length; i += maxConcurrent) {
        final batch = candidates.skip(i).take(maxConcurrent);
        await Future.wait(batch.map((candidate) async {
          try {
            final res = await api.getItems(
              parentId: candidate.id,
              fields: 'BasicSyncInfo',
            );
            final membersList = (res['Items'] as List?) ?? const [];
            final memberIds = <String>{};
            for (final m in membersList.whereType<Map>()) {
              final map = m.cast<String, dynamic>();
              final id = map['Id']?.toString();
              if (id != null) memberIds.add(id);
            }
            memberMap[candidate.id] = memberIds;
          } catch (_) {}
        }));
      }

      _collectionNames[serverKey] = collectionEntries;
      _collectionLastFetched[serverKey] = DateTime.now();
    } catch (_) {
    } finally {
      _collectionInFlight.remove(serverKey);
      if (!completer.isCompleted) completer.complete();
    }
  }

  /// Updates cache when an item is added to a playlist.
  void notifyItemAddedToPlaylist(
    String serverId,
    String playlistId,
    List<String> itemIds,
  ) {
    final serverKey = _canonicalServerKey(serverId);
    final serverPlaylists = _playlistItems[serverKey];
    if (serverPlaylists != null && serverPlaylists.containsKey(playlistId)) {
      final list = serverPlaylists[playlistId] ?? [];
      for (final id in itemIds) {
        if (!list.any((m) => m.itemId == id)) {
          list.add((itemId: id, entryId: id));
        }
      }
    }
    _playlistLastFetched.remove(serverKey);
  }

  /// Updates cache when an item is removed from a playlist.
  void notifyItemRemovedFromPlaylist(
    String serverId,
    String playlistId,
    String itemId,
  ) {
    final serverKey = _canonicalServerKey(serverId);
    final serverPlaylists = _playlistItems[serverKey];
    if (serverPlaylists != null && serverPlaylists.containsKey(playlistId)) {
      serverPlaylists[playlistId]?.removeWhere((m) => m.itemId == itemId);
    }
    _playlistLastFetched.remove(serverKey);
  }

  /// Updates cache when an item is added to a collection.
  void notifyItemAddedToCollection(
    String serverId,
    String collectionId,
    List<String> itemIds,
  ) {
    final serverKey = _canonicalServerKey(serverId);
    final serverCollections = _collectionMembers[serverKey];
    if (serverCollections != null &&
        serverCollections.containsKey(collectionId)) {
      serverCollections[collectionId]?.addAll(itemIds);
    }
    _collectionLastFetched.remove(serverKey);
  }

  /// Updates cache when an item is removed from a collection.
  void notifyItemRemovedFromCollection(
    String serverId,
    String collectionId,
    String itemId,
  ) {
    final serverKey = _canonicalServerKey(serverId);
    final serverCollections = _collectionMembers[serverKey];
    if (serverCollections != null &&
        serverCollections.containsKey(collectionId)) {
      serverCollections[collectionId]?.remove(itemId);
    }
    _collectionLastFetched.remove(serverKey);
  }

  /// Clears in-memory caches (e.g. on account or server switch).
  void clearCache() {
    _playlistItems.clear();
    _playlistNames.clear();
    _playlistLastFetched.clear();
    _collectionMembers.clear();
    _collectionNames.clear();
    _collectionLastFetched.clear();
  }

  /// Pre-warms caches in the background.
  void warmCache({String? serverId}) {
    final key = _canonicalServerKey(serverId);
    unawaited(_syncPlaylists(key));
    unawaited(_syncCollections(key));
  }
}
