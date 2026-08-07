import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../mixins/focus_state_mixin.dart';
import '../../navigation/destinations.dart';
import 'seerr_browse_chip.dart';

/// The genres, networks and tags a title is filed under, each one a shortcut
/// into browsing everything else filed the same way.
class SeerrTagsDialog extends StatefulWidget {
  final SeerrMediaDetailState state;

  const SeerrTagsDialog({super.key, required this.state});

  static Future<void> show(
    BuildContext context,
    SeerrMediaDetailState state,
  ) {
    return showDialog<void>(
      context: context,
      builder: (context) => SeerrTagsDialog(state: state),
    );
  }

  @override
  State<SeerrTagsDialog> createState() => _SeerrTagsDialogState();
}

class _SeerrTagsDialogState extends State<SeerrTagsDialog> {
  final FocusNode _firstChipFocusNode = FocusNode(debugLabel: 'dialogFirstChip');

  @override
  void dispose() {
    _firstChipFocusNode.dispose();
    super.dispose();
  }

  /// Whichever section comes first owns the node, so Down off the close button
  /// always lands somewhere.
  bool get _hasFirstChip =>
      widget.state.genres.isNotEmpty ||
      widget.state.networks.isNotEmpty ||
      widget.state.keywords.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final mediaType = widget.state.isTv ? 'tv' : 'movie';

    void open(String id, String name, String filterType) {
      Navigator.of(context).pop();
      context.push(
        Destinations.seerrBrowseWith(
          filterId: id,
          filterName: name,
          mediaType: mediaType,
          filterType: filterType,
        ),
      );
    }

    var claimed = false;
    FocusNode? claimFirstChip() {
      if (claimed) return null;
      claimed = true;
      return _firstChipFocusNode;
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 640, maxHeight: 520),
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.94),
          borderRadius: AppRadius.circular(16),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.cardBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 24,
              spreadRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.genresAndTags,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                _DialogCloseButton(
                  label: l10n.close,
                  onPressed: () => Navigator.of(context).pop(),
                  onNavigateDown: _hasFirstChip
                      ? _firstChipFocusNode.requestFocus
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _section(
                      title: l10n.genres,
                      spacing: 8,
                      chips: [
                        for (final genre in widget.state.genres)
                          SeerrBrowseChip(
                            label: genre.name,
                            focusNode: claimFirstChip(),
                            onTap: () =>
                                open(genre.id.toString(), genre.name, 'genre'),
                          ),
                      ],
                    ),
                    _section(
                      title: l10n.networks,
                      spacing: 8,
                      chips: [
                        for (final network in widget.state.networks)
                          SeerrBrowseChip(
                            label: network.name,
                            color: Colors.transparent,
                            borderColor: Colors.white24,
                            labelColor: Colors.white70,
                            focusNode: claimFirstChip(),
                            onTap: () => open(
                              network.id.toString(),
                              network.name,
                              'network',
                            ),
                          ),
                      ],
                    ),
                    _section(
                      title: l10n.tags,
                      spacing: 6,
                      chips: [
                        for (final keyword in widget.state.keywords)
                          SeerrBrowseChip(
                            label: keyword.name,
                            color: Colors.white.withValues(alpha: 0.08),
                            labelColor: Colors.white70,
                            dense: true,
                            focusNode: claimFirstChip(),
                            onTap: () => open(
                              keyword.id.toString(),
                              keyword.name,
                              'keyword',
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required double spacing,
    required List<Widget> chips,
  }) {
    if (chips.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(spacing: spacing, runSpacing: spacing, children: chips),
        ],
      ),
    );
  }
}

class _DialogCloseButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final VoidCallback? onNavigateDown;

  const _DialogCloseButton({
    required this.label,
    required this.onPressed,
    this.onNavigateDown,
  });

  @override
  State<_DialogCloseButton> createState() => _DialogCloseButtonState();
}

class _DialogCloseButtonState extends State<_DialogCloseButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: true,
      label: widget.label,
      child: Tooltip(
        message: widget.label,
        child: Focus(
          onFocusChange: setFocused,
          onKeyEvent: (node, event) {
            if (isActivateKey(event)) {
              widget.onPressed();
              return KeyEventResult.handled;
            }
            final down = widget.onNavigateDown;
            if (down != null &&
                event.isActionable &&
                event.logicalKey.isDownKey) {
              down();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setHovered(true),
            onExit: (_) => setHovered(false),
            child: GestureDetector(
              onTap: widget.onPressed,
              child: AnimatedScale(
                scale: showFocusBorder ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 120),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: showFocusBorder
                        ? focusColor.withValues(alpha: 0.2)
                        : Colors.white.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.chipBorder.copyWith(
                        color: showFocusBorder
                            ? focusColor
                            : Colors.transparent,
                        width: showFocusBorder ? 2 : 1,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
