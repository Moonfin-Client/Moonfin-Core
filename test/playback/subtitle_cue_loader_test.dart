import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/subtitle_cue_loader.dart';
import 'package:playback_core/playback_core.dart';

class _Manager extends PlaybackManager {
  _Manager(this.resolution);

  final StreamResolutionResult resolution;

  @override
  StreamResolutionResult? get currentResolution => resolution;
}

void main() {
  test('a downloaded subtitle file is read from disk', () async {
    final dir = Directory.systemTemp.createTempSync('cues');
    addTearDown(() => dir.deleteSync(recursive: true));
    final srt = File('${dir.path}/sub.srt')
      ..writeAsStringSync('1\n00:00:03,000 --> 00:00:04,000\nLater\n\n'
          '2\n00:00:00,500 --> 00:00:02,000\nFirst\n');
    final manager = _Manager(StreamResolutionResult(
      streamUrl: '/local/movie.mkv',
      mediaSourceId: 'local-${dir.path}',
      playMethod: StreamPlayMethod.directPlay,
      isLocalMedia: true,
      mediaStreams: const [
        {'Type': 'Subtitle', 'Index': 3, 'Codec': 'srt', 'IsExternal': true},
        {'Type': 'Subtitle', 'Index': 4, 'Codec': 'pgssub'},
      ],
      externalSubtitles: [
        ExternalSubtitle(deliveryUrl: srt.path, codec: 'srt', streamIndex: 3),
      ],
    ));
    addTearDown(manager.dispose);

    final cues = await SubtitleCueLoader.load(manager, 3);
    expect(cues?.map((c) => c.text), ['First', 'Later']);
    // An image track, or none at all, has nothing to load.
    expect(SubtitleCueLoader.load(manager, 4), isNull);
    expect(SubtitleCueLoader.load(manager, null), isNull);
  });
}
