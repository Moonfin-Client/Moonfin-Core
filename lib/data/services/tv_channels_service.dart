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
import 'media_server_client_factory.dart';
import 'row_data_source.dart';
import 'watch_next_service.dart';

/// Publishes the Android TV launcher channel rows (Latest Movies, Latest Shows,
/// Upcoming). It reuses the watch next method channel, artwork wrapping, and
/// deep link plumbing, so the only new surface is the channel data itself.
class TvChannelsService {
  static const _channel = MethodChannel('org.moonfin.androidtv/watch_next');
  static const _maxItems = 20;

  bool get _enabled => PlatformDetection.isAndroid && PlatformDetection.isTV;

  Future<void> publish() async {
    if (!_enabled) return;
    try {
      final client = GetIt.instance<MediaServerClient>();
      final channels = await buildChannels(client, serverId: _serverIdFor(client));
      if (channels.isEmpty) {
        await _channel.invokeMethod('clearChannels');
        return;
      }
      await CarArtwork.instance.persistHosts();
      await _channel.invokeMethod('publishChannels', {'channels': channels});
    } catch (_) {}
  }

  void clear() {
    if (!_enabled) return;
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

  /// Fetches the launcher rows and shapes them into the native payload. Shared
  /// by the foreground trigger and the background refresh isolate, both of
  /// which run without a widget tree.
  static Future<List<Map<String, dynamic>>> buildChannels(
    MediaServerClient client, {
    required String serverId,
  }) async {
    final l10n = _localizations();
    final dataSource = RowDataSource(client);

    // The rows are independent, so fetch them together and warm the artwork
    // cache while they are in flight.
    final fetches = Future.wait([
      dataSource.loadLatestByType(serverId, const ['Movie'], limit: _maxItems),
      dataSource.loadLatestByType(serverId, const ['Episode'], limit: _maxItems),
      dataSource.loadRecentlyReleasedByType(
        serverId,
        const ['Movie', 'Episode'],
        limit: _maxItems,
      ),
    ]);
    await CarArtwork.instance.ensureReady();
    final results = await fetches;

    final defs = <(String, String, List<AggregatedItem>)>[
      ('latest_movies', l10n.latestLibraryName(l10n.movies), results[0]),
      ('latest_shows', l10n.latestLibraryName(l10n.tvShows), results[1]),
      (
        'upcoming',
        l10n.recentlyReleasedLibraryName(l10n.moviesAndTvShows),
        results[2],
      ),
    ];

    final imageApi = client.imageApi;

    final channels = <Map<String, dynamic>>[];
    for (final (key, title, sourceItems) in defs) {
      final seen = <String>{};
      final items = <Map<String, dynamic>>[];
      for (final item in sourceItems) {
        if (item.id.isEmpty || !seen.add(item.id)) continue;
        final payload = WatchNextService.buildProgramPayload(
          item,
          imageApi,
          index: items.length,
        );
        if (payload != null) items.add(payload);
        if (items.length >= _maxItems) break;
      }
      if (items.isNotEmpty) {
        channels.add({'key': key, 'title': title, 'items': items});
      }
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
