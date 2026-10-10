import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

/// Reports playback to Silo.
///
/// Silo registers a session when `playback/start` answers, then takes
/// sequenced progress (`POST /api/v2/playback/{session}/progress`) and an
/// idempotent stop (`DELETE /api/v2/playback/{session}` with a stop id). That
/// lands with the resolver in plan §7 (build step 6). Until a Silo stream can
/// be resolved there is no session to report on, so every call is a no-op.
class SiloPlaySessionService implements PlayerService {
  // ignore: unused_field
  final MediaServerClient _client;

  SiloPlaySessionService(this._client);

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {}

  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? volumeLevel,
    bool? isMuted,
  }) async {}

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async {}

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}
