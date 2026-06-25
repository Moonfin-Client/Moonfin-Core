import 'dart:ui' as ui;
import '../preference/preference_constants.dart';
import 'language_matching.dart';

bool isExternalSubtitleStream(Map<String, dynamic> stream) {
  if (stream['IsExternal'] == true) return true;
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

    // 2. SDH Match
    final aSdhMatch = isSdhSubtitleStream(streamA) == preferSdh;
    final bSdhMatch = isSdhSubtitleStream(streamB) == preferSdh;
    if (aSdhMatch != bSdhMatch) {
      return aSdhMatch ? -1 : 1;
    }

    // 3. Internal vs External (internal over external)
    final aInternal = !isExternalSubtitleStream(streamA);
    final bInternal = !isExternalSubtitleStream(streamB);
    if (aInternal != bInternal) {
      return aInternal ? -1 : 1;
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
