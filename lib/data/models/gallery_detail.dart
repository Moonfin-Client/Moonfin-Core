import '../services/seerr/seerr_api_models.dart';
import 'aggregated_item.dart';

class GalleryDetail {
  final String itemId;
  final String? director;
  final List<String> cast;

  const GalleryDetail({
    required this.itemId,
    this.director,
    this.cast = const [],
  });

  factory GalleryDetail.fromItem(String itemId, AggregatedItem item) {
    String? director;
    final cast = <String>[];
    for (final person in item.people) {
      final name = (person['Name'] as String?)?.trim();
      if (name == null || name.isEmpty) continue;
      final type = (person['Type'] as String?) ?? '';
      final role = (person['Role'] as String?) ?? '';
      if (type == 'Director' && director == null) {
        director = name;
      } else if (type == 'Actor' || role.isNotEmpty) {
        if (cast.length < 5 && !cast.contains(name)) {
          cast.add(name);
        }
      }
    }

    return GalleryDetail(
      itemId: itemId,
      director: director,
      cast: cast,
    );
  }

  /// From Seerr's credits, for a title that isn't in the library.
  factory GalleryDetail.fromSeerr(String itemId, SeerrCredits? credits) {
    return GalleryDetail(
      itemId: itemId,
      director: credits?.crew
          .where((person) => person.job == 'Director')
          .firstOrNull
          ?.name,
      cast: {
        for (final person in credits?.cast ?? const <SeerrCastMember>[])
          if (person.name.trim().isNotEmpty) person.name.trim(),
      }.take(5).toList(),
    );
  }

  bool get isEmpty => director == null && cast.isEmpty;
}
