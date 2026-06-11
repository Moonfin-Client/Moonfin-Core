import 'dart:convert';

import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import 'playback_exit_beacon.dart';

class PlaySessionService implements PlayerService {
  final MediaServerClient _client;

  PlaySessionService(this._client);

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    final report = PlaybackStartReport(
      itemId: MediaStreamResolver.extractItemId(mediaItem),
      mediaSourceId: resolution.mediaSourceId,
      playSessionId: resolution.playSessionId,
      playMethod: _toPlayMethod(resolution.playMethod),
      positionTicks: positionTicks,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );
    await _client.playbackApi.reportPlaybackStart(report.toJson());
    _armExitBeacon(mediaItem, resolution, positionTicks ?? 0);
  }

  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    final report = PlaybackProgressReport(
      itemId: MediaStreamResolver.extractItemId(mediaItem),
      mediaSourceId: resolution.mediaSourceId,
      playSessionId: resolution.playSessionId,
      positionTicks: position.inMicroseconds * 10,
      isPaused: isPaused,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );
    await _client.playbackApi.reportPlaybackProgress(report.toJson());
    _armExitBeacon(mediaItem, resolution, position.inMicroseconds * 10);
  }

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position,
  ) async {
    PlaybackExitBeacon.disarm();
    final report = _stopReport(
      mediaItem,
      resolution,
      position.inMicroseconds * 10,
    );
    Object? reportError;
    StackTrace? reportStackTrace;
    try {
      await _client.playbackApi.reportPlaybackStopped(report.toJson());
    } catch (error, stackTrace) {
      reportError = error;
      reportStackTrace = stackTrace;
    }

    final liveStreamId = resolution.liveStreamId;
    if (liveStreamId != null && liveStreamId.isNotEmpty) {
      try {
        await _client.playbackApi.closeLiveStream(liveStreamId);
      } catch (_) {}
    }

    if (reportError != null) {
      Error.throwWithStackTrace(reportError, reportStackTrace!);
    }
  }

  void _armExitBeacon(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    int positionTicks,
  ) {
    if (!PlaybackExitBeacon.supported) {
      return;
    }
    final token = _client.accessToken;
    if (token == null || token.isEmpty) {
      return;
    }
    final report = _stopReport(mediaItem, resolution, positionTicks);
    PlaybackExitBeacon.arm(
      url: '${_client.baseUrl}/Sessions/Playing/Stopped?api_key=$token',
      body: jsonEncode(report.toJson()),
    );
  }

  PlaybackStopReport _stopReport(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    int positionTicks,
  ) {
    return PlaybackStopReport(
      itemId: MediaStreamResolver.extractItemId(mediaItem),
      mediaSourceId: resolution.mediaSourceId,
      playSessionId: resolution.playSessionId,
      positionTicks: positionTicks,
    );
  }

  static PlayMethod _toPlayMethod(StreamPlayMethod method) => switch (method) {
    StreamPlayMethod.directPlay => PlayMethod.directPlay,
    StreamPlayMethod.directStream => PlayMethod.directStream,
    StreamPlayMethod.transcode => PlayMethod.transcode,
  };

  @override
  void dispose() {
    PlaybackExitBeacon.disarm();
  }
}
