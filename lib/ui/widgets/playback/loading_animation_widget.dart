import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../preference/preference_constants.dart';

/// Extension helpers to map loading animation enums to layout properties.
extension LoadingAnimationSizeX on LoadingAnimationSize {
  double get pixelSize => switch (this) {
        LoadingAnimationSize.thumbnail => 36.0,
        LoadingAnimationSize.small => 64.0,
        LoadingAnimationSize.medium => 110.0,
        LoadingAnimationSize.large => 170.0,
      };

  double get labelSpacing => switch (this) {
        LoadingAnimationSize.thumbnail => 8.0,
        LoadingAnimationSize.small => 14.0,
        LoadingAnimationSize.medium => 24.0,
        LoadingAnimationSize.large => 40.0,
      };

  double get labelFontSize => switch (this) {
        LoadingAnimationSize.thumbnail => 10.0,
        LoadingAnimationSize.small => 12.0,
        LoadingAnimationSize.medium => 14.0,
        LoadingAnimationSize.large => 16.0,
      };

  double get labelLetterSpacing => switch (this) {
        LoadingAnimationSize.thumbnail => 1.5,
        LoadingAnimationSize.small => 2.5,
        LoadingAnimationSize.medium => 3.5,
        LoadingAnimationSize.large => 4.0,
      };
}

extension LoadingAnimationPositionX on LoadingAnimationPosition {
  Alignment get alignment => switch (this) {
        LoadingAnimationPosition.topLeft => Alignment.topLeft,
        LoadingAnimationPosition.topCenter => Alignment.topCenter,
        LoadingAnimationPosition.topRight => Alignment.topRight,
        LoadingAnimationPosition.middleLeft => Alignment.centerLeft,
        LoadingAnimationPosition.middle => Alignment.center,
        LoadingAnimationPosition.middleRight => Alignment.centerRight,
        LoadingAnimationPosition.bottomLeft => Alignment.bottomLeft,
        LoadingAnimationPosition.bottomCenter => Alignment.bottomCenter,
        LoadingAnimationPosition.bottomRight => Alignment.bottomRight,
        LoadingAnimationPosition.bouncing => Alignment.center,
      };

  EdgeInsets get safePadding => switch (this) {
        LoadingAnimationPosition.topLeft => const EdgeInsets.all(40.0),
        LoadingAnimationPosition.topCenter =>
          const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
        LoadingAnimationPosition.topRight => const EdgeInsets.all(40.0),
        LoadingAnimationPosition.middleLeft =>
          const EdgeInsets.only(left: 40.0, top: 24.0, bottom: 24.0),
        LoadingAnimationPosition.middle => EdgeInsets.zero,
        LoadingAnimationPosition.middleRight =>
          const EdgeInsets.only(right: 40.0, top: 24.0, bottom: 24.0),
        LoadingAnimationPosition.bottomLeft => const EdgeInsets.all(40.0),
        LoadingAnimationPosition.bottomCenter =>
          const EdgeInsets.only(bottom: 40.0, left: 24.0, right: 24.0),
        LoadingAnimationPosition.bottomRight => const EdgeInsets.all(40.0),
        LoadingAnimationPosition.bouncing => EdgeInsets.zero,
      };

  /// Whether a runner in this position should face left to run toward the center.
  bool get facesLeft =>
      this == LoadingAnimationPosition.topRight ||
      this == LoadingAnimationPosition.middleRight ||
      this == LoadingAnimationPosition.bottomRight;
}

extension LoadingAnimationSpeedX on LoadingAnimationSpeed {
  double get multiplier => switch (this) {
        LoadingAnimationSpeed.slow => 0.45,
        LoadingAnimationSpeed.moderate => 0.70,
        LoadingAnimationSpeed.fast => 1.0,
        LoadingAnimationSpeed.ultra => 1.60,
      };
}

/// DVD screensaver-style continuous bouncing container.
/// Moves its child around the available viewport and reflects off boundaries.
class BouncingPositionWrapper extends StatefulWidget {
  final Widget Function(BuildContext context, bool movingLeft) builder;
  final EdgeInsets safePadding;
  final LoadingAnimationSpeed speed;

  const BouncingPositionWrapper({
    super.key,
    required this.builder,
    this.safePadding = const EdgeInsets.all(24.0),
    this.speed = LoadingAnimationSpeed.fast,
  });

  @override
  State<BouncingPositionWrapper> createState() =>
      _BouncingPositionWrapperState();
}

class _BouncingPositionWrapperState extends State<BouncingPositionWrapper>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration? _lastElapsed;

  // Alignment coordinates (-1.0 to 1.0)
  double _alignX = -0.5;
  double _alignY = -0.3;

  // Speeds in alignment units per second (incommensurate ratio for classic DVD wandering)
  double _velX = 0.42;
  double _velY = 0.54;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    if (!mounted) return;
    if (_lastElapsed == null) {
      _lastElapsed = elapsed;
      return;
    }
    final rawDt = (elapsed - _lastElapsed!).inMicroseconds / 1000000.0;
    _lastElapsed = elapsed;
    if (rawDt <= 0) return;
    final dt = rawDt.clamp(0.0, 0.05);
    final speedMult = widget.speed.multiplier;

    setState(() {
      _alignX += _velX * dt * speedMult;
      _alignY += _velY * dt * speedMult;

      if (_alignX >= 1.0) {
        _alignX = 1.0;
        _velX = -_velX.abs();
      } else if (_alignX <= -1.0) {
        _alignX = -1.0;
        _velX = _velX.abs();
      }

      if (_alignY >= 1.0) {
        _alignY = 1.0;
        _velY = -_velY.abs();
      } else if (_alignY <= -1.0) {
        _alignY = -1.0;
        _velY = _velY.abs();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movingLeft = _velX < 0;

    return Padding(
      padding: widget.safePadding,
      child: Align(
        alignment: Alignment(_alignX, _alignY),
        child: widget.builder(context, movingLeft),
      ),
    );
  }
}

/// Renders the configured loading animation visual.
class LoadingAnimationWidget extends StatelessWidget {
  final LoadingAnimationImage image;
  final double size;
  final LoadingAnimationPosition? position;
  final bool? flipHorizontal;
  final LoadingAnimationSpeed speed;

  const LoadingAnimationWidget({
    super.key,
    required this.image,
    required this.size,
    this.position,
    this.flipHorizontal,
    this.speed = LoadingAnimationSpeed.fast,
  });

  @override
  Widget build(BuildContext context) {
    return switch (image) {
      LoadingAnimationImage.none => const SizedBox.shrink(),
      LoadingAnimationImage.moonfinLogo => MoonfinLogoAnimation(
          size: size,
          speed: speed,
        ),
      LoadingAnimationImage.spinner => StockSpinnerAnimation(
          size: size,
          speed: speed,
        ),
      LoadingAnimationImage.runner => RunnerAnimation(
          size: size,
          position: position,
          flipHorizontal: flipHorizontal,
          speed: speed,
        ),
      LoadingAnimationImage.moonPhases => MoonPhasesAnimation(
          size: size,
          palette: MoonPhasesPalette.natural,
          speed: speed,
        ),
      LoadingAnimationImage.moonfinPhases => MoonPhasesAnimation(
          size: size,
          palette: MoonPhasesPalette.moonfin,
          speed: speed,
        ),
      LoadingAnimationImage.neonfinPhases => MoonPhasesAnimation(
          size: size,
          palette: MoonPhasesPalette.neonfin,
          speed: speed,
        ),
    };
  }
}

/// 3D Y-axis spinning gradient Moonfin logo animation.
class MoonfinLogoAnimation extends StatefulWidget {
  final double size;
  final LoadingAnimationSpeed speed;

  const MoonfinLogoAnimation({
    super.key,
    required this.size,
    this.speed = LoadingAnimationSpeed.fast,
  });

  @override
  State<MoonfinLogoAnimation> createState() => _MoonfinLogoAnimationState();
}

class _MoonfinLogoAnimationState extends State<MoonfinLogoAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Duration get _duration =>
      Duration(milliseconds: (8000 / widget.speed.multiplier).round());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _duration,
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant MoonfinLogoAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed) {
      _controller.duration = _duration;
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_controller.value * 2 * math.pi),
          child: child,
        );
      },
      child: SvgPicture.asset(
        'assets/icons/moonfin_logo.svg',
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}

/// Sleek gradient circular progress spinner.
class StockSpinnerAnimation extends StatefulWidget {
  final double size;
  final LoadingAnimationSpeed speed;

  const StockSpinnerAnimation({
    super.key,
    required this.size,
    this.speed = LoadingAnimationSpeed.fast,
  });

  @override
  State<StockSpinnerAnimation> createState() => _StockSpinnerAnimationState();
}

class _StockSpinnerAnimationState extends State<StockSpinnerAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Duration get _duration =>
      Duration(milliseconds: (1200 / widget.speed.multiplier).round());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _duration,
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant StockSpinnerAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed) {
      _controller.duration = _duration;
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strokeWidth = (widget.size * 0.08).clamp(2.5, 7.0);
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _SpinnerPainter(
              progress: _controller.value,
              strokeWidth: strokeWidth,
            ),
          );
        },
      ),
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  _SpinnerPainter({required this.progress, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;

    // Track circle
    final trackPaint = Paint()
      ..color = Colors.white.withAlpha(30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, trackPaint);

    // Rotating gradient arc
    final startAngle = progress * 2 * math.pi;
    const sweepAngle = math.pi * 1.35;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: sweepAngle,
      colors: const [Color(0x00AA5CC3), Color(0xFFAA5CC3), Color(0xFF00A4DC)],
      stops: const [0.0, 0.45, 1.0],
      transform: GradientRotation(startAngle),
    );

    final arcPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, startAngle, sweepAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant _SpinnerPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.strokeWidth != strokeWidth;
}

/// Dynamic stylized athletic stick figure sprinting animation.
/// Automatically faces toward the center of the screen based on [position].
class RunnerAnimation extends StatefulWidget {
  final double size;
  final LoadingAnimationPosition? position;
  final bool? flipHorizontal;
  final LoadingAnimationSpeed speed;

  const RunnerAnimation({
    super.key,
    required this.size,
    this.position,
    this.flipHorizontal,
    this.speed = LoadingAnimationSpeed.fast,
  });

  @override
  State<RunnerAnimation> createState() => _RunnerAnimationState();
}

class _RunnerAnimationState extends State<RunnerAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Duration get _duration =>
      Duration(milliseconds: (620 / widget.speed.multiplier).round());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _duration,
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant RunnerAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed) {
      _controller.duration = _duration;
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shouldFaceLeft = widget.flipHorizontal ??
        (widget.position?.facesLeft ?? false);

    Widget runner = SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _RunnerPainter(strideProgress: _controller.value),
          );
        },
      ),
    );

    if (shouldFaceLeft) {
      runner = Transform.flip(
        flipX: true,
        child: runner,
      );
    }

    return runner;
  }
}

class _RunnerPainter extends CustomPainter {
  final double strideProgress;

  _RunnerPainter({required this.strideProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 100.0;
    final strokeW = (6.5 * scale).clamp(3.0, 9.5);

    // Moonfin signature brand colors: Cyan lead limbs & torso, Purple trail limbs, White head
    const moonfinCyan = Color(0xFF00A4DC);
    const moonfinPurple = Color(0xFFAA5CC3);
    const headColor = Colors.white;

    final leadLimbPaint = Paint()
      ..color = moonfinCyan
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeW;

    final trailLimbPaint = Paint()
      ..color = moonfinPurple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeW * 0.92;

    final torsoPaint = Paint()
      ..color = moonfinCyan
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeW * 1.05;

    final headPaint = Paint()
      ..color = headColor
      ..style = PaintingStyle.fill;

    // Stride phase angle (0 to 2*pi)
    final phi = strideProgress * 2 * math.pi;

    // Dynamic running bounce (two vertical oscillations per full stride)
    final bounce = math.sin(phi * 2) * 2.8 * scale;

    // Forward sprint lean anchor points
    final hip = Offset(42.0 * scale, (52.0 * scale) + bounce);
    final shoulder = Offset(hip.dx + (16.0 * scale), (28.0 * scale) + bounce);
    final headCenter = Offset(shoulder.dx + (5.0 * scale), shoulder.dy - (12.0 * scale));
    final headRadius = 7.5 * scale;

    // Phase difference between lead and trail limbs is pi
    final phaseLead = phi;
    final phaseTrail = phi + math.pi;

    // Back leg & back arm (purple, drawn behind torso first)
    _drawSprintLeg(canvas, hip, phaseTrail, trailLimbPaint, scale);
    _drawSprintArm(canvas, shoulder, phaseLead, trailLimbPaint, scale);

    // Torso (Moonfin cyan)
    canvas.drawLine(hip, shoulder, torsoPaint);

    // Head (pure white circle)
    canvas.drawCircle(headCenter, headRadius, headPaint);

    // Front leg & front arm (Moonfin cyan, drawn on top)
    _drawSprintLeg(canvas, hip, phaseLead, leadLimbPaint, scale);
    _drawSprintArm(canvas, shoulder, phaseTrail, leadLimbPaint, scale);
  }

  void _drawSprintLeg(
    Canvas canvas,
    Offset hip,
    double phase,
    Paint paint,
    double scale,
  ) {
    final s = math.sin(phase);
    final c = math.cos(phase);

    final thighLen = 18.0 * scale;
    final calfLen = 17.0 * scale;

    // Thigh angle: high-knee forward when s > 0, extends back when s < 0
    final thighAngle = (0.75 * s - 0.15); // in radians

    final kneeX = hip.dx + (thighLen * math.sin(thighAngle));
    final kneeY = hip.dy + (thighLen * math.cos(thighAngle));
    final knee = Offset(kneeX, kneeY);

    // Dynamic knee flexion:
    // Knee flexes deeply (~95 deg) on push-off/back-recovery so heel kicks up high toward glutes,
    // and extends forward naturally on the forward stride for foot strike.
    final kneeFlex = 0.85 - (0.75 * s) + (0.35 * c);
    final calfAngle = thighAngle - kneeFlex;

    final footX = knee.dx + (calfLen * math.sin(calfAngle));
    final footY = knee.dy + (calfLen * math.cos(calfAngle));
    final foot = Offset(footX, footY);

    canvas.drawLine(hip, knee, paint);
    canvas.drawLine(knee, foot, paint);
  }

  void _drawSprintArm(
    Canvas canvas,
    Offset shoulder,
    double phase,
    Paint paint,
    double scale,
  ) {
    // Arms pump in opposition to legs: phase + pi
    final armPhase = phase + math.pi;
    final s = math.sin(armPhase);

    // Anatomical limb lengths (strictly constant, eliminating pendulum stretching)
    final upperArmLen = 14.0 * scale;
    final foreArmLen = 13.0 * scale;

    // Upper arm angle: swings forward when s > 0, pulls high-back when s < 0
    final alpha = (0.80 * s - 0.10); // in radians

    final elbowX = shoulder.dx + (upperArmLen * math.sin(alpha));
    final elbowY = shoulder.dy + (upperArmLen * math.cos(alpha));
    final elbow = Offset(elbowX, elbowY);

    // Elbow stays bent at ~80-92 degrees throughout the entire cycle (athletic L-shape).
    // Forward pump (s > 0): elbow punches forward at waist level, hand drives up to chest level.
    // Backward drive (s < 0): elbow punches high and backward, hand stays tucked near the hip.
    final beta = 1.48 - (0.12 * s); // ~78 to 92 degrees
    final foreArmAngle = alpha + beta;

    final handX = elbow.dx + (foreArmLen * math.sin(foreArmAngle));
    final handY = elbow.dy + (foreArmLen * math.cos(foreArmAngle));
    final hand = Offset(handX, handY);

    canvas.drawLine(shoulder, elbow, paint);
    canvas.drawLine(elbow, hand, paint);
  }

  @override
  bool shouldRepaint(covariant _RunnerPainter oldDelegate) =>
      oldDelegate.strideProgress != strideProgress;
}

/// Color palettes for the lunar cycle animation.
enum MoonPhasesPalette {
  natural,
  moonfin,
  neonfin,
}

/// Smooth, continuous lunar cycle animation transitioning through actual lunar phases:
/// New Moon -> Waxing Crescent -> First Quarter -> Waxing Gibbous -> Full Moon ->
/// Waning Gibbous -> Last Quarter -> Waning Crescent -> New Moon.
class MoonPhasesAnimation extends StatefulWidget {
  final double size;
  final MoonPhasesPalette palette;
  final LoadingAnimationSpeed speed;

  const MoonPhasesAnimation({
    super.key,
    required this.size,
    this.palette = MoonPhasesPalette.natural,
    this.speed = LoadingAnimationSpeed.fast,
  });

  @override
  State<MoonPhasesAnimation> createState() => _MoonPhasesAnimationState();
}

class _MoonPhasesAnimationState extends State<MoonPhasesAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Duration get _duration =>
      Duration(milliseconds: (6000 / widget.speed.multiplier).round());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _duration,
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant MoonPhasesAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed) {
      _controller.duration = _duration;
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _MoonPhasesPainter(
              phase: _controller.value,
              palette: widget.palette,
            ),
          );
        },
      ),
    );
  }
}

class _MoonPhasesPainter extends CustomPainter {
  /// Progress through the 8 phases:
  /// 0.00 = New Moon (all dark)
  /// 0.125 = Waxing Crescent (lit sliver on right)
  /// 0.25 = First Quarter (right half lit)
  /// 0.375 = Waxing Gibbous (mostly lit on right)
  /// 0.50 = Full Moon (completely lit)
  /// 0.625 = Waning Gibbous (mostly lit on left)
  /// 0.75 = Last Quarter (left half lit)
  /// 0.875 = Waning Crescent (lit sliver on left)
  /// 1.00 = New Moon (all dark)
  final double phase;
  final MoonPhasesPalette palette;

  _MoonPhasesPainter({
    required this.phase,
    this.palette = MoonPhasesPalette.natural,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.40;

    // 1. Celestial ambient glow behind the moon
    final glowColor = switch (palette) {
      MoonPhasesPalette.natural => const Color(0xFF38BDF8),
      MoonPhasesPalette.moonfin => const Color(0xFF00A4DC),
      MoonPhasesPalette.neonfin => const Color(0xFFFF2E92),
    };
    final glowPaint = Paint()
      ..color = glowColor.withAlpha(30)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, radius * 0.40);
    canvas.drawCircle(center, radius * 1.12, glowPaint);

    // 2. Base Dark Moon Disc (Night hemisphere)
    final darkBasePaint = Paint()
      ..shader = switch (palette) {
        MoonPhasesPalette.natural => RadialGradient(
            center: const Alignment(-0.25, -0.25),
            radius: 0.90,
            colors: const [
              Color(0xFF0F172A),
              Color(0xFF020617),
            ],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
        MoonPhasesPalette.moonfin => RadialGradient(
            center: const Alignment(-0.25, -0.25),
            radius: 0.90,
            colors: const [
              Color(0xFF0E1118),
              Color(0xFF000000),
            ],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
        MoonPhasesPalette.neonfin => RadialGradient(
            center: const Alignment(-0.25, -0.25),
            radius: 0.90,
            colors: const [
              Color(0xFF66F0FF), // gentle neon cyan highlight
              Color(0xFF00E5FF), // exact Neon Pulse Cyan (#00E5FF)
              Color(0xFF00B8CC), // shaded cyan
              Color(0xFF008FA0), // deep limb cyan
            ],
            stops: const [0.0, 0.40, 0.80, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
      };
    canvas.drawCircle(center, radius, darkBasePaint);

    // Subtle dark features on night side (natural moon only)
    if (palette == MoonPhasesPalette.natural) {
      _drawLunarMaria(canvas, center, radius, isLit: false);
    }

    // 3. Continuous Astronomical Terminator & Illuminated Surface
    // theta goes from 0 to 2*pi as phase goes from 0.0 to 1.0
    final theta = phase * 2 * math.pi;
    final cosT = math.cos(theta);
    final isWaxing = phase < 0.5;

    // Construct the continuous polygon path for the illuminated region
    // Sample 48 points vertically from top (y = -radius) to bottom (y = radius)
    const int sampleCount = 48;
    final litPath = Path();

    // Trace down the outer circular limb
    for (int i = 0; i <= sampleCount; i++) {
      final y = -radius + (2 * radius * i / sampleCount);
      final w = math.sqrt(math.max(0.0, radius * radius - y * y));
      // Waxing: right limb is lit (+w); Waning: left limb is lit (-w)
      final x = isWaxing ? w : -w;
      if (i == 0) {
        litPath.moveTo(center.dx + x, center.dy + y);
      } else {
        litPath.lineTo(center.dx + x, center.dy + y);
      }
    }

    // Trace back up the elliptical terminator
    for (int i = sampleCount; i >= 0; i--) {
      final y = -radius + (2 * radius * i / sampleCount);
      final w = math.sqrt(math.max(0.0, radius * radius - y * y));
      final xTerm = isWaxing ? (w * cosT) : (-w * cosT);
      litPath.lineTo(center.dx + xTerm, center.dy + y);
    }

    litPath.close();

    // Illuminated lunar surface paint
    final litSurfacePaint = Paint()
      ..shader = switch (palette) {
        MoonPhasesPalette.natural => RadialGradient(
            center: const Alignment(-0.25, -0.25),
            radius: 0.90,
            colors: const [
              Color(0xFFFFFFFF),
              Color(0xFFF8FAFC),
              Color(0xFFE2E8F0),
              Color(0xFFCBD5E1),
            ],
            stops: const [0.0, 0.40, 0.75, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
        MoonPhasesPalette.moonfin => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [
              Color(0xFFAA5CC3),
              Color(0xFF9C62C5),
              Color(0xFF7672CB),
              Color(0xFF3A8CD4),
              Color(0xFF00A4DC),
            ],
            stops: const [0.10, 0.20, 0.40, 0.66, 0.90],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
        MoonPhasesPalette.neonfin => RadialGradient(
            center: const Alignment(-0.25, -0.25),
            radius: 0.90,
            colors: const [
              Color(0xFFFF66AD), // gentle neon magenta highlight
              Color(0xFFFF2E92), // exact Neon Pulse Magenta (#FF2E92)
              Color(0xFFD61874), // shaded magenta
              Color(0xFFA80A55), // deep limb magenta
            ],
            stops: const [0.0, 0.40, 0.80, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
      };

    canvas.drawPath(litPath, litSurfacePaint);

    // Draw realistic soft-blended lunar topography on illuminated area (natural moon only)
    if (palette == MoonPhasesPalette.natural) {
      canvas.save();
      canvas.clipPath(litPath);
      _drawLunarMaria(canvas, center, radius, isLit: true);
      canvas.restore();
    }

    // 4. Crisp outer rim highlight
    final rimColor = switch (palette) {
      MoonPhasesPalette.natural => Colors.white.withAlpha(45),
      MoonPhasesPalette.moonfin => const Color(0xFF00A4DC).withAlpha(40),
      MoonPhasesPalette.neonfin => const Color(0xFF00E5FF).withAlpha(50),
    };
    final rimPaint = Paint()
      ..color = rimColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = (1.4 * (size.width / 100)).clamp(0.8, 2.0);
    canvas.drawCircle(center, radius, rimPaint);
  }

  /// Draws realistic, soft-blended lunar maria (basaltic plains) and ray craters
  /// distributed across actual lunar geography rather than clustered ovals.
  void _drawLunarMaria(
    Canvas canvas,
    Offset center,
    double radius, {
    required bool isLit,
  }) {
    // Soft blurred painter so maria blend naturally like smoky lunar terrain
    final Color mariaColor = isLit
        ? const Color(0xFF64748B).withAlpha(55) // Soft, natural basalt shadow
        : const Color(0xFF000000).withAlpha(90);

    final mariaPaint = Paint()
      ..color = mariaColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, radius * 0.12)
      ..style = PaintingStyle.fill;

    // Mare Imbrium (large round sea in northwest)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx - radius * 0.28, center.dy - radius * 0.30),
        width: radius * 0.44,
        height: radius * 0.38,
      ),
      mariaPaint,
    );

    // Oceanus Procellarum (vast soft western expanse)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx - radius * 0.45, center.dy + radius * 0.05),
        width: radius * 0.38,
        height: radius * 0.55,
      ),
      mariaPaint,
    );

    // Mare Serenitatis & Mare Tranquillitatis (sweeping northeast basins)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx + radius * 0.22, center.dy - radius * 0.24),
        width: radius * 0.34,
        height: radius * 0.30,
      ),
      mariaPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx + radius * 0.32, center.dy - radius * 0.02),
        width: radius * 0.38,
        height: radius * 0.32,
      ),
      mariaPaint,
    );

    // Mare Fecunditatis (southeast)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx + radius * 0.36, center.dy + radius * 0.22),
        width: radius * 0.28,
        height: radius * 0.24,
      ),
      mariaPaint,
    );

    // Mare Crisium (isolated crisp oval near far eastern limb)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx + radius * 0.54, center.dy - radius * 0.14),
        width: radius * 0.18,
        height: radius * 0.14,
      ),
      mariaPaint,
    );

    // Mare Nubium & Humorum (south-southwest)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx - radius * 0.16, center.dy + radius * 0.34),
        width: radius * 0.36,
        height: radius * 0.30,
      ),
      mariaPaint,
    );

    // If lit, add realistic bright ray impact craters (Tycho & Copernicus)
    if (isLit) {
      final brightCorePaint = Paint()
        ..color = Colors.white.withAlpha(210)
        ..style = PaintingStyle.fill;

      final rayPaint = Paint()
        ..color = Colors.white.withAlpha(35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = (0.8 * (radius / 50)).clamp(0.5, 1.5)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1.0);

      // Tycho crater in the south with radiating ejecta rays
      final tycho = Offset(center.dx - radius * 0.08, center.dy + radius * 0.52);
      canvas.drawCircle(tycho, radius * 0.035, brightCorePaint);
      canvas.drawLine(tycho, Offset(tycho.dx - radius * 0.25, tycho.dy - radius * 0.20), rayPaint);
      canvas.drawLine(tycho, Offset(tycho.dx + radius * 0.28, tycho.dy - radius * 0.22), rayPaint);
      canvas.drawLine(tycho, Offset(tycho.dx - radius * 0.05, tycho.dy - radius * 0.35), rayPaint);

      // Copernicus crater in mid-northwest
      final copernicus = Offset(center.dx - radius * 0.22, center.dy - radius * 0.08);
      canvas.drawCircle(copernicus, radius * 0.030, brightCorePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _MoonPhasesPainter oldDelegate) =>
      oldDelegate.phase != phase || oldDelegate.palette != palette;
}
