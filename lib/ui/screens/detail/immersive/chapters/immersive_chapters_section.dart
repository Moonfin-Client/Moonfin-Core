import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../shared/immersive_media_rail_card.dart';
import '../shared/immersive_spacing.dart';

Duration _chapterPosition(Map<String, dynamic> chapter) {
  final ticks = chapter['StartPositionTicks'];

  if (ticks is! num) {
    return Duration.zero;
  }

  return Duration(microseconds: ticks.toInt() ~/ 10);
}

class ImmersiveChaptersSection extends StatefulWidget {
  final AggregatedItem item;
  final ImageApi imageApi;
  final ValueChanged<Duration> onPlayFromChapter;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;

  const ImmersiveChaptersSection({
    super.key,
    required this.item,
    required this.imageApi,
    required this.onPlayFromChapter,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<ImmersiveChaptersSection> createState() =>
      ImmersiveChaptersSectionState();
}

class ImmersiveChaptersSectionState extends State<ImmersiveChaptersSection> {
  static int _hubSession = 0;

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<Map<String, dynamic>>> _rowKey =
      GlobalKey<LockedFocusRowState<Map<String, dynamic>>>();

  late final String _hubKey =
      'immersive-chapters-${widget.item.id}-${_hubSession++}';

  bool get canFocusTop =>
      mounted &&
      widget.item.chapters.isNotEmpty &&
      _rowKey.currentState != null;

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  bool focusTop() {
    if (!canFocusTop) {
      return false;
    }

    _rowKey.currentState!.requestFocusFromMemory();

    return true;
  }

  bool focusBottom() => focusTop();

  bool get _navbarIsLeft =>
      GetIt.instance<UserPreferences>().get(UserPreferences.navbarPosition) ==
      NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  _ChaptersLayout _layoutFor(BuildContext context, double availableWidth) {
    final compact = _isCompactMobile(context);

    if (compact) {
      final metrics = ImmersiveSpacing.compactChapters;

      final cardWidth = metrics.itemWidth(availableWidth);

      final artworkHeight = ImmersiveMediaRailMetrics.artworkHeight(cardWidth);

      return _ChaptersLayout(
        cardWidth: cardWidth,
        cardGap: metrics.gap,
        artworkHeight: artworkHeight,
        railHeight: ImmersiveMediaRailMetrics.cardHeight(cardWidth),
        compact: true,
      );
    }

    final cardWidth = ImmersiveMediaRailMetrics.cardWidth(availableWidth);

    final artworkHeight = ImmersiveMediaRailMetrics.artworkHeight(cardWidth);

    return _ChaptersLayout(
      cardWidth: cardWidth,
      cardGap: ImmersiveMediaRailMetrics.itemGap,
      artworkHeight: artworkHeight,
      railHeight: ImmersiveMediaRailMetrics.cardHeight(cardWidth),
      compact: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final chapters = widget.item.chapters;

    if (chapters.isEmpty) {
      return const SizedBox.shrink();
    }

    final useSeriesThumbs = GetIt.instance<UserPreferences>().get(
      UserPreferences.detailUseSeriesThumbnails,
    );

    final l10n = AppLocalizations.of(context);

    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final layout = _layoutFor(context, availableWidth);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.chapters,
              style: layout.compact
                  ? textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    )
                  : textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),

            SizedBox(
              height: layout.compact
                  ? ImmersiveSpacing.mobileTitleToContent
                  : ImmersiveSpacing.titleToContent,
            ),

            SizedBox(
              width: double.infinity,
              height: layout.railHeight,
              child: LockedFocusRow<Map<String, dynamic>>(
                key: _rowKey,
                items: chapters,
                hubKey: _hubKey,
                controller: _scrollController,
                height: layout.railHeight,
                itemExtent: layout.itemExtent,
                clipBehavior: Clip.none,
                onTap: (_, chapter) {
                  widget.onPlayFromChapter(_chapterPosition(chapter));
                },
                onVerticalNavigation: (isUp) {
                  return (isUp ? widget.onNavigateUp : widget.onNavigateDown)
                          ?.call() ??
                      false;
                },
                onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
                itemBuilder: (context, chapter, index, isFocused) {
                  final position = _chapterPosition(chapter);

                  final rawName = (chapter['Name'] as String?)?.trim();

                  final name = rawName?.isNotEmpty == true
                      ? rawName!
                      : l10n.chapterNumber(index + 1);

                  final imageUrl = _chapterImageUrl(
                    context,
                    chapter,
                    index,
                    layout.cardWidth,
                    useSeriesThumbs,
                  );

                  final displayName = _cleanChapterDisplay(name, position);

                  return SizedBox(
                    width: layout.itemExtent,
                    height: layout.railHeight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index < chapters.length - 1 ? layout.cardGap : 0,
                      ),
                      child: ImmersiveMediaRailCard(
                        imageUrl: imageUrl,
                        title: displayName,
                        placeholderLabel: name,
                        width: layout.cardWidth,
                        artworkHeight: layout.artworkHeight,
                        isFocused: isFocused,
                        onTap: () {
                          widget.onPlayFromChapter(position);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  String? _chapterImageUrl(
    BuildContext context,
    Map<String, dynamic> chapter,
    int index,
    double cardWidth,
    bool useSeriesThumbs,
  ) {
    final maxWidth = (cardWidth * MediaQuery.devicePixelRatioOf(context))
        .ceil();

    if (useSeriesThumbs) {
      final seriesThumbnail = _resolveSeriesLandscapeThumbnailUrl(
        widget.item,
        widget.imageApi,
        maxWidth: maxWidth,
      );

      if (seriesThumbnail != null && seriesThumbnail.isNotEmpty) {
        return seriesThumbnail;
      }
    }

    final imageTag = chapter['ImageTag'] as String?;

    if (imageTag == null || imageTag.isEmpty) {
      return null;
    }

    final chapterImage = widget.imageApi.getChapterImageUrl(
      widget.item.id,
      index: index,
      maxWidth: maxWidth,
      tag: imageTag,
    );

    return chapterImage.isEmpty ? null : chapterImage;
  }

  String _cleanChapterDisplay(String rawName, Duration position) {
    final duration = _formatDuration(position);

    final parts = rawName.split(RegExp(r'\s*-\s*'));

    final uniqueParts = <String>[];

    for (final part in parts) {
      final normalized = _normalizeTimeString(part);

      if (normalized.isNotEmpty && !uniqueParts.contains(normalized)) {
        uniqueParts.add(normalized);
      }
    }

    if (uniqueParts.isNotEmpty &&
        uniqueParts.last == _normalizeTimeString(duration)) {
      uniqueParts.removeLast();
    }

    return uniqueParts.isEmpty
        ? duration
        : '${uniqueParts.join(' - ')} - $duration';
  }

  String _normalizeTimeString(String value) {
    final parts = value.trim().split(':');

    if (parts.length == 2 && int.tryParse(parts[0]) != null) {
      return '${int.parse(parts[0])}:${parts[1]}';
    }

    if (parts.length == 3 &&
        int.tryParse(parts[0]) != null &&
        int.tryParse(parts[1]) != null) {
      final hours = int.parse(parts[0]);

      final minutes = int.parse(parts[1]);

      return hours == 0
          ? '$minutes:${parts[2]}'
          : '$hours:${minutes.toString().padLeft(2, '0')}:${parts[2]}';
    }

    return value.trim();
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;

    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }

    return '${duration.inMinutes}:$seconds';
  }
}

class _ChaptersLayout {
  final double cardWidth;
  final double cardGap;
  final double artworkHeight;
  final double railHeight;
  final bool compact;

  const _ChaptersLayout({
    required this.cardWidth,
    required this.cardGap,
    required this.artworkHeight,
    required this.railHeight,
    required this.compact,
  });

  double get itemExtent => cardWidth + cardGap;
}

String? _resolveSeriesLandscapeThumbnailUrl(
  AggregatedItem item,
  ImageApi imageApi, {
  required int maxWidth,
}) {
  final thumbId = item.parentThumbItemId ?? item.seriesId;

  final thumbTag = item.parentThumbImageTag ?? item.seriesThumbImageTag;

  if (thumbId != null &&
      thumbId.isNotEmpty &&
      thumbTag != null &&
      thumbTag.isNotEmpty) {
    return imageApi.getThumbImageUrl(
      thumbId,
      maxWidth: maxWidth,
      tag: thumbTag,
    );
  }

  final seriesId = item.seriesId ?? item.parentPrimaryImageItemId;

  final seriesPrimaryTag =
      item.seriesPrimaryImageTag ?? item.parentPrimaryImageTag;

  if (seriesId != null &&
      seriesId.isNotEmpty &&
      seriesPrimaryTag != null &&
      seriesPrimaryTag.isNotEmpty) {
    return imageApi.getPrimaryImageUrl(
      seriesId,
      maxWidth: maxWidth,
      tag: seriesPrimaryTag,
    );
  }

  return null;
}
