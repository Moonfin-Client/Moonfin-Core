import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/download_subtitle_logic.dart';

/// Tests for how transcoded downloads keep subtitles. Text subtitles travel as
/// sidecar files; image subtitles (PGS, VobSub) can only survive a transcode
/// by being burned into the video (#1858).
void main() {
  Map<String, dynamic> sub(
    int index,
    String codec, {
    bool external = false,
    bool supportsExternal = false,
    bool? isText,
  }) => {
    'Type': 'Subtitle',
    'Index': index,
    'Codec': codec,
    'IsExternal': external,
    'SupportsExternalStream': supportsExternal,
    'IsTextSubtitleStream': ?isText,
  };

  final video = <String, dynamic>{'Type': 'Video', 'Index': 0};
  final audio = <String, dynamic>{'Type': 'Audio', 'Index': 1};

  group('burnInSubtitleCandidates', () {
    test('lists image subtitles and nothing else', () {
      final streams = [
        video,
        audio,
        sub(2, 'PGSSUB'),
        sub(3, 'subrip', supportsExternal: true, isText: true),
        sub(4, 'dvd_subtitle'),
        sub(5, 'ass', isText: true),
      ];
      expect(
        burnInSubtitleCandidates(streams).map((s) => s['Index']),
        [2, 4],
      );
    });

    test('is empty when every subtitle is text', () {
      expect(
        burnInSubtitleCandidates([video, sub(2, 'srt'), sub(3, 'webvtt')]),
        isEmpty,
      );
    });
  });

  group('defaultBurnInSubtitleIndex', () {
    final candidates = [sub(2, 'pgssub'), sub(4, 'pgssub')];

    test('preselects the track playback would show when it is a candidate', () {
      expect(
        defaultBurnInSubtitleIndex(candidates: candidates, effectiveIndex: 4),
        4,
      );
    });

    test('preselects none when playback would show a text track', () {
      expect(
        defaultBurnInSubtitleIndex(candidates: candidates, effectiveIndex: 3),
        isNull,
      );
    });

    test('preselects none when playback would show no subtitles', () {
      expect(
        defaultBurnInSubtitleIndex(candidates: candidates, effectiveIndex: -1),
        isNull,
      );
      expect(
        defaultBurnInSubtitleIndex(candidates: candidates, effectiveIndex: null),
        isNull,
      );
    });
  });

  group('burnInSubtitleParams', () {
    test('asks the server to encode the chosen track into the video', () {
      expect(burnInSubtitleParams(2), {
        'SubtitleStreamIndex': '2',
        'SubtitleMethod': 'Encode',
      });
    });

    test('adds nothing when no track is chosen', () {
      expect(burnInSubtitleParams(null), isEmpty);
    });
  });

  group('downloadsAsSubtitleSidecar', () {
    test('keeps external and extractable text subtitles', () {
      expect(downloadsAsSubtitleSidecar(sub(2, 'srt', external: true)), isTrue);
      expect(
        downloadsAsSubtitleSidecar(sub(3, 'subrip', supportsExternal: true)),
        isTrue,
      );
    });

    test('skips embedded text subtitles the server cannot extract', () {
      expect(downloadsAsSubtitleSidecar(sub(2, 'subrip')), isFalse);
    });

    test('skips image subtitles, which cannot be fetched as text files', () {
      expect(
        downloadsAsSubtitleSidecar(sub(2, 'PGSSUB', external: true)),
        isFalse,
      );
      expect(
        downloadsAsSubtitleSidecar(
          sub(3, 'pgssub', supportsExternal: true, isText: false),
        ),
        isFalse,
      );
    });

    test('ignores non-subtitle streams', () {
      expect(downloadsAsSubtitleSidecar(audio), isFalse);
    });
  });
}
