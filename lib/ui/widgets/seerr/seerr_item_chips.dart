import 'package:flutter/material.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import 'seerr_browse_chip.dart';
import 'seerr_tags_dialog.dart';

/// Opens Seerr's genres, networks and keywords for a title.
///
/// Kept apart from the library's own genres, which lead into library browse.
/// They look alike but land somewhere else, so folding them together would
/// break one of the two.
class SeerrItemChips extends StatelessWidget {
  final SeerrMediaDetailState state;

  /// Where a d-pad lands when it enters from above.
  final FocusNode? firstFocusNode;

  /// Called when up or down would leave the button.
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
      label: AppLocalizations.of(context).genresAndTags,
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
