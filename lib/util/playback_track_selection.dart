import '../data/models/series_track_preference.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import 'audio_track_logic.dart';
import 'subtitle_track_logic.dart';

/// What the viewer already picked during this playback session, as the
/// playback manager keeps it, so the track choice for the next item can follow.
class SessionTrackChoices {
  const SessionTrackChoices({
    this.explicitAudioIndex,
    this.audioLanguage,
    this.audioIndex,
    this.audioTitle,
    this.subtitleLanguage,
    this.subtitleEnabled,
  });

  /// The audio track picked for the item about to play, if one was.
  final int? explicitAudioIndex;
  final String? audioLanguage;
  final int? audioIndex;
  final String? audioTitle;
  final String? subtitleLanguage;
  final bool? subtitleEnabled;
}

/// The audio track playback starts on when nothing was picked for this item:
/// the series' remembered track first, then the viewer's language settings.
int? selectPlaybackAudioIndex({
  required List<Map<String, dynamic>> audioStreams,
  required UserPreferences prefs,
  String? seriesId,
  SessionTrackChoices session = const SessionTrackChoices(),
}) {
  final explicitIndex = session.explicitAudioIndex;
  if (explicitIndex != null &&
      audioStreams.any((s) => s['Index'] == explicitIndex)) {
    return explicitIndex;
  }

  if (seriesId != null && seriesId.isNotEmpty) {
    final seriesAudioPref = prefs.getSeriesAudioPreference(seriesId);
    if (seriesAudioPref.isNotEmpty) {
      final matchedIndex = matchSeriesTrackIndex(
        streams: audioStreams,
        pref: seriesAudioPref,
      );
      if (matchedIndex != null) return matchedIndex;
    }
  }

  return computeEffectiveAudioIndex(
    audioStreams: audioStreams,
    preferredAudioLanguage:
        session.audioLanguage ??
        (prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto'),
    fallbackAudioLanguage:
        prefs.get(UserPreferences.fallbackAudioLanguage) as String? ?? '',
    preferDefaultAudioTrack:
        prefs.get(UserPreferences.preferDefaultAudioTrack) as bool? ?? false,
    preferAudioDescription:
        prefs.get(UserPreferences.preferAudioDescription) as bool? ?? false,
    lastExplicitAudioIndex: session.audioIndex,
    lastExplicitAudioTitle: session.audioTitle,
  );
}

/// The subtitle track playback starts on when nothing was picked for this
/// item, or -1 for none. Which audio plays is worked out the same way
/// [selectPlaybackAudioIndex] does, so "only for foreign audio" sees the
/// series' remembered audio rather than the global audio language.
int? selectPlaybackSubtitleIndex({
  required List<Map<String, dynamic>> subtitleStreams,
  required List<Map<String, dynamic>> audioStreams,
  required UserPreferences prefs,
  String? seriesId,
  SessionTrackChoices session = const SessionTrackChoices(),
}) {
  final seriesSubPref = seriesId != null && seriesId.isNotEmpty
      ? prefs.getSeriesSubtitlePreference(seriesId)
      : SeriesTrackPreference.empty;
  if (seriesSubPref.isNone) return -1;
  if (seriesSubPref.isNotEmpty) {
    final matchedIndex = matchSeriesTrackIndex(
      streams: subtitleStreams,
      pref: seriesSubPref,
    );
    if (matchedIndex != null) return matchedIndex;
  }

  final effectiveAudioIndex = selectPlaybackAudioIndex(
    audioStreams: audioStreams,
    prefs: prefs,
    seriesId: seriesId,
    session: session,
  );

  final activeAudioStream = audioStreams.firstWhere(
    (s) => s['Index'] == effectiveAudioIndex,
    orElse: () => const <String, dynamic>{},
  );
  final activeAudioLanguage = activeAudioStream.isNotEmpty
      ? activeAudioStream['Language'] as String?
      : null;

  var subtitleMode = session.subtitleEnabled == false
      ? SubtitleMode.none
      : prefs.get(UserPreferences.subtitleMode);

  var preferredLanguage = session.subtitleLanguage;
  // No track in this episode carries the remembered one, so fall back to its
  // language and make sure subtitles are on to show it. A remembered track
  // with no language tag has nothing to fall back to.
  if (preferredLanguage == null && seriesSubPref.language.isNotEmpty) {
    preferredLanguage = seriesSubPref.language;
    if (subtitleMode == SubtitleMode.none) {
      subtitleMode = SubtitleMode.always;
    }
  }

  preferredLanguage ??=
      (prefs.get(UserPreferences.defaultSubtitleLanguage) as String? ?? '');

  return computeEffectiveSubtitleIndex(
    subtitleStreams: subtitleStreams,
    selectedSubtitleIndex: null,
    activePlaybackSubtitleIndex: null,
    subtitleMode: subtitleMode,
    preferredLanguage: preferredLanguage,
    fallbackLanguage:
        prefs.get(UserPreferences.fallbackSubtitleLanguage) as String? ?? '',
    preferSdh: prefs.get(UserPreferences.preferSdhSubtitles) as bool? ?? false,
    preferTextSubtitles:
        prefs.get(UserPreferences.preferTextSubtitles) as bool? ?? false,
    preferExternalSubtitles:
        prefs.get(UserPreferences.preferExternalSubtitles) as bool? ?? false,
    pgsDirectPlay: prefs.get(UserPreferences.pgsDirectPlay) as bool? ?? false,
    assDirectPlay: prefs.get(UserPreferences.assDirectPlay) as bool? ?? false,
    preferredAudioLanguage:
        prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto',
    activeAudioLanguage: activeAudioLanguage,
  );
}
