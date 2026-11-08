import 'package:server_core/server_core.dart';

/// Resolves parent actors for an episode or season.
///
/// For an episode:
/// 1. If [seasonId] is provided, attempts to fetch season people and extract
///    actors (`Type == 'Actor'` or `'GuestStar'`).
/// 2. If no season actors are found and [seriesId] is provided, attempts to
///    fetch series people and extract actors.
///
/// For a season:
/// 1. If [seriesId] is provided, attempts to fetch series people and extract
///    actors.
Future<List<Map<String, dynamic>>> resolveParentCast({
  required MediaServerClient client,
  String? seasonId,
  String? seriesId,
}) async {
  if (seasonId != null && seasonId.isNotEmpty) {
    try {
      final data = await client.itemsApi.getItem(seasonId);
      final people = (data['People'] as List?)
          ?.whereType<Map>()
          .map((p) => p.cast<String, dynamic>())
          .toList(growable: false);
      final actors = people?.where((p) {
        final t = p['Type'] as String?;
        return t == 'Actor' || t == 'GuestStar';
      }).toList(growable: false);
      if (actors != null && actors.isNotEmpty) {
        return actors;
      }
    } catch (_) {}
  }

  if (seriesId != null && seriesId.isNotEmpty) {
    try {
      final data = await client.itemsApi.getItem(seriesId);
      final people = (data['People'] as List?)
          ?.whereType<Map>()
          .map((p) => p.cast<String, dynamic>())
          .toList(growable: false);
      final actors = people?.where((p) {
        final t = p['Type'] as String?;
        return t == 'Actor' || t == 'GuestStar';
      }).toList(growable: false);
      if (actors != null && actors.isNotEmpty) {
        return actors;
      }
    } catch (_) {}
  }

  return const <Map<String, dynamic>>[];
}

/// Merges episode-specific actors with parent (season or series) actors.
///
/// Episode guest stars (`Type == 'GuestStar'`) and episode actors appear first.
/// If an actor's type is `'GuestStar'` and their role does not already include
/// "Guest Star", their role is suffixed with `(Guest Star)` or set to `Guest Star`.
/// Parent actors follow, deduplicated so any person already present in the episode
/// cast is not repeated.
List<Map<String, dynamic>> mergeEpisodeCast({
  required List<Map<String, dynamic>> episodeActors,
  required List<Map<String, dynamic>> parentActors,
}) {
  final formattedEpisodeActors = episodeActors.map((p) {
    final isGuest = p['Type'] == 'GuestStar';
    if (!isGuest) return p;
    final role = p['Role']?.toString().trim();
    if (role != null && role.toLowerCase().contains('guest')) return p;
    final formattedRole = (role != null && role.isNotEmpty)
        ? '$role (Guest Star)'
        : 'Guest Star';
    return <String, dynamic>{...p, 'Role': formattedRole};
  }).toList();

  final existingKeys = <String>{};
  for (final p in formattedEpisodeActors) {
    final id = p['Id']?.toString();
    final name = p['Name']?.toString();
    if (id != null && id.isNotEmpty) existingKeys.add(id);
    if (name != null && name.isNotEmpty) existingKeys.add(name);
  }

  final merged = [...formattedEpisodeActors];
  for (final p in parentActors) {
    final id = p['Id']?.toString();
    final name = p['Name']?.toString();
    if ((id != null && existingKeys.contains(id)) ||
        (name != null && existingKeys.contains(name))) {
      continue;
    }
    merged.add(p);
  }

  return merged;
}

/// Merges episode people with parent actors for playback Cast & Crew views.
///
/// Returns:
/// 1. Episode cast (Guest Stars first, formatted with `(Guest Star)`).
/// 2. Parent regular cast (deduplicated).
/// 3. Episode crew (Directors formatted with `Episode Director`, Writers with `Episode Writer`).
List<Map<String, dynamic>> mergeEpisodePeople({
  required List<Map<String, dynamic>> episodePeople,
  required List<Map<String, dynamic>> parentActors,
}) {
  final episodeCast = <Map<String, dynamic>>[];
  final episodeCrew = <Map<String, dynamic>>[];

  for (final p in episodePeople) {
    final type = p['Type'] as String?;
    if (type == 'Actor' || type == 'GuestStar') {
      final isGuest = type == 'GuestStar';
      final role = p['Role']?.toString().trim();
      if (isGuest && (role == null || !role.toLowerCase().contains('guest'))) {
        final formattedRole = (role != null && role.isNotEmpty)
            ? '$role (Guest Star)'
            : 'Guest Star';
        episodeCast.add(<String, dynamic>{...p, 'Role': formattedRole});
      } else {
        episodeCast.add(p);
      }
    } else if (type == 'Director') {
      final role = p['Role']?.toString().trim();
      final formattedRole = (role != null &&
              role.isNotEmpty &&
              !role.toLowerCase().contains('director'))
          ? '$role (Episode Director)'
          : 'Episode Director';
      episodeCrew.add(<String, dynamic>{...p, 'Role': formattedRole});
    } else if (type == 'Writer') {
      final role = p['Role']?.toString().trim();
      final formattedRole = (role != null &&
              role.isNotEmpty &&
              !role.toLowerCase().contains('writer'))
          ? '$role (Episode Writer)'
          : 'Episode Writer';
      episodeCrew.add(<String, dynamic>{...p, 'Role': formattedRole});
    } else {
      episodeCrew.add(p);
    }
  }

  final existingKeys = <String>{};
  for (final p in episodeCast) {
    final id = p['Id']?.toString();
    final name = p['Name']?.toString();
    if (id != null && id.isNotEmpty) existingKeys.add(id);
    if (name != null && name.isNotEmpty) existingKeys.add(name);
  }

  final mergedCast = [...episodeCast];
  for (final p in parentActors) {
    final id = p['Id']?.toString();
    final name = p['Name']?.toString();
    if ((id != null && existingKeys.contains(id)) ||
        (name != null && existingKeys.contains(name))) {
      continue;
    }
    mergedCast.add(p);
  }

  return [...mergedCast, ...episodeCrew];
}

