import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';

/// Landscape hero band that previews the focused program and its channel. Pure
/// presentation; the host feeds it the focused values (typically via a
/// ValueListenableBuilder) so only this band rebuilds as focus moves. Idiom
/// aware: frosted glass on Apple, a tokenized translucent panel on Material.
class EpgHeroPreview extends StatelessWidget {
  final String? title;
  final String? timeLabel;
  final String? genreLabel;
  final String? synopsis;
  final String? channelLogoUrl;
  final String? channelName;
  final String? channelNumber;
  final bool isLive;
  final bool apple;

  const EpgHeroPreview({
    super.key,
    required this.title,
    required this.timeLabel,
    required this.genreLabel,
    required this.synopsis,
    required this.channelLogoUrl,
    required this.channelName,
    required this.channelNumber,
    required this.isLive,
    required this.apple,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.7);
    final meta = [
      if (isLive) 'Live',
      if (timeLabel != null) timeLabel,
      if (genreLabel != null && genreLabel!.isNotEmpty) genreLabel,
    ].whereType<String>().join('  ·  ');

    final inner = Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge,
                ),
                if (meta.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(meta,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(color: muted)),
                ],
                if (synopsis != null && synopsis!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(synopsis!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                          color: AppColorScheme.onSurface.withValues(alpha: 0.6))),
                ],
              ],
            ),
          ),
          if (channelName != null) ...[
            const SizedBox(width: 20),
            _channelBlock(textTheme, muted),
          ],
        ],
      ),
    );

    return apple
        ? adaptiveGlass(
            cornerRadius: 18,
            blur: 18,
            fallbackColor: AppColorScheme.surface.withValues(alpha: 0.4),
            tint: Colors.white.withValues(alpha: 0.06),
            child: inner,
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorScheme.surface.withValues(alpha: 0.45),
              borderRadius: AppRadius.circular(16),
            ),
            child: inner,
          );
  }

  Widget _channelBlock(TextTheme textTheme, Color muted) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 46,
            height: 46,
            child: ClipRRect(
              borderRadius: AppRadius.circular(apple ? 12 : 8),
              child: (channelLogoUrl != null && channelLogoUrl!.isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl: channelLogoUrl!,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Icon(Icons.tv,
                          color: AppColorScheme.onSurface.withValues(alpha: 0.4)),
                    )
                  : Icon(Icons.tv,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.4)),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(channelName!, style: textTheme.titleSmall),
              if (channelNumber != null) ...[
                const SizedBox(height: 2),
                Text(channelNumber!,
                    style: textTheme.labelMedium?.copyWith(color: muted)),
              ],
            ],
          ),
        ],
      );
}
