import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/seerr/seerr_api_models.dart';
import '../../data/services/youtube_stream_resolver.dart';
import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import '../../util/playback_time_label.dart';
import 'adaptive/sf_symbol.dart';
import 'bounded_network_image.dart';
import 'focus/focusable_wrapper.dart';
import 'overlay_sheet.dart';

/// One trailer the picker offers, either a file on the server or a link.
class TrailerChoice {
  const TrailerChoice._({
    required this.title,
    required this.subtitled,
    this.local,
    this.url,
    this.videoId,
    this.imageUrl,
    this.length,
  });

  /// TMDB marks a trailer with burned in subtitles by ending its name with
  /// this, which reads better as a chip than as part of the title.
  static final _subtitledSuffix = RegExp(
    r'\s*\[subtitled\]\s*$',
    caseSensitive: false,
  );

  factory TrailerChoice._named(
    String? name, {
    AggregatedItem? local,
    String? url,
    String? imageUrl,
    Duration? length,
  }) {
    final full = (name ?? '').trim();
    final title = full.replaceFirst(_subtitledSuffix, '');
    return TrailerChoice._(
      title: title,
      subtitled: title.length != full.length,
      local: local,
      url: url,
      videoId: url == null ? null : YouTubeStreamResolver.extractVideoId(url),
      imageUrl: imageUrl,
      length: length,
    );
  }

  factory TrailerChoice.remote(String url, String? name) =>
      TrailerChoice._named(name, url: url);

  /// The name to show, empty when the server gave none.
  final String title;
  final bool subtitled;

  /// The trailer item when the file lives on the server.
  final AggregatedItem? local;
  final String? url;
  final String? videoId;
  final String? imageUrl;
  final Duration? length;

  String? get thumbnailUrl =>
      imageUrl ??
      switch (videoId) {
        final id? => 'https://i.ytimg.com/vi/$id/mqdefault.jpg',
        null => null,
      };
}

/// The trailers to offer for an item: the server's own files first, in the
/// order given, then its links in the server's order with repeats dropped.
List<TrailerChoice> trailerChoicesFor({
  required List<AggregatedItem> locals,
  required List<Map<String, dynamic>> remoteTrailers,
  String? Function(AggregatedItem local)? localImageUrl,
}) {
  final seen = <String>{};
  return [
    for (final local in locals)
      TrailerChoice._named(
        local.name,
        local: local,
        imageUrl: localImageUrl?.call(local),
        length: local.runtime,
      ),
    for (final remote in remoteTrailers)
      if (remote['Url'] case final String url
          when url.isNotEmpty &&
              seen.add(YouTubeStreamResolver.extractVideoId(url) ?? url))
        TrailerChoice.remote(
          url,
          remote['Name'] is String ? remote['Name'] as String : null,
        ),
  ];
}

/// The YouTube trailers and teasers Seerr lists, trailers first.
List<TrailerChoice> seerrTrailerChoices(List<SeerrVideo> videos) {
  final seen = <String>{};
  final youtube = [
    for (final v in videos)
      if ((v.site ?? '').toLowerCase() == 'youtube' &&
          (v.key ?? '').isNotEmpty &&
          seen.add(v.key!))
        v,
  ];
  return [
    for (final type in const ['trailer', 'teaser'])
      for (final v in youtube)
        if ((v.type ?? '').toLowerCase() == type)
          TrailerChoice.remote(
            'https://www.youtube.com/watch?v=${v.key}',
            v.name,
          ),
  ];
}

/// Lets the viewer pick one of an item's trailers, from a panel at the side
/// on TV and desktop, or a bottom sheet on a phone.
abstract final class TrailerPicker {
  static Future<TrailerChoice?> show(
    BuildContext context, {
    required String itemName,
    required List<TrailerChoice> choices,
  }) {
    final compact =
        PlatformDetection.useMobileUi || MediaQuery.sizeOf(context).width < 600;
    if (compact) {
      return showFocusRestoringModalBottomSheet<TrailerChoice>(
        context: context,
        useRootNavigator: true,
        showDragHandle: true,
        backgroundColor: AppColorScheme.surface,
        builder: (sheetContext) => _TrailerPickerPanel(
          itemName: itemName,
          choices: choices,
          compact: true,
          onPick: (choice) => Navigator.pop(sheetContext, choice),
          onClose: () => Navigator.pop(sheetContext),
        ),
      );
    }
    return OverlaySheetController.show<TrailerChoice>(
      context,
      alignment: AlignmentDirectional.centerEnd,
      barrierColor: AppColorScheme.scrim.withValues(alpha: 0.3),
      builder: (sheetContext) {
        final width = (MediaQuery.sizeOf(sheetContext).width * 0.34).clamp(
          360.0,
          520.0,
        );
        return Container(
          width: width,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColorScheme.surface.withValues(alpha: 0.97),
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: _TrailerPickerPanel(
            itemName: itemName,
            choices: choices,
            compact: false,
            onPick: (choice) => OverlaySheetController.closeAdaptive(
              sheetContext,
              result: choice,
            ),
            onClose: () => OverlaySheetController.closeAdaptive(sheetContext),
          ),
        );
      },
    );
  }
}

class _TrailerPickerPanel extends StatelessWidget {
  const _TrailerPickerPanel({
    required this.itemName,
    required this.choices,
    required this.compact,
    required this.onPick,
    required this.onClose,
  });

  final String itemName;
  final List<TrailerChoice> choices;
  final bool compact;
  final ValueChanged<TrailerChoice> onPick;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.66);

    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, compact ? 0 : 20, 12, 12),
            child: Row(
              children: [
                AdaptiveIcon(
                  Icons.movie_outlined,
                  size: 22,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.trailers,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColorScheme.onSurface,
                        ),
                      ),
                      if (itemName.isNotEmpty)
                        Text(
                          itemName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(color: muted),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  l10n.trailerCount(choices.length),
                  style: textTheme.bodySmall?.copyWith(color: muted),
                ),
                if (!PlatformDetection.isTV)
                  IconButton(
                    tooltip: l10n.close,
                    icon: const AdaptiveIcon(Icons.close),
                    onPressed: onClose,
                  )
                else
                  const SizedBox(width: 12),
              ],
            ),
          ),
          Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16, 14, 16, compact ? 24 : 14),
              itemCount: choices.length,
              separatorBuilder: (_, _) => const SizedBox(height: 6),
              itemBuilder: (_, i) => _TrailerRow(
                choice: choices[i],
                number: i + 1,
                compact: compact,
                autofocus: !compact && i == 0,
                onPick: () => onPick(choices[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrailerRow extends StatefulWidget {
  const _TrailerRow({
    required this.choice,
    required this.number,
    required this.compact,
    required this.autofocus,
    required this.onPick,
  });

  final TrailerChoice choice;
  final int number;
  final bool compact;
  final bool autofocus;
  final VoidCallback onPick;

  @override
  State<_TrailerRow> createState() => _TrailerRowState();
}

class _TrailerRowState extends State<_TrailerRow> {
  late final Future<YouTubeVideoDetails?>? _details =
      switch (widget.choice.videoId) {
        final id? => YouTubeStreamResolver.details(id),
        null => null,
      };
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<YouTubeVideoDetails?>(
      future: _details,
      builder: (context, snapshot) => _buildRow(context, snapshot.data),
    );
  }

  Widget _buildRow(BuildContext context, YouTubeVideoDetails? details) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final choice = widget.choice;
    final title = choice.title.isNotEmpty
        ? choice.title
        : details?.title ?? l10n.trailerNumber(widget.number);
    final length = choice.length ?? details?.length;
    final channel = details?.channel;
    final thumbWidth = widget.compact ? 128.0 : 136.0;
    final highlighted = _focused && !widget.compact;

    return FocusableWrapper(
      autofocus: widget.autofocus,
      onSelect: widget.onPick,
      onFocusChange: (focused) => setState(() => _focused = focused),
      borderRadius: 12,
      disableScale: true,
      autoScroll: true,
      semanticLabel: title,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: highlighted
              ? theme.colorScheme.primary.withValues(alpha: 0.18)
              : Colors.transparent,
          borderRadius: AppRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppRadius.circular(8),
              child: SizedBox(
                width: thumbWidth,
                height: thumbWidth * 9 / 16,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _thumbnail(choice.thumbnailUrl),
                    if (widget.compact || highlighted)
                      Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withValues(alpha: 0.55),
                            border: highlighted
                                ? Border.all(color: Colors.white, width: 1.5)
                                : null,
                          ),
                          child: const AdaptiveIcon(
                            Icons.play_arrow_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (length != null)
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.8),
                            borderRadius: AppRadius.circular(4),
                          ),
                          child: Text(
                            formatPlaybackDuration(length),
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColorScheme.onSurface,
                    ),
                  ),
                  if (channel != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      channel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                  if (choice.subtitled) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: AppRadius.circular(999),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AdaptiveIcon(
                            Icons.closed_caption_outlined,
                            size: 13,
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.85,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            l10n.subtitled,
                            style: textTheme.labelSmall?.copyWith(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.85,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _thumbnail(String? url) {
    final placeholder = ColoredBox(
      color: Colors.white.withValues(alpha: 0.06),
      child: Center(
        child: AdaptiveIcon(
          Icons.movie_outlined,
          color: AppColorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
    );
    if (url == null) return placeholder;
    return BoundedNetworkImage(
      imageUrl: url,
      errorBuilder: (_, _, _) => placeholder,
    );
  }
}
