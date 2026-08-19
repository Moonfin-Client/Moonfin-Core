import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../data/models/series_track_preference.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import 'audio_track_logic.dart';
import 'subtitle_track_logic.dart';

/// The audio track playback would start on, so a detail screen can mark the
/// one that will play rather than whichever the container flags as default.
int? highlightedAudioIndex({
  required List<Map<String, dynamic>> audioStreams,
  String? seriesId,
  int? selectedIndex,
  int? activePlaybackIndex,
}) {
  if (selectedIndex != null) return selectedIndex;
  if (activePlaybackIndex != null) return activePlaybackIndex;
  if (audioStreams.isEmpty) return null;

  final prefs = GetIt.instance<UserPreferences>();
  final manager = GetIt.instance<PlaybackManager>();

  if (seriesId != null && seriesId.isNotEmpty) {
    final seriesPref = prefs.getSeriesAudioPreference(seriesId);
    if (seriesPref.isNotEmpty) {
      final matched = matchSeriesTrackIndex(
        streams: audioStreams,
        pref: seriesPref,
      );
      if (matched != null) return matched;
    }
  }

  return computeEffectiveAudioIndex(
    audioStreams: audioStreams,
    preferredAudioLanguage:
        manager.lastExplicitAudioLanguage ??
        (prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto'),
    fallbackAudioLanguage:
        prefs.get(UserPreferences.fallbackAudioLanguage) as String? ?? '',
    preferDefaultAudioTrack:
        prefs.get(UserPreferences.preferDefaultAudioTrack) as bool? ?? false,
    preferAudioDescription:
        prefs.get(UserPreferences.preferAudioDescription) as bool? ?? false,
    explicitAudioIndex: null,
    lastExplicitAudioIndex: manager.lastExplicitAudioIndex,
    lastExplicitAudioTitle: manager.lastExplicitAudioTitle,
  );
}

/// The subtitle track playback would start on. Returns -1 when playback would
/// start with subtitles off, which a caller has to tell apart from no answer.
int? highlightedSubtitleIndex({
  required List<Map<String, dynamic>> subtitleStreams,
  required List<Map<String, dynamic>> audioStreams,
  String? seriesId,
  int? selectedIndex,
  int? activePlaybackIndex,
  int? activeAudioIndex,
}) {
  if (selectedIndex != null) return selectedIndex;
  if (activePlaybackIndex != null) return activePlaybackIndex;
  if (subtitleStreams.isEmpty) return -1;

  final prefs = GetIt.instance<UserPreferences>();
  final manager = GetIt.instance<PlaybackManager>();

  final seriesPref = seriesId != null && seriesId.isNotEmpty
      ? prefs.getSeriesSubtitlePreference(seriesId)
      : SeriesTrackPreference.empty;
  if (seriesPref.isNone) return -1;
  if (seriesPref.isNotEmpty) {
    final matched = matchSeriesTrackIndex(
      streams: subtitleStreams,
      pref: seriesPref,
    );
    if (matched != null) return matched;
  }

  final activeAudioStream = audioStreams.firstWhere(
    (s) => s['Index'] == activeAudioIndex,
    orElse: () => const <String, dynamic>{},
  );

  var subtitleMode = manager.lastExplicitSubtitleEnabled == false
      ? SubtitleMode.none
      : prefs.get(UserPreferences.subtitleMode);

  // No track here carries the remembered one, so fall back to its language and
  // turn subtitles on to show it.
  var preferredLanguage = manager.lastExplicitSubtitleLanguage;
  if (preferredLanguage == null && seriesPref.language.isNotEmpty) {
    preferredLanguage = seriesPref.language;
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
    pgsDirectPlay: prefs.get(UserPreferences.pgsDirectPlay) as bool? ?? false,
    assDirectPlay: prefs.get(UserPreferences.assDirectPlay) as bool? ?? false,
    preferredAudioLanguage:
        prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? 'auto',
    activeAudioLanguage: activeAudioStream['Language'] as String?,
  );
}
