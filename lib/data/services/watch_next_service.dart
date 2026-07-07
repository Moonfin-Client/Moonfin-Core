import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../playback/car_artwork.dart';
import '../../util/platform_detection.dart';
import '../models/aggregated_item.dart';
import '../models/home_row.dart';
import 'topshelf_service.dart';

class WatchNextService {
  static const _channel = MethodChannel('org.moonfin.androidtv/watch_next');
  static const _maxItems = 20;
  // This window lets the progressive home-section loads on a cold start
  // coalesce into a single publish.
  static const _debounceDelay = Duration(seconds: 5);

  Timer? _debounce;
  String? _lastPublishedSignature;

  bool get _enabled => PlatformDetection.isAndroid && PlatformDetection.isTV;

  void update(List<HomeRow> rows) {
    if (!_enabled) return;
    _debounce?.cancel();
    _debounce = Timer(_debounceDelay, () => unawaited(_publish(rows)));
  }

  void clear() {
    if (!_enabled) return;
    _debounce?.cancel();
    _lastPublishedSignature = null;
    unawaited(_channel.invokeMethod('clear').catchError((_) {}));
  }

  void schedulePeriodicRefresh() {
    if (!_enabled) return;
    unawaited(_channel.invokeMethod('schedulePeriodic').catchError((_) {}));
  }

  void cancelPeriodicRefresh() {
    if (!_enabled) return;
    unawaited(_channel.invokeMethod('cancelPeriodic').catchError((_) {}));
  }

  Future<void> _publish(List<HomeRow> rows) async {
    try {
      // Built payloads embed DateTime.now() fallbacks, so change detection
      // uses the source rows instead.
      final signature = _signatureFor(rows);
      if (signature == _lastPublishedSignature) return;

      await CarArtwork.instance.ensureReady();
      final imageApi = GetIt.instance<MediaServerClient>().imageApi;
      final items = buildItems(rows, imageApi);

      if (items.isEmpty) {
        await _channel.invokeMethod('clear');
        _lastPublishedSignature = signature;
        return;
      }

      await CarArtwork.instance.persistHosts();
      await _channel.invokeMethod('publish', {'items': items});
      _lastPublishedSignature = signature;
    } catch (_) {}
  }

  /// A stable fingerprint of everything that can change the published payload,
  /// mirroring the row/item filtering in [buildItems].
  static String _signatureFor(List<HomeRow> rows) {
    final buffer = StringBuffer();
    for (final row in rows.where(
      (r) => r.rowType == HomeRowType.resume || r.rowType == HomeRowType.nextUp,
    )) {
      buffer.write(row.rowType.name);
      for (final item in row.items) {
        buffer
          ..write('|')
          ..write(item.id)
          ..write(':')
          ..write(item.serverId)
          ..write(':')
          ..write(item.playbackPositionTicks ?? 0)
          ..write(':')
          ..write(item.rawData['UserData']?['LastPlayedDate'] ?? '')
          ..write(':')
          ..write(item.primaryImageTag ?? '');
      }
      buffer.write(';');
    }
    return buffer.toString();
  }

  static List<Map<String, dynamic>> buildItems(
    List<HomeRow> rows,
    ImageApi imageApi,
  ) {
    final seen = <String>{};
    final items = <Map<String, dynamic>>[];
    for (final row in rows.where(
      (r) => r.rowType == HomeRowType.resume || r.rowType == HomeRowType.nextUp,
    )) {
      for (final item in row.items) {
        if (item.id.isEmpty || !seen.add(item.id)) continue;
        final payload = _itemPayload(item, imageApi, items.length);
        if (payload != null) items.add(payload);
        if (items.length >= _maxItems) break;
      }
      if (items.length >= _maxItems) break;
    }
    return items;
  }

  static Map<String, dynamic>? _itemPayload(
    AggregatedItem item,
    ImageApi imageApi,
    int index,
  ) {
    final id = item.id;
    final isMovie = item.type == 'Movie';
    final isEpisode = item.type == 'Episode';
    if (!isMovie && !isEpisode) return null;

    final serverId = item.serverId;

    final poster = CarArtwork.instance
        .wrap(isMovie ? _moviePoster(item, imageApi) : _episodePoster(item, imageApi))
        ?.toString();

    final resumeMs = item.playbackPositionTicks != null
        ? item.playbackPositionTicks! ~/ 10000
        : 0;
    final durationMs =
        item.runTimeTicks != null ? item.runTimeTicks! ~/ 10000 : null;

    final lastPlayed =
        DateTime.tryParse(item.rawData['UserData']?['LastPlayedDate'] as String? ?? '');
    final lastEngagementMs = lastPlayed?.millisecondsSinceEpoch ??
        (DateTime.now().millisecondsSinceEpoch - index);

    return {
      'id': id,
      'serverId': serverId,
      'kind': isMovie ? 'movie' : 'episode',
      'title': isEpisode ? (item.seriesName ?? item.name) : item.name,
      if (isEpisode) 'episodeTitle': item.name,
      if (isEpisode && item.parentIndexNumber != null)
        'seasonNumber': item.parentIndexNumber,
      if (isEpisode && item.indexNumber != null) 'episodeNumber': item.indexNumber,
      'description': ?item.overview,
      'posterUri': ?poster,
      'resumePositionMs': resumeMs,
      'durationMs': ?durationMs,
      'lastEngagementMs': lastEngagementMs,
    };
  }

  static String? _moviePoster(AggregatedItem item, ImageApi imageApi) {
    final tag = item.primaryImageTag;
    if (tag != null && tag.isNotEmpty) {
      return imageApi.getPrimaryImageUrl(item.id, maxHeight: 720, tag: tag);
    }
    final backdrops = item.backdropImageTags;
    if (backdrops.isNotEmpty) {
      return imageApi.getBackdropImageUrl(item.id, maxWidth: 960, tag: backdrops.first);
    }
    return null;
  }

  static String? _episodePoster(AggregatedItem item, ImageApi imageApi) {
    final tag = item.primaryImageTag;
    if (tag != null && tag.isNotEmpty) {
      return imageApi.getPrimaryImageUrl(item.id, maxWidth: 960, tag: tag);
    }
    final seriesId = item.seriesId;
    final seriesThumb = item.seriesThumbImageTag;
    if (seriesId != null && seriesThumb != null && seriesThumb.isNotEmpty) {
      return imageApi.getThumbImageUrl(seriesId, maxWidth: 960, tag: seriesThumb);
    }
    final seriesPrimary = item.seriesPrimaryImageTag;
    if (seriesId != null && seriesPrimary != null && seriesPrimary.isNotEmpty) {
      return imageApi.getPrimaryImageUrl(seriesId, maxHeight: 720, tag: seriesPrimary);
    }
    return null;
  }

  void startDeepLinkListener(void Function(String route) onRoute) {
    if (!_enabled) return;

    void dispatch(String? url) {
      if (url == null) return;
      final uri = Uri.tryParse(url);
      if (uri == null) return;
      final route = TopShelfService.routeForDeepLink(uri);
      if (route != null) onRoute(route);
    }

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onDeepLink') {
        dispatch(call.arguments as String?);
      }
      return null;
    });

    () async {
      try {
        dispatch(await _channel.invokeMethod<String>('getInitialDeepLink'));
      } catch (_) {}
    }();
  }
}
