import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_preview_layout.dart';
import 'package:moonfin/ui/widgets/playback/chapter_marker_track.dart';

const _trackWidth = 200.0;
const _durationMs = 1000;
final _boundaryKey = GlobalKey();

/// The seek bar's own slider theme, so what the test measures is what the
/// player draws.
Widget _framed(Widget child) => MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.black,
    body: Center(
      child: RepaintBoundary(
        key: _boundaryKey,
        child: SizedBox(
          width: _trackWidth,
          height: 40,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: TrickplayPreviewLayout.seekThumbRadius,
              ),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: const Color(0xFF202020),
              inactiveTrackColor: const Color(0xFF202020),
              thumbColor: Colors.white,
              overlayColor: Colors.transparent,
            ),
            child: Center(child: child),
          ),
        ),
      ),
    ),
  ),
);

/// Centre of what was painted white, in logical pixels, or null if nothing
/// was.
///
/// Reading pixels back is real async work, so it has to leave the fake async
/// zone testWidgets runs in or it never completes.
Future<double?> _paintedCentre(WidgetTester tester) =>
    tester.runAsync<double?>(_readCentre);

Future<double?> _readCentre() async {
  final boundary =
      _boundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = boundary.toImageSync();
  final data = (await image.toByteData(format: ui.ImageByteFormat.rawRgba))!;
  final scale = image.width / _trackWidth;
  final painted = <double>[];
  for (var x = 0; x < image.width; x++) {
    for (var y = 0; y < image.height; y++) {
      if (data.getUint8((y * image.width + x) * 4) > 128) {
        painted.add(x / scale);
        break;
      }
    }
  }
  image.dispose();
  if (painted.isEmpty) return null;
  return (painted.first + painted.last) / 2;
}

void main() {
  // The marks have to sit under the thumb that seeks to them, so this asks a
  // real slider where its thumb lands rather than restating the arithmetic.
  // A midpoint-only check would pass with any inset, because every formula
  // agrees at 0.5, so the ends are where it counts.
  for (final fraction in [0.1, 0.5, 0.9]) {
    testWidgets('a mark at $fraction sits under the slider thumb', (
      tester,
    ) async {
      await tester.pumpWidget(
        _framed(Slider(value: fraction, max: 1, onChanged: (_) {})),
      );
      await tester.pumpAndSettle();
      final thumb = await _paintedCentre(tester);

      await tester.pumpWidget(
        _framed(
          ChapterMarkerTrack(
            positionsMs: [(fraction * _durationMs).round()],
            durationMs: _durationMs,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final mark = await _paintedCentre(tester);

      expect(thumb, isNotNull, reason: 'no thumb was drawn');
      expect(mark, isNotNull, reason: 'no mark was drawn');
      expect(mark!, closeTo(thumb!, 1.5));
    });
  }

  // What the preference switches off, and what an item with no chapters or
  // a runtime the player hasn't learned yet falls back to.
  testWidgets('draws nothing without positions or a duration', (tester) async {
    await tester.pumpWidget(
      _framed(
        const ChapterMarkerTrack(positionsMs: [], durationMs: _durationMs),
      ),
    );
    await tester.pumpAndSettle();
    expect(await _paintedCentre(tester), isNull);

    await tester.pumpWidget(
      _framed(
        const ChapterMarkerTrack(positionsMs: [500], durationMs: 0),
      ),
    );
    await tester.pumpAndSettle();
    expect(await _paintedCentre(tester), isNull);
  });
}
