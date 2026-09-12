import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/marquee_text.dart';

/// Channel identity cell for the guide rail: logo pinned left, with the accent
/// number chip and the channel name right-justified against the cell's trailing
/// edge. The cell itself carries a dim plate so pale logo artwork has something
/// to sit against; the logo is drawn bare on top of it. Pure presentation; the host owns focus + key handling and
/// passes [focused]. Idiom-aware surface (glass-tinted on Apple, accent tint on
/// Material).
class EpgChannelCell extends StatelessWidget {
  final String? logoUrl;
  final String name;
  final String? number;
  final bool focused;
  final bool apple;

  /// Marks the channel as a favourite with a red heart beside the number.
  final bool isFavorite;

  /// The number is what a viewer navigates by, so it outsizes the call sign.
  static const double _numberSize = 13;
  static const double _logoSize = 30;
  static const double _logoGap = 6;
  static const double _restingPlateAlpha = 0.07;

  const EpgChannelCell({
    super.key,
    required this.logoUrl,
    required this.name,
    required this.number,
    required this.focused,
    required this.apple,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = AppColorScheme.accent;
    final radius = apple ? 14.0 : 10.0;
    final Color bg;
    if (focused) {
      bg = apple
          ? Colors.white.withValues(alpha: 0.16)
          : accent.withValues(alpha: 0.16);
    } else {
      // Dim enough to read as the column's own surface rather than as a
      // selection, but light enough to separate a white logo from the guide.
      bg = Colors.white.withValues(alpha: _restingPlateAlpha);
    }

    final nameStyle = textTheme.bodySmall?.copyWith(
      fontWeight: focused ? FontWeight.w600 : FontWeight.w500,
      color: AppColorScheme.onSurface,
    );

    final chip = number == null ? null : _numberChip(number!, accent);
    final hasTopRow = chip != null || isFavorite;

    final body = Row(
      children: [
        _logo(_logoSize),
        const SizedBox(width: _logoGap),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (hasTopRow) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isFavorite) ...[
                      const Icon(
                        Icons.favorite,
                        size: 11,
                        color: AppColors.red500,
                      ),
                      const SizedBox(width: 4),
                    ],
                    ?chip,
                  ],
                ),
                const SizedBox(height: 3),
              ],
              focused
                  ? SizedBox(
                      width: double.infinity,
                      child: MarqueeText(
                        text: name,
                        style: nameStyle ?? const TextStyle(),
                        showDotSeparator: false,
                        textAlign: TextAlign.right,
                        startAtEnd: true,
                      ),
                    )
                  : Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: nameStyle,
                    ),
            ],
          ),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.circular(radius),
        // Always reserve the border so focus does not change the cell height.
        border: Border.all(
          color: focused ? accent.withValues(alpha: 0.7) : Colors.transparent,
          width: 1,
        ),
      ),
      child: body,
    );
  }

  /// Bare artwork: the contrast the logo needs comes from the cell's plate, so
  /// a tile of its own would only box every logo in a lighter rectangle.
  Widget _logo(double size) => SizedBox(
    width: size,
    height: size,
    child: (logoUrl != null && logoUrl!.isNotEmpty)
        ? CachedNetworkImage(
            imageUrl: logoUrl!,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => _fallback(),
          )
        : _fallback(),
  );

  Widget _fallback() => Icon(
    Icons.tv,
    size: 16,
    color: AppColorScheme.onSurface.withValues(alpha: 0.5),
  );

  Widget _numberChip(String number, Color accent) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
      color: focused
          ? accent
          : AppColorScheme.onSurface.withValues(alpha: 0.12),
      borderRadius: AppRadius.circular(7),
    ),
    child: Text(
      number,
      style: TextStyle(
        fontSize: _numberSize,
        fontWeight: FontWeight.w700,
        color: focused
            ? const Color(0xFF062430)
            : AppColorScheme.onSurface.withValues(alpha: 0.85),
      ),
    ),
  );
}
