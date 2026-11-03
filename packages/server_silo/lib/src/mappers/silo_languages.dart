/// English names of the languages media files are commonly tagged with, for
/// the stream titles Moonfin shows in its track pickers ("English DTS 5.1").
///
/// Silo tags tracks with ISO 639-1 codes (`en`) and sometimes ISO 639-2
/// (`eng`, `ger`/`deu`), and both are listed. A code not listed shows as
/// itself in upper case, which is also what Moonfin's pickers fall back to.
library;

const Map<String, String> _names = {
  'ar': 'Arabic',
  'ara': 'Arabic',
  'bg': 'Bulgarian',
  'bul': 'Bulgarian',
  'bn': 'Bengali',
  'ben': 'Bengali',
  'ca': 'Catalan',
  'cat': 'Catalan',
  'cs': 'Czech',
  'ces': 'Czech',
  'cze': 'Czech',
  'cy': 'Welsh',
  'cym': 'Welsh',
  'wel': 'Welsh',
  'da': 'Danish',
  'dan': 'Danish',
  'de': 'German',
  'deu': 'German',
  'ger': 'German',
  'el': 'Greek',
  'ell': 'Greek',
  'gre': 'Greek',
  'en': 'English',
  'eng': 'English',
  'es': 'Spanish',
  'spa': 'Spanish',
  'et': 'Estonian',
  'est': 'Estonian',
  'eu': 'Basque',
  'eus': 'Basque',
  'baq': 'Basque',
  'fa': 'Persian',
  'fas': 'Persian',
  'per': 'Persian',
  'fi': 'Finnish',
  'fin': 'Finnish',
  'fil': 'Filipino',
  'fr': 'French',
  'fra': 'French',
  'fre': 'French',
  'ga': 'Irish',
  'gle': 'Irish',
  'gl': 'Galician',
  'glg': 'Galician',
  'he': 'Hebrew',
  'heb': 'Hebrew',
  'hi': 'Hindi',
  'hin': 'Hindi',
  'hr': 'Croatian',
  'hrv': 'Croatian',
  'hu': 'Hungarian',
  'hun': 'Hungarian',
  'id': 'Indonesian',
  'ind': 'Indonesian',
  'is': 'Icelandic',
  'isl': 'Icelandic',
  'ice': 'Icelandic',
  'it': 'Italian',
  'ita': 'Italian',
  'ja': 'Japanese',
  'jpn': 'Japanese',
  'ko': 'Korean',
  'kor': 'Korean',
  'lt': 'Lithuanian',
  'lit': 'Lithuanian',
  'lv': 'Latvian',
  'lav': 'Latvian',
  'ms': 'Malay',
  'msa': 'Malay',
  'may': 'Malay',
  'nb': 'Norwegian Bokmål',
  'nob': 'Norwegian Bokmål',
  'nl': 'Dutch',
  'nld': 'Dutch',
  'dut': 'Dutch',
  'nn': 'Norwegian Nynorsk',
  'nno': 'Norwegian Nynorsk',
  'no': 'Norwegian',
  'nor': 'Norwegian',
  'pl': 'Polish',
  'pol': 'Polish',
  'pt': 'Portuguese',
  'por': 'Portuguese',
  'ro': 'Romanian',
  'ron': 'Romanian',
  'rum': 'Romanian',
  'ru': 'Russian',
  'rus': 'Russian',
  'sk': 'Slovak',
  'slk': 'Slovak',
  'slo': 'Slovak',
  'sl': 'Slovenian',
  'slv': 'Slovenian',
  'sr': 'Serbian',
  'srp': 'Serbian',
  'sv': 'Swedish',
  'swe': 'Swedish',
  'ta': 'Tamil',
  'tam': 'Tamil',
  'te': 'Telugu',
  'tel': 'Telugu',
  'th': 'Thai',
  'tha': 'Thai',
  'tr': 'Turkish',
  'tur': 'Turkish',
  'uk': 'Ukrainian',
  'ukr': 'Ukrainian',
  'ur': 'Urdu',
  'urd': 'Urdu',
  'vi': 'Vietnamese',
  'vie': 'Vietnamese',
  'zh': 'Chinese',
  'zho': 'Chinese',
  'chi': 'Chinese',
};

/// The English name of the language [code] (`en`, `eng`, `pt-BR`), its code
/// in upper case when it isn't listed, or null for no code or `und`.
String? siloLanguageName(String? code) {
  if (code == null) return null;
  final trimmed = code.trim();
  if (trimmed.isEmpty) return null;
  final base = trimmed.toLowerCase().split(RegExp('[-_]')).first;
  if (base == 'und' || base == 'zxx' || base == 'mis') return null;
  return _names[base] ?? trimmed.toUpperCase();
}

/// [code] as the ISO 639-1 code Silo tags tracks with (`eng` gives `en`),
/// or as given when no two-letter code shares its name here.
String siloLanguageCode(String code) {
  final lower = code.trim().toLowerCase();
  final name = _names[lower];
  if (lower.length == 2 || name == null) return lower;
  for (final e in _names.entries) {
    if (e.key.length == 2 && e.value == name) return e.key;
  }
  return lower;
}
