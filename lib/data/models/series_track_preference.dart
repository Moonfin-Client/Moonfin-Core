import 'dart:convert';

class SeriesTrackPreference {
  final String language;
  final String title;
  final int relativeIndex;

  const SeriesTrackPreference({
    required this.language,
    this.title = '',
    this.relativeIndex = 0,
  });

  static const empty = SeriesTrackPreference(language: '');
  static const none = SeriesTrackPreference(language: 'none');

  bool get isNone => language.toLowerCase() == 'none';

  /// Nothing to match a track on. Plenty of tracks carry no language tag,
  /// forced and SDH ones especially, so a title alone still counts.
  bool get isEmpty => language.isEmpty && title.isEmpty;
  bool get isNotEmpty => !isEmpty;

  Map<String, dynamic> toJson() => {
        'language': language,
        'title': title,
        'relativeIndex': relativeIndex,
      };

  factory SeriesTrackPreference.fromJson(Map<String, dynamic> json) {
    return SeriesTrackPreference(
      language: json['language'] as String? ?? '',
      title: json['title'] as String? ?? '',
      relativeIndex: json['relativeIndex'] as int? ?? 0,
    );
  }

  factory SeriesTrackPreference.fromRawString(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return empty;
    if (trimmed == 'none') return none;
    if (trimmed.startsWith('{')) {
      try {
        final decoded = jsonDecode(trimmed) as Map<String, dynamic>;
        return SeriesTrackPreference.fromJson(decoded);
      } catch (_) {}
    }
    return SeriesTrackPreference(language: trimmed);
  }

  String toRawString() {
    if (isEmpty) return '';
    if (isNone) return 'none';
    return jsonEncode(toJson());
  }

  @override
  String toString() =>
      'SeriesTrackPreference(language: $language, title: $title, '
      'relativeIndex: $relativeIndex)';
}
