import 'package:server_core/server_core.dart';

import '../../l10n/app_localizations.dart';
import '../../l10n/current_app_localizations.dart';

/// Formats a role for an episode guest star using localized template.
String formatGuestStarRole(AppLocalizations l10n, String? role) {
  final clean = role?.trim();
  if (clean == null || clean.isEmpty) {
    return l10n.guestStar;
  }
  if (clean.toLowerCase().contains(l10n.guestStar.toLowerCase()) ||
      clean.toLowerCase().contains('guest')) {
    return clean;
  }
  return l10n.guestStarWithRole(clean);
}

/// Formats a role for an episode director using localized template.
String formatEpisodeDirectorRole(AppLocalizations l10n, String? role) {
  final clean = role?.trim();
  if (clean == null ||
      clean.isEmpty ||
      clean.toLowerCase() == 'director' ||
      clean.toLowerCase() == l10n.director.toLowerCase() ||
      clean.toLowerCase() == l10n.episodeDirector.toLowerCase()) {
    return l10n.episodeDirector;
  }
  return l10n.episodeDirectorWithRole(clean);
}

/// Formats a role for an episode writer using localized template.
String formatEpisodeWriterRole(AppLocalizations l10n, String? role) {
  final clean = role?.trim();
  if (clean == null ||
      clean.isEmpty ||
      clean.toLowerCase() == 'writer' ||
      clean.toLowerCase() == l10n.writer.toLowerCase() ||
      clean.toLowerCase() == l10n.episodeWriter.toLowerCase()) {
    return l10n.episodeWriter;
  }
  return l10n.episodeWriterWithRole(clean);
}

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
/// guest star designation, their role is formatted via [formatGuestStarRole].
/// Parent actors follow, deduplicated so any person already present in the episode
/// cast is not repeated.
List<Map<String, dynamic>> mergeEpisodeCast({
  required List<Map<String, dynamic>> episodeActors,
  required List<Map<String, dynamic>> parentActors,
  AppLocalizations? l10n,
}) {
  final localizations = l10n ?? currentAppLocalizations();
  final formattedEpisodeActors = episodeActors.map((p) {
    final isGuest = p['Type'] == 'GuestStar';
    if (!isGuest) return p;
    final role = p['Role']?.toString();
    final formattedRole = formatGuestStarRole(localizations, role);
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
/// 1. Episode cast (Guest Stars first, formatted with [formatGuestStarRole]).
/// 2. Parent regular cast (deduplicated).
/// 3. Episode crew (Directors formatted with [formatEpisodeDirectorRole], Writers with [formatEpisodeWriterRole]).
List<Map<String, dynamic>> mergeEpisodePeople({
  required List<Map<String, dynamic>> episodePeople,
  required List<Map<String, dynamic>> parentActors,
  AppLocalizations? l10n,
}) {
  final localizations = l10n ?? currentAppLocalizations();
  final episodeCast = <Map<String, dynamic>>[];
  final episodeCrew = <Map<String, dynamic>>[];

  for (final p in episodePeople) {
    final type = p['Type'] as String?;
    if (type == 'Actor' || type == 'GuestStar') {
      final isGuest = type == 'GuestStar';
      final role = p['Role']?.toString();
      if (isGuest) {
        final formattedRole = formatGuestStarRole(localizations, role);
        episodeCast.add(<String, dynamic>{...p, 'Role': formattedRole});
      } else {
        episodeCast.add(p);
      }
    } else if (type == 'Director') {
      final role = p['Role']?.toString();
      final formattedRole = formatEpisodeDirectorRole(localizations, role);
      episodeCrew.add(<String, dynamic>{...p, 'Role': formattedRole});
    } else if (type == 'Writer') {
      final role = p['Role']?.toString();
      final formattedRole = formatEpisodeWriterRole(localizations, role);
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
