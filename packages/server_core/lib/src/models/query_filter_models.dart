/// A facet value whose display text differs from what the query takes, which
/// is how both servers report languages.
class NamedFilterValue {
  final String name;
  final String value;

  const NamedFilterValue({required this.name, required this.value});
}

/// The facet values a library holds, used to build the filter picker so it
/// only ever offers something that matches an item.
class QueryFilterValues {
  final List<String> genres;
  final List<String> officialRatings;
  final List<String> tags;
  final List<int> years;
  final List<NamedFilterValue> audioLanguages;
  final List<NamedFilterValue> subtitleLanguages;

  const QueryFilterValues({
    this.genres = const [],
    this.officialRatings = const [],
    this.tags = const [],
    this.years = const [],
    this.audioLanguages = const [],
    this.subtitleLanguages = const [],
  });

  static const empty = QueryFilterValues();

  /// The older Items/Filters response, which is the only one carrying years
  /// and parental ratings.
  factory QueryFilterValues.fromLegacyJson(Map<String, dynamic> json) =>
      QueryFilterValues(
        genres: _strings(json['Genres']),
        officialRatings: _strings(json['OfficialRatings']),
        tags: _strings(json['Tags']),
        years: (json['Years'] as List? ?? const [])
            .whereType<num>()
            .map((e) => e.toInt())
            .toList(),
      );

  /// The newer Items/Filters2 response, which is where the languages live.
  factory QueryFilterValues.fromJson(Map<String, dynamic> json) =>
      QueryFilterValues(
        genres: (json['Genres'] as List? ?? const [])
            .whereType<Map>()
            .map((e) => e['Name']?.toString() ?? '')
            .where((e) => e.isNotEmpty)
            .toList(),
        tags: _strings(json['Tags']),
        audioLanguages: _pairs(json['AudioLanguages']),
        subtitleLanguages: _pairs(json['SubtitleLanguages']),
      );

  static List<String> _strings(Object? raw) => (raw as List? ?? const [])
      .map((e) => e?.toString() ?? '')
      .where((e) => e.isNotEmpty)
      .toList();

  static List<NamedFilterValue> _pairs(Object? raw) =>
      (raw as List? ?? const [])
          .whereType<Map>()
          .map((e) {
            final value = e['Value']?.toString() ?? '';
            final name = e['Name']?.toString();
            return NamedFilterValue(
              name: name == null || name.isEmpty ? value : name,
              value: value,
            );
          })
          .where((e) => e.value.isNotEmpty)
          .toList();

  /// Merges the two responses a server can answer with. The older endpoint
  /// carries the years and ratings, the newer one the languages, and a server
  /// that only answers one of them still gives a usable picker.
  QueryFilterValues mergedWith(QueryFilterValues other) => QueryFilterValues(
    genres: genres.isEmpty ? other.genres : genres,
    officialRatings: officialRatings.isEmpty
        ? other.officialRatings
        : officialRatings,
    tags: tags.isEmpty ? other.tags : tags,
    years: years.isEmpty ? other.years : years,
    audioLanguages: audioLanguages.isEmpty
        ? other.audioLanguages
        : audioLanguages,
    subtitleLanguages: subtitleLanguages.isEmpty
        ? other.subtitleLanguages
        : subtitleLanguages,
  );
}
