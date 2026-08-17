import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/scroll_sensitivity_binding.dart';

void main() {
  final binding = ScrollSensitivityBinding.ensureInitialized();

  final seen = <PointerEvent>[];
  // The same closure has to reach both calls or the route would outlive the
  // test that added it.
  void record(PointerEvent event) => seen.add(event);

  setUp(() {
    seen.clear();
    binding.multiplier = 1.0;
    GestureBinding.instance.pointerRouter.addGlobalRoute(record);
  });

  tearDown(() {
    GestureBinding.instance.pointerRouter.removeGlobalRoute(record);
  });

  PointerScrollEvent wheel(double dy) =>
      PointerScrollEvent(scrollDelta: Offset(0, dy));

  Offset deltaAfter(PointerScrollEvent event) {
    binding.handlePointerEvent(event);
    final scrolls = seen.whereType<PointerScrollEvent>();
    return scrolls.isEmpty ? Offset.zero : scrolls.last.scrollDelta;
  }

  test('a multiplier of one passes the event through untouched', () {
    final event = wheel(100);
    expect(deltaAfter(event), const Offset(0, 100));
  });

  test('the wheel delta is scaled by the multiplier', () {
    binding.multiplier = 2.5;
    expect(deltaAfter(wheel(100)), const Offset(0, 250));
  });

  test('scaling keeps the direction of the scroll', () {
    binding.multiplier = 2.0;
    expect(deltaAfter(wheel(-40)), const Offset(0, -80));
  });

  test('a trackpad keeps its own momentum', () {
    binding.multiplier = 3.0;
    final event = PointerScrollEvent(
      kind: PointerDeviceKind.trackpad,
      scrollDelta: const Offset(0, 30),
    );
    expect(deltaAfter(event), const Offset(0, 30));
  });

  test('the current multiplier is readable by the notch counters', () {
    binding.multiplier = 1.5;
    expect(ScrollSensitivityBinding.current, 1.5);
  });

  test('a multiplier that would stall or invert scrolling is refused', () {
    binding.multiplier = 2.0;
    binding.multiplier = 0;
    expect(binding.multiplier, 2.0);
    binding.multiplier = -1.5;
    expect(binding.multiplier, 2.0);
  });
}
