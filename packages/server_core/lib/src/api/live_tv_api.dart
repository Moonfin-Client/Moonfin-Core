import 'package:dio/dio.dart';

/// Reads channel groups from the server's supported source.
abstract interface class ChannelGroupApi {
  Future<ChannelGroupLineup> getChannelGroups({String? userId});
}

/// The grouped response is the authoritative channel list, not an optional
/// plugin lookup. Failures must not fetch the same channels a second time.
abstract interface class DirectChannelGroupApi implements ChannelGroupApi {}

class ChannelGroupLineup {
  final Map<String, Set<String>> groupsByChannelId;

  /// Channels this viewer can access, or null if Moonbase doesn't provide them.
  final List<Map<String, dynamic>>? channels;
  final bool partial;

  /// False if the server doesn't support the channel-group endpoint.
  final bool endpointAvailable;

  /// Channel IDs the tuner couldn't match in a partial response.
  final Set<String>? unresolvedChannelIds;

  /// Null means the plugin couldn't check. An empty set means it found no categories.
  final Set<String>? programmeCategories;

  const ChannelGroupLineup(
    this.groupsByChannelId, {
    this.channels,
    this.partial = false,
    this.endpointAvailable = true,
    this.unresolvedChannelIds,
    this.programmeCategories,
  });

  static Future<ChannelGroupLineup> fetch(Dio dio) async {
    try {
      final response = await dio.get(
        '/Moonfin/LiveTv/ChannelGroups',
        options: Options(receiveTimeout: const Duration(seconds: 6)),
      );
      final data = response.data;
      if (data is! Map ||
          data['supported'] is! bool ||
          data['channels'] is! List) {
        throw const FormatException('Invalid channel group response');
      }
      final channels = <Map<String, dynamic>>[];
      final memberships = <String, Set<String>>{};
      Set<String> labels(List values) => {
        for (final value in values)
          if (value is String && value.trim().isNotEmpty) value.trim(),
      };
      for (final row in data['channels'] as List) {
        if (row is! Map<String, dynamic> ||
            row['Id'] is! String ||
            (row['Id'] as String).isEmpty ||
            row['Name'] is! String ||
            row['groups'] is! List) {
          throw const FormatException('Invalid guide channel');
        }
        channels.add(row);
        final groups = labels(row['groups'] as List);
        if (groups.isNotEmpty) memberships[row['Id'] as String] = groups;
      }
      final unresolved = data['unresolvedChannelIds'];
      final categories = data['programmeCategories'];
      return ChannelGroupLineup(
        memberships,
        channels: channels,
        partial: data['partial'] == true,
        programmeCategories:
            categories is List && categories.every((c) => c is String)
            ? categories.cast<String>().toSet()
            : null,
        unresolvedChannelIds:
            unresolved is List && unresolved.every((id) => id is String)
            ? unresolved.cast<String>().toSet()
            : null,
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        return const ChannelGroupLineup({}, endpointAvailable: false);
      }
      rethrow;
    }
  }
}

abstract class LiveTvApi {
  Future<Map<String, dynamic>> getChannels({
    int? startIndex,
    int? limit,
    String? sortBy,
    String? sortOrder,
    String? fields,
    bool? enableTotalRecordCount,
    String? userId,
  });

  /// A genre flag ([isMovie], [isSeries], [isSports], [isNews], [isKids]) makes
  /// the server return only that genre's programs for the given [channelIds],
  /// so the guide's category chips can walk the lineup in large batches
  /// without pulling every program. Omitting [channelIds] searches every
  /// channel; the guide does not use that form.
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
  });

  /// [isAiring] has to be true for the server to recommend anything. Without
  /// it the endpoint falls back to a plain guide listing sorted by start date,
  /// which is neither filtered to what is on right now nor ranked.
  Future<Map<String, dynamic>> getRecommendedPrograms({
    int? limit,
    bool? isAiring,
  });

  /// A single program, images enabled. [getGuide] disables images for its
  /// whole batch to keep the payload small (issue #666), which also means a
  /// program's own `ImageTags` never comes back from it even when the server
  /// has one on file — this is the only call that can see it.
  Future<Map<String, dynamic>> getProgram(String programId, {String? userId});

  Future<Map<String, dynamic>> getRecordings({
    int? limit,
    String? fields,
    bool? enableImages,
    bool? isSeries,
    bool? isMovie,
    bool? isSports,
    bool? isKids,
  });

  Future<Map<String, dynamic>> getTimers();

  Future<Map<String, dynamic>> getSeriesTimers();

  Future<void> createTimer(String programId);

  /// Records every showing of a program's series, not just this one.
  /// [settings] replaces fields of the server's defaults for the new rule,
  /// such as `RecordNewOnly`.
  Future<void> createSeriesTimer(
    String programId, {
    Map<String, dynamic>? settings,
  });

  Future<Map<String, dynamic>> getSeriesTimer(String seriesTimerId);

  /// The server replaces every field of the rule with [seriesTimer], so pass
  /// the whole rule from [getSeriesTimer] with only the changed fields altered.
  Future<void> updateSeriesTimer(
    String seriesTimerId,
    Map<String, dynamic> seriesTimer,
  );

  Future<void> cancelTimer(String timerId);

  Future<void> cancelSeriesTimer(String seriesTimerId);
}
