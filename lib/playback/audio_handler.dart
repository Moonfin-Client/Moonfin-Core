import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart' hide RepeatMode;
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';
import '../util/platform_detection.dart';

class MoonfinAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  final PlaybackManager _manager;
  final MediaServerClientFactory _clientFactory;

  final List<StreamSubscription> _subs = [];

  DateTime? _lastPositionPush;

  MoonfinAudioHandler(this._manager, this._clientFactory) {
    _bindStreams();
  }

  void _bindStreams() {
    final s = _manager.state;
    final q = _manager.queueService;

    _subs.addAll([
      s.playingStream.listen((_) => _pushPlaybackState()),
      s.bufferingStream.listen((_) => _pushPlaybackState()),
      // Keep the lock-screen / notification scrubber advancing during steady
      // playback. positionStream fires several times a second, so throttle the
      // pushes to ~1 Hz to avoid flooding the platform channel.
      s.positionStream.listen((_) {
        final now = DateTime.now();
        final last = _lastPositionPush;
        if (last != null &&
            now.difference(last) < const Duration(seconds: 1)) {
          return;
        }
        _lastPositionPush = now;
        _pushPlaybackState();
      }),
      s.durationStream.listen((_) => _pushMediaItemForCurrentTrack()),
      q.queueChangedStream.listen((_) {
        _pushQueue();
        _pushMediaItemForCurrentTrack();
        _pushPlaybackState();
      }),
    ]);
  }

  bool _drivesSession(dynamic raw) {
    if (raw is! AggregatedItem) return false;
    if (PlatformDetection.isTV) return raw.isAudioLike;
    return true;
  }

  void _pushPlaybackState() {
    final s = _manager.state;
    final q = _manager.queueService;

    if (PlatformDetection.isTV && !_drivesSession(q.currentItem)) {
      // No music session (TV video / nothing playing): emit idle so audio_service
      // tears down the foreground notification and system controls.
      playbackState.add(PlaybackState(
        controls: const [],
        systemActions: const {},
        processingState: AudioProcessingState.idle,
        playing: false,
      ));
      return;
    }

    final controls = [
      MediaControl.skipToPrevious,
      s.isPlaying ? MediaControl.pause : MediaControl.play,
      MediaControl.skipToNext,
    ];

    playbackState.add(PlaybackState(
      controls: controls,
      systemActions: const {
        MediaAction.seek,
        MediaAction.play,
        MediaAction.pause,
        MediaAction.playPause,
        MediaAction.stop,
        MediaAction.skipToNext,
        MediaAction.skipToPrevious,
        MediaAction.fastForward,
        MediaAction.rewind,
        MediaAction.setRepeatMode,
        MediaAction.setShuffleMode,
      },
      androidCompactActionIndices: const [0, 1, 2],
      processingState: s.isBuffering
          ? AudioProcessingState.buffering
          : q.currentItem != null
              ? AudioProcessingState.ready
              : AudioProcessingState.idle,
      playing: s.isPlaying,
      updatePosition: s.position,
      bufferedPosition: s.buffer,
      speed: s.playbackSpeed,
      queueIndex: q.currentIndex,
    ));
  }

  void _pushMediaItemForCurrentTrack() {
    final raw = _manager.queueService.currentItem;
    if (raw is! AggregatedItem || (PlatformDetection.isTV && !raw.isAudioLike)) {
      mediaItem.add(null);
      return;
    }
    mediaItem.add(_mediaItemFor(raw));
  }

  void _pushQueue() {
    final items = _manager.queueService.items;
    queue.add(items
        .whereType<AggregatedItem>()
        .map(_mediaItemFor)
        .toList());
  }

  MediaItem _mediaItemFor(AggregatedItem item) {
    final client = _clientFor(item);
    String? artUri;
    try {
      final albumTag = item.albumPrimaryImageTag;
      final albumId = item.albumId;
      if (item.type == 'Audio' && albumTag != null && albumId != null) {
        artUri = client.imageApi
            .getPrimaryImageUrl(albumId, maxHeight: 300, tag: albumTag);
      } else if (item.primaryImageTag != null) {
        artUri = client.imageApi
            .getPrimaryImageUrl(item.id, maxHeight: 300, tag: item.primaryImageTag);
      }
    } catch (_) {}

    return MediaItem(
      id: item.id,
      title: item.name,
      artist: item.artists.isNotEmpty ? item.artists.join(', ') : item.albumArtist,
      album: item.album,
      duration: item.runtime,
      artUri: artUri != null ? Uri.parse(artUri) : null,
      extras: {'serverId': item.serverId},
    );
  }

  MediaServerClient _clientFor(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  @override
  Future<void> play() async => _manager.resume();

  @override
  Future<void> pause() async => _manager.pause();

  @override
  Future<void> stop() async {
    for (final sub in _subs) {
      sub.cancel();
    }
    _subs.clear();
    await _manager.stop(userInitiated: false);
    await super.stop();
  }

  @override
  Future<void> seek(Duration position) async => _manager.seekTo(position);

  @override
  Future<void> skipToNext() async => _manager.next();

  @override
  Future<void> skipToPrevious() async => _manager.previous();

  @override
  Future<void> skipToQueueItem(int index) async =>
      _manager.playFromQueue(index);

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    final target = switch (repeatMode) {
      AudioServiceRepeatMode.none => RepeatMode.none,
      AudioServiceRepeatMode.one => RepeatMode.repeatOne,
      AudioServiceRepeatMode.all ||
      AudioServiceRepeatMode.group =>
        RepeatMode.repeatAll,
    };
    while (_manager.queueService.repeatMode != target) {
      _manager.toggleRepeat();
    }
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    final wantShuffle = shuffleMode != AudioServiceShuffleMode.none;
    if (_manager.state.isShuffled != wantShuffle) _manager.toggleShuffle();
  }
}

Future<void> initAudioService({
  required PlaybackManager manager,
  required MediaServerClientFactory clientFactory,
}) async {
  await AudioService.init<MoonfinAudioHandler>(
    builder: () => MoonfinAudioHandler(manager, clientFactory),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.moonfin.app.audio',
      androidNotificationChannelName: 'Music Playback',
      androidNotificationOngoing: false,
      androidStopForegroundOnPause: false,
      notificationColor: const Color(0xFF1A1A2E),
      androidNotificationIcon: 'drawable/ic_notification',
    ),
  );
}
