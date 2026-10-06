import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/seasonal/seasonal_simulation.dart';

const _width = 1920.0;
const _height = 1080.0;

SeasonalSimulation _sim(
  SeasonalEffect effect,
  SeasonalDensity density, {
  int seed = 7,
}) =>
    SeasonalSimulation(effect, density, random: math.Random(seed))
      ..resize(_width, _height);

int _fallCount(SeasonalSimulation sim) =>
    sim.debugParticles.where((p) => p.kind == SeasonalParticleKind.fall).length;

/// A sheet whose every cell starts at its own index, so a written rect names its sprite.
final _taggedSheet = SeasonalSpriteSheet(
  rects: Float32List.fromList([
    for (var i = 0; i < SeasonalSprite.count; i++) ...[i.toDouble(), 0, i + 1.0, 1],
  ]),
  cellSize: 64,
);

/// The sprites a frame draws.
Set<int> _spritesDrawn(SeasonalSimulation sim) {
  final rects = Float32List(sim.outputCapacity * 4);
  final n = sim.write(
    _taggedSheet,
    Float32List(sim.outputCapacity * 4),
    rects,
    Int32List(sim.outputCapacity),
  );
  return {for (var i = 0; i < n; i++) rects[i * 4].round()};
}

void _run(SeasonalSimulation sim, double seconds, double dt, [void Function()? each]) {
  final steps = (seconds / dt).round();
  for (var i = 0; i < steps; i++) {
    sim.step(dt);
    each?.call();
  }
}

void main() {
  group('bounds', () {
    for (final effect in SeasonalEffect.values) {
      for (final density in SeasonalDensity.values) {
        test('${effect.name} at ${density.name} stays on screen and under the cap', () {
          for (final seed in [1, 2, 3]) {
            final sim = _sim(effect, density, seed: seed);
            _run(sim, 60, 1 / 60, () {
              expect(sim.count, lessThanOrEqualTo(sim.capacity));
              for (final p in sim.debugParticles) {
                expect(p.y, greaterThanOrEqualTo(-SeasonalSimulation.margin));
                expect(p.y, lessThanOrEqualTo(_height + SeasonalSimulation.margin));
                expect(p.x, greaterThanOrEqualTo(-SeasonalSimulation.margin));
                expect(p.x, lessThanOrEqualTo(_width + SeasonalSimulation.margin));
              }
            });
          }
        });
      }
    }

    test('fireworks keeps bursting instead of filling up with sparks off the top', () {
      final sim = _sim(SeasonalEffect.fireworks, SeasonalDensity.normal);
      var sparksOnScreen = 0;
      var frames = 0;
      _run(sim, 60, 1 / 60, () {
        if (sim.time < 10) return;
        frames++;
        sparksOnScreen += sim.debugParticles
            .where((p) =>
                p.kind == SeasonalParticleKind.spark &&
                p.y >= 0 &&
                p.y <= _height)
            .length;
      });
      // Two bursts of 36 in the air on average, minus the gaps between them.
      expect(sparksOnScreen / frames, greaterThan(30));
    });
  });

  group('frame rate', () {
    for (final effect in SeasonalEffect.values) {
      test('${effect.name} lands in the same place at 60 Hz and 120 Hz', () {
        final at60 = _sim(effect, SeasonalDensity.normal);
        final at120 = _sim(effect, SeasonalDensity.normal);
        _run(at60, 3, 1 / 60);
        _run(at120, 3, 1 / 120);

        final positions = {
          for (final p in at120.debugParticles) p.id: (p.x, p.y),
        };
        var compared = 0;
        for (final p in at60.debugParticles) {
          final other = positions[p.id];
          if (other == null) continue;
          compared++;
          expect(p.x, closeTo(other.$1, 1e-3), reason: 'particle ${p.id} x');
          expect(p.y, closeTo(other.$2, 1e-3), reason: 'particle ${p.id} y');
        }
        expect(compared, greaterThan(0));
      });
    }

    test('a long gap is skipped rather than replayed', () {
      final sim = _sim(SeasonalEffect.snow, SeasonalDensity.normal);
      final before = {for (final p in sim.debugParticles) p.id: p.y};
      sim.step(0.3);
      expect(sim.time, 0);
      for (final p in sim.debugParticles) {
        expect(p.y, before[p.id]);
      }
    });

    test('a slow frame moves at most one capped step', () {
      final sim = _sim(SeasonalEffect.snow, SeasonalDensity.normal);
      sim.step(0.2);
      expect(sim.time, closeTo(SeasonalSimulation.maxStep, 1e-9));
    });
  });

  group('population', () {
    for (final effect in [
      SeasonalEffect.snow,
      SeasonalEffect.leaves,
      SeasonalEffect.confetti,
      SeasonalEffect.christmas,
      SeasonalEffect.petals,
      SeasonalEffect.halloween,
    ]) {
      for (final density in SeasonalDensity.values) {
        test('${effect.name} at ${density.name} starts full and stays near its target', () {
          final sim = _sim(effect, density);
          expect(_fallCount(sim), sim.targetCount);
          final ys = sim.debugParticles
              .where((p) => p.kind == SeasonalParticleKind.fall)
              .map((p) => p.y)
              .toList();
          expect(ys.reduce(math.min), lessThan(_height * 0.2));
          expect(ys.reduce(math.max), greaterThan(_height * 0.8));

          var total = 0;
          var frames = 0;
          _run(sim, 30, 1 / 60, () {
            total += _fallCount(sim);
            frames++;
          });
          expect(total / frames, closeTo(sim.targetCount, sim.targetCount * 0.15));
        });
      }
    }

    test('fireflies hold their number and stay near where they started', () {
      final sim = _sim(SeasonalEffect.fireflies, SeasonalDensity.normal);
      expect(sim.count, sim.targetCount);
      final start = {for (final p in sim.debugParticles) p.id: (p.x, p.y)};
      var total = 0;
      var frames = 0;
      _run(sim, 30, 1 / 60, () {
        total += sim.count;
        frames++;
        for (final p in sim.debugParticles) {
          expect(p.kind, SeasonalParticleKind.firefly);
          final origin = start[p.id];
          if (origin == null) continue;
          expect((p.x - origin.$1).abs(), lessThan(200), reason: 'firefly ${p.id} x');
          expect((p.y - origin.$2).abs(), lessThan(200), reason: 'firefly ${p.id} y');
        }
      });
      expect(total / frames, closeTo(sim.targetCount, sim.targetCount * 0.2));
    });

    for (final effect in [SeasonalEffect.halloween, SeasonalEffect.petals]) {
      test('${effect.name} keeps a few flyers crossing the screen', () {
        final sim = _sim(effect, SeasonalDensity.heavy);
        final firstSeen = <int, double>{};
        final lastSeen = <int, double>{};
        var most = 0;
        _run(sim, 60, 1 / 60, () {
          final flyers = sim.debugParticles.where((p) => p.kind == SeasonalParticleKind.flyer).toList();
          most = math.max(most, flyers.length);
          expect(flyers.length, lessThanOrEqualTo(sim.flyerCapacity));
          for (final flyer in flyers) {
            firstSeen.putIfAbsent(flyer.id, () => flyer.x);
            lastSeen[flyer.id] = flyer.x;
          }
        });
        expect(most, greaterThan(1));
        final crossed = firstSeen.keys.where((id) => (lastSeen[id]! - firstSeen[id]!).abs() > _width * 0.8);
        expect(crossed, isNotEmpty);
      });
    }

    test('bees face the way they fly', () {
      final sim = _sim(SeasonalEffect.petals, SeasonalDensity.heavy);
      final lastX = <int, double>{};
      var checked = 0;
      _run(sim, 20, 1 / 30, () {
        for (final bee in sim.debugParticles.where((p) => p.sprite == SeasonalSprite.bee)) {
          final previous = lastX[bee.id];
          lastX[bee.id] = bee.x;
          if (previous == null) continue;
          // Drawn head up, so facing right is a quarter turn clockwise.
          expect(math.sin(bee.rotation).sign, (bee.x - previous).sign, reason: 'bee ${bee.id}');
          checked++;
        }
      });
      expect(checked, greaterThan(0));
    });

    test('only spring and halloween have flyers', () {
      for (final effect in SeasonalEffect.values) {
        final flyers = _sim(effect, SeasonalDensity.heavy).flyerCapacity;
        if (effect == SeasonalEffect.petals || effect == SeasonalEffect.halloween) {
          expect(flyers, greaterThan(0), reason: effect.name);
        } else {
          expect(flyers, 0, reason: effect.name);
        }
      }
    });

    test('density scales the falling effects', () {
      expect(_sim(SeasonalEffect.snow, SeasonalDensity.light).targetCount, 27);
      expect(_sim(SeasonalEffect.snow, SeasonalDensity.normal).targetCount, 54);
      expect(_sim(SeasonalEffect.snow, SeasonalDensity.heavy).targetCount, 108);
    });
  });

  group('write', () {
    test('fades in, then draws every particle at full strength', () {
      final sim = _sim(SeasonalEffect.snow, SeasonalDensity.normal);
      final sheet = SeasonalSpriteSheet(
        rects: Float32List(SeasonalSprite.count * 4),
        cellSize: 64,
      );
      final transforms = Float32List(sim.outputCapacity * 4);
      final rects = Float32List(sim.outputCapacity * 4);
      final colors = Int32List(sim.outputCapacity);

      int maxAlpha() {
        final n = sim.write(sheet, transforms, rects, colors);
        expect(n, sim.count);
        return [
          for (var i = 0; i < n; i++) (colors[i] >> 24) & 0xFF,
        ].reduce(math.max);
      }

      expect(maxAlpha(), 0);
      _run(sim, SeasonalSimulation.fadeInSeconds + 0.1, 1 / 60);
      expect(maxAlpha(), greaterThan(200));
    });

    test('rockets draw a trail on top of their own sprite', () {
      final sim = _sim(SeasonalEffect.fireworks, SeasonalDensity.heavy);
      _run(sim, 0.5, 1 / 60);
      final sheet = SeasonalSpriteSheet(
        rects: Float32List(SeasonalSprite.count * 4),
        cellSize: 64,
      );
      final n = sim.write(
        sheet,
        Float32List(sim.outputCapacity * 4),
        Float32List(sim.outputCapacity * 4),
        Int32List(sim.outputCapacity),
      );
      expect(n, greaterThan(sim.count));
      expect(n, lessThanOrEqualTo(sim.outputCapacity));
    });

    final petalFrames = {
      for (var f = 0; f < SeasonalSprite.flipFrames; f++) SeasonalSprite.petal + f,
    };
    final batFrames = {
      for (var f = 0; f < SeasonalSprite.batFrames; f++) SeasonalSprite.bat + f,
    };

    test('christmas mixes baubles and stars into the snow', () {
      final sim = _sim(SeasonalEffect.christmas, SeasonalDensity.heavy);
      final drawn = _spritesDrawn(sim);
      expect(drawn, containsAll([SeasonalSprite.bauble, SeasonalSprite.star]));
      expect(drawn.intersection({SeasonalSprite.softDot, SeasonalSprite.flake}), isNotEmpty);
    });

    test('spring turns petals over, drops whole blossoms and sends bees across', () {
      final sim = _sim(SeasonalEffect.petals, SeasonalDensity.heavy);
      final seen = <int>{};
      _run(sim, 2, 1 / 30, () => seen.addAll(_spritesDrawn(sim)));
      expect(seen.difference({...petalFrames, SeasonalSprite.blossom, SeasonalSprite.bee}), isEmpty);
      expect(seen.intersection(petalFrames).length, greaterThan(3));
      expect(seen, containsAll([SeasonalSprite.blossom, SeasonalSprite.bee]));
    });

    test('fireflies glow with the soft sprite only', () {
      final sim = _sim(SeasonalEffect.fireflies, SeasonalDensity.normal);
      expect(_spritesDrawn(sim), {SeasonalSprite.glow});
    });

    test('halloween flaps its bats over candy and leaves, with the odd ghost', () {
      final seen = <int>{};
      for (final seed in [1, 2, 3]) {
        final sim = _sim(SeasonalEffect.halloween, SeasonalDensity.heavy, seed: seed);
        _run(sim, 20, 1 / 30, () => seen.addAll(_spritesDrawn(sim)));
      }
      expect(seen, containsAll([...batFrames, SeasonalSprite.ghost, SeasonalSprite.candy]));
      expect(seen.intersection({SeasonalSprite.leafOval, SeasonalSprite.leafMaple}), isNotEmpty);
    });
  });

  group('preference values', () {
    test("older clients' names map onto this set", () {
      expect(UserPreferences.normalizeSeasonalSurprise('winter'), 'snow');
      expect(UserPreferences.normalizeSeasonalSurprise('fall'), 'leaves');
      expect(UserPreferences.normalizeSeasonalSurprise('spring'), 'petals');
      expect(UserPreferences.normalizeSeasonalSurprise('summer'), 'fireflies');
      expect(UserPreferences.normalizeSeasonalSurprise('halloween'), 'halloween');
      expect(UserPreferences.normalizeSeasonalSurprise('Snow'), 'snow');
      expect(UserPreferences.normalizeSeasonalSurprise('aurora'), 'none');
      expect(UserPreferences.parseSeasonalSurprise('aurora'), isNull);
    });

    test('every value names an effect or none', () {
      for (final value in UserPreferences.seasonalSurpriseValues) {
        if (value == UserPreferences.seasonalNone) continue;
        expect(SeasonalEffect.values.asNameMap()[value], isNotNull, reason: value);
      }
      for (final value in UserPreferences.seasonalDensityValues) {
        expect(SeasonalDensity.values.asNameMap()[value], isNotNull, reason: value);
      }
      expect(UserPreferences.normalizeSeasonalDensity('blizzard'), 'normal');
    });
  });
}
