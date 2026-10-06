import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/user_preferences.dart';
import '../../screensaver/screensaver_controller.dart';
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
  });

  /// The stored seasonal surprise value. Legacy and unknown values are handled here.
  final String effect;

  /// The stored seasonal density value.
  final String density;

  /// Run at about 30 fps, for devices on the reduced performance tier.
  final bool reducedFrameRate;

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
      key: ValueKey((resolved, resolvedDensity, reducedFrameRate)),
      effect: resolved,
      density: resolvedDensity,
      reducedFrameRate: reducedFrameRate,
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

/// Draws one effect, starting full and fading in over a second and a half.
class SeasonalEffectsLayer extends StatefulWidget {
  const SeasonalEffectsLayer({
    super.key,
    required this.effect,
    required this.density,
    this.reducedFrameRate = false,
  });

  final SeasonalEffect effect;
  final SeasonalDensity density;
  final bool reducedFrameRate;

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
      _atlasPixelRatio = pixelRatio;
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
    _frame.tick();
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

class _SeasonalPainter extends CustomPainter {
  _SeasonalPainter({
    required this.sim,
    required this.atlas,
    required this.transforms,
    required this.rects,
    required this.colors,
    required Listenable repaint,
  }) : super(repaint: repaint);

  // Fireworks blend normally too. Added light washes out over bright artwork.
  static final _tinted = Paint()..filterQuality = FilterQuality.low;

  final SeasonalSimulation sim;
  final SeasonalSpriteAtlas atlas;
  final Float32List transforms;
  final Float32List rects;
  final Int32List colors;

  @override
  void paint(Canvas canvas, Size size) {
    final count = sim.write(atlas.sheet, transforms, rects, colors);
    if (count == 0) return;
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

  @override
  bool shouldRepaint(_SeasonalPainter oldDelegate) =>
      oldDelegate.sim != sim || oldDelegate.atlas != atlas;
}
