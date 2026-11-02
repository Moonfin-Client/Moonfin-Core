/// Prefer Jellyfin/Emby's WebVTT endpoint for server-hosted SRT subtitles.
/// Other URLs stay unchanged so the web player can still convert raw SRT.
final _serverSrtEndpoint = RegExp(
  r'(?:^|/)Videos/[^/]+/[^/]+/Subtitles/\d+/(?:\d+/)?Stream\.srt$',
  caseSensitive: false,
);

String preferServerWebVttSubtitleUrl(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null || !_serverSrtEndpoint.hasMatch(uri.path)) return url;
  if (uri.queryParameters.keys.any((key) => key.toLowerCase() == 'format')) {
    return url; // An explicit format query overrides the URL extension.
  }
  final path = uri.path;
  return uri
      .replace(path: '${path.substring(0, path.length - 4)}.vtt')
      .toString();
}
