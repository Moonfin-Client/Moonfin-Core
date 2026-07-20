import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/game_library.dart';
import '../../../util/platform_detection.dart';
import '../bounded_network_image.dart';
import '../focus/focusable_wrapper.dart';
import 'game_card_focus_frame.dart';

/// A box-art card for one game, with a seeded color + controller-icon fallback for the many
/// games that have no art, and a title caption. Always focusable (d-pad / gamepad navigation
/// works on every platform, not just TV). Shared by the library rows and the detail screen's
/// related rail.
class GamePosterCard extends StatefulWidget {
  const GamePosterCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.fileName,
    required this.seed,
    required this.onTap,
    this.width = 108,
    this.autofocus = false,
    this.focusColor,
    this.cardFocusExpansion = true,
    this.suppressFocusGlow = false,
    this.onFocus,
    this.onFocusLost,
    this.onHoverStart,
    this.onHoverEnd,
    this.focusNode,
    this.onKeyEvent,
    this.autoScroll = true,
  });

  final String? imageUrl;
  final String title;
  final String fileName;
  final String seed;
  final VoidCallback onTap;
  final double width;
  final bool autofocus;
  final Color? focusColor;
  final bool cardFocusExpansion;
  final bool suppressFocusGlow;
  final VoidCallback? onFocus;
  final VoidCallback? onFocusLost;
  final VoidCallback? onHoverStart;
  final VoidCallback? onHoverEnd;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;
  final bool autoScroll;

  @override
  State<GamePosterCard> createState() => _GamePosterCardState();
}

class _GamePosterCardState extends State<GamePosterCard> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final url = widget.imageUrl;
    final label = gameDisplayTitle(widget.title, widget.fileName);
    final active = _hovered || _focused;
    final borders = ThemeRegistry.active.borders;
    final baseTextStyle =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
    final titleStyle = baseTextStyle.copyWith(
      color: isNeon ? AppColorScheme.accent : baseTextStyle.color,
      fontWeight: FontWeight.bold,
      fontSize: (baseTextStyle.fontSize ?? 12) + 1,
      shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
    );

    final card = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameCardFocusFrame(
          active: active,
          focusColor: widget.focusColor,
          suppressFocusGlow: widget.suppressFocusGlow,
          child: SizedBox(
            width: widget.width,
            height: widget.width * 1.34,
            child: ClipRRect(
              borderRadius: borders.cardRadius,
              child: url == null
                  ? _Fallback(seed: widget.seed, iconSize: widget.width * 0.3)
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        // Keep the normal game fallback visible while Chrome
                        // fetches and decodes artwork for newly built rows.
                        _Fallback(
                          seed: widget.seed,
                          iconSize: widget.width * 0.3,
                        ),
                        BoundedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          maxWidth: 1024,
                          // The fallback underneath remains visible on error.
                          errorBuilder: (_, _, _) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: widget.width,
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
        ),
      ],
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _hovered = true);
        widget.onHoverStart?.call();
      },
      onExit: (_) {
        setState(() => _hovered = false);
        if (!_focused) widget.onHoverEnd?.call();
      },
      child: AnimatedScale(
        scale: widget.cardFocusExpansion && active
            ? (PlatformDetection.isAppleTV ? 1.12 : 1.05)
            : 1,
        duration: const Duration(milliseconds: 150),
        curve: PlatformDetection.isAppleTV
            ? Curves.easeOutCubic
            : Curves.linear,
        child: FocusableWrapper(
          onSelect: widget.onTap,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          onKeyEvent: widget.onKeyEvent,
          onFocusChange: (focused) {
            setState(() => _focused = focused);
            if (focused) {
              widget.onFocus?.call();
            } else if (!_hovered) {
              widget.onFocusLost?.call();
            }
          },
          borderRadius: 10,
          autoScroll: widget.autoScroll,
          disableScale: true,
          useBackgroundFocus: false,
          suppressFocusGlow: true,
          child: card,
        ),
      ),
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.seed, required this.iconSize});

  final String seed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: gameFallbackColor(seed),
      child: Center(
        child: Icon(
          Icons.videogame_asset,
          size: iconSize,
          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
