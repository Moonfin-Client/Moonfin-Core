import 'language_matching.dart';

bool isCommentaryAudioStream(Map<String, dynamic> stream) {
  if (stream['IsCommentary'] == true) return true;
  final titleParts = [
    stream['DisplayTitle'] as String?,
    stream['Title'] as String?,
    stream['Name'] as String?,
  ].whereType<String>().map((s) => s.toLowerCase()).join(' ');
  return RegExp(
    r'\b(commentary|director\s*commentary|commentaries|directors\s*commentary)\b',
  ).hasMatch(titleParts);
}

bool isAudioDescriptionAudioStream(Map<String, dynamic> stream) {
  if (stream['IsAudioDescription'] == true) return true;
  final titleParts = [
    stream['DisplayTitle'] as String?,
    stream['Title'] as String?,
    stream['Name'] as String?,
  ].whereType<String>().map((s) => s.toLowerCase()).join(' ');
  return RegExp(
    r'\b(audio\s+description|descriptive\s+audio|visual\s+description|descriptive|description|ad)\b',
  ).hasMatch(titleParts);
}

bool matchLang(String? streamLanguage, String target) {
  final targetClean = target.trim();
  if (targetClean.isEmpty || targetClean.toLowerCase() == 'auto') return false;
  final targetNormalized = normalizeLanguage(targetClean);
  final targetIso3 = toIso3Language(targetNormalized);
  return languageMatchesPreferred(streamLanguage, targetNormalized, targetIso3);
}

int? computeEffectiveAudioIndex({
  required List<Map<String, dynamic>> audioStreams,
  required String preferredAudioLanguage,
  required String fallbackAudioLanguage,
  required bool preferDefaultAudioTrack,
  required bool preferAudioDescription,
  int? explicitAudioIndex,
}) {
  final streams = audioStreams.where((s) => s['Type'] == 'Audio').toList();
  if (streams.isEmpty) return null;

  // 1. Explicit selection check
  if (explicitAudioIndex != null) {
    final hasExplicit = streams.any((s) => s['Index'] == explicitAudioIndex);
    if (hasExplicit) return explicitAudioIndex;
  }

  // 2. Filter commentary tracks
  final nonCommentary = streams.where((s) => !isCommentaryAudioStream(s)).toList();
  var candidates = nonCommentary.isNotEmpty ? nonCommentary : streams;

  // 3. Filter audio description tracks if not preferred
  if (!preferAudioDescription) {
    final nonAd = candidates.where((s) => !isAudioDescriptionAudioStream(s)).toList();
    if (nonAd.isNotEmpty) {
      candidates = nonAd;
    }
  }

  // 4. Prefer Default Audio Track
  if (preferDefaultAudioTrack) {
    final defaultTracks = candidates.where((s) => s['IsDefault'] == true).toList();
    if (defaultTracks.isNotEmpty) {
      return _rankAudioCandidates(defaultTracks, preferDefaultAudioTrack, preferAudioDescription)['Index'] as int?;
    }
  }

  // 5. Match preferred language
  final preferredMatches = candidates.where((s) => matchLang(s['Language'], preferredAudioLanguage)).toList();
  if (preferredMatches.isNotEmpty) {
    return _rankAudioCandidates(preferredMatches, preferDefaultAudioTrack, preferAudioDescription)['Index'] as int?;
  }

  // 6. Match fallback language
  final fallbackMatches = candidates.where((s) => matchLang(s['Language'], fallbackAudioLanguage)).toList();
  if (fallbackMatches.isNotEmpty) {
    return _rankAudioCandidates(fallbackMatches, preferDefaultAudioTrack, preferAudioDescription)['Index'] as int?;
  }

  // 7. Match English fallback
  final englishMatches = candidates.where((s) => matchLang(s['Language'], 'eng')).toList();
  if (englishMatches.isNotEmpty) {
    return _rankAudioCandidates(englishMatches, preferDefaultAudioTrack, preferAudioDescription)['Index'] as int?;
  }

  // 8. Fall back to default track or first candidate
  return _rankAudioCandidates(candidates, preferDefaultAudioTrack, preferAudioDescription)['Index'] as int?;
}

Map<String, dynamic> _rankAudioCandidates(
  List<Map<String, dynamic>> candidates,
  bool preferDefaultAudioTrack,
  bool preferAudioDescription,
) {
  if (candidates.length <= 1) return candidates.first;
  final list = List<Map<String, dynamic>>.from(candidates);
  list.sort((a, b) {
    if (preferAudioDescription) {
      final aAd = isAudioDescriptionAudioStream(a);
      final bAd = isAudioDescriptionAudioStream(b);
      if (aAd != bAd) {
        return aAd ? -1 : 1;
      }
    }
    if (preferDefaultAudioTrack) {
      final aDefault = a['IsDefault'] == true;
      final bDefault = b['IsDefault'] == true;
      if (aDefault != bDefault) {
        return aDefault ? -1 : 1;
      }
    }
    // Prefer higher channel count (surround sound)
    final aChannels = a['Channels'] as int? ?? 0;
    final bChannels = b['Channels'] as int? ?? 0;
    if (aChannels != bChannels) {
      return bChannels.compareTo(aChannels);
    }
    // If not preferDefaultAudioTrack, check IsDefault here as a tie-breaker
    if (!preferDefaultAudioTrack) {
      final aDefault = a['IsDefault'] == true;
      final bDefault = b['IsDefault'] == true;
      if (aDefault != bDefault) {
        return aDefault ? -1 : 1;
      }
    }
    // Tie-breaker: original index
    final aIdx = a['Index'] as int? ?? 0;
    final bIdx = b['Index'] as int? ?? 0;
    return aIdx.compareTo(bIdx);
  });
  return list.first;
}
