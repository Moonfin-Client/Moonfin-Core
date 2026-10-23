import 'package:playback_core/playback_core.dart';

import '../data/offline/connectivity_aware_media_server_client.dart';
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
  final Future<void> Function(String itemId)? _restoreSubtitles;
  final bool Function()? _streamFromServer;

  LocalFirstMediaStreamResolver({
    required MediaStreamResolver inner,
    required OfflineStreamResolver offline,
    Future<void> Function(String itemId)? restoreSubtitles,
    bool Function()? streamFromServer,
  }) : _inner = inner,
       _offline = offline,
       _restoreSubtitles = restoreSubtitles,
       _streamFromServer = streamFromServer;

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
      // A play from server pick skips the download, unless the server is out
      // of reach and the download is the only copy left.
      final skipLocal =
          (_streamFromServer?.call() ?? false) && !shouldUseOfflineCatalog();
      final local = skipLocal
          ? null
          : await _tryResolveLocal(mediaItem, mediaSourceId);
      if (local != null) return local;
      // With no local copy and no server, the network resolve below just
      // burns through its timeouts before failing anyway. TV now has both
      // downloads and the offline catalog, so the offline-failure throw applies
      // there too.
      if (shouldUseOfflineCatalog()) {
        throw StateError(
          'No playable downloaded copy and the server is unreachable',
        );
      }
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
      await _restoreMissingSubtitles(itemId);
      final local = await _offline.resolve(itemId);
      if (local == null) return null;

      // An explicit alternate-version selection must stream that version.
      if (requestedMediaSourceId != null &&
          requestedMediaSourceId.isNotEmpty &&
          requestedMediaSourceId != local.mediaSourceId &&
          requestedMediaSourceId != itemId) {
        return null;
      }

      // A transcoded download holds one video and one audio track and no
      // embedded subtitles, so the stored original-file metadata would list
      // phantom tracks in the selectors. Its sidecars are real though, and an
      // empty list puts them out of reach of both the track picker and the
      // stream index to player track mapping that turns a selection into a
      // player call, so it describes those and nothing else.
      final mediaStreams = local.isTranscoded
          ? [
              for (final sub in local.externalSubtitles)
                <String, dynamic>{
                  'Type': 'Subtitle',
                  'Index': sub.index,
                  'IsExternal': true,
                  'Codec': sub.codec,
                  'Title': sub.title,
                  'Language': sub.language,
                },
            ]
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

  // Fills in subtitle files an earlier download missed. The wait is capped so
  // a slow server extraction finishes in the background instead of holding
  // up playback.
  Future<void> _restoreMissingSubtitles(String itemId) async {
    final restore = _restoreSubtitles;
    if (restore == null || shouldUseOfflineCatalog()) return;
    try {
      await restore(itemId).timeout(const Duration(seconds: 5));
    } catch (_) {}
  }

  String? _containerOf(String path) {
    final dot = path.lastIndexOf('.');
    if (dot < 0 || dot == path.length - 1) return null;
    return path.substring(dot + 1).toLowerCase();
  }
}
