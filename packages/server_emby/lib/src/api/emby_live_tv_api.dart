import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyLiveTvApi implements LiveTvApi, DirectChannelGroupApi {
  final Dio _dio;
  static const _postChannelIdsThreshold = 1800;

  EmbyLiveTvApi(this._dio);

  /// Emby already exposes the M3U group names as channel tags.
  /// Fetch the user-scoped lineup once and preserve complete labels.
  @override
  Future<ChannelGroupLineup> getChannelGroups({String? userId}) async {
    final response = await getChannels(
      sortBy: 'SortName',
      sortOrder: 'Ascending',
      fields: 'ImageTags,UserData,Tags',
      enableTotalRecordCount: false,
      userId: userId,
    );
    final items = response['Items'];
    if (items is! List) {
      throw const FormatException('Invalid Emby Live TV channels response');
    }

    final channels = <Map<String, dynamic>>[];
    final groups = <String, Set<String>>{};
    Set<String> names(Iterable<dynamic> values) => {
      for (final name in values)
        if (name is String && name.trim().isNotEmpty) name.trim(),
    };
    for (final item in items) {
      if (item is! Map<String, dynamic> ||
          item['Id'] is! String ||
          (item['Id'] as String).isEmpty ||
          item['Name'] is! String) {
        throw const FormatException('Invalid Emby Live TV channel');
      }
      channels.add(item);
      final tagged = item['TagItems'];
      final labels = tagged is List
          ? names(tagged.map((tag) => tag is Map ? tag['Name'] : null))
          : <String>{};
      if (labels.isEmpty && item['Tags'] is List) {
        labels.addAll(names(item['Tags'] as List));
      }
      if (labels.isNotEmpty) groups[item['Id'] as String] = labels;
    }
    return ChannelGroupLineup(groups, channels: channels);
  }

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
    await _dio.delete('/LiveTv/Timers/$timerId');
  }

  @override
  Future<void> cancelSeriesTimer(String seriesTimerId) async {
    await _dio.delete('/LiveTv/SeriesTimers/$seriesTimerId');
  }
}
