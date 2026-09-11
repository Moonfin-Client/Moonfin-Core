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
/// The two halves are independent: an episode can have a subbed/dubbed verdict without the
/// show being on AnimeFillerList at all, so [kind] is nullable.
class AnimeEpisodeMarker {
  final AnimeEpisodeKind? kind;
  final bool recap;
  final AnimeAudioKind? audio;

  const AnimeEpisodeMarker({
    required this.kind,
    required this.recap,
    this.audio,
  });

  /// True when this is worth drawing a pill for.
  ///
  /// Noteworthy episodes are those that are filler, mixed, recaps, or have a subbed/dubbed verdict. 
  /// Canon episodes with no audio verdict are not noteworthy.

  bool get isNoteworthy => recap || audio != null || kind != null;

  static AnimeEpisodeKind? _parseKind(Object? raw) {
    switch (raw) {
      case 'MangaCanon':
        return AnimeEpisodeKind.mangaCanon;
      case 'AnimeCanon':
        return AnimeEpisodeKind.animeCanon;
      case 'Mixed':
        return AnimeEpisodeKind.mixed;
      case 'Filler':
        return AnimeEpisodeKind.filler;
      default:
        // An unknown value means the server is newer than this client. Better
        // to show nothing than to guess a category.
        return null;
    }
  }
}

/// A repository for episode markers, which are fetched from the Moonbase plugin
/// and cached in memory. The cache is not persisted across app restarts.
class AnimeMarkerRepository {
  static const _maxCacheEntries = 32;

  /// Failed lookups are remembered briefly so a list of episode cards cannot
  /// flood the plugin while nothing can succeed.
  static const _negativeCacheTtl = Duration(minutes: 3);

  /// A 404 with no plugin body means the route is missing entirely, so the
  /// server has no Moonbase or one older than this feature. Stop asking.
  static const _unavailableRetryWindow = Duration(minutes: 10);

  final MediaServerClient _client;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  String? lastDiagnostic;

  AnimeMarkerPlacement placement = AnimeMarkerPlacement.below;

  /// Series IDs that have been asked for but returned no markers yet. 
  /// This is not a cache: the plugin will eventually fetch the table and return a real verdict, 
  /// so this is only a temporary state.
  final _pendingSeries = <String>{};

  /// Season id to its verdict, for the season list. Only seasons whose episodes all agreed
  /// are in here, so a season holding both a dub and a sub simply has no entry.
  final _seasonAudio = <String, Map<String, AnimeAudioKind>>{};

  /// Item id to its verdict, for the home screen. Only items whose episodes all agreed
  /// are in here, so a show holding both a dub and a sub simply has no entry.
  final _itemAudio = <String, AnimeAudioKind?>{};

  /// Item ids already asked about, so a card that came back with nothing does not ask
  /// again on every rebuild.
  final _itemAsked = <String>{};

  /// Item ids that failed to fetch, and when they did. 
  /// A card that failed is retried after a cooldown rather than on every rebuild.
  final _itemFailedAt = <String, DateTime>{};

  final _pendingItemBatch = <String>{};
  Timer? _itemBatchTimer;
  final _itemBatchWaiters = <Completer<void>>[];

  final _cache = <String, Map<String, AnimeEpisodeMarker>>{};
  final _pending = <String, Completer<Map<String, AnimeEpisodeMarker>?>>{};
  final _negativeCache = <String, DateTime>{};
  DateTime? _unavailableSince;

  AnimeMarkerRepository(this._client);

  /// The marker for one episode if its series is already loaded, or null. Lets a
  /// card render from cache without starting a request.
  AnimeEpisodeMarker? peek({
    required String seriesId,
    required String episodeId,
  }) {
    return _cache[seriesId]?[_normalizeId(episodeId)];
  }

  /// Normalizes an episode ID to the form used in the plugin's JSON. The plugin
  /// uses the same normalization as the AniList API, which is to remove hyphens
  /// and lowercase the rest. The plugin does not normalize series IDs, so they
  /// are used as-is.
  static String _normalizeId(String id) =>
      id.replaceAll('-', '').toLowerCase();

  /// True when the server matched this series but has not fetched its table yet, so its
  /// markers are still coming. A series that matched nothing is not pending.
  bool isPending(String seriesId) => _pendingSeries.contains(seriesId);

  AnimeAudioKind? peekSeason({
    required String seriesId,
    required String seasonId,
  }) {
    return _seasonAudio[seriesId]?[_normalizeId(seasonId)];
  }

  /// True once a series has been looked up, successfully or not, so a card can
  /// tell "no marker for this episode" apart from "not asked yet".
  bool isResolved(String seriesId) =>
      _cache.containsKey(seriesId) ||
      _negativeCache.containsKey(seriesId) ||
      _unavailableSince != null;

  Future<Map<String, AnimeEpisodeMarker>?> getForSeries(String seriesId) async {
    if (seriesId.isEmpty) return null;

    if (_unavailableSince != null) {
      if (DateTime.now().difference(_unavailableSince!) <
          _unavailableRetryWindow) {
        return null;
      }
      _unavailableSince = null;
    }

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
      if (token == null) {
        lastDiagnostic = 'no-token';
        return completeWith(null);
      }
      if (baseUrl.isEmpty) {
        lastDiagnostic = 'no-base-url';
        return completeWith(null);
      }

      final response = await _dio.get(
        '$baseUrl/Moonfin/AnimeMarkers/Series',
        queryParameters: {'seriesId': seriesId},
        options: Options(
          headers: {'Authorization': 'MediaBrowser Token="$token"'},
        ),
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        lastDiagnostic = 'bad-response';
        _negativeCache[seriesId] = DateTime.now();
        return completeWith(null);
      }

      // The admin can switch the feature off server-wide. Cache the empty
      // result so cards stop asking rather than retrying on every series.
      if (data['enabled'] != true) {
        lastDiagnostic = 'server-disabled';
        _storeCacheEntry(seriesId, const {});
        return completeWith(const {});
      }

      // Matched but not fetched yet: the nightly task has not reached this show.
      // Not cached, because it becomes available without anything changing here.
      if (data['pending'] == true) {
        lastDiagnostic = 'server-pending';
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

          // An episode is noteworthy if it is a filler, mixed, recap, or has a subbed/dubbed verdict.
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

      lastDiagnostic = markers.isEmpty ? 'server-sent-none' : 'ok-${markers.length}';
      _storeCacheEntry(seriesId, markers);
      return completeWith(markers);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        final body = e.response?.data;
        final answeredByPlugin = body is Map && body['error'] != null;

        if (answeredByPlugin) {
          lastDiagnostic = 'series-404';
          _negativeCache[seriesId] = DateTime.now();
        } else {
          lastDiagnostic = 'route-404';
          _unavailableSince = DateTime.now();
        }
      } else {
        lastDiagnostic = 'http-${e.response?.statusCode ?? e.type.name}';
        _negativeCache[seriesId] = DateTime.now();
      }
      return completeWith(null);
    } catch (error) {
      lastDiagnostic = 'error-${error.runtimeType}';
      _negativeCache[seriesId] = DateTime.now();
      return completeWith(null);
    }
  }

  /// The verdict for a standalone item if it has already been fetched, or null.
  AnimeAudioKind? peekItem(String itemId) => _itemAudio[_normalizeId(itemId)];

  /// True once an item has been asked about, so a card can tell "no verdict" apart from
  /// "not asked yet".
  bool isItemResolved(String itemId) => _itemAsked.contains(_normalizeId(itemId));

  /// Gets the verdict for a standalone item, or null if it has no noteworthy episodes. The
  /// result is cached in memory so a card can render from cache without starting a request.
  /// Cards ask in batches, so this is keyed by item rather than by series.
  Future<AnimeAudioKind?> getForItem(String itemId) async {
    final normalized = _normalizeId(itemId);
    if (normalized.isEmpty) return null;

    if (_itemAsked.contains(normalized)) {
      return _itemAudio[normalized];
    }

    final failedAt = _itemFailedAt[normalized];
    if (failedAt != null &&
        DateTime.now().difference(failedAt) < _negativeCacheTtl) {
      return null;
    }

    _pendingItemBatch.add(normalized);

    final waiter = Completer<void>();
    _itemBatchWaiters.add(waiter);

    // Batch the requests so a screen full of cards does not flood the plugin with one request per card. 
    // The timer is reset on every card, so the batch is sent after a short pause once all the cards have asked. 
    // The batch is sent even if the screen is rebuilt before the timer fires
    _itemBatchTimer ??= Timer(const Duration(milliseconds: 60), () {
      _itemBatchTimer = null;
      _flushItemBatch();
    });

    await waiter.future;
    return _itemAudio[normalized];
  }

  Future<void> _flushItemBatch() async {
    final ids = _pendingItemBatch.toList();
    final waiters = List<Completer<void>>.from(_itemBatchWaiters);
    _pendingItemBatch.clear();
    _itemBatchWaiters.clear();

    void release() {
      for (final waiter in waiters) {
        if (!waiter.isCompleted) waiter.complete();
      }
    }

    if (ids.isEmpty) {
      release();
      return;
    }

    try {
      final token = _client.accessToken;
      final baseUrl = _client.baseUrl;
      if (token == null || baseUrl.isEmpty) {
        release();
        return;
      }

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
      }

      if (data is Map<String, dynamic> && data['items'] is Map) {
        (data['items'] as Map).forEach((key, value) {
          if (key is! String || value is! Map) return;
          _itemAudio[_normalizeId(key)] = parseAnimeAudioKind(value['audio']);
        });
      }

      _itemAsked.addAll(ids);
      for (final id in ids) {
        _itemFailedAt.remove(id);
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
    clearCache();
    _dio.close(force: true);
  }

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
