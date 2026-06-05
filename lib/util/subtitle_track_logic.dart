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
  required bool defaultToNone,
  required String preferredLanguage,
  required bool preferSdh,
}) {
  if (selectedSubtitleIndex != null) return selectedSubtitleIndex;
  if (activePlaybackSubtitleIndex != null) return activePlaybackSubtitleIndex;

  if (defaultToNone) {
    if (subtitleStreams.isNotEmpty) {
      return subtitleStreams.first['Index'] as int?;
    }
    return -1;
  }

  final preferred = preferredLanguage.trim();
  if (preferred.isEmpty) return null;

  final preferredNormalized = normalizeLanguage(preferred);
  final preferredIso3 = toIso3Language(preferredNormalized);

  Map<String, dynamic>? bestStream;
  var bestScore = -(subtitleStreams.length + 1);

  for (var i = 0; i < subtitleStreams.length; i++) {
    final stream = subtitleStreams[i];
    if (!languageMatchesPreferred(
      (stream['Language'] as String?)?.trim(),
      preferredNormalized,
      preferredIso3,
    )) {
      continue;
    }

    final streamIndex = stream['Index'] as int?;
    if (streamIndex == null) continue;

    var score = 0;
    if (isSdhSubtitleStream(stream) == preferSdh) score += 100;
    if (!isExternalSubtitleStream(stream)) score += 10;
    if (stream['IsDefault'] == true) score += 5;
    score = score * 1000 - i;

    if (score > bestScore) {
      bestScore = score;
      bestStream = stream;
    }
  }

  if (bestStream != null) return bestStream['Index'] as int?;
  if (subtitleStreams.isNotEmpty) return subtitleStreams.first['Index'] as int?;
  return null;
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
  if (result - 1 < displayStreams.length) {
    return displayStreams[result - 1]['Index'] as int?;
  }
  return null;
}
