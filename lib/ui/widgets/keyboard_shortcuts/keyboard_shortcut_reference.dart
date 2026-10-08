import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../playback/letterbox_croppers.dart';
import '../../../playback/player_key_bindings.dart';
import '../../../util/focus/key_event_utils.dart';
import '../../../util/platform_detection.dart';
import '../track_selector_dialog.dart';

/// One action and the key combinations that trigger it. Each entry in [keys]
/// is a full combination such as `Shift+I`, and entries are alternatives.
class KeyboardShortcut {
  const KeyboardShortcut(this.keys, this.action);

  final List<String> keys;
  final String action;
}

/// A group of shortcuts that apply in one place. [scope] says when the keys
/// work ("On any screen", "While a video is playing") so the reader knows
/// which group is theirs before reading the keys.
class KeyboardShortcutSection {
  const KeyboardShortcutSection({
    required this.title,
    required this.scope,
    required this.icon,
    required this.groups,
  });

  final String title;
  final String scope;
  final IconData icon;

  /// Rows in display order, split into themed runs (playback, seeking,
  /// volume...) that the list separates with a gap.
  final List<List<KeyboardShortcut>> groups;

  List<KeyboardShortcut> get shortcuts => [
    for (final group in groups) ...group,
  ];
}

/// The shortcut list for the platform this build runs on. Keys that only a
/// given platform handles (mpv statistics, the desktop window keys) are left
/// out elsewhere so the list never promises a key that does nothing.
///
/// The player rows come from [PlayerKeyBindings], the same table the player
/// handler reads, so they cannot drift. The app and reader rows still
/// document the handlers in `app.dart` and `book_reader_screen.dart` by
/// hand, so a key added or removed there needs the matching change here.
///
/// [context] trims the list to what helps where it is shown: over a video
/// the reader section is noise, and the other way round. The row for the
/// key that opened the dialog is dropped in its own context.
List<KeyboardShortcutSection> keyboardShortcutSections(
  AppLocalizations l10n, {
  PlayerKeyBindings playerBindings = PlayerKeyBindings.defaults,
  KeyboardShortcutContext context = KeyboardShortcutContext.settings,
}) {
  final inSettings = context == KeyboardShortcutContext.settings;
  final showPlayer = inSettings || context == KeyboardShortcutContext.player;
  final showReader = inSettings || context == KeyboardShortcutContext.reader;
  final isMac = PlatformDetection.isMacOS;
  final ctrl = isMac ? '⌘' : l10n.keyNameCtrl;
  final alt = isMac ? '⌥' : l10n.keyNameAlt;
  final desktopUi = PlatformDetection.useDesktopUi;

  // A player row can gather several actions (the held-key seek and the
  // media-key skip both read as "seek back" to the user). Aliases that share
  // a cap (Select beside Enter) collapse into one.
  KeyboardShortcut player(List<PlayerAction> actions, String label) =>
      KeyboardShortcut(
        {
          for (final action in actions)
            for (final binding in playerBindings.keysFor(action))
              keyBindingLabel(binding, l10n),
        }.toList(),
        label,
      );

  return [
    KeyboardShortcutSection(
      title: l10n.keyboardShortcutsSectionApp,
      scope: l10n.keyboardShortcutsSectionAppScope,
      icon: Icons.apps_rounded,
      groups: [
        // Getting around.
        [
          KeyboardShortcut([l10n.keyNameArrowKeys], l10n.shortcutMoveFocus),
          KeyboardShortcut([l10n.keyNameEnter], l10n.shortcutActivate),
          KeyboardShortcut([
            l10n.keyNameEsc,
            l10n.keyNameBackspace,
          ], l10n.shortcutGoBack),
        ],
        // The window.
        [
          if (desktopUi)
            KeyboardShortcut([
              'F11',
              '$alt+${l10n.keyNameEnter}',
            ], l10n.shortcutToggleFullscreen),
          if (PlatformDetection.isDesktop)
            KeyboardShortcut(['$ctrl+Q'], l10n.shortcutQuit),
          // Pointless inside the list it opens.
          if (inSettings)
            KeyboardShortcut(['?', 'F1'], l10n.shortcutShowShortcuts),
        ],
      ],
    ),
    if (showPlayer)
      KeyboardShortcutSection(
        title: l10n.keyboardShortcutsSectionPlayer,
        scope: l10n.keyboardShortcutsSectionPlayerScope,
        icon: Icons.play_circle_outline_rounded,
        groups: [
          // Playback.
          [
            player([PlayerAction.playPause], l10n.shortcutPlayPause),
            player([
              PlayerAction.showControlsOrPlayPause,
            ], l10n.shortcutShowControlsOrPlayPause),
            player([PlayerAction.stop], l10n.shortcutStopPlayback),
            player(
              [PlayerAction.escape],
              desktopUi
                  ? l10n.shortcutLeaveFullscreenOrStop
                  : l10n.shortcutStopPlayback,
            ),
            player([PlayerAction.next], l10n.shortcutNextItem),
            player([PlayerAction.previous], l10n.shortcutPreviousItem),
          ],
          // Seeking and speed.
          [
            player([
              PlayerAction.seekBack,
              PlayerAction.skipBack,
            ], l10n.shortcutSeekBack),
            player([
              PlayerAction.seekForward,
              PlayerAction.skipForward,
            ], l10n.shortcutSeekForward),
            player([PlayerAction.slowDown], l10n.shortcutSlower),
            player([PlayerAction.speedUp], l10n.shortcutFaster),
          ],
          // Sound and subtitles.
          [
            player([PlayerAction.volumeUp], l10n.shortcutVolumeUp),
            player([PlayerAction.volumeDown], l10n.shortcutVolumeDown),
            player([PlayerAction.mute], l10n.shortcutMute),
            player([
              PlayerAction.toggleSubtitles,
            ], l10n.shortcutToggleSubtitles),
          ],
          // Display and information.
          [
            if (desktopUi)
              player([
                PlayerAction.toggleFullscreen,
              ], l10n.shortcutToggleFullscreen),
            player([PlayerAction.playbackInfo], l10n.shortcutPlaybackInfo),
            if (PlatformDetection.isWindows)
              player([PlayerAction.mpvStats], l10n.shortcutMpvStats),
            if (letterboxCropAvailable())
              player([
                PlayerAction.recropBlackBars,
              ], l10n.shortcutRecropBlackBars),
          ],
        ],
      ),
    if (desktopUi && showReader)
      KeyboardShortcutSection(
        title: l10n.keyboardShortcutsSectionReader,
        scope: l10n.keyboardShortcutsSectionReaderScope,
        icon: Icons.menu_book_rounded,
        groups: [
          // Turning pages.
          [
            KeyboardShortcut([
              '→',
              l10n.keyNamePageDown,
              l10n.keyNameSpace,
            ], l10n.shortcutNextPage),
            KeyboardShortcut([
              '←',
              l10n.keyNamePageUp,
            ], l10n.shortcutPreviousPage),
            KeyboardShortcut([l10n.keyNameHome], l10n.shortcutFirstPage),
            KeyboardShortcut([l10n.keyNameEnd], l10n.shortcutLastPage),
            KeyboardShortcut(['↑', '↓'], l10n.shortcutScrollPage),
          ],
          // Zoom.
          [
            KeyboardShortcut([
              '+',
              '−',
              '$ctrl+${l10n.keyNameScrollWheel}',
            ], l10n.shortcutZoom),
            KeyboardShortcut(['0'], l10n.shortcutResetZoom),
          ],
        ],
      ),
  ];
}

/// Where the shortcut list is shown, which decides which sections it holds:
/// everything in settings, otherwise the app keys plus the screen's own.
enum KeyboardShortcutContext { settings, browse, player, reader }

/// Whether [key] is one of the keys that open the shortcut list (`?`, F1,
/// or Shift+/ on layouts that report it as slash).
bool isShowShortcutsKey(LogicalKeyboardKey key) =>
    key == LogicalKeyboardKey.question ||
    key == LogicalKeyboardKey.f1 ||
    (key == LogicalKeyboardKey.slash &&
        HardwareKeyboard.instance.isShiftPressed);

/// The key cap text for one binding: symbols for arrows and media keys,
/// localized names for the word keys, the printed character for the rest.
String keyBindingLabel(KeyBinding binding, AppLocalizations l10n) {
  final key = binding.key;
  final base = switch (key) {
    LogicalKeyboardKey.space => l10n.keyNameSpace,
    LogicalKeyboardKey.enter || LogicalKeyboardKey.select => l10n.keyNameEnter,
    LogicalKeyboardKey.escape => l10n.keyNameEsc,
    LogicalKeyboardKey.arrowLeft => '←',
    LogicalKeyboardKey.arrowRight => '→',
    LogicalKeyboardKey.arrowUp => '↑',
    LogicalKeyboardKey.arrowDown => '↓',
    LogicalKeyboardKey.mediaPlayPause => '⏯',
    LogicalKeyboardKey.mediaPlay => '▶',
    LogicalKeyboardKey.mediaPause => '⏸',
    LogicalKeyboardKey.mediaStop => '⏹',
    LogicalKeyboardKey.mediaTrackNext => '⏭',
    LogicalKeyboardKey.mediaTrackPrevious => '⏮',
    LogicalKeyboardKey.mediaFastForward => '⏩',
    LogicalKeyboardKey.mediaRewind => '⏪',
    _ =>
      key.keyLabel.isNotEmpty
          ? key.keyLabel.toUpperCase()
          : (key.debugName ?? ''),
  };
  return binding.shift ? '${l10n.keyNameShift}+$base' : base;
}

/// The sections laid out as key caps beside their action. [onDark] picks the
/// white-on-black palette of the player dialogs over the app theme.
class KeyboardShortcutList extends StatelessWidget {
  const KeyboardShortcutList({
    super.key,
    required this.sections,
    this.onDark = false,
  });

  final List<KeyboardShortcutSection> sections;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = onDark ? Colors.white : theme.colorScheme.onSurface;
    final muted = onDark ? Colors.white54 : theme.colorScheme.onSurfaceVariant;
    final accent = theme.colorScheme.primary;
    final headerStyle = TextStyle(
      color: foreground,
      fontSize: AppTypography.fontSizeMd,
      fontWeight: FontWeight.w700,
    );
    final scopeStyle = TextStyle(color: muted, fontSize: 12);
    final bandDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: accent.withValues(alpha: onDark ? 0.22 : 0.12),
    );
    final actionStyle = TextStyle(color: foreground, fontSize: 13);
    final keyStyle = TextStyle(
      color: foreground,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
    final capDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: muted.withValues(alpha: 0.6)),
      color: foreground.withValues(alpha: onDark ? 0.08 : 0.04),
    );

    Widget keyCap(String label) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: capDecoration,
      child: Text(label, style: keyStyle),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final section in sections) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.spaceLg,
              AppSpacing.spaceMd,
              AppSpacing.spaceLg,
              AppSpacing.spaceSm,
            ),
            child: Container(
              decoration: bandDecoration,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spaceMd,
                vertical: AppSpacing.spaceSm,
              ),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 34,
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spaceMd),
                  Icon(section.icon, color: accent, size: 22),
                  const SizedBox(width: AppSpacing.spaceMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(section.title, style: headerStyle),
                        Text(section.scope, style: scopeStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (final (index, group) in section.groups.indexed)
            for (final (row, shortcut) in group.indexed)
              Padding(
                // A wider gap opens each themed run of rows.
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.spaceLg,
                  index > 0 && row == 0 ? AppSpacing.spaceMd + 4 : 4,
                  AppSpacing.spaceLg,
                  4,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(shortcut.action, style: actionStyle),
                    ),
                    const SizedBox(width: AppSpacing.spaceMd),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          for (final key in shortcut.keys) keyCap(key),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ],
    );
  }
}

/// The shortcut list as a dialog over the player, where `?` and F1 open it.
Future<void> showKeyboardShortcutsDialog(
  BuildContext context, {
  KeyboardShortcutContext shownIn = KeyboardShortcutContext.player,
}) async {
  final l10n = AppLocalizations.of(context);
  final sections = keyboardShortcutSections(l10n, context: shownIn);
  final controller = ScrollController();

  try {
    await showStyledPlayerDialog<void>(
      context,
      title: l10n.keyboardShortcutsTitle,
      maxWidth: 560,
      builder: (_) => Focus(
        autofocus: true,
        onKeyEvent: arrowScrollHandler(controller),
        // Hugs the rows: a short list (the browse screens have five keys)
        // would otherwise sit at the top of a dialog stretched to the
        // screen height.
        child: SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.only(bottom: AppSpacing.spaceLg),
          child: KeyboardShortcutList(sections: sections, onDark: true),
        ),
      ),
    );
  } finally {
    controller.dispose();
  }
}
