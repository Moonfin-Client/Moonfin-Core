import 'package:server_core/server_core.dart';

import 'silo_ids.dart';
import 'silo_languages.dart';

/// Silo's catalog filter document (`GET /catalog/filters`) as Moonfin's
/// facet values, so the filter picker only offers what the library holds.
///
/// Silo lists genres, content ratings and (under `technical`) the audio and
/// subtitle languages of the files. Languages come with their English names.
/// It has no year list and no tags, so those sections stay hidden.
QueryFilterValues siloFiltersToQueryFilterValues(Map<String, dynamic> json) {
  List<String> strings(Object? raw) => [
    if (raw is List)
      for (final v in raw) ?jsonText(v),
  ];
  List<NamedFilterValue> languages(Object? raw) => [
    for (final code in strings(raw))
      if (siloLanguageName(code) case final name?)
        NamedFilterValue(name: name, value: code),
  ];
  final technical = asJsonMap(json['technical']) ?? const <String, dynamic>{};
  return QueryFilterValues(
    genres: strings(json['genres']),
    officialRatings: strings(json['content_ratings']),
    audioLanguages: languages(technical['audio_languages']),
    subtitleLanguages: languages(technical['subtitle_languages']),
  );
}

/// One rule of a Silo catalog rule group (`{field, op, value}`).
Map<String, Object?> _rule(String field, String op, Object? value) => {
  'field': field,
  'op': op,
  'value': value,
};

/// A group matching any of [rules], or null for none.
Map<String, Object?>? _any(List<Map<String, Object?>> rules) =>
    rules.isEmpty ? null : {'match': 'any', 'rules': rules};

/// Moonfin's `getItems` filters as Silo catalog rule groups (`groups`), which
/// combine with `match=all`: every filter must hold, any value within one.
///
/// | Moonfin | Silo rule |
/// |---|---|
/// | `genres`, genre ids (`silo-genre:`) | `genre is` |
/// | `studios`, studio ids (`silo-studio:`) | `studio is` or `network is` |
/// | `years` | `year is` |
/// | `officialRatings` | `content_rating is` |
/// | `filters`: `IsPlayed` / `IsUnplayed` | `watched is true` / `false` |
/// | `filters`: `IsResumable` | `in_progress is true` |
/// | `filters`: `IsFavorite`, `isFavorite` | `favorited is true` |
/// | `filters`: `IsInWatchlist` (Silo only) | `in_watchlist is true` |
/// | `is4K` | `resolution is 2160p` (or `is_not`) |
/// | `isHd` | `resolution is 1080p/720p` (false: neither, nor 4K) |
/// | `audioLanguages`, `subtitleLanguages` | `audio_language` / `subtitle_language is` |
///
/// Filters Silo has no rule for (`Likes`/`Dislikes`, tags, trailers,
/// extras, theme media, video types, `hasSubtitles`, 3D) are left out.
List<Map<String, Object?>> siloRuleGroups({
  List<String>? genres,
  List<String>? genreIds,
  List<int>? years,
  List<String>? officialRatings,
  List<String>? studios,
  List<String>? studioIds,
  List<String>? filters,
  bool? isFavorite,
  bool? is4K,
  bool? isHd,
  List<String>? audioLanguages,
  List<String>? subtitleLanguages,
}) {
  final genreNames = {
    ...?genres,
    for (final id in genreIds ?? const <String>[]) siloGenreNameOf(id) ?? id,
  };
  // Moonfin's studio is a studio for films and a network for series. Silo
  // keeps the two apart, so either matches.
  final studioNames = {
    ...?studios,
    for (final id in studioIds ?? const <String>[]) siloStudioNameOf(id) ?? id,
  };
  final flags = {for (final f in filters ?? const <String>[]) f.toLowerCase()};

  final groups = <Map<String, Object?>?>[
    _any([for (final g in genreNames) _rule('genre', 'is', g)]),
    _any([for (final y in years ?? const <int>[]) _rule('year', 'is', y)]),
    _any([
      for (final r in officialRatings ?? const <String>[])
        _rule('content_rating', 'is', r),
    ]),
    _any([
      for (final s in studioNames) ...[
        _rule('studio', 'is', s),
        _rule('network', 'is', s),
      ],
    ]),
    if (flags.contains('isplayed')) _any([_rule('watched', 'is', true)]),
    if (flags.contains('isunplayed')) _any([_rule('watched', 'is', false)]),
    if (flags.contains('isresumable')) _any([_rule('in_progress', 'is', true)]),
    if (isFavorite == true || flags.contains('isfavorite'))
      _any([_rule('favorited', 'is', true)]),
    if (flags.contains('isinwatchlist'))
      _any([_rule('in_watchlist', 'is', true)]),
    if (is4K != null)
      _any([_rule('resolution', is4K ? 'is' : 'is_not', '2160p')]),
    if (isHd == true)
      _any([
        _rule('resolution', 'is', '1080p'),
        _rule('resolution', 'is', '720p'),
      ]),
    if (isHd == false)
      for (final r in const ['2160p', '1080p', '720p'])
        _any([_rule('resolution', 'is_not', r)]),
    _any([
      for (final l in audioLanguages ?? const <String>[])
        _rule('audio_language', 'is', l),
    ]),
    _any([
      for (final l in subtitleLanguages ?? const <String>[])
        _rule('subtitle_language', 'is', l),
    ]),
  ];
  return groups.whereType<Map<String, Object?>>().toList();
}

/// Jellyfin series status (`Continuing`, `Ended`) of a mapped item, for the
/// series-status filter Silo has no rule for. It's applied to each page.
bool siloMatchesSeriesStatus(Map<String, dynamic> item, List<String> wanted) {
  if (wanted.isEmpty || item['Type'] != 'Series') return true;
  final status = item['Status'] as String?;
  return status != null && wanted.contains(status);
}

/// A genre, studio or network name as a Jellyfin item (`Genre` or `Studio`)
/// with its synthetic id. Silo names them but gives them no id or
/// artwork, so Moonfin's genre and studio cards fall back to artwork from
/// their titles.
Map<String, dynamic> siloNamedItem(String name, {required bool studio}) => {
  'Id': studio ? siloStudioId(name) : siloGenreId(name),
  'Name': name,
  'SortName': name,
  'Type': studio ? 'Studio' : 'Genre',
  'IsFolder': true,
  'ImageTags': const <String, String>{},
  'BackdropImageTags': const <String>[],
};
