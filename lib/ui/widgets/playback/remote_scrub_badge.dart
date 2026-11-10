import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../playback/remote_scrub_controller.dart';

/// The speed of a remote scrub, in the style of the player's hold-for-speed
/// indicator: an arrow and the level, a pause icon at level 0 part way
/// through, or the start or end icon once the scrub stopped at an end.
///
/// It sits just under the preview picture, which is where the viewer's eyes
/// are during a scrub. The player passes the [link] of that picture while it
/// is on screen. With no preview picture it sits at the top centre.
///
/// The pill is slim so that, at the lowest preview position, it clears the
/// seek bar's handle.
class RemoteScrubBadge extends StatelessWidget {
  const RemoteScrubBadge({super.key, required this.controller, this.link});

  final RemoteScrubController controller;

  /// The preview picture's anchor, or null when no picture is shown.
  final LayerLink? link;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final direction = controller.direction;
        if (direction == null) return const SizedBox.shrink();
        final forward = direction == RemoteScrubDirection.forward;
        final level = controller.level;
        final pill = IgnorePointer(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: AppRadius.circular(14),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  level > 0
                      ? (forward ? Icons.fast_forward : Icons.fast_rewind)
                      : !controller.atEnd
                      ? Icons.pause
                      : (forward ? Icons.last_page : Icons.first_page),
                  color: Colors.white,
                  size: 20,
                ),
                if (level > 0) ...[
                  const SizedBox(width: 6),
                  Text(
                    '$level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
        final link = this.link;
        if (link != null) {
          // The Stack's own constraints are tight, so a Positioned gives the
          // pill its natural size; the follower then moves it under the picture.
          return Positioned(
            left: 0,
            top: 0,
            child: CompositedTransformFollower(
              link: link,
              showWhenUnlinked: false,
              targetAnchor: Alignment.bottomCenter,
              followerAnchor: Alignment.topCenter,
              offset: const Offset(0, AppSpacing.spaceXs),
              child: pill,
            ),
          );
        }
        return Positioned(
          top: MediaQuery.paddingOf(context).top + AppSpacing.spaceLg,
          left: 0,
          right: 0,
          child: Center(child: pill),
        );
      },
    );
  }
}
