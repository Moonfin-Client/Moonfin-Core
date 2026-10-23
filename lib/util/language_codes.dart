import 'package:server_core/server_core.dart' show kIso6391To6392;

import '../l10n/app_localizations.dart';
import 'locale_names.dart';

export 'package:server_core/server_core.dart' show kIso6391To6392;

/// ISO 639-2 language codes sourced from the Jellyfin/Emby server localization
/// file (Emby.Server.Implementations/Localization/iso6392.txt).
///
/// Keys are ISO 639-2/B three-letter codes (the value stored in
/// AudioLanguagePreference / SubtitleLanguagePreference on the server).
/// Values are English display names.
///
/// The following entries from the full ISO 639-2 list are intentionally
/// excluded from [kIso6392Languages] to keep the picker practical:
///   - Language group/family entries (e.g. "Afro-Asiatic languages")
///   - Ancient/extinct languages with no modern media (Akkadian, Old English,
///     Gothic, Hittite, Sumerian, Ancient Greek, Old Norse, etc.)
///   - Constructed/auxiliary languages with negligible media presence
///     (Afrihili, Ido, Interlingue, Interlingua, Lojban, Klingon, Volapük,
///     Blissymbols; Esperanto is borderline but excluded)
///   - Endangered or very small languages with essentially no media production
///
/// The map is ordered so that the ~20 most common media languages appear first
/// (alphabetically among themselves), followed by the remaining languages in
/// alphabetical order. Dart maps preserve insertion order, so this ordering is
/// reflected directly in the settings picker UI.
///
/// All codes are still present in [kIso6391To6392] for matching purposes,
/// since media files may be tagged with any valid ISO 639 code.
const Map<String, String> kIso6392Languages = {
  // ── Most common media languages (alphabetical) ───────────────────────────
  'ara': 'Arabic',
  'dan': 'Danish',
  'deu': 'German',
  'eng': 'English',
  'fin': 'Finnish',
  'fra': 'French',
  'hin': 'Hindi',
  'ita': 'Italian',
  'jpn': 'Japanese',
  'kor': 'Korean',
  'nld': 'Dutch',
  'nor': 'Norwegian',
  'pol': 'Polish',
  'por': 'Portuguese',
  'rus': 'Russian',
  'spa': 'Spanish',
  'swe': 'Swedish',
  'tha': 'Thai',
  'tur': 'Turkish',
  'zho': 'Chinese',

  // ── All other languages (alphabetical) ───────────────────────────────────
//  'aar': 'Afar',
  'afr': 'Afrikaans',
  'aka': 'Akan',
  'amh': 'Amharic',
  'asm': 'Assamese',
  'aze': 'Azerbaijani',
  'bak': 'Bashkir',
//  'bam': 'Bambara',
  'bel': 'Belarusian',
  'bem': 'Bemba',
  'ben': 'Bengali',
//  'bis': 'Bislama',
  'bod': 'Tibetan',
  'bos': 'Bosnian',
  'bre': 'Breton',
  'bul': 'Bulgarian',
  'cat': 'Catalan',
  'ces': 'Czech',
  'cha': 'Chamorro',
  'che': 'Chechen',
  'chv': 'Chuvash',
//  'cor': 'Cornish',
  'cos': 'Corsican',
  'cre': 'Cree',
  'crh': 'Crimean Tatar',
  'cym': 'Welsh',
  'div': 'Divehi',
  'dzo': 'Dzongkha',
  'ell': 'Greek',
  'est': 'Estonian',
  'eus': 'Basque',
  'ewe': 'Ewe',
  'fao': 'Faroese',
  'fas': 'Persian',
  'fij': 'Fijian',
  'fil': 'Filipino',
  'frc': 'French (Canada)',
//  'fry': 'Western Frisian',
  'ful': 'Fulah',
  'gla': 'Scottish Gaelic',
  'gle': 'Irish',
  'glg': 'Galician',
//  'glv': 'Manx',
  'grn': 'Guarani',
  'guj': 'Gujarati',
  'hat': 'Haitian Creole',
  'hau': 'Hausa',
  'haw': 'Hawaiian',
  'heb': 'Hebrew',
//  'her': 'Herero',
  'hil': 'Hiligaynon',
  'hmn': 'Hmong',
//  'hmo': 'Hiri Motu',
  'hrv': 'Croatian',
  'hun': 'Hungarian',
  'hye': 'Armenian',
  'ibo': 'Igbo',
  'iii': 'Sichuan Yi',
  'iku': 'Inuktitut',
  'ind': 'Indonesian',
//  'inh': 'Ingush',
//  'ipk': 'Inupiaq',
  'isl': 'Icelandic',
  'jav': 'Javanese',
  'kal': 'Kalaallisut',
  'kan': 'Kannada',
  'kas': 'Kashmiri',
  'kat': 'Georgian',
  'kau': 'Kanuri',
  'kaz': 'Kazakh',
  'khm': 'Khmer',
  'kik': 'Kikuyu',
  'kin': 'Kinyarwanda',
  'kir': 'Kyrgyz',
  'kok': 'Konkani',
  'kom': 'Komi',
  'kon': 'Kongo',
  'kua': 'Kuanyama',
//  'kum': 'Kumyk',
  'kur': 'Kurdish',
  'lao': 'Lao',
  'lat': 'Latin',
  'lav': 'Latvian',
  'lim': 'Limburgish',
  'lin': 'Lingala',
  'lit': 'Lithuanian',
  'ltz': 'Luxembourgish',
//  'lub': 'Luba-Katanga',
  'lug': 'Ganda',
  'luo': 'Luo',
//  'mah': 'Marshallese',
  'mal': 'Malayalam',
  'mar': 'Marathi',
  'mkd': 'Macedonian',
  'mlg': 'Malagasy',
  'mlt': 'Maltese',
  'mon': 'Mongolian',
  'mri': 'Maori',
  'msa': 'Malay',
  'mya': 'Burmese',
//  'nau': 'Nauru',
  'nav': 'Navajo',
  'nbl': 'South Ndebele',
  'nde': 'North Ndebele',
  'ndo': 'Ndonga',
  'nds': 'Low German',
  'nep': 'Nepali',
  'new': 'Newari',
  'nno': 'Norwegian Nynorsk',
  'nob': 'Norwegian Bokmål',
  'nya': 'Chichewa',
  'oci': 'Occitan',
  'oji': 'Ojibwa',
  'ori': 'Oriya',
  'orm': 'Oromo',
  'oss': 'Ossetian',
  'pan': 'Punjabi',
//  'pli': 'Pali',
//  'pon': 'Pohnpeian',
  'pus': 'Pashto',
  'que': 'Quechua',
  'roh': 'Romansh',
  'ron': 'Romanian',
  'run': 'Rundi',
//  'sag': 'Sango',
  'san': 'Sanskrit',
  'sin': 'Sinhala',
  'slk': 'Slovak',
  'slv': 'Slovenian',
  'sme': 'Northern Sami',
//  'smo': 'Samoan',
  'sna': 'Shona',
  'snd': 'Sindhi',
  'som': 'Somali',
  'sot': 'Southern Sotho',
  'sqi': 'Albanian',
  'srd': 'Sardinian',
  'srp': 'Serbian',
  'ssw': 'Swati',
  'sun': 'Sundanese',
  'swa': 'Swahili',
  'syr': 'Syriac',
  'tam': 'Tamil',
  'tat': 'Tatar',
  'tel': 'Telugu',
  'tgk': 'Tajik',
  'tgl': 'Tagalog',
  'tir': 'Tigrinya',
//  'ton': 'Tongan',
  'tsn': 'Tswana',
  'tso': 'Tsonga',
  'tuk': 'Turkmen',
//  'twi': 'Twi',
  'uig': 'Uyghur',
  'ukr': 'Ukrainian',
  'urd': 'Urdu',
  'uzb': 'Uzbek',
//  'ven': 'Venda',
  'vie': 'Vietnamese',
  'wol': 'Wolof',
  'xho': 'Xhosa',
  'yid': 'Yiddish',
  'yor': 'Yoruba',
  'zha': 'Zhuang',
  'zul': 'Zulu',
};

/// ISO 639-2 code to display name for every language the app itself is
/// translated into, in [kIso6392Languages] order. The audio and subtitle
/// language pickers all offer this list, each behind its own "none" or
/// "server default" entry.
final Map<String, String> supportedLanguageOptions = Map.unmodifiable(() {
  final iso3ToIso1 = {
    for (final entry in kIso6391To6392.entries) entry.value: entry.key,
  };
  final supportedIso3Codes = {
    for (final locale in AppLocalizations.supportedLocales)
      kIso6391To6392[locale.languageCode] ?? locale.languageCode,
  };
  return {
    for (final entry in kIso6392Languages.entries)
      if (supportedIso3Codes.contains(entry.key))
        entry.key: kLocaleDisplayNames[iso3ToIso1[entry.key]] ?? entry.value,
  };
}());
