import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// The kind of an episode, for the purpose of drawing a badge on its card.
enum AnimeEpisodeKind { mangaCanon, animeCanon, mixed, filler }

/// Whether a file carries only the original Japanese audio, or a dub.
enum AnimeAudioKind { subbed, dubbed, subbedAndDubbed }

AnimeAudioKind? parseAnimeAudioKind(Object? raw) => switch (raw) {
  'Subbed' => AnimeAudioKind.subbed,
  'Dubbed' => AnimeAudioKind.dubbed,
  'SubbedAndDubbed' => AnimeAudioKind.subbedAndDubbed,
  _ => null,
};

enum AnimeMarkerPlacement { below, beside, thumbnail }

AnimeMarkerPlacement parseAnimeMarkerPlacement(Object? raw) => switch (raw) {
  'beside' => AnimeMarkerPlacement.beside,
  'thumbnail' => AnimeMarkerPlacement.thumbnail,
  _ => AnimeMarkerPlacement.below,
};

/// The marker for a single episode.
///
/// The two halves are independent: an episode can have a subbed/dubbed verdict without
/// the show being on AnimeFillerList at all, so [kind] is nullable.
class AnimeEpisodeMarker {
  final AnimeEpisodeKind? kind;
  final bool recap;
  final AnimeAudioKind? audio;

  const AnimeEpisodeMarker({
    required this.kind,
    required this.recap,
    this.audio,
  });

  /// True when this is worth drawing a pill for, which a canon episode with no audio
  /// verdict isnt.
  bool get isNoteworthy => recap || audio != null || kind != null;

  static AnimeEpisodeKind? _parseKind(Object? raw) => switch (raw) {
    'MangaCanon' => AnimeEpisodeKind.mangaCanon,
    'AnimeCanon' => AnimeEpisodeKind.animeCanon,
    'Mixed' => AnimeEpisodeKind.mixed,
    'Filler' => AnimeEpisodeKind.filler,
    // An unknown value means the server is newer than this client. Better to show
    // nothing than to guess a category.
    _ => null,
  };
}

/// Episode markers fetched from the Moonbase plugin and cached in memory. The cache does
/// not survive an app restart.
class AnimeMarkerRepository {
  static const _maxCacheEntries = 32;

  /// The plugin ignores anything past 200 ids in one request.
  static const _itemBatchMax = 200;

  /// Failed lookups are remembered briefly so a list of episode cards cant flood the
  /// plugin while nothing can succeed.
  static const _negativeCacheTtl = Duration(minutes: 3);

  /// Set when the route is missing, meaning no Moonbase or one older than this feature,
  /// and when the admin has the feature switched off. Either way nothing will resolve,
  /// so everything stops asking until the window is up.
  static const _unavailableRetryWindow = Duration(minutes: 10);

  final MediaServerClient _client;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  AnimeMarkerPlacement placement = AnimeMarkerPlacement.below;

  /// Series the plugin matched but hasnt fetched a table for yet. Not a cache: it becomes
  /// a real verdict on its own once the nightly task reaches the show.
  final _pendingSeries = <String>{};

  /// Season id to its verdict. Only seasons whose episodes all agreed are in here, so a
  /// season holding both a dub and a sub simply has no entry.
  final _seasonAudio = <String, Map<String, AnimeAudioKind>>{};

  final _itemAudio = <String, AnimeAudioKind?>{};

  /// Items already asked about, so a card that came back with nothing doesnt ask again on
  /// every rebuild.
  final _itemAsked = <String>{};

  /// Items that failed, and when, so a card is retried after a cooldown rather than on
  /// every rebuild.
  final _itemFailedAt = <String, DateTime>{};

  final _pendingItemBatch = <String>{};
  Timer? _itemBatchTimer;
  final _itemBatchWaiters = <_ItemBatchWaiter>[];

  final _cache = <String, Map<String, AnimeEpisodeMarker>>{};
  final _pending = <String, Completer<Map<String, AnimeEpisodeMarker>?>>{};
  final _negativeCache = <String, DateTime>{};
  DateTime? _unavailableSince;

  AnimeMarkerRepository(this._client);

  /// The marker for one episode if its series is already loaded, or null. Lets a card
  /// draw from cache without starting a request.
  AnimeEpisodeMarker? peek({
    required String seriesId,
    required String episodeId,
  }) {
    return _cache[seriesId]?[_normalizeId(episodeId)];
  }

  /// The plugin keys episodes and seasons by hyphen-free lowercase id. Series ids it takes
  /// as they come, so they arent normalised here.
  static String _normalizeId(String id) =>
      id.replaceAll('-', '').toLowerCase();

  /// True when the server matched this series but hasnt fetched its table yet. A series
  /// that matched nothing isnt pending.
  bool isPending(String seriesId) => _pendingSeries.contains(seriesId);

  AnimeAudioKind? peekSeason({
    required String seriesId,
    required String seasonId,
  }) {
    return _seasonAudio[seriesId]?[_normalizeId(seasonId)];
  }

  /// True once a series has been looked up, successfully or not, so a card can tell "no
  /// marker for this episode" apart from "not asked yet".
  bool isResolved(String seriesId) =>
      _cache.containsKey(seriesId) ||
      _negativeCache.containsKey(seriesId) ||
      _unavailable;

  bool get _unavailable {
    final since = _unavailableSince;
    if (since == null) return false;
    if (DateTime.now().difference(since) < _unavailableRetryWindow) return true;
    _unavailableSince = null;
    return false;
  }

  /// A 404 carrying the plugin's own error body means this series is unknown to it. A 404
  /// with anything else means the route isnt there, so nothing will ever resolve.
  static bool _isMissingRoute(DioException e) {
    if (e.response?.statusCode != 404) return false;
    final body = e.response?.data;
    return !(body is Map && body['error'] != null);
  }

  Future<Map<String, AnimeEpisodeMarker>?> getForSeries(String seriesId) async {
    if (seriesId.isEmpty || _unavailable) return null;

    final cached = _takeCached(seriesId);
    if (cached != null) return cached;

    final negativeAt = _negativeCache[seriesId];
    if (negativeAt != null) {
      if (DateTime.now().difference(negativeAt) < _negativeCacheTtl) {
        return null;
      }
      _negativeCache.remove(seriesId);
    }

    final existing = _pending[seriesId];
    if (existing != null) return existing.future;

    final completer = Completer<Map<String, AnimeEpisodeMarker>?>();
    _pending[seriesId] = completer;

    Map<String, AnimeEpisodeMarker>? completeWith(
      Map<String, AnimeEpisodeMarker>? value,
    ) {
      completer.complete(value);
      _pending.remove(seriesId);
      return value;
    }

    try {
      final baseUrl = _client.baseUrl;
      final token = _client.accessToken;
      if (token == null || baseUrl.isEmpty) return completeWith(null);

      final response = await _dio.get(
        '$baseUrl/Moonfin/AnimeMarkers/Series',
        queryParameters: {'seriesId': seriesId},
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        _negativeCache[seriesId] = DateTime.now();
        return completeWith(null);
      }

      // Off server-wide, so no other series will answer differently. One latch is
      // cheaper than caching an empty result for every series in the library.
      if (data['enabled'] != true) {
        _unavailableSince = DateTime.now();
        return completeWith(null);
      }

      // Matched but not fetched yet: the nightly task hasnt reached this show. Not cached,
      // because it becomes available without anything changing here.
      if (data['pending'] == true) {
        _pendingSeries.add(seriesId);
        _negativeCache[seriesId] = DateTime.now();
        return completeWith(null);
      }

      _pendingSeries.remove(seriesId);

      final rawEpisodes = data['episodes'];
      final markers = <String, AnimeEpisodeMarker>{};

      if (rawEpisodes is Map) {
        rawEpisodes.forEach((key, value) {
          if (key is! String || value is! Map) return;

          final kind = AnimeEpisodeMarker._parseKind(value['kind']);
          final audio = parseAnimeAudioKind(value['audio']);
          final recap = value['recap'] == true;

          if (kind == null && audio == null && !recap) return;

          markers[_normalizeId(key)] = AnimeEpisodeMarker(
            kind: kind,
            recap: recap,
            audio: audio,
          );
        });
      }

      placement = parseAnimeMarkerPlacement(data['placement']);

      final rawSeasons = data['seasons'];
      final seasons = <String, AnimeAudioKind>{};

      if (rawSeasons is Map) {
        rawSeasons.forEach((key, value) {
          if (key is! String || value is! Map) return;

          final audio = parseAnimeAudioKind(value['audio']);
          if (audio == null) return;

          seasons[_normalizeId(key)] = audio;
        });
      }

      _seasonAudio[seriesId] = seasons;
      _storeCacheEntry(seriesId, markers);
      return completeWith(markers);
    } on DioException catch (e) {
      if (_isMissingRoute(e)) {
        _unavailableSince = DateTime.now();
      } else {
        _negativeCache[seriesId] = DateTime.now();
      }
      return completeWith(null);
    } catch (_) {
      _negativeCache[seriesId] = DateTime.now();
      return completeWith(null);
    }
  }

  /// The verdict for a standalone item if it has already been fetched, or null.
  AnimeAudioKind? peekItem(String itemId) => _itemAudio[_normalizeId(itemId)];

  /// True once an item has been asked about, so a card can tell "no verdict" apart from
  /// "not asked yet".
  bool isItemResolved(String itemId) => _itemAsked.contains(_normalizeId(itemId));

  /// The verdict for a standalone item, or null when it has none. Cards ask in batches,
  /// so this is keyed by item rather than by series.
  Future<AnimeAudioKind?> getForItem(String itemId) async {
    final normalized = _normalizeId(itemId);
    if (normalized.isEmpty || _unavailable) return null;

    if (_itemAsked.contains(normalized)) {
      return _itemAudio[normalized];
    }

    final failedAt = _itemFailedAt[normalized];
    if (failedAt != null &&
        DateTime.now().difference(failedAt) < _negativeCacheTtl) {
      return null;
    }

    _pendingItemBatch.add(normalized);

    final waiter = _ItemBatchWaiter({normalized});
    _itemBatchWaiters.add(waiter);

    // Batched so a screen full of cards doesnt send one request each. The first card to
    // ask starts the window and the rest join it.
    _itemBatchTimer ??= Timer(const Duration(milliseconds: 60), () {
      _itemBatchTimer = null;
      _flushItemBatch();
    });

    await waiter.done.future;
    return _itemAudio[normalized];
  }

  Future<void> _flushItemBatch() async {
    // Capped because the plugin drops anything past the limit. The rest stay queued for
    // the next pass rather than being marked asked and silently left blank.
    final ids = _pendingItemBatch.take(_itemBatchMax).toList();
    _pendingItemBatch.removeAll(ids);

    final sent = ids.toSet();
    final waiters = _itemBatchWaiters
        .where((waiter) => waiter.ids.every(sent.contains))
        .toList();
    _itemBatchWaiters.removeWhere(waiters.contains);

    void release() {
      for (final waiter in waiters) {
        if (!waiter.done.isCompleted) waiter.done.complete();
      }

      if (_pendingItemBatch.isNotEmpty && _itemBatchTimer == null) {
        _itemBatchTimer = Timer(const Duration(milliseconds: 60), () {
          _itemBatchTimer = null;
          _flushItemBatch();
        });
      }
    }

    if (ids.isEmpty) {
      release();
      return;
    }

    try {
      final token = _client.accessToken;
      final baseUrl = _client.baseUrl;
      if (token == null || baseUrl.isEmpty) return;

      final response = await _dio.get(
        '$baseUrl/Moonfin/AnimeMarkers/Items',
        queryParameters: {'ids': ids.join(',')},
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        placement = parseAnimeMarkerPlacement(data['placement']);

        if (data['items'] is Map) {
          (data['items'] as Map).forEach((key, value) {
            if (key is! String || value is! Map) return;
            _itemAudio[_normalizeId(key)] = parseAnimeAudioKind(value['audio']);
          });
        }
      }

      _itemAsked.addAll(ids);
      for (final id in ids) {
        _itemFailedAt.remove(id);
      }
    } on DioException catch (e) {
      if (_isMissingRoute(e)) _unavailableSince = DateTime.now();

      final now = DateTime.now();
      for (final id in ids) {
        _itemFailedAt[id] = now;
      }
    } catch (_) {
      final now = DateTime.now();
      for (final id in ids) {
        _itemFailedAt[id] = now;
      }
    } finally {
      release();
    }
  }

  void clearCache() {
    _cache.clear();
    _seasonAudio.clear();
    _itemAudio.clear();
    _itemAsked.clear();
    _itemFailedAt.clear();
    _negativeCache.clear();
    _pendingSeries.clear();
    _unavailableSince = null;
  }

  void dispose() {
    _itemBatchTimer?.cancel();

    // The timer is what would have released these, so they have to be let go by hand
    // or every card still waiting on a verdict hangs on its future.
    for (final waiter in _itemBatchWaiters) {
      if (!waiter.done.isCompleted) waiter.done.complete();
    }
    _itemBatchWaiters.clear();
    _pendingItemBatch.clear();

    clearCache();
    _dio.close(force: true);
  }

  /// Reinserts on read so the oldest key is the one the cap drops.
  Map<String, AnimeEpisodeMarker>? _takeCached(String seriesId) {
    final cached = _cache.remove(seriesId);
    if (cached != null) {
      _cache[seriesId] = cached;
    }
    return cached;
  }

  void _storeCacheEntry(
    String seriesId,
    Map<String, AnimeEpisodeMarker> markers,
  ) {
    _cache.remove(seriesId);
    _cache[seriesId] = markers;
    while (_cache.length > _maxCacheEntries) {
      final oldest = _cache.keys.first;
      _cache.remove(oldest);
      _seasonAudio.remove(oldest);
    }
  }
}

/// One caller waiting on the item batch, and the ids it is waiting for. Pairing the two
/// means a caller whose ids did not fit in this pass keeps waiting for the next one.
class _ItemBatchWaiter {
  final Set<String> ids;
  final done = Completer<void>();

  _ItemBatchWaiter(this.ids);
}
