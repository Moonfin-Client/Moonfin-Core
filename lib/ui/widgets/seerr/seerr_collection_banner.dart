import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import 'package:go_router/go_router.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../l10n/app_localizations.dart';
import '../../mixins/focus_state_mixin.dart';
import '../../navigation/destinations.dart';
import 'seerr_image_urls.dart';

/// The "part of a collection" strip under a movie's actions, which leads into
/// the collection it belongs to.
class SeerrCollectionBanner extends StatefulWidget {
  final SeerrCollectionRef collection;
  final FocusNode? focusNode;

  /// Called when up would leave the banner, which is the last thing in the
  /// block, so there is nothing below it to reach.
  final VoidCallback? onNavigateUp;

  const SeerrCollectionBanner({
    super.key,
    required this.collection,
    this.focusNode,
    this.onNavigateUp,
  });

  @override
  State<SeerrCollectionBanner> createState() => _SeerrCollectionBannerState();
}

class _SeerrCollectionBannerState extends State<SeerrCollectionBanner>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final collection = widget.collection;
    final backdrop = collection.backdropPath;
    void open() => context.push(
          Destinations.seerrCollection(collection.id.toString()),
        );
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.gameButtonA) {
          open();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
            widget.onNavigateUp != null) {
          widget.onNavigateUp!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: GestureDetector(
          onTap: open,
          child: AnimatedScale(
            scale: showFocusBorder ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 560),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: AppRadius.circular(10),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: showFocusBorder ? focusColor : Colors.white12,
                    width: showFocusBorder ? 2 : 1,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  if (backdrop != null)
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: '$seerrBackdropBase$backdrop',
                        fit: BoxFit.cover,
                      ),
                    ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withValues(alpha: 0.85),
                            Colors.black.withValues(alpha: 0.55),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.collections_bookmark_outlined,
                          color: Colors.white70,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.partOfCollectionName(collection.name ?? ''),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          l10n.viewCollection,
                          style: TextStyle(
                            color: AppColorScheme.accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white54,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
