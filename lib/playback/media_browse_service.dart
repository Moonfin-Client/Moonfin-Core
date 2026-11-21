import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../data/database/offline_database.dart' show DownloadedItem;
import '../data/models/aggregated_item.dart';
import '../data/repositories/offline_repository.dart';
import '../data/services/audiobook_resume_service.dart';
import '../data/services/media_server_client_factory.dart';
import '../l10n/app_localizations.dart';
import '../l10n/current_app_localizations.dart';
import '../util/playback_time_label.dart';
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

typedef _Chapter = ({String name, Duration start, Duration end});

/// Platform-agnostic media browse tree for Android Auto and CarPlay.
///
/// Owns the pipe-delimited mediaId scheme:
/// ```
///   tab|home (Listen Now), tab|music (Library), tab|books, tab|downloads
///   sec|albums|<serverId>, sec|artists|<s>, sec|musicplaylists|<s>,
///   sec|genres|<s>, sec|favorites|<s>, sec|recent|<s>,
///   sec|booklib|<s>|<viewId>
///   album|<s>|<id>, artist|<s>|<id>, playlist|<s>|<id>, genre|<s>|<id>
///   track|<s>|<id>|<ctxKind>|<ctxId>   (ctx enables sibling queueing)
///   book|<s>|<id>, bookpage|<s>|<id>, bookch|<s>|<id>|<chapterIndex>
///   shuffle|<s>|all, shuffle|<s>|fav, shuffle|<s>|artist|<id>,
///   shuffle|<s>|genre|<id>, mix|<s>|<seedId>
///   dl|<s>|<id>[|<albumId>], dlalbum|<s>|<albumId>, dlshuffle|-|all
///   msg|<code>
/// ```
/// The dl* nodes read the offline database, so they work with no server.
class MediaBrowseService {
  /// Message ids. A lone message item stands in for a listing that couldn't
  /// load, and each car adapter shows it its own way.
  static const signInMessageId = 'msg|signin';
  static const offlineMessageId = 'msg|offline';

  static bool isMessageId(String mediaId) => mediaId.startsWith('msg|');

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
  static const _kCompletionStatus = 'android.media.extra.PLAYBACK_STATUS';
  static const _kCompletionPercentage =
      'androidx.media.MediaItem.Extras.COMPLETION_PERCENTAGE';
  static const _partiallyPlayed = 1;
  static const _fullyPlayed = 2;
  // Recents shelves sit above the letter tiles, so they stay short.
  static const _recentShelfMax = 10;
  static const _topTrackCount = 5;
  static const _letters = [
    '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  ];

  final MediaServerClientFactory _clientFactory;
  final HeadlessSessionBootstrap _bootstrap;
  final AudiobookResumeService _resumeService;
  final LastPlaybackSessionStore _lastSessionStore;
  final OfflineRepository _offline;

  final Map<String, _CachedChildren> _cache = {};
  // Concurrent requests for the same node share one fetch: paging hosts fire
  // several page subscriptions at once and CarPlay reloads all tabs on connect.
  final Map<String, Future<List<MediaItem>>> _inflight = {};
  // Dedupes the whole-library fetch per book section (not per letter like
  // _inflight), so opening several letters at once shares one fetch.
  final Map<String, Future<void>> _bucketFills = {};
  // Listen Now, the album and artist recents and the Recently Played list all
  // read one play history fetch.
  ({List<AggregatedItem> items, DateTime fetchedAt})? _recentTracks;

  MediaBrowseService(
    this._clientFactory,
    this._bootstrap,
    this._resumeService,
    this._lastSessionStore,
    this._offline,
  );

  void clearCache() {
    _cache.clear();
    _inflight.clear();
    _bucketFills.clear();
    _audioProbes.clear();
    _recentTracks = null;
  }

  /// Forgets every cached node that shows play history or book progress and
  /// returns their ids, so the car can be told to reload them. Letter folders
  /// and other plain listings stay cached.
  List<String> dropRecents() {
    _recentTracks = null;
    final dropped = _cache.keys.where(_showsRecents).toList();
    for (final id in dropped) {
      _cache.remove(id);
    }
    return dropped;
  }

  static bool _showsRecents(String id) {
    if (id == 'tab|home' || id == 'tab|books') return true;
    final parts = id.split('|');
    if (parts.first != 'sec' || parts.contains('az')) return false;
    const sections = {'albums', 'artists', 'recent', 'booklib'};
    return sections.contains(parts.elementAtOrNull(1));
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

    if (_isDownloadsNode(parentMediaId)) {
      try {
        final items = await _downloadsChildren(parentMediaId);
        _cache[parentMediaId] = _CachedChildren(items);
        await CarArtwork.instance.persistHosts();
        return _pageOf(items, options);
      } catch (_) {
        return const [];
      }
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

    // A book page shows the saved position, so it's fetched fresh every time
    // the car opens it. It's one small request.
    if (!parentMediaId.startsWith('bookpage|')) {
      _cache[parentMediaId] = _CachedChildren(items);
    }
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

  // The '#' and A-Z folders, as a compact tile grid under its own heading so
  // it can follow a recents shelf. [childHints] styles each folder's contents
  // (cover grid for albums and books, rows for artists). Books bucket these
  // client-side in _fillBookBuckets, where '#' catches everything that isn't
  // A-Z. Albums and artists still filter server-side, where '#' only covers
  // names before 'A'.
  List<MediaItem> _letterNodes(
    String parentMediaId,
    Map<String, dynamic> childHints,
  ) {
    final extras = {
      ...childHints,
      ..._shelf(
        _l10n.browseByLetter,
        style: AndroidContentStyle.categoryGridItemHintValue,
      ),
    };
    return [
      for (final letter in _letters)
        MediaItem(
          id: '$parentMediaId|az|$letter',
          title: letter,
          playable: false,
          artUri: CarArtwork.instance.letter(letter),
          extras: extras,
        ),
    ];
  }

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
            .add(_bookPageNode(item, serverId));
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
            return _libraryChildren(serverId);
          case 'books':
            return _booksChildren(client, serverId);
          // The old Playlists tab, for a car still holding its id.
          case 'playlists':
            return _playlistNodes(client, serverId);
        }
      case 'sec':
        final section = parts.elementAtOrNull(1);
        final letter = _letterOf(parts);
        switch (section) {
          case 'albums':
            if (letter == null) {
              final recent =
                  _recentAlbums(await _recentlyPlayed(client, serverId));
              final shelf = _shelf(_l10n.carRecentlyPlayed,
                  style: AndroidContentStyle.gridItemHintValue);
              return [
                for (final track in recent)
                  _albumNodeFromTrack(track, hints: shelf),
                ..._letterNodes(parentMediaId, _gridHints),
              ];
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
              final recent = await _recentArtists(client, serverId);
              return [...recent, ..._letterNodes(parentMediaId, _listHints)];
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
          case 'genres':
            return _genreNodes(client, serverId);
          case 'favorites':
            return _favoritesChildren(client, serverId);
          case 'recent':
            final recent = await _recentlyPlayed(client, serverId);
            return recent
                .map((t) => _trackLeaf(t, serverId, 'recent', '-'))
                .toList();
          case 'booklib':
            // 'sec|booklib|<serverId>|<viewId>' with an optional '|az|<letter>'.
            final viewId = parts.elementAtOrNull(3);
            if (letter == null) {
              final inProgress =
                  await _inProgressBooks(client, serverId, viewId);
              return [...inProgress, ..._letterNodes(parentMediaId, _gridHints)];
            }
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
        return _artistPage(client, serverId, artistId);
      case 'genre':
        final genreId = parts.elementAtOrNull(2);
        if (genreId == null) return const [];
        final response = await client.itemsApi.getItems(
          genreIds: [genreId],
          includeItemTypes: const ['MusicAlbum'],
          recursive: true,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          limit: _listCap,
          fields: _browseFields,
          enableImageTypes: _browseImageTypes,
          imageTypeLimit: 1,
        );
        final albums = _toItems(response, serverId);
        if (albums.isEmpty) return const [];
        final albumShelf = _shelf(_l10n.albums,
            style: AndroidContentStyle.gridItemHintValue);
        return [
          _shuffleItem('shuffle|$serverId|genre|$genreId', _l10n.shuffleAll),
          for (final album in albums) _albumNode(album, hints: albumShelf),
        ];
      case 'bookpage':
        final bookId = parts.elementAtOrNull(2);
        if (bookId == null) return const [];
        return _bookPage(client, serverId, bookId);
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
    var hasDownloads = false;
    try {
      hasDownloads = (await _downloadedAudio()).isNotEmpty;
    } catch (_) {}
    final l10n = _l10n;
    return [
      _browsableNode('tab|home', l10n.carListenNow, extras: _listHints),
      _browsableNode('tab|music', l10n.library, extras: _categoryListHints),
      if (hasBookLibrary)
        // List, not grid: a multi-library user picks a library from plain
        // rows. The letter tiles inside carry their own item style.
        _browsableNode('tab|books', l10n.audiobooks, extras: _listHints),
      if (hasDownloads)
        _browsableNode('tab|downloads', l10n.savedMedia, extras: _listHints),
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
    final tile = {
      ..._listHints,
      _kSingleItemStyle: AndroidContentStyle.categoryGridItemHintValue,
    };

    final played = await _recentlyPlayed(client, serverId);
    final seed = played.firstOrNull;
    final quickTiles = [
      _shuffleItem('shuffle|$serverId|all', l10n.shuffleAllMusic,
          extras: tile),
      if (seed != null && _supportsInstantMix(client))
        MediaItem(
          id: 'mix|$serverId|${seed.id}',
          title: l10n.carInstantMix,
          playable: true,
          artUri: CarArtwork.instance.icon('ic_car_mix'),
          extras: tile,
        ),
      _browsableNode('sec|favorites|$serverId', l10n.favorites,
          icon: CarArtwork.instance.icon('ic_car_favorite'), extras: tile),
      _browsableNode('sec|recent|$serverId', l10n.carRecentlyPlayed,
          icon: CarArtwork.instance.icon('ic_car_recent'), extras: tile),
    ];
    final jumpBackInShelf =
        _shelf(l10n.jumpBackIn, style: AndroidContentStyle.gridItemHintValue);
    final jumpBackIn = [
      for (final track in _recentAlbums(played))
        _albumNodeFromTrack(track, hints: jumpBackInShelf),
    ];

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
        mediaTypes: 'Audio',
        limit: 40,
      );
      serverResume = _toItems(resumeResponse, serverId);
    } catch (_) {}

    final seen = <String>{};
    final resumeLeaves = <MediaItem>[];
    for (final item in [...localItems, ...serverResume]) {
      if (!seen.add(item.id)) continue;
      final hints = {
        ...resumeShelf,
        ..._progressExtras(_resumeAt(localMs[item.id], item), item.runtime),
      };
      resumeLeaves.add(item.isAudiobook
          ? _bookLeaf(item, serverId, hints: hints)
          : _trackLeaf(item, serverId, '-', '-', hints: hints));
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
              .map((i) => _bookPageNode(i, serverId, hints: recentShelf)),
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

    return [
      ...quickTiles,
      ...jumpBackIn,
      ...resumeLeaves,
      ...recentBooks,
      ...recentAlbums,
    ];
  }

  List<MediaItem> _libraryChildren(String serverId) {
    final l10n = _l10n;
    MediaItem category(String id, String title, String icon) =>
        _browsableNode(id, title,
            icon: CarArtwork.instance.icon(icon), extras: _listHints);
    return [
      category('sec|albums|$serverId', l10n.albums, 'ic_car_album'),
      category('sec|artists|$serverId', l10n.artists, 'ic_car_artist'),
      category('sec|musicplaylists|$serverId', l10n.playlists,
          'ic_car_playlist'),
      category('sec|genres|$serverId', l10n.genres, 'ic_car_genre'),
      category('sec|favorites|$serverId', l10n.favorites, 'ic_car_favorite'),
    ];
  }

  /// The play history behind every recents shelf, newest first. Audiobook
  /// tracks are left out since they have their own Continue Listening shelf.
  Future<List<AggregatedItem>> _recentlyPlayed(
    MediaServerClient client,
    String serverId,
  ) async {
    final cached = _recentTracks;
    if (cached != null &&
        DateTime.now().difference(cached.fetchedAt) < _cacheTtl) {
      return cached.items;
    }
    try {
      final response = await client.itemsApi.getItems(
        includeItemTypes: const ['Audio'],
        recursive: true,
        filters: const ['IsPlayed'],
        sortBy: 'DatePlayed',
        sortOrder: 'Descending',
        limit: _pageSize,
        // Emby types an audiobook file as Audio, and only its chapters tell
        // isAudiobook it's one.
        fields: '$_browseFields,Chapters',
        enableImageTypes: _browseImageTypes,
        imageTypeLimit: 1,
        enableTotalRecordCount: false,
      );
      final items =
          _toItems(response, serverId).where((i) => !i.isAudiobook).toList();
      _recentTracks = (items: items, fetchedAt: DateTime.now());
      return items;
    } catch (_) {
      return const [];
    }
  }

  /// One track per recently played album, so the album shelves can reuse the
  /// track's album id, name and cover.
  static List<AggregatedItem> _recentAlbums(List<AggregatedItem> played) {
    final seen = <String>{};
    return [
      for (final track in played)
        if (track.albumId != null && seen.add(track.albumId!)) track,
    ].take(_recentShelfMax).toList();
  }

  Future<List<MediaItem>> _recentArtists(
    MediaServerClient client,
    String serverId,
  ) async {
    final extras = {..._listHints, ..._shelf(_l10n.carRecentlyPlayed)};
    final seen = <String>{};
    final nodes = <MediaItem>[];
    for (final track in await _recentlyPlayed(client, serverId)) {
      // The album artist matches the Artists letter folders, which list
      // album artists.
      final artists = _nameIdPairs(track.rawData['AlbumArtists']);
      final artist = artists.isNotEmpty
          ? artists.first
          : _nameIdPairs(track.rawData['ArtistItems']).firstOrNull;
      if (artist == null || !seen.add(artist.$2)) continue;
      String? art;
      try {
        art = carAuthedImageUrl(
          client,
          client.imageApi.getPrimaryImageUrl(artist.$2, maxHeight: 300),
        );
      } catch (_) {}
      nodes.add(MediaItem(
        id: 'artist|$serverId|${artist.$2}',
        title: artist.$1,
        playable: false,
        artUri: CarArtwork.instance.wrap(art),
        extras: extras,
      ));
      if (nodes.length >= _recentShelfMax) break;
    }
    return nodes;
  }

  static List<(String, String)> _nameIdPairs(Object? raw) => [
        for (final entry in (raw as List? ?? const []).whereType<Map>())
          if (entry['Id'] != null && entry['Name'] is String)
            (entry['Name'] as String, entry['Id'].toString()),
      ];

  bool _supportsInstantMix(MediaServerClient client) {
    try {
      return client.features.supportsInstantMix;
    } catch (_) {
      return false;
    }
  }

  /// Music genres, asked for per music library. Jellyfin 10.11 returns
  /// nothing for an item type filter on /Genres.
  Future<List<MediaItem>> _genreNodes(
    MediaServerClient client,
    String serverId,
  ) async {
    final views = (await client.userViewsApi.getUserViews())['Items'] as List?;
    final musicViewIds = [
      for (final view in (views ?? const []).whereType<Map<String, dynamic>>())
        if ((view['CollectionType'] as String? ?? '').toLowerCase() == 'music')
          view['Id']?.toString(),
    ].whereType<String>();
    final seen = <String>{};
    final nodes = <MediaItem>[];
    for (final viewId in musicViewIds) {
      final response = await client.itemsApi.getGenres(
        parentId: viewId,
        recursive: true,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        limit: _listCap,
      );
      for (final genre in _toItems(response, serverId)) {
        if (!seen.add(genre.id)) continue;
        nodes.add(_browsableNode('genre|$serverId|${genre.id}', genre.name,
            artUri: _artUriFor(genre), extras: _listHints));
      }
    }
    return nodes;
  }

  Future<List<MediaItem>> _favoritesChildren(
    MediaServerClient client,
    String serverId,
  ) async {
    final l10n = _l10n;
    final results = await Future.wait([
      _itemsOrEmpty(serverId, () => client.itemsApi.getItems(
            includeItemTypes: const ['MusicAlbum'],
            isFavorite: true,
            recursive: true,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            limit: _listCap,
            fields: _browseFields,
            enableImageTypes: _browseImageTypes,
            imageTypeLimit: 1,
          )),
      _itemsOrEmpty(serverId, () => client.itemsApi.getAlbumArtists(
            isFavorite: true,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            limit: _listCap,
            fields: _browseFields,
          )),
      _favoriteSongs(client, serverId),
    ]);
    final albums = results[0];
    final artists = results[1];
    final songs = results[2];
    final albumShelf =
        _shelf(l10n.albums, style: AndroidContentStyle.gridItemHintValue);
    final artistShelf = _shelf(l10n.artists);
    final songShelf = _shelf(l10n.songs);
    return [
      if (songs.isNotEmpty)
        _shuffleItem('shuffle|$serverId|fav', l10n.shuffleAll),
      for (final album in albums) _albumNode(album, hints: albumShelf),
      for (final artist in artists) _artistNode(artist, hints: artistShelf),
      for (final song in songs)
        _trackLeaf(song, serverId, 'fav', '-', hints: songShelf),
    ];
  }

  Future<List<AggregatedItem>> _favoriteSongs(
    MediaServerClient client,
    String serverId,
  ) =>
      _itemsOrEmpty(
        serverId,
        () => client.itemsApi.getItems(
          includeItemTypes: const ['Audio'],
          isFavorite: true,
          recursive: true,
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          limit: _listCap,
          fields: _browseFields,
          enableImageTypes: _browseImageTypes,
          imageTypeLimit: 1,
        ),
      );

  Future<List<AggregatedItem>> _itemsOrEmpty(
    String serverId,
    Future<Map<String, dynamic>> Function() fetch,
  ) async {
    try {
      return _toItems(await fetch(), serverId);
    } catch (_) {
      return const [];
    }
  }

  Future<List<MediaItem>> _artistPage(
    MediaServerClient client,
    String serverId,
    String artistId,
  ) async {
    final l10n = _l10n;
    final results = await Future.wait([
      _artistTopTracks(client, serverId, artistId),
      client.itemsApi
          .getItems(
            artistIds: [artistId],
            includeItemTypes: const ['MusicAlbum'],
            recursive: true,
            sortBy: 'ProductionYear,SortName',
            sortOrder: 'Descending',
            limit: _listCap,
            fields: _browseFields,
            enableImageTypes: _browseImageTypes,
            imageTypeLimit: 1,
          )
          .then((r) => _toItems(r, serverId)),
    ]);
    final top = results[0];
    final albums = results[1];
    final topShelf = _shelf(l10n.mostPlayed);
    final albumShelf =
        _shelf(l10n.albums, style: AndroidContentStyle.gridItemHintValue);
    return [
      if (top.isNotEmpty || albums.isNotEmpty)
        _shuffleItem('shuffle|$serverId|artist|$artistId', l10n.shuffleAll),
      // The album, not the artist again, under each track. Android only reads
      // a display subtitle next to a display title.
      for (final track in top)
        _trackLeaf(track, serverId, 'top', artistId, hints: topShelf)
            .copyWith(displayTitle: track.name, displaySubtitle: track.album),
      for (final album in albums) _albumNode(album, hints: albumShelf),
    ];
  }

  Future<List<AggregatedItem>> _artistTopTracks(
    MediaServerClient client,
    String serverId,
    String artistId,
  ) =>
      _itemsOrEmpty(
        serverId,
        () => client.itemsApi.getItems(
          artistIds: [artistId],
          includeItemTypes: const ['Audio'],
          recursive: true,
          sortBy: 'PlayCount',
          sortOrder: 'Descending',
          limit: _topTrackCount,
          fields: _browseFields,
          enableImageTypes: _browseImageTypes,
          imageTypeLimit: 1,
        ),
      );

  Future<List<MediaItem>> _bookPage(
    MediaServerClient client,
    String serverId,
    String bookId,
  ) async {
    final book = await _getItem(client, serverId, bookId);
    if (book == null) return const [];
    final l10n = _l10n;
    final position = await _bookPosition(serverId, book);
    final chapters = _chaptersOf(book);
    final current = chapters.lastIndexWhere((c) => c.start <= position);
    final started = position > Duration.zero;
    final chapterShelf = _shelf(l10n.chapters);
    return [
      MediaItem(
        id: 'book|$serverId|$bookId',
        title: started
            ? l10n.resumeFrom(formatPlaybackDuration(position))
            : l10n.play,
        // The chapter it resumes in, else the author: the page header
        // already shows the book's name.
        artist: started && current >= 0
            ? chapters[current].name
            : _byline(book),
        playable: true,
        artUri: _artUri(book),
        extras: {
          'serverId': serverId,
          ..._progressExtras(started ? position : null, book.runtime),
        },
      ),
      for (var i = 0; i < chapters.length; i++)
        _chapterItem(serverId, bookId, i, chapters[i], position,
            started: started, current: i == current, shelf: chapterShelf),
    ];
  }

  // The subtitle says finished, time left or length in words, which every car
  // shows. Android Auto 18.1 drew no completion marker on these art-less rows.
  MediaItem _chapterItem(
    String serverId,
    String bookId,
    int index,
    _Chapter chapter,
    Duration position, {
    required bool started,
    required bool current,
    required Map<String, dynamic> shelf,
  }) {
    final done = started && chapter.end <= position;
    final inProgress = started && current && !done;
    return MediaItem(
      id: 'bookch|$serverId|$bookId|$index',
      title: chapter.name,
      artist: done
          ? _l10n.finished
          : inProgress
              ? _l10n.timeRemaining(
                  formatPlaybackDuration(chapter.end - position))
              : formatPlaybackDuration(chapter.end - chapter.start),
      playable: true,
      extras: {
        'serverId': serverId,
        ...shelf,
        if (done)
          _kCompletionStatus: _fullyPlayed
        else if (inProgress)
          ..._progressExtras(
            position - chapter.start,
            chapter.end - chapter.start,
          ),
      },
    );
  }

  Future<Duration> _bookPosition(String serverId, AggregatedItem book) async =>
      _resumeAt(await _resumeService.load(serverId, book.id), book) ??
      Duration.zero;

  /// The local position wins since the app tracks audiobook progress itself.
  static Duration? _resumeAt(int? localMs, AggregatedItem item) =>
      localMs != null && localMs > 0
          ? Duration(milliseconds: localMs)
          : item.playbackPosition;

  List<_Chapter> _chaptersOf(AggregatedItem book) {
    final starts = <({String name, Duration start})>[];
    for (final raw in book.chapters) {
      final ticks = (raw['StartPositionTicks'] as num?)?.toInt();
      if (ticks == null) continue;
      final name = (raw['Name'] as String?)?.trim() ?? '';
      starts.add((
        name: name.isNotEmpty ? name : '${_l10n.chapter} ${starts.length + 1}',
        start: Duration(microseconds: ticks ~/ 10),
      ));
    }
    final total = book.runtime;
    return [
      for (var i = 0; i < starts.length; i++)
        (
          name: starts[i].name,
          start: starts[i].start,
          end: i + 1 < starts.length
              ? starts[i + 1].start
              : (total != null && total > starts[i].start
                  ? total
                  : starts[i].start),
        ),
    ];
  }

  Future<List<MediaItem>> _inProgressBooks(
    MediaServerClient client,
    String serverId,
    String? viewId,
  ) async {
    if (viewId == null) return const [];
    final shelf = _shelf(_l10n.continueListening);
    final localMs = await _resumeService.loadAll(serverId);
    final found = <AggregatedItem>[];
    try {
      if (localMs.isNotEmpty) {
        // Narrowing the local ids by parentId keeps the shelf to this library.
        final response = await client.itemsApi.getItems(
          parentId: viewId,
          ids: localMs.keys.take(_pageSize).toList(),
          recursive: true,
          fields: _browseFields,
          enableImageTypes: _browseImageTypes,
          imageTypeLimit: 1,
          enableTotalRecordCount: false,
        );
        found.addAll(_toItems(response, serverId));
      }
    } catch (_) {}
    try {
      final response = await client.itemsApi.getResumeItems(
        parentId: viewId,
        mediaTypes: 'Audio',
        limit: _recentShelfMax,
        fields: _browseFields,
        enableImageTypes: _browseImageTypes,
        imageTypeLimit: 1,
      );
      found.addAll(_toItems(response, serverId));
    } catch (_) {}
    final seen = <String>{};
    return [
      for (final book in found)
        if (seen.add(book.id))
          _bookLeaf(book, serverId, hints: {
            ...shelf,
            ..._progressExtras(_resumeAt(localMs[book.id], book), book.runtime),
          }),
    ].take(_recentShelfMax).toList();
  }

  /// Android Auto's progress bar on a row: partly played plus how far in.
  Map<String, dynamic> _progressExtras(Duration? position, Duration? total) {
    if (position == null || position <= Duration.zero) return const {};
    if (total == null || total <= Duration.zero) {
      return const {_kCompletionStatus: _partiallyPlayed};
    }
    final fraction = position.inMilliseconds / total.inMilliseconds;
    if (fraction >= 1) return const {_kCompletionStatus: _fullyPlayed};
    return {
      _kCompletionStatus: _partiallyPlayed,
      _kCompletionPercentage: fraction,
    };
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

  static bool _isDownloadsNode(String mediaId) =>
      mediaId == 'tab|downloads' || mediaId.startsWith('dlalbum|');

  Future<List<AggregatedItem>> _downloadedAudio() async {
    final rows = await _offline.getItems(onlyCompleted: true);
    return [
      for (final row in rows)
        if (_fromOffline(row) case final item? when item.isAudioLike) item,
    ];
  }

  static AggregatedItem? _fromOffline(DownloadedItem row) {
    try {
      return AggregatedItem.fromOffline(row);
    } catch (_) {
      // A row with unreadable metadata is skipped, not the whole tab.
      return null;
    }
  }

  static int _trackOrder(AggregatedItem a, AggregatedItem b) {
    int n(AggregatedItem i, String key) =>
        (i.rawData[key] as num?)?.toInt() ?? 0;
    final disc = n(a, 'ParentIndexNumber').compareTo(n(b, 'ParentIndexNumber'));
    return disc != 0 ? disc : n(a, 'IndexNumber').compareTo(n(b, 'IndexNumber'));
  }

  Future<List<MediaItem>> _downloadsChildren(String parentMediaId) async {
    final audio = await _downloadedAudio();
    final l10n = _l10n;
    if (parentMediaId.startsWith('dlalbum|')) {
      final albumId = parentMediaId.split('|').elementAtOrNull(2);
      final tracks = audio
          .where((i) => !i.isAudiobook && i.albumId == albumId)
          .toList()
        ..sort(_trackOrder);
      return [for (final t in tracks) _downloadLeaf(t, albumId: albumId)];
    }
    final books = audio.where((i) => i.isAudiobook).toList();
    final tracks = audio.where((i) => !i.isAudiobook).toList();
    final albums = <String, AggregatedItem>{};
    final loose = <AggregatedItem>[];
    for (final t in tracks) {
      final albumId = t.albumId;
      if (albumId == null) {
        loose.add(t);
      } else {
        albums.putIfAbsent(albumId, () => t);
      }
    }
    final bookShelf = _shelf(l10n.audiobooks);
    final albumShelf =
        _shelf(l10n.albums, style: AndroidContentStyle.gridItemHintValue);
    final songShelf = _shelf(l10n.songs);
    return [
      if (tracks.isNotEmpty) _shuffleItem('dlshuffle|-|all', l10n.shuffleAll),
      for (final b in books) _downloadLeaf(b, hints: bookShelf),
      for (final MapEntry(key: albumId, value: track) in albums.entries)
        _albumNodeFromTrack(track, hints: albumShelf)
            .copyWith(id: 'dlalbum|${track.serverId}|$albumId'),
      for (final t in loose) _downloadLeaf(t, hints: songShelf),
    ];
  }

  MediaItem _downloadLeaf(
    AggregatedItem item, {
    String? albumId,
    Map<String, dynamic>? hints,
  }) =>
      _trackLeaf(item, item.serverId, '-', '-', hints: hints).copyWith(
        id: albumId == null
            ? 'dl|${item.serverId}|${item.id}'
            : 'dl|${item.serverId}|${item.id}|$albumId',
      );

  Future<PlayRequest?> _resolveDownload(List<String> parts) async {
    final audio = await _downloadedAudio();
    if (parts.first == 'dlshuffle') {
      final tracks = audio.where((i) => !i.isAudiobook).toList()..shuffle();
      return tracks.isEmpty ? null : PlayRequest(items: tracks);
    }
    final serverId = parts.elementAtOrNull(1);
    final itemId = parts.elementAtOrNull(2);
    final albumId = parts.elementAtOrNull(3);
    final item = audio
        .where((i) => i.id == itemId && i.serverId == serverId)
        .firstOrNull;
    if (item == null) return null;
    if (item.isAudiobook) {
      // Streaming saves the position under the app's server id and offline
      // playback under the download's, so take the furthest of the two.
      final factoryId = _factoryIdFor(item.serverId);
      final offline = await _bookPosition(item.serverId, item);
      final online = factoryId == null || factoryId == item.serverId
          ? Duration.zero
          : await _bookPosition(factoryId, item);
      return PlayRequest(
        items: [item],
        startPosition: online > offline ? online : offline,
      );
    }
    if (albumId == null) return PlayRequest(items: [item]);
    final tracks = audio
        .where((i) => !i.isAudiobook && i.albumId == albumId)
        .toList()
      ..sort(_trackOrder);
    return _queueAround(tracks, item.id);
  }

  /// The client factory's id for [serverId]. Downloads are stored under the
  /// server's base URL when the download service's client wasn't registered,
  /// so a base URL maps back to the id of the client with that URL.
  String? _factoryIdFor(String serverId) {
    final clients = _clientFactory.clients;
    if (clients.containsKey(serverId)) return serverId;
    for (final entry in clients.entries) {
      if (entry.value.baseUrl == serverId) return entry.key;
    }
    return null;
  }

  MediaServerClient? _clientForId(String serverId) {
    final id = _factoryIdFor(serverId);
    return id == null ? null : _clientFactory.getClientIfExists(id);
  }

  static PlayRequest? _queueAround(List<AggregatedItem> items, String itemId) {
    if (items.isEmpty) return null;
    final index = items.indexWhere((i) => i.id == itemId);
    return PlayRequest(items: items, startIndex: index < 0 ? 0 : index);
  }

  Future<PlayRequest?> resolvePlayRequest(String mediaId) async {
    final parts = mediaId.split('|');
    if (parts.first == 'dl' || parts.first == 'dlshuffle') {
      try {
        return await _resolveDownload(parts);
      } catch (_) {
        return null;
      }
    }
    final client = await _client();
    if (client == null) return null;
    final serverId = _serverIdOf(client);

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
        // Rows from a list the service builds itself queue that same list.
        final siblings = switch (ctxKind) {
          'recent' => await _recentlyPlayed(client, serverId),
          'fav' => await _favoriteSongs(client, serverId),
          'top' when ctxId != null && ctxId != '-' =>
            await _artistTopTracks(client, serverId, ctxId),
          _ => const <AggregatedItem>[],
        };
        final queued = _queueAround(siblings, itemId);
        if (queued != null) return queued;
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
        return PlayRequest(
          items: [item],
          startPosition: await _bookPosition(serverId, item),
        );
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
        final scope = parts.elementAtOrNull(2);
        final scopeId = parts.elementAtOrNull(3);
        final response = await client.itemsApi.getItems(
          includeItemTypes: const ['Audio'],
          recursive: true,
          sortBy: 'Random',
          limit: 300,
          isFavorite: scope == 'fav' ? true : null,
          artistIds: scope == 'artist' && scopeId != null ? [scopeId] : null,
          genreIds: scope == 'genre' && scopeId != null ? [scopeId] : null,
        );
        final items = _toItems(response, serverId);
        if (items.isEmpty) return null;
        return PlayRequest(items: items);
      case 'mix':
        final seedId = parts.elementAtOrNull(2);
        if (seedId == null) return null;
        final response =
            await client.instantMixApi.getInstantMix(seedId, limit: 100);
        final items =
            _toItems(response, serverId).where((i) => i.isAudioLike).toList();
        if (items.isEmpty) return null;
        return PlayRequest(items: items);
      case 'bookch':
        final bookId = parts.elementAtOrNull(2);
        final index = int.tryParse(parts.elementAtOrNull(3) ?? '');
        if (bookId == null || index == null) return null;
        final book = await _getItem(client, serverId, bookId);
        if (book == null) return null;
        final chapters = _chaptersOf(book);
        if (index < 0 || index >= chapters.length) return null;
        return PlayRequest(items: [book], startPosition: chapters[index].start);
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
    return _queueAround(
      _toItems(response, serverId).where((i) => i.isAudioLike).toList(),
      itemId,
    );
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
          mediaTypes: 'Audio',
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

  /// [icon] is an app drawable from [CarArtwork.icon] and skips the artwork
  /// provider, which only fetches server images.
  MediaItem _browsableNode(
    String id,
    String title, {
    String? artUri,
    Uri? icon,
    Map<String, dynamic>? extras,
  }) =>
      MediaItem(
        id: id,
        title: title,
        playable: false,
        artUri: icon ?? CarArtwork.instance.wrap(artUri),
        extras: extras,
      );

  MediaItem _shuffleItem(
    String id,
    String title, {
    Map<String, dynamic>? extras,
  }) =>
      MediaItem(
        id: id,
        title: title,
        playable: true,
        artUri: CarArtwork.instance.icon('ic_shuffle'),
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

  /// An album node built from one of its tracks, for shelves fed by play
  /// history. The track's cover lookup already falls back to its album.
  MediaItem _albumNodeFromTrack(
    AggregatedItem track, {
    Map<String, dynamic>? hints,
  }) =>
      MediaItem(
        id: 'album|${track.serverId}|${track.albumId}',
        title: track.album ?? track.name,
        artist: track.albumArtist ??
            (track.artists.isNotEmpty ? track.artists.join(', ') : null),
        playable: false,
        artUri: _artUri(track),
        extras: {..._listHints, ...?hints},
      );

  // List hints: the artist page mixes a shuffle row, track rows and an album
  // grid, and each of those carries its own item style.
  MediaItem _artistNode(AggregatedItem artist, {Map<String, dynamic>? hints}) =>
      MediaItem(
        id: 'artist|${artist.serverId}|${artist.id}',
        title: artist.name,
        playable: false,
        artUri: _artUri(artist),
        extras: {..._listHints, ...?hints},
      );

  /// A book that opens on Resume plus its chapter list. Continue Listening
  /// rows use [_bookLeaf] instead, so resuming stays one tap.
  MediaItem _bookPageNode(
    AggregatedItem item,
    String serverId, {
    Map<String, dynamic>? hints,
  }) =>
      MediaItem(
        id: 'bookpage|$serverId|${item.id}',
        title: item.name,
        artist: _byline(item),
        playable: false,
        artUri: _artUri(item),
        extras: {..._listHints, ...?hints},
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
        artist: _byline(item),
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
        artist: _byline(item),
        duration: item.runtime,
        playable: true,
        artUri: _artUri(item),
        extras: {'serverId': serverId, ...?hints},
      );

  static String? _byline(AggregatedItem item) =>
      item.artists.isNotEmpty ? item.artists.join(', ') : item.albumArtist;

  Uri? _artUri(AggregatedItem item) => CarArtwork.instance.wrap(_artUriFor(item));

  String? _artUriFor(AggregatedItem item) {
    final client = _clientForId(item.serverId);
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

  /// The message item for [mediaId], falling back to the sign-in prompt.
  MediaItem messageItem(String mediaId) =>
      mediaId == offlineMessageId ? _offlineItem : _signInItem;

  MediaItem get _signInItem => MediaItem(
        id: signInMessageId,
        title: _l10n.carSignInPrompt,
        playable: false,
      );

  MediaItem get _offlineItem => MediaItem(
        id: offlineMessageId,
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

  static const Map<String, dynamic> _categoryListHints = {
    AndroidContentStyle.supportedKey: true,
    AndroidContentStyle.playableHintKey: AndroidContentStyle.listItemHintValue,
    AndroidContentStyle.browsableHintKey:
        AndroidContentStyle.categoryListItemHintValue,
  };
}
