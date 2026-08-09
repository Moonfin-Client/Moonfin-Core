import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_info.dart';
import 'package:moonfin/data/models/trickplay_strip_resolution.dart';

void main() {
  const totalDuration = Duration(minutes: 10);
  const stepMs = 30000;

  group('TrickplayStripResolver.resolve', () {
    test('returns 5 slots indexed -2..2 with slot 0 centered', () {
      final slots = TrickplayStripResolver.resolve(
        fakeTimelinePosition: const Duration(minutes: 5),
        totalDuration: totalDuration,
        stepMs: stepMs,
      );
      expect(slots.map((s) => s.slotIndex), [-2, -1, 0, 1, 2]);
      expect(slots[2].targetPosition, const Duration(minutes: 5));
      expect(slots[2].inRange, isTrue);
    });

    test('edge slots near the start of media go out of range', () {
      final slots = TrickplayStripResolver.resolve(
        fakeTimelinePosition: const Duration(seconds: 15),
        totalDuration: totalDuration,
        stepMs: stepMs,
      );
      expect(slots[0].inRange, isFalse);
      expect(slots[0].targetPosition, isNull);
      expect(slots[1].inRange, isFalse);
      expect(slots[2].inRange, isTrue);
      expect(slots[3].inRange, isTrue);
      expect(slots[4].inRange, isTrue);
    });

    test('edge slots near the end of media go out of range', () {
      final nearEnd = totalDuration - const Duration(seconds: 15);
      final slots = TrickplayStripResolver.resolve(
        fakeTimelinePosition: nearEnd,
        totalDuration: totalDuration,
        stepMs: stepMs,
      );
      expect(slots[0].inRange, isTrue);
      expect(slots[1].inRange, isTrue);
      expect(slots[2].inRange, isTrue);
      expect(slots[3].inRange, isFalse);
      expect(slots[3].targetPosition, isNull);
      expect(slots[4].inRange, isFalse);
    });

    test('adjacent slots can span two different sprite sheets', () {
      const info = TrickplayInfo(
        width: 100,
        height: 60,
        tileWidth: 5,
        tileHeight: 4,
        interval: 10000,
      );
      final slots = TrickplayStripResolver.resolve(
        fakeTimelinePosition: const Duration(seconds: 220),
        totalDuration: const Duration(seconds: 600),
        stepMs: 150000,
        slotCount: 3,
      );
      final left = info.resolveTile(slots[0].targetPosition!);
      final center = info.resolveTile(slots[1].targetPosition!);
      expect(left.imageIndex, 0);
      expect(center.imageIndex, 1);
    });

    test('asymmetric highlightIndex spawns more slots on one side', () {
      final slots = TrickplayStripResolver.resolve(
        fakeTimelinePosition: const Duration(minutes: 5),
        totalDuration: totalDuration,
        stepMs: stepMs,
        slotCount: 6,
        highlightIndex: 1,
      );
      expect(slots.map((s) => s.slotIndex), [-1, 0, 1, 2, 3, 4]);
      expect(slots[1].targetPosition, const Duration(minutes: 5));
    });

    test('highlightIndex is clamped into range rather than throwing', () {
      final slots = TrickplayStripResolver.resolve(
        fakeTimelinePosition: const Duration(minutes: 5),
        totalDuration: totalDuration,
        stepMs: stepMs,
        slotCount: 5,
        highlightIndex: 99,
      );
      expect(slots.map((s) => s.slotIndex), [-4, -3, -2, -1, 0]);
      expect(slots[4].targetPosition, const Duration(minutes: 5));
    });

    test(
      'slotIndex (the widget key) stays stable across a continuous drag '
      'while targetPosition does not - two resolves a few ms apart, same '
      'slotCount/highlightIndex, should be keyable without churn',
      () {
        final before = TrickplayStripResolver.resolve(
          fakeTimelinePosition: const Duration(minutes: 5),
          totalDuration: totalDuration,
          stepMs: stepMs,
        );
        final after = TrickplayStripResolver.resolve(
          fakeTimelinePosition: const Duration(
            milliseconds: 5 * 60 * 1000 + 16,
          ),
          totalDuration: totalDuration,
          stepMs: stepMs,
        );
        expect(
          after.map((s) => s.slotIndex),
          before.map((s) => s.slotIndex),
        );
        for (var i = 0; i < before.length; i++) {
          expect(
            after[i].targetPosition!.inMilliseconds,
            isNot(before[i].targetPosition!.inMilliseconds),
          );
        }
      },
    );
  });
}
