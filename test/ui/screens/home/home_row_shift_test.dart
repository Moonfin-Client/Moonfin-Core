import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_row_shift.dart';

void main() {
  HomeRowShift classify({
    bool overlayActive = true,
    bool fullScreenV2 = true,
    bool classicMode = false,
    bool isFocusedRow = false,
    int rowDistance = 2,
    double rowViewportTop = 300,
    double rowExtent = 200,
    double viewportHeight = 1080,
    double overlayBottom = 100,
    double classicClipTop = 0,
  }) => homeRowShiftFor(
    overlayActive: overlayActive,
    fullScreenV2: fullScreenV2,
    classicMode: classicMode,
    isFocusedRow: isFocusedRow,
    rowDistance: rowDistance,
    rowViewportTop: rowViewportTop,
    rowExtent: rowExtent,
    viewportHeight: viewportHeight,
    overlayBottom: overlayBottom,
    classicClipTop: classicClipTop,
  );

  test('nothing active draws the row as is', () {
    expect(
      classify(overlayActive: false, fullScreenV2: false),
      HomeRowShift.none,
    );
  });

  test('classic mode only clips, and only when there is something to clip', () {
    expect(classify(classicMode: true, classicClipTop: 0), HomeRowShift.none);
    final clipped = classify(classicMode: true, classicClipTop: 40);
    expect(clipped.clipTop, 40);
    expect(clipped.hidden, isFalse);
    expect(clipped.opacity, 1.0);
    expect(clipped.needsClip, isTrue);
  });

  test('the focused row is never hidden or faded', () {
    expect(classify(isFocusedRow: true, rowDistance: 0), HomeRowShift.none);
  });

  test('neighbours stay mounted, invisible and untouchable', () {
    final shift = classify(rowDistance: 1);
    expect(shift.hidden, isFalse);
    expect(shift.opacity, 0.0);
    expect(shift.ignorePointer, isTrue);
  });

  test('far rows off screen are hidden but keep their elements', () {
    final below = classify(rowDistance: 2, rowViewportTop: 2000);
    expect(below.hidden, isTrue);
    expect(below.opacity, 0.0);
    final above = classify(rowDistance: 3, rowViewportTop: -500);
    expect(above.hidden, isTrue);
  });

  test('far rows on screen under the overlay fade out', () {
    final shift = classify(
      rowDistance: 2,
      rowViewportTop: -150,
      rowExtent: 200,
      overlayBottom: 100,
    );
    expect(shift.hidden, isFalse);
    expect(shift.opacity, 0.0);
    expect(shift.ignorePointer, isTrue);
  });

  test('a row entering the overlay band shifts up and fades', () {
    final shift = classify(
      rowDistance: 2,
      rowViewportTop: 110,
      rowExtent: 200,
      overlayBottom: 100,
    );
    expect(shift.shift, greaterThan(0));
    expect(shift.opacity, lessThan(1.0));
    expect(shift.needsClip, isTrue);
    expect(shift.hidden, isFalse);
  });

  test('a row well below the overlay is left alone', () {
    expect(
      classify(rowDistance: 2, rowViewportTop: 600, overlayBottom: 100),
      HomeRowShift.none,
    );
  });

  test('the shift curve matches the old helper', () {
    expect(
      homeRowOverlayShift(
        rowViewportTop: 200,
        rowExtent: 100,
        overlayBottom: 100,
      ),
      0,
    );
    expect(
      homeRowOverlayShift(
        rowViewportTop: 80,
        rowExtent: 100,
        overlayBottom: 100,
      ),
      greaterThan(0),
    );
  });
}
