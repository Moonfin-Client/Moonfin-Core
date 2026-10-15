import 'subtitle_track_logic.dart';

/// Subtitle streams a transcoded download can only keep by burning them into
/// the video. Image formats (PGS, VobSub, DVB) can't ride along as a text
/// sidecar, and the transcoded file itself carries no subtitle tracks.
List<Map<String, dynamic>> burnInSubtitleCandidates(
  List<Map<String, dynamic>> streams,
) => streams
    .where((s) => s['Type'] == 'Subtitle' && !isTextSubtitleStream(s))
    .toList();

/// The burn-in track preselected for a download: the one normal playback
/// would show ([effectiveIndex]), when it is one of [candidates]. Null means
/// no burn-in.
int? defaultBurnInSubtitleIndex({
  required List<Map<String, dynamic>> candidates,
  required int? effectiveIndex,
}) => candidates.any((s) => s['Index'] == effectiveIndex)
    ? effectiveIndex
    : null;

/// Stream query parameters that burn [subtitleIndex] into a transcoded
/// download. Empty when no track was chosen.
Map<String, String> burnInSubtitleParams(int? subtitleIndex) =>
    subtitleIndex == null
    ? const {}
    : {
        'SubtitleStreamIndex': subtitleIndex.toString(),
        'SubtitleMethod': 'Encode',
      };

/// Whether [stream] is saved as a sidecar file next to a download. Only text
/// subtitles qualify: the server serves those as files, while an image track
/// requested that way comes back as an error.
bool downloadsAsSubtitleSidecar(Map<String, dynamic> stream) =>
    stream['Type'] == 'Subtitle' &&
    (stream['IsExternal'] == true ||
        stream['SupportsExternalStream'] == true) &&
    isTextSubtitleStream(stream);
