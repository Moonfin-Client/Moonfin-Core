part of 'achievements_screen.dart';

/// The green of the online dot, kept apart from the rarity hues.
const _onlineColor = Color(0xFF43A047);

/// The friends list from the Achievement Badges plugin, with requests, people
/// search, privacy and chat behind it.
///
/// It reads the list the service keeps for the nav badge, so opening it only
/// asks for a fresh copy instead of loading a second one.
class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final _service = GetIt.instance<AchievementsService>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final client = _client();
    if (client != null) await _service.refreshSocial(client);
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: l10n.friends,
      builder: (context) => ListenableBuilder(
        listenable: _service,
        builder: (context, _) => _buildBody(context, l10n),
      ),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations l10n) {
    final friends = _service.friends;
    if (friends == null) {
      if (_loading) return const Center(child: CircularProgressIndicator());
      return _RetryPanel(
        message: l10n.friendsLoadFailed,
        onRetry: () {
          setState(() => _loading = true);
          _refresh();
        },
      );
    }

    final online = friends.friends.where((f) => f.online).toList();
    final offline = friends.friends.where((f) => !f.online).toList();

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView(
        padding: _listPadding(context),
        children: [
          adaptiveListSection(
            children: [
              DpadListTile(
                autofocus: true,
                useSettingsIconShell: true,
                leading: const Icon(Icons.forum),
                trailing: const Icon(Icons.chevron_right),
                title: Text(l10n.friendsMessages),
                subtitle: Text(
                  l10n.friendsUnreadCount(_service.unreadMessageCount),
                ),
                onTap: () => context.pushSettingsScreen(const _ChatsScreen()),
              ),
              if (!friends.simpleMode) ...[
                DpadListTile(
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.group_add),
                  trailing: const Icon(Icons.chevron_right),
                  title: Text(l10n.friendsRequests),
                  subtitle: Text(
                    l10n.friendsRequestCount(friends.incoming.length),
                  ),
                  onTap: () =>
                      context.pushSettingsScreen(const _RequestsScreen()),
                ),
                DpadListTile(
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.person_search),
                  trailing: const Icon(Icons.chevron_right),
                  title: Text(l10n.friendsAdd),
                  subtitle: Text(l10n.friendsAddSubtitle),
                  onTap: () =>
                      context.pushSettingsScreen(const _FindPeopleScreen()),
                ),
              ],
              DpadListTile(
                useSettingsIconShell: true,
                leading: const Icon(Icons.privacy_tip),
                trailing: const Icon(Icons.chevron_right),
                title: Text(l10n.friendsPrivacy),
                subtitle: Text(l10n.friendsPrivacySubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const _SocialPrivacyScreen()),
              ),
            ],
          ),
          if (friends.friends.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.friendsNone),
            ),
          if (online.isNotEmpty) ...[
            SettingsSectionHeader(l10n.friendsOnline),
            adaptiveListSection(
              children: [for (final f in online) _FriendTile(friend: f)],
            ),
          ],
          if (offline.isNotEmpty) ...[
            SettingsSectionHeader(l10n.friendsOffline),
            adaptiveListSection(
              children: [for (final f in offline) _FriendTile(friend: f)],
            ),
          ],
        ],
      ),
    );
  }
}

/// A series episode reads better with its show in front.
String _mediaTitle(FriendMedia media) => media.seriesName == null
    ? media.name
    : '${media.seriesName} · ${media.name}';

String _friendStatus(AppLocalizations l10n, Friend friend) {
  final playing = friend.nowPlaying;
  if (friend.online && playing != null) {
    return l10n.friendsWatching(_mediaTitle(playing));
  }
  if (friend.online) return l10n.friendsOnline;
  final last = friend.lastWatched;
  if (last != null) return l10n.friendsLastWatched(_mediaTitle(last));
  final seen = friend.lastSeen;
  if (seen != null) return l10n.friendsLastSeen(relativeTimeLabel(l10n, seen));
  return l10n.friendsOffline;
}

String _initials(String name) {
  final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
  if (parts.isEmpty) return '?';
  return parts.take(2).map((p) => p.characters.first).join().toUpperCase();
}

Friend? _friendById(AchievementsService service, String userId) {
  for (final friend in service.friends?.friends ?? const <Friend>[]) {
    if (sameUserId(friend.userId, userId)) return friend;
  }
  return null;
}

/// Shows why a write failed. The plugin words most refusals itself.
bool _reportWrite(BuildContext context, SocialWrite<Object?> write) {
  if (write.ok) return true;
  final l10n = AppLocalizations.of(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(write.message ?? l10n.friendsActionFailed)),
  );
  return false;
}

void _say(BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

/// Asks which of [choices] to do. Null when the dialog is dismissed.
Future<T?> _choose<T>(
  BuildContext context, {
  required String title,
  required List<(String, T)> choices,
}) {
  final l10n = AppLocalizations.of(context);
  return showFocusRestoringDialog<T>(
    context: context,
    builder: (ctx) => AlertDialog.adaptive(
      title: Text(title),
      actions: [
        for (final (label, value) in choices)
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(ctx, value),
            child: Text(label),
          ),
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.cancel),
        ),
      ],
    ),
  );
}

/// A user's Jellyfin picture, or their initials when there is none. Jellyfin
/// serves these without a token.
class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    required this.userId,
    required this.name,
    this.online,
    this.radius = 20,
  });

  final String userId;
  final String name;

  /// Null leaves the presence dot off.
  final bool? online;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final url = _client()?.imageApi.getUserImageUrl(userId);
    final fallback = CircleAvatar(
      radius: radius,
      backgroundColor: _tintedSurface(AppColorScheme.accent),
      child: Text(
        _initials(name),
        style: TextStyle(
          color: AppColorScheme.accent,
          fontWeight: FontWeight.w600,
          fontSize: radius * 0.7,
        ),
      ),
    );
    final avatar = url == null
        ? fallback
        : ClipOval(
            child: SizedBox.square(
              dimension: radius * 2,
              child: Image.network(
                url,
                headers: serverImageHeaders,
                fit: BoxFit.cover,
                cacheWidth:
                    (radius * 2 * MediaQuery.devicePixelRatioOf(context))
                        .round(),
                errorBuilder: (_, _, _) => fallback,
              ),
            ),
          );

    final online = this.online;
    if (online == null) return avatar;
    final dot = radius * 0.55;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: -1,
          bottom: -1,
          child: Container(
            width: dot,
            height: dot,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: online
                  ? _onlineColor
                  : AppColorScheme.onSurface.withValues(alpha: 0.35),
              border: Border.all(color: AppColorScheme.surface, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

/// One person in a list here: a friend, a request, a search hit or a member.
class _PersonTile extends StatelessWidget {
  const _PersonTile({
    required this.userId,
    required this.name,
    this.subtitle,
    this.online,
    this.trailing,
    this.onTap,
  });

  final String userId;
  final String name;
  final String? subtitle;
  final bool? online;
  final Widget Function(bool highlighted)? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final onTap = this.onTap;
    return _AchievementRow(
      onTap: onTap,
      builder: (context, highlighted) {
        final subtitle = this.subtitle;
        return ListTile(
          leading: _UserAvatar(userId: userId, name: name, online: online),
          title: Text(name),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: _secondaryText(highlighted)),
                ),
          trailing: trailing?.call(highlighted),
          onTap: onTap == null ? null : _tileTap(onTap),
        );
      },
    );
  }
}

class _FriendTile extends StatelessWidget {
  const _FriendTile({required this.friend});

  final Friend friend;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final badges = friend.equipped.take(3).toList();
    return _PersonTile(
      userId: friend.userId,
      name: friend.userName,
      online: friend.online,
      subtitle: _friendStatus(l10n, friend),
      trailing: badges.isEmpty
          ? null
          : (highlighted) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final badge in badges)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(
                      achievementIcon(badge.icon),
                      size: 18,
                      color: _hueOn(_rarityColor(badge.rarity), highlighted),
                    ),
                  ),
              ],
            ),
      onTap: () => context.pushSettingsScreen(
        _FriendProfileScreen(userId: friend.userId, name: friend.userName),
      ),
    );
  }
}

/// Someone's card: what the leaderboard shows of them, and what can be done
/// with them.
class _FriendProfileScreen extends StatefulWidget {
  const _FriendProfileScreen({required this.userId, required this.name});

  final String userId;
  final String name;

  @override
  State<_FriendProfileScreen> createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<_FriendProfileScreen>
    with _LoadsOnOpen<_FriendProfileScreen> {
  final _service = GetIt.instance<AchievementsService>();
  PublicProfile? _profile;
  bool _blocked = false;
  bool _busy = false;

  @override
  Future<void> fetch(MediaServerClient client) async {
    final results = await Future.wait<Object?>([
      _service.fetchPublicProfile(client, widget.userId),
      _service.fetchBlocked(client),
    ]);
    _profile = results[0] as PublicProfile?;
    _blocked = (results[1] as List<String>).any(
      (id) => sameUserId(id, widget.userId),
    );
  }

  Future<void> _run(
    Future<void> Function(MediaServerClient client) action,
  ) async {
    final client = _client();
    if (client == null || _busy) return;
    setState(() => _busy = true);
    await action(client);
    if (mounted) setState(() => _busy = false);
  }

  void _message(AppLocalizations l10n) => _run((client) async {
    final id = await _service.openDirectChat(client, widget.userId);
    if (!mounted) return;
    if (id == null) {
      _say(context, l10n.friendsActionFailed);
      return;
    }
    await context.pushSettingsScreen(
      FriendChatScreen(
        conversationId: id,
        title: widget.name,
        otherUserId: widget.userId,
      ),
    );
  });

  void _addFriend(AppLocalizations l10n) => _run((client) async {
    final write = await _service.sendFriendRequest(client, widget.userId);
    if (!mounted || !_reportWrite(context, write)) return;
    _say(context, l10n.friendsRequestSent(widget.name));
    await _service.refreshSocial(client);
  });

  Future<void> _remove(AppLocalizations l10n) async {
    final go = await _confirm(
      context,
      title: l10n.friendsRemove,
      body: l10n.friendsRemoveBody(widget.name),
    );
    if (!go || !mounted) return;
    await _run((client) async {
      final write = await _service.removeFriend(client, widget.userId);
      if (!mounted || !_reportWrite(context, write)) return;
      await _service.refreshSocial(client);
      if (mounted) Navigator.of(context).pop();
    });
  }

  Future<void> _toggleBlock(AppLocalizations l10n) async {
    final block = !_blocked;
    final go = await _confirm(
      context,
      title: block ? l10n.friendsBlock : l10n.friendsUnblock,
      body: block
          ? l10n.friendsBlockBody(widget.name)
          : l10n.friendsUnblockBody(widget.name),
    );
    if (!go || !mounted) return;
    await _run((client) async {
      final write = await _service.setBlocked(
        client,
        widget.userId,
        blocked: block,
      );
      if (!mounted || !_reportWrite(context, write)) return;
      setState(() => _blocked = block);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: widget.name,
      builder: (context) => loading
          ? const Center(child: CircularProgressIndicator())
          : ListenableBuilder(
              listenable: _service,
              builder: (context, _) => _buildBody(context, l10n),
            ),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final profile = _profile;
    final friend = _friendById(_service, widget.userId);
    final friends = _service.friends;
    final simpleMode = friends?.simpleMode ?? false;
    final pending = friends?.isPending(widget.userId) ?? false;
    final playing = friend?.online == true ? friend?.nowPlaying : null;

    return ListView(
      padding: _listPadding(context),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              _UserAvatar(
                userId: widget.userId,
                name: widget.name,
                online: friend?.online,
                radius: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (profile?.customTitle != null)
                      Text(profile!.customTitle!),
                    if (friend != null)
                      Text(
                        _friendStatus(l10n, friend),
                        style: theme.textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (profile == null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(l10n.friendsProfileHidden(widget.name)),
          )
        else ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _StatChip(
                  icon: Icons.military_tech,
                  label: l10n.achievementsBadgeCount(
                    profile.unlocked,
                    profile.total,
                  ),
                ),
                _StatChip(
                  icon: Icons.percent,
                  label: '${profile.percentage.toStringAsFixed(1)}%',
                ),
                _StatChip(
                  icon: Icons.stars,
                  label: l10n.achievementsScore(profile.score),
                ),
                _StatChip(
                  icon: Icons.emoji_events,
                  label: l10n.achievementsBestStreak(profile.bestWatchStreak),
                ),
              ],
            ),
          ),
          if (profile.equipped.isNotEmpty)
            _ShowcaseStrip(badges: profile.equipped),
        ],
        adaptiveListSection(
          children: [
            if (friend != null && !_blocked)
              DpadListTile(
                autofocus: true,
                enabled: !_busy,
                useSettingsIconShell: true,
                leading: const Icon(Icons.chat),
                title: Text(l10n.friendsSendMessage),
                onTap: () => _message(l10n),
              ),
            if (playing != null)
              DpadListTile(
                useSettingsIconShell: true,
                leading: const Icon(Icons.play_circle),
                title: Text(l10n.friendsOpenItem(_mediaTitle(playing))),
                onTap: () => _openItem(context, playing.id),
              ),
            if (!simpleMode && friend != null)
              DpadListTile(
                enabled: !_busy,
                useSettingsIconShell: true,
                leading: const Icon(Icons.person_remove),
                title: Text(l10n.friendsRemove),
                onTap: () => _remove(l10n),
              ),
            if (!simpleMode && friend == null && !pending && !_blocked)
              DpadListTile(
                enabled: !_busy,
                useSettingsIconShell: true,
                leading: const Icon(Icons.person_add),
                title: Text(l10n.friendsSendRequest),
                onTap: () => _addFriend(l10n),
              ),
            DpadListTile(
              enabled: !_busy,
              useSettingsIconShell: true,
              leading: const Icon(Icons.block),
              title: Text(_blocked ? l10n.friendsUnblock : l10n.friendsBlock),
              onTap: () => _toggleBlock(l10n),
            ),
          ],
        ),
      ],
    );
  }
}

/// Requests waiting on the user, and the ones the user sent.
class _RequestsScreen extends StatefulWidget {
  const _RequestsScreen();

  @override
  State<_RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<_RequestsScreen> {
  final _service = GetIt.instance<AchievementsService>();
  bool _busy = false;

  Future<void> _write(
    Future<SocialWrite<void>> Function(MediaServerClient client) action,
  ) async {
    final client = _client();
    if (client == null || _busy) return;
    setState(() => _busy = true);
    final write = await action(client);
    if (mounted) _reportWrite(context, write);
    await _service.refreshSocial(client);
    if (mounted) setState(() => _busy = false);
  }

  Future<void> _answer(AppLocalizations l10n, SocialUser user) async {
    final accept = await _choose<bool>(
      context,
      title: l10n.friendsRequestFrom(user.userName),
      choices: [(l10n.friendsDecline, false), (l10n.friendsAccept, true)],
    );
    if (accept == null || !mounted) return;
    await _write(
      (client) => accept
          ? _service.acceptFriendRequest(client, user.userId)
          : _service.removeFriend(client, user.userId),
    );
  }

  Future<void> _cancel(AppLocalizations l10n, SocialUser user) async {
    final go = await _confirm(
      context,
      title: l10n.friendsCancelRequest,
      body: l10n.friendsCancelRequestBody(user.userName),
    );
    if (!go || !mounted) return;
    await _write((client) => _service.removeFriend(client, user.userId));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: l10n.friendsRequests,
      builder: (context) => ListenableBuilder(
        listenable: _service,
        builder: (context, _) {
          final incoming = _service.friends?.incoming ?? const <SocialUser>[];
          final outgoing = _service.friends?.outgoing ?? const <SocialUser>[];
          if (incoming.isEmpty && outgoing.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.friendsNoRequests),
            );
          }
          return ListView(
            padding: _listPadding(context),
            children: [
              if (incoming.isNotEmpty) ...[
                SettingsSectionHeader(l10n.friendsIncoming),
                adaptiveListSection(
                  children: [
                    for (final user in incoming)
                      _PersonTile(
                        userId: user.userId,
                        name: user.userName,
                        trailing: (_) => const Icon(Icons.chevron_right),
                        onTap: () => _answer(l10n, user),
                      ),
                  ],
                ),
              ],
              if (outgoing.isNotEmpty) ...[
                SettingsSectionHeader(l10n.friendsOutgoing),
                adaptiveListSection(
                  children: [
                    for (final user in outgoing)
                      _PersonTile(
                        userId: user.userId,
                        name: user.userName,
                        trailing: (_) => const Icon(Icons.close),
                        onTap: () => _cancel(l10n, user),
                      ),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

/// Everyone on the server who isn't a friend yet, filtered by name.
class _FindPeopleScreen extends StatefulWidget {
  const _FindPeopleScreen();

  @override
  State<_FindPeopleScreen> createState() => _FindPeopleScreenState();
}

class _FindPeopleScreenState extends State<_FindPeopleScreen>
    with _LoadsOnOpen<_FindPeopleScreen> {
  final _service = GetIt.instance<AchievementsService>();
  final _query = TextEditingController();
  List<SocialUser> _users = const [];
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _query.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Future<void> fetch(MediaServerClient client) async {
    _users = await _service.fetchServerUsers(client);
  }

  /// A remote can't type quickly, so everyone shows before a search starts.
  /// Capped at 50 rows, which covers any home server.
  List<SocialUser> _matches() {
    final me = _client()?.userId ?? '';
    final friends = _service.friends;
    final query = _query.text.trim().toLowerCase();
    return _users
        .where((user) => !sameUserId(user.userId, me))
        .where((user) => friends == null || !friends.isFriend(user.userId))
        .where((user) => friends == null || !friends.isPending(user.userId))
        .where((user) => user.userName.toLowerCase().contains(query))
        .take(50)
        .toList();
  }

  Future<void> _add(AppLocalizations l10n, SocialUser user) async {
    final client = _client();
    if (client == null || _busy) return;
    setState(() => _busy = true);
    final write = await _service.sendFriendRequest(client, user.userId);
    if (mounted && _reportWrite(context, write)) {
      _say(context, l10n.friendsRequestSent(user.userName));
    }
    await _service.refreshSocial(client);
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: l10n.friendsAdd,
      builder: (context) {
        if (loading) return const Center(child: CircularProgressIndicator());
        final matches = _matches();
        return ListView(
          padding: _listPadding(context),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: _SocialTextField(
                controller: _query,
                hint: l10n.friendsSearchHint,
                icon: Icons.search,
              ),
            ),
            if (matches.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(l10n.friendsNoMatches),
              )
            else
              adaptiveListSection(
                children: [
                  for (final user in matches)
                    _PersonTile(
                      userId: user.userId,
                      name: user.userName,
                      trailing: (_) => const Icon(Icons.person_add),
                      onTap: () => _add(l10n, user),
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}

/// What friends can see of the user, and who is blocked.
class _SocialPrivacyScreen extends StatefulWidget {
  const _SocialPrivacyScreen();

  @override
  State<_SocialPrivacyScreen> createState() => _SocialPrivacyScreenState();
}

class _SocialPrivacyScreenState extends State<_SocialPrivacyScreen>
    with _LoadsOnOpen<_SocialPrivacyScreen> {
  final _service = GetIt.instance<AchievementsService>();
  final _prefs = GetIt.instance<UserPreferences>();
  SocialPrivacy? _privacy;
  List<SocialUser> _blocked = const [];

  @override
  Future<void> fetch(MediaServerClient client) async {
    final results = await Future.wait<Object?>([
      _service.fetchSocialPrivacy(client),
      _service.fetchBlocked(client),
    ]);
    _privacy = results[0] as SocialPrivacy?;
    final blocked = results[1] as List<String>;
    if (blocked.isEmpty) {
      _blocked = const [];
      return;
    }
    // A blocked user is rarely still a friend, so the names come from the
    // server's user list.
    final users = await _service.fetchServerUsers(client);
    _blocked = [
      for (final id in blocked)
        users.firstWhere(
          (user) => sameUserId(user.userId, id),
          orElse: () => SocialUser(userId: id, userName: id),
        ),
    ];
  }

  Future<void> _save(SocialPrivacy next) async {
    final client = _client();
    final before = _privacy;
    if (client == null || before == null) return;

    setState(() => _privacy = next);
    final saved = await _service.saveSocialPrivacy(client, next);
    if (saved || !mounted) return;
    setState(() => _privacy = before);
    _say(context, AppLocalizations.of(context).friendsSaveFailed);
  }

  Future<void> _unblock(AppLocalizations l10n, SocialUser user) async {
    final go = await _confirm(
      context,
      title: l10n.friendsUnblock,
      body: l10n.friendsUnblockBody(user.userName),
    );
    final client = _client();
    if (!go || client == null || !mounted) return;
    final write = await _service.setBlocked(
      client,
      user.userId,
      blocked: false,
    );
    if (!mounted || !_reportWrite(context, write)) return;
    setState(() {
      _blocked = _blocked.where((u) => u.userId != user.userId).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: l10n.friendsPrivacy,
      builder: (context) {
        if (loading) return const Center(child: CircularProgressIndicator());
        final privacy = _privacy;
        if (privacy == null) {
          return _RetryPanel(
            message: l10n.friendsLoadFailed,
            onRetry: () {
              setState(() => loading = true);
              reload();
            },
          );
        }

        Widget toggle({
          required IconData icon,
          required String title,
          required String subtitle,
          required bool value,
          required SocialPrivacy Function(bool value) apply,
        }) => DpadSwitchListTile(
          useSettingsIconShell: true,
          secondary: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
          value: value,
          onChanged: (value) => _save(apply(value)),
        );

        return ListView(
          padding: _listPadding(context),
          children: [
            adaptiveListSection(
              children: [
                toggle(
                  icon: Icons.visibility_off,
                  title: l10n.friendsAppearOffline,
                  subtitle: l10n.friendsAppearOfflineSubtitle,
                  value: privacy.appearOffline,
                  apply: (v) => privacy.copyWith(appearOffline: v),
                ),
                toggle(
                  icon: Icons.tv_off,
                  title: l10n.friendsHideNowPlaying,
                  subtitle: l10n.friendsHideNowPlayingSubtitle,
                  value: privacy.hideNowPlaying,
                  apply: (v) => privacy.copyWith(hideNowPlaying: v),
                ),
                toggle(
                  icon: Icons.history_toggle_off,
                  title: l10n.friendsHideLastWatched,
                  subtitle: l10n.friendsHideLastWatchedSubtitle,
                  value: privacy.hideLastWatched,
                  apply: (v) => privacy.copyWith(hideLastWatched: v),
                ),
                toggle(
                  icon: Icons.notifications,
                  title: l10n.friendsMessageNotifications,
                  subtitle: l10n.friendsMessageNotificationsSubtitle,
                  value: privacy.messageNotifications,
                  apply: (v) => privacy.copyWith(messageNotifications: v),
                ),
                // A setting on the device rather than the plugin's, whose own
                // one defaults to off.
                if (privacy.messageNotifications)
                  DpadSwitchListTile(
                    useSettingsIconShell: true,
                    secondary: const Icon(Icons.do_not_disturb_on),
                    title: Text(l10n.friendsMuteDuringPlayback),
                    subtitle: Text(l10n.friendsMuteDuringPlaybackSubtitle),
                    value: _prefs.get(
                      UserPreferences.muteChatBannersDuringPlayback,
                    ),
                    onChanged: (value) async {
                      await _prefs.set(
                        UserPreferences.muteChatBannersDuringPlayback,
                        value,
                      );
                      if (mounted) setState(() {});
                    },
                  ),
              ],
            ),
            if (_blocked.isNotEmpty) ...[
              SettingsSectionHeader(l10n.friendsBlocked),
              adaptiveListSection(
                children: [
                  for (final user in _blocked)
                    _PersonTile(
                      userId: user.userId,
                      name: user.userName,
                      subtitle: l10n.friendsUnblock,
                      onTap: () => _unblock(l10n, user),
                    ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}

/// A text field the remote can reach. On TV, select opens the app's keyboard.
class _SocialTextField extends StatefulWidget {
  const _SocialTextField({
    required this.controller,
    required this.hint,
    this.focusNode,
    this.icon,
    this.onSubmitted,
    this.maxLength,
  });

  final TextEditingController controller;
  final String hint;

  /// For a caller that moves focus here itself. One is made otherwise.
  final FocusNode? focusNode;
  final IconData? icon;
  final ValueChanged<String>? onSubmitted;
  final int? maxLength;

  @override
  State<_SocialTextField> createState() => _SocialTextFieldState();
}

class _SocialTextFieldState extends State<_SocialTextField> {
  final _ownNode = FocusNode(debugLabel: 'SocialTextField');
  final _tvKey = GlobalKey<CustomTVTextFieldState>();

  FocusNode get _node => widget.focusNode ?? _ownNode;

  @override
  void dispose() {
    _ownNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foreground = AppColorScheme.onSurface;
    final fill = AppColorScheme.surface.withValues(alpha: 0.72);
    final prefs = GetIt.instance<UserPreferences>();
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final icon = widget.icon == null
        ? null
        : Icon(widget.icon, color: foreground);

    if (PlatformDetection.isTV) {
      return Focus(
        focusNode: _node,
        onKeyEvent: (node, event) {
          if (!event.isActionable || !event.logicalKey.isSelectKey) {
            return KeyEventResult.ignored;
          }
          _tvKey.currentState?.openKeyboard();
          return KeyEventResult.handled;
        },
        child: ListenableBuilder(
          listenable: _node,
          builder: (context, _) => CustomTVTextField(
            key: _tvKey,
            controller: widget.controller,
            isFocused: _node.hasFocus,
            inputPurpose: InputPurpose.text,
            keyboardType: KeyboardType.alphabetic,
            preferSystemIme: prefs.get(UserPreferences.preferSystemImeKeyboard),
            popParentOnKeyboardClose: false,
            hint: widget.hint,
            prefixIcon: icon,
            textStyle: TextStyle(color: foreground),
            hintStyle: TextStyle(color: foreground.withValues(alpha: 0.62)),
            filled: true,
            fillColor: fill,
            borderRadius: 24,
            borderColor: Colors.transparent,
            focusedBorderColor: focusColor,
            borderWidth: 2,
            focusedBorderWidth: 2,
            onFieldSubmitted: widget.onSubmitted,
          ),
        ),
      );
    }

    const radius = BorderRadius.all(Radius.circular(24));
    return TextField(
      controller: widget.controller,
      focusNode: _node,
      style: TextStyle(color: foreground),
      textInputAction: widget.onSubmitted == null
          ? TextInputAction.search
          : TextInputAction.send,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.maxLength == null
          ? null
          : [LengthLimitingTextInputFormatter(widget.maxLength)],
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: foreground.withValues(alpha: 0.62)),
        prefixIcon: icon,
        filled: true,
        fillColor: fill,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        border: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: Colors.transparent, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: Colors.transparent, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: focusColor, width: 2),
        ),
      ),
    );
  }
}
