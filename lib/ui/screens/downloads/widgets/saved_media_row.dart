import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../util/focus/dpad_keys.dart';
import '../../../../util/focus/focus_scroll.dart';
import '../../../../util/focus/key_event_utils.dart';
import '../../../../util/platform_detection.dart';
import '../../../mixins/focus_state_mixin.dart';
import '../../../widgets/focus/focus_theme.dart';
import '../../../widgets/offline_aware_image.dart';

/// One saved download in the list: artwork, title, a metadata line, the size on
/// disk, and the two actions a row can take.
///
/// The row carries three focus stops rather than one, because a remote has no
/// pointer to reach a trailing button with: right steps body, play, menu, and
/// left walks back. Up and down always return to the body, since a show row and
/// a book row have no play button and a sticky column would strand focus on a
/// target that isn't there.
class SavedMediaRow extends StatefulWidget {
  const SavedMediaRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.sizeLabel,
    required this.rowFocusNode,
    required this.onActivate,
    required this.onMenu,
    this.posterPath,
    this.fallbackIcon = Icons.movie_outlined,
    this.landscapeThumb = false,
    this.leadingNumber,
    this.badge,
    this.onPlay,
    this.selectMode = false,
    this.selected = false,
    this.onSelectedChanged,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  final String title;
  final String subtitle;
  final String sizeLabel;

  /// Local file path of the downloaded artwork. [OfflineAwareImage] serves a
  /// path straight off disk, so this needs no network fallback of its own.
  final String? posterPath;
  final IconData fallbackIcon;

  /// Episodes inside a saved show read better as a wide still than a poster.
  final bool landscapeThumb;

  /// Episode number shown ahead of the artwork on a show's episode list.
  final String? leadingNumber;

  /// The completed check, or a "3 of 10" style count for a show.
  final Widget? badge;

  final FocusNode rowFocusNode;

  final VoidCallback onActivate;
  final VoidCallback onMenu;

  /// Null for anything with nothing to play, which hides the play column and
  /// makes the menu the second and last focus stop.
  final VoidCallback? onPlay;

  final bool selectMode;
  final bool selected;
  final ValueChanged<bool>? onSelectedChanged;

  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;

  @override
  State<SavedMediaRow> createState() => _SavedMediaRowState();
}

class _SavedMediaRowState extends State<SavedMediaRow>
    with FocusStateMixin<SavedMediaRow> {
  final _playNode = FocusNode(debugLabel: 'SavedMediaRowPlay');
  final _menuNode = FocusNode(debugLabel: 'SavedMediaRowMenu');
  final _selectKeyHandler = LongPressSelectKeyHandler();

  /// Arrow keys drive the columns on a remote, and desktop keeps them because
  /// this app is driven with arrows there too. A phone has neither.
  bool get _usesDpad => PlatformDetection.isTV || PlatformDetection.useDesktopUi;

  /// A phone reaches the menu by long press, so the button would only crowd the
  /// row. Everywhere else both actions stay on screen.
  bool get _showPlay => widget.onPlay != null && !PlatformDetection.useMobileUi;

  @override
  void dispose() {
    _playNode.dispose();
    _menuNode.dispose();
    _selectKeyHandler.dispose();
    super.dispose();
  }

  /// Keep the focused row on screen, and far enough from the top edge that the
  /// rows after it are visible too.
  void _onAnyFocusChange(bool hasFocus) {
    setFocused(hasFocus);
    if (hasFocus && mounted) scrollFocusIntoView(context);
  }

  void _activate() {
    if (widget.selectMode) {
      widget.onSelectedChanged?.call(!widget.selected);
      return;
    }
    widget.onActivate();
  }

  void _openMenu() {
    // Selecting is a mode of its own, and a menu on top of it would act on a
    // different item than the one the checkboxes are gathering.
    if (widget.selectMode) return;
    widget.onMenu();
  }

  KeyEventResult _onBodyKey(FocusNode node, KeyEvent event) {
    final result = _selectKeyHandler.handleKeyEvent(
      event,
      onTap: _activate,
      onLongPress: _openMenu,
    );
    if (result != KeyEventResult.ignored) return result;
    if (!_usesDpad || !event.isActionable) return KeyEventResult.ignored;

    final key = event.logicalKey;
    if (key.isRightKey) {
      if (widget.selectMode) return KeyEventResult.handled;
      (_showPlay ? _playNode : _menuNode).requestFocus();
      return KeyEventResult.handled;
    }
    // Nothing sits left of a row inside the panel, so swallow the key rather
    // than let traversal throw focus somewhere unrelated.
    return consumeIfEdge(event, atLeftEdge: true);
  }

  KeyEventResult _onPlayKey(FocusNode node, KeyEvent event) {
    if (event.logicalKey.isContextMenuKey && event is KeyDownEvent) {
      _openMenu();
      return KeyEventResult.handled;
    }
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isRightKey) {
      _menuNode.requestFocus();
      return KeyEventResult.handled;
    }
    if (key.isLeftKey) {
      widget.rowFocusNode.requestFocus();
      return KeyEventResult.handled;
    }
    return _verticalFromButton(event);
  }

  KeyEventResult _onMenuKey(FocusNode node, KeyEvent event) {
    if (event.logicalKey.isContextMenuKey && event is KeyDownEvent) {
      _openMenu();
      return KeyEventResult.handled;
    }
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isLeftKey) {
      (_showPlay ? _playNode : widget.rowFocusNode).requestFocus();
      return KeyEventResult.handled;
    }
    if (key.isRightKey) return KeyEventResult.handled;
    return _verticalFromButton(event);
  }

  /// Leaving a row from one of its buttons lands on the next row's body, so the
  /// column resets every time focus changes row.
  KeyEventResult _verticalFromButton(KeyEvent event) {
    final key = event.logicalKey;
    if (key.isUpKey && widget.onNavigateUp != null) {
      widget.onNavigateUp!();
      return KeyEventResult.handled;
    }
    if (key.isDownKey && widget.onNavigateDown != null) {
      widget.onNavigateDown!();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final ring = FocusTheme.resolveColor(context, focusColor);
    final isCompact = PlatformDetection.useMobileUi;

    final body = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: isCompact ? 7 : 9,
      ),
      child: Row(
        children: [
          if (widget.selectMode)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: ExcludeFocus(
                child: Checkbox(
                  value: widget.selected,
                  onChanged: (value) =>
                      widget.onSelectedChanged?.call(value ?? false),
                ),
              ),
            ),
          if (widget.leadingNumber != null)
            SizedBox(
              width: 22,
              child: Text(
                widget.leadingNumber!,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                  fontSize: 12,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.leadingNumber != null ? 10 : 0,
              right: 12,
            ),
            child: _artwork(),
          ),
          Expanded(child: _text(isCompact)),
          const SizedBox(width: 10),
          Text(
            widget.sizeLabel,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.62),
              fontSize: isCompact ? 11.5 : 12.5,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Expanded(
              child: Focus(
                focusNode: widget.rowFocusNode,
                onKeyEvent: _onBodyKey,
                onFocusChange: _onAnyFocusChange,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _activate,
                  onLongPress: _openMenu,
                  onSecondaryTap: _openMenu,
                  child: AnimatedContainer(
                    duration: FocusTheme.animationDuration,
                    decoration: FocusTheme.focusDecoration(
                      isFocused: showFocusBorder,
                      radius: 9,
                      color: ring,
                      backgroundColor: focused
                          ? ring.withValues(alpha: 0.13)
                          : hovered
                          ? AppColorScheme.onSurface.withValues(alpha: 0.05)
                          : null,
                    ),
                    child: body,
                  ),
                ),
              ),
            ),
            if (!widget.selectMode) ...[
              if (_showPlay)
                _RowAction(
                  icon: Icons.play_arrow,
                  focusNode: _playNode,
                  onKeyEvent: _onPlayKey,
                  onPressed: widget.onPlay!,
                  ringColor: ring,
                  filled: true,
                ),
              _RowAction(
                icon: Icons.more_vert,
                focusNode: _menuNode,
                onKeyEvent: _onMenuKey,
                onPressed: _openMenu,
                ringColor: ring,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _artwork() {
    final width = widget.landscapeThumb ? 54.0 : 40.0;
    final height = widget.landscapeThumb ? 32.0 : 60.0;
    final path = widget.posterPath;
    return ClipRRect(
      borderRadius: AppRadius.circular(4),
      child: SizedBox(
        width: width,
        height: height,
        child: path != null && path.isNotEmpty
            ? OfflineAwareImage(
                imageUrl: path,
                width: width,
                height: height,
                fit: BoxFit.cover,
                memCacheWidth: (width * 3).round(),
                errorWidget: (_, _, _) => _artworkFallback(),
                placeholder: (_, _) => _artworkFallback(),
              )
            : _artworkFallback(),
      ),
    );
  }

  Widget _artworkFallback() => ColoredBox(
    color: AppColorScheme.onSurface.withValues(alpha: 0.09),
    child: Center(
      child: Icon(
        widget.fallbackIcon,
        size: 18,
        color: AppColorScheme.onSurface.withValues(alpha: 0.42),
      ),
    ),
  );

  Widget _text(bool isCompact) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          if (widget.badge != null)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: widget.badge!,
            ),
          Flexible(
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColorScheme.onSurface,
                fontSize: isCompact ? 13.5 : 14.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 2),
      Text(
        widget.subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.45),
          fontSize: isCompact ? 11.5 : 12.5,
        ),
      ),
    ],
  );
}

/// One of the trailing buttons. It takes focus in its own right so a remote can
/// reach it, and keeps its own key handler so the row can wire the columns.
class _RowAction extends StatefulWidget {
  const _RowAction({
    required this.icon,
    required this.focusNode,
    required this.onKeyEvent,
    required this.onPressed,
    required this.ringColor,
    this.filled = false,
  });

  final IconData icon;
  final FocusNode focusNode;
  final FocusOnKeyEventCallback onKeyEvent;
  final VoidCallback onPressed;
  final Color ringColor;
  final bool filled;

  @override
  State<_RowAction> createState() => _RowActionState();
}

class _RowActionState extends State<_RowAction>
    with FocusStateMixin<_RowAction> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: setFocused,
      onKeyEvent: (node, event) {
        final result = handleOneShotSelect(event, widget.onPressed);
        if (result != KeyEventResult.ignored) return result;
        return widget.onKeyEvent(node, event);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: FocusTheme.animationDuration,
            margin: const EdgeInsets.only(left: 4),
            width: 36,
            height: 36,
            decoration: FocusTheme.focusDecoration(
              isFocused: showFocusBorder,
              radius: 8,
              color: widget.ringColor,
              backgroundColor: focused
                  ? widget.ringColor.withValues(alpha: 0.18)
                  : widget.filled
                  ? AppColorScheme.onSurface.withValues(alpha: 0.08)
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: 18,
              color: AppColorScheme.onSurface.withValues(
                alpha: showFocusBorder ? 0.95 : 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
