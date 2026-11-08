import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/system_ui.dart';
import '../playback/game_playback_ui.dart';
import 'after_hours_canvas.dart';
import 'after_hours_game.dart';
import 'after_hours_scores.dart';
import 'after_hours_sound.dart';
import 'after_hours_widgets.dart';

/// Paints a game on the 480 x 270 virtual screen, scaled to fit or to cover,
/// and steps it from a Ticker unless it's a still.
class ArcadeCanvas extends StatefulWidget {
  const ArcadeCanvas({
    super.key,
    required this.game,
    this.demo = false,
    this.paused = false,
    this.still = false,
    this.fit = BoxFit.contain,
    this.onTick,
  });

  final ArcadeGame game;

  /// The attract demo: the game's AI plays, and a crash restarts it after a
  /// beat.
  final bool demo;
  final bool paused;
  final bool still;
  final BoxFit fit;
  final VoidCallback? onTick;

  @override
  State<ArcadeCanvas> createState() => ArcadeCanvasState();
}

class ArcadeCanvasState extends State<ArcadeCanvas>
    with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  Duration _last = Duration.zero;
  double _overT = 0;
  double _clock = 4;
  final _repaint = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    if (widget.still) return;
    final ticker = _ticker = createTicker(_tick);
    if (!widget.paused) ticker.start();
  }

  // A paused game doesn't change, so its ticker stops instead of repainting
  // the same frame under the menus.
  @override
  void didUpdateWidget(ArcadeCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    final ticker = _ticker;
    if (ticker == null || widget.paused == oldWidget.paused) return;
    if (widget.paused) {
      ticker.stop();
    } else {
      _last = Duration.zero;
      ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    _repaint.dispose();
    super.dispose();
  }

  void _tick(Duration elapsed) {
    final dt = math.min(.05, (elapsed - _last).inMicroseconds / 1e6);
    _last = elapsed;
    final g = widget.game;
    if (widget.demo) {
      _clock += dt;
      if (g.over) {
        if ((_overT += dt) > 1.2) {
          g.reset();
          _overT = 0;
        }
      } else {
        g.ai();
        g.update(dt);
      }
    } else {
      // A run can also end from input, like a case dropped clear of the stack.
      if (!g.over) {
        _clock += dt;
        g.update(dt);
      }
      widget.onTick?.call();
    }
    _repaint.value++;
  }

  /// Where the virtual screen sits inside [size].
  ({double scale, Offset offset}) layout(Size size) {
    final sx = size.width / arcadeW, sy = size.height / arcadeH;
    final s = widget.fit == BoxFit.cover ? math.max(sx, sy) : math.min(sx, sy);
    return (
      scale: s,
      offset: Offset(
        (size.width - arcadeW * s) / 2,
        (size.height - arcadeH * s) / 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: CustomPaint(
      size: Size.infinite,
      painter: _ArcadePainter(this, widget.game),
    ),
  );
}

class _ArcadePainter extends CustomPainter {
  _ArcadePainter(this.state, this.game) : super(repaint: state._repaint);

  final ArcadeCanvasState state;
  final ArcadeGame game;

  @override
  void paint(Canvas canvas, Size size) {
    final l = state.layout(size);
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    canvas.translate(l.offset.dx, l.offset.dy);
    canvas.scale(l.scale);
    canvas.clipRect(const Rect.fromLTWH(0, 0, arcadeW, arcadeH));
    game.draw(Ctx(canvas), state._clock);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ArcadePainter old) => old.game != game;
}

enum _Phase { howTo, running, paused, over }

/// Which games' How to play cards this device has started from, so each one
/// opens by itself only before the first run.
const _howToSeenPref = Preference<List<String>>(
  key: 'after_hours_how_to_seen',
  defaultValue: <String>[],
);

PreferenceStore? get _store => GetIt.instance.maybeGet<PreferenceStore>();

ArcadeButton? _buttonFor(LogicalKeyboardKey key) {
  if (key.isUpKey) return ArcadeButton.up;
  if (key.isDownKey) return ArcadeButton.down;
  if (key.isLeftKey) return ArcadeButton.left;
  if (key.isRightKey) return ArcadeButton.right;
  if (key.isSelectKey) return ArcadeButton.ok;
  return null;
}

/// A game being played, full screen, with its pause menu and game over.
class ArcadePlayView extends StatefulWidget {
  const ArcadePlayView({
    super.key,
    required this.id,
    required this.make,
    required this.scores,
    required this.phone,
    required this.onExit,
    this.howTo = false,
  });

  final ArcadeGameId id;
  final ArcadeGame Function() make;
  final AfterHoursScores scores;
  final bool phone;
  final VoidCallback onExit;

  /// Opens on the How to play card even when this device has seen it.
  final bool howTo;

  @override
  State<ArcadePlayView> createState() => ArcadePlayViewState();
}

class ArcadePlayViewState extends State<ArcadePlayView> with ImmersiveSystemUi {
  late final ArcadeGame game;
  final _focus = FocusNode(debugLabel: 'AfterHoursPlay');
  final _canvasKey = GlobalKey<ArcadeCanvasState>();
  _Phase _phase = _Phase.running;
  bool _howToFromPause = false;
  int _index = 0;
  int? _rank;
  bool _hint = true;
  Timer? _hintTimer;
  Offset? _down;
  bool _swiped = false;

  AfterHoursSound get _sound => AfterHoursSound.instance;

  @override
  void initState() {
    super.initState();
    game = widget.make()..onSound = _sound.play;
    final seen = _store?.get(_howToSeenPref) ?? const <String>[];
    if (widget.howTo || !seen.contains(widget.id.id)) {
      _phase = _Phase.howTo;
    } else {
      _startHint();
    }
    GamePlaybackSystemUi.enter(
      this,
      immersive: widget.phone,
      orientations: const [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _hintTimer?.cancel();
    _focus.dispose();
    unawaited(GamePlaybackSystemUi.restore(this, immersive: widget.phone));
    super.dispose();
  }

  void _startHint() {
    _hintTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() => _hint = false);
    });
  }

  /// Back pauses a run, resumes a paused one and leaves a finished one.
  bool handleBack() {
    switch (_phase) {
      case _Phase.howTo:
        _howToFromPause ? _backToPause() : _quit();
      case _Phase.running:
        _pause();
      case _Phase.paused:
        _sound.play(ArcadeSound.back);
        setState(() => _phase = _Phase.running);
      case _Phase.over:
        _sound.play(ArcadeSound.back);
        widget.onExit();
    }
    return true;
  }

  void _pause() {
    if (_phase != _Phase.running) return;
    _sound.play(ArcadeSound.back);
    setState(() {
      _phase = _Phase.paused;
      _index = 0;
    });
  }

  void _onTick() {
    if (!game.over || _phase == _Phase.over) return;
    _sound.play(ArcadeSound.crash);
    setState(() {
      _phase = _Phase.over;
      _index = 0;
      _rank = null;
    });
    final score = game.score;
    unawaited(
      widget.scores.submit(widget.id, score).then((rank) {
        if (!mounted || _phase != _Phase.over) return;
        if (rank != null) _sound.play(ArcadeSound.fanfare);
        setState(() => _rank = rank);
      }),
    );
  }

  void _playAgain() {
    _sound.play(ArcadeSound.select);
    game.reset();
    setState(() {
      _phase = _Phase.running;
      _rank = null;
    });
  }

  void _quit() {
    _sound.play(ArcadeSound.back);
    widget.onExit();
  }

  void _start() {
    _sound.play(ArcadeSound.select);
    final store = _store;
    final seen = store?.get(_howToSeenPref) ?? const <String>[];
    if (store != null && !seen.contains(widget.id.id)) {
      unawaited(store.set(_howToSeenPref, [...seen, widget.id.id]));
    }
    setState(() => _phase = _Phase.running);
    _startHint();
  }

  void _backToPause() {
    _sound.play(ArcadeSound.back);
    setState(() {
      _phase = _Phase.paused;
      _howToFromPause = false;
      _index = 2;
    });
  }

  List<(String, VoidCallback)> _howToItems(AppLocalizations l10n) =>
      _howToFromPause
      ? [(l10n.afterHoursBackToGame, _backToPause)]
      : [
          (l10n.afterHoursStart, _start),
          (
            widget.phone ? l10n.afterHoursArcade : l10n.afterHoursBackToArcade,
            _quit,
          ),
        ];

  List<(String, VoidCallback)> _pauseItems(AppLocalizations l10n) => [
    (
      l10n.gameKeepPlaying,
      () {
        _sound.play(ArcadeSound.select);
        setState(() => _phase = _Phase.running);
      },
    ),
    (
      _sound.enabled ? l10n.mute : l10n.unmute,
      () {
        unawaited(_sound.setEnabled(!_sound.enabled));
        _sound.play(ArcadeSound.select);
        setState(() {});
      },
    ),
    (
      l10n.afterHoursHowToPlay,
      () {
        _sound.play(ArcadeSound.select);
        setState(() {
          _phase = _Phase.howTo;
          _howToFromPause = true;
          _index = 0;
        });
      },
    ),
    (l10n.gameExitGame, _quit),
  ];

  List<(String, VoidCallback)> _overItems(AppLocalizations l10n) => [
    (l10n.afterHoursPlayAgain, _playAgain),
    (widget.phone ? l10n.afterHoursArcade : l10n.afterHoursBackToArcade, _quit),
  ];

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    final button = _buttonFor(event.logicalKey);
    if (button == null) return KeyEventResult.ignored;
    if (_phase == _Phase.running) {
      if (event is KeyDownEvent) {
        game.press(button);
      } else if (event is KeyUpEvent) {
        game.release(button);
      }
      return KeyEventResult.handled;
    }
    if (!event.isActionable) return KeyEventResult.handled;
    final l10n = AppLocalizations.of(context);
    final items = switch (_phase) {
      _Phase.paused => _pauseItems(l10n),
      _Phase.howTo => _howToItems(l10n),
      _ => _overItems(l10n),
    };
    final step = switch (button) {
      ArcadeButton.up || ArcadeButton.left => -1,
      ArcadeButton.down || ArcadeButton.right => 1,
      ArcadeButton.ok => 0,
    };
    if (step == 0) {
      if (event is KeyDownEvent) items[_index].$2();
    } else {
      final next = (_index + step).clamp(0, items.length - 1);
      if (next != _index) {
        _sound.play(ArcadeSound.tick);
        setState(() => _index = next);
      }
    }
    return KeyEventResult.handled;
  }

  Offset? _virtual(Offset local) {
    final box = _canvasKey.currentContext?.findRenderObject() as RenderBox?;
    final state = _canvasKey.currentState;
    if (box == null || state == null) return null;
    final l = state.layout(box.size);
    return (local - l.offset) / l.scale;
  }

  void _pointerDown(PointerDownEvent e) {
    if (_phase != _Phase.running) return;
    _down = e.localPosition;
    _swiped = false;
    switch (game.touchMode) {
      case TouchMode.drag:
        final v = _virtual(e.localPosition);
        if (v != null) game.drag(v.dx);
      case TouchMode.tapOnDown:
        game.press(ArcadeButton.ok);
      case TouchMode.tapAndSwipe:
        break;
    }
  }

  void _pointerMove(PointerMoveEvent e) {
    final down = _down;
    if (_phase != _Phase.running || down == null) return;
    if (game.touchMode == TouchMode.drag) {
      final v = _virtual(e.localPosition);
      if (v != null) game.drag(v.dx);
      return;
    }
    if (_swiped) return;
    final d = e.localPosition - down;
    if (d.distance < 24) return;
    _swiped = true;
    game.press(
      d.dx.abs() > d.dy.abs()
          ? (d.dx > 0 ? ArcadeButton.right : ArcadeButton.left)
          : (d.dy > 0 ? ArcadeButton.down : ArcadeButton.up),
    );
  }

  void _pointerUp(PointerUpEvent e) {
    if (_phase == _Phase.running &&
        _down != null &&
        !_swiped &&
        game.touchMode == TouchMode.tapAndSwipe) {
      game.press(ArcadeButton.ok);
    }
    _down = null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Focus(
      focusNode: _focus,
      onKeyEvent: _onKey,
      child: ColoredBox(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Listener(
              behavior: HitTestBehavior.opaque,
              onPointerDown: _pointerDown,
              onPointerMove: _pointerMove,
              onPointerUp: _pointerUp,
              child: ArcadeCanvas(
                key: _canvasKey,
                game: game,
                paused: _phase != _Phase.running,
                onTick: _onTick,
              ),
            ),
            if (_phase == _Phase.running) ..._hud(l10n),
            if (_phase == _Phase.paused) _pauseMenu(l10n),
            if (_phase == _Phase.over) _gameOver(l10n),
            if (_phase == _Phase.howTo) _howToCard(l10n),
          ],
        ),
      ),
    );
  }

  List<Widget> _hud(AppLocalizations l10n) {
    final controls = widget.phone
        ? widget.id.touchControls(l10n)
        : widget.id.remoteControls(l10n);
    return [
      Positioned(
        left: 16,
        right: 16,
        bottom: 18,
        child: Center(
          child: AnimatedOpacity(
            opacity: _hint ? 1 : 0,
            duration: const Duration(milliseconds: 400),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(8, 6, 22, .8),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                controls,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: K.ink),
              ),
            ),
          ),
        ),
      ),
      if (widget.phone)
        Positioned(
          right: 20,
          top: 24,
          child: SafeArea(
            child: Material(
              color: const Color.fromRGBO(255, 255, 255, .14),
              shape: const CircleBorder(),
              child: IconButton(
                tooltip: l10n.pause,
                icon: const Icon(Icons.pause, color: K.ink, size: 20),
                onPressed: _pause,
              ),
            ),
          ),
        )
      else
        Positioned(
          right: 20,
          bottom: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(8, 6, 22, .78),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AhKeyHint(l10n.back, l10n.pause),
          ),
        ),
    ];
  }

  Widget _menu(List<(String, VoidCallback)> items, double fontSize) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (var i = 0; i < items.length; i++)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AhButton(
            label: items[i].$1,
            focused: i == _index,
            fontSize: fontSize,
            expand: true,
            onHover: () => setState(() => _index = i),
            onTap: items[i].$2,
          ),
        ),
    ],
  );

  Widget _buttonRow(List<(String, VoidCallback)> items) => Wrap(
    spacing: widget.phone ? 8 : 12,
    runSpacing: 8,
    children: [
      for (var i = 0; i < items.length; i++)
        AhButton(
          label: items[i].$1,
          focused: i == _index,
          fontSize: widget.phone ? 14 : 17,
          onHover: () => setState(() => _index = i),
          onTap: items[i].$2,
        ),
    ],
  );

  Widget _howToCard(AppLocalizations l10n) {
    final phone = widget.phone;
    final id = widget.id;
    Widget group(CastGroup g) {
      final (title, color) = switch (g) {
        CastGroup.enemy => (l10n.afterHoursEnemies, K.coral),
        CastGroup.obstacle => (l10n.afterHoursObstacles, K.muted),
        CastGroup.power => (l10n.afterHoursPowerups, K.mint),
      };
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 7),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: K.line)),
            ),
            child: AhKicker(title, color: color, size: phone ? 10.5 : 11.5),
          ),
          for (final item in id.cast.where((c) => c.group == g))
            Padding(
              padding: EdgeInsets.symmetric(vertical: phone ? 4 : 6),
              child: Row(
                children: [
                  AhCastIcon(
                    sprite: item.sprite,
                    scale: item.scale,
                    dx: item.dx,
                    dy: item.dy,
                    size: phone ? 36 : 44,
                  ),
                  SizedBox(width: phone ? 10 : 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          castText(l10n, item.sprite).name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: phone ? 13 : 15,
                            fontWeight: FontWeight.w700,
                            color: K.ink,
                          ),
                        ),
                        // Three lines hold a translation about 40 percent
                        // longer than English, so the ellipsis is a last
                        // resort.
                        Text(
                          castText(l10n, item.sprite).line,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: phone ? 11.5 : 13.5,
                            height: 1.35,
                            color: K.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color.fromRGBO(8, 6, 22, .97),
            Color.fromRGBO(8, 6, 22, .88),
          ],
          stops: const [0, .16],
        ),
      ),
      child: Center(
        child: AhDesignBox(
          width: phone ? 844 : 960,
          height: phone ? 390 : 540,
          child: Padding(
            padding: phone
                ? const EdgeInsets.fromLTRB(44, 16, 44, 14)
                : const EdgeInsets.fromLTRB(56, 30, 56, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AhKicker(l10n.afterHoursHowToPlay, color: K.gold),
                const SizedBox(height: 4),
                Text(
                  id.name(l10n),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ahDisplay(phone ? 36 : 46),
                ),
                SizedBox(height: phone ? 6 : 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: AhKicker(
                        phone ? l10n.afterHoursTouch : l10n.remote,
                        size: 11,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        id.cardControls(l10n, touch: phone),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: phone ? 13 : 15,
                          color: const Color(0xFFD4CFF2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: phone ? 10 : 18),
                // A phone scrolls a cast taller than its landscape screen.
                // A remote can't scroll, so on TV a cast that still doesn't
                // fit shrinks a little rather than spill over the buttons.
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, box) {
                      final cast = SizedBox(
                        width: box.maxWidth,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final g in CastGroup.values) ...[
                              if (g != CastGroup.enemy)
                                SizedBox(width: phone ? 20 : 28),
                              Expanded(child: group(g)),
                            ],
                          ],
                        ),
                      );
                      return phone
                          ? SingleChildScrollView(child: cast)
                          : FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.topLeft,
                              child: cast,
                            );
                    },
                  ),
                ),
                SizedBox(height: phone ? 8 : 14),
                _buttonRow(_howToItems(l10n)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pauseMenu(AppLocalizations l10n) => ColoredBox(
    color: const Color.fromRGBO(8, 6, 22, .72),
    child: Center(
      child: AhDesignBox(
        width: widget.phone ? 844 : 960,
        height: widget.phone ? 390 : 540,
        child: Center(
          child: SizedBox(
            width: 300,
            child: AhPanel(
              opacity: .96,
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.gamePaused,
                    textAlign: TextAlign.center,
                    style: ahDisplay(44, color: K.gold),
                  ),
                  const SizedBox(height: 6),
                  _menu(_pauseItems(l10n), 17),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _gameOver(AppLocalizations l10n) {
    final phone = widget.phone;
    final scores = widget.scores;
    final rank = _rank;
    final board = scores.boards[widget.id] ?? const <ArcadeScore>[];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color.fromRGBO(8, 6, 22, .97),
            Color.fromRGBO(8, 6, 22, .8),
          ],
          stops: const [0, .16],
        ),
      ),
      child: Center(
        child: AhDesignBox(
          width: phone ? 844 : 960,
          height: phone ? 390 : 540,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: phone ? 96 : 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.afterHoursGameOver,
                        style: ahDisplay(phone ? 54 : 78, color: K.coral),
                      ),
                      SizedBox(height: phone ? 8 : 12),
                      Text(
                        formatScore(context, game.score),
                        style: ahMono(phone ? 28 : 40),
                      ),
                      const SizedBox(height: 2),
                      if (rank != null)
                        Text(
                          l10n.afterHoursNewRank(rank),
                          style: ahDisplay(phone ? 24 : 32, color: K.gold),
                        ),
                      SizedBox(height: phone ? 16 : 26),
                      _buttonRow(_overItems(l10n)),
                      if (!phone) ...[
                        const SizedBox(height: 10),
                        Text(
                          boardSource(l10n, scores),
                          style: const TextStyle(fontSize: 13, color: K.muted),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: phone ? 24 : 40),
                SizedBox(
                  width: phone ? 290 : 330,
                  child: AhPanel(
                    opacity: .92,
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AhKicker(
                          '${widget.id.name(l10n)} · ${l10n.afterHoursTop3}',
                        ),
                        const SizedBox(height: 6),
                        AhBoard(
                          rows: board,
                          scores: scores,
                          fresh: rank,
                          fontSize: phone ? 14 : 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String boardSource(AppLocalizations l10n, AfterHoursScores scores) =>
    scores.fromServer
    ? l10n.afterHoursScoresFrom(scores.serverName ?? '')
    : l10n.afterHoursScoresOnDevice;
