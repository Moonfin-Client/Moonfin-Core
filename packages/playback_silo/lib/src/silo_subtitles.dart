import 'package:playback_core/playback_core.dart';
import 'package:server_silo/server_silo.dart';

import 'silo_capabilities_translator.dart' show siloDeliveryOriginal;
import 'silo_plan_mapper.dart';

// The combined order lives in server_silo, which remembers a series'
// subtitle by it. Playback code keeps reaching it from here.
export 'package:server_silo/server_silo.dart'
    show siloSubtitleOrder, siloSubtitleCombinedIndex;

/// Subtitles between Moonfin and a Silo plan.
///
/// Silo numbers a file's subtitles in one **combined** space: its external
/// sidecar files first, then the tracks embedded in the container, then
/// downloaded subtitles, densely from 0, and names a track
/// `file:<file id>:subtitle:<combined index>`. Moonfin numbers them as
/// Jellyfin does, inside the file's single stream index space (an embedded
/// track keeps its container index, a sidecar takes a free one).
/// Silo's version answer lists the embedded tracks first and the sidecars
/// after them (`external: true`), so the combined index of a Moonfin stream
/// is its place among the external ones, or the external count plus its
/// place among the embedded ones. Downloaded subtitles exist only in a
/// plan's inventory, and Moonfin gives them indices after the file's own.

/// Silo's identity for Moonfin's subtitle stream [index]
/// (`{id: file:<file>:subtitle:<combined>, index: <combined>}`).
Map<String, dynamic>? siloSubtitleIdentity(
  Map<String, dynamic>? source,
  int? index, {
  required String fileId,
}) {
  final combined = siloSubtitleCombinedIndex(source, index);
  if (combined == null) return null;
  return {'id': 'file:$fileId:subtitle:$combined', 'index': combined};
}

/// Silo's combined subtitle indices mapped to Moonfin's stream indices, for
/// the file [source] a [plan] plays: the file's own subtitles in combined
/// order, then the plan's downloaded ones on indices after the file's highest.
Map<int, int> siloSubtitleIndexByCombined(
  Map<String, dynamic> plan,
  Map<String, dynamic>? source,
) {
  final byCombined = <int, int>{};
  for (final (i, index) in siloSubtitleOrder(source).indexed) {
    byCombined[i] = index;
  }
  var next = siloNextStreamIndex(source);
  final subtitle = plan['subtitle'];
  final inventory = subtitle is Map ? subtitle['inventory'] : null;
  for (final e in inventory is List ? inventory : const []) {
    if (e is! Map || e['source'] != 'downloaded') continue;
    final combined = e['combined_index'];
    if (combined is! int || byCombined.containsKey(combined)) continue;
    byCombined[combined] = next++;
  }
  return byCombined;
}

/// What a plan's `subtitle` block gives Moonfin's stream description.
class SiloPlanSubtitles {
  const SiloPlanSubtitles({
    required this.mediaStreams,
    required this.externalSubtitles,
    this.selectedStreamIndex,
  });

  /// The file's streams, with any downloaded subtitles after them and the
  /// selected track marked when Silo burns it in.
  final List<Map<String, dynamic>> mediaStreams;

  /// Every sidecar the plan publishes, as Moonfin's external subtitles.
  final List<ExternalSubtitle> externalSubtitles;

  /// The track Silo selected, as Moonfin's index, or -1 for subtitles off.
  final int? selectedStreamIndex;
}

/// Reads a plan's `subtitle` block (mode, selected track, inventory) for
/// the file [source] it plays.
///
/// - **Sidecars.** Each inventory entry Silo publishes a URL for becomes an
///   [ExternalSubtitle] on Moonfin's stream index, the URL on the server
///   with the account's token: sidecar files and downloaded subtitles, and
///   the embedded tracks Silo extracts. The playback manager loads the
///   embedded ones only when the stream doesn't carry them (a remux or
///   transcode). On the original file the player shows them from the file.
///   Bitmap sidecars (`.sup`) are left out: Moonfin loads none, so a bitmap
///   on a remux is burned in by Silo, as told.
/// - **On a remux or transcode** only the embedded track Silo selected and
///   the one the player asked for ([requestedStreamIndex]) are handed out.
///   Silo reads the whole file to extract one the first time (minutes on a
///   large file), and the player loads every sidecar before it shows any.
///   Picking another track asks Silo for a new plan.
/// - **Downloaded subtitles** (beyond the file's own) get Moonfin indices
///   after the highest stream index, as external text streams.
/// - **The selection:** `subtitle.track_id` back to Moonfin's index, or -1
///   when the mode is `off`. A burned-in track is marked `DeliveryMethod:
///   Encode` (on this stream's copy), so Moonfin doesn't draw a second copy
///   over the one in the picture.
SiloPlanSubtitles siloPlanSubtitles({
  required Map<String, dynamic> plan,
  required Map<String, dynamic>? source,
  required String baseUrl,
  String? accessToken,
  int? requestedStreamIndex,
}) {
  final subtitle = (plan['subtitle'] as Map?)?.cast<String, dynamic>() ?? {};
  final inventory = [
    for (final e in (subtitle['inventory'] as List?) ?? const [])
      if (e is Map) e.cast<String, dynamic>(),
  ];
  final streams = [
    for (final s in (source?['MediaStreams'] as List?) ?? const [])
      if (s is Map) Map<String, dynamic>.of(s.cast<String, dynamic>()),
  ];
  final byCombined = siloSubtitleIndexByCombined(plan, source);
  final own = siloSubtitleOrder(source).toSet();
  for (final entry in inventory) {
    final combined = entry['combined_index'];
    final index = combined is int ? byCombined[combined] : null;
    if (index == null || own.contains(index)) continue;
    streams.add(
      siloAddedSubtitleStream(
        index: index,
        codec: entry['codec'] as String?,
        language: entry['language'] as String?,
        label: entry['label'] as String?,
        forced: entry['forced'] == true,
        hearingImpaired: entry['hearing_impaired'] == true,
      ),
    );
  }

  int? selected;
  final mode = subtitle['mode'];
  if (mode == 'off') {
    selected = -1;
  } else {
    final combined = _combinedOf(subtitle['track_id']);
    selected = combined == null ? null : byCombined[combined];
    if (mode == 'burn_in' && selected != null) {
      for (final s in streams) {
        if (s['Type'] == 'Subtitle' && s['Index'] == selected) {
          s['DeliveryMethod'] = 'Encode';
        }
      }
    }
  }

  final original = plan['delivery'] == siloDeliveryOriginal;
  final external = <ExternalSubtitle>[];
  for (final entry in inventory) {
    final url = entry['url'];
    final combined = entry['combined_index'];
    final index = combined is int ? byCombined[combined] : null;
    if (url is! String || url.isEmpty || index == null) continue;
    if (entry['delivery'] != 'sidecar') continue;
    if (!original &&
        entry['source'] == 'embedded' &&
        index != selected &&
        index != requestedStreamIndex) {
      continue;
    }
    final codec = _sidecarFormat(url);
    if (codec == null) continue;
    final absolute = siloPlanUrl(baseUrl, url);
    external.add(
      ExternalSubtitle(
        deliveryUrl: accessToken == null
            ? absolute
            : siloAuthorizeUrl(absolute, baseUrl, accessToken),
        title: entry['label'] as String?,
        language: entry['language'] as String?,
        codec: codec,
        isDefault: entry['default'] == true,
        isForced: entry['forced'] == true,
        streamIndex: index,
      ),
    );
  }

  return SiloPlanSubtitles(
    mediaStreams: streams,
    externalSubtitles: external,
    selectedStreamIndex: selected,
  );
}

/// `file:4598:subtitle:3` gives 3.
int? _combinedOf(Object? trackId) {
  if (trackId is! String) return null;
  final match = RegExp(r':subtitle:(\d+)$').firstMatch(trackId);
  return match == null ? null : int.parse(match.group(1)!);
}

/// The sidecar's format from its URL's suffix, which is part of Silo's
/// contract: `.vtt` WebVTT, `.ass` ASS/SSA, `.srt` SubRip. A bitmap
/// (`.sup`) answers null.
String? _sidecarFormat(String url) {
  final path = Uri.tryParse(url)?.path.toLowerCase() ?? url.toLowerCase();
  if (path.endsWith('.vtt')) return 'vtt';
  if (path.endsWith('.ass')) return 'ass';
  if (path.endsWith('.ssa')) return 'ssa';
  if (path.endsWith('.srt')) return 'srt';
  return null;
}
