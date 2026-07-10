import 'package:playback_core/playback_core.dart';

import '../l10n/app_localizations.dart';

const Set<String> _bitrateOrResolutionReasons = <String>{
  'videobitratenotsupported',
  'containerbitrateexceedslimit',
  'videobitrateexceedslimit',
  'bitratelimitexceeded',
  'containerbitratenotsupported',
  'videoresolutionnotsupported',
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
      return l10n.directStreamRemux;
    }
    if (playMethod == StreamPlayMethod.transcode) {
      final isBitrateOrRes = lowerReasons.any(_bitrateOrResolutionReasons.contains);
      final hasVideoCodec = lowerReasons.any(_videoCodecReasons.contains);
      final hasAudioCodec = lowerReasons.any(_audioCodecReasons.contains);

      if (isBitrateOrRes) {
        return l10n.transcodingBitrateOrResolution;
      } else if (hasVideoCodec && hasAudioCodec) {
        return l10n.transcodingVideoAndAudio;
      } else if (hasVideoCodec) {
        return l10n.transcodingVideo;
      } else if (hasAudioCodec) {
        return l10n.transcodingAudio;
      } else {
        return l10n.transcoding;
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
