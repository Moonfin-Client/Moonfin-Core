import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/subtitle_cues.dart';

void main() {
  group('parseSubtitleText', () {
    test('reads SRT, with hours and comma fractions, and drops markup', () {
      final cues = parseSubtitleText(
        '﻿1\r\n00:00:01,500 --> 00:00:03,250\r\n<i>Hello</i>\r\nthere\r\n\r\n'
        '2\r\n01:02:03,004 --> 01:02:04,000\r\n{\\an8}Up top\r\n',
      );
      expect(cues, hasLength(2));
      expect(cues[0].start, 1.5);
      expect(cues[0].end, 3.25);
      expect(cues[0].text, 'Hello\nthere');
      expect(cues[1].start, closeTo(3723.004, 1e-9));
      expect(cues[1].text, 'Up top');
    });

    test('reads WebVTT without hours and skips the header and empty cues', () {
      final cues = parseSubtitleText(
        'WEBVTT\n\nNOTE a comment\n\n00:05.1 --> 00:07.000 align:start\n<v Bob>Hi</v>\n\n'
        '00:08.000 --> 00:09.000\n\n',
      );
      expect(cues, hasLength(1));
      expect(cues.single.start, 5.1);
      expect(cues.single.end, 7);
      expect(cues.single.text, 'Hi');
    });

    test('reads ASS dialogue, keeping commas in the text', () {
      final cues = parseSubtitleText(
        '[Script Info]\nTitle: x\n\n[Events]\n'
        'Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text\n'
        'Dialogue: 0,0:00:02.50,0:00:04.00,Default,,0,0,0,,{\\b1}Wait,{\\b0} what?\\NNo.\n'
        'Comment: 0,0:00:05.00,0:00:06.00,Default,,0,0,0,,not shown\n',
      );
      expect(cues, hasLength(1));
      expect(cues.single.start, 2.5);
      expect(cues.single.end, 4);
      expect(cues.single.text, 'Wait, what?\nNo.');
    });
  });

  test('reads the JSON lines Jellyfin and Emby make from a track', () {
    final cues = cuesFromTrackEvents({
      'TrackEvents': [
        {'StartPositionTicks': 15000000, 'EndPositionTicks': 30000000, 'Text': '<b>One</b>\\NTwo'},
        {'StartPositionTicks': 'bad', 'EndPositionTicks': 1},
      ],
    });
    expect(cues, hasLength(1));
    expect(cues.single.start, 1.5);
    expect(cues.single.end, 3);
    expect(cues.single.text, 'One\nTwo');
    expect(cuesFromTrackEvents('nope'), isEmpty);
  });

  group('buildSubtitleTimeline', () {
    const cues = [
      SubtitleCue(18, 19.5, 'Before'),
      SubtitleCue(20, 22, 'Now'),
      SubtitleCue(30, 31, 'Later'),
    ];

    test('centers the playhead and marks the line under it', () {
      final timeline = buildSubtitleTimeline(cues, 21, 0);
      expect(timeline.playhead, 0.5);
      expect(timeline.markers.first, (16.0, 0.0));
      expect(timeline.markers, hasLength(11));
      expect(timeline.bars.map((b) => b.text), ['Before', 'Now']);
      expect(timeline.bars[1].active, isTrue);
      expect(timeline.bars[1].left, closeTo(0.4, 1e-9));
      expect(timeline.bars[1].width, closeTo(0.2, 1e-9));
    });

    test('the delay moves the lines, not the playhead', () {
      final timeline = buildSubtitleTimeline(cues, 21, 1.5);
      expect(timeline.playhead, 0.5);
      expect(timeline.bars.map((b) => b.text), ['Before', 'Now']);
      expect(timeline.bars[0].active, isTrue);
      expect(timeline.bars[1].left, closeTo(0.55, 1e-9));
    });

    test('the window starts at zero near the beginning', () {
      final timeline = buildSubtitleTimeline(cues, 2, 0);
      expect(timeline.playhead, 0.2);
      expect(timeline.bars, isEmpty);
      expect(formatTimelineMarker(timeline.markers.last.$1), '0:10');
      expect(formatTimelineMarker(125.9), '2:05');
    });
  });
}
