import 'dart:math' as math;
import 'dart:ui' show Color;

import 'package:flutter/foundation.dart' show mustCallSuper;

import '../../../l10n/app_localizations.dart';
import 'after_hours_canvas.dart';
import 'games/buffer_run.dart';
import 'games/cable_crawl.dart';
import 'games/case_stack.dart';
import 'games/fast_forward.dart';
import 'games/pixel_purge.dart';

enum ArcadeButton { up, down, left, right, ok }

enum ArcadeSound {
  tick,
  select,
  back,
  jump,
  whoosh,
  swish,
  pickup,
  powerup,
  breakSound('break'),
  thud,
  crash,
  fanfare;

  const ArcadeSound([this._file]);
  final String? _file;
  String get file => _file ?? name;
}

/// How a game reads a touchscreen. Taps fire on lift for games that also
/// take swipes, so a swipe never jumps first.
enum TouchMode { tapAndSwipe, tapOnDown, drag }

/// One After Hours game: its rules, its attract demo and its drawing on the
/// 480 x 270 virtual screen.
abstract class ArcadeGame {
  ArcadeGame(this.rng);

  final math.Random rng;
  bool over = false;
  int score = 0;
  double t = 0;

  /// Effects for the event that just happened. Demos leave it unset.
  void Function(ArcadeSound sound)? onSound;

  void sound(ArcadeSound s) => onSound?.call(s);

  double rand(double a, double b) => a + rng.nextDouble() * (b - a);
  int randInt(int a, int b) => rand(a.toDouble(), b + 1.0).floor();

  TouchMode get touchMode => TouchMode.tapAndSwipe;

  @mustCallSuper
  void reset() {
    over = false;
    t = 0;
    score = 0;
  }

  void update(double dt);

  /// The attract demo's player, called once a frame before [update].
  void ai();
  void draw(Ctx c, double t);

  void press(ArcadeButton b);
  void release(ArcadeButton b) {}

  /// A finger at [x] on the virtual screen, for games steered by dragging.
  void drag(double x) {}

  /// Runs the demo for [seconds] at 60 fps, the way the menu warms one up.
  void simulate(double seconds) {
    reset();
    for (var i = 0; i < seconds * 60; i++) {
      if (over) reset();
      ai();
      update(1 / 60);
    }
    if (over) reset();
  }
}

/// A case for Case Stack: an uppercase title and its spine color.
typedef CaseTitle = ({String title, Color color});

enum ArcadeGameId {
  bufferRun('buffer-run'),
  fastForward('fast-forward'),
  cableCrawl('cable-crawl'),
  caseStack('case-stack'),
  pixelPurge('pixel-purge');

  const ArcadeGameId(this.id);

  /// The id the server and the device store use.
  final String id;

  ArcadeGame create({
    math.Random? rng,
    List<CaseTitle> titles = const [],
    required AppLocalizations l10n,
  }) {
    final r = rng ?? math.Random();
    return switch (this) {
      bufferRun => BufferRun(r),
      fastForward => FastForward(r),
      cableCrawl => CableCrawl(r),
      caseStack => CaseStack(
        r,
        titles,
        perfectLabel: l10n.afterHoursPerfect,
        boxSetLabel: l10n.afterHoursBoxSet,
      ),
      pixelPurge => PixelPurge(r),
    }..reset();
  }

  String name(AppLocalizations l10n) => switch (this) {
    bufferRun => l10n.afterHoursBufferRun,
    fastForward => l10n.afterHoursFastForward,
    cableCrawl => l10n.afterHoursCableCrawl,
    caseStack => l10n.afterHoursCaseStack,
    pixelPurge => l10n.afterHoursPixelPurge,
  };

  String genre(AppLocalizations l10n) => switch (this) {
    bufferRun => l10n.afterHoursBufferRunGenre,
    fastForward => l10n.afterHoursFastForwardGenre,
    cableCrawl => l10n.afterHoursCableCrawlGenre,
    caseStack => l10n.afterHoursCaseStackGenre,
    pixelPurge => l10n.afterHoursPixelPurgeGenre,
  };

  String pitch(AppLocalizations l10n) => switch (this) {
    bufferRun => l10n.afterHoursBufferRunPitch,
    fastForward => l10n.afterHoursFastForwardPitch,
    cableCrawl => l10n.afterHoursCableCrawlPitch,
    caseStack => l10n.afterHoursCaseStackPitch,
    pixelPurge => l10n.afterHoursPixelPurgePitch,
  };

  String remoteControls(AppLocalizations l10n) => switch (this) {
    bufferRun => l10n.afterHoursBufferRunRemote,
    fastForward => l10n.afterHoursFastForwardRemote,
    cableCrawl => l10n.afterHoursCableCrawlRemote,
    caseStack => l10n.afterHoursCaseStackRemote,
    pixelPurge => l10n.afterHoursPixelPurgeRemote,
  };

  String touchControls(AppLocalizations l10n) => switch (this) {
    bufferRun => l10n.afterHoursBufferRunTouch,
    fastForward => l10n.afterHoursFastForwardTouch,
    cableCrawl => l10n.afterHoursCableCrawlTouch,
    caseStack => l10n.afterHoursCaseStackTouch,
    pixelPurge => l10n.afterHoursPixelPurgeTouch,
  };

  /// The card's short controls line, which matches the longer one for every
  /// game but these two.
  String cardControls(AppLocalizations l10n, {required bool touch}) =>
      switch ((this, touch)) {
        (bufferRun, true) => l10n.afterHoursBufferRunCardTouch,
        (pixelPurge, false) => l10n.afterHoursPixelPurgeCardRemote,
        (_, true) => touchControls(l10n),
        (_, false) => remoteControls(l10n),
      };

  /// The How to play card's cast, with the scale and nudge each sprite gets
  /// in its 44 px box.
  List<CastItem> get cast => switch (this) {
    bufferRun => const [
      (group: CastGroup.enemy, sprite: 'lagBat', scale: 1.6, dy: 0, dx: 0),
      (group: CastGroup.enemy, sprite: 'gremlin', scale: 1.6, dy: 0, dx: 0),
      (group: CastGroup.obstacle, sprite: 'cable', scale: 1.25, dy: 0, dx: 0),
      (group: CastGroup.obstacle, sprite: 'banner', scale: .95, dy: 9, dx: 0),
      (group: CastGroup.power, sprite: 'directPlay', scale: 1.5, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'skipIntro', scale: 1.3, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'popcorn', scale: 1.8, dy: 0, dx: 0),
    ],
    fastForward => const [
      (group: CastGroup.enemy, sprite: 'rollingReel', scale: 1.5, dy: 0, dx: 0),
      (group: CastGroup.enemy, sprite: 'usher', scale: .95, dy: 1, dx: 8),
      (
        group: CastGroup.obstacle,
        sprite: 'velvetRope',
        scale: 1.2,
        dy: 0,
        dx: 0,
      ),
      (
        group: CastGroup.obstacle,
        sprite: 'popcornCart',
        scale: .8,
        dy: 2,
        dx: 0,
      ),
      (
        group: CastGroup.power,
        sprite: 'frontRowPass',
        scale: 1.3,
        dy: 1,
        dx: 0,
      ),
      (group: CastGroup.power, sprite: 'magnet', scale: 1.5, dy: -1, dx: 0),
      (group: CastGroup.power, sprite: 'ticket', scale: 1.8, dy: 0, dx: 0),
    ],
    cableCrawl => const [
      (group: CastGroup.enemy, sprite: 'bug', scale: 1.8, dy: 0, dx: 0),
      (group: CastGroup.enemy, sprite: 'tangle', scale: 1.8, dy: 0, dx: 0),
      (
        group: CastGroup.obstacle,
        sprite: 'staticBlock',
        scale: 1.8,
        dy: 0,
        dx: 0,
      ),
      (group: CastGroup.obstacle, sprite: 'brick', scale: 1.1, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'ghost', scale: 1.8, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'snip', scale: 1.8, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'signal', scale: 2, dy: 0, dx: 0),
    ],
    caseStack => const [
      (group: CastGroup.enemy, sprite: 'shelfCat', scale: 1.2, dy: 0, dx: 0),
      (group: CastGroup.obstacle, sprite: 'bluCase', scale: 1.2, dy: 0, dx: 0),
      (
        group: CastGroup.obstacle,
        sprite: 'steelbook',
        scale: 1.2,
        dy: 0,
        dx: 0,
      ),
      (group: CastGroup.power, sprite: 'perfect', scale: 1.3, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'boxSet', scale: 1.3, dy: 0, dx: 0),
    ],
    pixelPurge => const [
      (group: CastGroup.enemy, sprite: 'deadPixel', scale: 1.3, dy: 0, dx: 0),
      (
        group: CastGroup.obstacle,
        sprite: 'macroblock',
        scale: 1.2,
        dy: 0,
        dx: 0,
      ),
      (group: CastGroup.obstacle, sprite: 'keyframe', scale: 1.3, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'hdr', scale: 1.3, dy: 0, dx: 0),
      (group: CastGroup.power, sprite: 'bufferNet', scale: 1.4, dy: 0, dx: 0),
    ],
  };
}

enum CastGroup { enemy, obstacle, power }

typedef CastItem = ({
  CastGroup group,
  String sprite,
  double scale,
  double dy,
  double dx,
});

/// A cast member's name and what it does, as the How to play card says them.
({String name, String line}) castText(AppLocalizations l10n, String sprite) =>
    switch (sprite) {
      'lagBat' => (
        name: l10n.afterHoursCastLagBat,
        line: l10n.afterHoursCastLagBatLine,
      ),
      'gremlin' => (
        name: l10n.afterHoursCastGremlin,
        line: l10n.afterHoursCastGremlinLine,
      ),
      'cable' => (
        name: l10n.afterHoursCastCable,
        line: l10n.afterHoursCastCableLine,
      ),
      'banner' => (
        name: l10n.afterHoursCastBanner,
        line: l10n.afterHoursCastBannerLine,
      ),
      'directPlay' => (
        name: l10n.directPlay,
        line: l10n.afterHoursCastShieldLine,
      ),
      'skipIntro' => (
        name: l10n.afterHoursCastSkipIntro,
        line: l10n.afterHoursCastSkipIntroLine,
      ),
      'popcorn' => (
        name: l10n.afterHoursCastPopcorn,
        line: l10n.afterHoursCastPointsLine,
      ),
      'rollingReel' => (
        name: l10n.afterHoursCastRollingReel,
        line: l10n.afterHoursCastRollingReelLine,
      ),
      'usher' => (
        name: l10n.afterHoursCastUsher,
        line: l10n.afterHoursCastUsherLine,
      ),
      'velvetRope' => (
        name: l10n.afterHoursCastVelvetRope,
        line: l10n.afterHoursCastVelvetRopeLine,
      ),
      'popcornCart' => (
        name: l10n.afterHoursCastPopcornCart,
        line: l10n.afterHoursCastPopcornCartLine,
      ),
      'frontRowPass' => (
        name: l10n.afterHoursCastFrontRowPass,
        line: l10n.afterHoursCastShieldLine,
      ),
      'magnet' => (
        name: l10n.afterHoursCastMagnet,
        line: l10n.afterHoursCastMagnetLine,
      ),
      'ticket' => (
        name: l10n.afterHoursCastTicket,
        line: l10n.afterHoursCastPointsLine,
      ),
      'bug' => (name: l10n.afterHoursCastBug, line: l10n.afterHoursCastBugLine),
      'tangle' => (
        name: l10n.afterHoursCastTangle,
        line: l10n.afterHoursCastTangleLine,
      ),
      'staticBlock' => (
        name: l10n.afterHoursCastStatic,
        line: l10n.afterHoursCastStaticLine,
      ),
      'brick' => (
        name: l10n.afterHoursCastBrick,
        line: l10n.afterHoursCastBrickLine,
      ),
      'ghost' => (
        name: l10n.afterHoursCastGhost,
        line: l10n.afterHoursCastGhostLine,
      ),
      'snip' => (
        name: l10n.afterHoursCastSnip,
        line: l10n.afterHoursCastSnipLine,
      ),
      'signal' => (
        name: l10n.afterHoursCastSignal,
        line: l10n.afterHoursCastSignalLine,
      ),
      'shelfCat' => (
        name: l10n.afterHoursCastShelfCat,
        line: l10n.afterHoursCastShelfCatLine,
      ),
      'bluCase' => (
        name: l10n.afterHoursCastBluCase,
        line: l10n.afterHoursCastBluCaseLine,
      ),
      'steelbook' => (
        name: l10n.afterHoursCastSteelbook,
        line: l10n.afterHoursCastSteelbookLine,
      ),
      'perfect' => (
        name: l10n.afterHoursCastPerfect,
        line: l10n.afterHoursCastPerfectLine,
      ),
      'boxSet' => (
        name: l10n.afterHoursCastBoxSet,
        line: l10n.afterHoursCastBoxSetLine,
      ),
      'deadPixel' => (
        name: l10n.afterHoursCastDeadPixel,
        line: l10n.afterHoursCastDeadPixelLine,
      ),
      'macroblock' => (
        name: l10n.afterHoursCastMacroblock,
        line: l10n.afterHoursCastMacroblockLine,
      ),
      'keyframe' => (
        name: l10n.afterHoursCastKeyframe,
        line: l10n.afterHoursCastKeyframeLine,
      ),
      'hdr' => (name: l10n.hdr, line: l10n.afterHoursCastHdrLine),
      'bufferNet' => (
        name: l10n.afterHoursCastBufferNet,
        line: l10n.afterHoursCastBufferNetLine,
      ),
      _ => (name: sprite, line: ''),
    };

/// The first sentence of a pitch, which is all the TV menu has room for.
String firstSentence(String text) {
  final end = text.indexOf('. ');
  return end < 0 ? text : text.substring(0, end + 1);
}
