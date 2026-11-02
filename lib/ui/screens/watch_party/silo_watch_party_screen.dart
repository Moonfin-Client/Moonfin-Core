import 'dart:async';
import 'dart:math' as math;

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_silo/server_silo.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../../watch_party/silo_watch_party_manager.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/user_avatar_image.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';

/// Silo's Watch Party: start a room or join one with its code, then see who
/// is in it and, as host, start or stop what everyone watches. Jellyfin
/// servers get [SyncPlayScreen] instead.
class SiloWatchPartyScreen extends StatefulWidget {
  const SiloWatchPartyScreen({super.key});

  @override
  State<SiloWatchPartyScreen> createState() => _SiloWatchPartyScreenState();
}

class _SiloWatchPartyScreenState extends State<SiloWatchPartyScreen> {
  final _manager = GetIt.instance<SiloWatchPartyManager>();
  final _codeController = TextEditingController();
  final _codeFocus = FocusNode(debugLabel: 'watch_party_code');
  late final Future<bool> _supported = _manager.inRoom
      ? Future.value(true)
      : _manager.serverSupportsRooms();

  @override
  void initState() {
    super.initState();
    _manager.roomScreenOpened();
  }

  @override
  void dispose() {
    _manager.roomScreenClosed();
    _codeController.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  Future<void> _join() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) return;
    if (await _manager.join(code)) _codeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: AppBar(title: Text(l10n.watchParty)),
        body: FutureBuilder<bool>(
          future: _supported,
          builder: (context, supported) {
            if (supported.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (supported.data != true) {
              return _Message(message: l10n.watchPartyUnavailable);
            }
            return ListenableBuilder(
              listenable: _manager,
              builder: (context, _) => _buildBody(context, l10n),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations l10n) {
    final room = _manager.room;
    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV && room == null ? _codeFocus : null,
      child: LayoutBuilder(
        builder: (context, constraints) => ListView(
          // A column, not a stretch across a TV or desktop window.
          padding: EdgeInsets.symmetric(
            horizontal: math.max(16, (constraints.maxWidth - _maxWidth) / 2),
            vertical: 16,
          ),
          children: [
            if (_manager.error case final error?) _Banner(message: error),
            if (room == null && _manager.endedReason != null)
              _Banner(
                message: _manager.endedReason == 'closed'
                    ? l10n.watchPartyEnded
                    : _manager.endedReason!,
              ),
            if (room == null) ..._buildEntry(context, l10n),
            if (room != null) ..._buildRoom(context, l10n, room),
          ],
        ),
      ),
    );
  }

  static const double _maxWidth = 720;

  List<Widget> _buildEntry(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final busy = _manager.busy;
    return [
      _Section(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  foregroundColor: theme.colorScheme.onPrimaryContainer,
                  child: const Icon(Icons.groups_rounded),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    l10n.watchParty,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              l10n.watchPartyPickTitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              style: _primaryButton,
              onPressed: busy ? null : () => _manager.create(),
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.watchPartyStart),
            ),
          ],
        ),
      ),
      _Section(
        title: l10n.syncPlayJoin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCodeField(context, l10n),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.tonalIcon(
                onPressed: busy ? null : _join,
                icon: const Icon(Icons.login_rounded),
                label: Text(l10n.syncPlayJoin),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildCodeField(BuildContext context, AppLocalizations l10n) =>
      _TvAwareField(
        controller: _codeController,
        focusNode: _codeFocus,
        hint: l10n.watchPartyCodeOrLink,
        capitalize: true,
        onSubmitted: _join,
      );

  List<Widget> _buildRoom(
    BuildContext context,
    AppLocalizations l10n,
    SiloRoom room,
  ) {
    final theme = Theme.of(context);
    final busy = _manager.busy;
    final connectedCount = room.members.where((m) => m.connected).length;
    return [
      _Section(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.watchPartyRoomCode,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                _StatusPill(room: room, connected: _manager.connected),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Flexible(
                  child: SelectableText(
                    room.code,
                    style: theme.textTheme.displaySmall?.copyWith(
                      letterSpacing: 6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: l10n.copy,
                  icon: const Icon(Icons.copy_rounded),
                  onPressed: () =>
                      Clipboard.setData(ClipboardData(text: room.code)),
                ),
              ],
            ),
            Text(
              l10n.watchPartyShareCode,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (_manager.inviteUri case final invite?)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.link_rounded),
                  label: Text(l10n.watchPartyCopyInvite),
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    await Clipboard.setData(
                      ClipboardData(text: invite.toString()),
                    );
                    messenger.showSnackBar(
                      SnackBar(content: Text(l10n.watchPartyInviteCopied)),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            Text(
              l10n.syncPlayParticipantCount(connectedCount),
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                for (final member in room.members)
                  _MemberAvatar(
                    member: member,
                    offlineLabel: l10n.watchPartyOffline,
                  ),
              ],
            ),
          ],
        ),
      ),
      _Section(
        child: room.selectedContentId != null
            ? _ItemHero(room: room, busy: busy, manager: _manager)
            : room.isVoting && !room.isPlaying
            ? _VotePanel(manager: _manager, room: room)
            : _EmptyStage(
                message: room.isHost
                    ? l10n.watchPartyPickTitle
                    : l10n.watchPartyWaitingForHost,
              ),
      ),
      if (room.isVoting && !room.isPlaying && room.selectedContentId != null)
        _Section(
          child: _VotePanel(manager: _manager, room: room),
        ),
      if (room.isHost)
        _Section(
          title: l10n.watchPartyRoomSettings,
          child: Column(
            children: [
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                secondary: const Icon(Icons.play_circle_outline_rounded),
                title: Text(l10n.watchPartyGuestsCanPause),
                value: room.guestControlPolicy == 'guest_play_pause',
                onChanged: busy ? null : _manager.setGuestsCanPause,
              ),
              // Silo switches modes only in the lobby.
              if (!room.isPlaying)
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.how_to_vote_outlined),
                  title: Text(l10n.watchPartyLetEveryoneVote),
                  value: room.isVoting,
                  onChanged: busy ? null : _manager.setVoting,
                ),
            ],
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Center(
          child: room.isHost
              ? OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                    side: BorderSide(
                      color: theme.colorScheme.error.withValues(alpha: 0.5),
                    ),
                  ),
                  onPressed: busy ? null : _manager.end,
                  icon: const Icon(Icons.close_rounded),
                  label: Text(l10n.watchPartyEnd),
                )
              : OutlinedButton.icon(
                  onPressed: _manager.leave,
                  icon: const Icon(Icons.logout_rounded),
                  label: Text(l10n.syncPlayLeaveGroup),
                ),
        ),
      ),
    ];
  }
}

/// The accent fill the details page gives its Play button, for the one
/// action each state of the room leads with.
/// A getter, so a theme change reaches it.
ButtonStyle get _primaryButton => FilledButton.styleFrom(
  backgroundColor: AppColorScheme.accent,
  foregroundColor: AppColorScheme.onAccent,
);

/// A rounded surface with an optional heading, the room screen's building
/// block.
class _Section extends StatelessWidget {
  const _Section({required this.child, this.title});

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title case final title?) ...[
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}

/// Where the room is: in the lobby, waiting, paused or playing, or
/// reconnecting.
class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.room, required this.connected});

  final SiloRoom room;
  final bool connected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final (label, color, icon) = !connected
        ? (l10n.watchPartyReconnecting, scheme.error, Icons.sync_rounded)
        : !room.isPlaying
        ? (
            l10n.watchPartyLobby,
            scheme.onSurfaceVariant,
            Icons.weekend_outlined,
          )
        : switch (room.playbackState) {
            'waiting' => (
              l10n.syncPlayStateWaiting,
              scheme.tertiary,
              Icons.hourglass_top_rounded,
            ),
            'paused' => (
              l10n.syncPlayStatePaused,
              scheme.secondary,
              Icons.pause_rounded,
            ),
            _ => (
              l10n.syncPlayStatePlaying,
              scheme.primary,
              Icons.play_arrow_rounded,
            ),
          };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium
                ?.copyWith(color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// A member as an initial in a circle, with a dot for whether they're
/// connected and a star for the host.
class _MemberAvatar extends StatelessWidget {
  const _MemberAvatar({required this.member, required this.offlineLabel});

  final SiloRoomMember member;
  final String offlineLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final name = member.displayName.trim();
    final initial = name.isEmpty ? '?' : name.characters.first.toUpperCase();
    final avatar = Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
          child: UserAvatarImage(
            url: memberAvatarUrl(member),
            size: 48,
            fallback: CircleAvatar(
              radius: 24,
              backgroundColor: member.isSelf
                  ? scheme.primaryContainer
                  : scheme.surfaceContainerHighest,
              foregroundColor: member.isSelf
                  ? scheme.onPrimaryContainer
                  : scheme.onSurface,
              child: Text(
                initial,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -1,
          bottom: -1,
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: member.connected
                  ? const Color(0xFF3DDC84)
                  : scheme.outline,
              shape: BoxShape.circle,
              border: Border.all(color: theme.cardColor, width: 2),
            ),
          ),
        ),
        if (member.isHost)
          Positioned(
            right: -4,
            top: -4,
            child: Icon(Icons.star_rounded, size: 18, color: scheme.primary),
          ),
      ],
    );
    return Opacity(
      opacity: member.connected ? 1 : 0.55,
      child: Tooltip(
        message: member.connected ? name : '$name ($offlineLabel)',
        child: SizedBox(
          width: 64,
          child: Column(
            children: [
              avatar,
              const SizedBox(height: 6),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A member's profile avatar, for [UserAvatarImage] (presets are SVG,
/// uploads bitmaps). A member whose app hasn't shared one, through a
/// Moonbase that can keep it, shows their initials.
String? memberAvatarUrl(SiloRoomMember member) {
  if (member.profileId.isEmpty) return null;
  final manager = GetIt.instance<SiloWatchPartyManager>();
  // The link each member's app shares through Moonbase, else what the
  // signed-in account can resolve itself (its own profiles).
  final shared = manager.avatarUrlFor(member.profileId);
  if (shared != null) return shared;
  final url = manager.activeSiloClient?.imageApi.getUserImageUrl(
    member.profileId,
  );
  return url == null || url.isEmpty ? null : url;
}

/// Nothing picked yet.
class _EmptyStage extends StatelessWidget {
  const _EmptyStage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            Icons.movie_filter_outlined,
            size: 36,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A title's poster from the server, or a placeholder. [fallbackId]'s
/// poster stands in when [contentId] has none.
class _Poster extends StatelessWidget {
  const _Poster({required this.contentId, required this.width, this.fallbackId});

  final String? contentId;
  final String? fallbackId;
  final double width;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final placeholder = ColoredBox(
      color: scheme.surfaceContainerHighest,
      child: Icon(
        Icons.movie_outlined,
        color: scheme.onSurfaceVariant,
        size: width / 2.5,
      ),
    );
    final id = contentId;
    final url = id == null
        ? null
        : GetIt.instance<SiloWatchPartyManager>()
            .activeSiloClient
            ?.imageApi
            .getPrimaryImageUrl(id, maxHeight: (width * 4.5).round());
    final fallback = fallbackId;
    return ClipRRect(
      borderRadius: BorderRadius.circular(width > 60 ? 10 : 6),
      child: SizedBox(
        width: width,
        height: width * 1.5,
        child: url == null
            ? placeholder
            : BoundedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => fallback == null
                    ? placeholder
                    : _Poster(contentId: fallback, width: width),
              ),
      ),
    );
  }
}

/// The staged or playing title: poster, name, the member's subtitles, and
/// the play controls this member has.
class _ItemHero extends StatefulWidget {
  const _ItemHero({
    required this.room,
    required this.busy,
    required this.manager,
  });

  final SiloRoom room;
  final bool busy;
  final SiloWatchPartyManager manager;

  @override
  State<_ItemHero> createState() => _ItemHeroState();
}

class _ItemHeroState extends State<_ItemHero> {
  late Future<Map<String, dynamic>?> _item = widget.manager.selectedItem();

  @override
  void didUpdateWidget(_ItemHero old) {
    super.didUpdateWidget(old);
    if (old.room.selectedContentId != widget.room.selectedContentId) {
      _item = widget.manager.selectedItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final room = widget.room;
    final manager = widget.manager;
    final busy = widget.busy;
    return FutureBuilder<Map<String, dynamic>?>(
      future: _item,
      builder: (context, snapshot) {
        final item = snapshot.data;
        final series = item?['SeriesName'];
        final name = item?['Name'] as String? ?? '';
        final hasSeries = series is String && series.isNotEmpty;
        // An episode's still is landscape; its season's poster fits the
        // portrait slot, then its series'. Nothing until the item is known,
        // so the still never shows first.
        final isEpisode = item?['Type'] == 'Episode';
        final posterId = item == null
            ? null
            : isEpisode
            ? (item['SeasonId'] ?? item['SeriesId']) as String?
            : room.selectedContentId;
        final posterFallback = isEpisode
            ? (item?['SeriesId'] as String?)
            : null;
        final detail = [
          if (item?['ParentIndexNumber'] case final int season when hasSeries)
            if (item?['IndexNumber'] case final int episode)
              'S$season:E$episode',
          if (item?['ProductionYear'] case final int year) '$year',
        ].join(' · ');
        final actions = <Widget>[
          if (room.isPlaying)
            FilledButton.icon(
              style: _primaryButton,
              onPressed: manager.openPlayer,
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(l10n.syncPlayPlayNow),
            ),
          if (room.isHost && room.isStaged)
            FilledButton.icon(
              style: _primaryButton,
              onPressed: busy ? null : manager.startPlayback,
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(l10n.watchPartyStartForEveryone),
            ),
          if (room.isHost && room.isPlaying)
            OutlinedButton.icon(
              onPressed: busy ? null : manager.stopPlayback,
              icon: const Icon(Icons.stop_rounded),
              label: Text(l10n.watchPartyBackToLobby),
            ),
          if (item != null)
            _SubtitleButton(
              item: item,
              fileId: room.selectedFileId,
              isHost: room.isHost,
            ),
        ];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Poster(
                  contentId: posterId,
                  fallbackId: posterFallback == posterId ? null : posterFallback,
                  width: 96,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.isPlaying
                            ? l10n.syncPlayStatePlaying
                            : l10n.watchPartyUpNextLabel,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        hasSeries ? series : name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (hasSeries) ...[
                        const SizedBox(height: 2),
                        Text(name, style: theme.textTheme.titleSmall),
                      ],
                      if (detail.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          detail,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            if (actions.isNotEmpty) ...[
              const SizedBox(height: 16),
              Wrap(spacing: 8, runSpacing: 8, children: actions),
            ],
          ],
        );
      },
    );
  }
}

/// The vote: the movies up for it with their tallies, a vote toggle for
/// everyone, and for the host a movie search to add more and a play
/// button on each.
class _VotePanel extends StatefulWidget {
  const _VotePanel({required this.manager, required this.room});

  final SiloWatchPartyManager manager;
  final SiloRoom room;

  @override
  State<_VotePanel> createState() => _VotePanelState();
}

class _VotePanelState extends State<_VotePanel> {
  final _search = TextEditingController();
  final _searchFocus = FocusNode(debugLabel: 'watch_party_search');
  String _lastSearch = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    // The TV keyboard has no change callback; the controller covers both.
    _search.addListener(() {
      if (_search.text == _lastSearch) return;
      _lastSearch = _search.text;
      _onSearchChanged(_search.text);
      // Typing switches between the results and the list.
      setState(() {});
    });
  }

  List<Map<String, dynamic>> _results = const [];
  int _query = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged(String text) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () async {
      final query = ++_query;
      List<Map<String, dynamic>> results;
      try {
        results = await widget.manager.searchMovies(text);
      } catch (_) {
        results = const [];
      }
      if (mounted && query == _query) setState(() => _results = results);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final manager = widget.manager;
    final isHost = widget.room.isHost;
    final suggestions = manager.suggestions;
    final suggested = {for (final s in suggestions) s.contentId};
    final searching = isHost && _search.text.trim().isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isHost ? l10n.watchPartyVoteHelp : l10n.watchPartyGuestVoteHelp,
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        // The search stays on top; its results stand in for the list until
        // a movie is added or the search is cleared.
        if (isHost) ...[
          _TvAwareField(
            controller: _search,
            focusNode: _searchFocus,
            hint: l10n.watchPartySearchMovies,
            icon: Icons.search,
          ),
          const SizedBox(height: 8),
        ],
        if (searching) ...[
          for (final movie in _results)
            if (!suggested.contains(movie['Id']))
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: _Poster(contentId: movie['Id'] as String, width: 40),
                title: Text(movie['Name'] as String? ?? ''),
                subtitle: movie['ProductionYear'] == null
                    ? null
                    : Text('${movie['ProductionYear']}'),
                trailing: TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: Text(l10n.add),
                  onPressed: () => _add(movie),
                ),
              ),
        ] else ...[
          if (suggestions.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(l10n.watchPartyNoSuggestions),
            ),
          for (final (index, suggestion) in suggestions.indexed)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: _Poster(contentId: suggestion.contentId, width: 40),
              // The one ahead, once anyone has voted.
              title: Row(
                children: [
                  if (index == 0 && suggestion.voteCount > 0) ...[
                    Icon(
                      Icons.emoji_events_rounded,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                  ],
                  Flexible(child: Text(suggestion.title)),
                ],
              ),
              subtitle: Text(
                [
                  if (suggestion.subtitle.isNotEmpty) suggestion.subtitle,
                  l10n.watchPartyVoteCount(suggestion.voteCount),
                ].join(' · '),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: l10n.watchPartyVoteCount(1),
                    icon: Icon(
                      suggestion.votedByMe
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
                    ),
                    color: suggestion.votedByMe
                        ? theme.colorScheme.primary
                        : null,
                    onPressed: () =>
                        manager.vote(suggestion, !suggestion.votedByMe),
                  ),
                  if (isHost) ...[
                    IconButton(
                      tooltip: l10n.select,
                      icon: const Icon(Icons.play_arrow_rounded),
                      onPressed: manager.busy
                          ? null
                          : () => manager.pickSuggestion(suggestion),
                    ),
                    IconButton(
                      tooltip: l10n.remove,
                      icon: const Icon(Icons.close),
                      onPressed: () => manager.removeSuggestion(suggestion),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ],
    );
  }

  /// Adds [movie] to the vote, then leaves the search for the list.
  Future<void> _add(Map<String, dynamic> movie) async {
    if (!await widget.manager.suggestMovie(movie)) return;
    _search.clear();
    _results = const [];
    if (mounted) setState(() {});
  }
}

/// A text field that takes Moonfin's TV keyboard on TV (opened with
/// select, closed with back) and a plain field elsewhere.
class _TvAwareField extends StatefulWidget {
  const _TvAwareField({
    required this.controller,
    required this.focusNode,
    required this.hint,
    this.icon,
    this.capitalize = false,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final IconData? icon;
  final bool capitalize;
  final VoidCallback? onSubmitted;

  @override
  State<_TvAwareField> createState() => _TvAwareFieldState();
}

class _TvAwareFieldState extends State<_TvAwareField> {
  final _tvKey = GlobalKey<CustomTVTextFieldState>();

  @override
  void initState() {
    super.initState();
    widget.focusNode.onKeyEvent = _onKey;
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (!PlatformDetection.isTV) return KeyEventResult.ignored;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final keyboard = _tvKey.currentState;
    if (event.logicalKey.isBackKey && (keyboard?.isKeyboardVisible ?? false)) {
      keyboard?.closeKeyboard();
      node.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      keyboard?.openKeyboard();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    if (!PlatformDetection.isTV) {
      return TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textCapitalization: widget.capitalize
            ? TextCapitalization.characters
            : TextCapitalization.none,
        decoration: InputDecoration(
          prefixIcon: widget.icon == null ? null : Icon(widget.icon),
          labelText: widget.hint,
          border: const OutlineInputBorder(),
        ),
        onSubmitted: (_) => widget.onSubmitted?.call(),
      );
    }
    final colorScheme = Theme.of(context).colorScheme;
    return Focus(
      focusNode: widget.focusNode,
      child: ListenableBuilder(
        listenable: widget.focusNode,
        builder: (_, _) {
          final focused = widget.focusNode.hasFocus;
          return CustomTVTextField(
            key: _tvKey,
            controller: widget.controller,
            isFocused: focused,
            inputPurpose: InputPurpose.text,
            keyboardStyle: GetIt.instance<UserPreferences>().get(
              UserPreferences.keyboardStyle,
            ),
            hint: widget.hint,
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
            onFieldSubmitted: (_) => widget.onSubmitted?.call(),
          );
        },
      ),
    );
  }
}

/// The host's subtitles for everyone, as a button showing the choice; a
/// member sees the choice. Members can still turn their own on or off in
/// the player. Absent without Moonbase to keep the choice. Audio isn't
/// offered: everyone hears the file's default track.
class _SubtitleButton extends StatelessWidget {
  const _SubtitleButton({
    required this.item,
    required this.fileId,
    required this.isHost,
  });

  final Map<String, dynamic> item;
  final String? fileId;
  final bool isHost;

  String _label(Map<String, dynamic> stream) =>
      stream['DisplayTitle'] as String? ??
      stream['Language'] as String? ??
      '#${stream['Index']}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final manager = GetIt.instance<SiloWatchPartyManager>();
    if (!manager.groupSubtitlesSupported) return const SizedBox.shrink();
    final source = SiloWatchPartyManager.partySource(item, fileId);
    final tracks = SiloWatchPartyManager.streamsOf(source, 'Subtitle');
    final choice = manager.groupSubtitle;
    final current = SiloWatchPartyManager.subtitleIndexFor(choice, source);
    final currentLabel = switch (current) {
      null => l10n.watchPartyOwnSubtitles,
      -1 => l10n.off,
      _ =>
        tracks.where((t) => t['Index'] == current).map(_label).firstOrNull ??
            l10n.watchPartyOwnSubtitles,
    };
    final label = '${l10n.watchPartyGroupSubtitles}: $currentLabel';
    if (!isHost) {
      if (choice == null) return const SizedBox.shrink();
      return Chip(
        avatar: const Icon(Icons.subtitles_outlined, size: 18),
        label: Text(label),
      );
    }
    if (tracks.isEmpty) return const SizedBox.shrink();
    return OutlinedButton.icon(
      icon: const Icon(Icons.subtitles_outlined),
      label: Text(label),
      onPressed: () async {
        // (track, off, label)
        final options = <(Map<String, dynamic>?, bool, String)>[
          (null, false, l10n.watchPartyOwnSubtitles),
          (null, true, l10n.off),
          for (final t in tracks) (t, false, _label(t)),
        ];
        bool selected((Map<String, dynamic>?, bool, String) o) =>
            o.$2 ? current == -1 : (o.$1?['Index'] as int?) == current;
        final picked = await showDialog<(Map<String, dynamic>?, bool, String)>(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text(l10n.watchPartyGroupSubtitles),
            children: [
              for (final option in options)
                SimpleDialogOption(
                  onPressed: () => Navigator.of(context).pop(option),
                  child: Row(
                    children: [
                      Icon(
                        selected(option)
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(option.$3)),
                    ],
                  ),
                ),
            ],
          ),
        );
        if (picked != null) {
          await manager.setGroupSubtitle(picked.$1, off: picked.$2);
        }
      },
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cloud_off,
            size: 64,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}

class _Banner extends StatelessWidget {
  const _Banner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Card(
    color: Theme.of(context).colorScheme.errorContainer,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.info_outline),
          const SizedBox(width: 12),
          Expanded(child: Text(message)),
        ],
      ),
    ),
  );
}
