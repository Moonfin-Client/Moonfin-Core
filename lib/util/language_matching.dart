import 'language_codes.dart';

bool languageMatchesPreferred(
  String? streamLanguage,
  String preferredNormalized,
  String preferredIso3,
) {
  final stream = normalizeLanguage(streamLanguage);
  if (stream.isEmpty || preferredNormalized.isEmpty) {
    return false;
  }
  if (stream == preferredNormalized) {
    return true;
  }

  final stream3 = toIso3Language(stream);
  return stream3.isNotEmpty && stream3 == preferredIso3;
}

String normalizeLanguage(String? language) {
  if (language == null) {
    return '';
  }
  final normalized = language.trim().toLowerCase();
  if (normalized.isEmpty) {
    return '';
  }
  return normalized.split(RegExp(r'[-_]')).first;
}

String toIso3Language(String language) {
  if (language.length == 3) {
    return _bibliographicCodes[language] ?? language;
  }
  return kIso6391To6392[language] ?? language;
}

// Servers tag tracks with either ISO 639-2 spelling, so ger and deu both come
// out as the terminology code the two letter table maps to.
const _bibliographicCodes = {
  'alb': 'sqi',
  'arm': 'hye',
  'baq': 'eus',
  'bur': 'mya',
  'chi': 'zho',
  'cze': 'ces',
  'dut': 'nld',
  'fre': 'fra',
  'geo': 'kat',
  'ger': 'deu',
  'gre': 'ell',
  'ice': 'isl',
  'mac': 'mkd',
  'mao': 'mri',
  'may': 'msa',
  'per': 'fas',
  'rum': 'ron',
  'slo': 'slk',
  'tib': 'bod',
  'wel': 'cym',
};
