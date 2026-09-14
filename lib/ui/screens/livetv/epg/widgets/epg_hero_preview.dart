import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../widgets/adaptive/adaptive_glass.dart';
import '../../../../widgets/bounded_network_image.dart';
import '../../../../widgets/marquee_text.dart';

/// Landscape hero band that previews the focused program. Pure presentation.
/// The host feeds it the focused values (typically via a ValueListenableBuilder)
/// so only this band rebuilds as focus moves. Idiom aware: frosted glass on
/// Apple, a tokenized translucent panel on Material.
class EpgHeroPreview extends StatelessWidget {
  static const double compactHeight = 144;
  static const Color _logoPlate = Color(0xEF353940);

  final String? title;

  /// Optional channel/program split used when the guide focus is on the
  /// channel rail rather than a program cell.
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
    final channelTitleStyle =
        (textTheme.bodyLarge ??
                const TextStyle(fontSize: AppTypography.fontSizeMd))
            .copyWith(fontWeight: FontWeight.w600);
    final programTitleStyle =
        (textTheme.headlineSmall ??
                const TextStyle(fontSize: AppTypography.fontSize2xl))
            .copyWith(fontWeight: FontWeight.w600);
    final metaStyle =
        (textTheme.bodyMedium ??
                const TextStyle(fontSize: AppTypography.fontSizeSm))
            .copyWith(color: muted);
    final synopsisStyle =
        (textTheme.bodyMedium ??
                const TextStyle(fontSize: AppTypography.fontSizeSm))
            .copyWith(
              color: AppColorScheme.onSurface.withValues(alpha: 0.72),
              fontSize: compact ? AppTypography.fontSizeMd : null,
              height: 1.2,
            );
    final meta = [
      if (isLive) 'Live',
      if (timeLabel != null) timeLabel,
      if (genreLabel != null && genreLabel!.isNotEmpty) genreLabel,
    ].whereType<String>().join('  ·  ');

    final hasChannelPreview = channelLogoUrl != null || programTitle != null;
    final channelLine = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: channelTitleStyle,
          ),
        ),
        if (meta.isNotEmpty) ...[
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              meta,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: metaStyle,
            ),
          ),
        ],
      ],
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasChannelPreview) ...[
          channelLine,
          if (programTitle != null && programTitle!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: compact ? 2 : 4),
              child: Text(
                programTitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: programTitleStyle,
              ),
            ),
        ] else
          Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
        if (!hasChannelPreview && meta.isNotEmpty) ...[
          SizedBox(height: compact ? 4 : 6),
          Text(
            meta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: metaStyle,
          ),
        ],
        if (synopsis != null && synopsis!.isNotEmpty) ...[
          SizedBox(height: compact ? 4 : 8),
          MarqueeText(
            text: synopsis!,
            maxLines: 3,
            style: synopsisStyle,
            millisPerPixel: 40,
            pauseDurationMs: 1600,
            showDotSeparator: false,
          ),
        ],
      ],
    );

    final inner = Padding(
      padding: EdgeInsets.fromLTRB(12, compact ? 4 : 8, 12, compact ? 4 : 8),
      child: channelLogoUrl != null
          ? Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: _logoPlate,
                    borderRadius: AppRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: SizedBox(
                      width: 100,
                      height: 108,
                      child: BoundedNetworkImage(
                        imageUrl: channelLogoUrl!,
                        fit: BoxFit.contain,
                        fadeInDuration: Duration.zero,
                        maxWidth: 256,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: text),
              ],
            )
          : text,
    );

    final content = compact
        ? SizedBox(height: compactHeight, child: inner)
        : inner;

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
