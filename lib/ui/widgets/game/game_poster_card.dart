import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/game_library.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../bounded_network_image.dart';
import 'game_card_focus_frame.dart';

/// A box-art card for one game, with a seeded color + controller-icon fallback
/// for the many games that have no art, and a title caption. Always focusable
/// (d-pad / gamepad navigation works on every platform, not just TV). Shared by
/// the library grid and the detail screen's related rail.
///
/// Built on the same self-contained focus pattern as [MediaCard]: the card owns
/// its own [MouseRegion] + [Focus] + scale animation and draws exactly one focus
/// border (via [GameCardFocusFrame]). It deliberately does not use
/// `FocusableWrapper`, so there is no second, wrapper-drawn border to collide
/// with the frame.
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
    this.stopRightTraversal = false,
    this.loadArtwork = true,
    this.onArtworkLoadFinished,
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
  final bool stopRightTraversal;
  final bool loadArtwork;
  final VoidCallback? onArtworkLoadFinished;
  final bool autoScroll;

  @override
  State<GamePosterCard> createState() => _GamePosterCardState();
}

class _GamePosterCardState extends State<GamePosterCard> {
  bool _hovered = false;
  bool _focused = false;

  bool get _active => _hovered || _focused;

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    // Screen-supplied handling (TV back-to-alpha, right-edge stop) wins first,
    // matching how FocusableWrapper honored its `onKeyEvent` override ahead of
    // its own defaults.
    final override = widget.onKeyEvent?.call(node, event);
    if (override != null && override != KeyEventResult.ignored) return override;

    // Fold the right-edge traversal stop into this single key path instead of a
    // separate `Shortcuts`/`DoNothingAndStopPropagationIntent` wrapper.
    if (widget.stopRightTraversal &&
        event.isActionable &&
        event.logicalKey.isRightKey) {
      return KeyEventResult.handled;
    }

    if (event is KeyDownEvent && event.logicalKey.isSelectKey) {
      widget.onTap();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _handleFocusChange(bool hasFocus) {
    setState(() => _focused = hasFocus);
    if (hasFocus) {
      widget.onFocus?.call();
      if (widget.autoScroll) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollIntoView());
      }
    } else if (!_hovered) {
      widget.onFocusLost?.call();
    }
  }

  void _scrollIntoView() {
    if (!mounted) return;
    Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final active = _active;
    final scale = widget.cardFocusExpansion && active
        ? (PlatformDetection.isAppleTV ? 1.12 : 1.05)
        : 1.0;

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
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onKeyEvent: _handleKeyEvent,
        onFocusChange: _handleFocusChange,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          child: RepaintBoundary(
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 150),
              curve: PlatformDetection.isAppleTV
                  ? Curves.easeOutCubic
                  : Curves.linear,
              child: _buildCard(context, active),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, bool active) {
    final url = widget.imageUrl;
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The single focus border + glow lives here and nowhere else.
        GameCardFocusFrame(
          active: active,
          focusColor: widget.focusColor,
          suppressFocusGlow: widget.suppressFocusGlow,
          child: SizedBox(
            width: widget.width,
            height: widget.width * 1.34,
            child: ClipRRect(
              borderRadius: borders.cardRadius,
              child: url == null || !widget.loadArtwork
                  ? _Fallback(seed: widget.seed, iconSize: widget.width * 0.3)
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        // Keep the seeded game fallback visible while artwork
                        // fetches and decodes for newly built rows.
                        _Fallback(
                          seed: widget.seed,
                          iconSize: widget.width * 0.3,
                        ),
                        BoundedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          maxWidth: 1024,
                          onLoadFinished: widget.onArtworkLoadFinished,
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
            gameDisplayTitle(widget.title, widget.fileName),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
        ),
      ],
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
