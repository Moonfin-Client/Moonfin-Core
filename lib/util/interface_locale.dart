import 'dart:ui';

/// Generic Portuguese is an alias of European Portuguese; Brazil stays explicit.
String normalizeInterfaceLanguageTag(String tag) {
  final normalized = tag.trim().replaceAll('_', '-');
  final portuguese = RegExp(
    r'^pt(?:-([a-z]{4}))?(?:-([a-z]{2}|[0-9]{3}))?(?:-.*)?$',
    caseSensitive: false,
  ).firstMatch(normalized);
  if (portuguese == null) return normalized;
  return portuguese.group(2)?.toUpperCase() == 'BR' ? 'pt-BR' : 'pt-PT';
}

Locale? interfaceLocaleOverride(String preference, Iterable<Locale> supported) {
  final tag = normalizeInterfaceLanguageTag(preference);
  if (tag == 'system') return null;
  for (final locale in supported) {
    if (locale.toLanguageTag() == tag || locale.toString() == tag) {
      return locale;
    }
  }
  return null;
}

Locale resolveInterfaceLocale(Locale? requested, Iterable<Locale> supported) {
  final locale = requested?.languageCode.toLowerCase() == 'pt'
      ? Locale(
          'pt',
          requested?.countryCode?.toUpperCase() == 'BR' ? 'BR' : 'PT',
        )
      : requested;
  for (final candidate in supported) {
    if (candidate == locale) return candidate;
  }
  for (final candidate in supported) {
    if (candidate.languageCode == locale?.languageCode) return candidate;
  }
  return const Locale('en');
}

bool isVisibleInterfaceLocale(Locale locale) =>
    locale.languageCode != 'pt' || locale.countryCode != null;
