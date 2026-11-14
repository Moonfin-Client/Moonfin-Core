import 'dart:ui' as ui;

import '../data/models/series_track_preference.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import 'audio_track_logic.dart';
import 'language_matching.dart';
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

  // A sub or dub mode outranks the track the series remembers, but not audio
  // the viewer switched to during this session.
  final mode = _seriesTrackMode(prefs, seriesId);
  if (mode != SeriesTrackMode.standard && session.audioLanguage == null) {
    final modeIndex = _modeAudioIndex(mode, audioStreams, prefs, session);
    if (modeIndex != null) return modeIndex;
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
  final mode = _seriesTrackMode(prefs, seriesId);
  if (mode != SeriesTrackMode.standard && session.subtitleEnabled == null) {
    return _modeSubtitleIndex(
      subtitleStreams: subtitleStreams,
      audioStreams: audioStreams,
      prefs: prefs,
      seriesId: seriesId,
      session: session,
    );
  }

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
  // language and make sure subtitles are on to show it, unless the viewer
  // turned them off during this session. A remembered track with no language
  // tag has nothing to fall back to.
  if (preferredLanguage == null && seriesSubPref.language.isNotEmpty) {
    preferredLanguage = seriesSubPref.language;
    if (subtitleMode == SubtitleMode.none && session.subtitleEnabled != false) {
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

SeriesTrackMode _seriesTrackMode(UserPreferences prefs, String? seriesId) =>
    seriesId == null || seriesId.isEmpty
    ? SeriesTrackMode.standard
    : prefs.getSeriesTrackMode(seriesId);

/// The language the viewer listens in: the audio language setting, or the
/// device's own language while that is on auto.
String _viewerLanguage(UserPreferences prefs) {
  final audio =
      (prefs.get(UserPreferences.defaultAudioLanguage) as String? ?? '').trim();
  if (audio.isNotEmpty && audio.toLowerCase() != 'auto') return audio;
  return ui.PlatformDispatcher.instance.locale.languageCode;
}

/// The audio a sub or dub mode asks for: the original for Subbed, the
/// viewer's language for Dubbed, and the original again when an episode has
/// no dub. Null when the episode has neither, which leaves the usual choice
/// to stand.
int? _modeAudioIndex(
  SeriesTrackMode mode,
  List<Map<String, dynamic>> audioStreams,
  UserPreferences prefs,
  SessionTrackChoices session,
) {
  final viewer = _viewerLanguage(prefs);
  final preferAudioDescription =
      prefs.get(UserPreferences.preferAudioDescription) as bool? ?? false;
  final usable = audioStreams
      .where(
        (s) =>
            s['Index'] != null &&
            !isCommentaryAudioStream(s) &&
            (preferAudioDescription || !isAudioDescriptionAudioStream(s)),
      )
      .toList();

  if (mode == SeriesTrackMode.dubbed) {
    final dubs = usable.where((s) => matchLang(s['Language'], viewer)).toList();
    if (dubs.isNotEmpty) {
      return computeEffectiveAudioIndex(
        audioStreams: dubs,
        preferredAudioLanguage: viewer,
        fallbackAudioLanguage: '',
        preferDefaultAudioTrack:
            prefs.get(UserPreferences.preferDefaultAudioTrack) as bool? ??
            false,
        preferAudioDescription: preferAudioDescription,
        lastExplicitAudioIndex: session.audioIndex,
        lastExplicitAudioTitle: session.audioTitle,
      );
    }
    // No dub in this episode: the original, as Subbed would play it, rather
    // than some other language the series happens to remember.
  }

  // An untagged track could just as well be the dub, so only a track tagged
  // with another language counts as the original.
  final originals = usable.where((s) {
    final language = normalizeLanguage(s['Language'] as String?);
    return language.isNotEmpty &&
        language != 'und' &&
        !matchLang(language, viewer);
  }).toList();
  if (originals.isEmpty) return null;
  final original = originals.firstWhere(
    (s) => s['IsDefault'] == true,
    orElse: () => originals.first,
  );
  return original['Index'] as int?;
}

/// Subtitles under a sub or dub mode follow the audio that actually plays:
/// full ones over audio in another language, forced ones over audio in the
/// viewer's own. A subbed series with no original audio in this episode so
/// gets the dub's forced subtitles, and a dubbed one with no dub gets full
/// subtitles.
int? _modeSubtitleIndex({
  required List<Map<String, dynamic>> subtitleStreams,
  required List<Map<String, dynamic>> audioStreams,
  required UserPreferences prefs,
  required String? seriesId,
  required SessionTrackChoices session,
}) {
  final audioIndex = selectPlaybackAudioIndex(
    audioStreams: audioStreams,
    prefs: prefs,
    seriesId: seriesId,
    session: session,
  );
  final audioLanguage = audioStreams.firstWhere(
    (s) => s['Index'] == audioIndex,
    orElse: () => const <String, dynamic>{},
  )['Language'] as String?;

  final viewer = _viewerLanguage(prefs);
  final subtitleSetting =
      (prefs.get(UserPreferences.defaultSubtitleLanguage) as String? ?? '')
          .trim();
  final subtitleLanguage =
      subtitleSetting.isEmpty || subtitleSetting.toLowerCase() == 'none'
      ? viewer
      : subtitleSetting;

  final nativeAudio = matchLang(audioLanguage, viewer);
  final full = subtitleStreams
      .where((s) => !isForcedSubtitleStream(s))
      .toList();

  return computeEffectiveSubtitleIndex(
    subtitleStreams: nativeAudio || full.isEmpty ? subtitleStreams : full,
    selectedSubtitleIndex: null,
    activePlaybackSubtitleIndex: null,
    subtitleMode: nativeAudio ? SubtitleMode.forced : SubtitleMode.always,
    preferredLanguage: subtitleLanguage,
    // Forced lines in some other language are no help to someone who
    // understands the audio.
    fallbackLanguage: nativeAudio
        ? ''
        : prefs.get(UserPreferences.fallbackSubtitleLanguage) as String? ?? '',
    preferSdh: prefs.get(UserPreferences.preferSdhSubtitles) as bool? ?? false,
    preferTextSubtitles:
        prefs.get(UserPreferences.preferTextSubtitles) as bool? ?? false,
    preferExternalSubtitles:
        prefs.get(UserPreferences.preferExternalSubtitles) as bool? ?? false,
    pgsDirectPlay: prefs.get(UserPreferences.pgsDirectPlay) as bool? ?? false,
    assDirectPlay: prefs.get(UserPreferences.assDirectPlay) as bool? ?? false,
    preferredAudioLanguage: viewer,
    activeAudioLanguage: audioLanguage,
  );
}