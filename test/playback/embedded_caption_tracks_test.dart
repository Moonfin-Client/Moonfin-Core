import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';
import 'package:moonfin/util/subtitle_track_logic.dart';

void main() {
  group('EmbeddedCaptionTrack.listFromWire', () {
    test('reads the caption tracks the player found', () {
      final tracks = EmbeddedCaptionTrack.listFromWire([
        {'id': 1, 'label': 'CC1', 'language': 'eng', 'selected': false},
        {'id': 2, 'label': 'CC2', 'language': '', 'selected': false},
      ]);

      expect(tracks.length, 2);
      expect(tracks.first.id, 1);
      expect(tracks.first.label, 'CC1');
      expect(tracks.first.language, 'eng');
      expect(tracks.last.language, isNull);
    });

    test('falls back to a channel name when the player names nothing', () {
      final tracks = EmbeddedCaptionTrack.listFromWire([
        {'id': 3, 'label': '', 'language': ''},
      ]);

      expect(tracks.single.label, 'CC3');
    });

    test('drops entries that could never be selected', () {
      final tracks = EmbeddedCaptionTrack.listFromWire([
        {'label': 'CC1'},
        {'id': 0, 'label': 'CC1'},
        'not a track',
        {'id': 1, 'label': 'CC1'},
      ]);

      expect(tracks.single.id, 1);
    });

    test('reads a player that reported nothing as no captions', () {
      expect(EmbeddedCaptionTrack.listFromWire(null), isEmpty);
      expect(
        EmbeddedCaptionTrack.listFromWire(const []),
        isEmpty,
      );
    });
  });

  group('subtitle menu rows', () {
    test('row 0 is off', () {
      final target = subtitleMenuRowTarget(
        row: 0,
        streamCount: 2,
        captionCount: 1,
      );

      expect(target.streamPosition, isNull);
      expect(target.captionPosition, isNull);
    });

    test('server streams keep the rows they had before captions appeared', () {
      for (var row = 1; row <= 2; row++) {
        final withCaptions = subtitleMenuRowTarget(
          row: row,
          streamCount: 2,
          captionCount: 1,
        );
        final withoutCaptions = subtitleMenuRowTarget(
          row: row,
          streamCount: 2,
          captionCount: 0,
        );

        expect(withCaptions.streamPosition, row - 1);
        expect(withCaptions.streamPosition, withoutCaptions.streamPosition);
        expect(withCaptions.captionPosition, isNull);
      }
    });

    test('captions follow the server streams', () {
      final target = subtitleMenuRowTarget(
        row: 3,
        streamCount: 2,
        captionCount: 2,
      );

      expect(target.streamPosition, isNull);
      expect(target.captionPosition, 0);
    });

    test('a channel with captions and no subtitle streams', () {
      final target = subtitleMenuRowTarget(
        row: 1,
        streamCount: 0,
        captionCount: 1,
      );

      expect(target.captionPosition, 0);
    });

    test('a row past the end is off rather than a wrong track', () {
      final target = subtitleMenuRowTarget(
        row: 4,
        streamCount: 2,
        captionCount: 1,
      );

      expect(target.streamPosition, isNull);
      expect(target.captionPosition, isNull);
    });

    test('marks the active row', () {
      expect(
        subtitleMenuSelectedRow(
          streamPosition: -1,
          captionPosition: -1,
          streamCount: 2,
        ),
        0,
      );
      expect(
        subtitleMenuSelectedRow(
          streamPosition: 1,
          captionPosition: -1,
          streamCount: 2,
        ),
        2,
      );
      expect(
        subtitleMenuSelectedRow(
          streamPosition: -1,
          captionPosition: 0,
          streamCount: 2,
        ),
        3,
      );
    });

    test('the marked row round trips back to what it points at', () {
      const streamCount = 2;
      const captionCount = 2;

      final captionRow = subtitleMenuSelectedRow(
        streamPosition: -1,
        captionPosition: 1,
        streamCount: streamCount,
      );
      expect(
        subtitleMenuRowTarget(
          row: captionRow,
          streamCount: streamCount,
          captionCount: captionCount,
        ).captionPosition,
        1,
      );

      final streamRow = subtitleMenuSelectedRow(
        streamPosition: 0,
        captionPosition: -1,
        streamCount: streamCount,
      );
      expect(
        subtitleMenuRowTarget(
          row: streamRow,
          streamCount: streamCount,
          captionCount: captionCount,
        ).streamPosition,
        0,
      );
    });
  });
}
