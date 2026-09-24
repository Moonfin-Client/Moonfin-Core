import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/spotlight/spotlight_images.dart';

PersonBackdropCandidate _candidate(String key) => PersonBackdropCandidate(
  key: key,
  fullUrl: 'full/$key',
  cardUrl: 'card/$key',
);

void main() {
  final local = [_candidate('l1'), _candidate('l2')];
  final appearances = [_candidate('a1'), _candidate('a2')];
  final crew = [_candidate('c1')];

  Map<String, String?> pick({String? mainBackdropKey}) =>
      personCardBackdropsFor(
        local: local,
        appearances: appearances,
        crew: crew,
        mainBackdropKey: mainBackdropKey,
        random: math.Random(7),
      );

  test('each card takes from its own pool', () {
    final picked = pick();
    expect(picked['filmography'], anyOf('card/l1', 'card/l2'));
    expect(picked['appearances'], anyOf('card/a1', 'card/a2'));
    expect(picked['crew'], 'card/c1');
  });

  test('no two cards land on the same backdrop', () {
    final picked = pick().values.toList();
    expect(picked.toSet(), hasLength(picked.length));
  });

  test('the hero keeps the backdrop it took', () {
    expect(pick(mainBackdropKey: 'c1')['crew'], isNot('card/c1'));
  });

  test('one backdrop between them is repeated rather than left out', () {
    final only = [_candidate('solo')];
    final picked = personCardBackdropsFor(
      local: only,
      appearances: only,
      crew: only,
      random: math.Random(7),
    );
    expect(picked.values, everyElement('card/solo'));
  });

  test('a person with nothing to draw gets nothing', () {
    final picked = personCardBackdropsFor(
      local: const [],
      appearances: const [],
      crew: const [],
    );
    expect(picked.values, everyElement(isNull));
  });
}
