import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/calendar_entry.dart';
import '../services/moonbase_endpoint.dart';

enum CalendarProblem {
  adminsOnly,

  /// Moonbase reads the arr settings through an admin's Seerr session and
  /// no admin has signed in to Seerr through Moonfin yet.
  needsAdminSeerr,

  /// No Sonarr or Radarr is linked.
  notConfigured,
  failed,
}

class CalendarResult {
  const CalendarResult(this.entries, {this.problem});

  /// Sorted by date.
  final List<CalendarEntry> entries;

  /// Set only when neither source answered.
  final CalendarProblem? problem;
}

class CalendarFilter {
  const CalendarFilter({
    this.showEpisodes = true,
    this.showMovies = true,
    this.showSpecials = false,
    this.cinema = true,
    this.digital = true,
    this.physical = true,
    this.libraryIds = const {},
    this.myShowsOnly = false,
    this.followedSeriesIds = const {},
  });

  final bool showEpisodes;
  final bool showMovies;
  final bool showSpecials;
  final bool cinema;
  final bool digital;
  final bool physical;

  /// Empty means every library.
  final Set<String> libraryIds;
  final bool myShowsOnly;
  final Set<String> followedSeriesIds;

  bool allows(CalendarEntry e) {
    if (e.isEpisode) {
      if (!showEpisodes) return false;
      if (!showSpecials && e.seasonNumber == 0) return false;
      if (myShowsOnly && !followedSeriesIds.contains(e.itemId)) return false;
    } else {
      if (!showMovies) return false;
      final type = switch (e.release) {
        CalendarRelease.cinema => cinema,
        CalendarRelease.digital => digital,
        CalendarRelease.physical => physical,
        CalendarRelease.airing => true,
      };
      if (!type) return false;
    }
    // A picked library hides titles the server couldn't place in any library.
    if (libraryIds.isNotEmpty && !e.libraryIds.any(libraryIds.contains)) {
      return false;
    }
    return true;
  }
}

/// Reads the Sonarr and Radarr calendars through Moonbase, which keeps the arr
/// API keys on the server and places each title in a library.
class CalendarRepository {
  CalendarRepository(this._client);

  static const _cacheFor = Duration(minutes: 2);

  final MediaServerClient _client;
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );
  final _cache = <String, (DateTime, CalendarResult)>{};
  final _inFlight = <String, Future<CalendarResult>>{};
  Set<String>? _reminderKeys;

  /// Entries on local days from [start] up to but not including [end].
  Future<CalendarResult> load({
    required DateTime start,
    required DateTime end,
    bool unmonitored = false,
    bool refresh = false,
  }) {
    final cacheKey = '${_date(start)}|${_date(end)}|$unmonitored';
    final cached = _cache[cacheKey];
    if (!refresh &&
        cached != null &&
        DateTime.now().difference(cached.$1) < _cacheFor) {
      return Future.value(cached.$2);
    }
    if (!refresh && _inFlight[cacheKey] != null) return _inFlight[cacheKey]!;
    final future = _fetch(start, end, unmonitored)
        .then((result) {
          if (result.problem == null) {
            _cache[cacheKey] = (DateTime.now(), result);
          }
          return result;
        })
        // A block body, since whenComplete waits on a returned future and
        // remove() would hand back this same future.
        .whenComplete(() {
          _inFlight.remove(cacheKey);
        });
    _inFlight[cacheKey] = future;
    return future;
  }

  void invalidate() => _cache.clear();

  Future<CalendarResult> _fetch(
    DateTime start,
    DateTime end,
    bool unmonitored,
  ) async {
    final ep = await moonbaseEndpoint(_client, _dio);
    if (ep == null) {
      return const CalendarResult([], problem: CalendarProblem.notConfigured);
    }
    // Sonarr's range is in UTC, so a day either side keeps evening episodes
    // in far time zones. The local day filter below trims the extra.
    final query = {
      'start': _date(start.subtract(const Duration(days: 1))),
      'end': _date(end.add(const Duration(days: 1))),
      if (unmonitored) 'unmonitored': 'true',
    };
    final responses = await Future.wait([
      _get(ep, 'Sonarr', query),
      _get(ep, 'Radarr', query),
    ]);
    final sonarr = responses[0];
    final radarr = responses[1];
    final entries = <CalendarEntry>[];
    for (final raw in sonarr.$1 ?? const []) {
      if (raw is! Map<String, dynamic>) continue;
      final entry = parseSonarrEntry(raw);
      if (entry == null) continue;
      if (entry.day.isBefore(start) || !entry.day.isBefore(end)) continue;
      entries.add(entry);
    }
    for (final raw in radarr.$1 ?? const []) {
      if (raw is! Map<String, dynamic>) continue;
      entries.addAll(parseRadarrEntries(raw, start: start, end: end));
    }
    entries.sort(compareCalendarEntries);
    if (sonarr.$1 == null && radarr.$1 == null) {
      return CalendarResult(entries, problem: _worst(sonarr.$2, radarr.$2));
    }
    return CalendarResult(entries);
  }

  Future<(List<dynamic>?, CalendarProblem?)> _get(
    MoonbaseEndpoint ep,
    String service,
    Map<String, String> query,
  ) async {
    try {
      final response = await _dio.get<dynamic>(
        '${ep.base}/Moonfin/Seerr/$service/Calendar',
        queryParameters: query,
        options: Options(headers: ep.headers),
      );
      final data = response.data;
      return (data is List ? data : const <dynamic>[], null);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final body = '${e.response?.data ?? ''}';
      debugPrint('[Calendar] $service calendar failed: $status $body');
      return (
        null,
        switch (status) {
          403 => CalendarProblem.adminsOnly,
          503 when body.contains('admin Seerr session') =>
            CalendarProblem.needsAdminSeerr,
          404 || 503 => CalendarProblem.notConfigured,
          _ => CalendarProblem.failed,
        },
      );
    } catch (e) {
      debugPrint('[Calendar] $service calendar failed: $e');
      return (null, CalendarProblem.failed);
    }
  }

  /// The more telling of two sources' problems, so a missing Radarr doesn't
  /// hide that Sonarr needs an admin.
  static CalendarProblem _worst(CalendarProblem? a, CalendarProblem? b) {
    const order = [
      CalendarProblem.adminsOnly,
      CalendarProblem.needsAdminSeerr,
      CalendarProblem.failed,
      CalendarProblem.notConfigured,
    ];
    for (final p in order) {
      if (a == p || b == p) return p;
    }
    return CalendarProblem.failed;
  }

  /// Favorite and watch state of the given library series, for My shows and
  /// spoiler safe mode.
  Future<Map<String, CalendarSeriesProgress>> seriesProgress(
    Set<String> seriesIds,
  ) async {
    final out = <String, CalendarSeriesProgress>{};
    final ids = seriesIds.toList();
    for (var i = 0; i < ids.length; i += 50) {
      try {
        final page = await _client.itemsApi.getItems(
          ids: ids.sublist(i, (i + 50).clamp(0, ids.length)),
          fields: 'RecursiveItemCount',
          enableTotalRecordCount: false,
        );
        for (final item in page['Items'] as List? ?? const []) {
          if (item is! Map) continue;
          final data = item['UserData'];
          if (data is! Map) continue;
          final unplayed = (data['UnplayedItemCount'] as num?)?.toInt() ?? 0;
          final total = (item['RecursiveItemCount'] as num?)?.toInt();
          out['${item['Id']}'] = CalendarSeriesProgress(
            favorite: data['IsFavorite'] == true,
            started:
                data['Played'] == true ||
                (total != null && unplayed < total) ||
                data['LastPlayedDate'] != null,
            unplayed: unplayed,
          );
        }
      } catch (e) {
        debugPrint('[Calendar] series progress failed: $e');
      }
    }
    return out;
  }

  /// The keys of this user's reminders, cached until one is added or removed.
  Future<Set<String>> reminderKeys({bool refresh = false}) async {
    if (!refresh && _reminderKeys != null) return _reminderKeys!;
    final ep = await moonbaseEndpoint(_client, _dio);
    if (ep == null) return const {};
    try {
      final response = await _dio.get<dynamic>(
        '${ep.base}/Moonfin/Calendar/Reminders',
        options: Options(headers: ep.headers),
      );
      final data = response.data;
      final list = data is Map
          ? (data['reminders'] ?? data['Reminders'])
          : null;
      _reminderKeys = {
        for (final r in list is List ? list : const [])
          if (r is Map) '${r['key'] ?? r['Key'] ?? ''}',
      };
    } catch (e) {
      debugPrint('[Calendar] reminders failed: $e');
      _reminderKeys ??= <String>{};
    }
    return _reminderKeys!;
  }

  /// Adds or removes the reminder for [entry]. Returns whether it is now set.
  Future<bool> setReminder(CalendarEntry entry, bool on) async {
    final key = entry.reminderKey;
    final ep = await moonbaseEndpoint(_client, _dio);
    if (key == null || ep == null) return false;
    final keys = await reminderKeys();
    if (on) {
      await _dio.post<dynamic>(
        '${ep.base}/Moonfin/Calendar/Reminders',
        data: entry.reminderBody(),
        options: Options(headers: ep.headers),
      );
      _reminderKeys = {...keys, key};
      return true;
    }
    await _dio.delete<dynamic>(
      '${ep.base}/Moonfin/Calendar/Reminders/${Uri.encodeComponent(key)}',
      options: Options(headers: ep.headers),
    );
    _reminderKeys = {...keys}..remove(key);
    return false;
  }

  void dispose() => _dio.close(force: true);
}

int compareCalendarEntries(CalendarEntry a, CalendarEntry b) {
  final byDay = a.day.compareTo(b.day);
  if (byDay != 0) return byDay;
  // Episodes with a time come in time order. Movie days have none and sort
  // after them.
  if (a.hasTime != b.hasTime) return a.hasTime ? -1 : 1;
  final byTime = a.date.compareTo(b.date);
  if (byTime != 0) return byTime;
  final byTitle = a.title.toLowerCase().compareTo(b.title.toLowerCase());
  if (byTitle != 0) return byTitle;
  return (a.episodeNumber ?? 0).compareTo(b.episodeNumber ?? 0);
}

String _date(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
