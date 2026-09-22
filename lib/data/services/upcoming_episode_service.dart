import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../models/upcoming_episode_info.dart';
import '../repositories/seerr_repository.dart';
import 'plugin_sync_service.dart';

/// Service that resolves upcoming episode air dates for a TV series,
/// prioritizing Sonarr Calendar and falling back to TMDB.
class UpcomingEpisodeService {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final Map<String, ({UpcomingEpisodeInfo? info, DateTime at})> _seriesCache =
      {};

  // Two screens can ask at once, and they should share one answer rather than
  // both going to the network.
  final Map<String, Future<UpcomingEpisodeInfo?>> _inFlight = {};

  // TvdbId -> Earliest UpcomingEpisodeInfo
  final Map<int, UpcomingEpisodeInfo> _sonarrByTvdb = {};
  DateTime? _lastSonarrFetch;
  static const _cacheDuration = Duration(minutes: 30);

  UpcomingEpisodeInfo? getCached(String seriesId) {
    final entry = _seriesCache[seriesId];
    return _stillHolds(entry) ? entry!.info : null;
  }

  /// An answer holds until it ages out, and an episode that has since aired
  /// stops counting as one so the badge gives up on it.
  bool _stillHolds(({UpcomingEpisodeInfo? info, DateTime at})? entry) {
    if (entry == null) return false;
    if (DateTime.now().difference(entry.at) >= _cacheDuration) return false;
    return !(entry.info?.hasAired ?? false);
  }

  /// Resolves the upcoming episode for the given series.
  Future<UpcomingEpisodeInfo?> resolveUpcomingEpisode({
    required String seriesId,
    required Map<String, String?> providerIds,
  }) {
    final entry = _seriesCache[seriesId];
    if (_stillHolds(entry)) return Future.value(entry!.info);

    final running = _inFlight[seriesId];
    if (running != null) return running;

    final future = _resolve(seriesId, providerIds);
    _inFlight[seriesId] = future;
    return future.whenComplete(() => _inFlight.remove(seriesId));
  }

  Future<UpcomingEpisodeInfo?> _resolve(
    String seriesId,
    Map<String, String?> providerIds,
  ) async {
    final now = DateTime.now();

    // 1. Try Sonarr Calendar if Seerr / Sonarr is available
    final seerrAvailable =
        GetIt.instance.isRegistered<PluginSyncService>() &&
        GetIt.instance<PluginSyncService>().seerrAvailable;

    if (seerrAvailable && GetIt.instance.isRegistered<SeerrRepository>()) {
      try {
        await _ensureSonarrCalendar(now);
        final tvdbIdStr = providerIds['Tvdb'] ?? providerIds['tvdb'];
        final tvdbId = tvdbIdStr != null ? int.tryParse(tvdbIdStr) : null;
        if (tvdbId != null && _sonarrByTvdb.containsKey(tvdbId)) {
          final info = _sonarrByTvdb[tvdbId];
          _seriesCache[seriesId] = (info: info, at: now);
          return info;
        }
      } catch (e) {
        debugPrint(
          '[UpcomingEpisodeService] Sonarr calendar resolution failed: $e',
        );
      }
    }

    // 2. Fallback to TMDB
    final tmdbIdStr = providerIds['Tmdb'] ?? providerIds['tmdb'];
    if (tmdbIdStr != null && tmdbIdStr.isNotEmpty) {
      try {
        final info = await _fetchTmdbNextEpisode(tmdbIdStr);
        if (info != null) {
          _seriesCache[seriesId] = (info: info, at: now);
          return info;
        }
      } catch (e) {
        debugPrint('[UpcomingEpisodeService] TMDB fallback failed: $e');
      }
    }

    // Cache negative result to avoid hammering APIs repeatedly
    _seriesCache[seriesId] = (info: null, at: now);
    return null;
  }

  Future<void> _ensureSonarrCalendar(DateTime now) async {
    // A calendar with nothing airing is still an answer. Asking again for
    // every series opened would refetch ninety days each time.
    if (_lastSonarrFetch != null &&
        now.difference(_lastSonarrFetch!) < _cacheDuration) {
      return;
    }

    final repo = GetIt.instance<SeerrRepository>();
    final start = now.toIso8601String().substring(0, 10);
    final end = now
        .add(const Duration(days: 90))
        .toIso8601String()
        .substring(0, 10);

    final results = await repo.getSonarrCalendar(start: start, end: end);
    _sonarrByTvdb.clear();

    for (final res in results) {
      if (res is! Map) continue;
      final seriesMap = res['series'];
      if (seriesMap is! Map) continue;

      final tvdbIdVal = seriesMap['tvdbId'];
      if (tvdbIdVal == null || tvdbIdVal == 0) continue;
      final tvdbId = tvdbIdVal is int ? tvdbIdVal : int.tryParse('$tvdbIdVal');
      if (tvdbId == null) continue;

      final airDateUtcStr = res['airDateUtc'] as String?;
      final airDateUtc =
          airDateUtcStr != null ? DateTime.tryParse(airDateUtcStr) : null;
      if (airDateUtc == null) continue;

      // Only consider future or today's episodes
      if (airDateUtc.toLocal().isBefore(
            DateTime(now.year, now.month, now.day),
          )) {
        continue;
      }

      final seasonNumber = (res['seasonNumber'] as num?)?.toInt() ?? 1;
      final episodeNumber = (res['episodeNumber'] as num?)?.toInt() ?? 1;
      final title = res['title'] as String?;

      final existing = _sonarrByTvdb[tvdbId];
      if (existing == null || airDateUtc.isBefore(existing.airDate)) {
        _sonarrByTvdb[tvdbId] = UpcomingEpisodeInfo(
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber,
          airDate: airDateUtc,
          title: title,
        );
      }
    }

    _lastSonarrFetch = now;
  }

  Future<UpcomingEpisodeInfo?> _fetchTmdbNextEpisode(String tmdbId) async {
    final prefs = GetIt.instance<UserPreferences>();
    final apiKey = prefs.get(UserPreferences.tmdbApiKey);

    // If client has TMDB API key configured directly:
    if (apiKey.isNotEmpty) {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/tv/$tmdbId',
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200 && response.data is Map) {
        final nextEp = response.data['next_episode_to_air'];
        if (nextEp is Map) {
          final airDateStr = nextEp['air_date'] as String?;
          final airDate =
              airDateStr != null ? DateTime.tryParse(airDateStr) : null;
          if (airDate != null) {
            return UpcomingEpisodeInfo(
              seasonNumber: (nextEp['season_number'] as num?)?.toInt() ?? 1,
              episodeNumber: (nextEp['episode_number'] as num?)?.toInt() ?? 1,
              airDate: airDate,
              title: nextEp['name'] as String?,
            );
          }
        }
      }
      return null;
    }

    // Otherwise, try Moonbase server proxy if available:
    if (GetIt.instance.isRegistered<MediaServerClient>()) {
      final client = GetIt.instance<MediaServerClient>();
      final token = client.accessToken;
      if (token != null) {
        try {
          final response = await _dio.get(
            '${client.baseUrl}/Moonfin/Tmdb/NextEpisode',
            queryParameters: {'tmdbId': tmdbId},
            options: Options(headers: {
              'Authorization': 'MediaBrowser Token="$token"',
            }),
          );
          if (response.statusCode == 200 && response.data is Map) {
            final data = response.data;
            if (data['success'] == true && data['airDate'] != null) {
              final airDate = DateTime.tryParse(data['airDate'] as String);
              if (airDate != null) {
                return UpcomingEpisodeInfo(
                  seasonNumber: (data['seasonNumber'] as num?)?.toInt() ?? 1,
                  episodeNumber: (data['episodeNumber'] as num?)?.toInt() ?? 1,
                  airDate: airDate,
                  title: data['name'] as String?,
                );
              }
            }
          }
        } catch (_) {
          // Moonbase endpoint may not be implemented yet
        }
      }
    }

    return null;
  }

  void clearCache() {
    _seriesCache.clear();
    _sonarrByTvdb.clear();
    _lastSonarrFetch = null;
  }

  void dispose() {
    clearCache();
    _inFlight.clear();
    _dio.close(force: true);
  }
}
