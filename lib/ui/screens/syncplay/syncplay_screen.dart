import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';
import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../../../di/providers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../syncplay/syncplay_manager.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';

class SyncPlayScreen extends ConsumerStatefulWidget {
  const SyncPlayScreen({super.key});

  @override
  ConsumerState<SyncPlayScreen> createState() => _SyncPlayScreenState();
}

class _SyncPlayScreenState extends ConsumerState<SyncPlayScreen> {
  final _groupNameController = TextEditingController();
  final _groupNameFocus = FocusNode(debugLabel: 'syncplay_group_name');
  final _tvFieldKey = GlobalKey<CustomTVTextFieldState>();

  @override
  void initState() {
    super.initState();
    _groupNameFocus.onKeyEvent = _onGroupNameKey;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(syncPlayManagerProvider).fetchGroups();
    });
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupNameFocus.dispose();
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
      targetNode: (isTV && showCreateGroup) ? _groupNameFocus : null,
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
              icon: const Icon(Icons.refresh),
              onPressed: manager.isLoading ? null : () => manager.fetchGroups(),
            ),
          ],
        ),
        body: _buildBody(context, manager, l10n),
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
        if (manager.state.enabled) _ActiveGroupSection(manager: manager),
        if (!manager.state.enabled) _CreateGroupSection(
          controller: _groupNameController,
          manager: manager,
          focusNode: _groupNameFocus,
          tvFieldKey: _tvFieldKey,
          onKeyboardVisibilityChanged: _handleTvKeyboardVisibility,
        ),
        const SizedBox(height: 16),
        _AvailableGroupsSection(manager: manager),
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

class _ActiveGroupSection extends StatelessWidget {
  final SyncPlayManager manager;
  const _ActiveGroupSection({required this.manager});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final s = manager.state;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.groups),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    s.groupName ?? l10n.syncPlayGroupFallbackName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                _GroupStateChip(state: s.groupState),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              l10n.syncPlayParticipantCount(s.participants.length),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            if (s.participants.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: s.participants
                    .map((p) => Chip(label: Text(p)))
                    .toList(),
              ),
            const Divider(height: 24),
            _buildTile(
              context,
              tile: SwitchListTile(
                contentPadding: PlatformDetection.isTV
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
                title: Text(l10n.syncPlayIgnoreWait),
                subtitle: Text(l10n.syncPlayIgnoreWaitSubtitle),
                value: manager.ignoreWaitEnabled,
                onChanged: (v) => manager.requestSetIgnoreWait(v),
              ),
            ),
            _buildTile(
              context,
              tile: ListTile(
                contentPadding: PlatformDetection.isTV
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
                leading: const Icon(Icons.repeat),
                title: Text(l10n.syncPlayRepeat),
                subtitle: Text(_repeatLabel(s.repeatMode, l10n)),
                onTap: manager.cycleRepeatMode,
              ),
            ),
            _buildTile(
              context,
              tile: ListTile(
                contentPadding: PlatformDetection.isTV
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
                leading: Icon(
                  s.shuffleMode == SyncPlayShuffleMode.shuffle
                      ? Icons.shuffle_on_outlined
                      : Icons.shuffle,
                ),
                title: Text(l10n.shuffle),
                subtitle: Text(s.shuffleMode == SyncPlayShuffleMode.shuffle
                    ? l10n.syncPlayShuffleModeShuffled
                    : l10n.syncPlayShuffleModeSorted),
                onTap: manager.toggleShuffleMode,
              ),
            ),
            _buildTile(
              context,
              tile: ListTile(
                contentPadding: PlatformDetection.isTV
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
                leading: const Icon(Icons.queue_play_next),
                title: Text(l10n.syncPlaySyncCurrentQueue),
                subtitle: Text(l10n.syncPlaySyncCurrentQueueSubtitle),
                onTap: () => manager.syncCurrentPlaybackQueueToGroup(),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.tonalIcon(
                onPressed: () => manager.leaveGroup(),
                style: FilledButton.styleFrom().copyWith(
                  side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
                    if (states.contains(WidgetState.focused)) {
                      return BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      );
                    }
                    return null;
                  }),
                ),
                icon: const Icon(Icons.logout),
                label: Text(l10n.syncPlayLeaveGroup),
              ),
            ),
            if (s.queue.isNotEmpty) ...[
              const Divider(height: 24),
              Text(
                l10n.syncPlayGroupQueue,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              ...List.generate(s.queue.length, (i) {
                final item = s.queue[i];
                final isCurrent = i == s.currentItemIndex;
                final title =
                    manager.itemTitleFor(item.itemId) ??
                    l10n.syncPlayQueueItemFallback(i + 1);
                final tile = ListTile(
                  contentPadding: PlatformDetection.isTV
                      ? const EdgeInsets.symmetric(horizontal: 16)
                      : EdgeInsets.zero,
                  dense: true,
                  leading: Icon(
                    isCurrent ? Icons.play_circle : Icons.circle_outlined,
                    color: isCurrent ? Theme.of(context).colorScheme.primary : null,
                  ),
                  title: Text(title,
                      style: TextStyle(
                          fontWeight: isCurrent ? FontWeight.bold : null)),
                  subtitle: Text(item.itemId,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  onTap: () => manager.requestSetCurrentItem(item.playlistItemId),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'play':
                          manager.requestSetCurrentItem(item.playlistItemId);
                          break;
                        case 'remove':
                          manager.requestRemoveFromQueue(item.playlistItemId);
                          break;
                        case 'up':
                          manager.requestMoveQueueItem(
                              item.playlistItemId, i - 1);
                          break;
                        case 'down':
                          manager.requestMoveQueueItem(
                              item.playlistItemId, i + 1);
                          break;
                      }
                    },
                    itemBuilder: (_) => [
                      if (!isCurrent)
                        PopupMenuItem(
                          value: 'play',
                          child: Text(l10n.syncPlayPlayNow),
                        ),
                      if (i > 0)
                        PopupMenuItem(
                          value: 'up',
                          child: Text(l10n.trackActionMoveUp),
                        ),
                      if (i < s.queue.length - 1)
                        PopupMenuItem(
                          value: 'down',
                          child: Text(l10n.trackActionMoveDown),
                        ),
                      PopupMenuItem(
                        value: 'remove',
                        child: Text(l10n.remove),
                      ),
                    ],
                  ),
                );
                return _buildTile(context, tile: tile);
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required Widget tile,
  }) {
    if (PlatformDetection.isTV) {
      return TvFocusHighlight(
        builder: (context, focused) => tile,
      );
    }
    return tile;
  }

  String _repeatLabel(SyncPlayRepeatMode mode, AppLocalizations l10n) =>
      switch (mode) {
        SyncPlayRepeatMode.repeatNone => l10n.off,
        SyncPlayRepeatMode.repeatOne => l10n.syncPlayRepeatOne,
        SyncPlayRepeatMode.repeatAll => l10n.all,
      };
}

class _GroupStateChip extends StatelessWidget {
  final SyncPlayGroupState state;
  const _GroupStateChip({required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (label, color) = switch (state) {
      SyncPlayGroupState.idle => (l10n.syncPlayStateIdle, Colors.grey),
      SyncPlayGroupState.waiting => (l10n.syncPlayStateWaiting, Colors.orange),
      SyncPlayGroupState.paused => (l10n.syncPlayStatePaused, Colors.blueGrey),
      SyncPlayGroupState.playing => (l10n.syncPlayStatePlaying, Colors.green),
    };
    return Chip(
      label: Text(label),
      backgroundColor: color.withValues(alpha: 0.15),
      side: ThemeRegistry.active.borders.chipBorder.copyWith(color: color),
    );
  }
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
    final userPreferences = GetIt.instance<UserPreferences>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.syncPlayCreateNewGroup,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _buildGroupNameField(context, l10n, userPreferences),
            if (!PlatformDetection.isTV) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: _buildCreateButton(context, l10n),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildGroupNameField(
    BuildContext context,
    AppLocalizations l10n,
    UserPreferences prefs,
  ) {
    Future<void> triggerCreate() async {
      final name = controller.text.trim().isEmpty
          ? l10n.syncPlayDefaultGroupName
          : controller.text.trim();
      await _confirmIfNeeded(
        context,
        manager,
        () => manager.createGroup(name),
      );
    }

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
              preferSystemIme: prefs.get(UserPreferences.preferSystemImeKeyboard),
              hint: l10n.syncPlayGroupName,
              textFieldType: TextFieldType.other,
              keyboardType: KeyboardType.alphabetic,
              filled: true,
              fillColor: focused
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
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

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: l10n.syncPlayGroupName,
        border: const OutlineInputBorder(),
      ),
      onSubmitted: (_) => triggerCreate(),
    );
  }

  Widget _buildCreateButton(BuildContext context, AppLocalizations l10n) {

    return FilledButton.icon(
      onPressed: manager.isLoading
          ? null
          : () async {
              final name = controller.text.trim().isEmpty
                  ? l10n.syncPlayDefaultGroupName
                  : controller.text.trim();
              await _confirmIfNeeded(
                context,
                manager,
                () => manager.createGroup(name),
              );
            },
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
    final groups = manager.availableGroups;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.syncPlayAvailableGroups,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (manager.isLoading)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (groups.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(l10n.syncPlayNoGroupsAvailable),
              )
            else
              ...groups.map(
                (g) {
                  final tile = ListTile(
                    contentPadding: PlatformDetection.isTV
                        ? const EdgeInsets.symmetric(horizontal: 16)
                        : EdgeInsets.zero,
                    leading: const Icon(Icons.group),
                    title: Text(g.groupName ?? g.groupId),
                    subtitle: Text(
                      '${l10n.syncPlayParticipantCount(g.participants.length)} • '
                      '${_syncPlayServerStateLabel(g.state?.serverValue, l10n)}',
                    ),
                    trailing: const Icon(Icons.login),
                    enabled: !manager.isLoading,
                    onTap: () => _confirmIfNeeded(
                      context,
                      manager,
                      () => manager.joinGroup(g.groupId),
                    ),
                  );
                  if (PlatformDetection.isTV) {
                    return TvFocusHighlight(
                      builder: (context, focused) => tile,
                    );
                  }
                  return tile;
                },
              ),
          ],
        ),
      ),
    );
  }
}

String _syncPlayServerStateLabel(String? serverValue, AppLocalizations l10n) {
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

Future<void> _confirmIfNeeded(
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
    builder: (ctx) => AlertDialog(
      title: Text(l10n.syncPlayJoinGroupQuestion),
      content: Text(l10n.syncPlayJoinGroupWarning),
      actions: [
        TextButton(
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
