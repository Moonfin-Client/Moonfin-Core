import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../preference/preference_constants.dart';

BoxFit zoomModeToBoxFit(ZoomMode mode) => switch (mode) {
  ZoomMode.fit => BoxFit.contain,
  ZoomMode.autoCrop => BoxFit.cover,
  ZoomMode.stretch => BoxFit.fill,
};

class Trickplay extends StatelessWidget {
  final Widget? Function(int slotIndex) content;

  final int leftCount;
  final int rightCount;

  final String? timeLabel;

  final double tileWidth;
  final double tileHeight;
  final double slotSpacing;

  final bool fillFrame;

  const Trickplay({
    super.key,
    required this.content,
    this.leftCount = 0,
    this.rightCount = 0,
    this.timeLabel,
    this.tileWidth = 0,
    this.tileHeight = 0,
    this.slotSpacing = AppSpacing.spaceXs,
    this.fillFrame = false,
  });

  @override
  Widget build(BuildContext context) {
    if (fillFrame) {
      return _TrickplayTileChrome(
        content: content(0),
        width: null,
        height: null,
        active: true,
        fillFrame: true,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var slotIndex = -leftCount; slotIndex <= rightCount; slotIndex++) ...[
          if (slotIndex > -leftCount) SizedBox(width: slotSpacing),
          _TrickplayTileChrome(
            key: ValueKey(slotIndex),
            content: content(slotIndex),
            width: tileWidth,
            height: tileHeight,
            active: slotIndex == 0,
            label: slotIndex == 0 ? timeLabel : null,
          ),
        ],
      ],
    );
  }
}

class _TrickplayTileChrome extends StatelessWidget {
  final Widget? content;
  final double? width;
  final double? height;
  final bool active;
  final bool fillFrame;

  final String? label;

  const _TrickplayTileChrome({
    super.key,
    required this.content,
    required this.width,
    required this.height,
    required this.active,
    this.fillFrame = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final borderTokens = ThemeRegistry.active.borders;
    final decorated = Container(
      width: width,
      height: height,
      decoration: fillFrame
          ? const BoxDecoration(color: Colors.black)
          : BoxDecoration(
              color: Colors.black,
              borderRadius: AppRadius.circular(8),
              border: active
                  ? Border.all(color: AppColorScheme.accent, width: 2)
                  : Border.fromBorderSide(borderTokens.cardBorder),
              boxShadow: active && borderTokens.focusGlow.isNotEmpty
                  ? borderTokens.focusGlow
                  : null,
            ),
      child: content == null
          ? null
          : (fillFrame
                ? ClipRect(child: content)
                : ClipRRect(
                    borderRadius: AppRadius.circular(7),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        content!,
                        if (label != null)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.75),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.spaceXs,
                                ),
                                child: Text(
                                  label!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: AppTypography.fontSizeXs,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
    );
    if (fillFrame) return decorated;
    return Opacity(opacity: content == null ? 0 : 1, child: decorated);
  }
}
