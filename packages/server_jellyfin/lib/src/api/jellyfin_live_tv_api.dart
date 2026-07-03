import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinLiveTvApi implements LiveTvApi {
  final Dio _dio;
  static const _postChannelIdsThreshold = 1800;

  JellyfinLiveTvApi(this._dio);

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
  Future<Map<String, dynamic>> getRecommendedPrograms({int? limit}) async {
    final response = await _dio.get(
      '/LiveTv/Programs/Recommended',
      queryParameters: {'Limit': ?limit},
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
    Map<String, dynamic> payload;
    try {
      final defaults = await _dio.get(
        '/LiveTv/Timers/Defaults',
        queryParameters: {'ProgramId': programId},
      );
      payload = Map<String, dynamic>.from(
        (defaults.data as Map?)?.cast<String, dynamic>() ??
            <String, dynamic>{},
      );
      payload.putIfAbsent('ProgramId', () => programId);
    } catch (_) {
      payload = {'ProgramId': programId};
    }
    await _dio.post('/LiveTv/Timers', data: payload);
  }

  @override
  Future<void> cancelTimer(String timerId) async {
    await _dio.delete('/LiveTv/Timers/$timerId');
  }

  @override
  Future<void> cancelSeriesTimer(String seriesTimerId) async {
    await _dio.delete('/LiveTv/SeriesTimers/$seriesTimerId');
  }
}
