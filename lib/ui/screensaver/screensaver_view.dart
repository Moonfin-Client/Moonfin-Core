import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/clock_format.dart';
import '../widgets/playback/loading_animation_widget.dart';
import 'bouncing_box.dart';
import 'screensaver_content_service.dart';
import 'screensaver_gradient_backdrops.dart';

class ScreensaverView extends StatefulWidget {
  const ScreensaverView({super.key});

  @override
  State<ScreensaverView> createState() => _ScreensaverViewState();
}

class _ScreensaverViewState extends State<ScreensaverView> {
  static const _splashDelay = Duration(seconds: 2);
  static const _slideDuration = Duration(seconds: 30);

  final _prefs = GetIt.instance<UserPreferences>();
  late final ScreensaverContentService _service;

  List<ScreensaverItem> _items = const [];
  int _index = -1;
  bool _libraryEmpty = false;
  Timer? _slideTimer;

  @override
  void initState() {
    super.initState();
    _service = ScreensaverContentService(_prefs);
    if (_prefs.get(UserPreferences.screensaverBackdrop) ==
        ScreensaverBackdrop.library) {
      _startSlideshow();
    }
  }

  @override
  void dispose() {
    _slideTimer?.cancel();
    super.dispose();
  }

  Future<void> _startSlideshow() async {
    final splash = Future<void>.delayed(_splashDelay);
    final items = await _service.loadBatch();
    await splash;
    if (!mounted) return;
    if (items.isEmpty) {
      setState(() => _libraryEmpty = true);
      return;
    }
    setState(() {
      _items = items;
      _index = 0;
    });
    _precacheNext();
    _slideTimer = Timer.periodic(_slideDuration, (_) => _advance());
  }

  Future<void> _advance() async {
    if (!mounted || _items.isEmpty) return;
    if (_index + 1 >= _items.length) {
      final items = await _service.loadBatch();
      if (!mounted) return;
      if (items.isNotEmpty) {
        setState(() {
          _items = items;
          _index = 0;
        });
        _precacheNext();
        return;
      }
      setState(() => _index = 0);
      return;
    }
    setState(() => _index++);
    _precacheNext();
  }

  void _precacheNext() {
    if (_index + 1 < _items.length) {
      precacheImage(
        CachedNetworkImageProvider(_items[_index + 1].backdropUrl),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final backdrop = _prefs.get(UserPreferences.screensaverBackdrop);
    final dim = _prefs.get(UserPreferences.screensaverDimming).clamp(0, 90);
    final component = _prefs.get(UserPreferences.screensaverComponent);
    final movement = _prefs.get(UserPreferences.screensaverMovement);

    final showSlides =
        backdrop == ScreensaverBackdrop.library &&
        !_libraryEmpty &&
        _index >= 0;

    return ColoredBox(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Backdrop layer
          if (showSlides)
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: _SlideView(
                key: ValueKey(_index),
                item: _items[_index],
              ),
            )
          else if (backdrop == ScreensaverBackdrop.synthwave ||
              backdrop == ScreensaverBackdrop.calm ||
              backdrop == ScreensaverBackdrop.neonPulse ||
              backdrop == ScreensaverBackdrop.aurora)
            AnimatedGradientBackdrop(backdrop: backdrop)
          else
            const ColoredBox(color: Colors.black),

          // Dimming layer
          if (dim > 0)
            ColoredBox(color: Colors.black.withValues(alpha: dim / 100)),

          // Additional Component layer
          if (movement != ScreensaverMovement.off)
            _buildAdditionalComponent(
              component: component,
              movement: movement,
              dim: dim,
            ),
        ],
      ),
    );
  }

  Widget _buildAdditionalComponent({
    required ScreensaverComponent component,
    required ScreensaverMovement movement,
    required int dim,
  }) {
    final (double width, double height) = switch (component) {
      ScreensaverComponent.moonfinLogo => (320.0, 140.0),
      ScreensaverComponent.clock => (200.0, 56.0),
      ScreensaverComponent.runner => (120.0, 120.0),
    };

    Widget renderContent({required bool movingLeft}) {
      switch (component) {
        case ScreensaverComponent.moonfinLogo:
          return Image.asset(
            'assets/images/logo_and_text.png',
            fit: BoxFit.contain,
          );
        case ScreensaverComponent.clock:
          return _ScreensaverClock(
            opacity: 1 - (dim / 100) * 0.7,
            use24Hour: _prefs.get(UserPreferences.use24HourClock),
          );
        case ScreensaverComponent.runner:
          return Center(
            child: RunnerAnimation(
              size: 96,
              flipHorizontal: movingLeft,
              speed: LoadingAnimationSpeed.fast,
            ),
          );
      }
    }

    if (movement == ScreensaverMovement.bouncing) {
      return BouncingBox(
        childWidth: width,
        childHeight: height,
        builder: (context, movingLeft) => renderContent(movingLeft: movingLeft),
      );
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: SizedBox(
          width: width,
          height: height,
          child: renderContent(movingLeft: false),
        ),
      ),
    );
  }
}

class _SlideView extends StatefulWidget {
  const _SlideView({super.key, required this.item});

  final ScreensaverItem item;

  @override
  State<_SlideView> createState() => _SlideViewState();
}

class _SlideViewState extends State<_SlideView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _kenBurns;

  @override
  void initState() {
    super.initState();
    _kenBurns = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..forward();
  }

  @override
  void dispose() {
    _kenBurns.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 1.1).animate(_kenBurns),
          child: CachedNetworkImage(
            imageUrl: widget.item.backdropUrl,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 500),
            placeholder: (_, _) => const ColoredBox(color: Colors.black),
            errorWidget: (_, _, _) => const ColoredBox(color: Colors.black),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.2,
              colors: [Color(0x33000000), Color(0xB3000000)],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(56),
            child: widget.item.logoUrl != null
                ? CachedNetworkImage(
                    imageUrl: widget.item.logoUrl!,
                    width: 400,
                    height: 120,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomLeft,
                    placeholder: (_, _) => const SizedBox.shrink(),
                    errorWidget: (_, _, _) => _SlideTitle(widget.item.name),
                  )
                : _SlideTitle(widget.item.name),
          ),
        ),
      ],
    );
  }
}

class _SlideTitle extends StatelessWidget {
  const _SlideTitle(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _ScreensaverClock extends StatefulWidget {
  const _ScreensaverClock({
    required this.opacity,
    required this.use24Hour,
  });

  final double opacity;
  final bool use24Hour;

  @override
  State<_ScreensaverClock> createState() => _ScreensaverClockState();
}

class _ScreensaverClockState extends State<_ScreensaverClock> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        formatClockTime(DateTime.now(), use24Hour: widget.use24Hour),
        style: TextStyle(
          color: Colors.white.withValues(alpha: widget.opacity),
          fontSize: 32,
          fontWeight: FontWeight.w500,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}
