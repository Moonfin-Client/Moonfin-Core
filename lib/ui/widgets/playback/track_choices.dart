import 'package:playback_core/playback_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/subtitle_track_logic.dart';
import '../track_selector_dialog.dart';

/// The audio or subtitle tracks of what is playing, as the track picker lists
/// them, with the current one picked out. Shared by the full player and the
/// mini player so both offer the same list in the same order.
class TrackChoices {
  final List<Map<String, dynamic>> allStreams;

  final List<Map<String, dynamic>> streams;

  /// [streams] in the order the options list them. Subtitles are sorted;
  /// audio keeps the item's order.
  final List<Map<String, dynamic>> optionStreams;

  /// One per [optionStreams] entry, after an "Off" row for subtitles.
  final List<TrackOption> options;

  /// The option of the track playing now, or null when it can't be told.
  final int? selectedIndex;

  final bool audio;

  const TrackChoices._({
    required this.allStreams,
    required this.streams,
    required this.optionStreams,
    required this.options,
    required this.selectedIndex,
    required this.audio,
  });

  static Future<TrackChoices> load(
    PlaybackManager manager,
    AppLocalizations l10n, {
    required bool audio,
  }) async {
    final streamType = audio ? 'Audio' : 'Subtitle';
    final offlineMeta = manager.currentOfflineMetadata;
    final allStreams =
        manager.currentResolution?.mediaStreams ??
        (offlineMeta?['MediaStreams'] as List?)?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];
    final streams = allStreams.where((s) => s['Type'] == streamType).toList();
    final optionStreams = audio ? streams : sortedSubtitleStreams(streams);

    final int? currentStreamIndex;
    if (audio) {
      currentStreamIndex =
          manager.audioStreamIndex ??
          streams.where((s) => s['IsDefault'] == true).firstOrNull?['Index']
              as int?;
    } else {
      final subIdx = await manager.getSubtitleStreamIndexAsync();
      currentStreamIndex =
          subIdx ??
          streams.where((s) => s['IsDefault'] == true).firstOrNull?['Index']
              as int?;
    }
    final isSubsOff = !audio && currentStreamIndex == -1;

    final options = <TrackOption>[
      if (!audio) TrackOption(label: l10n.off),
      ...optionStreams.asMap().entries.map((entry) {
        final index = entry.key;
        final trackNumber = index + 1;
        final s = entry.value;
        final displayTitle = s['DisplayTitle'] as String?;
        final title = s['Title'] as String?;
        final language = s['Language'] as String?;
        final codec = s['Codec'] as String?;
        final label =
            displayTitle ??
            title ??
            language ??
            l10n.streamTypeFallback(streamType, index + 1);
        final subtitle = audio
            ? [
                if (language != null && displayTitle != null) language,
                if (codec != null) codec.toUpperCase(),
                if (s['Channels'] != null) '${s['Channels']}ch',
              ].join(' · ')
            : (() {
                final subtitleType =
                    ((codec == null || codec.isEmpty) ? 'Unknown' : codec)
                        .toUpperCase();
                final deliveryMethod = (s['DeliveryMethod'] as String?)
                    ?.trim()
                    .toLowerCase();
                final location = s['IsExternal'] == true
                    ? 'External'
                    : (deliveryMethod == 'embed' ? 'Embedded' : 'Internal');
                return '$subtitleType · $location';
              })();
        return TrackOption(
          label: '$trackNumber - $label',
          subtitle: subtitle.isNotEmpty ? subtitle : null,
          scrollLabel: true,
          scrollSubtitle: true,
        );
      }),
    ];

    final int? selectedIndex;
    if (audio) {
      final idx = currentStreamIndex != null
          ? streams.indexWhere((s) => s['Index'] == currentStreamIndex)
          : -1;
      selectedIndex = idx >= 0 ? idx : null;
    } else if (isSubsOff ||
        (currentStreamIndex == null && streams.isNotEmpty)) {
      selectedIndex = 0;
    } else if (currentStreamIndex != null) {
      final idx = optionStreams.indexWhere(
        (s) => s['Index'] == currentStreamIndex,
      );
      selectedIndex = idx >= 0 ? idx + 1 : null;
    } else {
      selectedIndex = null;
    }

    return TrackChoices._(
      allStreams: allStreams,
      streams: streams,
      optionStreams: optionStreams,
      options: options,
      selectedIndex: selectedIndex,
      audio: audio,
    );
  }

  /// The stream index [result] stands for, -1 for subtitles off, or null when
  /// [result] is past the tracks (an extra row the caller appended).
  int? streamIndexFor(int result) {
    if (audio) {
      if (result >= streams.length) return null;
      return streams[result]['Index'] as int? ?? result;
    }
    if (result == 0) return -1;
    final streamIdx = result - 1;
    if (streamIdx >= optionStreams.length) return null;
    return optionStreams[streamIdx]['Index'] as int? ?? streamIdx;
  }
}
