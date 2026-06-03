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
    return language;
  }
  return kIso6391To6392[language] ?? language;
}
