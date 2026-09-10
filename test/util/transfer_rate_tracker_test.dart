import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/download_utils.dart';

void main() {
  final t0 = DateTime(2026, 1, 1, 12);

  test('reports no rate until a second of samples exists', () {
    final tracker = TransferRateTracker();
    tracker.add(0, t0);
    expect(tracker.bytesPerSecond, isNull);
    tracker.add(500, t0.add(const Duration(milliseconds: 600)));
    expect(tracker.bytesPerSecond, isNull);
  });

  test('derives rate and remaining time from the sample window', () {
    final tracker = TransferRateTracker();
    tracker.add(0, t0);
    tracker.add(10 * 1024 * 1024, t0.add(const Duration(seconds: 2)));

    expect(tracker.bytesPerSecond, 5 * 1024 * 1024);
    expect(tracker.etaSeconds(10 * 1024 * 1024, 60 * 1024 * 1024), 10);
  });

  test('forgets samples older than the window', () {
    final tracker = TransferRateTracker(window: const Duration(seconds: 4));
    tracker.add(0, t0);
    tracker.add(1000, t0.add(const Duration(seconds: 2)));
    tracker.add(1000, t0.add(const Duration(seconds: 5)));
    tracker.add(1000, t0.add(const Duration(seconds: 8)));

    // Only the stalled samples remain, so no rate is reported.
    expect(tracker.bytesPerSecond, isNull);
    expect(tracker.etaSeconds(1000, 5000), isNull);
  });

  test('ignores samples closer together than the minimum gap', () {
    final tracker = TransferRateTracker();
    tracker.add(0, t0);
    tracker.add(100, t0.add(const Duration(milliseconds: 100)));
    tracker.add(2000, t0.add(const Duration(seconds: 2)));

    expect(tracker.bytesPerSecond, 1000);
  });

  test('restarts after a retry resets the byte count', () {
    final tracker = TransferRateTracker();
    tracker.add(0, t0);
    tracker.add(4000, t0.add(const Duration(seconds: 2)));
    tracker.add(0, t0.add(const Duration(seconds: 4)));
    expect(tracker.bytesPerSecond, isNull);
    tracker.add(3000, t0.add(const Duration(seconds: 7)));
    expect(tracker.bytesPerSecond, 1000);
  });

  test('has no remaining time once the transfer is complete', () {
    final tracker = TransferRateTracker();
    tracker.add(0, t0);
    tracker.add(1000, t0.add(const Duration(seconds: 1)));
    expect(tracker.etaSeconds(1000, 1000), isNull);
  });
}
