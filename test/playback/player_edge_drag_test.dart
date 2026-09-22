import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/player_edge_drag.dart';

void main() {
  const height = 800.0;

  test('a drag from the middle drives the player', () {
    expect(startsInSystemEdgeStrip(400, height, EdgeInsets.zero), isFalse);
  });

  test('a drag from either edge is left to the system', () {
    expect(startsInSystemEdgeStrip(10, height, EdgeInsets.zero), isTrue);
    expect(startsInSystemEdgeStrip(790, height, EdgeInsets.zero), isTrue);
  });

  test('a reported inset widens the strip past the fallback', () {
    const insets = EdgeInsets.only(top: 120, bottom: 96);

    expect(startsInSystemEdgeStrip(100, height, insets), isTrue);
    expect(startsInSystemEdgeStrip(130, height, insets), isFalse);
    expect(startsInSystemEdgeStrip(700, height, insets), isFalse);
    expect(startsInSystemEdgeStrip(710, height, insets), isTrue);
  });
}
