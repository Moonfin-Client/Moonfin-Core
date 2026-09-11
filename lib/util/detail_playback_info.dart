import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

/// Asks the server how it would play [itemId] with the tracks the detail
/// screen currently has selected, which is what the direct play indicator
/// reads. Deciding when to call this, and what to do when it throws, is left
/// to the screen, because each one caches the answer differently.
Future<PlaybackInfoResult> fetchDetailPlaybackInfo({
  required String itemId,
  required String? mediaSourceId,
  required int? audioStreamIndex,
  required int? subtitleStreamIndex,
}) async {
  final client = GetIt.instance<MediaServerClient>();
  final profile =
      GetIt.instance<PlaybackManager>().backend?.getDeviceProfile() ??
      <String, dynamic>{};

  final request = PlaybackInfoRequest(
    itemId: itemId,
    mediaSourceId: mediaSourceId,
    audioStreamIndex: audioStreamIndex,
    subtitleStreamIndex: subtitleStreamIndex,
    deviceProfile: profile,
    // Cast receiver profiles can carry this as a double, so read it as a
    // number rather than an int.
    maxStreamingBitrate: (profile['MaxStreamingBitrate'] as num?)?.toInt(),
    enableDirectPlay: true,
    enableDirectStream: true,
    enableTranscoding: true,
  );

  final raw = await client.playbackApi.getPlaybackInfo(
    itemId,
    requestBody: request.toJson(),
    userId: client.userId,
  );

  return PlaybackInfoResult.fromJson(raw);
}
