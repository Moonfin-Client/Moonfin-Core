import 'dart:async';

import 'package:flutter/material.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../playback/loading_animation_widget.dart';

/// Shows Moonfin's configured animation if details are still loading after 600 ms.
///
/// Item type and metadata determine the final layout, so showing placeholder
/// controls before that data arrives creates a distracting intermediate page.
class DetailLoading extends StatefulWidget {
  const DetailLoading({super.key, this.prefs});

  final UserPreferences? prefs;

  @override
  State<DetailLoading> createState() => _DetailLoadingState();
}

class _DetailLoadingState extends State<DetailLoading> {
  late final Timer _delay;
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    _delay = Timer(const Duration(milliseconds: 600), () {
      setState(() => _showAnimation = true);
    });
  }

  @override
  void dispose() {
    _delay.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_showAnimation) return const SizedBox.expand();

    final prefs = widget.prefs;
    final image =
        prefs?.get(UserPreferences.loadingAnimationImage) ??
        LoadingAnimationImage.moonfinLogo;
    if (image == LoadingAnimationImage.none) return const SizedBox.expand();

    final size =
        prefs?.get(UserPreferences.loadingAnimationSize) ??
        LoadingAnimationSize.medium;
    final position =
        prefs?.get(UserPreferences.loadingAnimationPosition) ??
        LoadingAnimationPosition.middle;
    final speed =
        prefs?.get(UserPreferences.loadingAnimationSpeed) ??
        LoadingAnimationSpeed.fast;

    Widget animation({bool? movingLeft}) => RepaintBoundary(
      child: LoadingAnimationWidget(
        image: image,
        size: size.pixelSize,
        position: position,
        speed: speed,
        flipHorizontal: movingLeft,
      ),
    );

    return IgnorePointer(
      child: position == LoadingAnimationPosition.bouncing
          ? BouncingPositionWrapper(
              speed: speed,
              safePadding: const EdgeInsets.all(40),
              builder: (context, movingLeft) =>
                  animation(movingLeft: movingLeft),
            )
          : Align(
              alignment: position.alignment,
              child: Padding(padding: position.safePadding, child: animation()),
            ),
    );
  }
}
