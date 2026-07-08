import 'package:playback_core/playback_core.dart';

import '../l10n/app_localizations.dart';

const Set<String> _bitrateOrResolutionReasons = <String>{
  'videobitratenotsupported',
  'containerbitrateexceedslimit',
  'videobitrateexceedslimit',
  'bitratelimitexceeded',
  'containerbitratenotsupported',
  'resolutionnotsupported',
  'audiobitratenotsupported',
};

const Set<String> _videoCodecReasons = <String>{
  'videocodecnotsupported',
  'videoprofilenotsupported',
  'videolevelnotsupported',
  'videoframeratenotsupported',
  'videorangenotsupported',
  'videorangetypenotsupported',
  'videobitdepthnotsupported',
  'anamorphicvideonotsupported',
  'interlacedvideonotsupported',
  'refframesnotsupported',
};

const Set<String> _audioCodecReasons = <String>{
  'audiocodecnotsupported',
  'audiochannelsnotsupported',
  'audioprofilenotsupported',
  'audiosampleratenotsupported',
  'audiobitdepthnotsupported',
};

String playbackMethodLabel({
  required AppLocalizations l10n,
  StreamPlayMethod? playMethod,
  List<String> transcodingReasons = const <String>[],
  String? fallbackPlayMethod,
}) {
  final lowerReasons = transcodingReasons
      .map((e) => e.toLowerCase())
      .toList(growable: false);

  if (playMethod != null) {
    if (playMethod == StreamPlayMethod.directPlay) {
      return l10n.directPlay;
    }
    if (playMethod == StreamPlayMethod.directStream) {
      return '${l10n.directStream} (Remux)';
    }
    if (playMethod == StreamPlayMethod.transcode) {
      final isBitrateOrRes = lowerReasons.any(_bitrateOrResolutionReasons.contains);
      final hasVideoCodec = lowerReasons.any(_videoCodecReasons.contains);
      final hasAudioCodec = lowerReasons.any(_audioCodecReasons.contains);

      final base = l10n.transcoding;
      if (isBitrateOrRes) {
        return '$base (Bitrate or Resolution)';
      } else if (hasVideoCodec && hasAudioCodec) {
        return '$base (Video & Audio)';
      } else if (hasVideoCodec) {
        return '$base (Video)';
      } else if (hasAudioCodec) {
        return l10n.transcodingAudio.isNotEmpty
            ? l10n.transcodingAudio
            : '$base (Audio)';
      } else {
        return base;
      }
    }
  }

  return switch (fallbackPlayMethod) {
    'directPlay' => l10n.directPlay,
    'directStream' => l10n.directStream,
    'transcode' => l10n.transcoding,
    _ => l10n.unknown,
  };
}
