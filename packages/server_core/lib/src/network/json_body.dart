import 'dart:convert';

/// A response body as a JSON object, or null when it isn't one.
///
/// Dio decodes JSON only when the response says `application/json`. Some
/// servers and proxies send JSON as `text/plain` or with no content type (Silo
/// does this for some error bodies), so a string body is decoded here too
/// instead of failing a cast.
Map<String, dynamic>? asJsonMap(Object? data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return data.map((k, v) => MapEntry(k.toString(), v));
  if (data is String) {
    try {
      final decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) return decoded;
      if (decoded is Map) {
        return decoded.map((k, v) => MapEntry(k.toString(), v));
      }
    } catch (_) {}
  }
  return null;
}

/// [value] trimmed when it is a non-blank string, else null: how a JSON text
/// field that may be missing, null, blank or of another type is read.
String? jsonText(Object? value) {
  if (value is! String) return null;
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}
