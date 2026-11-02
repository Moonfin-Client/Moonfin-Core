import 'stream_resolution_result.dart';

/// Why the player wants a new stream for the item it is already playing.
enum ReplanReason {
  /// The viewer picked another audio or subtitle track.
  trackChange,

  /// The viewer changed the quality or the bitrate ceiling.
  qualityChange,

  /// A seek to a position the current stream can't serve.
  seek,

  /// The stream failed, and the player wants another way to play it.
  failure,
}

/// What a replan asks for: the stream the player wants now, given as the
/// same choices a resolve takes.
class ReplanRequest {
  const ReplanRequest({
    required this.reason,
    required this.position,
    this.deviceProfile,
    this.maxStreamingBitrate,
    this.audioStreamIndex,
    this.subtitleStreamIndex,
    this.mediaSourceId,
    this.enableDirectPlay = true,
    this.enableDirectStream = true,
    this.enableTranscoding = true,
  });

  final ReplanReason reason;

  /// Where the new stream should start, on the media's timeline.
  final Duration position;

  final Map<String, dynamic>? deviceProfile;
  final int? maxStreamingBitrate;
  final int? audioStreamIndex;

  /// The subtitle stream index, or -1 for subtitles off.
  final int? subtitleStreamIndex;
  final String? mediaSourceId;
  final bool enableDirectPlay;
  final bool enableDirectStream;
  final bool enableTranscoding;
}

/// A [MediaStreamResolver] that can move a server's playback session to a
/// new stream instead of ending it and starting another.
///
/// Optional: a resolver that doesn't implement it is re-resolved as before
/// (the old session is reported stopped, then a new one resolved). One that
/// does is asked first whenever the player re-resolves the item it is
/// playing, for a track change, a quality change or a failed stream. A
/// server that plans the stream itself (Silo) keeps the session, its
/// progress and its transcode slot that way, and answers faster.
abstract interface class StreamReplanner {
  /// Whether [current] belongs to a session this resolver can still
  /// replan. False hands the change to an ordinary stop and resolve.
  bool canReplan(StreamResolutionResult current);

  /// A new stream for [mediaItem] in place of [current], in the same
  /// session. Throws when the server refuses, and the player then stops
  /// [current] and resolves afresh.
  Future<StreamResolutionResult> replan(
    dynamic mediaItem,
    StreamResolutionResult current,
    ReplanRequest request,
  );
}
