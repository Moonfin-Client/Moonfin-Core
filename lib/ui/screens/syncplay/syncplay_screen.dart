import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../../../auth/repositories/user_repository.dart';
import '../../../di/providers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../../syncplay/syncplay_state.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/user_avatar_image.dart';

/// Cards narrower than this stack their header actions and the create-group
/// form instead of laying them out in one row (phones in portrait).
const double _kWideLayoutMinWidth = 560;

/// Tiles sit inside a card that already has padding, so they only keep a
/// small vertical gap instead of the settings panels' outer margins.
const EdgeInsets _kTileMargin = EdgeInsets.symmetric(vertical: 3);
const EdgeInsets _kTileContentPadding = EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 4,
);
const double _kAvatarSize = 30;
const double _kCardRadius = 16;

Color _tileIconColor(BuildContext context, bool focused) =>
    focused && settingsTileInvertsOnFocus
    ? AppColors.black.withValues(alpha: 0.54)
    : (Theme.of(context).iconTheme.color ?? AppColorScheme.onSurface);

Color _mutedTextColor(BuildContext context) =>
    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);

/// Text on a tile's light keyboard or D-pad highlight turns dark.
bool _invertsOn(bool focused) => focused && settingsTileInvertsOnFocus;

String _stateLabel(SyncPlayGroupState state, AppLocalizations l10n) =>
    switch (state) {
      SyncPlayGroupState.idle => l10n.syncPlayStateIdle,
      SyncPlayGroupState.waiting => l10n.syncPlayStateWaiting,
      SyncPlayGroupState.paused => l10n.syncPlayStatePaused,
      SyncPlayGroupState.playing => l10n.syncPlayStatePlaying,
    };

String? _currentUserName() {
  try {
    return GetIt.instance<UserRepository>().currentUser?.name;
  } catch (_) {
    return null;
  }
}

bool _isCurrentUser(String name) {
  final current = _currentUserName()?.trim().toLowerCase();
  return current != null && current == name.trim().toLowerCase();
}

/// The settings-panel tile look on every input mode: the rounded background
/// always, the highlight only for keyboard and D-pad focus.
Widget _syncPlayTile({
  bool enabled = true,
  required Widget Function(BuildContext context, bool focused) builder,
}) {
  return TvFocusHighlight(
    outerPadding: _kTileMargin,
    enabled: enabled,
    builder: (context, focused) {
      // The highlight's tile styles carry no font family, so the screen's
      // clean settings font is put back on them here.
      final tileTheme = ListTileTheme.of(context);
      return ListTileTheme.merge(
        titleTextStyle: tileTheme.titleTextStyle?.copyWith(
          fontFamily: kCleanSettingsFontFamily,
        ),
        subtitleTextStyle: tileTheme.subtitleTextStyle?.copyWith(
          fontFamily: kCleanSettingsFontFamily,
        ),
        child: builder(context, focused),
      );
    },
  );
}

class SyncPlayScreen extends ConsumerStatefulWidget {
  const SyncPlayScreen({super.key});

  @override
  ConsumerState<SyncPlayScreen> createState() => _SyncPlayScreenState();
}

class _SyncPlayScreenState extends ConsumerState<SyncPlayScreen> {
  final _groupNameController = TextEditingController();
  final _groupNameFocus = FocusNode(debugLabel: 'syncplay_group_name');
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _refreshFocusNode = FocusNode(debugLabel: 'syncplay_refresh');
  final _ignoreWaitFocus = FocusNode(debugLabel: 'syncplay_ignore_wait');
  final _leaveFocus = FocusNode(debugLabel: 'syncplay_leave');

  /// Sends [key] presses on a node to [target], for the D-pad path from the
  /// app bar through the group header's Leave button to the first tile.
  FocusOnKeyEventCallback _moveFocusOn(
    Map<LogicalKeyboardKey, FocusNode Function()> targets,
  ) {
    return (node, event) {
      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.ignored;
      }
      final target = targets[event.logicalKey]?.call();
      if (target == null ||
          !target.canRequestFocus ||
          target.context?.mounted != true) {
        return KeyEventResult.ignored;
      }
      target.requestFocus();
      return KeyEventResult.handled;
    };
  }

  @override
  void initState() {
    super.initState();
    _groupNameFocus.onKeyEvent = _onGroupNameKey;
    // Leave sits between the app bar and the first tile, so up and down
    // step through it instead of skipping past it.
    _refreshFocusNode.onKeyEvent = _moveFocusOn({
      LogicalKeyboardKey.arrowDown: () =>
          _leaveFocus.context?.mounted == true ? _leaveFocus : _ignoreWaitFocus,
    });
    _leaveFocus.onKeyEvent = _moveFocusOn({
      LogicalKeyboardKey.arrowUp: () => _refreshFocusNode,
      LogicalKeyboardKey.arrowDown: () => _ignoreWaitFocus,
    });
    _ignoreWaitFocus.onKeyEvent = _moveFocusOn({
      LogicalKeyboardKey.arrowUp: () =>
          _leaveFocus.context?.mounted == true
              ? _leaveFocus
              : _refreshFocusNode,
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(syncPlayManagerProvider).fetchGroups();
    });
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupNameFocus.dispose();
    _refreshFocusNode.dispose();
    _ignoreWaitFocus.dispose();
    _leaveFocus.dispose();
    super.dispose();
  }

  bool _handleTvFieldOpen(KeyEvent event, FocusNode focusNode) {
    if (!PlatformDetection.isTV) return false;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return false;

    if (event.logicalKey.isBackKey) {
      if (event is KeyDownEvent &&
          (_tvFieldKey.currentState?.isKeyboardVisible ?? false)) {
        _tvFieldKey.currentState?.closeKeyboard();
        focusNode.requestFocus();
        return true;
      }
      return false;
    }

    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      if (!focusNode.hasFocus) focusNode.requestFocus();
      _tvFieldKey.currentState?.openKeyboard();
      return true;
    }

    return false;
  }

  KeyEventResult _onGroupNameKey(FocusNode node, KeyEvent event) {
    if (_handleTvFieldOpen(event, node)) {
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _handleTvKeyboardVisibility(bool visible) {
    if (!visible) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fieldContext = _tvFieldKey.currentContext;
      if (fieldContext == null || !mounted) return;
      Scrollable.ensureVisible(
        fieldContext,
        alignment: 0.12,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(syncPlayManagerProvider);
    final isTV = PlatformDetection.isTV;
    final showCreateGroup = !manager.state.enabled;
    return RequestInitialFocus(
      targetNode: isTV
          ? (showCreateGroup ? _groupNameFocus : _ignoreWaitFocus)
          : null,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final manager = ref.watch(syncPlayManagerProvider);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: AppBar(
          title: Text(l10n.syncPlay),
          actions: [
            IconButton(
              focusNode: _refreshFocusNode,
              icon: const Icon(Icons.refresh),
              onPressed: manager.isLoading ? null : () => manager.fetchGroups(),
            ),
          ],
        ),
        // An opened folding phone on its side keeps the clock in a top
        // corner, over the Create group button.
        body: SafeArea(
          top: false,
          bottom: false,
          child: _buildBody(context, manager, l10n),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SyncPlayManager manager,
    AppLocalizations l10n,
  ) {
    if (!manager.syncPlayConfigured) {
      return _Message(
        icon: Icons.toggle_off,
        title: l10n.syncPlayDisabledTitle,
        message: l10n.syncPlayDisabledMessage,
      );
    }
    if (!manager.syncPlayServerSupported) {
      return _Message(
        icon: Icons.cloud_off,
        title: l10n.syncPlayServerUnsupportedTitle,
        message: l10n.syncPlayServerUnsupportedMessage,
      );
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (manager.errorMessage != null)
          _ErrorBanner(message: manager.errorMessage!),
        if (manager.state.enabled)
          _ActiveGroupSection(
            manager: manager,
            ignoreWaitFocus: _ignoreWaitFocus,
            leaveFocus: _leaveFocus,
          ),
        if (!manager.state.enabled)
          _CreateGroupSection(
            controller: _groupNameController,
            manager: manager,
            focusNode: _groupNameFocus,
            tvFieldKey: _tvFieldKey,
            onKeyboardVisibilityChanged: _handleTvKeyboardVisibility,
          ),
        const SizedBox(height: 16),
        _AvailableGroupsSection(manager: manager),
        if (!manager.state.enabled) ...[
          const SizedBox(height: 14),
          const _JoinQueueNote(),
        ],
      ],
    );
  }
}

class _Message extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  const _Message({
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).disabledColor),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.error_outline),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }
}

/// One section of the screen: the theme's card surface with a hairline
/// border, so stacked sections read as separate panels.
class _SectionCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  const _SectionCard({required this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(_kCardRadius),
        side: BorderSide(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
        ),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

/// The larger icon box that leads a card's heading.
class _HeadingIconShell extends StatelessWidget {
  final IconData icon;
  const _HeadingIconShell(this.icon);

  @override
  Widget build(BuildContext context) {
    // Apple idioms draw their own settings icon style; keep theirs.
    if (AppUiIdiomResolver.isApple || AppUiIdiomResolver.appleTvStyle) {
      return buildSettingsLeadingIconShell(
        context,
        icon: Icon(icon),
        focused: false,
        iconColor: _tileIconColor(context, false),
      );
    }
    final accent = AppColorScheme.accent;
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.14),
        borderRadius: AppRadius.circular(16),
        border: Border.all(color: accent.withValues(alpha: 0.42)),
      ),
      child: Icon(icon, size: 26, color: _tileIconColor(context, false)),
    );
  }
}

/// A small uppercase heading above a group of tiles inside a card.
class _SectionLabel extends StatelessWidget {
  final String text;
  final Widget? trailing;
  const _SectionLabel(this.text, {this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: _mutedTextColor(context),
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// The group's state as a tinted pill with a colored dot.
class _StatePill extends StatelessWidget {
  final SyncPlayGroupState state;
  final bool focused;
  const _StatePill({required this.state, this.focused = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final color = switch (state) {
      SyncPlayGroupState.idle => Colors.grey,
      SyncPlayGroupState.waiting => Colors.orange,
      SyncPlayGroupState.paused => Colors.blueGrey,
      SyncPlayGroupState.playing => Colors.green,
    };
    final invert = _invertsOn(focused);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: AppRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 7),
          Text(
            _stateLabel(state, l10n),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: invert
                  ? AppColors.black.withValues(alpha: 0.87)
                  : Color.lerp(
                      color,
                      Theme.of(context).colorScheme.onSurface,
                      0.55,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The Join action on a lobby row. The row itself is the focus target for
/// keyboard and D-pad, so the button stays out of focus traversal and only
/// takes pointer and touch presses.
class _JoinButton extends StatelessWidget {
  final bool focused;
  final VoidCallback? onPressed;
  const _JoinButton({required this.focused, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accent = Theme.of(context).colorScheme.primary;
    final invert = _invertsOn(focused);
    final foreground = invert
        ? AppColors.black.withValues(alpha: 0.87)
        : Color.lerp(accent, Theme.of(context).colorScheme.onSurface, 0.3)!;
    return ExcludeFocus(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          foregroundColor: foreground,
          backgroundColor: invert
              ? AppColors.black.withValues(alpha: 0.08)
              : accent.withValues(alpha: 0.1),
          side: BorderSide(
            color: invert
                ? AppColors.black.withValues(alpha: 0.35)
                : accent.withValues(alpha: 0.5),
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(12)),
          textStyle: const TextStyle(
            fontFamily: kCleanSettingsFontFamily,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(Icons.login, size: 18),
        label: Text(l10n.syncPlayJoin),
      ),
    );
  }
}

/// A participant's avatar, or their initial when they have no picture.
class _ParticipantAvatar extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final double size;
  const _ParticipantAvatar({
    required this.name,
    required this.imageUrl,
    this.size = _kAvatarSize,
  });

  @override
  Widget build(BuildContext context) {
    final trimmed = name.trim();
    final initial = trimmed.isEmpty
        ? '?'
        : trimmed.characters.first.toUpperCase();
    final fallback = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorScheme.accent.withValues(alpha: 0.22),
        shape: BoxShape.circle,
      ),
      child: Text(
        initial,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: size * 0.42,
          color: AppColorScheme.accent,
        ),
      ),
    );
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: UserAvatarImage(url: imageUrl, size: size, fallback: fallback),
      ),
    );
  }
}

class _ParticipantChip extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final bool isYou;
  const _ParticipantChip({
    required this.name,
    required this.imageUrl,
    required this.isYou,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        borderRadius: AppRadius.circular(999),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.chipBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ParticipantAvatar(name: name, imageUrl: imageUrl),
          const SizedBox(width: 8),
          Text(
            name,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isYou) ...[
            const SizedBox(width: 6),
            Text(
              l10n.syncPlayParticipantYou,
              style: theme.textTheme.bodySmall?.copyWith(
                color: _mutedTextColor(context),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Up to three overlapping avatars for a group row in the lobby.
class _AvatarStack extends StatelessWidget {
  final List<String> names;
  final SyncPlayManager manager;
  const _AvatarStack({required this.names, required this.manager});

  static const double _size = 28;
  static const double _step = 21;

  @override
  Widget build(BuildContext context) {
    final shown = names.take(3).toList();
    if (shown.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final ring = theme.cardTheme.color ?? theme.colorScheme.surfaceContainerLow;
    return SizedBox(
      width: _size + (shown.length - 1) * _step + 4,
      height: _size + 4,
      child: Stack(
        children: [
          for (var i = 0; i < shown.length; i++)
            Positioned(
              left: i * _step,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(color: ring, shape: BoxShape.circle),
                child: _ParticipantAvatar(
                  name: shown[i],
                  imageUrl: manager.participantImageUrlFor(shown[i]),
                  size: _size,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LeaveGroupButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final FocusNode focusNode;
  const _LeaveGroupButton({required this.onPressed, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton.icon(
      onPressed: onPressed,
      focusNode: focusNode,
      style:
          OutlinedButton.styleFrom(
            minimumSize: const Size(0, 44),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(12)),
          ).copyWith(
            side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
              if (states.contains(WidgetState.focused)) {
                return BorderSide(color: colorScheme.primary, width: 2);
              }
              return BorderSide(
                color: colorScheme.onSurface.withValues(alpha: 0.3),
              );
            }),
          ),
      icon: const Icon(Icons.logout, size: 18),
      label: Text(l10n.syncPlayLeaveGroup),
    );
  }
}

/// The leading box of a queue row: a play glyph for the current item, the
/// position for the others.
class _QueueBadge extends StatelessWidget {
  final int? index;
  const _QueueBadge({required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final current = index == null;
    final accent = theme.colorScheme.primary;
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: current
            ? accent.withValues(alpha: 0.18)
            : theme.colorScheme.onSurface.withValues(alpha: 0.08),
        borderRadius: AppRadius.circular(10),
      ),
      child: current
          ? Icon(Icons.play_arrow, size: 20, color: accent)
          : Text(
              '$index',
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

class _ActiveGroupSection extends StatefulWidget {
  final SyncPlayManager manager;
  final FocusNode ignoreWaitFocus;
  final FocusNode leaveFocus;

  const _ActiveGroupSection({
    required this.manager,
    required this.ignoreWaitFocus,
    required this.leaveFocus,
  });

  @override
  State<_ActiveGroupSection> createState() => _ActiveGroupSectionState();
}

class _ActiveGroupSectionState extends State<_ActiveGroupSection> {
  bool _pickerOpen = false;
  bool _leaving = false;

  Future<void> _leave() async {
    if (_leaving) return;
    setState(() => _leaving = true);
    try {
      await widget.manager.leaveGroup();
      await widget.manager.fetchGroups();
    } finally {
      if (mounted) setState(() => _leaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final s = widget.manager.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionCard(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) => _buildHeader(
              context,
              s,
              l10n,
              wide: constraints.maxWidth >= _kWideLayoutMinWidth,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionLabel(l10n.playback),
              _syncPlayTile(
                builder: (context, focused) => SwitchListTile.adaptive(
                  focusNode: widget.ignoreWaitFocus,
                  contentPadding: _kTileContentPadding,
                  secondary: buildSettingsLeadingIconShell(
                    context,
                    icon: const Icon(Icons.schedule),
                    focused: focused,
                    iconColor: _tileIconColor(context, focused),
                  ),
                  title: Text(l10n.syncPlayIgnoreWait),
                  subtitle: Text(l10n.syncPlayIgnoreWaitSubtitle),
                  value: widget.manager.ignoreWaitEnabled,
                  onChanged: (v) => widget.manager.requestSetIgnoreWait(v),
                ),
              ),
              _syncPlayTile(
                builder: (context, focused) => ListTile(
                  contentPadding: _kTileContentPadding,
                  leading: buildSettingsLeadingIconShell(
                    context,
                    icon: const Icon(Icons.repeat),
                    focused: focused,
                    iconColor: _tileIconColor(context, focused),
                  ),
                  title: Text(l10n.syncPlayRepeat),
                  subtitle: Text(l10n.syncPlayRepeatSubtitle),
                  trailing: buildSettingsSelectionBubble(
                    context,
                    _repeatLabel(s.repeatMode, l10n),
                    focused,
                  ),
                  onTap: () => _showRepeatPicker(context, s, l10n),
                ),
              ),
              _syncPlayTile(
                builder: (context, focused) => ListTile(
                  contentPadding: _kTileContentPadding,
                  leading: buildSettingsLeadingIconShell(
                    context,
                    icon: Icon(
                      s.shuffleMode == SyncPlayShuffleMode.shuffle
                          ? Icons.shuffle_on_outlined
                          : Icons.shuffle,
                    ),
                    focused: focused,
                    iconColor: _tileIconColor(context, focused),
                  ),
                  title: Text(l10n.shuffle),
                  subtitle: Text(l10n.syncPlayShuffleSubtitle),
                  trailing: buildSettingsSelectionBubble(
                    context,
                    _shuffleLabel(s.shuffleMode, l10n),
                    focused,
                  ),
                  onTap: () => _showShufflePicker(context, s, l10n),
                ),
              ),
              _syncPlayTile(
                builder: (context, focused) => ListTile(
                  contentPadding: _kTileContentPadding,
                  leading: buildSettingsLeadingIconShell(
                    context,
                    icon: const Icon(Icons.queue_play_next),
                    focused: focused,
                    iconColor: _tileIconColor(context, focused),
                  ),
                  title: Text(l10n.syncPlaySyncCurrentQueue),
                  subtitle: Text(l10n.syncPlaySyncCurrentQueueSubtitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => widget.manager.syncCurrentPlaybackQueueToGroup(),
                ),
              ),
            ],
          ),
        ),
        if (s.queue.isNotEmpty) ...[
          const SizedBox(height: 16),
          _SectionCard(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionLabel(l10n.syncPlayGroupQueue),
                ...List.generate(
                  s.queue.length,
                  (i) => _buildQueueRow(context, s, l10n, i),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  /// The second line under the group name: who is here, then what is
  /// playing or that the queue is still empty.
  String _headerSubtitle(SyncPlayState s, AppLocalizations l10n) {
    final count = l10n.syncPlayParticipantCount(s.participants.length);
    if (s.queue.isEmpty) {
      return l10n.syncPlayGroupSubtitle(count, l10n.syncPlayNothingQueued);
    }
    final index = s.currentItemIndex;
    final title = index >= 0 && index < s.queue.length
        ? widget.manager.itemTitleFor(s.queue[index].itemId)
        : null;
    return title == null ? count : l10n.syncPlayGroupSubtitle(count, title);
  }

  Widget _buildHeader(
    BuildContext context,
    SyncPlayState s,
    AppLocalizations l10n, {
    required bool wide,
  }) {
    final theme = Theme.of(context);
    final manager = widget.manager;
    final leaveButton = _LeaveGroupButton(
      focusNode: widget.leaveFocus,
      onPressed: _leaving ? null : _leave,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (wide)
              const _HeadingIconShell(Icons.groups)
            else
              buildSettingsLeadingIconShell(
                context,
                icon: const Icon(Icons.groups),
                focused: false,
                iconColor: _tileIconColor(context, false),
              ),
            SizedBox(width: wide ? 16 : 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.groupName ?? l10n.syncPlayGroupFallbackName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _headerSubtitle(s, l10n),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      color: _mutedTextColor(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _StatePill(state: s.groupState),
            if (wide) ...[const SizedBox(width: 12), leaveButton],
          ],
        ),
        if (s.participants.isNotEmpty) ...[
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (final name in s.participants)
                _ParticipantChip(
                  name: name,
                  imageUrl: manager.participantImageUrlFor(name),
                  isYou: _isCurrentUser(name),
                ),
              if (wide)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    l10n.syncPlayOthersCanJoinHint,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      color: _mutedTextColor(context),
                    ),
                  ),
                ),
            ],
          ),
        ],
        if (!wide) ...[
          const SizedBox(height: 14),
          SizedBox(width: double.infinity, child: leaveButton),
        ],
      ],
    );
  }

  Widget _buildQueueRow(
    BuildContext context,
    SyncPlayState s,
    AppLocalizations l10n,
    int i,
  ) {
    final item = s.queue[i];
    final isCurrent = i == s.currentItemIndex;
    final title =
        widget.manager.itemTitleFor(item.itemId) ??
        l10n.syncPlayQueueItemFallback(i + 1);
    PopupMenuItem<String> menuItem(String value, IconData icon, String label) =>
        PopupMenuItem(
          value: value,
          child: Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 14),
              Text(label),
            ],
          ),
        );
    return _syncPlayTile(
      builder: (context, focused) {
        final accent = Theme.of(context).colorScheme.primary;
        final tinted = isCurrent && !_invertsOn(focused);
        final tile = ListTile(
          contentPadding: _kTileContentPadding,
          leading: _QueueBadge(index: isCurrent ? null : i + 1),
          title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: isCurrent
              ? Text(
                  l10n.nowPlaying,
                  style: tinted
                      ? TextStyle(
                          color: Color.lerp(
                            accent,
                            Theme.of(context).colorScheme.onSurface,
                            0.3,
                          ),
                        )
                      : null,
                )
              : null,
          onTap: () =>
              widget.manager.requestSetCurrentItem(item.playlistItemId),
          trailing: PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(12)),
            onSelected: (value) {
              switch (value) {
                case 'play':
                  widget.manager.requestSetCurrentItem(item.playlistItemId);
                  break;
                case 'remove':
                  widget.manager.requestRemoveFromQueue(item.playlistItemId);
                  break;
                case 'up':
                  widget.manager.requestMoveQueueItem(
                    item.playlistItemId,
                    i - 1,
                  );
                  break;
                case 'down':
                  widget.manager.requestMoveQueueItem(
                    item.playlistItemId,
                    i + 1,
                  );
                  break;
              }
            },
            itemBuilder: (_) => [
              if (!isCurrent)
                menuItem('play', Icons.play_arrow, l10n.syncPlayPlayNow),
              if (i > 0)
                menuItem('up', Icons.arrow_upward, l10n.trackActionMoveUp),
              if (i < s.queue.length - 1)
                menuItem(
                  'down',
                  Icons.arrow_downward,
                  l10n.trackActionMoveDown,
                ),
              menuItem('remove', Icons.delete_outline, l10n.remove),
            ],
          ),
        );
        if (!tinted) return tile;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.1),
            borderRadius: AppRadius.circular(16),
            border: Border.all(color: accent.withValues(alpha: 0.35)),
          ),
          child: tile,
        );
      },
    );
  }

  void _showRepeatPicker(
    BuildContext context,
    SyncPlayState s,
    AppLocalizations l10n,
  ) async {
    final result = await _showModePicker<SyncPlayRepeatMode>(
      context,
      title: l10n.syncPlayRepeat,
      values: SyncPlayRepeatMode.values,
      current: s.repeatMode,
      labelOf: (v) => _repeatLabel(v, l10n),
    );
    if (result != null && result != s.repeatMode) {
      widget.manager.requestSetRepeatMode(result);
    }
  }

  void _showShufflePicker(
    BuildContext context,
    SyncPlayState s,
    AppLocalizations l10n,
  ) async {
    final result = await _showModePicker<SyncPlayShuffleMode>(
      context,
      title: l10n.shuffle,
      values: SyncPlayShuffleMode.values,
      current: s.shuffleMode,
      labelOf: (v) => _shuffleLabel(v, l10n),
    );
    if (result != null && result != s.shuffleMode) {
      widget.manager.requestSetShuffleMode(result);
    }
  }

  /// The shared settings picker, opened once at a time.
  Future<T?> _showModePicker<T>(
    BuildContext context, {
    required String title,
    required List<T> values,
    required T current,
    required String Function(T value) labelOf,
  }) async {
    if (_pickerOpen) return null;
    _pickerOpen = true;
    try {
      return await showSettingsPicker<T>(
        context,
        title: title,
        values: values,
        current: current,
        labelOf: labelOf,
      );
    } finally {
      _pickerOpen = false;
    }
  }

  String _repeatLabel(SyncPlayRepeatMode mode, AppLocalizations l10n) =>
      switch (mode) {
        SyncPlayRepeatMode.repeatNone => l10n.off,
        SyncPlayRepeatMode.repeatOne => l10n.syncPlayRepeatOne,
        SyncPlayRepeatMode.repeatAll => l10n.all,
      };

  String _shuffleLabel(SyncPlayShuffleMode mode, AppLocalizations l10n) =>
      switch (mode) {
        SyncPlayShuffleMode.shuffle => l10n.syncPlayShuffleModeShuffled,
        SyncPlayShuffleMode.sorted => l10n.syncPlayShuffleModeSorted,
      };
}

class _CreateGroupSection extends StatelessWidget {
  final TextEditingController controller;
  final SyncPlayManager manager;
  final FocusNode focusNode;
  final GlobalKey<CustomTVTextFieldState> tvFieldKey;
  final ValueChanged<bool> onKeyboardVisibilityChanged;

  const _CreateGroupSection({
    required this.controller,
    required this.manager,
    required this.focusNode,
    required this.tvFieldKey,
    required this.onKeyboardVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final userPreferences = GetIt.instance<UserPreferences>();
    Widget heading({required bool wide}) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (wide)
          const _HeadingIconShell(Icons.group_add)
        else
          buildSettingsLeadingIconShell(
            context,
            icon: const Icon(Icons.group_add),
            focused: false,
            iconColor: _tileIconColor(context, false),
          ),
        SizedBox(width: wide ? 16 : 12),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.syncPlayCreateNewGroup,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                l10n.syncPlayCreateGroupSubtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 13,
                  color: _mutedTextColor(context),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
    final field = _buildGroupNameField(context, l10n, userPreferences);
    final button = PlatformDetection.isTV
        ? null
        : _buildCreateButton(context, l10n);
    return _SectionCard(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= _kWideLayoutMinWidth) {
            return Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * 0.4,
                  ),
                  child: heading(wide: true),
                ),
                const SizedBox(width: 28),
                Expanded(child: field),
                if (button != null) ...[const SizedBox(width: 16), button],
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heading(wide: false),
              const SizedBox(height: 14),
              field,
              if (button != null) ...[const SizedBox(height: 12), button],
            ],
          );
        },
      ),
    );
  }

  Future<void> _create(AppLocalizations l10n, BuildContext context) async {
    final name = controller.text.trim().isEmpty
        ? l10n.syncPlayDefaultGroupName
        : controller.text.trim();
    await confirmSyncPlayJoin(context, manager, () async {
      await manager.createGroup(name);
      // fetchGroups clears the error, so keep a failed create's banner up.
      if (manager.errorMessage == null) await manager.fetchGroups();
    });
  }

  Widget _buildGroupNameField(
    BuildContext context,
    AppLocalizations l10n,
    UserPreferences prefs,
  ) {
    Future<void> triggerCreate() => _create(l10n, context);

    if (PlatformDetection.isTV) {
      final colorScheme = Theme.of(context).colorScheme;
      return Focus(
        focusNode: focusNode,
        child: ListenableBuilder(
          listenable: focusNode,
          builder: (_, _) {
            final focused = focusNode.hasFocus;
            return CustomTVTextField(
              key: tvFieldKey,
              controller: controller,
              isFocused: focused,
              inputPurpose: InputPurpose.text,
              keyboardStyle: prefs.get(UserPreferences.keyboardStyle),
              hint: l10n.syncPlayGroupName,
              textFieldType: TextFieldType.other,
              keyboardType: KeyboardType.alphabetic,
              filled: true,
              fillColor: focused
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerHighest.scaleAlpha(0.6),
              borderColor: colorScheme.outline,
              focusedBorderColor: colorScheme.primary,
              hintStyle: TextStyle(
                fontFamily: kCleanSettingsFontFamily,
                color: colorScheme.onSurface.withValues(alpha: 0.65),
              ),
              textStyle: TextStyle(
                fontFamily: kCleanSettingsFontFamily,
                color: colorScheme.onSurface,
              ),
              popParentOnKeyboardClose: false,
              onFieldSubmitted: (_) => triggerCreate(),
              onVisibilityChanged: onKeyboardVisibilityChanged,
            );
          },
        ),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    OutlineInputBorder outline(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: AppRadius.circular(12),
          borderSide: BorderSide(color: color, width: width),
        );
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 14),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: l10n.syncPlayGroupName,
        hintStyle: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        filled: true,
        fillColor: colorScheme.onSurface.withValues(alpha: 0.04),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: outline(colorScheme.onSurface.withValues(alpha: 0.18)),
        enabledBorder: outline(colorScheme.onSurface.withValues(alpha: 0.18)),
        focusedBorder: outline(colorScheme.primary, 2),
      ),
      onSubmitted: (_) => triggerCreate(),
    );
  }

  Widget _buildCreateButton(BuildContext context, AppLocalizations l10n) {
    final accent = Theme.of(context).colorScheme.primary;
    return FilledButton.icon(
      style:
          FilledButton.styleFrom(
            minimumSize: const Size(0, 44),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            backgroundColor: accent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(12)),
            textStyle: const TextStyle(
              fontFamily: kCleanSettingsFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.focused)
                  ? BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2,
                    )
                  : null,
            ),
          ),
      onPressed: manager.isLoading ? null : () => _create(l10n, context),
      icon: const Icon(Icons.add),
      label: Text(l10n.syncPlayCreateGroup),
    );
  }
}

class _AvailableGroupsSection extends StatelessWidget {
  final SyncPlayManager manager;
  const _AvailableGroupsSection({required this.manager});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // The group this device is already in is shown above, not as one to join.
    final currentGroupId = manager.state.enabled ? manager.state.groupId : null;
    final groups = manager.availableGroups
        .where((g) => g.groupId != currentGroupId)
        .toList();
    final label = groups.isEmpty
        ? l10n.syncPlayAvailableGroups
        : l10n.syncPlayAvailableGroupsCount(groups.length);
    return _SectionCard(
      padding: const EdgeInsets.all(12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= _kWideLayoutMinWidth;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionLabel(
                label,
                trailing: manager.isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
              ),
              if (groups.isEmpty)
                _buildEmptyState(context, l10n)
              else
                ...groups.map(
                  (g) => _buildGroupRow(context, l10n, g, wide: wide),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
              borderRadius: AppRadius.circular(12),
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.chipBorder,
              ),
            ),
            child: Icon(
              Icons.inbox_outlined,
              size: 20,
              color: _mutedTextColor(context),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.syncPlayNoGroupsAvailable,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.syncPlayNoGroupsAvailableHint,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _mutedTextColor(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupRow(
    BuildContext context,
    AppLocalizations l10n,
    SyncPlayGroupInfo g, {
    required bool wide,
  }) {
    final names = g.participants;
    final who = names.isEmpty
        ? l10n.syncPlayParticipantCount(0)
        : names.join(', ');
    // Narrow rows have no room for the pill, so the state leads the text,
    // where a long name list can't push it out of view.
    final subtitle = wide
        ? who
        : '${syncPlayServerStateLabel(g.state?.serverValue, l10n)} • $who';
    Future<void> join() => confirmSyncPlayJoin(context, manager, () async {
      await manager.joinGroup(g.groupId);
      if (manager.errorMessage == null) await manager.fetchGroups();
    });
    return _syncPlayTile(
      enabled: !manager.isLoading,
      builder: (context, focused) => ListTile(
        contentPadding: _kTileContentPadding,
        leading: buildSettingsLeadingIconShell(
          context,
          icon: const Icon(Icons.group),
          focused: focused,
          iconColor: _tileIconColor(context, focused),
        ),
        title: Text(
          g.groupName ?? g.groupId,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 15),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              if (names.isNotEmpty) ...[
                _AvatarStack(names: names, manager: manager),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (wide) ...[
              _StatePill(
                state: g.state ?? SyncPlayGroupState.idle,
                focused: focused,
              ),
              const SizedBox(width: 12),
            ],
            _JoinButton(
              focused: focused,
              onPressed: manager.isLoading ? null : join,
            ),
          ],
        ),
        enabled: !manager.isLoading,
        onTap: join,
      ),
    );
  }
}

/// The note under the lobby that joining can replace what is playing here.
class _JoinQueueNote extends StatelessWidget {
  const _JoinQueueNote();

  @override
  Widget build(BuildContext context) {
    final color = _mutedTextColor(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              AppLocalizations.of(context).syncPlayJoinReplacesQueueNote,
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(fontSize: 12, color: color),
            ),
          ),
        ],
      ),
    );
  }
}

String syncPlayServerStateLabel(String? serverValue, AppLocalizations l10n) {
  final normalized = serverValue?.trim().toLowerCase();
  return switch (normalized) {
    'idle' => l10n.syncPlayStateIdle,
    'waiting' => l10n.syncPlayStateWaiting,
    'paused' => l10n.syncPlayStatePaused,
    'playing' => l10n.syncPlayStatePlaying,
    _ => (serverValue == null || serverValue.trim().isEmpty)
        ? l10n.syncPlayStateIdle
        : serverValue.trim(),
  };
}

/// Runs [action], first asking when joining would replace a queue that's
/// playing here.
Future<void> confirmSyncPlayJoin(
  BuildContext context,
  SyncPlayManager manager,
  Future<void> Function() action,
) async {
  if (manager.state.enabled) {
    await action();
    return;
  }
  final playbackManager = GetIt.instance<PlaybackManager>();
  if (playbackManager.queueService.items.isEmpty) {
    await action();
    return;
  }
  final l10n = AppLocalizations.of(context);
  final proceed = await showFocusRestoringDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: Text(l10n.syncPlayJoinGroupQuestion),
      content: Text(l10n.syncPlayJoinGroupWarning),
      actions: [
        adaptiveDialogAction(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel)),
        FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.syncPlayJoin)),
      ],
    ),
  );
  if (proceed == true) {
    await action();
  }
}
