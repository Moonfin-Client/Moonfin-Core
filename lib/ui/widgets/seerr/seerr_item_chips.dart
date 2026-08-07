import 'package:flutter/material.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import 'seerr_browse_chip.dart';
import 'seerr_tags_dialog.dart';

/// Seerr's genres, networks and keywords for a title, each leading into Seerr
/// browse filtered by it.
class SeerrItemChips extends StatelessWidget {
  final SeerrMediaDetailState state;

  /// Where a d-pad lands when it enters the block from above.
  final FocusNode? firstFocusNode;

  /// Called when up from the first chip or down from the last would leave the
  /// block. Everything in between is left to the usual traversal, which walks
  /// the wrapped rows by position.
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  const SeerrItemChips({
    super.key,
    required this.state,
    this.firstFocusNode,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  /// Whether there is anything to file this title under, so a caller can drop
  /// the heading and spacing around it too.
  static bool hasContent(SeerrMediaDetailState s) =>
      s.genres.isNotEmpty || s.networks.isNotEmpty || s.keywords.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (!hasContent(state)) return const SizedBox.shrink();

    return SeerrBrowseChip(
      label: 'Genre and Tag Search',
      onTap: () => SeerrTagsDialog.show(context, state),
      color: Colors.white.withValues(alpha: 0.1),
      borderColor: Colors.white24,
      labelColor: Colors.white.withValues(alpha: 0.9),
      focusNode: firstFocusNode,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
    );
  }
}
