import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';

/// Picks one backdrop per shortcut so the tiles carry artwork rather than a
/// flat colour. Movies and Series get a still of their own kind, the rest take
/// whatever is left, and nothing repeats while there is still art to go round.
Map<SeerrShortcut, String> pickShortcutBackdrops({
  required List<SeerrShortcut> shortcuts,
  required List<String> movieBackdrops,
  required List<String> tvBackdrops,
}) {
  final used = <String>{};
  final picked = <SeerrShortcut, String>{};

  String? take(List<String> preferred, List<String> fallback) {
    for (final list in [preferred, fallback]) {
      for (final path in list) {
        if (used.add(path)) return path;
      }
    }
    return null;
  }

  // The tiles with no kind of their own alternate between the two pools, so
  // the row does not end up all movie stills.
  final mixed = <String>[];
  for (var i = 0; i < movieBackdrops.length || i < tvBackdrops.length; i++) {
    if (i < tvBackdrops.length) mixed.add(tvBackdrops[i]);
    if (i < movieBackdrops.length) mixed.add(movieBackdrops[i]);
  }

  // Movies and Series claim first, so a short pool cannot leave them bare
  // while a tile with no kind of its own takes the only still.
  for (final shortcut in shortcuts) {
    final art = switch (shortcut) {
      SeerrShortcut.movies => take(movieBackdrops, tvBackdrops),
      SeerrShortcut.series => take(tvBackdrops, movieBackdrops),
      _ => null,
    };
    if (art != null) picked[shortcut] = art;
  }
  for (final shortcut in shortcuts) {
    if (picked.containsKey(shortcut)) continue;
    final art = take(mixed, const []);
    if (art != null) picked[shortcut] = art;
  }
  return picked;
}

/// The places the Seerr shortcuts row can jump to.
enum SeerrShortcut {
  discover,
  movies,
  series,
  requests,
  issues;

  /// What the discover screen's copy of the row offers, since that screen is
  /// the destination the Discover tile would point at.
  static List<SeerrShortcut> get withoutDiscover =>
      values.where((v) => v != discover).toList();

  static SeerrShortcut? fromName(String? name) {
    for (final value in values) {
      if (value.name == name) return value;
    }
    return null;
  }

  String label(AppLocalizations l10n) => switch (this) {
    discover => l10n.discover,
    movies => l10n.movies,
    series => l10n.series,
    requests => l10n.seerrRequestsTitle,
    issues => l10n.seerrIssuesTitle,
  };

  IconData get icon => switch (this) {
    discover => Icons.explore,
    movies => Icons.movie,
    series => Icons.tv,
    requests => Icons.playlist_add_check,
    issues => Icons.report_problem_outlined,
  };

  void open(BuildContext context) {
    switch (this) {
      case discover:
        context.push(Destinations.seerrDiscover);
      case movies:
        _openBrowse(context, 'movie');
      case series:
        _openBrowse(context, 'tv');
      case requests:
        context.push(Destinations.seerrRequests);
      case issues:
        context.push('${Destinations.seerrRequests}?tab=issues');
    }
  }

  void _openBrowse(BuildContext context, String mediaType) {
    context.push(
      Uri(
        path: Destinations.seerrBrowse,
        queryParameters: {
          'filterName': label(AppLocalizations.of(context)),
          'mediaType': mediaType,
        },
      ).toString(),
    );
  }
}
