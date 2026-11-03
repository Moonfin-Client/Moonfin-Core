/// A series' remembered audio or subtitle choice as a server keeps it.
class SeriesTrackChoice {
  const SeriesTrackChoice({
    this.off = false,
    this.language = '',
    this.title = '',
  });

  /// Subtitles off (a subtitle choice only).
  final bool off;

  /// The chosen track's language, empty when it had none.
  final String language;

  /// The chosen track's title as the client showed it, empty when unknown.
  final String title;

  @override
  String toString() =>
      'SeriesTrackChoice(off: $off, language: $language, title: $title)';
}

/// Optional extra for an `ItemsApi` whose server remembers each series'
/// audio and subtitle choice per profile (Silo's audio and subtitle
/// preferences).
///
/// Moonfin remembers a series' choice on the device (`UserPreferences`'
/// series track preferences). With this interface
/// (`itemsApi is SeriesTrackPreferencesApi`) a choice made in Moonfin is
/// also kept by the server, and one made elsewhere (the server's own apps,
/// another device) reaches Moonfin.
abstract interface class SeriesTrackPreferencesApi {
  /// The series' remembered audio choice, or null when it has none.
  Future<SeriesTrackChoice?> getSeriesAudioChoice(String seriesId);

  /// The series' remembered subtitle choice, or null when it has none.
  Future<SeriesTrackChoice?> getSeriesSubtitleChoice(String seriesId);

  /// Remembers audio stream [streamIndex] of [itemId], an episode of
  /// [seriesId] that is playing, as the series' choice.
  Future<void> setSeriesAudioChoice(
    String seriesId, {
    required String itemId,
    required int streamIndex,
  });

  /// Remembers subtitle stream [streamIndex] of [itemId] (-1: off) as the
  /// series' choice.
  Future<void> setSeriesSubtitleChoice(
    String seriesId, {
    required String itemId,
    required int streamIndex,
  });
}
