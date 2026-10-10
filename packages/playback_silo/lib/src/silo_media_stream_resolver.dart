import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

/// Resolves a Silo item to a playable stream.
///
/// Silo decides the route on the server: the client posts its codec evidence
/// to `POST /api/v2/playback/start` and receives one plan (delivery, signed
/// stream URL, subtitle sidecars, timeline, session id). That translation is
/// plan §7 (build step 6). Until then playback refuses with a clear message.
class SiloMediaStreamResolver implements MediaStreamResolver {
  // ignore: unused_field
  final MediaServerClient _client;

  SiloMediaStreamResolver(this._client);

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
  }) {
    return Future.error(
      UnsupportedError('Playback from Silo is not available yet in this build'),
    );
  }
}
