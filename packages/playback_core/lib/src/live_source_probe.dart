/// Bringup error code for a live channel the server could not get from its
/// tuner. Set on [PlaybackBringupState.error] when the PlaybackInfo request
/// fails outright for a channel, or when the server answers with the
/// placeholder source it hands back after its own probe of the tuner feed
/// failed. Either way the tuner has already done its retrying, so the viewer
/// can be told the channel is unavailable rather than left on a spinner.
const String liveChannelUnavailableError = 'liveChannelUnavailable';

/// Whether a live media source is the server's probe-failed placeholder.
///
/// Jellyfin opens the tuner stream, waits, and probes it. When the tuner
/// closes the connection without sending anything, the probe fails, but the
/// server still answers PlaybackInfo with HTTP 200 and a stub source: a video
/// stream with no codec and no dimensions, and an audio stream with no codec.
/// Starting a player on that source only produces a failed manifest request a
/// few seconds later, so it is treated as "channel unavailable" up front.
///
/// Audio-only channels carry no video stream at all and are left alone. A real
/// probed source always names a codec and a frame size.
bool liveSourceProbeFailed(List<Map<String, dynamic>> mediaStreams) {
  final video = mediaStreams.where((s) => s['Type'] == 'Video');
  if (video.isEmpty) return false;
  return video.every(_streamIsUnprobed);
}

bool _streamIsUnprobed(Map<String, dynamic> stream) {
  final codec = stream['Codec']?.toString().trim() ?? '';
  return codec.isEmpty && stream['Width'] == null && stream['Height'] == null;
}
