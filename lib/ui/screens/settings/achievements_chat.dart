part of 'achievements_screen.dart';

/// Every chat the user is in, newest first.
class _ChatsScreen extends StatefulWidget {
  const _ChatsScreen();

  @override
  State<_ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<_ChatsScreen> {
  final _service = GetIt.instance<AchievementsService>();

  @override
  void initState() {
    super.initState();
    final client = _client();
    if (client != null) unawaited(_service.refreshSocial(client));
  }

  void _newChat(AppLocalizations l10n) {
    final people = [
      for (final friend in _service.friends?.friends ?? const <Friend>[])
        SocialUser(userId: friend.userId, userName: friend.userName),
    ];
    context.pushSettingsScreen(
      _PickPersonScreen(
        title: l10n.chatNew,
        people: people,
        empty: l10n.friendsNone,
        onPicked: (pickerContext, user) async {
          final client = _client();
          if (client == null) return;
          final id = await _service.openDirectChat(client, user.userId);
          if (!pickerContext.mounted) return;
          if (id == null) {
            _say(pickerContext, l10n.friendsActionFailed);
            return;
          }
          _replaceWith(
            pickerContext,
            FriendChatScreen(
              conversationId: id,
              title: user.userName,
              otherUserId: user.userId,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: l10n.friendsMessages,
      builder: (context) => ListenableBuilder(
        listenable: _service,
        builder: (context, _) {
          final threads = _service.threads;
          return ListView(
            padding: _listPadding(context),
            children: [
              adaptiveListSection(
                children: [
                  DpadListTile(
                    autofocus: true,
                    useSettingsIconShell: true,
                    leading: const Icon(Icons.add_comment),
                    trailing: const Icon(Icons.chevron_right),
                    title: Text(l10n.chatNew),
                    subtitle: Text(l10n.chatNewSubtitle),
                    onTap: () => _newChat(l10n),
                  ),
                  DpadListTile(
                    useSettingsIconShell: true,
                    leading: const Icon(Icons.group_add),
                    trailing: const Icon(Icons.chevron_right),
                    title: Text(l10n.chatNewGroup),
                    subtitle: Text(l10n.chatNewGroupSubtitle),
                    onTap: () =>
                        context.pushSettingsScreen(const _NewGroupScreen()),
                  ),
                ],
              ),
              if (threads.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(l10n.chatNone),
                )
              else
                adaptiveListSection(
                  children: [
                    for (final thread in threads) _ThreadTile(thread: thread),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Pops the screen on top, or closes the side panel when it is the first one,
/// as a chat opened from a banner is.
void _closeScreen(BuildContext context) {
  final navigator = Navigator.of(context);
  if (navigator.canPop()) {
    navigator.pop();
  } else {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

/// Swaps the screen on top for [screen], so back skips the picker that led
/// there.
void _replaceWith(BuildContext context, Widget screen) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.context.pushSettingsScreen(screen);
}

/// The style emoji are drawn in, with the platform's emoji font named
/// outright. Left to the fallback list, macOS draws an emoji next to text as a
/// box, though the same emoji on its own is fine.
TextStyle get _emojiStyle => TextStyle(
  fontFamily: PlatformDetection.isApple
      ? 'Apple Color Emoji'
      : PlatformDetection.isWindows
      ? 'Segoe UI Emoji'
      : null,
  fontFamilyFallback: const [
    'Apple Color Emoji',
    'Segoe UI Emoji',
    'Noto Color Emoji',
  ],
);

/// Whether a character is drawn as an emoji. The emoji package tells them
/// apart with `\p{Emoji}`, which the regex engine in a built app rejects, so
/// this goes by the Unicode blocks emoji live in and the marks that join them.
bool _isEmoji(String character) {
  for (final rune in character.runes) {
    if (rune == 0xFE0F || rune == 0x20E3 || rune == 0x200D) return true;
    if (rune >= 0x1F000 && rune <= 0x1FAFF) return true;
    if (rune >= 0x2300 && rune <= 0x23FF) return true;
    if (rune >= 0x2600 && rune <= 0x27BF) return true;
    if (rune >= 0x2B00 && rune <= 0x2BFF) return true;
  }
  return false;
}

/// [text] cut into runs of emoji and of everything else, with the emoji in
/// [_emojiStyle].
List<TextSpan> _emojiSpans(String text, TextStyle? style) {
  final spans = <TextSpan>[];
  final run = StringBuffer();
  var runIsEmoji = false;

  void flush() {
    if (run.isEmpty) return;
    spans.add(
      TextSpan(
        text: run.toString(),
        style: runIsEmoji
            ? (style ?? const TextStyle()).merge(_emojiStyle)
            : style,
      ),
    );
    run.clear();
  }

  for (final character in text.characters) {
    final emoji = _isEmoji(character);
    if (emoji != runIsEmoji) flush();
    runIsEmoji = emoji;
    run.write(character);
  }
  flush();
  return spans;
}

Widget _emojiText(
  String text, {
  TextStyle? style,
  int? maxLines,
  TextOverflow? overflow,
}) => Text.rich(
  TextSpan(children: _emojiSpans(text, style)),
  maxLines: maxLines,
  overflow: overflow,
);

/// The message field, drawing emoji the way the bubbles do.
class _EmojiTextController extends TextEditingController {
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    // While a keyboard is still composing a word it underlines it, which the
    // default span does and a split one would lose.
    if (withComposing && value.isComposingRangeValid) {
      return super.buildTextSpan(
        context: context,
        style: style,
        withComposing: withComposing,
      );
    }
    return TextSpan(style: style, children: _emojiSpans(text, style));
  }
}

String _threadPreview(AppLocalizations l10n, ChatThread thread) {
  final text = thread.lastIsPhoto ? l10n.chatPhoto : thread.lastMessage;
  return thread.lastFromMe ? l10n.chatYouSaid(text) : text;
}

class _ThreadTile extends StatelessWidget {
  const _ThreadTile({required this.thread});

  final ChatThread thread;

  @override
  Widget build(BuildContext context) {
    void open() =>
        context.pushSettingsScreen(FriendChatScreen.forThread(thread));

    return _AchievementRow(
      onTap: open,
      builder: (context, highlighted) {
        final l10n = AppLocalizations.of(context);
        final theme = Theme.of(context);
        final secondary = _secondaryText(highlighted);
        final at = thread.lastAt;
        final unread = thread.unreadCount > 0;

        return ListTile(
          leading: UnreadBadge(
            count: thread.unreadCount,
            child: thread.isGroup
                ? _TileIcon(
                    icon: Icons.groups,
                    colour: _hueOn(AppColorScheme.accent, highlighted),
                    highlighted: highlighted,
                  )
                : _UserAvatar(userId: thread.otherUserId, name: thread.name),
          ),
          title: Text(
            thread.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: unread ? FontWeight.w700 : null),
          ),
          subtitle: _emojiText(
            _threadPreview(l10n, thread),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: secondary),
          ),
          trailing: at == null
              ? null
              : Text(
                  relativeTimeLabel(l10n, at),
                  style: theme.textTheme.labelSmall?.copyWith(color: secondary),
                ),
          onTap: _tileTap(open),
        );
      },
    );
  }
}

/// Picks one person, then runs [onPicked] while the list waits.
class _PickPersonScreen extends StatefulWidget {
  const _PickPersonScreen({
    required this.title,
    required this.people,
    required this.empty,
    required this.onPicked,
  });

  final String title;
  final List<SocialUser> people;

  /// Shown when there is nobody to pick.
  final String empty;
  final Future<void> Function(BuildContext context, SocialUser user) onPicked;

  @override
  State<_PickPersonScreen> createState() => _PickPersonScreenState();
}

class _PickPersonScreenState extends State<_PickPersonScreen> {
  bool _busy = false;

  Future<void> _pick(SocialUser user) async {
    if (_busy) return;
    setState(() => _busy = true);
    await widget.onPicked(context, user);
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    return _AchievementsScaffold(
      title: widget.title,
      builder: (context) => widget.people.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: Text(widget.empty),
            )
          : ListView(
              padding: _listPadding(context),
              children: [
                adaptiveListSection(
                  children: [
                    for (final user in widget.people)
                      _PersonTile(
                        userId: user.userId,
                        name: user.userName,
                        onTap: () => _pick(user),
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}

/// A named chat with two or more friends.
class _NewGroupScreen extends StatefulWidget {
  const _NewGroupScreen();

  @override
  State<_NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<_NewGroupScreen> {
  final _service = GetIt.instance<AchievementsService>();
  final _name = TextEditingController();
  final _picked = <String>{};
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _create(List<Friend> friends) async {
    final client = _client();
    if (client == null || _busy) return;

    setState(() => _busy = true);
    final title = _name.text.trim();
    final write = await _service.createGroup(
      client,
      title: title.isEmpty ? null : title,
      memberIds: _picked.toList(),
    );
    if (!mounted) return;
    setState(() => _busy = false);
    final conversation = write.value;
    if (!_reportWrite(context, write) || conversation == null) return;

    await _service.refreshSocial(client);
    if (!mounted) return;
    final names = friends
        .where((friend) => _picked.contains(friend.userId))
        .map((friend) => friend.userName)
        .join(', ');
    _replaceWith(
      context,
      FriendChatScreen(
        conversationId: conversation.id,
        title: conversation.title ?? names,
        isGroup: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final friends = _service.friends?.friends ?? const <Friend>[];
    return _AchievementsScaffold(
      title: l10n.chatNewGroup,
      builder: (context) => ListView(
        padding: _listPadding(context),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: _SocialTextField(
              controller: _name,
              hint: l10n.chatGroupName,
              maxLength: 100,
            ),
          ),
          SettingsSectionHeader(l10n.chatPickMembers),
          if (friends.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.friendsNone),
            )
          else
            adaptiveListSection(
              children: [
                for (final friend in friends)
                  _PersonTile(
                    userId: friend.userId,
                    name: friend.userName,
                    online: friend.online,
                    trailing: (highlighted) => Icon(
                      _picked.contains(friend.userId)
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: _hueOn(AppColorScheme.accent, highlighted),
                    ),
                    onTap: () => setState(() {
                      if (!_picked.remove(friend.userId)) {
                        _picked.add(friend.userId);
                      }
                    }),
                  ),
              ],
            ),
          adaptiveListSection(
            children: [
              DpadListTile(
                enabled: _picked.length >= 2 && !_busy,
                useSettingsIconShell: true,
                leading: const Icon(Icons.group_add),
                title: Text(l10n.chatCreate),
                onTap: () => _create(friends),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// One chat.
///
/// The plugin has no push for messages, so this polls while it is open, the
/// same 6 seconds the plugin's own drawer uses.
class FriendChatScreen extends StatefulWidget {
  const FriendChatScreen({
    super.key,
    required this.conversationId,
    required this.title,
    this.isGroup = false,
    this.otherUserId,
  });

  FriendChatScreen.forThread(ChatThread thread, {Key? key})
    : this(
        key: key,
        conversationId: thread.conversationId,
        title: thread.name,
        isGroup: thread.isGroup,
        otherUserId: thread.isGroup ? null : thread.otherUserId,
      );

  final String conversationId;
  final String title;
  final bool isGroup;
  final String? otherUserId;

  @override
  State<FriendChatScreen> createState() => _FriendChatScreenState();
}

class _FriendChatScreenState extends State<FriendChatScreen> {
  static const _pollInterval = Duration(seconds: 6);

  /// What the plugin accepts as an attachment.
  static const _imageTypes = {
    'image/png',
    'image/jpeg',
    'image/gif',
    'image/webp',
  };
  static const _maxImageBytes = 8 * 1024 * 1024;

  final _service = GetIt.instance<AchievementsService>();
  final _composer = _EmojiTextController();
  final _composerFocus = FocusNode(debugLabel: 'ChatComposer');
  final _images = <String, Future<Uint8List?>>{};
  Timer? _poll;
  late final AppLifecycleListener _lifecycle;
  List<ChatMessage>? _messages;
  ChatConversation? _conversation;
  ChatMessage? _editing;
  bool _loading = true;
  bool _sending = false;
  bool _emojiOpen = false;

  String get _me => _client()?.userId ?? '';

  String get _title =>
      widget.isGroup ? (_conversation?.title ?? widget.title) : widget.title;

  String? get _otherUserId {
    if (widget.otherUserId != null) return widget.otherUserId;
    for (final id in _conversation?.participantIds ?? const <String>[]) {
      if (!sameUserId(id, _me)) return id;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _service.openConversationId = widget.conversationId;
    // On a phone the picker and the keyboard share the bottom of the screen,
    // so tapping back into the field puts the keyboard back.
    _composerFocus.addListener(() {
      if (_composerFocus.hasFocus && _emojiOpen && PlatformDetection.isMobile) {
        setState(() => _emojiOpen = false);
      }
    });
    _lifecycle = AppLifecycleListener(onStateChange: _onLifecycleChanged);
    _load();
    _startPolling();
  }

  void _startPolling() {
    _poll = Timer.periodic(_pollInterval, (_) => _loadMessages());
  }

  /// Reading the chat marks it read, so polling stops while the app is out of
  /// sight. Otherwise the other side would see messages as seen that nobody
  /// saw.
  void _onLifecycleChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_poll != null) return;
        unawaited(_loadMessages());
        _startPolling();
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        _poll?.cancel();
        _poll = null;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    _poll?.cancel();
    _lifecycle.dispose();
    if (_service.openConversationId == widget.conversationId) {
      _service.openConversationId = null;
    }
    _composer.dispose();
    _composerFocus.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final client = _client();
    if (client == null) {
      if (mounted) setState(() => _loading = false);
      return;
    }

    final results = await Future.wait<Object?>([
      _service.fetchConversation(client, widget.conversationId),
      _service.fetchMessages(client, widget.conversationId),
    ]);
    if (!mounted) return;
    setState(() {
      _conversation = results[0] as ChatConversation? ?? _conversation;
      _messages = results[1] as List<ChatMessage>?;
      _loading = false;
    });
    // Reading the messages marked them read, which the badge should show.
    await _service.refreshSocial(client);
  }

  Future<void> _loadMessages() async {
    final client = _client();
    if (client == null) return;
    final messages = await _service.fetchMessages(
      client,
      widget.conversationId,
    );
    if (!mounted || messages == null) return;
    setState(() => _messages = messages);
  }

  Future<Uint8List?> _imageFor(String attachmentId) {
    final client = _client();
    return _images.putIfAbsent(
      attachmentId,
      () => client == null
          ? Future<Uint8List?>.value()
          : _service.fetchAttachment(client, attachmentId),
    );
  }

  Future<void> _send() async {
    final client = _client();
    final text = _composer.text.trim();
    if (client == null || text.isEmpty || _sending) return;

    setState(() => _sending = true);
    final editing = _editing;
    final write = editing == null
        ? await _service.sendMessage(client, widget.conversationId, text: text)
        : await _service.editMessage(client, editing.id, text);
    if (!mounted) return;
    setState(() => _sending = false);
    if (!_reportWrite(context, write)) return;

    _composer.clear();
    setState(() => _editing = null);
    await _loadMessages();
  }

  Future<void> _attach(AppLocalizations l10n) async {
    final client = _client();
    if (client == null || _sending) return;

    final picked = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['png', 'jpg', 'jpeg', 'gif', 'webp'],
      withData: true,
    );
    if (!mounted || picked == null || picked.files.isEmpty) return;
    final file = picked.files.single;
    final type = imageContentTypeForFileName(file.name);
    final bytes = file.bytes;
    if (type == null || !_imageTypes.contains(type) || bytes == null) {
      _say(context, l10n.chatImageUnsupported);
      return;
    }
    if (bytes.length > _maxImageBytes) {
      _say(context, l10n.chatImageTooLarge);
      return;
    }

    setState(() => _sending = true);
    final upload = await _service.uploadAttachment(
      client,
      bytes,
      fileName: file.name,
      mimeType: type,
    );
    final attachmentId = upload.value;
    if (attachmentId == null) {
      if (!mounted) return;
      setState(() => _sending = false);
      _reportWrite(context, upload.ok ? SocialWrite<void>.failed() : upload);
      return;
    }
    final write = await _service.sendMessage(
      client,
      widget.conversationId,
      attachmentId: attachmentId,
    );
    if (!mounted) return;
    setState(() => _sending = false);
    if (_reportWrite(context, write)) await _loadMessages();
  }

  Future<void> _messageOptions(
    AppLocalizations l10n,
    ChatMessage message,
  ) async {
    final action = await _choose<String>(
      context,
      title: l10n.chatMessageOptions,
      choices: [
        if (message.attachmentId != null) (l10n.chatViewPhoto, 'view'),
        if (message.canEdit(DateTime.now())) (l10n.edit, 'edit'),
        (l10n.delete, 'delete'),
      ],
    );
    if (!mounted || action == null) return;

    final attachmentId = message.attachmentId;
    if (action == 'view' && attachmentId != null) {
      unawaited(_showPhoto(context, _imageFor(attachmentId)));
      return;
    }

    if (action == 'edit') {
      setState(() {
        _editing = message;
        _composer.text = message.text;
      });
      return;
    }

    final go = await _confirm(
      context,
      title: l10n.delete,
      body: l10n.chatDeleteBody,
    );
    final client = _client();
    if (!go || client == null || !mounted) return;
    final write = await _service.deleteMessage(client, message.id);
    if (mounted && _reportWrite(context, write)) await _loadMessages();
  }

  Future<void> _options(AppLocalizations l10n) async {
    if (widget.isGroup) {
      await context.pushSettingsScreen(
        _GroupInfoScreen(conversationId: widget.conversationId),
      );
      if (mounted) unawaited(_load());
      return;
    }

    final other = _otherUserId;
    final action = await _choose<String>(
      context,
      title: _title,
      choices: [
        (l10n.chatClear, 'clear'),
        if (other != null) (l10n.friendsBlock, 'block'),
      ],
    );
    if (!mounted || action == null) return;

    if (action == 'clear') {
      final go = await _confirm(
        context,
        title: l10n.chatClear,
        body: l10n.chatClearBody,
      );
      final client = _client();
      if (!go || client == null || !mounted) return;
      final write = await _service.clearConversation(
        client,
        widget.conversationId,
      );
      if (mounted && _reportWrite(context, write)) await _loadMessages();
      return;
    }

    final go = await _confirm(
      context,
      title: l10n.friendsBlock,
      body: l10n.friendsBlockBody(_title),
    );
    final client = _client();
    if (!go || client == null || other == null || !mounted) return;
    final write = await _service.setBlocked(client, other, blocked: true);
    if (mounted && _reportWrite(context, write)) _closeScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: _title,
      actions: [
        IconButton(
          tooltip: widget.isGroup ? l10n.chatGroupInfo : l10n.more,
          icon: Icon(widget.isGroup ? Icons.info_outline : Icons.more_vert),
          onPressed: () => _options(l10n),
        ),
      ],
      builder: (context) => Column(
        children: [
          Expanded(child: _buildMessages(l10n)),
          if (_editing != null)
            Container(
              color: _tintedSurface(AppColorScheme.accent),
              padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18, color: AppColorScheme.accent),
                  const SizedBox(width: 8),
                  Expanded(child: Text(l10n.chatEditing)),
                  IconButton(
                    tooltip: l10n.cancel,
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() {
                      _editing = null;
                      _composer.clear();
                    }),
                  ),
                ],
              ),
            ),
          _buildComposer(l10n),
        ],
      ),
    );
  }

  Widget _buildMessages(AppLocalizations l10n) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    final messages = _messages;
    if (messages == null) {
      return _RetryPanel(
        message: l10n.friendsLoadFailed,
        onRetry: () {
          setState(() => _loading = true);
          _load();
        },
      );
    }
    if (messages.isEmpty) return Center(child: Text(l10n.chatNone));

    final me = _me;
    // Reversed so the newest message sits at the bottom and stays there as
    // more arrive.
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index];
        final mine = sameUserId(message.fromUserId, me);
        final attachmentId = message.attachmentId;
        final bubble = _MessageBubble(
          message: message,
          mine: mine,
          showSender: widget.isGroup && !mine,
          image: attachmentId == null ? null : _imageFor(attachmentId),
          onTap: mine ? () => _messageOptions(l10n, message) : null,
        );
        // Down from the newest message goes to the text field. Left to the
        // remote, it picks whichever of the field and the send button is
        // nearer, which is often the button.
        return KeyedSubtree(
          key: ValueKey(message.id),
          child: index > 0 || !PlatformDetection.isTV
              ? bubble
              : Focus(
                  canRequestFocus: false,
                  skipTraversal: true,
                  onKeyEvent: (_, event) {
                    if (event is! KeyDownEvent ||
                        event.logicalKey != LogicalKeyboardKey.arrowDown) {
                      return KeyEventResult.ignored;
                    }
                    _composerFocus.requestFocus();
                    return KeyEventResult.handled;
                  },
                  child: bubble,
                ),
        );
      },
    );
  }

  void _toggleEmoji() {
    final open = !_emojiOpen;
    // Dropping focus closes a phone's keyboard, which would cover the picker.
    if (open && PlatformDetection.isMobile) _composerFocus.unfocus();
    setState(() => _emojiOpen = open);
  }

  Widget _buildComposer(AppLocalizations l10n) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: Row(
              children: [
                // TV has no file picker to choose an image with.
                if (!PlatformDetection.isTV && _editing == null)
                  IconButton(
                    tooltip: l10n.chatAttach,
                    icon: const Icon(Icons.add_photo_alternate),
                    onPressed: _sending ? null : () => _attach(l10n),
                  ),
                IconButton(
                  tooltip: l10n.chatEmoji,
                  icon: Icon(
                    _emojiOpen
                        ? Icons.keyboard_hide
                        : Icons.emoji_emotions_outlined,
                  ),
                  onPressed: _toggleEmoji,
                ),
                Expanded(
                  child: _SocialTextField(
                    controller: _composer,
                    focusNode: _composerFocus,
                    hint: l10n.chatHint,
                    maxLength: 1000,
                    onSubmitted: (_) => _send(),
                  ),
                ),
                IconButton(
                  tooltip: l10n.send,
                  icon: _sending
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Icon(_editing == null ? Icons.send : Icons.check),
                  onPressed: _sending ? null : _send,
                ),
              ],
            ),
          ),
          if (_emojiOpen) _buildEmojiPicker(l10n),
        ],
      ),
    );
  }

  /// Types into the same controller as the keyboard, at the caret.
  ///
  /// On TV the search, backspace and skin tones are left out: search types
  /// into a field the TV keyboard doesn't drive, and the other two need touch.
  Widget _buildEmojiPicker(AppLocalizations l10n) {
    final tv = PlatformDetection.isTV;
    final surface = AppColorScheme.surface;
    final accent = AppColorScheme.accent;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.6);
    return EmojiPicker(
      textEditingController: _composer,
      config: Config(
        height: 256,
        locale: Localizations.localeOf(context),
        emojiViewConfig: EmojiViewConfig(
          backgroundColor: surface,
          // The package sizes emoji up on iOS, whose glyphs draw smaller.
          emojiSizeMax: 28 * (PlatformDetection.isIOS ? 1.2 : 1.0),
          noRecents: Text(
            l10n.chatNoRecentEmoji,
            style: TextStyle(color: muted),
          ),
        ),
        categoryViewConfig: CategoryViewConfig(
          backgroundColor: surface,
          indicatorColor: accent,
          iconColor: muted,
          iconColorSelected: accent,
          backspaceColor: accent,
        ),
        bottomActionBarConfig: BottomActionBarConfig(
          enabled: !tv,
          backgroundColor: surface,
          buttonColor: surface,
          buttonIconColor: muted,
        ),
        searchViewConfig: SearchViewConfig(
          backgroundColor: surface,
          buttonIconColor: muted,
          hintText: l10n.chatEmojiSearch,
        ),
        skinToneConfig: SkinToneConfig(
          enabled: !tv,
          dialogBackgroundColor: surface,
          indicatorColor: muted,
        ),
      ),
    );
  }
}

/// Today's messages show the time alone, older ones the day as well.
String _messageTime(BuildContext context, DateTime at) {
  final local = MaterialLocalizations.of(context);
  final time = local.formatTimeOfDay(
    TimeOfDay.fromDateTime(at),
    alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
  );
  final now = DateTime.now();
  final today =
      at.year == now.year && at.month == now.month && at.day == now.day;
  return today ? time : '${local.formatShortMonthDay(at)} $time';
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.mine,
    required this.showSender,
    this.image,
    this.onTap,
  });

  final ChatMessage message;
  final bool mine;

  /// Group chats name who sent each message from someone else.
  final bool showSender;
  final Future<Uint8List?>? image;

  /// Set only on the user's own messages, which can be edited or deleted.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final onTap = this.onTap;
    final Widget child;
    if (PlatformDetection.isTV) {
      // Each bubble is a focus stop so the remote can scroll the chat. It
      // outlines itself rather than sitting in a settings tile, which would
      // wrap it in a box as wide as the chat.
      // Select opens the menu on the user's own messages, which can also
      // view a photo, and opens the photo on anyone else's.
      final image = this.image;
      final select =
          onTap ?? (image == null ? null : () => _showPhoto(context, image));
      child = Focus(
        onKeyEvent: (_, event) {
          if (select == null || !event.logicalKey.isSelectKey) {
            return KeyEventResult.ignored;
          }
          if (event is KeyDownEvent) select();
          return KeyEventResult.handled;
        },
        child: Builder(
          builder: (context) => _bubble(
            context,
            focused: InputModeTracker.showFocusVisuals(
              context,
              Focus.of(context).hasFocus,
            ),
          ),
        ),
      );
    } else {
      final bubble = _bubble(context, focused: false);
      child = onTap == null
          ? bubble
          : InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onTap,
              child: bubble,
            );
    }

    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: child,
      ),
    );
  }

  Widget _bubble(BuildContext context, {required bool focused}) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final secondary = _secondaryText(false);
    final sentAt = message.sentAt;
    final image = this.image;
    final meta = [
      if (sentAt != null) _messageTime(context, sentAt),
      if (message.editedAt != null) l10n.chatEdited,
    ].join(' \u00b7 ');
    final focusColor = focused
        ? Color(
            GetIt.instance<UserPreferences>()
                .get(UserPreferences.focusColor)
                .colorValue,
          )
        : Colors.transparent;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      decoration: BoxDecoration(
        color: _tintedSurface(
          mine ? AppColorScheme.accent : AppColorScheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(14),
        // Always drawn, so gaining focus doesn't shift the text by the
        // border's width.
        border: Border.all(color: focusColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showSender)
            Text(
              message.fromUserName,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColorScheme.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (image != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: _ChatImage(bytes: image),
            ),
          if (message.text.isNotEmpty) _emojiText(message.text),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                meta,
                style: theme.textTheme.labelSmall?.copyWith(color: secondary),
              ),
              if (mine) ...[
                const SizedBox(width: 4),
                Icon(
                  message.isRead ? Icons.done_all : Icons.done,
                  size: 14,
                  color: message.isRead ? _onlineColor : secondary,
                  semanticLabel: message.isRead ? l10n.chatSeen : l10n.chatSent,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Opens a chat photo at full size. There is no pinch to zoom on TV, so the
/// remote's select closes it, as back does.
Future<void> _showPhoto(BuildContext context, Future<Uint8List?> bytes) async {
  final data = await bytes;
  if (data == null || !context.mounted) return;
  await showFocusRestoringDialog<void>(
    context: context,
    builder: (ctx) => Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.all(24),
      child: Focus(
        autofocus: true,
        onKeyEvent: (_, event) {
          if (event is! KeyDownEvent || !event.logicalKey.isSelectKey) {
            return KeyEventResult.ignored;
          }
          Navigator.pop(ctx);
          return KeyEventResult.handled;
        },
        child: InteractiveViewer(
          child: Image.memory(data, fit: BoxFit.contain),
        ),
      ),
    ),
  );
}

class _ChatImage extends StatelessWidget {
  const _ChatImage({required this.bytes});

  final Future<Uint8List?> bytes;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: bytes,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
            width: 200,
            height: 140,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }
        final data = snapshot.data;
        if (data == null) return const Icon(Icons.broken_image, size: 48);
        return GestureDetector(
          onTap: () => _showPhoto(context, bytes),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: Image.memory(data, fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }
}

/// A group chat's name and members, and what admins can do with them.
class _GroupInfoScreen extends StatefulWidget {
  const _GroupInfoScreen({required this.conversationId});

  final String conversationId;

  @override
  State<_GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<_GroupInfoScreen>
    with _LoadsOnOpen<_GroupInfoScreen> {
  final _service = GetIt.instance<AchievementsService>();
  final _name = TextEditingController();
  ChatConversation? _conversation;

  /// Names for members nobody else here knows, read from the server.
  Map<String, String> _names = const {};
  bool _busy = false;

  String get _me => _client()?.userId ?? '';

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Future<void> fetch(MediaServerClient client) async {
    final conversation = await _service.fetchConversation(
      client,
      widget.conversationId,
    );
    _conversation = conversation;
    if (conversation == null) return;
    _name.text = conversation.title ?? '';

    final unknown = conversation.participantIds.any(
      (id) => !sameUserId(id, _me) && _service.displayNameFor(id) == null,
    );
    if (unknown) {
      final users = await _service.fetchServerUsers(client);
      _names = {for (final user in users) user.userId: user.userName};
    }
  }

  String _nameOf(AppLocalizations l10n, String userId) {
    if (sameUserId(userId, _me)) return l10n.chatYou;
    final known = _service.displayNameFor(userId);
    if (known != null) return known;
    for (final entry in _names.entries) {
      if (sameUserId(entry.key, userId)) return entry.value;
    }
    return userId;
  }

  /// An admin manages everyone but the owner, and only the owner manages
  /// other admins. The plugin enforces the same rules.
  bool _canManage(ChatConversation conversation, String userId) {
    final me = _me;
    if (sameUserId(userId, me) || !conversation.isAdmin(me)) return false;
    if (conversation.isOwner(userId)) return false;
    return !conversation.isAdmin(userId) || conversation.isOwner(me);
  }

  Future<void> _write(
    Future<SocialWrite<void>> Function(MediaServerClient client) action,
  ) async {
    final client = _client();
    if (client == null || _busy) return;
    setState(() => _busy = true);
    final write = await action(client);
    if (!mounted) return;
    setState(() => _busy = false);
    if (!_reportWrite(context, write)) return;
    await _service.refreshSocial(client);
    await reload();
  }

  Future<void> _rename() => _write(
    (client) =>
        _service.renameGroup(client, widget.conversationId, _name.text.trim()),
  );

  Future<void> _manage(
    AppLocalizations l10n,
    ChatConversation conversation,
    String userId,
  ) async {
    final isAdmin = conversation.isAdmin(userId);
    final action = await _choose<String>(
      context,
      title: _nameOf(l10n, userId),
      choices: [
        if (!isAdmin) (l10n.chatMakeAdmin, 'promote'),
        if (isAdmin && conversation.isOwner(_me))
          (l10n.chatRemoveAdmin, 'demote'),
        (l10n.chatRemoveMember, 'remove'),
      ],
    );
    if (!mounted || action == null) return;
    await _write(
      (client) => action == 'remove'
          ? _service.removeGroupMember(client, widget.conversationId, userId)
          : _service.setGroupAdmin(
              client,
              widget.conversationId,
              userId,
              admin: action == 'promote',
            ),
    );
  }

  Future<void> _add(
    AppLocalizations l10n,
    ChatConversation conversation,
  ) async {
    final people = [
      for (final friend in _service.friends?.friends ?? const <Friend>[])
        if (!conversation.participantIds.any(
          (id) => sameUserId(id, friend.userId),
        ))
          SocialUser(userId: friend.userId, userName: friend.userName),
    ];
    await context.pushSettingsScreen(
      _PickPersonScreen(
        title: l10n.chatAddMember,
        people: people,
        empty: l10n.chatNobodyToAdd,
        onPicked: (pickerContext, user) async {
          final client = _client();
          if (client == null) return;
          final write = await _service.addGroupMember(
            client,
            widget.conversationId,
            user.userId,
          );
          if (!pickerContext.mounted || !_reportWrite(pickerContext, write)) {
            return;
          }
          Navigator.of(pickerContext).pop();
        },
      ),
    );
    if (mounted) await reload();
  }

  Future<void> _clear(AppLocalizations l10n) async {
    final go = await _confirm(
      context,
      title: l10n.chatClear,
      body: l10n.chatClearBody,
    );
    if (!go || !mounted) return;
    await _write(
      (client) => _service.clearConversation(client, widget.conversationId),
    );
  }

  Future<void> _leave(AppLocalizations l10n) async {
    final go = await _confirm(
      context,
      title: l10n.chatLeave,
      body: l10n.chatLeaveBody,
    );
    final client = _client();
    if (!go || client == null || !mounted) return;
    final write = await _service.removeGroupMember(
      client,
      widget.conversationId,
      _me,
    );
    if (!mounted || !_reportWrite(context, write)) return;
    await _service.refreshSocial(client);
    if (!mounted) return;
    // Back past the chat too, since the user is no longer in it.
    Navigator.of(context).pop();
    _closeScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _AchievementsScaffold(
      title: l10n.chatGroupInfo,
      builder: (context) {
        if (loading) return const Center(child: CircularProgressIndicator());
        final conversation = _conversation;
        if (conversation == null) {
          return _RetryPanel(
            message: l10n.friendsLoadFailed,
            onRetry: () {
              setState(() => loading = true);
              reload();
            },
          );
        }

        return ListView(
          padding: _listPadding(context),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: _SocialTextField(
                controller: _name,
                hint: l10n.chatGroupName,
                maxLength: 100,
                onSubmitted: (_) => _rename(),
              ),
            ),
            adaptiveListSection(
              children: [
                DpadListTile(
                  enabled: !_busy,
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.drive_file_rename_outline),
                  title: Text(l10n.rename),
                  onTap: _rename,
                ),
              ],
            ),
            SettingsSectionHeader(
              l10n.chatMemberCount(conversation.participantIds.length),
            ),
            adaptiveListSection(
              children: [
                for (final id in conversation.participantIds)
                  _PersonTile(
                    userId: id,
                    name: _nameOf(l10n, id),
                    subtitle: conversation.isOwner(id)
                        ? l10n.chatOwner
                        : conversation.isAdmin(id)
                        ? l10n.chatAdmin
                        : null,
                    onTap: _canManage(conversation, id) && !_busy
                        ? () => _manage(l10n, conversation, id)
                        : null,
                  ),
              ],
            ),
            adaptiveListSection(
              children: [
                DpadListTile(
                  enabled: !_busy,
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.person_add),
                  title: Text(l10n.chatAddMember),
                  onTap: () => _add(l10n, conversation),
                ),
                DpadListTile(
                  enabled: !_busy,
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.delete_sweep),
                  title: Text(l10n.chatClear),
                  onTap: () => _clear(l10n),
                ),
                DpadListTile(
                  enabled: !_busy,
                  useSettingsIconShell: true,
                  leading: const Icon(Icons.logout),
                  title: Text(l10n.chatLeave),
                  onTap: () => _leave(l10n),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
