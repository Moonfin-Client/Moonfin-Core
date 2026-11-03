import 'package:server_core/server_core.dart';
import 'silo_ids.dart';
import 'silo_ticks.dart';

/// Silo's extra kinds as Jellyfin's `ExtraType`. Silo's vocabulary is
/// `trailer`, `teaser`, `featurette`, `clip`, `behind_the_scenes`,
/// `bloopers`, `deleted_scene` and `other`.
const Map<String, String> siloExtraTypes = {
  'trailer': 'Trailer',
  'teaser': 'Trailer',
  'featurette': 'Featurette',
  'clip': 'Clip',
  'behind_the_scenes': 'BehindTheScenes',
  'bloopers': 'Short',
  'deleted_scene': 'DeletedScene',
  'other': 'Unknown',
};

/// Whether Moonfin can play Silo's local extras. They play like any title,
/// by their `file_id`. When false, a title's local trailers are left out
/// (`LocalTrailerCount` 0, no `getLocalTrailers`), because Moonfin's trailer
/// button plays a local trailer before a YouTube one and would open a player
/// that plays nothing.
const bool siloLocalTrailersPlayable = true;

/// Whether a Silo extra kind is a trailer (`trailer`, `teaser`).
bool isSiloTrailerKind(Object? kind) => kind == 'trailer' || kind == 'teaser';

/// A local extra (`ItemExtraInfo`: `content_id`, `kind`, `title`,
/// `duration_seconds`, `file_id`) as a Jellyfin video item with its
/// `ExtraType`. Its `content_id` plays through Silo's usual watch flow.
/// Null without an id.
Map<String, dynamic>? siloExtraToBaseItemDto(
  Map<String, dynamic> extra, {
  String? ownerId,
}) {
  final id = siloIdOf(extra['content_id']);
  if (id == null) return null;
  final kind = extra['kind'] is String ? extra['kind'] as String : 'other';
  final title = extra['title'];
  final duration = extra['duration_seconds'];
  final extraType = siloExtraTypes[kind] ?? 'Unknown';
  return {
    'Id': id,
    'Name': jsonText(title) ?? id,
    'Type': extraType == 'Trailer' ? 'Trailer' : 'Video',
    'ExtraType': extraType,
    'MediaType': 'Video',
    'IsFolder': false,
    if (duration is num && duration > 0)
      'RunTimeTicks': secondsToTicks(duration),
    'ParentId': ?ownerId,
    'ImageTags': const <String, String>{},
    'BackdropImageTags': const <String>[],
    '_silo': extra,
  };
}

/// An item's remote trailers (`videos[]`: YouTube and the like) as
/// Jellyfin's `RemoteTrailers` (`{Url, Name}`), trailers and teasers first.
List<Map<String, dynamic>> siloRemoteTrailers(Object? videos) {
  if (videos is! List) return const [];
  final trailers = <Map<String, dynamic>>[];
  final others = <Map<String, dynamic>>[];
  for (final v in videos) {
    if (v is! Map) continue;
    final url = _videoUrl(v['site'], v['site_key']);
    if (url == null) continue;
    final entry = {
      'Url': url,
      if (v['name'] case final String name when name.trim().isNotEmpty)
        'Name': name.trim(),
    };
    (isSiloTrailerKind(v['kind']) ? trailers : others).add(entry);
  }
  return [...trailers, ...others];
}

String? _videoUrl(Object? site, Object? key) {
  if (site is! String || key is! String || key.trim().isEmpty) return null;
  final k = Uri.encodeQueryComponent(key.trim());
  return switch (site.toLowerCase()) {
    'youtube' => 'https://www.youtube.com/watch?v=$k',
    'vimeo' => 'https://vimeo.com/$k',
    _ => null,
  };
}

/// The local extras of a title's detail [item] (`extras[]`) as video items:
/// its trailers and teasers when [trailers], else the other extras.
List<Map<String, dynamic>> siloExtrasOf(
  Map<String, dynamic> item, {
  required bool trailers,
  String? ownerId,
}) {
  final extras = item['extras'];
  return [
    if (extras is List)
      for (final e in extras)
        if (e is Map && isSiloTrailerKind(e['kind']) == trailers)
          if (siloExtraToBaseItemDto(
                e.cast<String, dynamic>(),
                ownerId: ownerId,
              )
              case final extra?)
            extra,
  ];
}
