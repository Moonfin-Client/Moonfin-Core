import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../mixins/focus_state_mixin.dart';
import '../../navigation/destinations.dart';
import 'seerr_browse_chip.dart';

/// Modal popup displaying all Genres, Networks, and Keywords for a title in a
/// clean categorized dialog.
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
  late final FocusNode _firstChipFocusNode = FocusNode(debugLabel: 'dialogFirstChip');

  @override
  void dispose() {
    _firstChipFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    var isFirstChip = true;

    FocusNode? grabFirstChipFocusNode() {
      if (isFirstChip) {
        isFirstChip = false;
        return _firstChipFocusNode;
      }
      return null;
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
                const Expanded(
                  child: Text(
                    'Keywords',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                _DialogCloseButton(
                  onPressed: () => Navigator.of(context).pop(),
                  onNavigateDown: () {
                    if (_firstChipFocusNode.canRequestFocus) {
                      _firstChipFocusNode.requestFocus();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.state.genres.isNotEmpty) ...[
                      const Text(
                        'Genres',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final g in widget.state.genres)
                            SeerrBrowseChip(
                              label: g.name,
                              focusNode: grabFirstChipFocusNode(),
                              onTap: () =>
                                  open(g.id.toString(), g.name, 'genre'),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (widget.state.networks.isNotEmpty) ...[
                      const Text(
                        'Networks',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final n in widget.state.networks)
                            SeerrBrowseChip(
                              label: n.name,
                              color: Colors.transparent,
                              borderColor: Colors.white24,
                              labelColor: Colors.white70,
                              focusNode: grabFirstChipFocusNode(),
                              onTap: () =>
                                  open(n.id.toString(), n.name, 'network'),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (widget.state.keywords.isNotEmpty) ...[
                      const Text(
                        'Tags',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final k in widget.state.keywords)
                            SeerrBrowseChip(
                              label: k.name,
                              color: Colors.white.withValues(alpha: 0.08),
                              labelColor: Colors.white70,
                              dense: true,
                              focusNode: grabFirstChipFocusNode(),
                              onTap: () =>
                                  open(k.id.toString(), k.name, 'keyword'),
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogCloseButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onNavigateDown;

  const _DialogCloseButton({
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
    return Focus(
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.gameButtonA) {
          widget.onPressed();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
            widget.onNavigateDown != null) {
          widget.onNavigateDown!();
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
                    color: showFocusBorder ? focusColor : Colors.transparent,
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
    );
  }
}
