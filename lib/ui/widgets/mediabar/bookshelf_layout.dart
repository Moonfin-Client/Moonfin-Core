import '../offline_aware_image.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/bookshelf_detail.dart';
import '../../../data/models/media_bar_slide_item.dart';
import 'bookshelf_glow.dart';

class BookshelfLayout extends StatelessWidget {
  static const Cubic kExpandCurve = Cubic(0.16, 1, 0.3, 1);
  static const Duration kExpandDuration = Duration(milliseconds: 620);

  final List<MediaBarSlideItem> items;
  final int activeIndex;

  final ValueChanged<int> onSelect;
  final VoidCallback onInfo;
  final VoidCallback? onPlay;

  final VoidCallback? onHoverOff;
  final BookshelfDetail? Function(String itemId) detailFor;

  const BookshelfLayout({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
    required this.onInfo,
    this.onPlay,
    required this.detailFor,
    this.onHoverOff,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final totalCount = items.length;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final totalHeight = constraints.maxHeight;

        // Heights and dimensions relative to content height
        final contentHeight = totalHeight - (isMobile ? 108.0 : 0.0);
        final activeBookHeight = contentHeight * 0.84;
        final activeBookWidth = activeBookHeight * 0.72;
        final shelfSpineHeight = contentHeight * 0.76;
        final shelfSpineWidth = isMobile ? 48.0 : 36.0;

        // Dynamically calculate how many books fit on each side
        // Center compartment width = activeBookWidth + (isMobile ? 0 : 56)
        final centerWidth = activeBookWidth + (isMobile ? 0 : 56);
        final sideWidth = (constraints.maxWidth - centerWidth) / 2;
        // Each spine occupies shelfSpineWidth + 4 (margin)
        int maxSide = (sideWidth / (shelfSpineWidth + 4)).floor();
        if (maxSide < 1) {
          maxSide = 1;
        }

        // Left side items: from leftStart to activeIndex (exclusive)
        final leftStart = (activeIndex - maxSide).clamp(0, totalCount);
        final leftCount = activeIndex - leftStart;

        // Right side items: from activeIndex + 1 to rightEnd (exclusive)
        final rightEnd = (activeIndex + 1 + maxSide).clamp(0, totalCount);
        final rightCount = (rightEnd - (activeIndex + 1)).clamp(0, totalCount);

        final activeItem = items[activeIndex];
        final activeDetail = detailFor(activeItem.itemId);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity == null) return;
            if (details.primaryVelocity! < -200) {
              if (activeIndex < items.length - 1) {
                onSelect(activeIndex + 1);
              }
            } else if (details.primaryVelocity! > 200) {
              if (activeIndex > 0) {
                onSelect(activeIndex - 1);
              }
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 88.0 : 0.0,
              bottom: isMobile ? 20.0 : 0.0,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
            // Wooden bookshelf background backing
            if (isMobile)
              Container(color: const Color(0xFF1C100A))
            else
              Row(
                children: [
                  // Left shelf wood backing
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF130905), // deep shadow inside left corner
                            Color(0xFF23150D), // wood backing
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  // Center backing (wood backing, matches left/right areas)
                  SizedBox(
                    width: centerWidth,
                    child: Container(
                      color: const Color(0xFF1C100A),
                    ),
                  ),
                  // Right shelf wood backing
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                        colors: [
                          Color(0xFF23150D), // wood backing
                          Color(0xFF130905), // deep shadow inside right corner
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Bookshelf Layout Row containing books and partitions
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left Shelf compartment
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var i = 0; i < leftCount; i++) ...[
                          _buildSpineBook(
                            context: context,
                            item: items[leftStart + i],
                            globalIndex: leftStart + i,
                            height: shelfSpineHeight,
                            width: shelfSpineWidth,
                            isMobile: isMobile,
                          ),
                          const SizedBox(width: 4),
                        ],
                        const SizedBox(width: 8), // Gap before center partition
                      ],
                    ),
                  ),
                ),

                // Center Compartment with Dividers and Active Book
                Container(
                  width: centerWidth,
                  decoration: BoxDecoration(
                    border: isMobile
                        ? null
                        : const Border(
                            left: BorderSide(color: Color(0xFF382314), width: 8),
                            right: BorderSide(color: Color(0xFF382314), width: 8),
                          ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Active Book
                      Positioned(
                        bottom: 12,
                        width: activeBookWidth,
                        height: activeBookHeight,
                        child: _buildActiveBook(
                          context: context,
                          item: activeItem,
                          detail: activeDetail,
                          width: activeBookWidth,
                          height: activeBookHeight,
                          isMobile: isMobile,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Shelf compartment
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(width: 8), // Gap after center partition
                        for (var i = 0; i < rightCount; i++) ...[
                          _buildSpineBook(
                            context: context,
                            item: items[activeIndex + 1 + i],
                            globalIndex: activeIndex + 1 + i,
                            height: shelfSpineHeight,
                            width: shelfSpineWidth,
                            isMobile: isMobile,
                          ),
                          const SizedBox(width: 4),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Bottom horizontal wood shelf ledge running across the entire width
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 12,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF5A3D28), // warm ledge highlight
                      Color(0xFF26180E), // deep wood underside
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.white.withValues(alpha: 0.08),
                      width: 1.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.65),
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }

  Widget _buildActiveBook({
    required BuildContext context,
    required MediaBarSlideItem item,
    required BookshelfDetail? detail,
    required double width,
    required double height,
    required bool isMobile,
  }) {
    final baseColor = glowColorForGenres(item.genres);
    final imageApi = GetIt.instance<MediaServerClient>().imageApi;
    final posterUrl =
        item.posterUrl ?? imageApi.getPrimaryImageUrl(item.itemId, maxWidth: 600);

    // Adjusted centering alignment: center within the cover face area (crease to right edge)
    final creaseWidth = width * 0.12;

    const double s = 0.75; // 75% saturation (25% desaturated)
    const double rCoeff = 0.2126;
    const double gCoeff = 0.7152;
    const double bCoeff = 0.0722;
    
    final desatMatrix = <double>[
      rCoeff * (1 - s) + s, gCoeff * (1 - s),     bCoeff * (1 - s),     0, 0,
      rCoeff * (1 - s),     gCoeff * (1 - s) + s, bCoeff * (1 - s),     0, 0,
      rCoeff * (1 - s),     gCoeff * (1 - s),     bCoeff * (1 - s) + s, 0, 0,
      0,                    0,                    0,                    1, 0,
    ];

    final dpr = MediaQuery.devicePixelRatioOf(context);
    final cacheW = (width * 0.88 * dpr).round().clamp(150, 400);

    return OfflineAwareImage(
      imageUrl: posterUrl,
      memCacheWidth: cacheW,
      fadeInDuration: const Duration(milliseconds: 250),
      fadeOutDuration: Duration.zero,
      placeholder: (context, url) => const SizedBox.shrink(),
      errorWidget: (context, url, error) => _buildActualBookWidget(
        context: context,
        width: width,
        height: height,
        creaseWidth: creaseWidth,
        baseColor: baseColor,
        desatMatrix: desatMatrix,
        imageProvider: null,
      ),
      imageBuilder: (context, imageProvider) => _buildActualBookWidget(
        context: context,
        width: width,
        height: height,
        creaseWidth: creaseWidth,
        baseColor: baseColor,
        desatMatrix: desatMatrix,
        imageProvider: imageProvider,
      ),
    );
  }

  Widget _buildActualBookWidget({
    required BuildContext context,
    required double width,
    required double height,
    required double creaseWidth,
    required Color baseColor,
    required List<double> desatMatrix,
    required ImageProvider? imageProvider,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onInfo,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.75),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Poster Image covering the entire front cover face (right of the crease)
              Positioned(
                left: creaseWidth,
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.matrix(desatMatrix),
                        child: imageProvider != null
                            ? Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                color: Colors.grey[900],
                                child: const Icon(
                                  Icons.movie_rounded,
                                  color: Colors.white24,
                                  size: 32,
                                ),
                              ),
                      ),
                      // Subtle warm aged paper tint (BlendMode.multiply)
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFC4B293).withValues(alpha: 0.18),
                              backgroundBlendMode: BlendMode.multiply,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Cover highlight & Spine crease shading overlays on top of spine and cover poster
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.35), // spine outer edge
                      Colors.white.withValues(alpha: 0.1),  // spine curve highlight
                      Colors.black.withValues(alpha: 0.5),  // crease shadow
                      Colors.transparent,                   // cover starts
                      Colors.white.withValues(alpha: 0.06), // cover reflection
                      Colors.black.withValues(alpha: 0.25), // right edge curl shadow
                    ],
                    stops: const [0.0, 0.05, 0.08, 0.11, 0.14, 1.0],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpineBook({
    required BuildContext context,
    required MediaBarSlideItem item,
    required int globalIndex,
    required double height,
    required double width,
    required bool isMobile,
  }) {
    final baseColor = glowColorForGenres(item.genres);
    final goldColor = const Color(0xFFE5D5B8); // Gold parchment matching the cover Presents text

    final outlineShadows = [
      Shadow(
        color: Colors.black.withValues(alpha: 0.9),
        offset: const Offset(-0.8, -0.8),
        blurRadius: 1.2,
      ),
      Shadow(
        color: Colors.black.withValues(alpha: 0.9),
        offset: const Offset(0.8, -0.8),
        blurRadius: 1.2,
      ),
      Shadow(
        color: Colors.black.withValues(alpha: 0.9),
        offset: const Offset(0.8, 0.8),
        blurRadius: 1.2,
      ),
      Shadow(
        color: Colors.black.withValues(alpha: 0.9),
        offset: const Offset(-0.8, 0.8),
        blurRadius: 1.2,
      ),
    ];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onSelect(globalIndex),
      child: GestureDetector(
        onTap: () => onSelect(globalIndex),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: AppRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.55),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Cylindrical vertical lighting overlay for 3D spine effect
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppRadius.circular(6),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.35),
                      Colors.white.withValues(alpha: 0.12),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.45),
                    ],
                    stops: const [0.0, 0.25, 0.6, 1.0],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),

              // Title, Line, and Index Layout Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Number at the top of spine
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      (globalIndex + 1).toString().padLeft(2, '0'),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: goldColor.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w800,
                            fontSize: isMobile ? 11.0 : 10.0,
                            letterSpacing: 0.5,
                            shadows: outlineShadows,
                          ),
                    ),
                  ),

                  // Divider line below number
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    width: 1.0,
                    height: 16.0,
                    color: goldColor.withValues(alpha: 0.25),
                  ),

                  // Rotated Title running up the spine
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final horizontalPadding = isMobile ? 4.0 : 6.0;
                        final maxTitleWidth = constraints.maxHeight - (2 * horizontalPadding);
                        final titleStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: goldColor,
                              fontWeight: FontWeight.w700,
                              fontSize: isMobile ? 11.0 : 10.5,
                              letterSpacing: 1.2,
                              shadows: outlineShadows,
                            );
                        final textScaler = MediaQuery.textScalerOf(context);
                        final truncatedTitle = _truncateTitleToLastWord(
                          title: item.title.toUpperCase(),
                          style: titleStyle!,
                          maxWidth: maxTitleWidth,
                          isMobile: isMobile,
                          textScaler: textScaler,
                        );
                        return RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: 8,
                              ),
                              child: Text(
                                truncatedTitle,
                                maxLines: 1,
                                softWrap: false,
                                style: titleStyle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _truncateTitleToLastWord({
    required String title,
    required TextStyle style,
    required double maxWidth,
    required bool isMobile,
    required TextScaler textScaler,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: title, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      textScaler: textScaler,
    )..layout(maxWidth: double.infinity);

    if (textPainter.width <= maxWidth) {
      return title;
    }

    final words = title.split(RegExp(r'\s+'));
    if (words.isEmpty) return '...';

    for (int i = words.length - 1; i >= 1; i--) {
      final sublist = words.sublist(0, i);
      while (sublist.isNotEmpty) {
        final lastWord = sublist.last;
        final cleanedLastWord = lastWord.replaceAll(RegExp(r'[^a-zA-Z0-9]+$'), '');
        if (cleanedLastWord.isEmpty) {
          sublist.removeLast();
        } else {
          sublist[sublist.length - 1] = cleanedLastWord;
          break;
        }
      }

      if (sublist.isEmpty) continue;

      final candidate = '${sublist.join(' ')}...';
      final candidatePainter = TextPainter(
        text: TextSpan(text: candidate, style: style),
        textDirection: TextDirection.ltr,
        maxLines: 1,
        textScaler: textScaler,
      )..layout(maxWidth: double.infinity);

      if (candidatePainter.width <= maxWidth) {
        return candidate;
      }
    }

    final firstWordCleaned = words.first.replaceAll(RegExp(r'[^a-zA-Z0-9]+$'), '');
    if (firstWordCleaned.isNotEmpty) {
      return '$firstWordCleaned...';
    }
    return '...';
  }
}
