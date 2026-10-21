/// Which showings a series recording rule takes, stored on the server as the
/// rule's `RecordNewOnly` and `SkipEpisodesInLibrary` flags.
enum SeriesRecordingEpisodes {
  /// Every showing, repeats included.
  all,

  /// Every showing except episodes already in the library. With this flag
  /// the server also keeps one showing of an episode the guide lists twice.
  notRecorded,

  /// First airings only.
  newOnly;

  static SeriesRecordingEpisodes fromSeriesTimer(Map<String, dynamic> timer) {
    if (timer['RecordNewOnly'] == true) return newOnly;
    if (timer['SkipEpisodesInLibrary'] == true) return notRecorded;
    return all;
  }

  Map<String, dynamic> get settings => {
    'RecordNewOnly': this == newOnly,
    'SkipEpisodesInLibrary': this != all,
  };
}
