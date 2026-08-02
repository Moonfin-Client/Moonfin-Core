import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../l10n/app_localizations.dart';
import '../../playback/car_artwork.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import '../models/aggregated_item.dart';
import '../repositories/user_views_repository.dart';
import 'media_server_client_factory.dart';
import 'row_data_source.dart';
import 'watch_next_service.dart';

/// Publishes the Android TV launcher channel rows (Next Up, Recent Films, New Episodes,
/// Recently Added Media). It reuses the watch next method channel, artwork wrapping, and
/// deep link plumbing, so the only new surface is the channel data itself.
class TvChannelsService {
  static const _channel = MethodChannel('org.moonfin.androidtv/watch_next');
  static const _maxItems = 20;
  static const _debounceDelay = Duration(seconds: 5);

  Timer? _debounce;
  String? _lastPublishedSignature;

  bool get _enabled => PlatformDetection.isAndroid && PlatformDetection.isTV;

  void update() {
    if (!_enabled) return;
    _debounce?.cancel();
    _debounce = Timer(_debounceDelay, () => unawaited(publish()));
  }

  Future<void> publish() async {
    if (!_enabled) return;
    try {
      final client = GetIt.instance<MediaServerClient>();
      final channels = await buildChannels(client, serverId: _serverIdFor(client));
      final signature = _signatureFor(channels);
      if (signature == _lastPublishedSignature) return;

      if (channels.isEmpty) {
        await _channel.invokeMethod('clearChannels');
        _lastPublishedSignature = signature;
        return;
      }
      await CarArtwork.instance.persistHosts();
      await _channel.invokeMethod('publishChannels', {'channels': channels});
      _lastPublishedSignature = signature;
    } catch (_) {}
  }

  void clear() {
    if (!_enabled) return;
    _debounce?.cancel();
    _lastPublishedSignature = null;
    unawaited(_channel.invokeMethod('clearChannels').catchError((_) {}));
  }

  static String _serverIdFor(MediaServerClient client) {
    try {
      final factory = GetIt.instance<MediaServerClientFactory>();
      for (final entry in factory.clients.entries) {
        if (identical(entry.value, client)) return entry.key;
      }
    } catch (_) {}
    return client.baseUrl;
  }

  static String _signatureFor(List<Map<String, dynamic>> channels) {
    final buffer = StringBuffer();
    for (final channel in channels) {
      buffer.write(channel['key']);
      final items = channel['items'] as List<Map<String, dynamic>>? ?? [];
      for (final item in items) {
        buffer
          ..write('|')
          ..write(item['id'] ?? '')
          ..write(':')
          ..write(item['posterUri'] ?? '');
      }
      buffer.write(';');
    }
    return buffer.toString();
  }

  static Future<List<AggregatedItem>> _loadRecentlyReleasedForCollection(
    RowDataSource dataSource,
    String serverId,
    List<String> targetTypes,
  ) async {
    try {
      final repo = GetIt.instance<UserViewsRepository>();
      final views = await repo.getAllViewsIncludingHidden();
      final matchingViews = views.where((v) {
        final type = v.collectionType.toLowerCase();
        if (targetTypes.contains('movies')) {
          return type == 'movies';
        }
        if (targetTypes.contains('tvshows')) {
          return type == 'tvshows' || type == 'shows';
        }
        return false;
      }).toList();

      if (matchingViews.isEmpty) {
        return await dataSource.loadRecentlyReleasedByType(
          serverId,
          targetTypes.contains('movies') ? const ['Movie'] : const ['Series', 'Episode'],
          limit: _maxItems,
        );
      }

      final items = <AggregatedItem>[];
      for (final view in matchingViews) {
        final row = await dataSource.loadRecentlyReleased(
          view.id,
          view.name,
          serverId,
          view.collectionType.toLowerCase(),
        );
        items.addAll(row.items);
      }
      return items;
    } catch (_) {
      return <AggregatedItem>[];
    }
  }

  /// Fetches the launcher rows and shapes them into the native payload. Shared
  /// by the foreground trigger and the background refresh isolate, both of
  /// which run without a widget tree.
  static Future<List<Map<String, dynamic>>> buildChannels(
    MediaServerClient client, {
    required String serverId,
  }) async {
    final l10n = _localizations();
    final dataSource = RowDataSource(client);
    final prefs = GetIt.instance<UserPreferences>();

    // The rows are independent, so fetch them together and warm the artwork
    // cache while they are in flight. Next Up is built first as the primary row.
    final fetches = Future.wait([
      dataSource
          .loadNextUp(serverId)
          .then((row) => prefs.filterNextUp(row.items))
          .catchError((_) => <AggregatedItem>[]),
      dataSource
          .loadLatestByType(serverId, const ['Movie'], limit: _maxItems)
          .catchError((_) => <AggregatedItem>[]),
      dataSource
          .loadLatestByType(serverId, const ['Series', 'Episode'], limit: _maxItems)
          .catchError((_) => <AggregatedItem>[]),
      _loadRecentlyReleasedForCollection(dataSource, serverId, const ['movies']),
      _loadRecentlyReleasedForCollection(dataSource, serverId, const ['tvshows']),
    ]);
    await CarArtwork.instance.ensureReady();
    final results = await fetches;

    final defs = <(String, String, List<AggregatedItem>)>[
      ('next_up', l10n.nextUp, results[0]),
      ('latest_movies', l10n.latestLibraryName(l10n.movies), results[1]),
      ('latest_shows', l10n.latestLibraryName(l10n.tvShows), results[2]),
      (
        'recently_released_movies',
        l10n.recentlyReleasedLibraryName(l10n.movies),
        results[3],
      ),
      (
        'recently_released_shows',
        l10n.recentlyReleasedLibraryName(l10n.tvShows),
        results[4],
      ),
    ];

    final channels = <Map<String, dynamic>>[];
    for (final (key, title, sourceItems) in defs) {
      final seen = <String>{};
      final items = <Map<String, dynamic>>[];
      for (final item in sourceItems) {
        if (item.id.isEmpty || !seen.add(item.id)) continue;
        final payload = WatchNextService.buildProgramPayload(
          item,
          client,
          index: items.length,
        );
        if (payload != null) items.add(payload);
        if (items.length >= _maxItems) break;
      }
      channels.add({'key': key, 'title': title, 'items': items});
    }
    return channels;
  }

  /// Resolves localized channel titles without a [BuildContext], matching how
  /// the app picks its locale from the language override preference.
  static AppLocalizations _localizations() {
    ui.Locale? resolved;
    try {
      final override =
          GetIt.instance<UserPreferences>().get(UserPreferences.languageOverride);
      if (override != 'system') {
        for (final locale in AppLocalizations.supportedLocales) {
          if (locale.toLanguageTag() == override ||
              locale.toString() == override) {
            resolved = locale;
            break;
          }
        }
      }
    } catch (_) {}
    resolved ??= _matchSupported(ui.PlatformDispatcher.instance.locale);
    return lookupAppLocalizations(resolved ?? const ui.Locale('en'));
  }

  static ui.Locale? _matchSupported(ui.Locale system) {
    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == system.languageCode) return locale;
    }
    return null;
  }
}
