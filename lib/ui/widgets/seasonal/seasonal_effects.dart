import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/user_preferences.dart';
import '../../screensaver/screensaver_controller.dart';
import '../focus/locked_focus_row.dart';
import '../left_sidebar.dart';
import '../top_toolbar.dart';
import 'seasonal_follower.dart';
import 'seasonal_simulation.dart';
import 'seasonal_sprite_atlas.dart';

/// Decides whether Home's seasonal effect runs at all.
///
/// It draws nothing and holds no ticker for an effect it doesn't know, with reduce motion
/// on, or while the screensaver is up. The screensaver sits over the navigator rather than
/// on a route of its own, so Home stays the current route under it and the particles would
/// otherwise keep animating behind it for as long as it runs.
class SeasonalEffectsHost extends StatelessWidget {
  const SeasonalEffectsHost({
    super.key,
    required this.effect,
    required this.density,
    this.reducedFrameRate = false,
    this.followFocus = false,
  });

  /// The stored seasonal surprise value. Legacy and unknown values are handled here.
  final String effect;

  /// The stored seasonal density value.
  final String density;

  /// Run at about 30 fps, for devices on the reduced performance tier.
  final bool reducedFrameRate;

  /// Lets the effect's followers, like Halloween's planchette, follow focus. Home turns
  /// them on for TV.
  final bool followFocus;

  @override
  Widget build(BuildContext context) {
    final resolved = SeasonalEffect.values.asNameMap()[
        UserPreferences.normalizeSeasonalSurprise(effect)];
    if (resolved == null) return const SizedBox.shrink();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      return const SizedBox.shrink();
    }
    final resolvedDensity = SeasonalDensity.values.asNameMap()[
        UserPreferences.normalizeSeasonalDensity(density)]!;

    Widget layer() => SeasonalEffectsLayer(
      key: ValueKey((resolved, resolvedDensity, reducedFrameRate, followFocus)),
      effect: resolved,
      density: resolvedDensity,
      reducedFrameRate: reducedFrameRate,
      followFocus: followFocus,
    );

    final getIt = GetIt.instance;
    if (!getIt.isRegistered<ScreensaverController>()) return layer();
    return ValueListenableBuilder<bool>(
      valueListenable: getIt<ScreensaverController>().visible,
      builder: (context, visible, _) =>
          visible ? const SizedBox.shrink() : layer(),
    );
  }
}

/// Puts the effect's follower in place of the mouse pointer over [child], for Home in the
/// desktop layout. It sits above the nav bars, which cover Home's own seasonal layer, and
/// leaves the pointer alone for an effect without a follower.
class SeasonalPointer extends StatelessWidget {
  const SeasonalPointer({
    super.key,
    required this.effect,
    required this.enabled,
    required this.child,
  });

  /// The stored seasonal surprise value.
  final String effect;
  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final resolved = SeasonalEffect.values.asNameMap()[
        UserPreferences.normalizeSeasonalSurprise(effect)];
    final styles = [
      if (resolved != null)
        for (final style in FollowerStyle.forEffect(resolved))
          if (!style.onlyOnCards) style,
    ];
    final active =
        enabled &&
        styles.isNotEmpty &&
        !(MediaQuery.maybeDisableAnimationsOf(context) ?? false);
    final getIt = GetIt.instance;
    final layer = _SeasonalPointerLayer(key: ValueKey(resolved), styles: styles);
    // Always a Stack, so turning it on or off keeps Home's state under it.
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (active)
          Positioned.fill(
            child: getIt.isRegistered<ScreensaverController>()
                ? ValueListenableBuilder<bool>(
                    valueListenable: getIt<ScreensaverController>().visible,
                    builder: (context, visible, _) =>
                        visible ? const SizedBox.shrink() : layer,
                  )
                : layer,
          ),
      ],
    );
  }
}

class _SeasonalPointerLayer extends StatefulWidget {
  const _SeasonalPointerLayer({super.key, required this.styles});

  final List<FollowerStyle> styles;

  @override
  State<_SeasonalPointerLayer> createState() => _SeasonalPointerLayerState();
}

class _SeasonalPointerLayerState extends State<_SeasonalPointerLayer>
    with SingleTickerProviderStateMixin {
  late final _followers = [
    for (final style in widget.styles) SeasonalFollower(style),
  ];
  final _frame = _FrameSignal();
  late final Ticker _ticker;
  Duration _lastTick = Duration.zero;
  double _pixelRatio = 0;
  Offset? _pointer;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);
    if (pixelRatio != _pixelRatio) {
      for (final follower in _followers) {
        follower.rasterize(pixelRatio);
      }
      _pixelRatio = pixelRatio;
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    for (final follower in _followers) {
      follower.dispose();
    }
    _frame.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _lastTick).inMicroseconds /
        Duration.microsecondsPerSecond;
    _lastTick = elapsed;
    // Once the follower has faded out there's nothing left to repaint.
    final showing = _pointer != null || _followers.any((f) => f.opacity > 0);
    for (final follower in _followers) {
      follower.stepPointer(dt, _pointer);
    }
    if (showing) _frame.tick();
  }

  void _track(PointerEvent event) {
    if (event.kind == PointerDeviceKind.mouse) _pointer = event.localPosition;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.none,
      // Enter also fires when Home appears under a pointer that hasn't moved.
      onEnter: _track,
      onHover: _track,
      onExit: (_) => _pointer = null,
      // Hover stops while a button is held, so a drag is followed from here.
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerMove: _track,
        child: IgnorePointer(
          child: ExcludeSemantics(
            child: RepaintBoundary(
              child: CustomPaint(
                size: Size.infinite,
                painter: _FollowerPainter(_followers, _frame),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Draws one effect, starting full and fading in over a second and a half.
class SeasonalEffectsLayer extends StatefulWidget {
  const SeasonalEffectsLayer({
    super.key,
    required this.effect,
    required this.density,
    this.reducedFrameRate = false,
    this.followFocus = false,
  });

  final SeasonalEffect effect;
  final SeasonalDensity density;
  final bool reducedFrameRate;
  final bool followFocus;

  @override
  State<SeasonalEffectsLayer> createState() => _SeasonalEffectsLayerState();
}

class _SeasonalEffectsLayerState extends State<SeasonalEffectsLayer>
    with SingleTickerProviderStateMixin {
  static const _reducedInterval = Duration(milliseconds: 33);

  late final SeasonalSimulation _sim = SeasonalSimulation(
    widget.effect,
    widget.density,
  );
  late final Float32List _transforms = Float32List(_sim.outputCapacity * 4);
  late final Float32List _rects = Float32List(_sim.outputCapacity * 4);
  late final Int32List _colors = Int32List(_sim.outputCapacity);
  final _frame = _FrameSignal();
  late final _followers = [
    if (widget.followFocus)
      for (final style in FollowerStyle.forEffect(widget.effect))
        SeasonalFollower(style),
  ];

  // What focus resolves to, worked out again only when the focused node changes.
  ModalRoute<Object?>? _route;
  FocusNode? _primary;
  LockedFocusRowState? _row;
  RenderBox? _sidebar;
  var _landing = FollowerLanding.card;
  var _focusOnRoute = false;
  RenderObject? _focusedRoot;
  RenderObject? _focused;

  SeasonalSpriteAtlas? _atlas;
  double _atlasPixelRatio = 0;

  Ticker? _ticker;
  Duration _lastTick = Duration.zero;

  // Low memory devices step on a timer at about 30 fps instead of every vsync, since every
  // effect frame also redraws Home underneath it.
  Timer? _timer;
  final _clock = Stopwatch();
  Duration _lastTimerTick = Duration.zero;
  ValueListenable<TickerModeData>? _tickerMode;

  @override
  void initState() {
    super.initState();
    if (!widget.reducedFrameRate) {
      _ticker = createTicker(_onTick)..start();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);
    if (pixelRatio != _atlasPixelRatio) {
      _atlas?.dispose();
      _atlas = SeasonalSpriteAtlas.build(pixelRatio);
      for (final follower in _followers) {
        follower.rasterize(pixelRatio);
      }
      _atlasPixelRatio = pixelRatio;
    }
    if (_followers.isNotEmpty) {
      final route = ModalRoute.of(context);
      if (route != _route) {
        _route = route;
        _primary = null;
      }
    }
    if (widget.reducedFrameRate) {
      // A timer isn't muted like a ticker when a route covers Home, so it follows the
      // same switch by hand.
      final tickerMode = TickerMode.getValuesNotifier(context);
      if (tickerMode != _tickerMode) {
        _tickerMode?.removeListener(_syncTimer);
        _tickerMode = tickerMode..addListener(_syncTimer);
        _syncTimer();
      }
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    _timer?.cancel();
    _tickerMode?.removeListener(_syncTimer);
    _atlas?.dispose();
    for (final follower in _followers) {
      follower.dispose();
    }
    _frame.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _lastTick).inMicroseconds /
        Duration.microsecondsPerSecond;
    _lastTick = elapsed;
    _advance(dt);
  }

  void _syncTimer() {
    final enabled = _tickerMode?.value.enabled ?? true;
    if (enabled && _timer == null) {
      _clock.start();
      _lastTimerTick = _clock.elapsed;
      _timer = Timer.periodic(_reducedInterval, (_) {
        // No frames are drawn while the app is in the background, so don't step either.
        if (!SchedulerBinding.instance.framesEnabled) return;
        final now = _clock.elapsed;
        final dt = (now - _lastTimerTick).inMicroseconds /
            Duration.microsecondsPerSecond;
        _lastTimerTick = now;
        _advance(dt);
      });
    } else if (!enabled) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void _advance(double dt) {
    _sim.step(dt);
    if (_followers.isNotEmpty) {
      final overlay = context.findRenderObject();
      if (overlay is RenderBox && overlay.hasSize && overlay.attached) {
        final primary = FocusManager.instance.primaryFocus;
        if (!identical(primary, _primary)) _resolveFocus(primary);
        final route = _route;
        final row = _row;
        final focusedRoot = _focusOnRoute && (route == null || route.isCurrent)
            ? (row == null ? primary?.context : row.focusedItemContext)
                ?.findRenderObject()
            : null;
        // A row keeps primary focus while its selected card changes, so the
        // card is looked up each frame and searched only when it's a new one,
        // or when a growing card swapped out the artwork found last time.
        if (!identical(focusedRoot, _focusedRoot) ||
            _focused?.attached == false) {
          _focusedRoot = focusedRoot;
          _focused = row != null && focusedRoot is RenderBox
              ? _artworkBox(focusedRoot)
              : focusedRoot;
        }
        final focused = _focused;
        final sidebar = _sidebar;
        final target =
            focused is RenderBox && focused.attached && focused.hasSize
            ? _boundsIn(overlay, focused)
            : null;
        final navigationBounds =
            sidebar != null && sidebar.attached && sidebar.hasSize
            ? _boundsIn(overlay, sidebar)
            : null;
        for (final follower in _followers) {
          follower.step(
            dt,
            target,
            overlay.size,
            landing: _landing,
            navigationBounds: navigationBounds,
          );
        }
      }
    }
    _frame.tick();
  }

  void _resolveFocus(FocusNode? primary) {
    _primary = primary;
    _row = null;
    _sidebar = null;
    _landing = FollowerLanding.card;
    final subtree = _route?.subtreeContext;
    _focusOnRoute = _route == null;
    primary?.context?.visitAncestorElements((element) {
      final widget = element.widget;
      if (_row == null &&
          element is StatefulElement &&
          element.state is LockedFocusRowState) {
        _row = element.state as LockedFocusRowState;
      }
      if (_landing == FollowerLanding.card) {
        if (widget is TopToolbar) _landing = FollowerLanding.below;
        if (widget is LeftSidebar) {
          _landing = FollowerLanding.right;
          final box = element.findRenderObject();
          if (box is RenderBox) _sidebar = box;
        }
      }
      // Reaching Home's own page means focus isn't in a dialog or sheet on top.
      if (identical(element, subtree)) {
        _focusOnRoute = true;
        return false;
      }
      return true;
    });
  }

  static Rect _boundsIn(RenderBox overlay, RenderBox box) => Rect.fromPoints(
    overlay.globalToLocal(box.localToGlobal(Offset.zero)),
    overlay.globalToLocal(box.localToGlobal(box.size.bottomRight(Offset.zero))),
  );

  RenderBox _artworkBox(RenderBox root) {
    RenderBox? artwork;
    void visit(RenderObject child) {
      if (artwork != null) return;
      if (child is RenderAspectRatio) {
        artwork = child;
      } else {
        child.visitChildren(visit);
      }
    }

    visit(root);
    return artwork ?? root;
  }

  @override
  Widget build(BuildContext context) {
    final atlas = _atlas!;
    return RepaintBoundary(
      child: IgnorePointer(
        child: ExcludeSemantics(
          child: LayoutBuilder(
            builder: (context, constraints) {
              _sim.resize(constraints.maxWidth, constraints.maxHeight);
              return CustomPaint(
                size: constraints.biggest,
                painter: _SeasonalPainter(
                  sim: _sim,
                  followers: _followers,
                  atlas: atlas,
                  transforms: _transforms,
                  rects: _rects,
                  colors: _colors,
                  repaint: _frame,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FrameSignal extends ChangeNotifier {
  void tick() => notifyListeners();
}

class _FollowerPainter extends CustomPainter {
  _FollowerPainter(this.followers, Listenable repaint) : super(repaint: repaint);

  final List<SeasonalFollower> followers;

  @override
  void paint(Canvas canvas, Size size) {
    for (final follower in followers) {
      follower.paint(canvas);
    }
  }

  @override
  bool shouldRepaint(_FollowerPainter oldDelegate) =>
      oldDelegate.followers != followers;
}

class _SeasonalPainter extends CustomPainter {
  _SeasonalPainter({
    required this.sim,
    required this.followers,
    required this.atlas,
    required this.transforms,
    required this.rects,
    required this.colors,
    required Listenable repaint,
  }) : super(repaint: repaint);

  // Fireworks blend normally too. Added light washes out over bright artwork.
  static final _tinted = Paint()..filterQuality = FilterQuality.low;

  final SeasonalSimulation sim;
  final List<SeasonalFollower> followers;
  final SeasonalSpriteAtlas atlas;
  final Float32List transforms;
  final Float32List rects;
  final Int32List colors;

  @override
  void paint(Canvas canvas, Size size) {
    final count = sim.write(atlas.sheet, transforms, rects, colors);
    if (count > 0) {
      canvas.drawRawAtlas(
        atlas.image,
        Float32List.sublistView(transforms, 0, count * 4),
        Float32List.sublistView(rects, 0, count * 4),
        Int32List.sublistView(colors, 0, count),
        BlendMode.modulate,
        Offset.zero & size,
        _tinted,
      );
    }
    for (final follower in followers) {
      follower.paint(canvas);
    }
  }

  @override
  bool shouldRepaint(_SeasonalPainter oldDelegate) =>
      oldDelegate.sim != sim ||
      oldDelegate.atlas != atlas ||
      oldDelegate.followers != followers;
}
