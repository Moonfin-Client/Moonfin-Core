import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/button_layout.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/extensions.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import 'preference_tiles.dart';

/// One button a user can switch off and move within its row.
class ButtonLayoutEntry {
  const ButtonLayoutEntry({
    required this.id,
    required this.title,
    this.subtitle,
    required this.icon,
    this.canHide = true,
  });

  final String id;
  final String title;
  final String? subtitle;
  final IconData icon;

  /// A button the row always keeps. It still moves, it just has no switch.
  final bool canHide;
}

/// The rows of a settings screen that decides which buttons one row of the app
/// shows and in what order. A remote moves a button with left and right, a
/// pointer uses the arrows on each row.
class ButtonLayoutList extends StatefulWidget {
  const ButtonLayoutList({
    super.key,
    required this.layout,
    required this.entries,
  });

  final ButtonLayout layout;
  final List<ButtonLayoutEntry> entries;

  @override
  State<ButtonLayoutList> createState() => _ButtonLayoutListState();
}

class _ButtonLayoutListState extends State<ButtonLayoutList> {
  final _focusNodes = <String, FocusNode>{};

  UserPreferences get _prefs => GetIt.instance<UserPreferences>();

  @override
  void dispose() {
    for (final node in _focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  /// Kept by id so a row holds on to its highlight while it travels.
  FocusNode _focusNodeFor(String id) =>
      _focusNodes.putIfAbsent(id, () => FocusNode(debugLabel: 'buttonRow $id'));

  // Read straight from the store on every build and every write. The rows
  // share one preference, so a copy taken when a row was built goes stale as
  // soon as a neighbour writes, and the next write would undo the neighbour.
  Set<String> get _hidden => widget.layout.hidden(_prefs);

  /// The rows as they appear, with the buttons still switched on above the
  /// rest. Keeping the two apart means arranging only happens among the
  /// buttons that actually reach the screen.
  List<ButtonLayoutEntry> _rows(Set<String> hidden) => widget.layout
      .ordered(widget.entries, (entry) => entry.id, _prefs)
      .sortedEnabledAboveDisabled((entry) => !hidden.contains(entry.id));

  void _setShown(ButtonLayoutEntry entry, bool shown) {
    final ids = _hidden.toList();
    if (shown) {
      ids.remove(entry.id);
    } else if (!ids.contains(entry.id)) {
      ids.add(entry.id);
    }
    if (entry.id == 'download' && PlatformDetection.isTV) {
      unawaited(_prefs.set(UserPreferences.tvOfflineDownloads, shown));
    }
    unawaited(
      _prefs
          .set(widget.layout.hiddenPreference, ids.join(','))
          .then((_) => _keepUpWith(entry.id, movingUp: shown)),
    );
  }

  void _move(List<ButtonLayoutEntry> rows, int from, int to) {
    if (to < 0 || to >= rows.length) return;
    final ids = [for (final entry in rows) entry.id];
    ids.insert(to, ids.removeAt(from));
    unawaited(
      _prefs
          .set(widget.layout.orderPreference, ids.join(','))
          .then((_) => _keepUpWith(rows[from].id, movingUp: to < from)),
    );
  }

  /// A highlighted row that travels has to take the viewport and the traversal
  /// memory with it. Without the scroll the highlight walks off screen, and
  /// without clearing the memory the next press of up or down carries on from
  /// where the row used to sit.
  ///
  /// Called once the write lands, because that is what rebuilds the list, and
  /// the row has to be sitting in its new place before it can be scrolled to.
  void _keepUpWith(String id, {required bool movingUp}) {
    if (!mounted) return;
    final focused = FocusManager.instance.primaryFocus;
    final scope = focused?.nearestScope;
    final focusedContext = focused?.context;
    if (scope != null && focusedContext != null) {
      FocusTraversalGroup.maybeOf(focusedContext)?.invalidateScopeData(scope);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final rowContext = _focusNodes[id]?.context;
      if (rowContext == null || !rowContext.mounted) return;
      unawaited(
        Scrollable.ensureVisible(
          rowContext,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          alignmentPolicy: movingUp
              ? ScrollPositionAlignmentPolicy.keepVisibleAtStart
              : ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
        ),
      );
    });
  }

  Widget _buildRow(List<ButtonLayoutEntry> rows, int shownCount, int index) {
    final entry = rows[index];
    final isShown = index < shownCount;
    // A button only moves within its own group, so the arrows stop at the line
    // between what the row shows and what it leaves out.
    final groupStart = isShown ? 0 : shownCount;
    final groupEnd = isShown ? shownCount - 1 : rows.length - 1;

    return _ButtonLayoutRow(
      key: ValueKey(entry.id),
      entry: entry,
      focusNode: _focusNodeFor(entry.id),
      shown: isShown,
      isFirst: index == groupStart,
      isLast: index == groupEnd,
      onShownChanged: (value) => _setShown(entry, value),
      onMoveUp: () => _move(rows, index, index - 1),
      onMoveDown: () => _move(rows, index, index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _prefs,
      builder: (context, _) {
        final hidden = _hidden;
        final rows = _rows(hidden);
        final shownCount = rows
            .where((entry) => !hidden.contains(entry.id))
            .length;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var index = 0; index < rows.length; index++)
              _buildRow(rows, shownCount, index),
          ],
        );
      },
    );
  }
}

class _ButtonLayoutRow extends StatelessWidget {
  const _ButtonLayoutRow({
    super.key,
    required this.entry,
    required this.focusNode,
    required this.shown,
    required this.isFirst,
    required this.isLast,
    required this.onShownChanged,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  final ButtonLayoutEntry entry;
  final FocusNode focusNode;
  final bool shown;
  final bool isFirst;
  final bool isLast;
  final ValueChanged<bool> onShownChanged;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  void _toggle() {
    if (entry.canHide) onShownChanged(!shown);
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (isActivateKey(event)) {
      _toggle();
      return KeyEventResult.handled;
    }
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (event.logicalKey.isLeftKey && !isFirst) {
      onMoveUp();
      return KeyEventResult.handled;
    }
    if (event.logicalKey.isRightKey && !isLast) {
      onMoveDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isTv = PlatformDetection.isTV;

    return TvFocusHighlight(
      builder: (context, focused) {
        final iconColor = focused && settingsTileInvertsOnFocus
            ? AppColors.black.withValues(alpha: 0.54)
            : (Theme.of(context).iconTheme.color ?? AppColorScheme.onSurface);
        // On a remote this node is the row's only focus stop, which is what
        // lets a button with no switch still be highlighted and moved.
        // Everywhere else it just gives the row somewhere to scroll to.
        return Focus(
          focusNode: focusNode,
          canRequestFocus: isTv,
          skipTraversal: !isTv,
          onKeyEvent: isTv ? _onKey : null,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            leading: buildSettingsLeadingIconShell(
              context,
              icon: Icon(entry.icon),
              focused: focused,
              iconColor: iconColor,
            ),
            title: Text(entry.title),
            subtitle: entry.subtitle != null ? Text(entry.subtitle!) : null,
            titleAlignment: ListTileTitleAlignment.center,
            onTap: !isTv && entry.canHide ? _toggle : null,
            // A remote works the whole row from the outside, so nothing in
            // here should collect a highlight of its own.
            trailing: ExcludeFocus(
              excluding: isTv,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_up),
                    tooltip: l10n.moveUp,
                    onPressed: isFirst ? null : onMoveUp,
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    tooltip: l10n.moveDown,
                    onPressed: isLast ? null : onMoveDown,
                  ),
                  if (entry.canHide)
                    Switch.adaptive(value: shown, onChanged: onShownChanged)
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.lock_outline,
                        size: 18,
                        color: iconColor.withValues(alpha: 0.6),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
