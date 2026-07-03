import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Channel identity cell for the guide rail: logo tile + accent number chip +
/// name. Pure presentation; the host owns focus + key handling and passes
/// [focused]. Idiom-aware surface (glass-tinted on Apple, accent tint on
/// Material).
class EpgChannelCell extends StatelessWidget {
  final String? logoUrl;
  final String name;
  final String? number;
  final bool focused;
  final bool apple;

  const EpgChannelCell({
    super.key,
    required this.logoUrl,
    required this.name,
    required this.number,
    required this.focused,
    required this.apple,
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
      bg = apple ? Colors.white.withValues(alpha: 0.06) : Colors.transparent;
    }

    final nameStyle = textTheme.titleSmall?.copyWith(
      fontWeight: focused ? FontWeight.w600 : FontWeight.w500,
      color: AppColorScheme.onSurface,
    );

    final chip = number == null ? null : _numberChip(number!, accent);

    final body = Row(
      children: [
        _logo(30, radius),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (chip != null) ...[chip, const SizedBox(height: 3)],
              Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: nameStyle),
            ],
          ),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.circular(radius),
        border: focused
            ? Border.all(color: accent.withValues(alpha: 0.7), width: 1)
            : null,
      ),
      child: body,
    );
  }

  Widget _logo(double size, double radius) => SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: AppRadius.circular(radius * 0.6),
          child: (logoUrl != null && logoUrl!.isNotEmpty)
              ? CachedNetworkImage(
                  imageUrl: logoUrl!,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => _fallback(),
                )
              : _fallback(),
        ),
      );

  Widget _fallback() => Icon(Icons.tv,
      size: 16, color: AppColorScheme.onSurface.withValues(alpha: 0.4));

  Widget _numberChip(String number, Color accent) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
        decoration: BoxDecoration(
          color: focused ? accent : AppColorScheme.onSurface.withValues(alpha: 0.12),
          borderRadius: AppRadius.circular(7),
        ),
        child: Text(
          number,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: focused
                ? const Color(0xFF062430)
                : AppColorScheme.onSurface.withValues(alpha: 0.85),
          ),
        ),
      );
}
