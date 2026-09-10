abstract class PlaybackApi {
  Future<void> reportPlaybackStart(Map<String, dynamic> info);
  Future<void> reportPlaybackProgress(Map<String, dynamic> info);
  Future<void> reportPlaybackStopped(Map<String, dynamic> info);
  Future<void> closeLiveStream(String liveStreamId);

  /// Stops any active transcoding jobs for this device, optionally scoped to
  /// one play session. Default: no-op for servers without the endpoint.
  Future<void> stopActiveEncodings({
    required String deviceId,
    String? playSessionId,
  }) async {}

  /// Set [waitForMediaProbe] when the caller is committed to playing. The server
  /// may have to probe the media before it can answer, and on a source it has to
  /// reach across the network for that outlasts the read window the rest of the
  /// API is sized for. A caller only reporting what a source would do leaves it
  /// off and keeps the usual window.
  Future<Map<String, dynamic>> getPlaybackInfo(
    String itemId, {
    Map<String, dynamic>? requestBody,
    String? userId,
    int? startTimeTicks,
    bool waitForMediaProbe = false,
  });

  String getStreamUrl(
    String itemId, {
    String? mediaSourceId,
    String? audioStreamIndex,
    String? subtitleStreamIndex,
    String? liveStreamId,
  });
}
