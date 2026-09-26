import 'dart:async';

import 'package:playback_core/playback_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';
import '../util/audio_artwork_url.dart';
import 'appletv_backend.dart';

/// Keeps the tvOS system Now Playing card (and Siri Remote / Control Center
/// transport) fed for MUSIC.
///
/// Video host screens push their own `setUiMetadata`, but audio-only playback on
/// tvOS presents no native view controller and the full audio screen is popped
/// while browsing, so nothing else feeds the card for music. This listens to the
/// PlaybackManager and pushes the current audio track's metadata to the native
/// NowPlayingController (via the backend's setUiMetadata channel) whenever the
/// track or play state changes.
class AppleTvAudioNowPlayingFeeder {
  AppleTvAudioNowPlayingFeeder({
    required PlaybackManager manager,
    required MediaServerClientFactory clientFactory,
    required AppleTvBackend backend,
  })  : _manager = manager,
        _clientFactory = clientFactory,
        _backend = backend;

  final PlaybackManager _manager;
  final MediaServerClientFactory _clientFactory;
  final AppleTvBackend _backend;
  final _subs = <StreamSubscription>[];

  void start() {
    final s = _manager.state;
    _subs.addAll([
      s.playingStream.listen((_) => _push()),
      s.durationStream.listen((_) => _push()),
      _manager.queueService.queueChangedStream.listen((_) => _push()),
    ]);
  }

  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    _subs.clear();
  }

  void _push() {
    final raw = _manager.queueService.currentItem;
    // Video host screens feed their own Now Playing metadata; only handle audio.
    if (raw is! AggregatedItem || !raw.isAudioLike) return;

    final artist = raw.artists.isNotEmpty
        ? raw.artists.join(', ')
        : (raw.albumArtist ?? raw.album ?? '');

    unawaited(_backend.setUiMetadata(
      topTitle: raw.name,
      topSubtitle: artist,
      chapters: const [],
      hasPrevious: true,
      hasNext: _manager.queueService.hasNext,
      skipForwardMs: 0,
      skipBackMs: 0,
      audioTracks: const [],
      subtitleTracks: const [],
      logoUrl: _artUrl(raw) ?? '',
    ));
  }

  String? _artUrl(AggregatedItem item) => audioArtUrl(
        item,
        clientFactory: _clientFactory,
        maxHeight: 600,
      );
}
