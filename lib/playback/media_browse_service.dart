import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/audiobook_resume_service.dart';
import '../data/services/media_server_client_factory.dart';
import '../l10n/app_localizations.dart';
import '../l10n/current_app_localizations.dart';
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

class _CachedProbe {
  final bool hasAudio;
  final DateTime fetchedAt;
  _CachedProbe(this.hasAudio) : fetchedAt = DateTime.now();
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
  // Ceiling for a single browse response. MediaBrowserServiceCompat sends
  // results in one binder parcel and silently drops oversized ones (the host
  // then spins forever), so every listing stays bounded.
  static const _listCap = 500;
  // Ceiling for the single whole-library fetch that fills the letter folders.
  // It rides HTTP, not the binder parcel, so _listCap does not apply to it.
  static const _bookFetchCap = 3000;
  // Bounds session restore and each browse load; the Emby client's own
  // receiveTimeout is three minutes, far past what a car screen tolerates.
  static const _browseTimeout = Duration(seconds: 20);
  // Lean projection for car browse lists: ids/names/types ride the base
  // response; these cover the track/book leaves and album-art lookups. Image
  // tags are capped to one Primary per item (servers return every tag by
  // default), which is most of the payload saving.
  static const _browseFields =
      'PrimaryImageAspectRatio,SortName,Type,RunTimeTicks,Artists,AlbumArtist,'
      'Album,AlbumId,AlbumPrimaryImageTag,ImageTags';
  static const _browseImageTypes = 'Primary';
  static const _cacheTtl = Duration(minutes: 2);
  static const _kPage = 'android.media.browse.extra.PAGE';
  static const _kPageSize = 'android.media.browse.extra.PAGE_SIZE';
  // Description extras Android Auto reads for grouped shelves and per-item
  // style overrides, mirroring androidx.media.utils.MediaConstants.
  static const _kGroupTitle =
      'android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT';
  static const _kSingleItemStyle =
      'android.media.browse.CONTENT_STYLE_SINGLE_ITEM_HINT';

  final MediaServerClientFactory _clientFactory;
  final HeadlessSessionBootstrap _bootstrap;
  final AudiobookResumeService _resumeService;
  final LastPlaybackSessionStore _lastSessionStore;

  final Map<String, _CachedChildren> _cache = {};
  // Concurrent requests for the same node share one fetch: paging hosts fire
  // several page subscriptions at once and CarPlay reloads all tabs on connect.
  final Map<String, Future<List<MediaItem>>> _inflight = {};
  // Dedupes the whole-library fetch per book section (not per letter like
  // _inflight), so opening several letters at once shares one fetch.
  final Map<String, Future<void>> _bucketFills = {};

  MediaBrowseService(
    this._clientFactory,
    this._bootstrap,
    this._resumeService,
    this._lastSessionStore,
  );

  void clearCache() {
    _cache.clear();
    _inflight.clear();
    _bucketFills.clear();
    _audioProbes.clear();
  }

  // Resolves against the system locale (the car has no widget context); falls
  // back to English for unsupported locales.
  AppLocalizations get _l10n => currentAppLocalizations();

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
    // Resolving the artwork provider authority is a platform-channel call that
    // can wedge in a headless car engine. It is optional (wrap() falls back to
    // raw urls without it), so never let it block the browse tree.
    try {
      await CarArtwork.instance.ensureReady().timeout(const Duration(seconds: 3));
    } catch (_) {}

    if (parentMediaId == AudioService.recentRootId) {
      // A throw here leaves the resumption card query unanswered; empty is the
      // right degraded answer.
      try {
        final recent = await _lastSessionStore.asRecentMediaItems();
        await CarArtwork.instance.persistHosts();
        return recent;
      } catch (_) {
        return const [];
      }
    }

    final cached = _cache[parentMediaId];
    if (cached != null &&
        DateTime.now().difference(cached.fetchedAt) < _cacheTtl) {
      return _pageOf(cached.items, options);
    }

    final List<MediaItem> items;
    try {
      final client = await _client().timeout(_browseTimeout);
      if (client == null) return [_signInItem];
      items = await (_inflight[parentMediaId] ??=
              _loadChildrenOnce(client, parentMediaId))
          .timeout(_browseTimeout);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401 || status == 403) return [_signInItem];
      return [_offlineItem];
    } catch (_) {
      return [_offlineItem];
    }

    _cache[parentMediaId] = _CachedChildren(items);
    await CarArtwork.instance.persistHosts();
    return _pageOf(items, options);
  }

  Future<List<MediaItem>> _loadChildrenOnce(
    MediaServerClient client,
    String parentMediaId,
  ) async {
    try {
      return await _loadChildren(client, parentMediaId);
    } finally {
      _inflight.remove(parentMediaId);
    }
  }

  // audio_service overrides the 3-arg onLoadChildren without
  // RESULT_FLAG_OPTION_NOT_HANDLED, so the framework never slices pages for
  // us. Paging hosts must receive exactly the requested window; hosts that do
  // not page (CarPlay, most Android Auto launchers) get the complete list.
  List<MediaItem> _pageOf(List<MediaItem> items, Map<String, dynamic>? options) {
    // Never throw: a malformed option would otherwise leave the host without a
    // response. Serving the full list is the safe fallback.
    try {
      final page = (options?[_kPage] as num?)?.toInt();
      if (page == null) return items;
      final pageSize = (options?[_kPageSize] as num?)?.toInt() ?? _pageSize;
      final start = page * pageSize;
      if (start >= items.length) return const [];
      return items.sublist(start, (start + pageSize).clamp(0, items.length));
    } catch (_) {
      return items;
    }
  }

  /// One letter-scoped listing call ('#' means everything sorting before
  /// 'A'). Every library section browses through these, keeping each response
  /// a single fast request that always fits the binder parcel.
  Future<List<AggregatedItem>> _letterItems(
    String serverId,
    Future<Map<String, dynamic>> Function({
      String? nameStartsWith,
      String? nameLessThan,
      int? limit,
    }) fetch,
    String letter,
  ) async {
    final response = letter == '#'
        ? await fetch(nameLessThan: 'A', limit: _listCap)
        : await fetch(nameStartsWith: letter, limit: _listCap);
    return _toItems(response, serverId);
  }

  /// The letter segment of a browse node id ('...|az|B'), if present.
  String? _letterOf(List<String> parts) {
    final marker = parts.indexOf('az');
    return marker >= 0 ? parts.elementAtOrNull(marker + 1) : null;
  }

  // The '#' and A-Z folders. [childHints] styles each folder's contents (cover
  // grid for albums and books, rows for artists). Books bucket these client-side
  // in _fillBookBuckets, where '#' catches everything that is not A-Z. Albums
  // and artists still filter server-side, where '#' only covers names before 'A'.
  List<MediaItem> _letterNodes(
    String parentMediaId,
    Map<String, dynamic> childHints,
  ) =>
      [
        _browsableNode('$parentMediaId|az|#', '#', extras: childHints),
        for (var c = 'A'.codeUnitAt(0); c <= 'Z'.codeUnitAt(0); c++)
          _browsableNode(
            '$parentMediaId|az|${String.fromCharCode(c)}',
            String.fromCharCode(c),
            extras: childHints,
          ),
      ];

  /// Fetches a whole book library once and files every item into its A-Z or '#'
  /// folder, caching all 27 under [sectionId]. Bucketing on the returned
  /// SortName is server-agnostic and lets '#' catch digits, symbols and
  /// non-Latin names that would otherwise fall outside every folder.
  Future<void> _fillBookBuckets(
    MediaServerClient client,
    String serverId,
    String sectionId,
    String? viewId,
  ) async {
    try {
      final response = await client.itemsApi.getItems(
        parentId: viewId,
        includeItemTypes: const ['AudioBook', 'Audio'],
        recursive: true,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        limit: _bookFetchCap,
        fields: _browseFields,
        enableImageTypes: _browseImageTypes,
        imageTypeLimit: 1,
        // No paging here, so skip the extra COUNT pass a total would cost.
        enableTotalRecordCount: false,
      );
      final items = _toItems(response, serverId);
      final buckets = <String, List<MediaItem>>{
        '#': <MediaItem>[],
        for (var c = 'A'.codeUnitAt(0); c <= 'Z'.codeUnitAt(0); c++)
          String.fromCharCode(c): <MediaItem>[],
      };
      for (final item in items) {
        buckets[_letterBucket(item.sortName, item.name)]!
            .add(_bookLeaf(item, serverId));
      }
      buckets.forEach((letter, list) {
        // Cap per folder to the binder parcel size; the HTTP fetch was not
        // bounded. Empty letters cache an empty list so they never refetch.
        final capped = list.length > _listCap ? list.sublist(0, _listCap) : list;
        _cache['$sectionId|az|$letter'] = _CachedChildren(capped);
      });
    } finally {
      // Drop the guard so a fresh fetch can run once the cache TTL expires.
      _bucketFills.remove(sectionId);
    }
  }

  /// Files a title under an A-Z car folder, or '#' for everything else (digits,
  /// symbols, non-Latin / past-'Z' scripts). Common accented Latin folds to its
  /// base letter so 'Ábba' lands under A and 'Über' under U. Falls back to the
  /// display name when SortName is absent.
  static String _letterBucket(String? sortName, String name) {
    final source =
        (sortName != null && sortName.trim().isNotEmpty) ? sortName : name;
    final trimmed = source.trimLeft();
    if (trimmed.isEmpty) return '#';
    final folded = _foldToAsciiUpper(trimmed.codeUnitAt(0));
    return (folded >= 0x41 && folded <= 0x5A)
        ? String.fromCharCode(folded)
        : '#';
  }

  // Keyed on the uppercase form, so lowercase accented input matches once the
  // character is uppercased below.
  static const Map<String, String> _accentFolds = {
    'À': 'A', 'Á': 'A', 'Â': 'A', 'Ã': 'A', 'Ä': 'A', 'Å': 'A', 'Ā': 'A',
    'Ă': 'A', 'Ą': 'A', 'Æ': 'A',
    'Ç': 'C', 'Ć': 'C', 'Č': 'C',
    'Ð': 'D', 'Ď': 'D', 'Đ': 'D',
    'È': 'E', 'É': 'E', 'Ê': 'E', 'Ë': 'E', 'Ē': 'E', 'Ė': 'E', 'Ę': 'E',
    'Ě': 'E',
    'Ì': 'I', 'Í': 'I', 'Î': 'I', 'Ï': 'I', 'Ī': 'I', 'Į': 'I',
    'Ł': 'L',
    'Ñ': 'N', 'Ń': 'N', 'Ň': 'N',
    'Ò': 'O', 'Ó': 'O', 'Ô': 'O', 'Õ': 'O', 'Ö': 'O', 'Ø': 'O', 'Ō': 'O',
    'Ő': 'O',
    'Ś': 'S', 'Š': 'S', 'Ş': 'S',
    'Þ': 'T',
    'Ù': 'U', 'Ú': 'U', 'Û': 'U', 'Ü': 'U', 'Ū': 'U', 'Ů': 'U', 'Ű': 'U',
    'Ý': 'Y', 'Ÿ': 'Y',
    'Ź': 'Z', 'Ž': 'Z', 'Ż': 'Z',
  };

  // Maps a single UTF-16 code unit to its base A-Z code unit, or -1 for
  // anything that is not Latin (Cyrillic, CJK, digits, symbols, surrogate
  // halves) so it falls through to '#'.
  static int _foldToAsciiUpper(int unit) {
    if (unit >= 0x41 && unit <= 0x5A) return unit; // A-Z
    if (unit >= 0x61 && unit <= 0x7A) return unit - 0x20; // a-z
    final ch = String.fromCharCode(unit).toUpperCase();
    final base = _accentFolds[ch];
    if (base != null) return base.codeUnitAt(0);
    if (ch.length == 1) {
      final u = ch.codeUnitAt(0);
      if (u >= 0x41 && u <= 0x5A) return u; // toUpperCase gave a plain letter
    }
    return -1;
  }

  Future<List<MediaItem>> _loadChildren(
    MediaServerClient client,
    String parentMediaId,
  ) async {
    final serverId = _serverIdOf(client);
    final parts = parentMediaId.split('|');

    switch (parts.first) {
      case AudioService.browsableRootId:
        return _rootTabs(client);
      case 'tab':
        switch (parts.elementAtOrNull(1)) {
          case 'home':
            return _homeChildren(client, serverId);
          case 'music':
            return _musicChildren(client, serverId);
          case 'books':
            return _booksChildren(client, serverId);
          case 'playlists':
            return _playlistNodes(client, serverId);
        }
      case 'sec':
        final section = parts.elementAtOrNull(1);
        final letter = _letterOf(parts);
        switch (section) {
          case 'albums':
            if (letter == null) {
              return _letterNodes(parentMediaId, _gridHints);
            }
            final albums = await _letterItems(
              serverId,
              ({nameStartsWith, nameLessThan, limit}) =>
                  client.itemsApi.getItems(
                includeItemTypes: const ['MusicAlbum'],
                recursive: true,
                sortBy: 'SortName',
                sortOrder: 'Ascending',
                nameStartsWith: nameStartsWith,
                nameLessThan: nameLessThan,
                limit: limit,
                fields: _browseFields,
                enableImageTypes: _browseImageTypes,
                imageTypeLimit: 1,
              ),
              letter,
            );
            return albums.map(_albumNode).toList();
          case 'artists':
            if (letter == null) {
              return _letterNodes(parentMediaId, _listHints);
            }
            final artists = await _letterItems(
              serverId,
              ({nameStartsWith, nameLessThan, limit}) =>
                  client.itemsApi.getAlbumArtists(
                sortBy: 'SortName',
                sortOrder: 'Ascending',
                nameStartsWith: nameStartsWith,
                nameLessThan: nameLessThan,
                limit: limit,
                fields: _browseFields,
              ),
              letter,
            );
            return artists.map(_artistNode).toList();
          case 'musicplaylists':
            return _playlistNodes(client, serverId);
          case 'booklib':
            // 'sec|booklib|<serverId>|<viewId>' with an optional '|az|<letter>'.
            if (letter == null) {
              return _letterNodes(parentMediaId, _gridHints);
            }
            final viewId = parts.elementAtOrNull(3);
            // One fetch fills every letter folder in _cache; this node then
            // returns its own bucket. See _fillBookBuckets.
            final sectionId = parts.sublist(0, parts.indexOf('az')).join('|');
            await (_bucketFills[sectionId] ??=
                _fillBookBuckets(client, serverId, sectionId, viewId));
            return _cache[parentMediaId]?.items ?? const [];
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
          limit: _listCap,
          fields: _browseFields,
          enableImageTypes: _browseImageTypes,
          imageTypeLimit: 1,
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
    final l10n = _l10n;
    return [
      _browsableNode('tab|home', l10n.home, extras: _listHints),
      _browsableNode('tab|music', l10n.music, extras: _listHints),
      if (hasBookLibrary)
        // List, not grid: the children here are art-less letter folders, which
        // show as broken tiles under a grid hint. Books inside a letter still
        // get a cover grid from the _gridHints passed into _letterNodes.
        _browsableNode('tab|books', l10n.audiobooks, extras: _listHints),
      _browsableNode('tab|playlists', l10n.playlists, extras: _listHints),
    ];
  }

  // Caps the "Continue listening" shelf; each local-resume book is its own
  // getItem fetch, so bound the fan-out on a long listening history.
  static const _resumeShelfMax = 20;

  Future<List<MediaItem>> _homeChildren(
    MediaServerClient client,
    String serverId,
  ) async {
    final l10n = _l10n;
    final resumeShelf = _shelf(l10n.continueListening);
    final recentShelf =
        _shelf(l10n.recentlyAdded, style: AndroidContentStyle.gridItemHintValue);

    // Audiobook progress is tracked locally, so the server resume list alone
    // leaves an audiobook-only user with an empty Home. Merge the local book
    // positions with whatever the server reports.
    final localMs = await _resumeService.loadAll(serverId);
    final localIds = localMs.keys.take(_resumeShelfMax).toList();
    final localItems = (await Future.wait(
      localIds.map((id) => _getItem(client, serverId, id)),
    ))
        .whereType<AggregatedItem>()
        .toList();

    List<AggregatedItem> serverResume = const [];
    try {
      final resumeResponse = await client.itemsApi.getResumeItems(
        includeItemTypes: const ['AudioBook', 'Audio'],
        limit: 40,
      );
      serverResume = _toItems(resumeResponse, serverId);
    } catch (_) {}

    final seen = <String>{};
    final resumeLeaves = <MediaItem>[];
    for (final item in [...localItems, ...serverResume]) {
      if (!seen.add(item.id)) continue;
      resumeLeaves.add(item.isAudiobook
          ? _bookLeaf(item, serverId, hints: resumeShelf)
          : _trackLeaf(item, serverId, '-', '-', hints: resumeShelf));
    }

    // Recently added audiobooks, scoped to the book libraries, so Home is not
    // empty for a user with no music.
    final recentBooks = <MediaItem>[];
    try {
      for (final view in await _bookViews(client)) {
        final latest = await client.itemsApi.getLatestItems(
          parentId: view['Id'] as String?,
          includeItemTypes: const ['AudioBook', 'Audio'],
          limit: 20,
          fields: _browseFields,
          enableImageTypes: _browseImageTypes,
          imageTypeLimit: 1,
        );
        recentBooks.addAll(
          _toItems(latest, serverId)
              .map((i) => _bookLeaf(i, serverId, hints: recentShelf)),
        );
      }
    } catch (_) {}

    final recentAlbums = <MediaItem>[];
    try {
      final latestResponse = await client.itemsApi.getLatestItems(
        includeItemTypes: const ['MusicAlbum'],
        limit: 20,
      );
      recentAlbums.addAll(
        _toItems(latestResponse, serverId)
            .map((a) => _albumNode(a, hints: recentShelf)),
      );
    } catch (_) {}

    return [...resumeLeaves, ...recentBooks, ...recentAlbums];
  }

  /// Quick play, a fresh-artwork shelf, then the full catalog behind category
  /// rows: the tab shape the major streaming apps use in the car.
  Future<List<MediaItem>> _musicChildren(
    MediaServerClient client,
    String serverId,
  ) async {
    List<AggregatedItem> recentAlbums = const [];
    try {
      final response = await client.itemsApi.getLatestItems(
        includeItemTypes: const ['MusicAlbum'],
        limit: 12,
      );
      recentAlbums = _toItems(response, serverId);
    } catch (_) {}

    final l10n = _l10n;
    final browse = {..._listHints, ..._shelf(l10n.browse)};
    final recentShelf =
        _shelf(l10n.recentlyAdded, style: AndroidContentStyle.gridItemHintValue);
    return [
      MediaItem(
        id: 'shuffle|$serverId|all',
        title: l10n.shuffleAllMusic,
        playable: true,
        extras: _shelf(l10n.play),
      ),
      for (final album in recentAlbums)
        _albumNode(album, hints: recentShelf),
      _browsableNode('sec|albums|$serverId', l10n.albums, extras: browse),
      _browsableNode('sec|artists|$serverId', l10n.artists, extras: browse),
      _browsableNode('sec|musicplaylists|$serverId', l10n.playlists,
          extras: browse),
    ];
  }

  Future<List<Map<String, dynamic>>> _bookViews(
    MediaServerClient client,
  ) async {
    final response = await client.userViewsApi.getUserViews();
    final views = (response['Items'] as List? ?? const [])
        .whereType<Map<String, dynamic>>();
    final candidates = views.where((v) {
      final collectionType =
          (v['CollectionType'] as String? ?? '').toLowerCase();
      return collectionType == 'audiobooks' || collectionType == 'books';
    }).toList();
    // An ebook-only 'books' library has no playable audio; listing it under
    // the Audiobooks tab gives the car empty letter folders. Probe each
    // candidate for actual audio content and drop the empty ones.
    final hasAudio = await Future.wait(
      candidates.map((v) => _viewHasAudio(client, v['Id'] as String?)),
    );
    return [
      for (var i = 0; i < candidates.length; i++)
        if (hasAudio[i]) candidates[i],
    ];
  }

  // Probe results per viewId; a library gaining its first audiobook shows up
  // after the TTL like any other browse change.
  final Map<String, _CachedProbe> _audioProbes = {};

  Future<bool> _viewHasAudio(MediaServerClient client, String? viewId) async {
    if (viewId == null) return false;
    final cached = _audioProbes[viewId];
    if (cached != null &&
        DateTime.now().difference(cached.fetchedAt) < _cacheTtl) {
      return cached.hasAudio;
    }
    var hasAudio = false;
    try {
      final response = await client.itemsApi.getItems(
        parentId: viewId,
        includeItemTypes: const ['AudioBook', 'Audio'],
        recursive: true,
        limit: 1,
        enableTotalRecordCount: false,
      );
      hasAudio = (response['Items'] as List? ?? const []).isNotEmpty;
    } catch (_) {
      // On error keep the library visible rather than hiding it.
      hasAudio = true;
    }
    _audioProbes[viewId] = _CachedProbe(hasAudio);
    return hasAudio;
  }

  Future<List<MediaItem>> _booksChildren(
    MediaServerClient client,
    String serverId,
  ) async {
    final views = await _bookViews(client);
    if (views.isEmpty) return const [];
    if (views.length == 1) {
      // A single book library skips the view picker and browses the section
      // node directly, so it gets the same A-Z letter folders.
      return _loadChildren(
        client,
        'sec|booklib|$serverId|${views.first['Id']}',
      );
    }
    return [
      for (final view in views)
        _browsableNode(
          'sec|booklib|$serverId|${view['Id']}',
          view['Name'] as String? ?? _l10n.audiobooks,
          artUri: _viewArtUrl(client, view),
          extras: _listHints,
        ),
    ];
  }

  /// The library's own Primary image, the same tile art the phone UI shows.
  String? _viewArtUrl(MediaServerClient client, Map<String, dynamic> view) {
    final viewId = view['Id'] as String?;
    final tag = (view['ImageTags'] as Map?)?['Primary'] as String?;
    if (viewId == null || tag == null) return null;
    try {
      return carAuthedImageUrl(
        client,
        client.imageApi.getPrimaryImageUrl(viewId, maxHeight: 300, tag: tag),
      );
    } catch (_) {
      return null;
    }
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
        // Bounded on purpose: this queues straight into PlaybackManager, so a
        // prolific artist yields a long-but-sane queue instead of thousands.
        final response = await client.itemsApi.getItems(
          artistIds: [artistId],
          includeItemTypes: const ['Audio'],
          recursive: true,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          limit: 500,
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
      limit: 100,
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

  /// Extras that place an item under a titled shelf, the grouped look the
  /// major streaming apps use in the car, optionally forcing the item's own
  /// tile style regardless of the surrounding list's default.
  Map<String, dynamic> _shelf(String title, {int? style}) => {
        _kGroupTitle: title,
        _kSingleItemStyle: ?style,
      };

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

  MediaItem _albumNode(AggregatedItem album, {Map<String, dynamic>? hints}) =>
      MediaItem(
        id: 'album|${album.serverId}|${album.id}',
        title: album.name,
        artist: album.albumArtist ??
            (album.artists.isNotEmpty ? album.artists.join(', ') : null),
        playable: false,
        artUri: _artUri(album),
        extras: {..._listHints, ...?hints},
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
    String ctxId, {
    Map<String, dynamic>? hints,
  }) =>
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
        extras: {'serverId': serverId, ...?hints},
      );

  MediaItem _bookLeaf(
    AggregatedItem item,
    String serverId, {
    Map<String, dynamic>? hints,
  }) =>
      MediaItem(
        id: 'book|$serverId|${item.id}',
        title: item.name,
        artist: item.artists.isNotEmpty
            ? item.artists.join(', ')
            : item.albumArtist,
        duration: item.runtime,
        playable: true,
        artUri: _artUri(item),
        extras: {'serverId': serverId, ...?hints},
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
        return carAuthedImageUrl(
          client,
          client.imageApi.getPrimaryImageUrl(
            albumId,
            maxHeight: 300,
            tag: item.albumPrimaryImageTag,
          ),
        );
      }
      if (item.primaryImageTag != null) {
        return carAuthedImageUrl(
          client,
          client.imageApi.getPrimaryImageUrl(
            item.id,
            maxHeight: 300,
            tag: item.primaryImageTag,
          ),
        );
      }
    } catch (_) {}
    return null;
  }

  MediaItem get _signInItem => MediaItem(
        id: 'msg|signin',
        title: _l10n.carSignInPrompt,
        playable: false,
      );

  MediaItem get _offlineItem => MediaItem(
        id: 'msg|offline',
        title: _l10n.carServerUnreachable,
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
