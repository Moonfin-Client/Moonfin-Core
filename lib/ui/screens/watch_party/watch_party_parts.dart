part of 'silo_watch_party_screen.dart';

/// The words for a Moonbase error code, or null to show the server's own.
String? watchPartyErrorText(AppLocalizations l10n, String? code) =>
    switch (code) {
      'wrong_pin' => l10n.watchPartyWrongPin,
      'too_many_attempts' => l10n.watchPartyTooManyTries,
      'full' => l10n.watchPartyFull,
      'not_found' => l10n.watchPartyNoSuchCode,
      'no_access' => l10n.watchPartyNoAccess,
      'disabled' => l10n.watchPartyUnavailable,
      _ => null,
    };

String? watchPartyStatusLabel(AppLocalizations l10n, String? status) =>
    switch (status) {
      'in_sync' => l10n.watchPartyStatusInSync,
      'catching_up' => l10n.watchPartyStatusCatchingUp,
      'buffering' => l10n.watchPartyStatusBuffering,
      'not_watching' => l10n.watchPartyStatusNotWatching,
      'ready' => l10n.watchPartyStatusReady,
      'joining' => l10n.watchPartyStatusJoining,
      _ => null,
    };

Color watchPartyStatusColor(String? status) => switch (status) {
  'in_sync' || 'ready' => const Color(0xFF3ECF8E),
  'catching_up' || 'joining' => const Color(0xFFF5B942),
  'buffering' => const Color(0xFF8FDCF7),
  _ => const Color(0xFF8A8A8A),
};

/// What a toast says, naming who did it.
String watchPartyToastText(
  AppLocalizations l10n,
  WatchPartyToast toast,
  SiloRoom? room,
) {
  final name = toast.name ?? '';
  return switch (toast.kind) {
    WatchPartyToastKind.paused => l10n.watchPartyToastPaused(name),
    WatchPartyToastKind.resumed => l10n.watchPartyToastResumed(name),
    WatchPartyToastKind.skipped => l10n.watchPartyToastSkipped(
      name,
      toast.detail ?? '',
    ),
    WatchPartyToastKind.joined => l10n.watchPartyToastJoined(name),
    WatchPartyToastKind.left => l10n.watchPartyToastLeft(name),
    WatchPartyToastKind.youAreHost => l10n.watchPartyToastYouAreHost,
    WatchPartyToastKind.newHost => l10n.watchPartyToastNewHost(name),
    WatchPartyToastKind.policyChanged =>
      room?.guestControlPolicy == 'everyone'
          ? l10n.watchPartyToastEveryoneControls
          : l10n.watchPartyToastHostControls,
    WatchPartyToastKind.switched => l10n.watchPartyToastSwitched(
      name,
      toast.detail ?? '',
    ),
    WatchPartyToastKind.noAccess => l10n.watchPartyNoAccess,
    WatchPartyToastKind.reconnecting => l10n.watchPartyToastReconnecting,
    WatchPartyToastKind.reconnected => l10n.watchPartyToastReconnected,
    WatchPartyToastKind.ended => l10n.watchPartyToastEnded(name),
    WatchPartyToastKind.hostOnly => l10n.watchPartyOnlyHostControls,
  };
}

/// "Arcane · S2:E1" for an episode, else the title.
String? watchPartyTitleOf({
  String? title,
  String? type,
  String? seriesName,
  int? season,
  int? episode,
}) {
  if (type == 'Episode' && seriesName != null) {
    return season != null && episode != null
        ? '$seriesName · S$season:E$episode'
        : seriesName;
  }
  return title;
}

/// An accent ring on a focused button, so the remote's position shows on
/// TV, where the default highlight barely changes these buttons.
final ButtonStyle _focusRing = ButtonStyle(
  side: WidgetStateProperty.resolveWith(
    (states) => states.contains(WidgetState.focused)
        ? BorderSide(color: AppColorScheme.accent, width: 2)
        : null,
  ),
);

/// Whether rooms are labeled with their kind: only Jellyfin has two.
bool get _labelsRoomKinds {
  final client = GetIt.instance<SiloWatchPartyManager>().roomClient;
  return client != null && client.features.supportsSyncPlay;
}

/// A small label, like "Watch Party", "SyncPlay" or "PIN".
class WatchPartyChip extends StatelessWidget {
  const WatchPartyChip({
    super.key,
    required this.label,
    this.accent = false,
    this.icon,
  });

  final String label;
  final bool accent;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = accent ? AppColorScheme.accent : AppColorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// A room card's second line: "Playing 1:12:40 · Maya · 4".
String watchPartyRoomLine(AppLocalizations l10n, MoonbaseRoomSummary room) {
  final state = !room.isPlaying
      ? room.selectionMode == 'vote'
            ? l10n.watchPartyVotingNow
            : l10n.watchPartyLobby
      : room.playbackState == 'paused'
      ? '${l10n.syncPlayStatePaused} '
            '${SiloWatchPartyManager.formatSeconds(room.positionSeconds)}'
      : '${l10n.syncPlayStatePlaying} '
            '${SiloWatchPartyManager.formatSeconds(room.positionSeconds)}';
  return [
    state,
    if (room.hostName.isNotEmpty) room.hostName,
    l10n.watchPartyWatchingCount(room.memberCount),
    if (room.guestControlPolicy == 'everyone')
      l10n.watchPartyEveryoneControlsShort,
  ].join(' · ');
}

String watchPartyRoomTitle(AppLocalizations l10n, MoonbaseRoomSummary room) =>
    watchPartyTitleOf(
      title: room.contentTitle,
      type: room.contentType,
      seriesName: room.seriesName,
      season: room.season,
      episode: room.episode,
    ) ??
    l10n.watchPartyHostsParty(room.hostName);

/// Joins a room from Moonbase's list, asking for its PIN when it has one,
/// then opens it. Answers whether it joined.
Future<bool> joinListedRoom(
  BuildContext context,
  MoonbaseRoomSummary room,
) async {
  final manager = GetIt.instance<SiloWatchPartyManager>();
  final navigator = Navigator.of(context);
  final l10n = AppLocalizations.of(context);
  // The Watch Parties screen turns into the room by itself.
  void open() {
    if (manager.roomScreensOpen == 0 && navigator.mounted) {
      unawaited(navigator.push(_roomRoute()));
    }
  }

  if (manager.room?.roomId == room.roomId) {
    open();
    return true;
  }
  String? pin;
  if (room.hasPin) {
    pin = await askWatchPartyPin(context);
    if (pin == null) return false;
  }
  var joined = await manager.join('', roomId: room.roomId, pin: pin);
  // The tile that asked can be rebuilt away by the error the join raised
  // (a room that got a PIN after the list loaded), so the prompt hangs off
  // the navigator instead.
  while (!joined &&
      (manager.errorCode == 'pin_required' ||
          manager.errorCode == 'wrong_pin')) {
    if (!navigator.mounted) return false;
    pin = await askWatchPartyPin(
      navigator.context,
      error: manager.errorCode == 'wrong_pin' ? l10n.watchPartyWrongPin : null,
    );
    if (pin == null) return false;
    joined = await manager.join('', roomId: room.roomId, pin: pin);
  }
  if (joined) {
    open();
  } else if (manager.roomScreensOpen == 0 && navigator.mounted) {
    // Off the Watch Parties screen nothing else shows why.
    final error =
        watchPartyErrorText(l10n, manager.errorCode) ?? manager.error;
    if (error != null) {
      ScaffoldMessenger.maybeOf(navigator.context)
          ?.showSnackBar(SnackBar(content: Text(error)));
    }
  }
  return joined;
}

/// Joins a SyncPlay group from the list, then shows SyncPlay's own screen.
Future<void> joinSyncPlayGroup(
  BuildContext context,
  SyncPlayGroupInfo group,
) async {
  final syncPlay = GetIt.instance<SyncPlayManager>();
  final navigator = Navigator.of(context);
  await confirmSyncPlayJoin(context, syncPlay, () async {
    await syncPlay.joinGroup(group.groupId);
  });
  if (syncPlay.state.enabled && navigator.mounted) {
    unawaited(
      navigator.push(
        MaterialPageRoute<void>(builder: (_) => const SyncPlayScreen()),
      ),
    );
  }
}

Route<void> _roomRoute() =>
    MaterialPageRoute<void>(builder: (_) => const SiloWatchPartyScreen());

/// Asks for a room PIN, 4 to 8 digits. [allowOff] adds a way to drop it.
/// Answers null when canceled, and an empty string for Off.
Future<String?> askWatchPartyPin(
  BuildContext context, {
  String? error,
  bool allowOff = false,
}) => showFocusRestoringDialog<String>(
  context: context,
  builder: (_) => _PinDialog(error: error, allowOff: allowOff),
);

class _PinDialog extends StatefulWidget {
  const _PinDialog({this.error, this.allowOff = false});

  final String? error;
  final bool allowOff;

  @override
  State<_PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends State<_PinDialog> {
  final _controller = TextEditingController();
  final _focus = FocusNode(debugLabel: 'watch_party_pin');
  late String? _error = widget.error;

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _submit() {
    final pin = _controller.text.trim();
    if (!RegExp(r'^\d{4,8}$').hasMatch(pin)) {
      setState(() => _error = AppLocalizations.of(context).watchPartyPinDigits);
      return;
    }
    Navigator.of(context).pop(pin);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.watchPartyRoomPin),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TvAwareField(
            controller: _controller,
            focusNode: _focus,
            hint: l10n.watchPartyPinDigits,
            numeric: true,
            autofocus: true,
            onSubmitted: _submit,
          ),
          if (_error case final error?) ...[
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ],
      ),
      actions: [
        if (widget.allowOff)
          TextButton(
            onPressed: () => Navigator.of(context).pop(''),
            child: Text(l10n.off),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(onPressed: _submit, child: Text(l10n.ok)),
      ],
    );
  }
}

/// Moonbase's rooms, and SyncPlay's groups beside them on Jellyfin, each
/// with a Join button. Looks again whenever it opens.
class WatchPartyRoomList extends StatefulWidget {
  const WatchPartyRoomList({super.key});

  @override
  State<WatchPartyRoomList> createState() => _WatchPartyRoomListState();
}

class _WatchPartyRoomListState extends State<WatchPartyRoomList> {
  final _rooms = GetIt.instance<WatchPartyRoomsService>();

  @override
  void initState() {
    super.initState();
    unawaited(_rooms.refresh());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: _rooms,
      builder: (context, _) {
        final labels = _labelsRoomKinds;
        final count = _rooms.rooms.length + _rooms.groups.length;
        return _Section(
          title: PlatformDetection.isTV
              ? l10n.watchPartyCountOnServer(count)
              : l10n.watchPartyOnThisServer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (count == 0)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    l10n.watchPartyRoomsEmpty,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              for (final room in _rooms.rooms)
                _RoomRow(
                  chips: [
                    if (labels)
                      WatchPartyChip(label: l10n.watchParty, accent: true),
                    if (room.hasPin)
                      WatchPartyChip(
                        label: l10n.siloPinHint,
                        icon: Icons.lock_outline_rounded,
                      ),
                  ],
                  title: watchPartyRoomTitle(l10n, room),
                  subtitle: watchPartyRoomLine(l10n, room),
                  posterId: room.selectedContentId,
                  onJoin: () => joinListedRoom(context, room),
                ),
              for (final group in _rooms.groups)
                _RoomRow(
                  chips: [if (labels) WatchPartyChip(label: l10n.syncPlay)],
                  title: group.groupName ?? l10n.syncPlayGroupFallbackName,
                  subtitle: [
                    syncPlayServerStateLabel(group.state?.serverValue, l10n),
                    l10n.watchPartyWatchingCount(group.participants.length),
                  ].join(' · '),
                  onJoin: () => joinSyncPlayGroup(context, group),
                ),
              const SizedBox(height: 8),
              Text(
                l10n.watchPartyRoomsHint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RoomRow extends StatelessWidget {
  const _RoomRow({
    required this.chips,
    required this.title,
    required this.subtitle,
    required this.onJoin,
    this.posterId,
  });

  final List<Widget> chips;
  final String title;
  final String subtitle;
  final String? posterId;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _Poster(contentId: posterId, width: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chips.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Wrap(spacing: 6, children: chips),
                  ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          FilledButton.tonal(
            style: _focusRing,
            onPressed: onJoin,
            child: Text(l10n.syncPlayJoin),
          ),
        ],
      ),
    );
  }
}

/// The room code and how to pass it on: a QR code of the invite link on TV,
/// which has no share sheet, so it can move to the host's phone, else Copy
/// invite link.
class WatchPartyInvite extends StatelessWidget {
  const WatchPartyInvite({
    super.key,
    required this.room,
    this.invite,
    this.copyFocus,
  });

  final SiloRoom room;
  final Uri? invite;
  final FocusNode? copyFocus;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final code = MoonbaseWatchPartyApi.displayCode(room.code);
    final muted = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final codeText = Row(
      children: [
        Flexible(
          child: SelectableText(
            code,
            style: theme.textTheme.displaySmall?.copyWith(
              letterSpacing: 4,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          focusNode: copyFocus,
          tooltip: l10n.copy,
          icon: const Icon(Icons.copy_rounded),
          onPressed: () => Clipboard.setData(ClipboardData(text: room.code)),
        ),
      ],
    );
    final link = invite;
    if (PlatformDetection.isTV && link != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: QrImageView(data: link.toString(), size: 148),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.watchPartySendInvite,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(l10n.watchPartyScanInvite, style: muted),
                const SizedBox(height: 12),
                codeText,
              ],
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.watchPartyRoomCode,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        codeText,
        if (link != null) ...[
          const SizedBox(height: 4),
          OutlinedButton.icon(
            icon: const Icon(Icons.link_rounded),
            label: Text(l10n.watchPartyCopyInvite),
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              await Clipboard.setData(ClipboardData(text: link.toString()));
              messenger.showSnackBar(
                SnackBar(content: Text(l10n.watchPartyInviteCopied)),
              );
            },
          ),
          const SizedBox(height: 6),
          Text(l10n.watchPartyInviteHint, style: muted),
        ],
      ],
    );
  }
}

/// Who is in a Moonbase room and what each is doing, with Make host and
/// Remove for the host.
class WatchPartyPeople extends StatefulWidget {
  const WatchPartyPeople({super.key, required this.room, this.dense = false});

  final SiloRoom room;
  final bool dense;

  @override
  State<WatchPartyPeople> createState() => _WatchPartyPeopleState();
}

class _WatchPartyPeopleState extends State<WatchPartyPeople> {
  // Where TV focus goes after Remove, so a second Select can't remove the
  // next member too. Up and Down leave it like any other control.
  final _listFocus = FocusNode(
    debugLabel: 'watch_party_people',
    skipTraversal: true,
  );

  @override
  void dispose() {
    _listFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final manager = GetIt.instance<SiloWatchPartyManager>();
    final room = widget.room;
    final dense = widget.dense;
    return Focus(
      focusNode: _listFocus,
      onFocusChange: (_) => setState(() {}),
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: _listFocus.hasPrimaryFocus
            ? BoxDecoration(
                border: Border.all(color: AppColorScheme.accent, width: 2),
                borderRadius: BorderRadius.circular(8),
              )
            : const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final member in room.members)
              Padding(
                // Keyed, so a removed member's buttons go with them instead of
                // passing their focus to whoever moves up into the row.
                key: ValueKey(member.profileId),
                padding: EdgeInsets.symmetric(vertical: dense ? 4 : 6),
                child: Row(
                  children: [
                    ClipOval(
                      child: UserAvatarImage(
                        url: memberAvatarUrl(member),
                        size: 36,
                        fallback: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColorScheme.accent,
                          foregroundColor: AppColorScheme.onAccent,
                          child: Text(
                            member.displayName.isEmpty
                                ? '?'
                                : member.displayName.characters.first
                                      .toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            [
                              member.isSelf
                                  ? l10n.syncPlayParticipantYou
                                  : member.displayName,
                              if (member.isHost) l10n.watchPartyHost,
                            ].join(' · '),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (_statusOf(member) case final status?)
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: watchPartyStatusColor(status),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  watchPartyStatusLabel(l10n, status) ?? status,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (room.isHost && !member.isSelf) ...[
                      IconButton(
                        style: _focusRing,
                        tooltip: l10n.watchPartyMakeHost,
                        icon: const Icon(Icons.workspace_premium_outlined),
                        onPressed: manager.busy
                            ? null
                            : () => manager.makeHost(member.profileId),
                      ),
                      IconButton(
                        style: _focusRing,
                        tooltip: l10n.remove,
                        icon: const Icon(Icons.person_remove_outlined),
                        onPressed: () {
                          if (PlatformDetection.isTV) _listFocus.requestFocus();
                          manager.removeMember(member.profileId);
                        },
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// A disconnected member is shown as not watching.
  static String? _statusOf(SiloRoomMember member) =>
      member.connected ? member.status : 'not_watching';
}

/// The host's room settings Moonbase adds: everyone in control and a PIN.
class WatchPartyHostSettings extends StatelessWidget {
  const WatchPartyHostSettings({super.key, required this.room});

  final SiloRoom room;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final manager = GetIt.instance<SiloWatchPartyManager>();
    final busy = manager.busy;
    return Column(
      children: [
        if (manager.moonbaseConfig?.everyoneControlAllowed != false)
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.groups_2_outlined),
            title: Text(l10n.watchPartyEveryoneControls),
            subtitle: Text(l10n.watchPartyEveryoneControlsHint),
            value: room.guestControlPolicy == 'everyone',
            onChanged: busy ? null : manager.setEveryoneControls,
          ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.lock_outline_rounded),
          title: Text(l10n.watchPartyRoomPin),
          subtitle: Text(l10n.watchPartyRoomPinHint),
          trailing: Text(room.hasPin ? l10n.siloPinHint : l10n.off),
          onTap: busy
              ? null
              : () async {
                  final pin = await askWatchPartyPin(
                    context,
                    allowOff: room.hasPin,
                  );
                  if (pin == null) return;
                  await manager.setPin(pin.isEmpty ? null : pin);
                },
        ),
      ],
    );
  }
}

/// Leave, naming who takes over, and End for everyone for the host. A guest
/// only leaves.
class WatchPartyExitButtons extends StatelessWidget {
  const WatchPartyExitButtons({super.key, required this.room, this.onDone});

  final SiloRoom room;
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final manager = GetIt.instance<SiloWatchPartyManager>();
    final next = room.members
        .where((m) => !m.isSelf && m.connected)
        .firstOrNull;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: () {
            onDone?.call();
            manager.leave();
          },
          icon: const Icon(Icons.logout_rounded),
          label: Text(
            room.isHost && next != null
                ? l10n.watchPartyLeaveHandsOver(next.displayName)
                : l10n.watchPartyLeave,
          ),
        ),
        if (room.isHost)
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.colorScheme.error,
              side: BorderSide(
                color: theme.colorScheme.error.withValues(alpha: 0.5),
              ),
            ),
            onPressed: manager.busy
                ? null
                : () {
                    onDone?.call();
                    unawaited(manager.end());
                  },
            icon: const Icon(Icons.close_rounded),
            label: Text(l10n.watchPartyEnd),
          ),
      ],
    );
  }
}

/// Asks for a chat message, with the TV keyboard on TV. Null when canceled.
Future<String?> askWatchPartyMessage(BuildContext context) =>
    showFocusRestoringDialog<String>(
      context: context,
      builder: (_) => const _MessageDialog(),
    );

class _MessageDialog extends StatefulWidget {
  const _MessageDialog();

  @override
  State<_MessageDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<_MessageDialog> {
  final _controller = TextEditingController();
  final _focus = FocusNode(debugLabel: 'watch_party_message');

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    Navigator.of(context).pop(text.isEmpty ? null : text);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.watchPartyChat),
      content: _TvAwareField(
        controller: _controller,
        focusNode: _focus,
        hint: l10n.watchPartySendToParty,
        autofocus: true,
        onSubmitted: _send,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(onPressed: _send, child: Text(l10n.send)),
      ],
    );
  }
}
