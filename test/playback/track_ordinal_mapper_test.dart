import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

Map<String, dynamic> _stream(
  int index,
  String type, {
  bool isExternal = false,
  String? deliveryUrl,
}) {
  return <String, dynamic>{
    'Index': index,
    'Type': type,
    'IsExternal': isExternal,
    'DeliveryUrl': ?deliveryUrl,
  };
}

ExternalSubtitle _external(int streamIndex, {String codec = 'subrip'}) {
  return ExternalSubtitle(
    deliveryUrl: 'https://server/subs/$streamIndex',
    codec: codec,
    streamIndex: streamIndex,
  );
}

void main() {
  // The issue #713 file shape: video, audio, 2 embedded ASS, 1 external SRT.
  final issueStreams = <Map<String, dynamic>>[
    _stream(0, 'Video'),
    _stream(1, 'Audio'),
    _stream(2, 'Subtitle'), // Full Subtitles - English - ASS (embedded)
    _stream(3, 'Subtitle'), // Signs/Songs - English - ASS (embedded)
    _stream(4, 'Subtitle', isExternal: true), // French - Subrip - External
  ];

  group('effectiveExternalSubtitles', () {
    test('directPlay skips embedded streams re-delivered externally', () {
      // Server offered the embedded ASS tracks via DeliveryUrl too.
      final externals = [_external(2), _external(3), _external(4)];
      final effective = TrackOrdinalMapper.effectiveExternalSubtitles(
        mediaStreams: issueStreams,
        externalSubtitles: externals,
        embeddedStripped: false,
      );
      expect(effective.map((s) => s.streamIndex), [4]);
    });

    test('transcode keeps embedded-delivered entries (originals stripped)',
        () {
      final externals = [_external(2), _external(3), _external(4)];
      final effective = TrackOrdinalMapper.effectiveExternalSubtitles(
        mediaStreams: issueStreams,
        externalSubtitles: externals,
        embeddedStripped: true,
      );
      expect(effective.map((s) => s.streamIndex), [2, 3, 4]);
    });

    test('entries missing from media streams are treated as external', () {
      final externals = [_external(99)];
      final effective = TrackOrdinalMapper.effectiveExternalSubtitles(
        mediaStreams: issueStreams,
        externalSubtitles: externals,
        embeddedStripped: false,
      );
      expect(effective.map((s) => s.streamIndex), [99]);
    });
  });

  group('subtitle mapping - directPlay', () {
    final externals = [_external(4)];

    int? forward(int streamIndex) => TrackOrdinalMapper.mpvTrackIdForStream(
          streamIndex: streamIndex,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: externals,
          embeddedStripped: false,
        );

    int? reverse(int mpvTrackId) => TrackOrdinalMapper.streamIndexForMpvTrackId(
          mpvTrackId: mpvTrackId,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: externals,
          embeddedStripped: false,
        );

    test('embedded tracks are ordinals 1..N and round-trip', () {
      expect(forward(2), 1);
      expect(forward(3), 2);
      expect(reverse(1), 2);
      expect(reverse(2), 3);
    });

    test('external track comes after embedded count and round-trips', () {
      expect(forward(4), 3);
      expect(reverse(3), 4);
    });

    test('embedded subs also delivered externally keep embedded ordinals '
        'and externals are not double-counted', () {
      final withDupes = [_external(2), _external(3), _external(4)];
      int? fwd(int streamIndex) => TrackOrdinalMapper.mpvTrackIdForStream(
            streamIndex: streamIndex,
            type: 'Subtitle',
            mediaStreams: issueStreams,
            externalSubtitles: withDupes,
            embeddedStripped: false,
          );
      expect(fwd(2), 1);
      expect(fwd(3), 2);
      expect(fwd(4), 3); // 2 embedded + position 0 in effective list + 1
      expect(
        TrackOrdinalMapper.streamIndexForMpvTrackId(
          mpvTrackId: 3,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: withDupes,
          embeddedStripped: false,
        ),
        4,
      );
    });

    test('unknown stream index maps to null', () {
      expect(forward(42), isNull);
      expect(reverse(9), isNull);
    });
  });

  group('subtitle mapping - transcode/directStream (embedded stripped)', () {
    // The issue's transcode repro: both embedded ASS re-delivered externally
    // plus the real external SRT; the player only sees the 3 sub-added files.
    final externals = [_external(2, codec: 'ass'), _external(3, codec: 'ass'), _external(4)];

    int? forward(int streamIndex) => TrackOrdinalMapper.mpvTrackIdForStream(
          streamIndex: streamIndex,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: externals,
          embeddedStripped: true,
        );

    int? reverse(int mpvTrackId) => TrackOrdinalMapper.streamIndexForMpvTrackId(
          mpvTrackId: mpvTrackId,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: externals,
          embeddedStripped: true,
        );

    test('sub-added tracks are numbered in add order', () {
      expect(forward(2), 1);
      expect(forward(3), 2);
      // Regression for issue #713: this used to compute 1 (rendered the
      // wrong ASS track) because only IsExternal==true streams were counted.
      expect(forward(4), 3);
    });

    test('reverse mapping mirrors add order', () {
      expect(reverse(1), 2);
      expect(reverse(2), 3);
      expect(reverse(3), 4);
      expect(reverse(4), isNull);
    });

    test('embedded sub without external delivery maps to null (burn-in)', () {
      // e.g. a PGS stream the server did not re-deliver.
      final pgsOnly = [_external(4)];
      expect(
        TrackOrdinalMapper.mpvTrackIdForStream(
          streamIndex: 2,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: pgsOnly,
          embeddedStripped: true,
        ),
        isNull,
      );
    });
  });

  group('subtitle mapping - offline (no resolution external list)', () {
    int? forward(int streamIndex) => TrackOrdinalMapper.mpvTrackIdForStream(
          streamIndex: streamIndex,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: null,
          embeddedStripped: false,
        );

    test('falls back to IsExternal positional accounting', () {
      expect(forward(2), 1);
      expect(forward(3), 2);
      expect(forward(4), 3);
      expect(
        TrackOrdinalMapper.streamIndexForMpvTrackId(
          mpvTrackId: 3,
          type: 'Subtitle',
          mediaStreams: issueStreams,
          externalSubtitles: null,
          embeddedStripped: false,
        ),
        4,
      );
    });
  });

  group('audio mapping', () {
    final audioStreams = <Map<String, dynamic>>[
      _stream(0, 'Video'),
      _stream(1, 'Audio'),
      _stream(2, 'Audio'),
      _stream(5, 'Audio'),
      _stream(3, 'Subtitle'),
    ];

    test('directPlay is positional among audio streams and round-trips', () {
      for (final (streamIndex, ordinal) in [(1, 1), (2, 2), (5, 3)]) {
        expect(
          TrackOrdinalMapper.mpvTrackIdForStream(
            streamIndex: streamIndex,
            type: 'Audio',
            mediaStreams: audioStreams,
            externalSubtitles: null,
            embeddedStripped: false,
          ),
          ordinal,
        );
        expect(
          TrackOrdinalMapper.streamIndexForMpvTrackId(
            mpvTrackId: ordinal,
            type: 'Audio',
            mediaStreams: audioStreams,
            externalSubtitles: null,
            embeddedStripped: false,
          ),
          streamIndex,
        );
      }
    });

    test('out-of-range ordinals map to null', () {
      expect(
        TrackOrdinalMapper.streamIndexForMpvTrackId(
          mpvTrackId: 4,
          type: 'Audio',
          mediaStreams: audioStreams,
          externalSubtitles: null,
          embeddedStripped: false,
        ),
        isNull,
      );
    });
  });
}
