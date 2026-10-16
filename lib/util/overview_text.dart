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
/// or opting out of descriptions on detail pages.
bool hidesMediaDescription({
  required String? itemType,
  UserPreferences? prefs,
  bool? hideMediaDescription,
  bool isSeerr = false,
}) {
  if (prefs != null) {
    if (prefs.get(UserPreferences.kidsModeEnabled)) {
      return true;
    }
    if (isSeerr) {
      return switch (itemType) {
        'Movie' =>
          prefs.get(UserPreferences.hideDetailsMediaDescriptionSeerrMovie),
        'Series' || 'Show' || 'Tv' =>
          prefs.get(UserPreferences.hideDetailsMediaDescriptionSeerrShow),
        'BoxSet' || 'Collection' =>
          prefs.get(UserPreferences.hideDetailsMediaDescriptionSeerrCollection),
        'Person' =>
          prefs.get(UserPreferences.hideDetailsMediaDescriptionPerson),
        _ => false,
      };
    }
    return switch (itemType) {
      'Movie' => prefs.get(UserPreferences.hideDetailsMediaDescriptionMovie) ||
          prefs.get(UserPreferences.hideDetailsMediaDescription),
      'Series' || 'Show' || 'Tv' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionShow),
      'Season' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionSeason),
      'Episode' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionEpisode) ||
            prefs.get(UserPreferences.hideDetailsMediaDescription),
      'BoxSet' || 'Collection' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionBoxSet),
      'Book' || 'AudioBook' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionBook),
      'Person' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionPerson),
      'MusicAlbum' || 'MusicArtist' || 'Audio' =>
        prefs.get(UserPreferences.hideDetailsMediaDescriptionMusic),
      _ => false,
    };
  }

  return (hideMediaDescription ?? false) &&
      (itemType == 'Movie' || itemType == 'Episode');
}
