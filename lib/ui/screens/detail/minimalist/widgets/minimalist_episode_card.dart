import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../widgets/media_badge.dart';
import '../../../../widgets/offline_aware_image.dart';

/// One episode in the Minimalist rail: the still, its number, and the title.
///
/// The number sits on the artwork rather than in front of the title, so a
/// child who can't read the title still has something to count along.
class MinimalistEpisodeCard extends StatefulWidget {
  // The rail reserves the room the title needs before the card is built, so
  // both sides read these rather than each writing the numbers out.
  static const double titleGap = 8;
  static const double titleLineHeight = 1.25;
  static const int titleMaxLines = 2;

  /// The face steps down on a card too narrow to carry the larger one.
  static double titleFontSize(double width) => width >= 240 ? 18 : 15;

  final AggregatedItem episode;
  final String? imageUrl;
  final double width;
  final bool isFocused;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const MinimalistEpisodeCard({
    super.key,
    required this.episode,
    required this.imageUrl,
    required this.width,
    this.isFocused = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<MinimalistEpisodeCard> createState() => _MinimalistEpisodeCardState();
}

class _MinimalistEpisodeCardState extends State<MinimalistEpisodeCard> {
  bool _hovered = false;

  bool get _highlighted => widget.isFocused || _hovered;

  @override
  Widget build(BuildContext context) {
    final thumbHeight = widget.width * 9 / 16;
    final number = widget.episode.indexNumber;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // The border is painted over the artwork rather than around it.
              // Drawn around, it would make the focused card wider than its
              // neighbours and knock the rail's scrolling out of step.
              SizedBox(
                width: widget.width,
                height: thumbHeight,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: AppRadius.circular(14),
                    border: Border.all(
                      color: _highlighted
                          ? AppColorScheme.onSurface
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(14),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        _buildImage(),
                        if (number != null)
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: _NumberBadge(number: number),
                          ),
                        if (widget.episode.isPlayed)
                          const Positioned(
                            right: 8,
                            top: 8,
                            child: MediaWatchedBadge(size: 22),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: MinimalistEpisodeCard.titleGap),
              Text(
                widget.episode.name,
                maxLines: MinimalistEpisodeCard.titleMaxLines,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: MinimalistEpisodeCard.titleFontSize(widget.width),
                  height: MinimalistEpisodeCard.titleLineHeight,
                  // The rail sits straight on the artwork, with no scrim under
                  // it, so the title carries its own separation.
                  shadows: const [
                    Shadow(blurRadius: 8, color: Color(0xEB000000)),
                    Shadow(blurRadius: 3, color: Color(0xD9000000)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    final url = widget.imageUrl;
    if (url == null || url.isEmpty) return _placeholder();
    return OfflineAwareImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (_, _) => _placeholder(),
      errorWidget: (_, _, _) => _placeholder(),
    );
  }

  /// A flat tile rather than a stretched poster. A special with no still of
  /// its own should read as artwork that's missing, not as the wrong shape.
  Widget _placeholder() => ColoredBox(
    color: AppColorScheme.surfaceVariant,
    child: Center(
      child: Icon(
        Icons.movie_outlined,
        size: 28,
        color: AppColorScheme.onSurface.withValues(alpha: 0.35),
      ),
    ),
  );
}

class _NumberBadge extends StatelessWidget {
  final int number;

  const _NumberBadge({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 1),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.78),
        borderRadius: AppRadius.circular(14),
      ),
      child: Text(
        '$number',
        style: TextStyle(
          color: AppColorScheme.onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),
    );
  }
}
