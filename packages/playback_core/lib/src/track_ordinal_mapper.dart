import 'stream_resolution_result.dart';

/// Pure mapping between Jellyfin `MediaStream` indices and the 1-based track
/// ordinals handed to player backends.
///
/// The ordinal contract: tracks of a type are numbered 1..N in the order the
/// player actually sees them, meaning embedded tracks in `MediaStreams` order
/// first (absent when the stream is transcoded/remuxed, which strips them),
/// then the sub-added external files in add order. The list returned by
/// [effectiveExternalSubtitles] is that add order, so the forward and reverse
/// mappings and the sub-add loop can never disagree about it.
class TrackOrdinalMapper {
  TrackOrdinalMapper._();

  /// The exact list of external subtitles that should be sub-added to the
  /// player, in add order.
  ///
  /// Servers deliver some *embedded* text subtitles as external URLs too
  /// (`SupportsExternalStream` + `DeliveryUrl`). Under transcode/directStream
  /// the embedded originals are stripped from the stream, so every
  /// externally-delivered entry must be added. Under direct play the
  /// embedded originals are already demuxed from the container, so their
  /// externally-delivered copies are skipped to avoid duplicate tracks.
  /// Entries whose stream index is not found among embedded MediaStreams are
  /// kept (treated as external).
  static List<ExternalSubtitle> effectiveExternalSubtitles({
    required List<Map<String, dynamic>> mediaStreams,
    required List<ExternalSubtitle> externalSubtitles,
    required bool embeddedStripped,
  }) {
    if (embeddedStripped) return externalSubtitles;
    final embeddedIndices = mediaStreams
        .where((s) => s['Type'] == 'Subtitle' && s['IsExternal'] != true)
        .map((s) => s['Index'])
        .whereType<int>()
        .toSet();
    return externalSubtitles
        .where((s) => !embeddedIndices.contains(s.streamIndex))
        .toList();
  }

  /// The number of embedded subtitle tracks the player demuxes from the
  /// stream. External sub-add ordinals start after this count, and callers
  /// waiting for the demux to finish must wait for this same number.
  static int embeddedSubtitleCount({
    required List<Map<String, dynamic>> mediaStreams,
    required bool embeddedStripped,
  }) {
    if (embeddedStripped) return 0;
    return mediaStreams
        .where((s) => s['Type'] == 'Subtitle' && s['IsExternal'] != true)
        .length;
  }

  /// Converts a Jellyfin `MediaStream.Index` into the backend track ordinal.
  ///
  /// [externalSubtitles] is the resolution's external-delivery list; pass
  /// `null` when there is no online resolution (offline playback), which
  /// falls back to counting `IsExternal` streams positionally, matching the
  /// order offline launchers add downloaded external subs in.
  static int? mpvTrackIdForStream({
    required int streamIndex,
    required String type,
    required List<Map<String, dynamic>> mediaStreams,
    required List<ExternalSubtitle>? externalSubtitles,
    required bool embeddedStripped,
  }) {
    if (mediaStreams.isEmpty) return null;
    final typeStreams = mediaStreams.where((s) => s['Type'] == type).toList();
    if (typeStreams.isEmpty) return null;

    if (type == 'Subtitle') {
      final embeddedCount = embeddedSubtitleCount(
        mediaStreams: mediaStreams,
        embeddedStripped: embeddedStripped,
      );

      if (externalSubtitles != null) {
        final effective = effectiveExternalSubtitles(
          mediaStreams: mediaStreams,
          externalSubtitles: externalSubtitles,
          embeddedStripped: embeddedStripped,
        );
        final externalPos = effective.indexWhere(
          (s) => s.streamIndex == streamIndex,
        );
        if (externalPos >= 0) {
          return embeddedCount + externalPos + 1;
        }
      } else {
        // Legacy offline accounting: externals in IsExternal stream order.
        final target = typeStreams.firstWhere(
          (s) => s['Index'] == streamIndex,
          orElse: () => const <String, dynamic>{},
        );
        if (target['IsExternal'] == true) {
          final externalStreams = typeStreams
              .where((s) => s['IsExternal'] == true)
              .toList();
          final externalPos = externalStreams.indexWhere(
            (s) => s['Index'] == streamIndex,
          );
          if (externalPos < 0) return null;
          return embeddedCount + externalPos + 1;
        }
      }

      if (embeddedStripped) return null;
      final embeddedStreams = typeStreams
          .where((s) => s['IsExternal'] != true)
          .toList();
      final embeddedPos = embeddedStreams.indexWhere(
        (s) => s['Index'] == streamIndex,
      );
      if (embeddedPos < 0) return null;
      return embeddedPos + 1;
    }

    final positional = typeStreams.indexWhere((s) => s['Index'] == streamIndex);
    if (positional < 0) return null;
    return positional + 1;
  }

  /// Inverse of [mpvTrackIdForStream].
  static int? streamIndexForMpvTrackId({
    required int mpvTrackId,
    required String type,
    required List<Map<String, dynamic>> mediaStreams,
    required List<ExternalSubtitle>? externalSubtitles,
    required bool embeddedStripped,
  }) {
    if (mediaStreams.isEmpty) return null;
    final typeStreams = mediaStreams.where((s) => s['Type'] == type).toList();
    if (typeStreams.isEmpty) return null;

    if (type == 'Subtitle') {
      final embeddedCount = embeddedSubtitleCount(
        mediaStreams: mediaStreams,
        embeddedStripped: embeddedStripped,
      );

      if (mpvTrackId > embeddedCount) {
        final externalPos = mpvTrackId - embeddedCount - 1;
        if (externalSubtitles != null) {
          final effective = effectiveExternalSubtitles(
            mediaStreams: mediaStreams,
            externalSubtitles: externalSubtitles,
            embeddedStripped: embeddedStripped,
          );
          if (externalPos < effective.length) {
            return effective[externalPos].streamIndex;
          }
          return null;
        }
        final externalStreams = typeStreams
            .where((s) => s['IsExternal'] == true)
            .toList();
        if (externalPos < externalStreams.length) {
          return externalStreams[externalPos]['Index'] as int?;
        }
        return null;
      }

      final embeddedStreams = typeStreams
          .where((s) => s['IsExternal'] != true)
          .toList();
      final embeddedPos = mpvTrackId - 1;
      if (embeddedPos >= 0 && embeddedPos < embeddedStreams.length) {
        return embeddedStreams[embeddedPos]['Index'] as int?;
      }
      return null;
    }

    final positional = mpvTrackId - 1;
    if (positional >= 0 && positional < typeStreams.length) {
      return typeStreams[positional]['Index'] as int?;
    }
    return null;
  }
}
