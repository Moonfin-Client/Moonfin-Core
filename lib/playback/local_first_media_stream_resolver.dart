import 'package:playback_core/playback_core.dart';

import 'offline_stream_resolver.dart';

/// Resolver that serves a completed download's local file instead of a
/// server stream whenever one exists, falling back to the wrapped server
/// resolver otherwise.
///
/// Because every playback entry point (detail play/resume, home autoplay,
/// up-next auto-advance, shuffle, CarPlay) funnels through
/// `PlaybackManager._playCurrentItem` -> `resolver.resolve(item)` per queue
/// item, wrapping here gives local-first behavior everywhere, including mixed
/// queues where only some episodes are downloaded.
class LocalFirstMediaStreamResolver extends MediaStreamResolver {
  final MediaStreamResolver _inner;
  final OfflineStreamResolver _offline;

  LocalFirstMediaStreamResolver({
    required MediaStreamResolver inner,
    required OfflineStreamResolver offline,
  }) : _inner = inner,
       _offline = offline;

  @override
  Future<StreamResolutionResult> resolve(
    dynamic mediaItem, {
    Map<String, dynamic>? deviceProfile,
    int? maxStreamingBitrate,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startTimeTicks,
    String? mediaSourceId,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async {
    // Only substitute the local copy on direct-play-eligible requests.
    // Force-transcode requests disable direct play and should keep streaming.
    if (enableDirectPlay) {
      final local = await _tryResolveLocal(mediaItem, mediaSourceId);
      if (local != null) return local;
    }
    return _inner.resolve(
      mediaItem,
      deviceProfile: deviceProfile,
      maxStreamingBitrate: maxStreamingBitrate,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      startTimeTicks: startTimeTicks,
      mediaSourceId: mediaSourceId,
      enableDirectPlay: enableDirectPlay,
      enableDirectStream: enableDirectStream,
      enableTranscoding: enableTranscoding,
    );
  }

  Future<StreamResolutionResult?> _tryResolveLocal(
    dynamic mediaItem,
    String? requestedMediaSourceId,
  ) async {
    try {
      final itemId = MediaStreamResolver.extractItemId(mediaItem);
      final local = await _offline.resolve(itemId);
      if (local == null) return null;

      // An explicit alternate-version selection must stream that version.
      if (requestedMediaSourceId != null &&
          requestedMediaSourceId.isNotEmpty &&
          requestedMediaSourceId != local.mediaSourceId &&
          requestedMediaSourceId != itemId) {
        return null;
      }

      // A transcoded download has a different stream layout than the stored
      // original-file metadata, so don't feed misleading track indices to the
      // selectors. The player picks its own defaults from the file.
      final mediaStreams = local.isTranscoded
          ? const <Map<String, dynamic>>[]
          : local.mediaStreams;

      return StreamResolutionResult(
        streamUrl: local.url,
        mediaSourceId: local.mediaSourceId,
        playMethod: StreamPlayMethod.directPlay,
        container: _containerOf(local.url),
        mediaType: MediaStreamResolver.detectMediaType(
          local.mediaStreams,
          fallbackUrl: local.url,
        ),
        normalizationGainDb: MediaStreamResolver.extractNormalizationGainDb(
          local.mediaStreams,
        ),
        externalSubtitles: [
          for (final sub in local.externalSubtitles)
            ExternalSubtitle(
              // The player accepts a local sidecar file path here as-is.
              deliveryUrl: sub.path,
              title: sub.title,
              language: sub.language,
              codec: sub.codec ?? 'srt',
              streamIndex: sub.index,
            ),
        ],
        mediaStreams: mediaStreams,
        isLocalMedia: true,
      );
    } catch (_) {
      return null;
    }
  }

  String? _containerOf(String path) {
    final dot = path.lastIndexOf('.');
    if (dot < 0 || dot == path.length - 1) return null;
    return path.substring(dot + 1).toLowerCase();
  }
}
