import 'dart:convert';

class SeriesTrackPreference {
  final String language;
  final String title;
  final int relativeIndex;
  final int? streamIndex;

  const SeriesTrackPreference({
    required this.language,
    this.title = '',
    this.relativeIndex = 0,
    this.streamIndex,
  });

  static const empty = SeriesTrackPreference(language: '');
  static const none = SeriesTrackPreference(language: 'none');

  bool get isNone => language.toLowerCase() == 'none';
  bool get isEmpty => language.isEmpty;
  bool get isNotEmpty => language.isNotEmpty;

  Map<String, dynamic> toJson() => {
        'language': language,
        'title': title,
        'relativeIndex': relativeIndex,
        if (streamIndex != null) 'streamIndex': streamIndex,
      };

  factory SeriesTrackPreference.fromJson(Map<String, dynamic> json) {
    return SeriesTrackPreference(
      language: json['language'] as String? ?? '',
      title: json['title'] as String? ?? '',
      relativeIndex: json['relativeIndex'] as int? ?? 0,
      streamIndex: json['streamIndex'] as int?,
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
      'SeriesTrackPreference(language: $language, title: $title, relativeIndex: $relativeIndex, streamIndex: $streamIndex)';
}
