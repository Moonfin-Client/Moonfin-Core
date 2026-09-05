import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import 'loading_animation_widget.dart';

class PlayerLoadingOverlay extends StatefulWidget {
  const PlayerLoadingOverlay({
    super.key,
    this.label,
    this.logoSize = 180,
    this.labelSpacing,
    this.customImage,
    this.customSize,
    this.customPosition,
    this.position,
    this.customShowText,
    this.customSpeed,
    this.flipHorizontal,
  });

  final String? label;
  final double logoSize;
  final double? labelSpacing;
  final LoadingAnimationImage? customImage;
  final double? customSize;
  final LoadingAnimationPosition? customPosition;
  final LoadingAnimationPosition? position;
  final bool? customShowText;
  final LoadingAnimationSpeed? customSpeed;
  final bool? flipHorizontal;

  @override
  State<PlayerLoadingOverlay> createState() => _PlayerLoadingOverlayState();
}

class _PlayerLoadingOverlayState extends State<PlayerLoadingOverlay>
    with SingleTickerProviderStateMixin {
  static const _labelGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFAA5CC3), Color(0xFF00A4DC)],
  );

  late final AnimationController _labelController;
  late final Animation<double> _labelOpacity;
  late final Animation<double> _labelScale;

  @override
  void initState() {
    super.initState();
    _labelController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    final pulseCurve = CurvedAnimation(
      parent: _labelController,
      curve: Curves.easeInOut,
    );
    _labelOpacity = Tween<double>(begin: 0.4, end: 1.0).animate(pulseCurve);
    _labelScale = Tween<double>(begin: 0.98, end: 1.0).animate(pulseCurve);
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>()
        : null;

    final image = widget.customImage ??
        prefs?.get(UserPreferences.loadingAnimationImage) ??
        LoadingAnimationImage.moonfinLogo;

    final sizePref = prefs?.get(UserPreferences.loadingAnimationSize) ??
        LoadingAnimationSize.medium;

    final effectiveSize = widget.customSize ??
        (widget.logoSize != 180 ? widget.logoSize : sizePref.pixelSize);

    final effectivePosition = widget.customPosition ??
        widget.position ??
        prefs?.get(UserPreferences.loadingAnimationPosition) ??
        LoadingAnimationPosition.middle;

    final showText = widget.customShowText ??
        prefs?.get(UserPreferences.showLoadingAnimationText) ??
        true;

    final effectiveSpeed = widget.customSpeed ??
        prefs?.get(UserPreferences.loadingAnimationSpeed) ??
        LoadingAnimationSpeed.fast;

    final label = widget.label?.trim();
    final hasLabel = showText && label != null && label.isNotEmpty;
    final uppercaseLabel = hasLabel ? label.toUpperCase() : null;

    if (image == LoadingAnimationImage.none && !hasLabel) {
      return const SizedBox.shrink();
    }

    final spacing = widget.labelSpacing ?? sizePref.labelSpacing;
    final fontSize = sizePref.labelFontSize;
    final letterSpacing = sizePref.labelLetterSpacing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (image != LoadingAnimationImage.none)
          LoadingAnimationWidget(
            image: image,
            size: effectiveSize,
            position: effectivePosition,
            flipHorizontal: widget.flipHorizontal,
            speed: effectiveSpeed,
          ),
        if (hasLabel) ...[
          if (image != LoadingAnimationImage.none) SizedBox(height: spacing),
          FadeTransition(
            opacity: _labelOpacity,
            child: ScaleTransition(
              scale: _labelScale,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return _labelGradient.createShader(bounds);
                },
                child: Text(
                  uppercaseLabel!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    letterSpacing: letterSpacing,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
