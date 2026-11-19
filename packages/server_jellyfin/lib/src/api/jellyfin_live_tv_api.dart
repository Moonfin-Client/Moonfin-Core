import 'dart:async';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinLiveTvApi implements LiveTvApi {
  final Dio _dio;
  final Future<void> Function(Duration) _wait;
  static const _postChannelIdsThreshold = 1800;

  /// [wait] stands in for real delays in tests.
  JellyfinLiveTvApi(this._dio, {Future<void> Function(Duration)? wait})
    : _wait = wait ?? Future<void>.delayed;

  /// Jellyfin reads a cancel that had to kill a recording's ffmpeg (a stream
  /// that ignores the polite stop) as a failed recording, and puts the same
  /// timer back to retry it a minute later, so the recording keeps coming
  /// back. The timer returns about ten seconds after the cancel and records
  /// again about a minute after that; a cancel that lands in between has
  /// nothing to kill, so it sticks. The Moonfin plugin does the same on the
  /// server; this covers servers without it.
  static const cancelChecks = [
    Duration(seconds: 20),
    Duration(seconds: 20),
    Duration(seconds: 20),
    Duration(seconds: 30),
    Duration(seconds: 30),
  ];

  @override
  Future<Map<String, dynamic>> getChannels({
    int? startIndex,
    int? limit,
    String? sortBy,
    String? sortOrder,
    String? fields,
    bool? enableTotalRecordCount,
    String? userId,
  }) async {
    final response = await _dio.get('/LiveTv/Channels', queryParameters: {
      'StartIndex': ?startIndex,
      'Limit': ?limit,
      'SortBy': ?sortBy,
      'SortOrder': ?sortOrder,
      'Fields': ?fields,
      'EnableTotalRecordCount': ?enableTotalRecordCount,
      'UserId': ?userId,
    });
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getGuide({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? channelIds,
    bool? isMovie,
    bool? isSeries,
    bool? isSports,
    bool? isNews,
    bool? isKids,
    String? fields,
    bool? enableTotalRecordCount,
    bool? enableImages,
    bool? enableUserData,
    String? userId,
  }) async {
    final ids =
        (channelIds != null && channelIds.isNotEmpty) ? channelIds : null;
    final joined = ids?.join(',');
    final usePost = joined != null && joined.length > _postChannelIdsThreshold;

    // EnableImages/EnableUserData are off for the guide to keep the per-program
    // payload small (issue #666). Channel logos come from /LiveTv/Channels, not
    // this response, so they are unaffected.
    final common = <String, dynamic>{
      if (startDate != null) 'MinEndDate': startDate.toUtc().toIso8601String(),
      if (endDate != null) 'MaxStartDate': endDate.toUtc().toIso8601String(),
      'IsMovie': ?isMovie,
      'IsSeries': ?isSeries,
      'IsSports': ?isSports,
      'IsNews': ?isNews,
      'IsKids': ?isKids,
      'Fields': ?fields,
      'EnableTotalRecordCount': ?enableTotalRecordCount,
      'EnableImages': ?enableImages,
      'EnableUserData': ?enableUserData,
      'UserId': ?userId,
    };

    // POST needs ChannelIds as a JSON array (Jellyfin GetProgramsDto and remux
    // GetProgramsBody both type it as a GUID list); a comma string is rejected
    // by strict servers. GET uses the conventional comma form.
    final Response response;
    if (usePost) {
      response = await _dio.post('/LiveTv/Programs', data: {
        ...common,
        'ChannelIds': ids,
      });
    } else {
      response = await _dio.get('/LiveTv/Programs', queryParameters: {
        ...common,
        'ChannelIds': ?joined,
      });
    }
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getRecommendedPrograms({
    int? limit,
    bool? isAiring,
  }) async {
    final response = await _dio.get(
      '/LiveTv/Programs/Recommended',
      queryParameters: {'Limit': ?limit, 'IsAiring': ?isAiring},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getProgram(
    String programId, {
    String? userId,
  }) async {
    final response = await _dio.get(
      '/LiveTv/Programs/${Uri.encodeComponent(programId)}',
      queryParameters: {'UserId': ?userId},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getRecordings({
    int? limit,
    String? fields,
    bool? enableImages,
    bool? isSeries,
    bool? isMovie,
    bool? isSports,
    bool? isKids,
  }) async {
    final response = await _dio.get('/LiveTv/Recordings', queryParameters: {
      'Limit': ?limit,
      'Fields': ?fields,
      'EnableImages': ?enableImages,
      'IsSeries': ?isSeries,
      'IsMovie': ?isMovie,
      'IsSports': ?isSports,
      'IsKids': ?isKids,
    });
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getTimers() async {
    final response = await _dio.get('/LiveTv/Timers');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getSeriesTimers() async {
    final response = await _dio.get('/LiveTv/SeriesTimers');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> createTimer(String programId) async {
    await _dio.post('/LiveTv/Timers', data: await _timerDefaults(programId));
  }

  @override
  Future<void> createSeriesTimer(
    String programId, {
    Map<String, dynamic>? settings,
  }) async {
    await _dio.post(
      '/LiveTv/SeriesTimers',
      data: {...await _timerDefaults(programId), ...?settings},
    );
  }

  @override
  Future<Map<String, dynamic>> getSeriesTimer(String seriesTimerId) async {
    final response = await _dio.get('/LiveTv/SeriesTimers/$seriesTimerId');
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> updateSeriesTimer(
    String seriesTimerId,
    Map<String, dynamic> seriesTimer,
  ) async {
    await _dio.post('/LiveTv/SeriesTimers/$seriesTimerId', data: seriesTimer);
  }

  /// The server's own defaults for a program, which both kinds of timer post
  /// straight back. A server that wont hand them over still takes a bare
  /// program id.
  Future<Map<String, dynamic>> _timerDefaults(String programId) async {
    try {
      final defaults = await _dio.get(
        '/LiveTv/Timers/Defaults',
        queryParameters: {'ProgramId': programId},
      );
      final payload = Map<String, dynamic>.from(
        (defaults.data as Map?)?.cast<String, dynamic>() ??
            <String, dynamic>{},
      );
      return payload..putIfAbsent('ProgramId', () => programId);
    } catch (_) {
      return {'ProgramId': programId};
    }
  }

  @override
  Future<void> cancelTimer(String timerId) async {
    final before = await _timer(timerId);
    await _dio.delete('/LiveTv/Timers/$timerId');
    final start = before?.start;
    if (before?.status == 'InProgress' && start != null) {
      unawaited(_keepCancelled(timerId, start));
    }
  }

  /// The timer's status and start, or null when it is gone or can't be read.
  Future<({String? status, DateTime? start})?> _timer(String timerId) async {
    try {
      final response = await _dio.get('/LiveTv/Timers/$timerId');
      final data = response.data as Map?;
      if (data == null) return null;
      return (
        status: data['Status'] as String?,
        start: DateTime.tryParse(data['StartDate'] as String? ?? ''),
      );
    } catch (_) {
      return null;
    }
  }

  /// Cancels the timer again whenever the server puts it back to retry. The
  /// retry moves its start to a minute out; recording the episode again (a
  /// series rule reuses the cancelled timer, same id) keeps its own start,
  /// padding included, and a fresh recording gets a new id. Only a start that
  /// changed counts, compared with the server's own times, so when in doubt
  /// the timer is left to record.
  Future<void> _keepCancelled(String timerId, DateTime startBefore) async {
    var kept = startBefore;
    for (final wait in cancelChecks) {
      await _wait(wait);
      final now = await _timer(timerId);
      final start = now?.start;
      if (now == null ||
          now.status == 'Cancelled' ||
          now.status == 'Completed' ||
          start == null ||
          start.isAtSameMomentAs(kept)) {
        continue;
      }
      try {
        await _dio.delete('/LiveTv/Timers/$timerId');
        // A series rule keeps the timer with the retry's start, so a later
        // deliberate recording of it is judged against that.
        kept = start;
      } catch (_) {
        // Tried again at the next check.
      }
    }
  }

  @override
  Future<void> cancelSeriesTimer(String seriesTimerId) async {
    await _dio.delete('/LiveTv/SeriesTimers/$seriesTimerId');
  }
}
