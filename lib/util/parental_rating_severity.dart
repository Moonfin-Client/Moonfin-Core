/// Ranks an official rating so grouped libraries can list categories from
/// mildest to strongest instead of alphabetically. Servers hand back whatever
/// the metadata provider used, so the table covers the common boards and the
/// numeric fallback handles the systems that just name a minimum age.
library;

const int kRatingAllAges = 10;
const int kRatingYoungChildren = 20;
const int kRatingGuidance = 30;
const int kRatingTeen = 40;
const int kRatingMature = 50;
const int kRatingAdultsOnly = 60;

/// A rating the table doesn't know. Sorts after everything recognized but
/// before the explicitly unrated bucket, so an unfamiliar board still lands
/// somewhere stable.
const int kRatingUnrecognized = 500;

/// No rating at all. Always sorts last.
const int kRatingUnrated = 999;

/// Ratings whose severity is known outright. Keys are upper-cased and trimmed.
const Map<String, int> _exactSeverities = {
  'UNRATED': kRatingUnrated,
  'NOT RATED': kRatingUnrated,
  'NR': kRatingUnrated,
  'UR': kRatingUnrated,
  'UNKNOWN': kRatingUnrated,
  'OTHER': kRatingUnrated,

  'G': kRatingAllAges,
  'TV-G': kRatingAllAges,
  'TV-Y': kRatingAllAges,
  'Y': kRatingAllAges,
  'E': kRatingAllAges,
  'EC': kRatingAllAges,
  'U': kRatingAllAges,
  'AL': kRatingAllAges,
  'APPROVED': kRatingAllAges,
  'PASSED': kRatingAllAges,

  'PG': kRatingYoungChildren,
  'TV-Y7': kRatingYoungChildren,
  'TV-Y7-FV': kRatingYoungChildren,
  'E10+': kRatingYoungChildren,
  '6': kRatingYoungChildren,
  '7': kRatingYoungChildren,

  'TV-PG': kRatingGuidance,
  'PG-12': kRatingGuidance,
  '10': kRatingGuidance,
  '12': kRatingGuidance,
  '12A': kRatingGuidance,

  'PG-13': kRatingTeen,
  'TV-14': kRatingTeen,
  'T': kRatingTeen,
  '13': kRatingTeen,
  '14': kRatingTeen,
  '14A': kRatingTeen,
  '15': kRatingTeen,
  '15A': kRatingTeen,
  '16': kRatingTeen,

  'R': kRatingMature,
  'TV-MA': kRatingMature,
  'M': kRatingMature,
  'MA': kRatingMature,
  'MA15+': kRatingMature,
  '18': kRatingMature,
  '18+': kRatingMature,
  'R18': kRatingMature,

  'NC-17': kRatingAdultsOnly,
  'R-18': kRatingAdultsOnly,
  'AO': kRatingAdultsOnly,
  'X': kRatingAdultsOnly,
  'XXX': kRatingAdultsOnly,
};

final _leadingDigits = RegExp(r'\d+');

/// Lower is milder. Ratings the table misses fall back to the minimum age named
/// in the string, and then to [kRatingUnrecognized].
int parentalRatingSeverity(String rating) {
  final normalized = rating.toUpperCase().trim();
  if (normalized.isEmpty) return kRatingUnrated;

  final exact = _exactSeverities[normalized];
  if (exact != null) return exact;

  // Board variants the table can't enumerate: TV-Y7-FV and friends, and the
  // regional TV-MA spellings. Y7 is checked first so it doesn't read as TV-Y.
  if (normalized.contains('Y7')) return kRatingYoungChildren;
  if (normalized.contains('TV-Y')) return kRatingAllAges;
  if (normalized.contains('TV-MA') || normalized.contains('RESTRICTED')) {
    return kRatingMature;
  }

  // Numeric boards (DE, FR, NL, the Nordics) name the minimum age outright, so
  // slot them between the named tiers rather than lumping them together.
  final digits = _leadingDigits.firstMatch(normalized)?.group(0);
  final age = digits == null ? null : int.tryParse(digits);
  if (age != null) {
    if (age <= 6) return kRatingAllAges + 5;
    if (age <= 10) return kRatingYoungChildren + 5;
    if (age <= 12) return kRatingGuidance + 2;
    if (age <= 15) return kRatingTeen + 2;
    if (age <= 17) return kRatingMature + 2;
    return kRatingAdultsOnly + 2;
  }

  return kRatingUnrecognized;
}
