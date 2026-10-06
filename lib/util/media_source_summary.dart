/// The source's streams as typed maps, or none when the server sent none.
List<Map<String, dynamic>> mediaSourceStreams(
  Map<String, dynamic> mediaSource,
) =>
    (mediaSource['MediaStreams'] as List?)
        ?.whereType<Map>()
        .map((e) => e.cast<String, dynamic>())
        .toList() ??
    const [];

/// Whole megabytes up to 999, then gigabytes to two places. Null when the
/// server sent no size.
String? formatMediaSourceSize(int bytes) {
  if (bytes <= 0) return null;
  final mb = bytes / (1024 * 1024);
  if (mb > 999) return '${(mb / 1024).toStringAsFixed(2)} GB';
  return '${mb.toStringAsFixed(0)} MB';
}

/// Codec with its profile, resolution, frame rate, bit depth and range, in
/// that order, skipping what the stream lacks.
List<String> videoStreamSummary(
  Map<String, dynamic> video, {
  required String unknownCodec,
}) {
  final codec = video['Codec']?.toString().toUpperCase() ?? unknownCodec;
  final profile = video['Profile']?.toString();
  final width = video['Width']?.toString();
  final height = video['Height']?.toString();
  final frameRate = video['RealFrameRate'] ?? video['AverageFrameRate'];
  final bitDepth = video['BitDepth'] as int?;
  final videoRange = video['VideoRange']?.toString();
  final videoRangeType = video['VideoRangeType']?.toString();

  final details = <String>[
    profile != null && profile.isNotEmpty ? '$codec ($profile)' : codec,
  ];
  if (width != null && height != null) details.add('$width x $height');
  final fps = frameRate == null ? null : double.tryParse(frameRate.toString());
  if (fps != null) details.add('${fps.toStringAsFixed(3)} fps');
  if (bitDepth != null) details.add('$bitDepth-bit');
  if (videoRange != null && videoRange.isNotEmpty) {
    details.add(
      videoRangeType != null && videoRangeType.isNotEmpty
          ? '$videoRange ($videoRangeType)'
          : videoRange,
    );
  }
  return details;
}

/// A stream's language code in upper case, or [unknown] without one.
String streamLanguageLabel(String? code, {required String unknown}) =>
    code == null || code.isEmpty ? unknown : code.toUpperCase();
