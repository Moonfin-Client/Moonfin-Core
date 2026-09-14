import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/bounded_network_image.dart';
import '../../../../widgets/marquee_text.dart';

/// Channel identity cell for the guide rail: logo pinned left, with the accent
/// number chip and the channel name right-justified against the cell's trailing
/// edge. The cell itself provides the contrast surface for the bare logo. Pure
/// presentation. The host owns focus + key handling and
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
  static const double _logoWidth = 48;
  static const double _logoGap = 6;
  static const Color _restingCellColor = Color(0xEF353940);

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
      // This is the cell surface, not a logo tile. The muted slate is bright
      // enough for black station marks while keeping white rail text legible.
      bg = _restingCellColor;
    }

    final nameStyle = textTheme.bodySmall?.copyWith(
      fontWeight: focused ? FontWeight.w600 : FontWeight.w500,
      color: AppColorScheme.onSurface,
    );

    final chip = number == null ? null : _numberChip(number!, accent);
    final hasTopRow = chip != null || isFavorite;

    final body = Row(
      children: [
        _logo(_logoWidth),
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
                        startAtEnd: false,
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.circular(radius),
        // Always reserve the border so focus doesn't change the cell height.
        border: Border.all(
          color: focused ? accent.withValues(alpha: 0.7) : Colors.transparent,
          width: 1,
        ),
      ),
      child: body,
    );
  }

  /// The image viewport fills the cell's available height. The cell surface
  /// behind it supplies the contrast, so logos don't get a second card.
  Widget _logo(double width) => SizedBox(
    width: width,
    height: double.infinity,
    child: (logoUrl != null && logoUrl!.isNotEmpty)
        ? BoundedNetworkImage(
            imageUrl: logoUrl!,
            fit: BoxFit.contain,
            fadeInDuration: Duration.zero,
            maxWidth: 256,
            errorBuilder: (context, url, error) => _fallback(),
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
