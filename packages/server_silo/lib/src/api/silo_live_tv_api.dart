import 'package:server_core/server_core.dart';

/// Silo does not serve Live TV, guides or recordings, and never will: it is a
/// permanent product boundary of the server. Reads answer with empty results so
/// shared rows render nothing; writes are unsupported. The UI hides Live TV
/// entry points through `FeatureDetector.supportsLiveTv`.
class SiloLiveTvApi implements LiveTvApi {
  const SiloLiveTvApi();

  static Map<String, dynamic> get _empty => {
    'Items': <Map<String, dynamic>>[],
    'TotalRecordCount': 0,
    'StartIndex': 0,
  };

  @override
  Future<Map<String, dynamic>> getChannels({
    int? startIndex,
    int? limit,
    String? sortBy,
    String? sortOrder,
    String? fields,
    bool? enableTotalRecordCount,
    String? userId,
  }) async => _empty;

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
  }) async => _empty;

  @override
  Future<Map<String, dynamic>> getRecommendedPrograms({
    int? limit,
    bool? isAiring,
  }) async => _empty;

  @override
  Future<Map<String, dynamic>> getProgram(
    String programId, {
    String? userId,
  }) => _unsupported();

  @override
  Future<Map<String, dynamic>> getRecordings({
    int? limit,
    String? fields,
    bool? enableImages,
    bool? isSeries,
    bool? isMovie,
    bool? isSports,
    bool? isKids,
  }) async => _empty;

  @override
  Future<Map<String, dynamic>> getTimers() async => _empty;

  @override
  Future<Map<String, dynamic>> getSeriesTimers() async => _empty;

  @override
  Future<void> createTimer(String programId) => _unsupported();

  @override
  Future<void> createSeriesTimer(String programId) => _unsupported();

  @override
  Future<void> cancelTimer(String timerId) => _unsupported();

  @override
  Future<void> cancelSeriesTimer(String seriesTimerId) => _unsupported();

  static Future<T> _unsupported<T>() =>
      Future.error(UnsupportedError('Silo does not support Live TV'));
}
