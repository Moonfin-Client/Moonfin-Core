import 'dart:ui' as ui;
import '../data/models/series_track_preference.dart';
import '../preference/preference_constants.dart';
import 'language_matching.dart';

bool isExternalSubtitleStream(Map<String, dynamic> stream) {
  if (stream['IsExternal'] == true) {
    return true;
  }
  final deliveryMethod =
      (stream['DeliveryMethod'] as String?)?.trim().toLowerCase();
  return deliveryMethod == 'external';
}

bool isSdhSubtitleStream(Map<String, dynamic> stream) {
  if (stream['IsHearingImpaired'] == true) return true;
  final titleParts = [
    stream['DisplayTitle'] as String?,
    stream['Title'] as String?,
    stream['Name'] as String?,
  ].whereType<String>().map((s) => s.toLowerCase()).join(' ');
  return RegExp(
    r'\b(sdh|cc|hoh|hearing\s*impaired|closed\s*caption)\b',
  ).hasMatch(titleParts);
}

bool isSpecialSubtitleStream(Map<String, dynamic> stream) {
  if (stream['IsCommentary'] == true) return true;
  final titleParts = [
    stream['DisplayTitle'] as String?,
    stream['Title'] as String?,
    stream['Name'] as String?,
  ].whereType<String>().map((s) => s.toLowerCase()).join(' ');
  return RegExp(
    r'\b(commentary|commentaries|jump\s*scare)\b',
  ).hasMatch(titleParts);
}

bool shouldRenderSubtitleNatively(String? codec) {
  if (codec == null) return false;
  final normalized = codec.trim().toLowerCase();
  return normalized == 'ass' ||
      normalized == 'ssa' ||
      normalized == 'pgs' ||
      normalized == 'pgssub' ||
      normalized == 'hdmv_pgs_subtitle' ||
      normalized == 'dvdsub' ||
      normalized == 'vobsub' ||
      normalized == 'dvd_subtitle' ||
      normalized == 'dvbsub' ||
      normalized == 'dvb_subtitle' ||
      normalized == 'xsub';
}

/// Internal streams first, external streams last.
List<Map<String, dynamic>> sortedSubtitleStreams(
  List<Map<String, dynamic>> streams,
) {
  final internal =
      streams.where((s) => !isExternalSubtitleStream(s)).toList(growable: false);
  final external =
      streams.where(isExternalSubtitleStream).toList(growable: false);
  return [...internal, ...external];
}

/// Determines which stream index should be active given current state and prefs.
/// Returns -1 for explicit "none", null to fall back to the IsDefault flag.
int? computeEffectiveSubtitleIndex({
  required List<Map<String, dynamic>> subtitleStreams,
  required int? selectedSubtitleIndex,
  required int? activePlaybackSubtitleIndex,
  required SubtitleMode subtitleMode,
  required String preferredLanguage,
  required String fallbackLanguage,
  required bool preferSdh,
  required bool pgsDirectPlay,
  required bool assDirectPlay,
  required String preferredAudioLanguage,
  required String? activeAudioLanguage,
}) {
  bool matchLang(String? streamLang, String targetLang) {
    final targetNormalized = normalizeLanguage(targetLang);
    if (targetNormalized.isEmpty || targetNormalized == 'none') {
      return false;
    }
    final targetIso3 = toIso3Language(targetNormalized);
    return languageMatchesPreferred(streamLang, targetNormalized, targetIso3);
  }

  if (selectedSubtitleIndex != null) return selectedSubtitleIndex;
  if (activePlaybackSubtitleIndex != null) return activePlaybackSubtitleIndex;

  if (subtitleMode == SubtitleMode.none) {
    return -1;
  }

  if (subtitleMode == SubtitleMode.foreign) {
    final activeAudio = activeAudioLanguage ?? '';
    final preferredAudio = preferredAudioLanguage.trim();
    
    bool isAudioNative;
    if (preferredAudio.isNotEmpty && preferredAudio != 'auto') {
      final preferredNormalized = normalizeLanguage(preferredAudio);
      final preferredIso3 = toIso3Language(preferredNormalized);
      final activeNormalized = normalizeLanguage(activeAudio);
      final activeIso3 = toIso3Language(activeNormalized);
      isAudioNative = (preferredIso3 == activeIso3);
    } else {
      final sysLang = ui.PlatformDispatcher.instance.locale.languageCode;
      final sysNormalized = normalizeLanguage(sysLang);
      final sysIso3 = toIso3Language(sysNormalized);
      final activeNormalized = normalizeLanguage(activeAudio);
      final activeIso3 = toIso3Language(activeNormalized);
      isAudioNative = (sysIso3 == activeIso3);
    }
    
    if (isAudioNative) {
      return -1;
    }
  }

  // Check if primary (preferred) or secondary (fallback) languages are available in the streams
  final isPrimaryAvailable = preferredLanguage.isNotEmpty &&
      preferredLanguage != 'none' &&
      subtitleStreams.any((s) => matchLang(s['Language'], preferredLanguage));
  final isSecondaryAvailable = fallbackLanguage.isNotEmpty &&
      fallbackLanguage != 'none' &&
      subtitleStreams.any((s) => matchLang(s['Language'], fallbackLanguage));

  final bothUnavailable = !isPrimaryAvailable && !isSecondaryAvailable;

  final candidates = <Map<String, dynamic>>[];
  for (final stream in subtitleStreams) {
    if (stream['Index'] == null) continue;
    if (subtitleMode == SubtitleMode.forced) {
      if (stream['IsForced'] == true) {
        candidates.add(stream);
      }
    } else if (subtitleMode == SubtitleMode.flagged) {
      if (stream['IsDefault'] == true ||
          stream['IsForced'] == true ||
          (bothUnavailable && matchLang(stream['Language'], 'eng'))) {
        candidates.add(stream);
      }
    } else {
      candidates.add(stream);
    }
  }

  if (candidates.isEmpty) {
    return -1;
  }

  int getFormatPriority(Map<String, dynamic> stream) {
    final codec = (stream['Codec'] as String?)?.trim().toLowerCase() ?? '';
    final isPgs = codec == 'pgs' || codec == 'pgssub' || codec == 'hdmv_pgs_subtitle' || codec == 'dvdsub' || codec == 'vobsub';
    final isAss = codec == 'ass' || codec == 'ssa';
    
    if (isPgs && pgsDirectPlay) return 2;
    if (isAss && assDirectPlay) return 1;
    return 0;
  }

  final candidatesWithIndex = candidates.map((stream) {
    final originalIndex = subtitleStreams.indexOf(stream);
    return (stream: stream, originalIndex: originalIndex);
  }).toList();

  candidatesWithIndex.sort((a, b) {
    final streamA = a.stream;
    final streamB = b.stream;

    // 1. Language matching: Preferred > Fallback > Others
    final aPrefMatch = matchLang(streamA['Language'], preferredLanguage);
    final bPrefMatch = matchLang(streamB['Language'], preferredLanguage);
    if (aPrefMatch != bPrefMatch) {
      return aPrefMatch ? -1 : 1;
    }

    final aFallMatch = matchLang(streamA['Language'], fallbackLanguage);
    final bFallMatch = matchLang(streamB['Language'], fallbackLanguage);
    if (aFallMatch != bFallMatch) {
      return aFallMatch ? -1 : 1;
    }

    // 1.5. English fallback: if preferred and fallback are not found, prefer English
    final aEngMatch = matchLang(streamA['Language'], 'eng');
    final bEngMatch = matchLang(streamB['Language'], 'eng');
    if (aEngMatch != bEngMatch) {
      return aEngMatch ? -1 : 1;
    }

    // 1.6. Push commentary and warning tracks below normal dialogue
    final aSpecial = isSpecialSubtitleStream(streamA);
    final bSpecial = isSpecialSubtitleStream(streamB);
    if (aSpecial != bSpecial) {
      return aSpecial ? 1 : -1;
    }

    // 2 and 3. SDH match and internal vs external, ordered by preferSdh. With SDH
    // on we match SDH first, with it off we keep internal tracks first so a bad
    // external download cannot beat an internal SDH track.
    if (preferSdh) {
      final aSdhMatch = isSdhSubtitleStream(streamA) == preferSdh;
      final bSdhMatch = isSdhSubtitleStream(streamB) == preferSdh;
      if (aSdhMatch != bSdhMatch) {
        return aSdhMatch ? -1 : 1;
      }

      final aInternal = !isExternalSubtitleStream(streamA);
      final bInternal = !isExternalSubtitleStream(streamB);
      if (aInternal != bInternal) {
        return aInternal ? -1 : 1;
      }
    } else {
      final aInternal = !isExternalSubtitleStream(streamA);
      final bInternal = !isExternalSubtitleStream(streamB);
      if (aInternal != bInternal) {
        return aInternal ? -1 : 1;
      }

      final aSdhMatch = isSdhSubtitleStream(streamA) == preferSdh;
      final bSdhMatch = isSdhSubtitleStream(streamB) == preferSdh;
      if (aSdhMatch != bSdhMatch) {
        return aSdhMatch ? -1 : 1;
      }
    }

    // 4. Fancy vs Normal
    final aFormat = getFormatPriority(streamA);
    final bFormat = getFormatPriority(streamB);
    if (aFormat != bFormat) {
      return aFormat > bFormat ? -1 : 1;
    }

    // 5. Forced flag (prefer non-forced for full subtitles, prefer forced for SubtitleMode.forced)
    final aForced = streamA['IsForced'] == true;
    final bForced = streamB['IsForced'] == true;
    if (aForced != bForced) {
      if (subtitleMode == SubtitleMode.forced) {
        return aForced ? -1 : 1;
      } else {
        return aForced ? 1 : -1;
      }
    }

    // 6. Default flag
    final aDefault = streamA['IsDefault'] == true;
    final bDefault = streamB['IsDefault'] == true;
    if (aDefault != bDefault) {
      return aDefault ? -1 : 1;
    }

    // 7. Tie-breaker: earlier stream index in the media container (smaller originalIndex is preferred)
    return a.originalIndex.compareTo(b.originalIndex);
  });

  return candidatesWithIndex.first.stream['Index'] as int?;
}

/// Maps the effective stream index to the dialog's 0-based option index,
/// where 0 is the "None" row and 1+ are stream rows.
int computeSubtitleDialogSelectedIndex(
  List<Map<String, dynamic>> displayStreams,
  int? effectiveSubtitleIndex,
) {
  if (effectiveSubtitleIndex != null) {
    if (effectiveSubtitleIndex == -1) return 0;
    final idx =
        displayStreams.indexWhere((s) => s['Index'] == effectiveSubtitleIndex);
    return idx == -1 ? 0 : idx + 1;
  }
  return displayStreams.indexWhere((s) => s['IsDefault'] == true) + 1;
}

/// Where a row of a subtitle menu points when the menu offers both the
/// server's subtitle streams and the captions the player found inside the
/// video. Row 0 is off, the streams follow, and the captions come last so
/// their arrival part way through a channel can't renumber the streams a
/// viewer already picked from.
///
/// Both positions are null for the off row and for a row past the end.
({int? streamPosition, int? captionPosition}) subtitleMenuRowTarget({
  required int row,
  required int streamCount,
  required int captionCount,
}) {
  if (row <= 0) return (streamPosition: null, captionPosition: null);
  if (row <= streamCount) {
    return (streamPosition: row - 1, captionPosition: null);
  }
  final captionPosition = row - streamCount - 1;
  if (captionPosition >= captionCount) {
    return (streamPosition: null, captionPosition: null);
  }
  return (streamPosition: null, captionPosition: captionPosition);
}

/// The row to mark as selected, given whichever of the two is active. A
/// caption wins when both are set, since selecting one turns the other off.
int subtitleMenuSelectedRow({
  required int streamPosition,
  required int captionPosition,
  required int streamCount,
}) {
  if (captionPosition >= 0) return streamCount + captionPosition + 1;
  if (streamPosition >= 0) return streamPosition + 1;
  return 0;
}

/// Maps a dialog result back to a stream index for state storage.
/// Returns -1 when the user selected "None" (result == 0).
int? mapSubtitleResultToStreamIndex(
  int result,
  List<Map<String, dynamic>> displayStreams,
) {
  if (result == 0) return -1;
  final streamPosition = result - 1;
  if (streamPosition >= 0 && streamPosition < displayStreams.length) {
    return displayStreams[streamPosition]['Index'] as int?;
  }
  return null;
}

/// Leading track numbers vary between files, so they are dropped before two
/// titles are compared.
final _trackNumberPrefix = RegExp(r'^\d+\s*-\s*');

String _normalizedTitle(String raw) =>
    raw.replaceAll(_trackNumberPrefix, '').trim().toLowerCase();

String _normalizedStreamTitle(Map<String, dynamic> stream) => _normalizedTitle(
  (stream['Title'] ?? stream['DisplayTitle'] ?? stream['Name']) as String? ?? '',
);

/// The stream in [streams] that best answers a remembered choice, or null when
/// none of them can be it.
///
/// The title comes first because it survives files listing their tracks in a
/// different order, then the position among same-language tracks, then a looser
/// title match for releases that word the same track slightly differently.
int? matchSeriesTrackIndex({
  required List<Map<String, dynamic>> streams,
  required SeriesTrackPreference pref,
}) {
  if (pref.isEmpty) return null;
  if (pref.isNone) return -1;

  final targetTitle = _normalizedTitle(pref.title);

  // An untagged track leaves only its title to go on. Falling back to position
  // there would hand back some unrelated track, so it matches or it doesn't.
  if (pref.language.isEmpty) {
    final candidates = streams.where((s) => s['Index'] != null);
    return _titleMatch(candidates, targetTitle, loose: false) ??
        _titleMatch(candidates, targetTitle);
  }

  final normPref = normalizeLanguage(pref.language);
  final iso3Pref = toIso3Language(normPref);
  final matchingStreams = streams
      .where((s) => s['Index'] != null)
      .where(
        (s) => languageMatchesPreferred(
          s['Language'] as String? ?? '',
          normPref,
          iso3Pref,
        ),
      )
      .toList();
  if (matchingStreams.isEmpty) return null;

  final exact = _titleMatch(matchingStreams, targetTitle, loose: false);
  if (exact != null) return exact;

  if (pref.relativeIndex >= 0 && pref.relativeIndex < matchingStreams.length) {
    return matchingStreams[pref.relativeIndex]['Index'] as int?;
  }

  return _titleMatch(matchingStreams, targetTitle) ??
      matchingStreams.first['Index'] as int?;
}

/// The first stream whose title reads as [targetTitle], or null. A [loose]
/// match also accepts one title containing the other, for releases that word
/// the same track slightly differently.
int? _titleMatch(
  Iterable<Map<String, dynamic>> streams,
  String targetTitle, {
  bool loose = true,
}) {
  if (targetTitle.isEmpty) return null;
  for (final stream in streams) {
    final streamTitle = _normalizedStreamTitle(stream);
    if (streamTitle.isEmpty) continue;
    final hit = loose
        ? streamTitle.contains(targetTitle) || targetTitle.contains(streamTitle)
        : streamTitle == targetTitle;
    if (hit) return stream['Index'] as int?;
  }
  return null;
}

SeriesTrackPreference createSeriesTrackPreferenceFromStream({
  required List<Map<String, dynamic>> streams,
  required int? selectedIndex,
}) {
  if (selectedIndex == null) return SeriesTrackPreference.empty;
  if (selectedIndex == -1) return SeriesTrackPreference.none;

  final selectedStream = streams.firstWhere(
    (s) => s['Index'] == selectedIndex,
    orElse: () => <String, dynamic>{},
  );

  if (selectedStream.isEmpty) return SeriesTrackPreference.empty;

  final language = selectedStream['Language'] as String? ?? '';
  final title = _normalizedStreamTitle(selectedStream);

  int relativeIndex = 0;
  final normLang = normalizeLanguage(language);
  final iso3Lang = toIso3Language(normLang);

  for (final stream in streams) {
    if (stream['Index'] == selectedIndex) break;
    final l = stream['Language'] as String? ?? '';
    if (languageMatchesPreferred(l, normLang, iso3Lang)) {
      relativeIndex++;
    }
  }

  return SeriesTrackPreference(
    language: language,
    title: title,
    relativeIndex: relativeIndex,
  );
}
