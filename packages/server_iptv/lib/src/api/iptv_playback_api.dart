import 'package:server_core/server_core.dart';

import '../ids.dart';
import '../iptv_backend.dart';
import '../mapping/item_mapper.dart' show IptvItemMapper;
import '../services/catchup_url_builder.dart';
import '../services/stream_url_builder.dart';

/// Synthesizes direct-play media sources from the local catalog and persists
/// playback reports as per-profile local watch state.
class IptvPlaybackApi implements PlaybackApi {
  final IptvBackend _backend;

  IptvPlaybackApi(this._backend);

  @override
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  }) async {
    final url = await _resolveDirectUrl(itemId);
    if (url == null || url.isEmpty) {
      return {
        'MediaSources': <Map<String, dynamic>>[],
        'ErrorCode': 'NotFound',
      };
    }
    // Only live channel URLs come without an extension, and Xtream live is
    // MPEG-TS, so hint that for players that pick a demuxer by container.
    final container = _containerFromUrl(url) ?? 'ts';
    return {
      'MediaSources': [
        {
          'Id': itemId,
          'Path': url,
          'Protocol': 'Http',
          // IsRemote makes the app's stream resolvers play Path as is
          // instead of rewriting it into a server-relative URL.
          'IsRemote': true,
          'SupportsDirectPlay': true,
          'SupportsDirectStream': false,
          'SupportsTranscoding': false,
          'Container': container,
          'MediaStreams': <Map<String, dynamic>>[],
        },
      ],
      'PlaySessionId': null,
    };
  }

  Future<String?> _resolveDirectUrl(String itemId) async {
    switch (IptvId.tryParse(itemId)) {
      case IptvChannelId(:final channelRowId):
        final channel = await _backend.channels.getChannelById(channelRowId);
        return channel == null ? null : _backend.channelStreamUrl(channel);

      case IptvVodId(:final vodRowId):
        final item = await _backend.vod.getVodById(vodRowId);
        if (item == null) return null;
        final creds = await _backend.xtreamCredentialsFor(item.playlistId);
        if (creds == null) return null;
        return xtreamVodStreamUrl(
          creds,
          item.streamId,
          containerExtension: item.containerExtension ?? 'mp4',
        );

      case IptvEpisodeId(:final episodeRowId):
        final episode = await _backend.vod.getEpisodeByRowId(episodeRowId);
        if (episode == null) return null;
        final creds = await _backend.xtreamCredentialsFor(episode.playlistId);
        if (creds == null) return null;
        return xtreamSeriesStreamUrl(
          creds,
          episode.episodeId,
          containerExtension: episode.containerExtension ?? 'mp4',
        );

      case IptvProgramId(:final programRowId, :final channelRowId):
        return _resolveCatchupUrl(programRowId, channelRowId);

      case IptvRecordingId(:final recordingRowId):
        final recording = await _backend.recordings.getRecordingById(
          recordingRowId,
        );
        return recording?.filePath;

      default:
        return null;
    }
  }

  /// A guide program plays through the channel's archive when it's still
  /// within the catchup window.
  Future<String?> _resolveCatchupUrl(int programRowId, int channelRowId) async {
    final program = await _backend.epg.getProgramById(programRowId);
    final channel = await _backend.channels.getChannelById(channelRowId);
    if (program == null ||
        channel == null ||
        !channelSupportsCatchupAt(channel, program.startTime, DateTime.now())) {
      return null;
    }

    final xtreamStreamId = xtreamLiveStreamId(channel.streamUrl);
    if (xtreamStreamId == null) {
      return buildCatchupUrl(
        streamUrl: channel.streamUrl,
        catchupMode: channel.catchupMode,
        catchupSource: channel.catchupSource,
        start: program.startTime,
        end: program.endTime,
      );
    }
    final creds = await _backend.xtreamCredentialsFor(channel.playlistId);
    if (creds == null) return null;
    return xtreamTimeshiftUrl(
      creds,
      xtreamStreamId,
      start: program.startTime,
      end: program.endTime,
      serverOffset: await _backend.xtreamServerOffset(
        channel.playlistId,
        creds,
      ),
    );
  }

  String? _containerFromUrl(String url) {
    // Only the last segment, since a dot in a password earlier in the path
    // isn't an extension.
    final last = (Uri.tryParse(url)?.path ?? url).split('/').last;
    final dot = last.lastIndexOf('.');
    if (dot < 0 || dot == last.length - 1) return null;
    final ext = last.substring(dot + 1).toLowerCase();
    if (ext.length > 5) return null;
    return ext;
  }

  @override
  String getStreamUrl(
    String itemId, {
    String? mediaSourceId,
    String? audioStreamIndex,
    String? subtitleStreamIndex,
    String? liveStreamId,
  }) {
    // Synchronous URL building would need credentials from secure storage.
    // All real playback flows go through getPlaybackInfo instead.
    return '';
  }

  @override
  Future<void> reportPlaybackStart(Map<String, dynamic> info) =>
      _recordProgress(info, starting: true);

  @override
  Future<void> reportPlaybackProgress(Map<String, dynamic> info) =>
      _recordProgress(info);

  @override
  Future<void> reportPlaybackStopped(Map<String, dynamic> info) =>
      _recordProgress(info);

  Future<void> _recordProgress(
    Map<String, dynamic> info, {
    bool starting = false,
  }) async {
    final profileId = _backend.activeProfileId;
    if (profileId == null) return;

    final itemId = info['ItemId']?.toString();
    if (itemId == null) return;
    final positionTicks = (info['PositionTicks'] as num?)?.toInt() ?? 0;
    final positionMs = positionTicks ~/ IptvItemMapper.ticksPerMs;
    final runtimeTicks = (info['RunTimeTicks'] as num?)?.toInt();
    final durationMs = runtimeTicks != null
        ? runtimeTicks ~/ IptvItemMapper.ticksPerMs
        : null;

    final parsed = IptvId.tryParse(itemId);
    switch (parsed) {
      case IptvChannelId(:final channelRowId):
        // Tuning in is the zap, so progress ticks add nothing. M3U movie
        // files are channel rows too, but they aren't channels to zap to.
        if (!starting) return;
        final channel = await _backend.channels.getChannelById(channelRowId);
        if (channel == null || channel.isVod) return;
        await _backend.watchState.recordChannelZap(
          profileId: profileId,
          channelId: channelRowId,
        );

      case IptvVodId(:final vodRowId):
        final item = await _backend.vod.getVodById(vodRowId);
        await _backend.watchState.upsertMovieProgress(
          profileId: profileId,
          vodItemId: vodRowId,
          positionMs: positionMs,
          durationMs: durationMs ?? _secondsToMs(item?.durationSeconds),
        );

      case IptvEpisodeId(:final episodeRowId):
        final episode = await _backend.vod.getEpisodeByRowId(episodeRowId);
        if (episode == null) return;
        await _backend.watchState.upsertEpisodeProgress(
          profileId: profileId,
          episodeId: episodeRowId,
          positionMs: positionMs,
          durationMs: durationMs ?? _secondsToMs(episode.durationSeconds),
        );

      default:
        return;
    }
  }

  static int? _secondsToMs(int? seconds) =>
      seconds == null ? null : seconds * 1000;

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopActiveEncodings({
    required String deviceId,
    String? playSessionId,
  }) async {}
}
