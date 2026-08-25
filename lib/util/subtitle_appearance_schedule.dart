import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';

/// How long to wait between checks while a freshly downloaded subtitle makes
/// its way into the item.
///
/// The server saves the file and then queues a metadata refresh, so the new
/// stream turns up some time after the download call has already returned. The
/// old schedule was eight fixed half-second checks: four seconds, which a busy
/// server misses more often than not, and the wait then ended on "it may take a
/// moment" with nothing left watching. These steps start tight so a quick
/// server still feels instant, then stretch out to cover about twenty seconds
/// without hammering the item endpoint the whole time.
const List<Duration> subtitleAppearanceDelays = <Duration>[
  Duration(milliseconds: 300),
  Duration(milliseconds: 300),
  Duration(milliseconds: 500),
  Duration(milliseconds: 700),
  Duration(seconds: 1),
  Duration(seconds: 1),
  Duration(milliseconds: 1500),
  Duration(seconds: 2),
  Duration(seconds: 2),
  Duration(seconds: 3),
  Duration(seconds: 3),
  Duration(seconds: 4),
];

/// Runs [probe] against the schedule above until it turns something up.
///
/// The three screens that download a subtitle all want the same thing - keep
/// asking the server until the new stream is listed - and differ only in how
/// they fetch and what they consider a hit, so the loop lives here with the
/// delays rather than being written out three times. [keepGoing] is the
/// caller's chance to stop early, which a screen that has been disposed does.
Future<T?> pollForSubtitleAppearance<T>(
  Future<T?> Function() probe, {
  bool Function()? keepGoing,
}) async {
  for (var attempt = 0; ; attempt++) {
    if (keepGoing != null && !keepGoing()) {
      return null;
    }

    final found = await probe();

    // Asked again after the probe as well as before it, so a screen that went
    // away mid-request doesn't have to check for itself in every prober.
    if (keepGoing != null && !keepGoing()) {
      return null;
    }
    if (found != null) {
      return found;
    }

    if (attempt >= subtitleAppearanceDelays.length) {
      return null;
    }
    await Future<void>.delayed(subtitleAppearanceDelays[attempt]);
  }
}

/// Only what the wait actually reads. The default item request pulls people,
/// chapters, trickplay tiles and the overview along with it, which is a lot of
/// payload to fetch thirteen times over for a look at the subtitle list - and
/// on two of the three screens it happens while a video is playing.
const String _subtitlePollFields = 'MediaSources,MediaStreams';

/// Waits for a subtitle whose index isn't in [existingIndexes] to appear on
/// [item], and hands back the stream itself.
///
/// [streamsOf] is for a caller that has to pick the streams out of a chosen
/// media source rather than off the item; the rest get the item's own list.
Future<Map<String, dynamic>?> awaitNewSubtitleStream({
  required MediaServerClient client,
  required AggregatedItem item,
  required Set<int> existingIndexes,
  List<Map<String, dynamic>> Function(AggregatedItem refreshed)? streamsOf,
  bool Function()? keepGoing,
}) {
  return pollForSubtitleAppearance<Map<String, dynamic>>(() async {
    try {
      final raw = await client.itemsApi.getItem(
        item.id,
        fields: _subtitlePollFields,
      );
      final refreshed = AggregatedItem(
        id: item.id,
        serverId: item.serverId,
        rawData: raw,
      );
      final streams = streamsOf?.call(refreshed) ?? refreshed.mediaStreams;
      for (final stream in streams) {
        if (stream['Type'] != 'Subtitle') {
          continue;
        }
        final index = stream['Index'] as int?;
        if (index != null && !existingIndexes.contains(index)) {
          return stream;
        }
      }
    } catch (_) {
      // A server that hiccups mid-wait gets another go on the next tick.
    }
    return null;
  }, keepGoing: keepGoing);
}
