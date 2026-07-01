import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/focus/focusable_wrapper.dart';

/// Glassy season card with a subtle background image, title, episode count and a
/// chevron. Purely presentational and theme-tokenized; the host resolves the
/// image URL and strings.
class SeasonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final bool isFallbackImage;
  final bool landscape;
  final bool isNextUp;
  final VoidCallback onTap;
  final FocusNode? focusNode;

  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateRight;

  /// Optional explicit size; when null the card falls back to fixed
  /// landscape/portrait defaults.
  final double? width;
  final double? height;

  /// Scroll the card into view when it gains focus (used in the grid layout so
  /// d-pad can reach rows below the fold).
  final bool autoScroll;

  const SeasonCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.isFallbackImage,
    required this.landscape,
    required this.onTap,
    this.isNextUp = false,
    this.focusNode,
    this.onNavigateUp,
    this.onNavigateRight,
    this.width,
    this.height,
    this.autoScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final radius = JellyfinTokens.shapes.mediumRadius;
    final cardWidth = width ?? (landscape ? 130.0 : 90.0);
    final cardHeight = height ?? (landscape ? 195.0 : 135.0);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    return FocusableWrapper(
      focusNode: focusNode,
      onSelect: onTap,
      borderRadius: radius.topLeft.x,
      autoScroll: autoScroll,
      scrollAlignment: 0.5,
      onNavigateUp: onNavigateUp,
      onNavigateRight: onNavigateRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: radius,
            color: AppColorScheme.surface.withValues(alpha: 0.35),
            border: isNextUp
                ? Border.fromBorderSide(
                    ThemeRegistry.active.borders.focusBorder.copyWith(
                      color: isNeon
                          ? const Color(0xFF00FFFF)
                          : Colors.cyan.withValues(alpha: 0.7),
                      width: 1.5,
                    ),
                  )
                : Border.all(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.12),
                  ),
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (imageUrl != null && imageUrl!.isNotEmpty)
                  CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const SizedBox.shrink(),
                  ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.2),
                          Colors.black.withValues(alpha: 0.85),
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isFallbackImage) ...[
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 2),
                      ],
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
