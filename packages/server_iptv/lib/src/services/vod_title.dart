import 'dart:convert' show utf8;

class CleanedTitle {
  const CleanedTitle(this.title, this.year);
  final String title;
  final int? year;
}

final _trailingYear = RegExp(
  r'(?:\s+-\s+((?:19|20)\d{2})|\s*\(((?:19|20)\d{2})\))\s*$',
);

/// Panels often add the release year to a name, as in "Heat - 1995" or
/// "Heat (1995)". This takes off only that, so a name like "ATL" or
/// "CSI - Vegas" comes back as the panel wrote it.
CleanedTitle splitTitleYear(String raw) {
  final trimmed = raw.trim();
  final match = _trailingYear.firstMatch(trimmed);
  if (match == null || match.start == 0) return CleanedTitle(trimmed, null);
  return CleanedTitle(
    trimmed.substring(0, match.start),
    int.parse(match.group(1) ?? match.group(2)!),
  );
}

final _episodeLead = RegExp(
  r'^.*?\bS\d{1,3}\s*E\d{1,4}\b\s*[-:|.]?\s*',
  caseSensitive: false,
);

/// Panels often repeat the show and number in an episode title, as in
/// "The Office - S01E02 - The Wake". Returns "The Wake", or null when nothing
/// is left after the number.
String? episodeTitleOnly(String raw) {
  final trimmed = raw.trim();
  final match = _episodeLead.firstMatch(trimmed);
  if (match == null) return trimmed.isEmpty ? null : trimmed;
  final rest = trimmed.substring(match.end).trim();
  return rest.isEmpty ? null : rest;
}

/// A search-friendly title, with quality tags, brackets and language
/// prefixes taken off as well.
CleanedTitle cleanVodTitle(String raw) {
  final split = splitTitleYear(raw);
  var s = split.title;
  var year = split.year;
  // Without a year suffix, the first year in the name stands in for it. With
  // one, a year inside the title belongs to it, as in "Blade Runner 2049".
  if (year == null) {
    final yearPattern = RegExp(r'\b(19|20)\d{2}\b');
    year = int.tryParse(yearPattern.firstMatch(s)?.group(0) ?? '');
    s = s.replaceAll(yearPattern, ' ');
  }

  // Only a two letter code counts as a language tag, so "CSI - Vegas" stays.
  s = s.replaceAll(RegExp(r'^\s*[\[\(\|]?[A-Z]{2}[\]\)\|]?\s*[-:|]\s+'), '');
  s = s.replaceAll(RegExp(r'[\(\[\{][^\)\]\}]*[\)\]\}]'), ' ');
  s = s.replaceAll(
    RegExp(
      r'\b(4K|UHD|FHD|HD|SD|HQ|HEVC|H\.?265|H\.?264|X265|X264|10BIT|DV|HDR|DOLBY|ATMOS|MULTI|DUAL|SUB|SUBBED|DUBBED|VOSTFR|TRUEFRENCH)\b',
      caseSensitive: false,
    ),
    ' ',
  );
  s = s.replaceAll(RegExp(r'[._]+'), ' ');
  s = s.replaceAll(RegExp(r'\s{2,}'), ' ').trim();
  s = s.replaceAll(RegExp(r'^[\s\-:|]+|[\s\-:|]+$'), '').trim();

  return CleanedTitle(s.isEmpty ? raw.trim() : s, year);
}

/// Provider genre strings mix separators, like "Action, Drama / Thriller".
List<String> splitGenres(String? genre) => [
  for (final part in (genre ?? '').split(RegExp(r'[,/|]')))
    if (part.trim().isNotEmpty) part.trim(),
];

/// 32-bit FNV-1a over the lowercased UTF-8 genre name. Unlike String.hashCode
/// it stays the same across SDK versions and platforms.
int genreHash(String name) {
  var hash = 0x811c9dc5;
  for (final byte in utf8.encode(name.toLowerCase())) {
    hash ^= byte;
    // The prime is 2^24 + 403, split up so no step passes 2^53 on the web.
    hash = (((hash << 24) & 0xffffffff) + hash * 403) & 0xffffffff;
  }
  return hash;
}
