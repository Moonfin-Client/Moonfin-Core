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

  /// Above this the rail is the one a television lays out, and the cell steps
  /// up to a face that carries at ten feet. Below it the rail belongs to a
  /// window being read at arm's length, where the larger face would only crowd
  /// the call sign out.
  static const double _tenFootRailWidth = 180;

  /// The number is what a viewer navigates by, so it outsizes the call sign.
  static double _numberSize(double width) =>
      width >= _tenFootRailWidth ? 20 : 13;

  static double _nameSize(double width) => width >= _tenFootRailWidth ? 18 : 12;

  /// Icons set in a line of text take this share of that line's face, so they
  /// keep their weight beside it at any interface size.
  static const double _inlineIconShare = 0.8;

  /// The share of the cell the logo takes, and the bounds it keeps whatever
  /// the rail is given. A share rather than a fixed width because the rail is
  /// itself a share of the canvas, and a logo sized for the roomy one leaves
  /// the call sign nowhere to go on a narrow one.
  static const double _logoWidthFactor = 0.36;
  static const double _logoMinWidth = 40;
  static const double _logoMaxWidth = 66;
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
    final scaler = MediaQuery.textScalerOf(context);
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

    // Sized from the rail rather than left on the body token, which is meant
    // for reading at arm's length and lands under the ten foot floor once a
    // television scales the canvas down onto the panel.
    TextStyle? nameStyleFor(double width) => textTheme.bodySmall?.copyWith(
      fontSize: _nameSize(width),
      fontWeight: focused ? FontWeight.w600 : FontWeight.w500,
      color: AppColorScheme.onSurface,
    );

    Widget bodyFor(double width) {
      final nameStyle = nameStyleFor(width);
      final chip = number == null
          ? null
          : _numberChip(number!, accent, _numberSize(width));
      final hasTopRow = chip != null || isFavorite;
      return Row(
        children: [
          _logo((width * _logoWidthFactor).clamp(_logoMinWidth, _logoMaxWidth)),
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
                        Icon(
                          Icons.favorite,
                          size:
                              scaler.scale(_numberSize(width)) *
                              _inlineIconShare,
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
    }

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
      child: LayoutBuilder(
        builder: (context, constraints) => bodyFor(constraints.maxWidth),
      ),
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

  Widget _numberChip(String number, Color accent, double size) => Container(
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
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: focused
            ? const Color(0xFF062430)
            : AppColorScheme.onSurface.withValues(alpha: 0.85),
      ),
    ),
  );
}
