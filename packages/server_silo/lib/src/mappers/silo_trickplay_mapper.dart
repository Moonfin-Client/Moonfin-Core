import 'package:server_core/server_core.dart';

import '../silo_image_registry.dart';
import 'silo_ids.dart';

/// Key in a mapped trickplay entry for when Silo's sheet URLs stop working.
/// Moonfin's `TrickplayInfo` ignores keys it doesn't know.
const siloTrickplayExpiresKey = 'SiloExpiresAt';

/// Silo's seek previews for one file (`WatchTrickplay` from
/// `GET /watch/{id}/trickplay`) as Jellyfin's `Trickplay` item field:
/// `{ <file id>: { "<width>": {Width, Height, TileWidth, TileHeight,
/// ThumbnailCount, Interval, Bandwidth} } }`.
///
/// Both lay thumbnails out the same way: sheet *s* holds thumbnails
/// *s × columns × rows* onward, left to right and top to bottom, each
/// covering `interval_ms`. So Moonfin's tile arithmetic (`TrickplayInfo`)
/// works unchanged. Silo serves one width per file.
///
/// Each sheet URL is recorded in [images] under the **file id** as a
/// [SiloImageType.trickplay] at its sheet index, so
/// `getTrickplayTileImageUrl(itemId, mediaSourceId: fileId, index:)` can
/// answer from the registry. Sheet URLs carry their own authorization
/// and stop working at `expires_at`, kept in the entry under
/// [siloTrickplayExpiresKey], after which the previews are read again.
///
/// Null when the answer has no file id, no size or no sheets.
Map<String, dynamic>? siloTrickplayToJellyfin(
  Map<String, dynamic> trickplay, {
  SiloImageRegistry? images,
}) {
  final fileId = siloIdOf(trickplay['file_id']);
  final width = _int(trickplay['thumbnail_width']);
  final height = _int(trickplay['thumbnail_height']);
  final columns = _int(trickplay['tile_columns']);
  final rows = _int(trickplay['tile_rows']);
  final interval = _int(trickplay['interval_ms']);
  final sheets = trickplay['sheets'];
  if (fileId == null ||
      width == null ||
      height == null ||
      columns == null ||
      rows == null ||
      interval == null ||
      sheets is! List ||
      sheets.isEmpty) {
    return null;
  }

  if (images != null) {
    for (final (position, raw) in sheets.indexed) {
      final sheet = asJsonMap(raw);
      if (sheet == null) continue;
      final index = sheet['index'];
      images.register(
        fileId,
        SiloImageType.trickplay,
        sheet['url'] as String?,
        index: index is int && index >= 0 ? index : position,
      );
    }
  }

  final count = _int(trickplay['thumbnail_count']);
  final expires = trickplay['expires_at'];
  return {
    fileId: {
      '$width': {
        'Width': width,
        'Height': height,
        'TileWidth': columns,
        'TileHeight': rows,
        'ThumbnailCount': count ?? sheets.length * columns * rows,
        'Interval': interval,
        // Jellyfin's estimate for streaming the sheets. Silo gives none.
        'Bandwidth': 0,
        if (expires is String) siloTrickplayExpiresKey: expires,
      },
    },
  };
}

int? _int(Object? value) => value is num && value > 0 ? value.toInt() : null;
