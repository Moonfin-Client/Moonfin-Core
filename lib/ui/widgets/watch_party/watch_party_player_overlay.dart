import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_silo/server_silo.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../../watch_party/silo_watch_party_manager.dart';
import '../../screens/watch_party/silo_watch_party_screen.dart';
import '../overlay_sheet.dart';
import '../track_selector_dialog.dart';

/// The six reactions as drawn glyphs, so they look the same on every
/// platform instead of following the system's emoji.
const _glyphs = {
  'love':
      '<svg viewBox="0 0 24 24"><path d="M12 21s-7.6-4.7-9.7-9.3C.8 8.3 2.9 4.4 6.8 4.4c2.1 0 3.6 1.1 5.2 3 1.6-1.9 3.1-3 5.2-3 3.9 0 6 3.9 4.5 7.3C19.6 16.3 12 21 12 21z" fill="#ff5c7c"/></svg>',
  'haha':
      '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#ffc93c"/><path d="M7.4 9.8q1.3-1.6 2.6 0M14 9.8q1.3-1.6 2.6 0" stroke="#4a3300" stroke-width="1.6" fill="none" stroke-linecap="round"/><path d="M6.8 13h10.4a5.2 5.2 0 0 1-10.4 0z" fill="#4a3300"/></svg>',
  'wow':
      '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#ffc93c"/><circle cx="8.8" cy="9.8" r="1.4" fill="#4a3300"/><circle cx="15.2" cy="9.8" r="1.4" fill="#4a3300"/><ellipse cx="12" cy="15.6" rx="2.3" ry="2.9" fill="#4a3300"/></svg>',
  'sad':
      '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" fill="#ffc93c"/><circle cx="8.8" cy="10" r="1.4" fill="#4a3300"/><circle cx="15.2" cy="10" r="1.4" fill="#4a3300"/><path d="M8.4 17q3.6-3.2 7.2 0" stroke="#4a3300" stroke-width="1.6" fill="none" stroke-linecap="round"/><path d="M16.8 12.2s1.5 1.9 1.5 2.9a1.5 1.5 0 0 1-3 0c0-1 1.5-2.9 1.5-2.9z" fill="#4fb0ff"/></svg>',
  'fire':
      '<svg viewBox="0 0 24 24"><path d="M12 1.8c1 3.6 5.4 5.6 5.4 11.4a5.4 5.4 0 0 1-10.8 0c0-2.6 1.3-4.2 2.5-5.2.2 1.8 1.1 2.8 2.1 3.3C10.9 8.4 11.4 4.9 12 1.8z" fill="#ff7a29"/><path d="M12 12.2c.6 1.5 2.4 2.5 2.4 4.5a2.4 2.4 0 0 1-4.8 0c0-1.3.8-2.1 1.5-2.7.1.7.4 1.1.9 1.3-.3-1.1-.2-2.1 0-3.1z" fill="#ffd23c"/></svg>',
  'popcorn':
      '<svg viewBox="0 0 24 24"><circle cx="7.6" cy="9.4" r="2.6" fill="#ffe9a8"/><circle cx="12" cy="7.6" r="3" fill="#fff2c9"/><circle cx="16.4" cy="9.4" r="2.6" fill="#ffe9a8"/><circle cx="10" cy="5.4" r="2.1" fill="#ffe9a8"/><circle cx="14.2" cy="5.6" r="2.1" fill="#fff2c9"/><path d="M5.6 10.4h12.8l-1.7 11H7.3z" fill="#f2f2f2"/><path d="M9.2 10.4l.6 11M12 10.4v11M14.8 10.4l-.6 11" stroke="#e5484d" stroke-width="1.7"/></svg>',
};

String watchPartyReactionName(AppLocalizations l10n, String reaction) =>
    switch (reaction) {
      'love' => l10n.watchPartyReactionLove,
      'haha' => l10n.watchPartyReactionHaha,
      'wow' => l10n.watchPartyReactionWow,
      'sad' => l10n.watchPartyReactionSad,
      'fire' => l10n.watchPartyReactionFire,
      _ => l10n.watchPartyReactionPopcorn,
    };

class WatchPartyReactionGlyph extends StatelessWidget {
  const WatchPartyReactionGlyph(this.reaction, {super.key, this.size = 32});

  final String reaction;
  final double size;

  @override
  Widget build(BuildContext context) => Semantics(
    label: watchPartyReactionName(AppLocalizations.of(context), reaction),
    child: SvgPicture.string(
      _glyphs[reaction] ?? _glyphs['love']!,
      width: size,
      height: size,
    ),
  );
}

SiloWatchPartyManager get _manager => GetIt.instance<SiloWatchPartyManager>();

/// Over the video while a Moonbase room plays: toasts naming who did what,
/// rising reactions, the wait for everyone's player and the 3, 2, 1, the
/// last chat lines (unless Show chat over the video is off), and on a phone
/// held upright the chat under the video. [bottomInset] keeps clear of the
/// controls while they show.
class WatchPartyPlayerOverlay extends StatefulWidget {
  const WatchPartyPlayerOverlay({super.key, this.bottomInset = 0});

  final double bottomInset;

  @override
  State<WatchPartyPlayerOverlay> createState() =>
      _WatchPartyPlayerOverlayState();
}

class _WatchPartyPlayerOverlayState extends State<WatchPartyPlayerOverlay>
    with TickerProviderStateMixin {
  static const _toastFor = Duration(milliseconds: 3500);
  static const _chatFor = Duration(seconds: 6);

  final List<(WatchPartyToast, DateTime)> _toasts = [];
  final List<_Rising> _rising = [];
  final Map<WatchPartyChatEntry, DateTime> _arrived = {};
  final Set<WatchPartyChatEntry> _seen = {};
  StreamSubscription<WatchPartyToast>? _toastSub;
  StreamSubscription<WatchPartyReaction>? _reactionSub;
  Timer? _tick;
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    // Only what arrives from now on shows over the video.
    _seen.addAll(_manager.chat);
    _toastSub = _manager.toasts.listen((toast) {
      setState(() => _toasts.add((toast, DateTime.now())));
      _scheduleTick();
    });
    _reactionSub = _manager.reactions.listen(_rise);
    _manager.addListener(_onManager);
  }

  @override
  void dispose() {
    _toastSub?.cancel();
    _reactionSub?.cancel();
    _manager.removeListener(_onManager);
    _tick?.cancel();
    for (final r in _rising) {
      r.controller.dispose();
    }
    super.dispose();
  }

  void _onManager() {
    final now = DateTime.now();
    for (final entry in _manager.chat) {
      if (_seen.add(entry)) _arrived[entry] = now;
    }
    _scheduleTick();
    if (mounted) setState(() {});
  }

  /// Redraws while something counts down or is due to fade.
  void _scheduleTick() {
    if (_tick != null) return;
    _tick = Timer.periodic(const Duration(milliseconds: 250), (_) {
      final now = DateTime.now();
      _toasts.removeWhere((t) => now.difference(t.$2) > _toastFor);
      _arrived.removeWhere((_, at) => now.difference(at) > _chatFor);
      final busy =
          _toasts.isNotEmpty ||
          _arrived.isNotEmpty ||
          _manager.waitingSince != null ||
          _manager.countdownTo != null;
      if (!busy) {
        _tick?.cancel();
        _tick = null;
      }
      if (mounted) setState(() {});
    });
  }

  void _rise(WatchPartyReaction reaction) {
    if (_rising.length >= 12) return;
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );
    final rising = _Rising(reaction, controller, _random.nextDouble());
    controller.forward().whenComplete(() {
      if (!mounted) return;
      setState(() => _rising.remove(rising));
      controller.dispose();
    });
    setState(() => _rising.add(rising));
  }

  @override
  Widget build(BuildContext context) {
    final room = _manager.room;
    if (room == null || !_manager.isMoonbase) return const SizedBox.shrink();
    final media = MediaQuery.of(context);
    final portrait =
        PlatformDetection.useMobileUi &&
        media.orientation == Orientation.portrait;
    final chatOver =
        !portrait &&
        room.chatEnabled &&
        GetIt.instance<UserPreferences>().get(
          UserPreferences.watchPartyChatOverlay,
        );
    // A centered 16:9 picture leaves this much below it when held upright.
    final belowVideo = portrait
        ? (media.size.height - media.size.width * 9 / 16) / 2
        : 0.0;
    final chatBelow = portrait && belowVideo > 120;
    // Reactions rise from above the chat panel when it's there, or they'd
    // pass behind it.
    final riseFrom = chatBelow ? belowVideo : widget.bottomInset;
    return Stack(
      children: [
        if (_toasts.isNotEmpty)
          Positioned(
            top: media.padding.top + 72,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Column(
                children: [
                  for (final (toast, _) in _toasts.reversed.take(3))
                    _Toast(toast: toast, room: room),
                ],
              ),
            ),
          ),
        if (_manager.countdownTo case final to?)
          Positioned.fill(child: IgnorePointer(child: _Countdown(to: to)))
        else if (_manager.waitingSince case final since?)
          Positioned.fill(
            child: IgnorePointer(
              child: _Waiting(room: room, since: since),
            ),
          ),
        for (final r in _rising)
          AnimatedBuilder(
            animation: r.controller,
            builder: (context, _) {
              final t = r.controller.value;
              return Positioned(
                right: 32 + r.drift * 60 + math.sin(t * math.pi * 2) * 10,
                bottom: riseFrom + 80 + t * 260,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (1 - t).clamp(0.0, 1.0),
                    child: Column(
                      children: [
                        WatchPartyReactionGlyph(r.reaction.reaction, size: 40),
                        if (r.reaction.name.isNotEmpty)
                          Text(
                            r.reaction.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              shadows: [Shadow(blurRadius: 4)],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        if (chatOver && _arrived.isNotEmpty)
          Positioned(
            left: 24,
            bottom: widget.bottomInset + 24,
            width: 420,
            child: IgnorePointer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final entry in _arrived.keys.toList().reversed
                      .take(3)
                      .toList()
                      .reversed)
                    _ChatLine(entry: entry, room: room),
                ],
              ),
            ),
          ),
        if (chatBelow)
          Positioned(
            left: 0,
            right: 0,
            bottom: widget.bottomInset,
            height: math.max(0, belowVideo - widget.bottomInset),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: const ColoredBox(
                color: Colors.black,
                child: WatchPartyChatView(),
              ),
            ),
          ),
      ],
    );
  }
}

class _Rising {
  _Rising(this.reaction, this.controller, this.drift);

  final WatchPartyReaction reaction;
  final AnimationController controller;
  final double drift;
}

IconData _toastIcon(WatchPartyToastKind kind) => switch (kind) {
  WatchPartyToastKind.paused => Icons.pause_rounded,
  WatchPartyToastKind.resumed => Icons.play_arrow_rounded,
  WatchPartyToastKind.skipped => Icons.fast_forward_rounded,
  WatchPartyToastKind.joined => Icons.person_add_alt_1_rounded,
  WatchPartyToastKind.left => Icons.person_remove_alt_1_rounded,
  WatchPartyToastKind.youAreHost ||
  WatchPartyToastKind.newHost => Icons.workspace_premium_rounded,
  WatchPartyToastKind.policyChanged => Icons.groups_2_rounded,
  WatchPartyToastKind.switched => Icons.movie_outlined,
  WatchPartyToastKind.noAccess => Icons.block_rounded,
  WatchPartyToastKind.reconnecting => Icons.wifi_rounded,
  WatchPartyToastKind.reconnected => Icons.check_rounded,
  WatchPartyToastKind.ended => Icons.close_rounded,
  WatchPartyToastKind.hostOnly => Icons.lock_outline_rounded,
};

class _Toast extends StatelessWidget {
  const _Toast({required this.toast, required this.room});

  final WatchPartyToast toast;
  final SiloRoom room;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 14, 6),
      decoration: BoxDecoration(
        color: const Color(0xE61A1A1A),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColorScheme.accent.withValues(alpha: 0.25),
            child: Icon(
              _toastIcon(toast.kind),
              size: 14,
              color: AppColorScheme.accent,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            watchPartyToastText(AppLocalizations.of(context), toast, room),
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    ),
  );
}

class _ChatLine extends StatelessWidget {
  const _ChatLine({required this.entry, required this.room});

  final WatchPartyChatEntry entry;
  final SiloRoom room;

  @override
  Widget build(BuildContext context) {
    final notice = entry.notice;
    final l10n = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xCC111111),
        borderRadius: BorderRadius.circular(12),
      ),
      child: notice != null
          ? Text(
              watchPartyToastText(l10n, notice, room),
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
            )
          : Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${entry.name}  ',
                    style: TextStyle(
                      color: AppColorScheme.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: entry.text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
    );
  }
}

/// Everyone's faces, waiting for the players still loading, with the ten
/// seconds the room gives them.
class _Waiting extends StatelessWidget {
  const _Waiting({required this.room, required this.since});

  final SiloRoom room;
  final DateTime since;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final waitingOn = room.members
        .where((m) => m.connected && m.status != 'ready')
        .toList();
    final left = math.max(
      0,
      10 - DateTime.now().difference(since).inSeconds,
    );
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xE6101010),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: 8,
              children: [
                for (final m in room.members.where((m) => m.connected))
                  Opacity(
                    opacity: m.status == 'ready' ? 1 : 0.4,
                    child: CircleAvatar(
                      backgroundColor: AppColorScheme.accent,
                      foregroundColor: AppColorScheme.onAccent,
                      child: Text(
                        m.displayName.isEmpty
                            ? '?'
                            : m.displayName.characters.first.toUpperCase(),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              waitingOn.length == 1
                  ? l10n.watchPartyWaitingFor(waitingOn.single.displayName)
                  : l10n.watchPartyWaitingForCount(waitingOn.length),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.watchPartyStartingAnyway(left),
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Countdown extends StatelessWidget {
  const _Countdown({required this.to});

  final DateTime to;

  @override
  Widget build(BuildContext context) {
    final ms = to.difference(DateTime.now()).inMilliseconds;
    final n = (ms / 1000).ceil().clamp(1, 3);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$n',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 120,
              fontWeight: FontWeight.w800,
              shadows: [Shadow(blurRadius: 24)],
            ),
          ),
          Text(
            AppLocalizations.of(context).watchPartyStartingTogether,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

/// The room's chat with a reaction strip and a chat bar.
class WatchPartyChatView extends StatefulWidget {
  const WatchPartyChatView({super.key});

  @override
  State<WatchPartyChatView> createState() => _WatchPartyChatViewState();
}

class _WatchPartyChatViewState extends State<WatchPartyChatView> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _send() {
    if (_manager.sendChat(_controller.text)) _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListenableBuilder(
      listenable: _manager,
      builder: (context, _) {
        final room = _manager.room;
        if (room == null) return const SizedBox.shrink();
        final chat = _manager.chat;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scroll,
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: chat.length,
                itemBuilder: (context, i) =>
                    _ChatLine(entry: chat[chat.length - 1 - i], room: room),
              ),
            ),
            if (room.reactionsEnabled) const _ReactionStrip(),
            if (room.chatEnabled)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                // The player's own shortcuts mustn't see what's typed here.
                child: Focus(
                  onKeyEvent: (_, _) => KeyEventResult.skipRemainingHandlers,
                  child: TextField(
                    controller: _controller,
                    maxLength: 500,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: l10n.watchPartySendToParty,
                      counterText: '',
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.08),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        tooltip: l10n.send,
                        icon: const Icon(Icons.send_rounded),
                        onPressed: _send,
                      ),
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ReactionStrip extends StatelessWidget {
  const _ReactionStrip();

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      for (final kind in WatchPartyReaction.kinds)
        IconButton(
          tooltip: watchPartyReactionName(AppLocalizations.of(context), kind),
          icon: WatchPartyReactionGlyph(kind, size: 28),
          onPressed: () => _manager.sendReaction(kind),
        ),
    ],
  );
}

/// TV's quick bar: the reactions, five quick replies and Type.
class WatchPartyQuickBar extends StatelessWidget {
  const WatchPartyQuickBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final room = _manager.room;
    final replies = [
      l10n.watchPartyReplyHaha,
      l10n.watchPartyReplyNoWay,
      l10n.watchPartyReplyPausePlease,
      l10n.watchPartyReplyBrb,
      l10n.watchPartyReplyAgain,
    ];
    final style = ButtonStyle(
      side: WidgetStateProperty.resolveWith(
        (states) => BorderSide(
          color: states.contains(WidgetState.focused)
              ? AppColorScheme.accent
              : Colors.white.withValues(alpha: 0.2),
          width: states.contains(WidgetState.focused) ? 2 : 1,
        ),
      ),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (room?.reactionsEnabled != false)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final kind in WatchPartyReaction.kinds)
                OutlinedButton(
                  style: style,
                  onPressed: () => _manager.sendReaction(kind),
                  child: WatchPartyReactionGlyph(kind, size: 28),
                ),
            ],
          ),
        if (room?.chatEnabled != false) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final reply in replies)
                OutlinedButton(
                  style: style,
                  onPressed: () => _manager.sendChat(reply),
                  child: Text(reply),
                ),
              OutlinedButton.icon(
                style: style,
                icon: const Icon(Icons.keyboard_outlined),
                label: Text(l10n.watchPartyType),
                onPressed: () async {
                  final text = await askWatchPartyMessage(context);
                  if (text != null) _manager.sendChat(text);
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            l10n.watchPartyBackToClose,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
          ),
        ],
      ],
    );
  }
}

/// Party controls in the player. TV gets the quick bar over the people and
/// host controls in a sheet, desktop a side panel with Chat and People
/// tabs, and a phone the same tabs in a sheet.
Future<void> showWatchPartyPanel(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final room = _manager.room;
  if (room == null) return Future.value();
  if (PlatformDetection.isDesktop) {
    return showStyledPlayerDialog<void>(
      context,
      title: l10n.watchParty,
      // Rebuilt with the room, so a new host or a member coming or going
      // shows while the panel is open.
      titleBuilder: (_) => ListenableBuilder(
        listenable: _manager,
        builder: (context, _) {
          final room = _manager.room;
          final host = room?.members.where((m) => m.isHost).firstOrNull;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                host == null
                    ? l10n.watchParty
                    : l10n.watchPartyHostsParty(host.displayName),
                style: playerDialogTitleStyle,
              ),
              if (room != null)
                Text(
                  l10n.watchPartyWatchingCount(
                    room.members.where((m) => m.connected).length,
                  ),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.54),
                  ),
                ),
            ],
          );
        },
      ),
      sidePanel: true,
      maxWidth: 400,
      builder: (_) => const _PanelTabs(),
    );
  }
  return showFocusRestoringModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColorScheme.surface,
    builder: (ctx) => SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(ctx).height * 0.7,
        child: PlatformDetection.isTV
            ? ListenableBuilder(
                listenable: _manager,
                builder: (ctx, _) {
                  final room = _manager.room;
                  if (room == null) return const SizedBox.shrink();
                  // Up and Down step through the sheet in reading order:
                  // the quick bar, Type, the people, and Leave last.
                  // Directional focus would drop from the replies straight
                  // to Leave, the only button lined up below them.
                  return Shortcuts(
                    shortcuts: const {
                      SingleActivator(LogicalKeyboardKey.arrowDown):
                          NextFocusIntent(),
                      SingleActivator(LogicalKeyboardKey.arrowUp):
                          PreviousFocusIntent(),
                    },
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        const WatchPartyQuickBar(),
                        const Divider(height: 32),
                        _PeopleTab(
                          room: room,
                          onDone: () => Navigator.of(ctx).pop(),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const _PanelTabs(),
      ),
    ),
  );
}

class _PanelTabs extends StatelessWidget {
  const _PanelTabs();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListenableBuilder(
      listenable: _manager,
      builder: (context, _) {
        final room = _manager.room;
        if (room == null) return const SizedBox.shrink();
        final people = room.members.where((m) => m.connected).length;
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: l10n.watchPartyChat),
                  Tab(text: '${l10n.people} · $people'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const WatchPartyChatView(),
                    ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _PeopleTab(
                          room: room,
                          onDone: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PeopleTab extends StatelessWidget {
  const _PeopleTab({required this.room, required this.onDone});

  final SiloRoom room;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) => Material(
    type: MaterialType.transparency,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WatchPartyPeople(room: room, dense: true),
        if (room.isHost) ...[
          const Divider(height: 24),
          WatchPartyHostSettings(room: room),
        ],
        const SizedBox(height: 16),
        WatchPartyExitButtons(room: room, onDone: onDone),
      ],
    ),
  );
}
