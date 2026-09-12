import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';

/// Landscape hero band that previews the focused program. Pure presentation;
/// the host feeds it the focused values (typically via a ValueListenableBuilder)
/// so only this band rebuilds as focus moves. Idiom aware: frosted glass on
/// Apple, a tokenized translucent panel on Material.
class EpgHeroPreview extends StatelessWidget {
  final String? title;

  /// Optional channel/program split used when the guide focus is on the
  /// channel rail rather than a programme cell.
  final String? programTitle;
  final String? channelLogoUrl;
  final String? timeLabel;
  final String? genreLabel;
  final String? synopsis;
  final bool isLive;
  final bool apple;
  final bool compact;

  const EpgHeroPreview({
    super.key,
    required this.title,
    this.programTitle,
    this.channelLogoUrl,
    required this.timeLabel,
    required this.genreLabel,
    required this.synopsis,
    required this.isLive,
    required this.apple,
    this.compact = false,
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

    final hasChannelPreview = channelLogoUrl != null || programTitle != null;
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasChannelPreview) ...[
          Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          if (programTitle != null && programTitle!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: compact ? 2 : 4),
              child: Text(
                programTitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headlineSmall,
              ),
            ),
        ] else
          Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
        if (meta.isNotEmpty) ...[
          SizedBox(height: compact ? 4 : 6),
          Text(
            meta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(color: muted),
          ),
        ],
        if (synopsis != null && synopsis!.isNotEmpty) ...[
          SizedBox(height: compact ? 4 : 8),
          Text(
            synopsis!,
            maxLines: compact ? 1 : 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ],
    );

    final inner = Padding(
      padding: EdgeInsets.fromLTRB(20, compact ? 8 : 16, 20, compact ? 8 : 16),
      child: channelLogoUrl != null
          ? Row(
              children: [
                SizedBox(
                  width: compact ? 92 : 112,
                  height: compact ? 94 : 120,
                  child: CachedNetworkImage(
                    imageUrl: channelLogoUrl!,
                    fit: BoxFit.contain,
                    errorWidget: (_, _, _) => const Icon(Icons.tv),
                    placeholder: (_, _) => const Icon(Icons.tv),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(child: text),
              ],
            )
          : text,
    );

    final content = compact ? SizedBox(height: 110, child: inner) : inner;

    return apple
        ? adaptiveGlass(
            context: context,
            cornerRadius: 18,
            blur: 18,
            fallbackColor: AppColorScheme.surface.withValues(alpha: 0.4),
            tint: Colors.white.withValues(alpha: 0.06),
            child: content,
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorScheme.surface.withValues(alpha: 0.45),
              borderRadius: AppRadius.circular(16),
            ),
            child: content,
          );
  }
}
