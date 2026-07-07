import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/audiobook_resume_service.dart';
import '../data/services/media_server_client_factory.dart';
import 'car_artwork.dart';
import 'headless_session_bootstrap.dart';
import 'last_playback_session_store.dart';

/// Resolved playback intent for a browse/voice/resume media id.
class PlayRequest {
  final List<AggregatedItem> items;
  final int startIndex;
  final Duration startPosition;

  const PlayRequest({
    required this.items,
    this.startIndex = 0,
    this.startPosition = Duration.zero,
  });
}

class _CachedChildren {
  final List<MediaItem> items;
  final DateTime fetchedAt;
  _CachedChildren(this.items) : fetchedAt = DateTime.now();
}

/// Platform-agnostic media browse tree for Android Auto and CarPlay.
///
/// Owns the pipe-delimited mediaId scheme:
/// ```
///   tab|home, tab|music, tab|books, tab|playlists
///   sec|albums|<serverId>, sec|artists|<s>, sec|musicplaylists|<s>,
///   sec|booklib|<s>|<viewId>
///   album|<s>|<id>, artist|<s>|<id>, playlist|<s>|<id>
///   track|<s>|<id>|<ctxKind>|<ctxId>   (ctx enables sibling queueing)
///   book|<s>|<id>, shuffle|<s>|all, msg|<code>
/// ```
class MediaBrowseService {
  static const _pageSize = 100;
  static const _cacheTtl = Duration(minutes: 2);
  static const _kPage = 'android.media.browse.extra.PAGE';
  static const _kPageSize = 'android.media.browse.extra.PAGE_SIZE';

  final MediaServerClientFactory _clientFactory;
  final HeadlessSessionBootstrap _bootstrap;
  final AudiobookResumeService _resumeService;
  final LastPlaybackSessionStore _lastSessionStore;

  final Map<String, _CachedChildren> _cache = {};

  MediaBrowseService(
    this._clientFactory,
    this._bootstrap,
    this._resumeService,
    this._lastSessionStore,
  );

  void clearCache() => _cache.clear();

  Future<MediaServerClient?> _client() async {
    if (_clientFactory.clients.isNotEmpty) {
      return _clientFactory.getActiveClient();
    }
    return _bootstrap.ensureSession();
  }

  String _serverIdOf(MediaServerClient client) {
    for (final entry in _clientFactory.clients.entries) {
      if (identical(entry.value, client)) return entry.key;
    }
    return client.baseUrl;
  }

  Future<List<MediaItem>> getChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async {
    await CarArtwork.instance.ensureReady();
    if (parentMediaId == AudioService.recentRootId) {
      final recent = await _lastSessionStore.asRecentMediaItems();
      await CarArtwork.instance.persistHosts();
      return recent;
    }

    final cached = _cache[_cacheKey(parentMediaId, options)];
    if (cached != null &&
        DateTime.now().difference(cached.fetchedAt) < _cacheTtl) {
      return cached.items;
    }

    final client = await _client();
    if (client == null) return [_signInItem];

    List<MediaItem> items;
    try {
      items = await _loadChildren(client, parentMediaId, options);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401 || status == 403) return [_signInItem];
      return [_offlineItem];
    } catch (_) {
      return [_offlineItem];
    }

    _cache[_cacheKey(parentMediaId, options)] = _CachedChildren(items);
    await CarArtwork.instance.persistHosts();
    return items;
  }

  String _cacheKey(String parent, Map<String, dynamic>? options) {
    final page = options?[_kPage];
    return page == null ? parent : '$parent#$page';
  }

  Future<List<MediaItem>> _loadChildren(
    MediaServerClient client,
    String parentMediaId,
    Map<String, dynamic>? options,
  ) async {
    final serverId = _serverIdOf(client);
    final parts = parentMediaId.split('|');
    final page = (options?[_kPage] as num?)?.toInt() ?? 0;
    final pageSize = (options?[_kPageSize] as num?)?.toInt() ?? _pageSize;
    final startIndex = page * pageSize;

    switch (parts.first) {
      case AudioService.browsableRootId:
        return _rootTabs(client);
      case 'tab':
        switch (parts.elementAtOrNull(1)) {
          case 'home':
            return _homeChildren(client, serverId);
          case 'music':
            return _musicChildren(serverId);
          case 'books':
            return _booksChildren(client, serverId, startIndex, pageSize);
          case 'playlists':
            return _playlistNodes(client, serverId);
        }
      case 'sec':
        final section = parts.elementAtOrNull(1);
        switch (section) {
          case 'albums':
            final response = await client.itemsApi.getItems(
              includeItemTypes: const ['MusicAlbum'],
              recursive: true,
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              startIndex: startIndex,
              limit: pageSize,
            );
            return _toItems(response, serverId).map(_albumNode).toList();
          case 'artists':
            final response = await client.itemsApi.getAlbumArtists(
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              startIndex: startIndex,
              limit: pageSize,
            );
            return _toItems(response, serverId).map(_artistNode).toList();
          case 'musicplaylists':
            return _playlistNodes(client, serverId);
          case 'booklib':
            final viewId = parts.elementAtOrNull(3);
            final response = await client.itemsApi.getItems(
              parentId: viewId,
              includeItemTypes: const ['AudioBook', 'Audio'],
              recursive: true,
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              startIndex: startIndex,
              limit: pageSize,
            );
            return _toItems(response, serverId)
                .map((i) => _bookLeaf(i, serverId))
                .toList();
        }
      case 'album':
        final albumId = parts.elementAtOrNull(2);
        if (albumId == null) return const [];
        final response = await client.itemsApi.getItems(
          parentId: albumId,
          includeItemTypes: const ['Audio'],
          sortBy: 'ParentIndexNumber,IndexNumber,SortName',
          sortOrder: 'Ascending',
        );
        return _toItems(response, serverId)
            .map((i) => _trackLeaf(i, serverId, 'album', albumId))
            .toList();
      case 'artist':
        final artistId = parts.elementAtOrNull(2);
        if (artistId == null) return const [];
        final response = await client.itemsApi.getItems(
          artistIds: [artistId],
          includeItemTypes: const ['MusicAlbum'],
          recursive: true,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          limit: pageSize,
        );
        return _toItems(response, serverId).map(_albumNode).toList();
      case 'playlist':
        final playlistId = parts.elementAtOrNull(2);
        if (playlistId == null) return const [];
        final response = await client.itemsApi.getPlaylistItems(playlistId);
        return _toItems(response, serverId)
            .where((i) => i.isAudioLike)
            .map((i) => _trackLeaf(i, serverId, 'playlist', playlistId))
            .toList();
    }
    return const [];
  }

  Future<List<MediaItem>> _rootTabs(MediaServerClient client) async {
    var hasBookLibrary = false;
    try {
      hasBookLibrary = (await _bookViews(client)).isNotEmpty;
    } catch (_) {}
    return [
      _browsableNode('tab|home', 'Home', extras: _listHints),
      _browsableNode('tab|music', 'Music', extras: _listHints),
      if (hasBookLibrary)
        _browsableNode('tab|books', 'Audiobooks', extras: _gridHints),
      _browsableNode('tab|playlists', 'Playlists', extras: _listHints),
    ];
  }

  Future<List<MediaItem>> _homeChildren(
    MediaServerClient client,
    String serverId,
  ) async {
    final resumeResponse = await client.itemsApi.getResumeItems(
      includeItemTypes: const ['AudioBook', 'Audio'],
      limit: 40,
    );
    final resume = _toItems(resumeResponse, serverId);

    List<AggregatedItem> latestAlbums = const [];
    try {
      final latestResponse = await client.itemsApi.getLatestItems(
        includeItemTypes: const ['MusicAlbum'],
        limit: 20,
      );
      latestAlbums = _toItems(latestResponse, serverId);
    } catch (_) {}

    return [
      for (final item in resume)
        item.isAudiobook
            ? _bookLeaf(item, serverId)
            : _trackLeaf(item, serverId, '-', '-'),
      for (final album in latestAlbums) _albumNode(album),
    ];
  }

  List<MediaItem> _musicChildren(String serverId) => [
        _browsableNode('sec|albums|$serverId', 'Albums',
            extras: _gridHints),
        _browsableNode('sec|artists|$serverId', 'Artists',
            extras: _listHints),
        _browsableNode('sec|musicplaylists|$serverId', 'Playlists',
            extras: _listHints),
        MediaItem(
          id: 'shuffle|$serverId|all',
          title: 'Shuffle all music',
          playable: true,
        ),
      ];

  Future<List<Map<String, dynamic>>> _bookViews(
    MediaServerClient client,
  ) async {
    final response = await client.userViewsApi.getUserViews();
    final views = (response['Items'] as List? ?? const [])
        .whereType<Map<String, dynamic>>();
    return views.where((v) {
      final collectionType =
          (v['CollectionType'] as String? ?? '').toLowerCase();
      return collectionType == 'audiobooks' || collectionType == 'books';
    }).toList();
  }

  Future<List<MediaItem>> _booksChildren(
    MediaServerClient client,
    String serverId,
    int startIndex,
    int pageSize,
  ) async {
    final views = await _bookViews(client);
    if (views.isEmpty) return const [];
    if (views.length == 1) {
      final response = await client.itemsApi.getItems(
        parentId: views.first['Id']?.toString(),
        includeItemTypes: const ['AudioBook', 'Audio'],
        recursive: true,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        startIndex: startIndex,
        limit: pageSize,
      );
      return _toItems(response, serverId)
          .map((i) => _bookLeaf(i, serverId))
          .toList();
    }
    return [
      for (final view in views)
        _browsableNode(
          'sec|booklib|$serverId|${view['Id']}',
          view['Name'] as String? ?? 'Audiobooks',
          extras: _gridHints,
        ),
    ];
  }

  Future<List<MediaItem>> _playlistNodes(
    MediaServerClient client,
    String serverId,
  ) async {
    final response = await client.itemsApi.getPlaylists();
    final playlists = _toItems(response, serverId).where((item) {
      if (item.type != 'Playlist') return false;
      final mediaType = item.rawData['MediaType'] as String?;
      return mediaType == null || mediaType.isEmpty || mediaType == 'Audio';
    });
    return [
      for (final playlist in playlists)
        _browsableNode(
          'playlist|$serverId|${playlist.id}',
          playlist.name,
          artUri: _artUriFor(playlist),
          extras: _listHints,
        ),
    ];
  }

  Future<PlayRequest?> resolvePlayRequest(String mediaId) async {
    final client = await _client();
    if (client == null) return null;
    final serverId = _serverIdOf(client);
    final parts = mediaId.split('|');

    switch (parts.first) {
      case 'track':
        final itemId = parts.elementAtOrNull(2);
        final ctxKind = parts.elementAtOrNull(3);
        final ctxId = parts.elementAtOrNull(4);
        if (itemId == null) return null;
        if (ctxKind == 'album' && ctxId != null && ctxId != '-') {
          return _siblingsRequest(
            client,
            serverId,
            itemId,
            () => client.itemsApi.getItems(
              parentId: ctxId,
              includeItemTypes: const ['Audio'],
              sortBy: 'ParentIndexNumber,IndexNumber,SortName',
              sortOrder: 'Ascending',
            ),
          );
        }
        if (ctxKind == 'playlist' && ctxId != null && ctxId != '-') {
          return _siblingsRequest(
            client,
            serverId,
            itemId,
            () => client.itemsApi.getPlaylistItems(ctxId),
          );
        }
        final item = await _getItem(client, serverId, itemId);
        if (item == null) return null;
        return PlayRequest(
          items: [item],
          startPosition: item.playbackPosition ?? Duration.zero,
        );
      case 'book':
        final itemId = parts.elementAtOrNull(2);
        if (itemId == null) return null;
        final item = await _getItem(client, serverId, itemId);
        if (item == null) return null;
        final localMs = await _resumeService.load(serverId, itemId);
        final startPosition = localMs != null && localMs > 0
            ? Duration(milliseconds: localMs)
            : (item.playbackPosition ?? Duration.zero);
        return PlayRequest(items: [item], startPosition: startPosition);
      case 'album':
      case 'playlist':
        final containerId = parts.elementAtOrNull(2);
        if (containerId == null) return null;
        final response = parts.first == 'album'
            ? await client.itemsApi.getItems(
                parentId: containerId,
                includeItemTypes: const ['Audio'],
                sortBy: 'ParentIndexNumber,IndexNumber,SortName',
                sortOrder: 'Ascending',
              )
            : await client.itemsApi.getPlaylistItems(containerId);
        final items =
            _toItems(response, serverId).where((i) => i.isAudioLike).toList();
        if (items.isEmpty) return null;
        return PlayRequest(items: items);
      case 'artist':
        final artistId = parts.elementAtOrNull(2);
        if (artistId == null) return null;
        final response = await client.itemsApi.getItems(
          artistIds: [artistId],
          includeItemTypes: const ['Audio'],
          recursive: true,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          limit: 200,
        );
        final items = _toItems(response, serverId);
        if (items.isEmpty) return null;
        return PlayRequest(items: items);
      case 'shuffle':
        final response = await client.itemsApi.getItems(
          includeItemTypes: const ['Audio'],
          recursive: true,
          sortBy: 'Random',
          limit: 300,
        );
        final items = _toItems(response, serverId);
        if (items.isEmpty) return null;
        return PlayRequest(items: items);
    }
    return null;
  }

  Future<PlayRequest?> _siblingsRequest(
    MediaServerClient client,
    String serverId,
    String itemId,
    Future<Map<String, dynamic>> Function() fetch,
  ) async {
    final response = await fetch();
    final items =
        _toItems(response, serverId).where((i) => i.isAudioLike).toList();
    if (items.isEmpty) return null;
    final index = items.indexWhere((i) => i.id == itemId);
    return PlayRequest(items: items, startIndex: index < 0 ? 0 : index);
  }

  Future<AggregatedItem?> _getItem(
    MediaServerClient client,
    String serverId,
    String itemId,
  ) async {
    try {
      final rawData = await client.itemsApi.getItem(itemId);
      return AggregatedItem(id: itemId, serverId: serverId, rawData: rawData);
    } catch (_) {
      return null;
    }
  }

  Future<List<MediaItem>> search(String query) async {
    await CarArtwork.instance.ensureReady();
    final client = await _client();
    if (client == null || query.trim().isEmpty) return const [];
    final serverId = _serverIdOf(client);
    try {
      final matches = await _searchItems(client, serverId, query);
      final results = [
        for (final item in matches)
          switch (item.type) {
            'MusicAlbum' => _albumNode(item),
            'MusicArtist' || 'AlbumArtist' => _artistNode(item),
            'Playlist' => _browsableNode(
                'playlist|$serverId|${item.id}',
                item.name,
                artUri: _artUriFor(item),
              ),
            _ => item.isAudiobook
                ? _bookLeaf(item, serverId)
                : _trackLeaf(item, serverId, '-', '-'),
          },
      ];
      await CarArtwork.instance.persistHosts();
      return results;
    } catch (_) {
      return const [];
    }
  }

  Future<PlayRequest?> resolveSearchPlay(String query) async {
    final client = await _client();
    if (client == null) return null;
    final serverId = _serverIdOf(client);

    if (query.trim().isEmpty) {
      // "Play music on Moonfin": last session, else continue listening, else
      // shuffle everything.
      final last = await _lastSessionStore.load();
      if (last != null) {
        final restored = await resolveLastSession(last);
        if (restored != null) return restored;
      }
      try {
        final resumeResponse = await client.itemsApi.getResumeItems(
          includeItemTypes: const ['Audio'],
          limit: 1,
        );
        final resume = _toItems(resumeResponse, serverId);
        if (resume.isNotEmpty) {
          return PlayRequest(
            items: resume,
            startPosition: resume.first.playbackPosition ?? Duration.zero,
          );
        }
      } catch (_) {}
      return resolvePlayRequest('shuffle|$serverId|all');
    }

    try {
      final matches = await _searchItems(client, serverId, query);
      if (matches.isEmpty) return null;
      AggregatedItem? pick(String type) =>
          matches.where((i) => i.type == type).firstOrNull;

      final album = pick('MusicAlbum');
      if (album != null) return resolvePlayRequest('album|$serverId|${album.id}');
      final artist = pick('MusicArtist') ?? pick('AlbumArtist');
      if (artist != null) {
        return resolvePlayRequest('artist|$serverId|${artist.id}');
      }
      final playlist = pick('Playlist');
      if (playlist != null) {
        return resolvePlayRequest('playlist|$serverId|${playlist.id}');
      }
      final book = matches.where((i) => i.isAudiobook).firstOrNull;
      final track =
          matches.where((i) => i.type == 'Audio' && !i.isAudiobook).firstOrNull;
      if (track != null && book == null) {
        return PlayRequest(items: [track]);
      }
      if (book != null) return resolvePlayRequest('book|$serverId|${book.id}');
    } catch (_) {}
    return null;
  }

  Future<List<AggregatedItem>> _searchItems(
    MediaServerClient client,
    String serverId,
    String query,
  ) async {
    final response = await client.itemsApi.getItems(
      searchTerm: query,
      includeItemTypes: const [
        'MusicAlbum',
        'Audio',
        'MusicArtist',
        'Playlist',
        'AudioBook',
      ],
      recursive: true,
      limit: 25,
    );
    return _toItems(response, serverId);
  }

  Future<PlayRequest?> resolveLastSession(LastPlaybackSession session) async {
    final client = await _client();
    if (client == null) return null;
    final clientForServer =
        _clientFactory.getClientIfExists(session.serverId) ?? client;

    // Bound the restore: fetch a window around the saved index rather than the
    // entire persisted queue.
    const window = 25;
    final start =
        (session.index - window ~/ 2).clamp(0, session.itemIds.length - 1);
    final ids = session.itemIds
        .sublist(start, (start + window).clamp(0, session.itemIds.length));

    final loaded = await Future.wait(
      ids.map((id) => _getItem(clientForServer, session.serverId, id)),
    );
    final items = loaded.whereType<AggregatedItem>().toList();
    if (items.isEmpty) return null;

    final currentId = session.currentItemId;
    final index = items.indexWhere((i) => i.id == currentId);
    return PlayRequest(
      items: items,
      startIndex: index < 0 ? 0 : index,
      startPosition: Duration(milliseconds: session.positionMs),
    );
  }

  List<AggregatedItem> _toItems(Map<String, dynamic> response, String serverId) {
    final rawItems = response['Items'] as List? ?? const [];
    return [
      for (final raw in rawItems.whereType<Map<String, dynamic>>())
        if (raw['Id'] != null)
          AggregatedItem(
            id: raw['Id'].toString(),
            serverId: serverId,
            rawData: raw,
          ),
    ];
  }

  MediaItem _browsableNode(
    String id,
    String title, {
    String? artUri,
    Map<String, dynamic>? extras,
  }) =>
      MediaItem(
        id: id,
        title: title,
        playable: false,
        artUri: CarArtwork.instance.wrap(artUri),
        extras: extras,
      );

  MediaItem _albumNode(AggregatedItem album) => MediaItem(
        id: 'album|${album.serverId}|${album.id}',
        title: album.name,
        artist: album.albumArtist ??
            (album.artists.isNotEmpty ? album.artists.join(', ') : null),
        playable: false,
        artUri: _artUri(album),
        extras: _listHints,
      );

  MediaItem _artistNode(AggregatedItem artist) => MediaItem(
        id: 'artist|${artist.serverId}|${artist.id}',
        title: artist.name,
        playable: false,
        artUri: _artUri(artist),
        extras: _gridHints,
      );

  MediaItem _trackLeaf(
    AggregatedItem item,
    String serverId,
    String ctxKind,
    String ctxId,
  ) =>
      MediaItem(
        id: 'track|$serverId|${item.id}|$ctxKind|$ctxId',
        title: item.name,
        artist: item.artists.isNotEmpty
            ? item.artists.join(', ')
            : item.albumArtist,
        album: item.album,
        duration: item.runtime,
        playable: true,
        artUri: _artUri(item),
        extras: {'serverId': serverId},
      );

  MediaItem _bookLeaf(AggregatedItem item, String serverId) => MediaItem(
        id: 'book|$serverId|${item.id}',
        title: item.name,
        artist: item.artists.isNotEmpty
            ? item.artists.join(', ')
            : item.albumArtist,
        duration: item.runtime,
        playable: true,
        artUri: _artUri(item),
        extras: {'serverId': serverId},
      );

  Uri? _artUri(AggregatedItem item) => CarArtwork.instance.wrap(_artUriFor(item));

  String? _artUriFor(AggregatedItem item) {
    final client = _clientFactory.getClientIfExists(item.serverId);
    if (client == null) return null;
    try {
      // Tracks rarely carry their own image, so fall back to the parent album's
      // cover. The tag is only a cache key, and the list response often omits
      // AlbumPrimaryImageTag, so a missing tag must not blank the art: Jellyfin
      // and Emby both serve the current image by id without one.
      final albumId = item.albumId;
      if (item.type == 'Audio' && albumId != null) {
        return client.imageApi.getPrimaryImageUrl(
          albumId,
          maxHeight: 300,
          tag: item.albumPrimaryImageTag,
        );
      }
      if (item.primaryImageTag != null) {
        return client.imageApi.getPrimaryImageUrl(
          item.id,
          maxHeight: 300,
          tag: item.primaryImageTag,
        );
      }
    } catch (_) {}
    return null;
  }

  static const _signInItem = MediaItem(
    id: 'msg|signin',
    title: 'Sign in to Moonfin on your phone',
    playable: false,
  );

  static const _offlineItem = MediaItem(
    id: 'msg|offline',
    title: "Can't reach your server",
    playable: false,
  );

  static const Map<String, dynamic> _listHints = {
    AndroidContentStyle.supportedKey: true,
    AndroidContentStyle.playableHintKey: AndroidContentStyle.listItemHintValue,
    AndroidContentStyle.browsableHintKey: AndroidContentStyle.listItemHintValue,
  };

  static const Map<String, dynamic> _gridHints = {
    AndroidContentStyle.supportedKey: true,
    AndroidContentStyle.playableHintKey: AndroidContentStyle.gridItemHintValue,
    AndroidContentStyle.browsableHintKey: AndroidContentStyle.gridItemHintValue,
  };
}
