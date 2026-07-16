import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../util/game_library.dart';
import '../focus/focusable_wrapper.dart';

/// A box-art card for one game, with a seeded color + controller-icon fallback for the many
/// games that have no art, and a title caption. Always focusable (d-pad / gamepad navigation
/// works on every platform, not just TV). Shared by the library rows and the detail screen's
/// related rail.
class GamePosterCard extends StatelessWidget {
  const GamePosterCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.fileName,
    required this.seed,
    required this.onTap,
    this.width = 108,
    this.autofocus = false,
  });

  final String? imageUrl;
  final String title;
  final String fileName;
  final String seed;
  final VoidCallback onTap;
  final double width;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    final label = gameDisplayTitle(title, fileName);

    final card = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: width,
            height: width * 1.34,
            child: url == null
                ? _Fallback(seed: seed, iconSize: width * 0.3)
                : CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    errorWidget: (_, _, _) =>
                        _Fallback(seed: seed, iconSize: width * 0.3),
                  ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: width,
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ),
      ],
    );

    return FocusableWrapper(
      onSelect: onTap,
      autofocus: autofocus,
      borderRadius: 10,
      autoScroll: true,
      child: card,
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.seed, required this.iconSize});

  final String seed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: gameFallbackColor(seed),
      child: Center(
        child: Icon(Icons.videogame_asset, size: iconSize, color: Colors.white70),
      ),
    );
  }
}
