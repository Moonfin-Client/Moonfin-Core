import 'package:server_core/server_core.dart';
import '../silo_image_registry.dart';
import 'silo_ids.dart';

/// A Silo person (`Person`: `name`, `bio`, `birth_date`, `death_date`,
/// `birthplace`, `photo_url`, provider ids) as the Jellyfin `Person` item
/// Moonfin's person page reads:
///
/// | Jellyfin | Silo |
/// |---|---|
/// | `Overview` | `bio` |
/// | `PremiereDate` | `birth_date` (born) |
/// | `EndDate` | `death_date` (died) |
/// | `ProductionLocations` | `[birthplace]` |
/// | `ProviderIds` | `imdb_id`, `tmdb_id`, `tvdb_id` |
/// | `ImageTags.Primary` | `photo_url`, registered under the person's id |
Map<String, dynamic> siloPersonToBaseItemDto(
  Map<String, dynamic> person, {
  SiloImageRegistry? images,
}) {
  String? date(Object? v) {
    final parsed = v is String ? DateTime.tryParse(v) : null;
    if (parsed == null) return null;
    final d = DateTime.utc(parsed.year, parsed.month, parsed.day);
    return '${d.toIso8601String().substring(0, 19)}.0000000Z';
  }

  final id = siloIdOf(person['id']) ?? '';
  final name = jsonText(person['name']) ?? '';
  images?.note(id);
  final photo = images?.register(
    id,
    SiloImageType.primary,
    person['photo_url'] as String?,
  );
  final birthplace = jsonText(person['birthplace']);
  return {
    'Id': id,
    'Name': name,
    'SortName': name,
    'Type': 'Person',
    'IsFolder': false,
    'Overview': ?jsonText(person['bio']),
    'PremiereDate': ?date(person['birth_date']),
    'EndDate': ?date(person['death_date']),
    'ProductionLocations': [?birthplace],
    'ProviderIds': {
      'Imdb': ?jsonText(person['imdb_id']),
      'Tmdb': ?jsonText(person['tmdb_id']),
      'Tvdb': ?jsonText(person['tvdb_id']),
    },
    'ImageTags': {'Primary': ?photo},
    'BackdropImageTags': const <String>[],
    if (jsonText(person['homepage']) case final home?)
      'ExternalUrls': [
        {'Name': 'Website', 'Url': home},
      ],
  };
}
