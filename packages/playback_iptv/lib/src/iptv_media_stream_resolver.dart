import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

/// Resolves IPTV items to their direct provider stream URLs.
///
/// There's no server-side transcoding or negotiation. The IPTV backend's
/// [PlaybackApi.getPlaybackInfo] synthesizes a single direct-play media
/// source whose `Path` is the fully qualified provider URL.
class IptvMediaStreamResolver implements MediaStreamResolver {
  final MediaServerClient _client;

  IptvMediaStreamResolver(this._client);

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
    final itemId = MediaStreamResolver.extractItemId(mediaItem);

    final info = await _client.playbackApi.getPlaybackInfo(
      itemId,
      userId: _client.userId,
      startTimeTicks: startTimeTicks,
    );

    final sources = (info['MediaSources'] as List?) ?? const [];
    if (sources.isEmpty) {
      throw Exception('No stream URL available for IPTV item $itemId');
    }
    final source = Map<String, dynamic>.from(sources.first as Map);
    final url = source['Path']?.toString() ?? '';
    if (url.isEmpty) {
      throw Exception('Empty stream URL for IPTV item $itemId');
    }

    final container = source['Container']?.toString();
    // rtmp, rtsp and udp URLs are network streams too, only a bare path or
    // file:// URL is on this device.
    final isLocalFile =
        !url.contains('://') || url.toLowerCase().startsWith('file://');

    return StreamResolutionResult(
      streamUrl: url,
      mediaSourceId: source['Id']?.toString() ?? itemId,
      playMethod: StreamPlayMethod.directPlay,
      container: container,
      mediaType: MediaStreamResolver.detectMediaType(
        const [],
        fallbackUrl: url,
      ),
      mediaStreams: const [],
      isLocalMedia: isLocalFile,
    );
  }
}
