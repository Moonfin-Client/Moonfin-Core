import 'dart:ui';

import '../offline_aware_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../util/focus/dpad_keys.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/platform_detection.dart';
import '../focus/glass_focus_halo.dart';
import 'book_glass.dart';

/// Featured spotlight for the book library, pinned to the top Continue item.
///
/// Layout forks by form factor: TV gets an edge-to-edge cinematic backdrop,
/// mobile a compact glass card under the large title, desktop a wide hero
/// with pointer hover. Materials and the CTA focus halo resolve through the
/// glass tiers and idiom (Cupertino glyphs on Apple looks), so every theme
/// falls back to solid colors cleanly. The CTA is a D-pad focus stop.
class BookHero extends StatefulWidget {
  final String eyebrow;
  final String title;
  final String subtitle;
  final String ctaLabel;

  /// Progress meta, e.g. "6h 12m left" or "34% read".
  final String? metaLabel;
  final String? imageUrl;
  final double? progress;
  final double topInset;
  final VoidCallback onPrimary;
  final FocusNode? ctaFocusNode;
  final bool Function(bool isUp)? onVerticalNavigation;

  const BookHero({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
    required this.onPrimary,
    this.metaLabel,
    this.imageUrl,
    this.progress,
    this.topInset = 0,
    this.ctaFocusNode,
    this.onVerticalNavigation,
  });

  @override
  State<BookHero> createState() => _BookHeroState();
}

class _BookHeroState extends State<BookHero> {
  bool _ctaFocused = false;

  KeyEventResult _onCtaKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isSelectKey) {
      widget.onPrimary();
      return KeyEventResult.handled;
    }
    if (key.isUpKey || key.isDownKey) {
      final handled = widget.onVerticalNavigation?.call(key.isUpKey) ?? false;
      return handled ? KeyEventResult.handled : KeyEventResult.ignored;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformDetection.isTV) return _tv(context);
    if (PlatformDetection.useMobileUi) return _mobile(context);
    return _wide(context);
  }


  Widget _backdrop() {
    final background = AppColorScheme.background;
    if (widget.imageUrl == null) return ColoredBox(color: background);
    final image = OfflineAwareImage(
      imageUrl: widget.imageUrl!,
      fit: BoxFit.cover,
      errorWidget: (_, _, _) => ColoredBox(color: background),
    );
    final sigma = GlassSettings.capSigma(36);
    if (sigma <= 0) {
      // No blur budget on this tier; darken instead so text stays readable.
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          background.withValues(alpha: 0.55),
          BlendMode.srcOver,
        ),
        child: image,
      );
    }
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: image,
    );
  }

  Widget _scrim() {
    final background = AppColorScheme.background;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            background.withValues(alpha: 0.25),
            background.withValues(alpha: 0.6),
            background,
          ],
          stops: const [0.0, 0.55, 1.0],
        ),
      ),
    );
  }

  Widget _eyebrowText() => Text(
    widget.eyebrow.toUpperCase(),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 10,
      letterSpacing: 1.4,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.accent,
    ),
  );

  Widget _progressBar({double width = 180}) {
    final progress = widget.progress;
    if (progress == null && widget.metaLabel == null) {
      return const SizedBox.shrink();
    }
    final onSurface = AppColorScheme.onSurface;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (progress != null)
          SizedBox(
            width: width,
            child: ClipRRect(
              borderRadius: AppRadius.circular(2),
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                minHeight: 3,
                backgroundColor: onSurface.withValues(alpha: 0.18),
                valueColor: AlwaysStoppedAnimation(AppColorScheme.accent),
              ),
            ),
          ),
        if (progress != null && widget.metaLabel != null)
          const SizedBox(width: 10),
        if (widget.metaLabel != null)
          Text(
            widget.metaLabel!,
            style: TextStyle(
              fontSize: 11.5,
              color: onSurface.withValues(alpha: 0.7),
            ),
          ),
      ],
    );
  }

  Widget _cta({bool circular = false}) {
    final apple = AppUiIdiomResolver.isApple || AppUiIdiomResolver.appleTvStyle;
    final glass = bookGlassEligible;
    final onColor = glass ? AppColorScheme.onSurface : AppColorScheme.onAccent;
    final playIcon = apple ? CupertinoIcons.play_fill : Icons.play_arrow;

    final Widget content = circular
        ? Padding(
            padding: const EdgeInsets.all(9),
            child: Icon(playIcon, size: 18, color: onColor),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(playIcon, size: 16, color: onColor),
                const SizedBox(width: 6),
                Text(
                  widget.ctaLabel,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: onColor,
                  ),
                ),
              ],
            ),
          );

    final pill = glass
        ? bookGlassOrSolid(
            cornerRadius: 22,
            blur: 18,
            tint: AppColorScheme.accent.withValues(alpha: 0.30),
            fallbackColor: AppColorScheme.accent,
            context: context,
            child: content,
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorScheme.accent,
              borderRadius: AppRadius.circular(22),
            ),
            child: content,
          );

    return Focus(
      focusNode: widget.ctaFocusNode,
      onKeyEvent: _onCtaKey,
      onFocusChange: (has) => setState(() => _ctaFocused = has),
      child: GestureDetector(
        onTap: widget.onPrimary,
        behavior: HitTestBehavior.opaque,
        child: GlassFocusHalo(
          focused: _ctaFocused,
          scale: 1.06,
          borderRadius: BorderRadius.circular(24),
          child: pill,
        ),
      ),
    );
  }

  Widget _cover(double width, double height) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(9),
        boxShadow: const [
          BoxShadow(
            color: Color(0x80000000),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.circular(9),
        child: SizedBox(
          width: width,
          height: height,
          child: widget.imageUrl != null
              ? OfflineAwareImage(
                  imageUrl: widget.imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) => _coverPlaceholder(width),
                )
              : _coverPlaceholder(width),
        ),
      ),
    );
  }

  Widget _coverPlaceholder(double width) => ColoredBox(
    color: AppColorScheme.surfaceVariant,
    child: Icon(
      Icons.menu_book,
      color: AppColorScheme.onSurface.withValues(alpha: 0.4),
      size: width * 0.3,
    ),
  );


  Widget _tv(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return SizedBox(
      height: 300 + widget.topInset,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _backdrop(),
          _scrim(),
          Positioned(
            left: 48,
            right: 48,
            bottom: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _eyebrowText(),
                      const SizedBox(height: 6),
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          height: 1.08,
                          color: onSurface,
                        ),
                      ),
                      if (widget.subtitle.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          _cta(),
                          const SizedBox(width: 16),
                          _progressBar(width: 220),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                _cover(120, 180),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _mobile(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, widget.topInset + 8, 16, 4),
      child: bookGlassOrSolid(
        cornerRadius: 18,
        blur: 16,
        fallbackColor: AppColorScheme.surface,
        context: context,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _cover(54, 80),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _eyebrowText(),
                    const SizedBox(height: 2),
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: onSurface,
                      ),
                    ),
                    if (widget.subtitle.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        widget.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    _progressBar(width: 120),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              _cta(circular: true),
            ],
          ),
        ),
      ),
    );
  }


  Widget _wide(BuildContext context) {
    final onSurface = AppColorScheme.onSurface;
    return SizedBox(
      height: 230 + widget.topInset,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _backdrop(),
          _scrim(),
          Positioned(
            left: 24,
            right: 24,
            bottom: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _cover(96, 144),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _eyebrowText(),
                      const SizedBox(height: 4),
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.08,
                          color: onSurface,
                        ),
                      ),
                      if (widget.subtitle.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          widget.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                      const SizedBox(height: 11),
                      Row(
                        children: [
                          _cta(),
                          const SizedBox(width: 14),
                          _progressBar(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
