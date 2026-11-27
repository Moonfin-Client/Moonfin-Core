
import 'package:jellyfin_preference/jellyfin_preference.dart';
import '../preference/user_preferences.dart';

final _htmlTag = RegExp(r'<\/?[a-z0-9]*\b[^>]*>', caseSensitive: false);
final _htmlEntity = RegExp(
  r'&(#x?[0-9a-f]+|[a-z][a-z0-9]*);',
  caseSensitive: false,
);

const _namedEntities = {
  'amp': '&',
  'lt': '<',
  'gt': '>',
  'quot': '"',
  'apos': "'",
  'nbsp': ' ',
};

/// Strips HTML tags and decodes named and numeric entities to their
/// characters. Unknown entities are left as is rather than dropped, so real
/// text is never silently removed. Null or empty input returns an empty string.
String cleanOverview(String? input) {
  if (input == null || input.isEmpty) return '';
  final withoutTags = input.replaceAll(_htmlTag, '');
  return withoutTags.replaceAllMapped(_htmlEntity, (match) {
    final entity = match[1]!.toLowerCase();
    if (entity.startsWith('#x')) {
      final code = int.tryParse(entity.substring(2), radix: 16);
      return code == null ? match[0]! : String.fromCharCode(code);
    }
    if (entity.startsWith('#')) {
      final code = int.tryParse(entity.substring(1));
      return code == null ? match[0]! : String.fromCharCode(code);
    }
    return _namedEntities[entity] ?? match[0]!;
  });
}

/// Whether the plot summary is being held back from someone avoiding spoilers
/// or opting out of descriptions on video detail pages. Kids Mode hides it on
/// every video page, Seerr ones included, and never on other pages.
bool hidesMediaDescription({
  required String? itemType,
  UserPreferences? prefs,
  bool? hideMediaDescription,
  bool isSeerr = false,
}) {
  if (prefs == null) {
    return !isSeerr &&
        (hideMediaDescription ?? false) &&
        (itemType == 'Movie' || itemType == 'Episode');
  }
  final kids = prefs.get(UserPreferences.kidsModeEnabled);
  if (isSeerr && !kids) return false;
  return switch (itemType) {
    'Movie' =>
      kids ||
          _resolvedHideFlag(
            prefs,
            UserPreferences.hideDetailsMediaDescriptionMovie,
          ),
    'Series' =>
      kids || prefs.get(UserPreferences.hideDetailsMediaDescriptionShow),
    'Season' =>
      kids || prefs.get(UserPreferences.hideDetailsMediaDescriptionSeason),
    'Episode' =>
      kids ||
          _resolvedHideFlag(
            prefs,
            UserPreferences.hideDetailsMediaDescriptionEpisode,
          ),
    'BoxSet' =>
      kids || prefs.get(UserPreferences.hideDetailsMediaDescriptionBoxSet),
    _ => false,
  };
}

bool _resolvedHideFlag(UserPreferences prefs, Preference<bool> pref) =>
    prefs.containsPreference(pref)
        ? prefs.get(pref)
        : prefs.get(UserPreferences.hideDetailsMediaDescription);
