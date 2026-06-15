import 'package:playback_core/playback_core.dart';

import '../l10n/app_localizations.dart';

const Set<String> _videoReEncodeReasons = <String>{
  'videocodecnotsupported',
  'videoprofilenotsupported',
  'videolevelnotsupported',
  'videoresolutionnotsupported',
  'videobitratenotsupported',
  'videoframeratenotsupported',
  'videorangenotsupported',
  'videorangetypenotsupported',
  'videobitdepthnotsupported',
  'anamorphicvideonotsupported',
  'interlacedvideonotsupported',
  'refframesnotsupported',
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
  final isRemux =
      playMethod == StreamPlayMethod.transcode &&
      !lowerReasons.any(_videoReEncodeReasons.contains);

  if (playMethod != null) {
    return switch (playMethod) {
      StreamPlayMethod.directPlay => l10n.directPlay,
      StreamPlayMethod.directStream => l10n.directStream,
      StreamPlayMethod.transcode when isRemux => '${l10n.directStream} (Remux)',
      StreamPlayMethod.transcode => l10n.transcoding,
    };
  }

  return switch (fallbackPlayMethod) {
    'directPlay' => l10n.directPlay,
    'directStream' => l10n.directStream,
    'transcode' => l10n.transcoding,
    _ => l10n.unknown,
  };
}
