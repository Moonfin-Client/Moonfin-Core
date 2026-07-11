import 'package:playback_core/playback_core.dart';

import '../data/repositories/offline_repository.dart';

/// Decorates the server play-session service so local-file playback keeps the
/// downloads DB position current (the source of truth for offline resume) and
/// only talks to the server when it's reachable.
///
/// The manager fires these callbacks unawaited, so server failures while
/// offline must be swallowed here. The sync service flushes the locally
/// recorded progress on reconnect.
class LocalAwarePlayerService implements PlayerService {
  final PlayerService _inner;
  final OfflineRepository _offlineRepo;
  final bool Function() _canReachServer;

  LocalAwarePlayerService(
    this._inner,
    this._offlineRepo, {
    required bool Function() canReachServer,
  }) : _canReachServer = canReachServer;

  Future<void> _recordLocal(dynamic mediaItem, int positionTicks) async {
    try {
      final itemId = MediaStreamResolver.extractItemId(mediaItem);
      await _offlineRepo.updatePlaybackPosition(itemId, positionTicks);
    } catch (_) {}
  }

  Future<void> _forward(Future<void> Function() report) async {
    if (!_canReachServer()) return;
    try {
      await report();
    } catch (_) {}
  }

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    if (!resolution.isLocalMedia) {
      return _inner.onPlaybackStart(
        mediaItem,
        resolution,
        positionTicks: positionTicks,
        audioStreamIndex: audioStreamIndex,
        subtitleStreamIndex: subtitleStreamIndex,
      );
    }
    await _forward(
      () => _inner.onPlaybackStart(
        mediaItem,
        resolution,
        positionTicks: positionTicks,
        audioStreamIndex: audioStreamIndex,
        subtitleStreamIndex: subtitleStreamIndex,
      ),
    );
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
    if (!resolution.isLocalMedia) {
      return _inner.onPlaybackProgress(
        mediaItem,
        resolution,
        position,
        isPaused: isPaused,
        audioStreamIndex: audioStreamIndex,
        subtitleStreamIndex: subtitleStreamIndex,
      );
    }
    await _recordLocal(mediaItem, position.inMicroseconds * 10);
    await _forward(
      () => _inner.onPlaybackProgress(
        mediaItem,
        resolution,
        position,
        isPaused: isPaused,
        audioStreamIndex: audioStreamIndex,
        subtitleStreamIndex: subtitleStreamIndex,
      ),
    );
  }

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position,
  ) async {
    if (!resolution.isLocalMedia) {
      return _inner.onPlaybackStop(mediaItem, resolution, position);
    }
    await _recordLocal(mediaItem, position.inMicroseconds * 10);
    await _forward(
      () => _inner.onPlaybackStop(mediaItem, resolution, position),
    );
  }

  @override
  Future<void> closeLiveStream(String liveStreamId) =>
      _inner.closeLiveStream(liveStreamId);

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {
    if (resolution.isLocalMedia) return;
    return _inner.stopTranscoding(resolution);
  }

  @override
  void dispose() => _inner.dispose();
}
