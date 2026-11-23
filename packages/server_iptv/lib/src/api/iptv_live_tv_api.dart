import 'package:drift/drift.dart' show Value;
import 'package:server_core/server_core.dart';

import '../db/iptv_database.dart';
import '../ids.dart';
import '../iptv_backend.dart';
import '../mapping/item_mapper.dart';
import '../repositories/epg_repository.dart' show channelEpgKey;
import '../repositories/recordings_repository.dart' show IptvRecordingStatus;
import '../repositories/watch_state_repository.dart' show IptvItemKind;
import '../services/catchup_url_builder.dart' show channelSupportsCatchupAt;

class IptvLiveTvApi implements LiveTvApi {
  final IptvBackend _backend;

  IptvLiveTvApi(this._backend);

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
    final profileId = _backend.activeProfileId;

    final total = enableTotalRecordCount == false
        ? null
        : await _backend.channels.countLiveChannels(profileId: profileId);
    if (limit == 0) {
      return IptvItemMapper.itemsResult([], totalRecordCount: total);
    }

    // Any other sort keeps import order, which follows playlist numbering.
    final channels = await _backend.channels.getLiveChannelsPage(
      profileId: profileId,
      byName: sortBy == 'SortName' || sortBy == 'Name',
      descending: sortOrder?.toLowerCase() == 'descending',
      offset: startIndex ?? 0,
      limit: limit,
    );

    final favoriteIds = profileId == null
        ? const <int>{}
        : (await _backend.watchState.getFavoriteRefIds(
            profileId,
            IptvItemKind.channel,
            among: [for (final c in channels) c.id],
          )).toSet();

    // Current-program lookup runs for the visible page only, a full-lineup
    // EPG join is far too heavy on huge playlists.
    Map<String, EpgProgram?> currentByTvgId = const {};
    final tvgIds = <String>{for (final c in channels) channelEpgKey(c)};
    if (tvgIds.isNotEmpty && tvgIds.length <= 600) {
      final now = DateTime.now();
      final programs = await _backend.epg.getProgramsForChannels(
        tvgIds.toList(),
        now,
        now,
      );
      // Guides can overlap, and the latest starting one is what's on now.
      currentByTvgId = {
        for (final entry in programs.entries) entry.key: entry.value.lastOrNull,
      };
    }

    return IptvItemMapper.itemsResult([
      for (final c in channels)
        IptvItemMapper.channelToMap(
          c,
          isFavorite: favoriteIds.contains(c.id),
          currentProgram: currentByTvgId[channelEpgKey(c)],
        ),
    ], totalRecordCount: total);
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
    if (channelIds == null || channelIds.isEmpty) {
      return IptvItemMapper.emptyItemsResult();
    }

    final rowIds = {
      for (final encoded in channelIds)
        if (IptvId.tryParse(encoded) case IptvChannelId(:final channelRowId))
          channelRowId,
    };
    // Channels that share a tvg id, like HD and SD twins, each get the guide.
    final channels = await _backend.channels.getChannelsByIds(rowIds.toList());
    if (channels.isEmpty) return IptvItemMapper.emptyItemsResult();

    final now = DateTime.now();
    final start = startDate ?? now;
    final end = endDate ?? now.add(const Duration(hours: 24));
    final programsByTvg = await _backend.epg.getProgramsForChannels(
      {for (final c in channels) channelEpgKey(c)}.toList(),
      start,
      end,
    );
    final withoutGuide = <String, String>{};
    for (final c in channels) {
      final key = channelEpgKey(c);
      if (programsByTvg[key]?.isNotEmpty != true) {
        withoutGuide.putIfAbsent(key, () => c.name);
      }
    }
    if (withoutGuide.isNotEmpty) {
      await _backend.epg.ensureFallbackPrograms(withoutGuide, start, end);
      programsByTvg.addAll(
        await _backend.epg.getProgramsForChannels(
          withoutGuide.keys.toList(),
          start,
          end,
        ),
      );
    }

    final activeSchedules = await _backend.recordings.getActiveSchedules();
    final timerByChannelStart = {
      for (final schedule in activeSchedules)
        (schedule.channelId, schedule.programStart): IptvTimerId(
          scheduleRowId: schedule.id,
        ).encode(),
    };

    final items = <Map<String, dynamic>>[];
    for (final channel in channels) {
      for (final program in programsByTvg[channelEpgKey(channel)] ?? const []) {
        items.add(
          IptvItemMapper.programToMap(
            program,
            channel: channel,
            supportsCatchup: channelSupportsCatchupAt(
              channel,
              program.startTime,
              now,
            ),
            timerId: timerByChannelStart[(channel.id, program.startTime)],
          ),
        );
      }
    }
    return IptvItemMapper.itemsResult(items);
  }

  @override
  Future<Map<String, dynamic>> getRecommendedPrograms({
    int? limit,
    bool? isAiring,
  }) async {
    final profileId = _backend.activeProfileId;
    if (profileId == null) {
      return IptvItemMapper.emptyItemsResult();
    }
    final favoriteIds = await _backend.watchState.getFavoriteRefIds(
      profileId,
      IptvItemKind.channel,
    );
    if (favoriteIds.isEmpty) return IptvItemMapper.emptyItemsResult();

    final channels = await _backend.channels.getChannelsByIds(favoriteIds);
    final now = DateTime.now();
    final onNow = await _backend.epg.getProgramsForChannels(
      {for (final c in channels) channelEpgKey(c)}.toList(),
      now,
      now,
    );
    final items = <Map<String, dynamic>>[];
    for (final channel in channels) {
      if (limit != null && items.length >= limit) break;
      final current = onNow[channelEpgKey(channel)]?.lastOrNull;
      if (current == null) continue;
      items.add(IptvItemMapper.programToMap(current, channel: channel));
    }
    return IptvItemMapper.itemsResult(items);
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
    var recordings = await _backend.recordings.getCompletedRecordings();
    if (limit != null && recordings.length > limit) {
      recordings = recordings.sublist(0, limit);
    }
    return IptvItemMapper.itemsResult([
      for (final recording in recordings)
        IptvItemMapper.recordingToMap(recording),
    ]);
  }

  @override
  Future<Map<String, dynamic>> getTimers() async {
    final schedules = await _backend.recordings.getActiveSchedules();
    final channelIds = {for (final s in schedules) s.channelId};
    final channels = await _backend.channels.getChannelsByIds(
      channelIds.toList(),
    );
    final nameById = {for (final c in channels) c.id: c.name};
    return IptvItemMapper.itemsResult([
      for (final schedule in schedules)
        IptvItemMapper.timerToMap(
          schedule,
          channelName: nameById[schedule.channelId],
        ),
    ]);
  }

  @override
  Future<Map<String, dynamic>> getSeriesTimers() async =>
      IptvItemMapper.emptyItemsResult();

  // Guide programs already carry everything the local catalog knows.
  @override
  Future<Map<String, dynamic>> getProgram(
    String programId, {
    String? userId,
  }) async => {};

  @override
  Future<void> createSeriesTimer(
    String programId, {
    Map<String, dynamic>? settings,
  }) => throw UnsupportedError('Series recordings are not supported on IPTV');

  @override
  Future<Map<String, dynamic>> getSeriesTimer(String seriesTimerId) async => {};

  @override
  Future<void> updateSeriesTimer(
    String seriesTimerId,
    Map<String, dynamic> seriesTimer,
  ) => throw UnsupportedError('Series recordings are not supported on IPTV');

  @override
  Future<void> createTimer(String programId) async {
    final parsed = IptvId.tryParse(programId);
    if (parsed is! IptvProgramId) return;
    final program = await _backend.epg.getProgramById(parsed.programRowId);
    final channel = await _backend.channels.getChannelById(parsed.channelRowId);
    if (program == null || channel == null) return;

    final existing = await _backend.recordings.findActiveSchedule(
      channel.id,
      program.startTime,
    );
    if (existing != null) return;

    await _backend.recordings.insertSchedule(
      ScheduledRecordingsCompanion.insert(
        playlistId: channel.playlistId,
        channelId: channel.id,
        title: program.title,
        programStart: program.startTime,
        programEnd: program.endTime,
      ),
    );
  }

  @override
  Future<void> cancelTimer(String timerId) async {
    final parsed = IptvId.tryParse(timerId);
    if (parsed is! IptvTimerId) return;
    // Marked canceled instead of deleted so an in-progress recording job
    // notices and stops on its next check.
    await _backend.recordings.updateSchedule(
      parsed.scheduleRowId,
      const ScheduledRecordingsCompanion(
        status: Value(IptvRecordingStatus.cancelled),
      ),
    );
  }

  @override
  Future<void> cancelSeriesTimer(String seriesTimerId) async {}
}
