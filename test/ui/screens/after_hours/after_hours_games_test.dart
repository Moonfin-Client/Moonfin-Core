import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_canvas.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_game.dart';
import 'package:moonfin/ui/screens/after_hours/games/buffer_run.dart';
import 'package:moonfin/ui/screens/after_hours/games/cable_crawl.dart';
import 'package:moonfin/ui/screens/after_hours/games/case_stack.dart';
import 'package:moonfin/ui/screens/after_hours/games/fast_forward.dart';
import 'package:moonfin/ui/screens/after_hours/games/pixel_purge.dart';

final _l10n = lookupAppLocalizations(const Locale('en'));

T _make<T extends ArcadeGame>(ArcadeGameId id, List<ArcadeSound> heard) =>
    (id.create(rng: math.Random(7), l10n: _l10n)..onSound = heard.add) as T;

/// Seconds the attract demo stays alive, run by run, for [runs] runs.
List<double> _demoRuns(ArcadeGameId id, int runs) {
  final out = <double>[];
  for (var seed = 0; seed < runs; seed++) {
    final g = id.create(rng: math.Random(seed), l10n: _l10n);
    while (!g.over && g.t < 120) {
      g.ai();
      g.update(1 / 60);
    }
    out.add(g.t);
  }
  return out;
}

/// Hands out queued values first, then ordinary random ones.
class _Scripted implements math.Random {
  final queue = <double>[];
  final _rest = math.Random(1);

  @override
  double nextDouble() =>
      queue.isNotEmpty ? queue.removeAt(0) : _rest.nextDouble();

  @override
  int nextInt(int max) => _rest.nextInt(max);

  @override
  bool nextBool() => _rest.nextBool();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('every game', () {
    for (final id in ArcadeGameId.values) {
      test('${id.id} demo plays, scores and draws', () {
        final g = id.create(rng: math.Random(3), l10n: _l10n);
        g.simulate(20);
        final recorder = ui.PictureRecorder();
        g.draw(Ctx(Canvas(recorder)), 4);
        recorder.endRecording().dispose();
        var best = 0;
        for (var i = 0; i < 60 * 30; i++) {
          if (g.over) g.reset();
          g.ai();
          g.update(1 / 60);
          best = math.max(best, g.score);
        }
        expect(best, greaterThan(0));
      });
    }

    test('the attract demos survive', () {
      // The demo AI is tuned to keep a run going, so a bug in the rules or
      // the AI shows up as runs that end almost at once.
      for (final id in ArcadeGameId.values) {
        final runs = _demoRuns(id, 12)..sort();
        final median = runs[runs.length ~/ 2];
        expect(median, greaterThan(8), reason: '${id.id} runs: $runs');
      }
    });
  });

  test('every cast member has a sprite and How to play text', () {
    final recorder = ui.PictureRecorder();
    final c = Ctx(Canvas(recorder));
    var count = 0;
    for (final id in ArcadeGameId.values) {
      for (final item in id.cast) {
        count++;
        expect(sprites.containsKey(item.sprite), isTrue, reason: item.sprite);
        sprites[item.sprite]!(c, .35);
        final text = castText(_l10n, item.sprite);
        expect(text.name, isNot(item.sprite));
        expect(text.line, isNotEmpty);
      }
    }
    recorder.endRecording().dispose();
    expect(count, 31);
  });

  group('Buffer Run', () {
    test('the second jump flips onto the ceiling and lands there', () {
      final heard = <ArcadeSound>[];
      final g = _make<BufferRun>(ArcadeGameId.bufferRun, heard);
      g.jump();
      expect(g.p.jumps, 1);
      expect(g.p.vy, -540);
      g.update(.1);
      g.jump();
      expect(g.p.grav, -1);
      expect(heard, [ArcadeSound.jump, ArcadeSound.whoosh]);
      for (var i = 0; i < 120 && !g.p.ground; i++) {
        g.update(1 / 60);
      }
      expect(g.p.ground, isTrue);
      expect(g.p.y, arcadeH - 232 + 20);
    });

    test('on the ceiling Up and Down swap', () {
      final g = _make<BufferRun>(ArcadeGameId.bufferRun, []);
      g.p
        ..grav = -1
        ..y = arcadeH - 232 + 20;
      g.press(ArcadeButton.up);
      expect(g.p.slide, greaterThan(0));
      expect(g.p.jumps, 0);
      g.press(ArcadeButton.down);
      expect(g.p.jumps, 1);
      expect(g.p.vy, 540);
    });

    test('one well timed jump takes all five pieces of a popcorn arc', () {
      int piecesTaken(int jumpAt) {
        final rng = _Scripted();
        final g =
            ArcadeGameId.bufferRun.create(rng: rng, l10n: _l10n) as BufferRun;
        g.next = 0;
        // The first two draws pick popcorn and put it on the runner's side.
        rng.queue.addAll([.9, .1]);
        g.update(1 / 60);
        final arc = g.things.where((o) => o.k == 'popcorn').toList();
        for (var i = 1; i < 5 * 60 && !g.over; i++) {
          if (i == jumpAt) g.jump();
          g.update(1 / 60);
        }
        return arc.where((o) => o.dead).length;
      }

      expect(List.generate(4 * 60, piecesTaken).reduce(math.max), 5);
    });

    test('a cable ends the run, a dash smashes it, popcorn scores', () {
      final heard = <ArcadeSound>[];
      final g = _make<BufferRun>(ArcadeGameId.bufferRun, heard);
      g.things.add(BrThing('popcorn', 66, 232 - 30, 12, 12, 1, pick: true));
      g.update(.001);
      expect(g.bonus, 25);
      expect(heard, contains(ArcadeSound.pickup));

      g.p.dash = 3;
      g.things.add(BrThing('cable', 60, 232 - 18, 26, 18, 1));
      g.update(.001);
      expect(g.over, isFalse);
      expect(g.bonus, 75);
      expect(heard.last, ArcadeSound.breakSound);

      g.p.dash = 0;
      g.things.add(BrThing('cable', 60, 232 - 18, 26, 18, 1));
      g.update(.001);
      expect(g.over, isTrue);
    });

    test('a ceiling cable is mirrored, so it misses a floor runner', () {
      final g = _make<BufferRun>(ArcadeGameId.bufferRun, []);
      g.things.add(BrThing('cable', 60, 232 - 18, 26, 18, -1));
      g.update(.001);
      expect(g.over, isFalse);
    });
  });

  group('Fast Forward', () {
    test('lanes stop at the edges and a hop needs the ground', () {
      final heard = <ArcadeSound>[];
      final g = _make<FastForward>(ArcadeGameId.fastForward, heard);
      g.press(ArcadeButton.up);
      g.press(ArcadeButton.up);
      expect(g.p.lane, 0);
      g.press(ArcadeButton.down);
      g.press(ArcadeButton.down);
      g.press(ArcadeButton.down);
      expect(g.p.lane, 2);
      expect(heard.where((s) => s == ArcadeSound.swish), hasLength(3));
      g.press(ArcadeButton.ok);
      expect(g.p.jv, 420);
      g.update(.05);
      g.press(ArcadeButton.ok);
      expect(heard.where((s) => s == ArcadeSound.jump), hasLength(1));
    });

    test('a cart ends the run unless the pass takes the hit', () {
      final heard = <ArcadeSound>[];
      final g = _make<FastForward>(ArcadeGameId.fastForward, heard);
      g.p.pass = true;
      g.things.add(FfThing('popcornCart', 85, 1, 30, tall: true));
      g.update(.001);
      expect(g.over, isFalse);
      expect(g.p.pass, isFalse);
      expect(heard.last, ArcadeSound.breakSound);
      g.inv = 0;
      g.things.add(FfThing('popcornCart', 85, 1, 30, tall: true));
      g.update(.001);
      expect(g.over, isTrue);
    });

    test('a hop clears a rope but not a cart', () {
      final g = _make<FastForward>(ArcadeGameId.fastForward, []);
      g.p.jy = 30;
      g.p.jv = 1;
      g.things.add(FfThing('velvetRope', 85, 1, 30));
      g.update(.001);
      expect(g.over, isFalse);
      g.things.add(FfThing('popcornCart', 85, 1, 30, tall: true));
      g.update(.001);
      expect(g.over, isTrue);
    });
  });

  group('Cable Crawl', () {
    test('turns queue up to two and never reverse', () {
      final g = _make<CableCrawl>(ArcadeGameId.cableCrawl, []);
      g.press(ArcadeButton.left);
      g.press(ArcadeButton.right);
      expect(g.queue, isEmpty);
      g.press(ArcadeButton.up);
      g.press(ArcadeButton.up);
      g.press(ArcadeButton.right);
      g.press(ArcadeButton.down);
      expect(g.queue, [(0, -1), (1, 0)]);
    });

    test('signal grows the cable and scores, the edge ends it', () {
      final heard = <ArcadeSound>[];
      final g = _make<CableCrawl>(ArcadeGameId.cableCrawl, heard);
      g.food = (x: 9, y: 8);
      g.update(g.step);
      expect(g.eaten, 1);
      expect(g.score, 10 + 4);
      expect(heard, [ArcadeSound.pickup]);
      g.body = [(x: 31, y: 2), (x: 30, y: 2), (x: 29, y: 2)];
      g.update(g.step);
      expect(g.over, isTrue);
    });

    test('snip cuts the cable in half for points', () {
      final heard = <ArcadeSound>[];
      final g = _make<CableCrawl>(ArcadeGameId.cableCrawl, heard);
      g.food = (x: 0, y: 0);
      g.grow = 0;
      g.body = [for (var x = 20; x >= 9; x--) (x: x, y: 5)];
      g.items.add(CcItem(21, 5, 'snip', 8));
      g.update(g.step);
      expect(g.body, hasLength(6));
      expect(g.score, 5 * (12 - 6));
      expect(heard, [ArcadeSound.breakSound]);
    });
  });

  group('Case Stack', () {
    test(
      'trims the overhang, widens on a perfect drop, box set on the third',
      () {
        final heard = <ArcadeSound>[];
        final g = _make<CaseStack>(ArcadeGameId.caseStack, heard);
        final base = g.stack.first;
        g.cur!.x = base.x + 20;
        g.drop();
        expect(g.stack.last.w, 130);
        expect(heard, containsAll([ArcadeSound.thud, ArcadeSound.breakSound]));
        for (var i = 1; i <= 3; i++) {
          g.cur!.x = g.stack.last.x;
          g.drop();
          expect(g.combo, i);
        }
        expect(g.stack.last.w, 150);
        expect(heard.last, ArcadeSound.powerup);
        expect(g.score, g.stack.length - 1 + (5 + 10 + 15));
      },
    );

    test('a case that misses the stack ends the run', () {
      final g = _make<CaseStack>(ArcadeGameId.caseStack, []);
      g.cur!.x = 12;
      g.stack.last.x = 300;
      g.drop();
      expect(g.over, isTrue);
      expect(g.cur, isNull);
    });

    test('titles come from the list it was given', () {
      CaseStack stack(List<CaseTitle> titles) => CaseStack(
        math.Random(1),
        titles,
        perfectLabel: 'PERFECT',
        boxSetLabel: 'BOX SET',
      );
      final g = stack(const [(title: 'ARRIVAL', color: Color(0xFFE0B23A))])
        ..reset();
      expect(g.stack.first.title, 'ARRIVAL');
      expect(stack(const []).shelf, neutralCaseTitles);
    });
  });

  group('Pixel Purge', () {
    test('a held key slides the scrubber at 330 a second', () {
      final g = _make<PixelPurge>(ArcadeGameId.pixelPurge, []);
      g.press(ArcadeButton.left);
      g.update(.1);
      expect(g.p.x, closeTo(arcadeW / 2 - 33, .001));
      g.release(ArcadeButton.left);
      g.update(.1);
      expect(g.p.x, closeTo(arcadeW / 2 - 33, .001));
      g.drag(400);
      expect(g.p.tx, 400);
    });

    test('the ball bounces off the scrubber, blocks at the line end it', () {
      final heard = <ArcadeSound>[];
      final g = _make<PixelPurge>(ArcadeGameId.pixelPurge, heard);
      g.b
        ..x = g.p.x
        ..y = 243
        ..vx = 0
        ..vy = 200;
      g.update(1 / 60);
      expect(g.b.vy, lessThan(0));
      expect(heard, contains(ArcadeSound.tick));
      g.blocks.first.y = 225;
      g.update(1 / 60);
      expect(g.over, isTrue);
    });
  });
}
