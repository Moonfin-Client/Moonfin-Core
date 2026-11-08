import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../data/viewmodels/media_bar_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../screensaver/screensaver_controller.dart';
import '../../widgets/mediabar/bookshelf_glow.dart';
import '../../widgets/overlay_sheet.dart';
import 'after_hours_canvas.dart';
import 'after_hours_game.dart';
import 'after_hours_play.dart';
import 'after_hours_scores.dart';
import 'after_hours_sound.dart';
import 'after_hours_widgets.dart';

enum _Kind { menu, page, boards, play }

typedef _View = ({_Kind kind, ArcadeGameId? id, bool howTo});

/// Moonfin After Hours, the arcade behind seven presses on Settings > About >
/// Version. A row of games on TV and desktop, a grid on a phone.
class AfterHoursScreen extends StatefulWidget {
  const AfterHoursScreen({super.key, this.scores, this.phone});

  /// Stand-ins for widget tests.
  final AfterHoursScores? scores;
  final bool? phone;

  static Future<void> open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder<void>(
          pageBuilder: (_, _, _) => const AfterHoursScreen(),
          transitionDuration: const Duration(milliseconds: 220),
          reverseTransitionDuration: const Duration(milliseconds: 160),
          transitionsBuilder: (_, anim, _, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );

  @override
  State<AfterHoursScreen> createState() => _AfterHoursScreenState();
}

/// The media bar's titles in the bookshelf's uppercase and spine colors.
List<CaseTitle> _mediaBarCaseTitles() {
  final items = GetIt.instance.maybeGet<MediaBarViewModel>()?.items;
  return [
    for (final item in items ?? const [])
      if (item.title.trim().isNotEmpty)
        (
          title: item.title.trim().toUpperCase(),
          color: glowColorForGenres(item.genres),
        ),
  ];
}

AfterHoursScores _defaultScores() {
  final getIt = GetIt.instance;
  final serverId = getIt.maybeGet<SessionRepository>()?.activeServerId;
  return AfterHoursScores(
    getIt<PreferenceStore>(),
    getIt.maybeGet<MediaServerClient>(),
    viewerName: getIt.maybeGet<UserRepository>()?.currentUser?.name ?? '',
    serverName: serverId == null
        ? null
        : getIt.maybeGet<ServerRepository>()?.getServer(serverId)?.name,
  );
}

class _AfterHoursScreenState extends State<AfterHoursScreen> {
  late final AfterHoursScores _scores = widget.scores ?? _defaultScores();
  late final bool _phone = widget.phone ?? PlatformDetection.useMobileUi;
  final List<_View> _views = [(kind: _Kind.menu, id: null, howTo: false)];
  final _playKey = GlobalKey<ArcadePlayViewState>();
  final List<CaseTitle> _titles = _mediaBarCaseTitles();
  Map<ArcadeGameId, ArcadeGame>? _stills;
  ScreensaverController? _screensaver;
  bool _closing = false;

  /// The focused card on TV, kept while a game is played.
  int _focus = 0;

  AfterHoursSound get _sound => AfterHoursSound.instance;

  @override
  void initState() {
    super.initState();
    _sound.acquire();
    _sound.music(true);
    InlineBackInterceptor.push(_onBack);
    unawaited(_scores.load());
    // The demos keep the screen busy without a key press, so hold the
    // screensaver off the way the game players do.
    _screensaver = GetIt.instance.maybeGet<ScreensaverController>()
      ?..setPlaybackActive(true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _stills ??= {
      for (final id in ArcadeGameId.values) id: _make(id)..simulate(4),
    };
  }

  @override
  void dispose() {
    InlineBackInterceptor.remove(_onBack);
    _sound.music(false);
    _sound.release();
    _screensaver?.setPlaybackActive(false);
    if (widget.scores == null) _scores.dispose();
    super.dispose();
  }

  ArcadeGame _make(ArcadeGameId id) =>
      id.create(titles: _titles, l10n: AppLocalizations.of(context));

  void _push(_View view) {
    _sound.play(ArcadeSound.select);
    setState(() => _views.add(view));
    _sound.music(view.kind != _Kind.play);
  }

  void _pop() {
    setState(() => _views.removeLast());
    _sound.music(_views.last.kind != _Kind.play);
  }

  bool _onBack() {
    if (!mounted || _closing) return true;
    final top = _views.last;
    if (top.kind == _Kind.play) {
      return _playKey.currentState?.handleBack() ?? true;
    }
    _sound.play(ArcadeSound.back);
    if (_views.length > 1) {
      _pop();
    } else {
      _closing = true;
      Navigator.of(context).pop();
    }
    return true;
  }

  void _focusCard(int index) {
    final i = index.clamp(0, ArcadeGameId.values.length);
    if (i == _focus) return;
    _sound.play(ArcadeSound.tick);
    setState(() => _focus = i);
  }

  void _activate(int index) {
    if (index < ArcadeGameId.values.length) {
      _push((kind: _Kind.play, id: ArcadeGameId.values[index], howTo: false));
    } else {
      _push((kind: _Kind.boards, id: null, howTo: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final view = _views.last;
    final Widget body = switch (view.kind) {
      _Kind.play => ArcadePlayView(
        key: _playKey,
        id: view.id!,
        make: () => _make(view.id!),
        scores: _scores,
        phone: _phone,
        onExit: _pop,
        howTo: view.howTo,
      ),
      _Kind.boards => _Leaderboards(
        scores: _scores,
        phone: _phone,
        onBack: _onBack,
      ),
      _Kind.page => _GamePage(
        id: view.id!,
        make: _make,
        scores: _scores,
        onBack: _onBack,
        onPlay: () => _push((kind: _Kind.play, id: view.id, howTo: false)),
        onHowTo: () => _push((kind: _Kind.play, id: view.id, howTo: true)),
      ),
      _Kind.menu when _phone => _PhoneMenu(
        stills: _stills!,
        scores: _scores,
        onBack: _onBack,
        onOpen: (id) => _push((kind: _Kind.page, id: id, howTo: false)),
        onBoards: () => _push((kind: _Kind.boards, id: null, howTo: false)),
      ),
      _Kind.menu => _TvMenu(
        stills: _stills!,
        scores: _scores,
        index: _focus,
        make: _make,
        onFocus: _focusCard,
        onMove: (step) => _focusCard(_focus + step),
        onActivate: () => _activate(_focus),
        onHowTo: () {
          if (_focus >= ArcadeGameId.values.length) return;
          _push((
            kind: _Kind.play,
            id: ArcadeGameId.values[_focus],
            howTo: true,
          ));
        },
      ),
    };
    return Material(color: K.night, child: body);
  }
}

/// Takes focus once it's on screen, since a TV route would otherwise leave it
/// wherever the last view had it.
class _KeyScope extends StatefulWidget {
  const _KeyScope({required this.child, required this.onKey});

  final Widget child;
  final KeyEventResult Function(KeyEvent event) onKey;

  @override
  State<_KeyScope> createState() => _KeyScopeState();
}

class _KeyScopeState extends State<_KeyScope> {
  final _node = FocusNode(debugLabel: 'AfterHours');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _node.requestFocus();
    });
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Focus(
    focusNode: _node,
    onKeyEvent: (_, event) => widget.onKey(event),
    child: widget.child,
  );
}

String _boardHeading(AppLocalizations l10n, AfterHoursScores scores) {
  final source = scores.fromServer
      ? l10n.achievementsStatsServer
      : l10n.profileThisDevice;
  return '${l10n.afterHoursTop3} · $source';
}

/// TV and desktop: one row of games over the focused game's attract demo.
class _TvMenu extends StatefulWidget {
  const _TvMenu({
    required this.stills,
    required this.scores,
    required this.index,
    required this.make,
    required this.onFocus,
    required this.onMove,
    required this.onActivate,
    required this.onHowTo,
  });

  final Map<ArcadeGameId, ArcadeGame> stills;
  final AfterHoursScores scores;
  final int index;
  final ArcadeGame Function(ArcadeGameId id) make;
  final ValueChanged<int> onFocus;

  /// Steps from the focus as the parent holds it, since several presses can
  /// land before this widget rebuilds with the new index.
  final ValueChanged<int> onMove;
  final VoidCallback onActivate;
  final VoidCallback onHowTo;

  @override
  State<_TvMenu> createState() => _TvMenuState();
}

class _TvMenuState extends State<_TvMenu> {
  late ArcadeGameId _demoId;
  late ArcadeGame _demo;

  ArcadeGameId? get _focused => widget.index < ArcadeGameId.values.length
      ? ArcadeGameId.values[widget.index]
      : null;

  @override
  void initState() {
    super.initState();
    _demoId = _focused ?? ArcadeGameId.bufferRun;
    _demo = widget.make(_demoId)..simulate(3);
  }

  @override
  void didUpdateWidget(_TvMenu old) {
    super.didUpdateWidget(old);
    final id = _focused;
    if (id != null && id != _demoId) {
      _demoId = id;
      _demo = widget.make(id)..simulate(3);
    }
  }

  KeyEventResult _onKey(KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isLeftKey || key.isRightKey) {
      widget.onMove(key.isLeftKey ? -1 : 1);
      return KeyEventResult.handled;
    }
    if (key.isDownKey) {
      if (event is KeyDownEvent) widget.onHowTo();
      return KeyEventResult.handled;
    }
    if (key.isUpKey) return KeyEventResult.handled;
    if (key.isSelectKey) {
      if (event is KeyDownEvent) widget.onActivate();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final id = _focused;
    return _KeyScope(
      onKey: _onKey,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ArcadeCanvas(
            key: ValueKey(_demo),
            game: _demo,
            demo: true,
            fit: BoxFit.cover,
          ),
          const _Shade(),
          Center(
            child: AhDesignBox(
              width: 960,
              height: 540,
              child: Stack(
                children: [
                  Positioned(
                    left: 48,
                    top: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AhKicker('Moonfin'),
                        Text(
                          l10n.afterHoursTitle,
                          style: ahDisplay(46, color: K.gold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 48,
                    top: 122,
                    width: 440,
                    child: _info(l10n, id),
                  ),
                  if (id != null)
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 270,
                      child: ListenableBuilder(
                        listenable: widget.scores,
                        builder: (context, _) => AhPanel(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AhKicker(_boardHeading(l10n, widget.scores)),
                              const SizedBox(height: 6),
                              AhBoard(
                                rows: widget.scores.boards[id] ?? const [],
                                scores: widget.scores,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Positioned(left: 48, bottom: 30, child: _row(l10n)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(AppLocalizations l10n, ArcadeGameId? id) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (id != null) AhKicker(id.genre(l10n), color: K.blue),
      const SizedBox(height: 6),
      Text(id?.name(l10n) ?? l10n.afterHoursLeaderboards, style: ahDisplay(66)),
      const SizedBox(height: 10),
      if (id != null)
        Text(
          firstSentence(id.pitch(l10n)),
          style: const TextStyle(fontSize: 17, color: Color(0xFFD4CFF2)),
        ),
      const SizedBox(height: 16),
      Wrap(
        spacing: 18,
        runSpacing: 8,
        children: [
          AhKeyHint(
            l10n.ok,
            id == null ? l10n.afterHoursLeaderboards : l10n.afterHoursPlay,
          ),
          AhKeyHint(l10n.back, l10n.aboutTitle),
          if (id != null)
            AhKeyHint(
              '',
              l10n.afterHoursHowToPlay,
              icon: Icons.keyboard_arrow_down,
            ),
        ],
      ),
    ],
  );

  Widget _row(AppLocalizations l10n) {
    final cards = [
      for (final id in ArcadeGameId.values)
        (
          label: id.name(l10n),
          art: ArcadeCanvas(game: widget.stills[id]!, still: true) as Widget,
        ),
      (
        label: l10n.afterHoursLeaderboards,
        art: const ColoredBox(
          color: K.panel,
          child: Center(
            child: Icon(Icons.emoji_events, color: K.gold, size: 44),
          ),
        ),
      ),
    ];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      transform: Matrix4.translationValues(
        -math.max(0, widget.index - 3) * 164.0,
        0,
        0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < cards.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: _card(i, cards[i].label, cards[i].art),
            ),
        ],
      ),
    );
  }

  Widget _card(int i, String label, Widget art) {
    final focused = i == widget.index;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => widget.onFocus(i),
      child: GestureDetector(
        onTap: () {
          widget.onFocus(i);
          widget.onActivate();
        },
        child: AnimatedScale(
          scale: focused ? 1.1 : 1,
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 250),
          child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 84,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: focused ? K.gold : K.line,
                      width: focused ? 3 : 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(color: Colors.black, child: art),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: focused ? K.ink : K.muted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Darkens the demo behind the menu so the text reads.
class _Shade extends StatelessWidget {
  const _Shade();

  static const _c = Color.fromRGBO(10, 8, 28, 1);

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_c.withValues(alpha: .97), _c.withValues(alpha: 0)],
            stops: const [0, .22],
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _c.withValues(alpha: .94),
              _c.withValues(alpha: .6),
              _c.withValues(alpha: .1),
            ],
            stops: const [0, .45, .78],
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [_c.withValues(alpha: .96), _c.withValues(alpha: 0)],
            stops: const [0, .46],
          ),
        ),
      ),
    ],
  );
}

class _PhoneHeader extends StatelessWidget {
  const _PhoneHeader({
    required this.title,
    required this.onBack,
    this.display = false,
    this.action,
  });

  final String title;
  final VoidCallback onBack;
  final bool display;
  final Widget? action;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(4, 4, 12, 8),
    child: Row(
      children: [
        IconButton(
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          icon: const Icon(Icons.chevron_left, color: K.ink, size: 30),
          onPressed: onBack,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: display
                ? ahDisplay(36, color: K.gold)
                : const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: K.ink,
                  ),
          ),
        ),
        ?action,
      ],
    ),
  );
}

class _PhoneMenu extends StatelessWidget {
  const _PhoneMenu({
    required this.stills,
    required this.scores,
    required this.onBack,
    required this.onOpen,
    required this.onBoards,
  });

  final Map<ArcadeGameId, ArcadeGame> stills;
  final AfterHoursScores scores;
  final bool Function() onBack;
  final ValueChanged<ArcadeGameId> onOpen;
  final VoidCallback onBoards;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PhoneHeader(
            title: l10n.afterHoursTitle,
            display: true,
            onBack: onBack,
            action: IconButton(
              tooltip: l10n.afterHoursLeaderboards,
              icon: const Icon(Icons.emoji_events, color: K.gold, size: 30),
              onPressed: onBoards,
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: scores,
              builder: (context, _) => GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.08,
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                children: [
                  for (final id in ArcadeGameId.values)
                    _phoneCard(context, l10n, id),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneCard(
    BuildContext context,
    AppLocalizations l10n,
    ArcadeGameId id,
  ) {
    final top = scores.boards[id]?.firstOrNull;
    return Material(
      color: K.panel,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: K.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onOpen(id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ArcadeCanvas(game: stills[id]!, still: true),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 8, 11, 0),
              child: Text(
                id.name(l10n),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: K.ink,
                ),
              ),
            ),
            if (top != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(11, 2, 11, 10),
                child: Row(
                  children: [
                    const Icon(Icons.emoji_events, color: K.muted, size: 13),
                    const SizedBox(width: 4),
                    Text(
                      formatScore(context, top.score),
                      style: ahMono(
                        12,
                        color: K.muted,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GamePage extends StatefulWidget {
  const _GamePage({
    required this.id,
    required this.make,
    required this.scores,
    required this.onBack,
    required this.onPlay,
    required this.onHowTo,
  });

  final ArcadeGameId id;
  final ArcadeGame Function(ArcadeGameId id) make;
  final AfterHoursScores scores;
  final bool Function() onBack;
  final VoidCallback onPlay;
  final VoidCallback onHowTo;

  @override
  State<_GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<_GamePage> {
  late final ArcadeGame _demo = widget.make(widget.id)..simulate(3);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final id = widget.id, scores = widget.scores;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PhoneHeader(title: l10n.afterHoursTitle, onBack: widget.onBack),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ArcadeCanvas(game: _demo, demo: true),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              children: [
                AhKicker(id.genre(l10n), color: K.blue),
                const SizedBox(height: 4),
                Text(id.name(l10n), style: ahDisplay(46)),
                const SizedBox(height: 8),
                Text(
                  id.pitch(l10n),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFD4CFF2),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: AhKicker(l10n.afterHoursTouch, size: 11),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        id.touchControls(l10n),
                        style: const TextStyle(fontSize: 14, color: K.ink),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: K.gold,
                    foregroundColor: K.night,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: widget.onPlay,
                  child: Text(l10n.afterHoursPlay),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: K.ink,
                    side: const BorderSide(color: K.line),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: widget.onHowTo,
                  child: Text(l10n.afterHoursHowToPlay),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.afterHoursLandscapeNote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: K.muted),
                ),
                const SizedBox(height: 16),
                ListenableBuilder(
                  listenable: scores,
                  builder: (context, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AhKicker(_boardHeading(l10n, scores)),
                      const SizedBox(height: 6),
                      AhBoard(
                        rows: scores.boards[id] ?? const [],
                        scores: scores,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Leaderboards extends StatelessWidget {
  const _Leaderboards({
    required this.scores,
    required this.phone,
    required this.onBack,
  });

  final AfterHoursScores scores;
  final bool phone;
  final bool Function() onBack;

  Widget _board(AppLocalizations l10n, ArcadeGameId id) => AhPanel(
    radius: 12,
    opacity: 1,
    padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(id.name(l10n), style: ahDisplay(26)),
        const SizedBox(height: 2),
        AhBoard(
          rows: scores.boards[id] ?? const [],
          scores: scores,
          fontSize: 14,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListenableBuilder(
      listenable: scores,
      builder: (context, _) {
        final source = Text(
          boardSource(l10n, scores),
          style: TextStyle(fontSize: phone ? 13 : 15, color: K.muted),
        );
        if (phone) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PhoneHeader(
                  title: l10n.afterHoursLeaderboards,
                  onBack: onBack,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: source,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: ArcadeGameId.values.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (_, i) => _board(l10n, ArcadeGameId.values[i]),
                  ),
                ),
              ],
            ),
          );
        }
        return _KeyScope(
          onKey: (event) => event.logicalKey.isDirectional
              ? KeyEventResult.handled
              : KeyEventResult.ignored,
          child: Center(
            child: AhDesignBox(
              width: 960,
              height: 540,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(48, 30, 48, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            l10n.afterHoursLeaderboards,
                            style: ahDisplay(50, color: K.gold),
                          ),
                        ),
                        source,
                      ],
                    ),
                    const SizedBox(height: 16),
                    LayoutBuilder(
                      builder: (context, c) {
                        final w = (c.maxWidth - 28) / 3;
                        return Wrap(
                          spacing: 14,
                          runSpacing: 14,
                          children: [
                            for (final id in ArcadeGameId.values)
                              SizedBox(width: w, child: _board(l10n, id)),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
