/// The query carries the server token, so only the origin and path go in a
/// report a user uploads.
String loggableUrl(String url) {
  final parsed = Uri.tryParse(url);
  if (parsed == null) return 'unparsable url';
  final port = parsed.hasPort ? ':${parsed.port}' : '';
  return '${parsed.scheme}://${parsed.host}$port${parsed.path}';
}
