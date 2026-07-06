import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';
import '../../../../widgets/focus/focusable_wrapper.dart';

/// Premium mobile guide card: channel logo + number chip + name on the left,
/// the current program with a live progress bar and remaining time, and the
/// next program beneath. Idiom-aware: a frosted-glass squircle on Apple, a flat
/// tokenized surface on Material. Purely presentational.
class EpgNowNextCard extends StatelessWidget {
  final String? logoUrl;
  final String channelName;
  final String? channelNumber;
  final String? nowTitle;
  final double nowProgress; // 0..1
  final String? remainingLabel;
  final String? nextLabel;
  final bool isLive;
  final bool apple;
  final VoidCallback onTap;
  final FocusNode? focusNode;

  const EpgNowNextCard({
    super.key,
    required this.logoUrl,
    required this.channelName,
    required this.channelNumber,
    required this.nowTitle,
    required this.nowProgress,
    required this.remainingLabel,
    required this.nextLabel,
    required this.isLive,
    required this.apple,
    required this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);
    final radius = apple ? 18.0 : 14.0;

    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _logo(radius: apple ? 12 : 10),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      channelName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium,
                    ),
                  ),
                  if (channelNumber != null) ...[
                    const SizedBox(width: 8),
                    _numberChip(channelNumber!),
                  ],
                ],
              ),
              const SizedBox(height: 6),
              if (nowTitle != null)
                Row(
                  children: [
                    if (isLive) ...[
                      _liveBadge(),
                      const SizedBox(width: 6),
                    ],
                    Flexible(
                      child: Text(
                        nowTitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: AppRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: nowProgress.clamp(0.0, 1.0),
                        minHeight: 4,
                        backgroundColor:
                            AppColorScheme.onSurface.withValues(alpha: 0.18),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColorScheme.accent),
                      ),
                    ),
                  ),
                  if (remainingLabel != null) ...[
                    const SizedBox(width: 12),
                    Text(
                      remainingLabel!,
                      style: textTheme.labelSmall?.copyWith(color: muted),
                    ),
                  ],
                ],
              ),
              if (nextLabel != null) ...[
                const SizedBox(height: 8),
                Text(
                  nextLabel!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelMedium?.copyWith(color: muted),
                ),
              ],
            ],
          ),
        ),
      ],
    );

    final padded = Padding(padding: const EdgeInsets.all(14), child: content);

    return FocusableWrapper(
      focusNode: focusNode,
      onSelect: onTap,
      borderRadius: radius,
      child: apple
          ? adaptiveGlass(
              context: context,
              cornerRadius: radius,
              blur: 18,
              fallbackColor: AppColorScheme.surface.withValues(alpha: 0.42),
              tint: AppColorScheme.surface.withValues(alpha: 0.2),
              child: padded,
            )
          : DecoratedBox(
              decoration: BoxDecoration(
                color: AppColorScheme.surface.withValues(alpha: 0.55),
                borderRadius: AppRadius.circular(radius),
              ),
              child: padded,
            ),
    );
  }

  Widget _logo({required double radius}) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: AppRadius.circular(radius),
            child: (logoUrl != null && logoUrl!.isNotEmpty)
                ? CachedNetworkImage(
                    imageUrl: logoUrl!,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) => _logoFallback(),
                  )
                : _logoFallback(),
          ),
          if (isLive)
            Center(
              child: Icon(
                Icons.play_circle_outline,
                size: 26,
                color: AppColorScheme.onSurface.withValues(alpha: 0.92),
              ),
            ),
        ],
      ),
    );
  }

  Widget _logoFallback() => ColoredBox(
        color: AppColorScheme.surface.withValues(alpha: 0.6),
        child: Icon(Icons.tv, color: AppColorScheme.onSurface.withValues(alpha: 0.4)),
      );

  Widget _numberChip(String number) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: AppColorScheme.accent,
          borderRadius: AppRadius.circular(8),
        ),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF062430),
          ),
        ),
      );

  Widget _liveBadge() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
          color: const Color(0xFFE0685C),
          borderRadius: AppRadius.circular(4),
        ),
        child: const Text(
          'LIVE',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A0E0A),
          ),
        ),
      );
}
