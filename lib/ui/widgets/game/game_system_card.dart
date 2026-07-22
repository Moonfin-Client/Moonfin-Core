import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/game_library.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../bounded_network_image.dart';
import 'game_card_focus_frame.dart';

/// A focusable, artwork-backed platform tile used at the root of a retro-game
/// library.
class GameSystemCard extends StatefulWidget {
  const GameSystemCard({
    super.key,
    required this.libraryId,
    required this.system,
    required this.games,
    required this.gameCount,
    required this.onTap,
    this.autofocus = false,
    this.focusColor,
    this.cardFocusExpansion = true,
    this.suppressFocusGlow = false,
    this.focusNode,
    this.onKeyEvent,
  });

  final String libraryId;
  final GameSystem system;
  final List<GameSummary> games;
  final int? gameCount;
  final VoidCallback onTap;
  final bool autofocus;
  final Color? focusColor;
  final bool cardFocusExpansion;
  final bool suppressFocusGlow;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;

  @override
  State<GameSystemCard> createState() => _GameSystemCardState();
}

class _GameSystemCardState extends State<GameSystemCard> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final seedColor = gameFallbackColor(widget.system.id);
    final countLabel = widget.gameCount == null
        ? null
        : AppLocalizations.of(context).itemCountLabel(widget.gameCount!);
    final active = _hovered || _focused;
    final borders = ThemeRegistry.active.borders;

    final card = GameCardFocusFrame(
      active: active,
      focusColor: widget.focusColor,
      suppressFocusGlow: widget.suppressFocusGlow,
      child: ClipRRect(
        borderRadius: borders.cardRadius,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: seedColor,
            border: Border.all(
              color: AppColorScheme.onSurface.withValues(alpha: 0.08),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _SystemArtworkStrip(
                libraryId: widget.libraryId,
                games: widget.games,
                fallbackColor: seedColor,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                    colors: [
                      Colors.black.withValues(alpha: 0.86),
                      Colors.black.withValues(alpha: 0.58),
                      Colors.black.withValues(alpha: 0.18),
                    ],
                    stops: const [0, 0.52, 1],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.34),
                        borderRadius: AppRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.sports_esports,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.system.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 5),
                              ],
                            ),
                          ),
                          if (countLabel != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              countLabel,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.76),
                                fontSize: 13,
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 4),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Directionality.of(context) == TextDirection.rtl
                          ? Icons.chevron_left
                          : Icons.chevron_right,
                      color: Colors.white.withValues(alpha: 0.72),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final semanticLabel = countLabel == null
        ? widget.system.name
        : '${widget.system.name}, $countLabel';

    return Semantics(
      button: true,
      label: semanticLabel,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Focus(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          onKeyEvent: _handleKeyEvent,
          onFocusChange: (focused) {
            setState(() => _focused = focused);
            if (focused) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => _scrollIntoView(),
              );
            }
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: RepaintBoundary(
              child: AnimatedScale(
                scale: widget.cardFocusExpansion && active
                    ? (PlatformDetection.isAppleTV ? 1.12 : 1.05)
                    : 1,
                duration: const Duration(milliseconds: 150),
                curve: PlatformDetection.isAppleTV
                    ? Curves.easeOutCubic
                    : Curves.linear,
                child: card,
              ),
            ),
          ),
        ),
      ),
    );
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final override = widget.onKeyEvent?.call(node, event);
    if (override != null && override != KeyEventResult.ignored) return override;
    if (event is KeyDownEvent && event.logicalKey.isSelectKey) {
      widget.onTap();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  // Mirrors FocusableWrapper's comfortable-zone auto-scroll: only recenter the
  // tile when it drifts outside the middle 60% of the viewport.
  void _scrollIntoView() {
    if (!mounted) return;
    final renderObject = context.findRenderObject();
    final scrollable = Scrollable.maybeOf(context);
    if (renderObject == null || scrollable == null) return;
    final viewport = scrollable.context.findRenderObject();
    if (viewport is RenderBox && renderObject is RenderBox) {
      final viewportSize = viewport.size.height;
      final itemTop = renderObject
          .localToGlobal(Offset.zero, ancestor: viewport)
          .dy;
      final itemBottom = itemTop + renderObject.size.height;
      if (itemTop >= viewportSize * 0.2 && itemBottom <= viewportSize * 0.8) {
        return;
      }
    }
    Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
}

class _SystemArtworkStrip extends StatelessWidget {
  const _SystemArtworkStrip({
    required this.libraryId,
    required this.games,
    required this.fallbackColor,
  });

  final String libraryId;
  final List<GameSummary> games;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return ColoredBox(
        color: Color.lerp(fallbackColor, AppColorScheme.background, 0.28)!,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final game in games)
          Expanded(
            child: _SystemGameArtwork(
              imageUrl: gameThumbUrl(libraryId, game.id),
              fallbackColor: gameFallbackColor(game.id),
            ),
          ),
      ],
    );
  }
}

class _SystemGameArtwork extends StatelessWidget {
  const _SystemGameArtwork({
    required this.imageUrl,
    required this.fallbackColor,
  });

  final String? imageUrl;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null) return _fallback();

    return BoundedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      maxWidth: 320,
      errorBuilder: (_, _, _) => _fallback(),
    );
  }

  Widget _fallback() {
    return ColoredBox(
      color: fallbackColor,
      child: const Center(
        child: Icon(Icons.videogame_asset, color: Colors.white54, size: 26),
      ),
    );
  }
}
