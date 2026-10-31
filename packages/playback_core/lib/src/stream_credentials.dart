import 'stream_resolution_result.dart';

/// What a stream's requests authenticate with: the URL (which may carry a
/// token in its query) and the headers sent on every request.
class StreamCredentials {
  const StreamCredentials({
    required this.streamUrl,
    this.requestHeaders = const {},
  });

  /// The credentials [resolution] was opened with.
  factory StreamCredentials.of(StreamResolutionResult resolution) =>
      StreamCredentials(
        streamUrl: resolution.streamUrl,
        requestHeaders: resolution.requestHeaders,
      );

  final String streamUrl;
  final Map<String, String> requestHeaders;

  @override
  bool operator ==(Object other) {
    if (other is! StreamCredentials || other.streamUrl != streamUrl) {
      return false;
    }
    final theirs = other.requestHeaders;
    if (theirs.length != requestHeaders.length) return false;
    for (final entry in requestHeaders.entries) {
      if (theirs[entry.key] != entry.value) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(
    streamUrl,
    Object.hashAllUnordered(
      requestHeaders.entries.map((e) => Object.hash(e.key, e.value)),
    ),
  );
}

/// A [MediaStreamResolver] whose streams authenticate with an account token
/// that expires while they play.
///
/// The token is fixed when the player opens the stream, while the app keeps
/// renewing its own. A title longer than what was left of the token stops
/// with the server refusing the player's requests. A resolver that
/// implements this hands the player the renewed credentials during
/// playback, through [PlayerBackend.updateStreamCredentials].
///
/// Optional: a resolver whose streams never expire (Jellyfin and Emby keep
/// an API key valid for good) doesn't implement it.
abstract interface class StreamCredentialRefresher {
  /// The credentials [current]'s stream should carry now: its URL and
  /// headers with the account's current token in them. Null when [current]
  /// isn't a stream of this resolver's, or there is no token to give.
  ///
  /// With [refresh] the token is renewed first, even if it has time left,
  /// for a server that has just refused it.
  Future<StreamCredentials?> currentCredentials(
    StreamResolutionResult current, {
    bool refresh = false,
  });
}
