import 'dart:convert';

import 'package:server_core/server_core.dart';

/// Where a download keeps its media segments inside the item JSON it saved,
/// so skip intro and skip credits still work with the server out of reach.
const offlineMediaSegmentsKey = 'MoonfinMediaSegments';

List<Map<String, dynamic>> storedMediaSegments(Map<String, dynamic>? metadata) {
  final segments = metadata?[offlineMediaSegmentsKey];
  if (segments is! List) return const [];
  return [
    for (final segment in segments)
      if (segment is Map) segment.cast<String, dynamic>(),
  ];
}

List<Map<String, dynamic>> storedMediaSegmentsJson(String metadataJson) {
  try {
    final decoded = jsonDecode(metadataJson);
    return decoded is Map<String, dynamic>
        ? storedMediaSegments(decoded)
        : const [];
  } catch (_) {
    return const [];
  }
}

/// [item] with the server's media segments for [itemId] saved into it. Only
/// videos have segments, so nothing else is asked about. When the server
/// can't answer, the [fallback] segments are kept so a refresh never drops
/// ones a download already has.
Future<Map<String, dynamic>> withMediaSegments(
  ItemsApi itemsApi,
  String itemId,
  Map<String, dynamic> item, {
  List<Map<String, dynamic>> Function()? fallback,
}) async {
  if (item['MediaType'] != 'Video') return item;
  List<Map<String, dynamic>> segments;
  try {
    segments = await itemsApi.getMediaSegments(itemId);
  } catch (_) {
    segments = fallback?.call() ?? const [];
  }
  if (segments.isEmpty) return item;
  return {...item, offlineMediaSegmentsKey: segments};
}
