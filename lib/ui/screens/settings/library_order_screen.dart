import 'dart:async';

import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart' show UserConfiguration;

import '../../../data/models/aggregated_library.dart';
import '../../../data/repositories/user_views_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/scroll_utils.dart';
import '../../../util/game_library.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import 'settings_app_bar.dart';

/// The order the user's libraries appear in on My Media, the latest rows and
/// the navigation bars. This is the server's own library order, so every app
/// signed in to the account follows it.
class LibraryOrderScreen extends StatefulWidget {
  const LibraryOrderScreen({super.key});

  @override
  State<LibraryOrderScreen> createState() => _LibraryOrderScreenState();
}

class _LibraryOrderScreenState extends State<LibraryOrderScreen> {
  /// A run of moves goes out as one write instead of one per move.
  static const _saveDelay = Duration(milliseconds: 600);

  final _viewsRepo = GetIt.instance<UserViewsRepository>();

  /// Kept by id so a row holds on to its focus while it travels.
  final _focusNodesById = <String, FocusNode>{};

  List<AggregatedLibrary>? _libraries;
  Set<String> _hidden = const {};
  bool _isLoading = true;
  bool _loadFailed = false;

  /// Where a remote lands when the list first shows, kept even as rows move.
  String? _initialFocusId;

  /// The order the server last took, which a failed write goes back to.
  List<AggregatedLibrary> _savedOrder = const [];
  Timer? _saveTimer;
  Future<void> _saveQueue = Future.value();
  int _lastQueuedSaveId = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    // Backing out right after a move still keeps the move.
    if (_saveTimer?.isActive ?? false) {
      _saveTimer!.cancel();
      unawaited(_save());
    }
    for (final node in _focusNodesById.values) {
      node.dispose();
    }
    super.dispose();
  }

  FocusNode _focusNodeFor(String id) => _focusNodesById.putIfAbsent(
    id,
    () => FocusNode(debugLabel: 'library_order $id'),
  );

  List<FocusNode> get _focusNodes => [
    for (final library in _libraries ?? const <AggregatedLibrary>[])
      _focusNodeFor(library.id),
  ];

  void _retry() {
    setState(() {
      _isLoading = true;
      _loadFailed = false;
    });
    _load();
  }

  Future<void> _load() async {
    try {
      final results = await Future.wait([
        _viewsRepo.getAllViewsIncludingHidden(),
        _viewsRepo.getUserConfiguration(),
      ]);
      if (!mounted) return;
      final libraries = results[0] as List<AggregatedLibrary>;
      setState(() {
        _libraries = libraries;
        _savedOrder = libraries;
        _hidden = (results[1] as UserConfiguration).myMediaExcludes.toSet();
        _isLoading = false;
        _initialFocusId = libraries.isEmpty ? null : libraries.first.id;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _loadFailed = true;
      });
    }
  }

  void _moveTo(int index, int newIndex) {
    final libraries = _libraries;
    if (libraries == null ||
        newIndex < 0 ||
        newIndex >= libraries.length ||
        index == newIndex) {
      return;
    }
    setState(() {
      final next = [...libraries];
      next.insert(newIndex, next.removeAt(index));
      _libraries = next;
    });
    _saveTimer?.cancel();
    _saveTimer = Timer(_saveDelay, _save);
    focusItemAndEnsureVisible(
      isMounted: () => mounted,
      focusNodes: _focusNodes,
      index: newIndex,
    );
  }

  /// The server replaces the whole configuration on every write, so each save
  /// starts from the configuration as it is now. Anything changed elsewhere
  /// since this screen opened would otherwise be put back.
  Future<void> _save() {
    final libraries = _libraries;
    if (libraries == null) return Future.value();
    final saveId = ++_lastQueuedSaveId;

    // Queued so writes land in the order they were made and a slow one can't
    // undo a later move.
    _saveQueue = _saveQueue.then((_) async {
      try {
        final config = await _viewsRepo.getUserConfiguration();
        await _viewsRepo.updateUserConfiguration(
          config.copyWith(
            orderedViews: [for (final library in libraries) library.id],
          ),
        );
        _savedOrder = libraries;
        homeRefreshBus.requestNowOrAfterNavigation();
      } catch (_) {
        if (!mounted || saveId != _lastQueuedSaveId) return;
        _saveTimer?.cancel();
        setState(() => _libraries = _savedOrder);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).libraryOrderSaveFailed),
          ),
        );
      }
    });
    return _saveQueue;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final libraries = _libraries;
    final ready = libraries != null && libraries.isNotEmpty;
    final initialFocusId = _initialFocusId;

    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(context, Text(l10n.libraryOrder)),
          body: !ready
              ? ListView(
                  children: [
                    _buildHeader(l10n),
                    if (_isLoading)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (_loadFailed)
                      _buildMessage(l10n.failedToLoadLibraries, onRetry: _retry)
                    else
                      _buildMessage(l10n.noLibrariesFound),
                  ],
                )
              : PlatformDetection.isTV
              // Nothing is focusable on TV while the rows load, so the outer
              // request settles on the route and never passes focus on. The
              // rows ask for it themselves once they show up.
              ? RequestInitialFocus(
                  key: const ValueKey('library_order_rows'),
                  targetNode: initialFocusId != null
                      ? _focusNodeFor(initialFocusId)
                      : null,
                  child: _buildTvList(l10n),
                )
              : _buildReorderableList(l10n),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final theme = Theme.of(context);
    final hint = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.libraryOrderDescription, style: hint),
          if (PlatformDetection.isTV) ...[
            const SizedBox(height: 4),
            Text(l10n.libraryOrderTvHint, style: hint),
          ],
        ],
      ),
    );
  }

  Widget _buildMessage(String text, {VoidCallback? onRetry}) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
    child: Column(
      children: [
        Text(text, textAlign: TextAlign.center),
        if (onRetry != null) ...[
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onRetry,
            child: Text(AppLocalizations.of(context).retry),
          ),
        ],
      ],
    ),
  );

  Widget _buildReorderableList(AppLocalizations l10n) {
    final libraries = _libraries!;
    final handleColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return ListView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      children: [
        _buildHeader(l10n),
        ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          buildDefaultDragHandles: false,
          itemCount: libraries.length,
          onReorderItem: _moveTo,
          itemBuilder: (context, index) {
            final library = libraries[index];
            final handle = Icon(Icons.drag_handle, color: handleColor);
            return _LibraryOrderTile(
              key: ValueKey(library.id),
              focusNode: _focusNodeFor(library.id),
              library: library,
              hiddenLabel: _hidden.contains(library.id) ? l10n.hidden : null,
              isFirst: index == 0,
              isLast: index == libraries.length - 1,
              // Phones need a long press so a swipe over the handle still
              // scrolls. A mouse drags straight away.
              trailing: PlatformDetection.useMobileUi
                  ? ReorderableDelayedDragStartListener(
                      index: index,
                      child: handle,
                    )
                  : ReorderableDragStartListener(index: index, child: handle),
              onMoveUp: () => _moveTo(index, index - 1),
              onMoveDown: () => _moveTo(index, index + 1),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTvList(AppLocalizations l10n) {
    final libraries = _libraries!;
    return CustomScrollView(
      scrollCacheExtent: const ScrollCacheExtent.pixels(3000.0),
      slivers: [
        SliverToBoxAdapter(child: _buildHeader(l10n)),
        ReorderableAnimatedListImpl<AggregatedLibrary>(
          items: libraries,
          scrollDirection: Axis.vertical,
          isSameItem: (a, b) => a.id == b.id,
          enableSwap: true,
          enterTransition: [FadeIn(), SizeAnimation()],
          exitTransition: [FadeIn(), SizeAnimation()],
          itemBuilder: (context, index) {
            final library = libraries[index];
            return _LibraryOrderTile(
              key: ValueKey(library.id),
              focusNode: _focusNodeFor(library.id),
              library: library,
              hiddenLabel: _hidden.contains(library.id) ? l10n.hidden : null,
              isFirst: index == 0,
              isLast: index == libraries.length - 1,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (index != 0) const Icon(Icons.arrow_left, size: 18),
                  if (index != libraries.length - 1)
                    const Icon(Icons.arrow_right, size: 18),
                ],
              ),
              onMoveUp: () => _moveTo(index, index - 1),
              onMoveDown: () => _moveTo(index, index + 1),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _LibraryOrderTile extends StatefulWidget {
  final FocusNode focusNode;
  final AggregatedLibrary library;
  final String? hiddenLabel;
  final bool isFirst;
  final bool isLast;
  final Widget trailing;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  const _LibraryOrderTile({
    super.key,
    required this.focusNode,
    required this.library,
    required this.hiddenLabel,
    required this.isFirst,
    required this.isLast,
    required this.trailing,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  State<_LibraryOrderTile> createState() => _LibraryOrderTileState();
}

class _LibraryOrderTileState extends State<_LibraryOrderTile> {
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(covariant _LibraryOrderTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _focused = widget.focusNode.hasFocus;
  }

  void _ensureFocusedTileVisible() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_focused) return;
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        alignment: 0.2,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
    });
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft && !widget.isFirst) {
      widget.onMoveUp();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight && !widget.isLast) {
      widget.onMoveDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg = _focused
        ? colorScheme.primary.withValues(alpha: 0.18)
        : Colors.transparent;

    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (focused) {
        if (_focused != focused && mounted) {
          setState(() => _focused = focused);
        }
        if (focused) _ensureFocusedTileVisible();
      },
      onKeyEvent: _onKey,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        color: bg,
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
            leading: Icon(_libraryIcon(widget.library)),
            title: Text(widget.library.name),
            subtitle: widget.hiddenLabel != null
                ? Text(widget.hiddenLabel!)
                : null,
            trailing: widget.trailing,
          ),
        ),
      ),
    );
  }
}

IconData _libraryIcon(AggregatedLibrary library) {
  if (isGameLibrary(library.id, library.collectionType, library.name)) {
    return gameLibraryIcon;
  }
  return switch (library.collectionType.toLowerCase()) {
    'movies' => Icons.movie_rounded,
    'tvshows' => Icons.tv_rounded,
    'music' => Icons.music_note_rounded,
    'books' || 'audiobooks' => Icons.menu_book_rounded,
    'livetv' => Icons.live_tv_rounded,
    'homevideos' || 'photos' => Icons.photo_library_rounded,
    'boxsets' => Icons.collections_bookmark_rounded,
    'playlists' => Icons.playlist_play_rounded,
    _ => Icons.video_library_rounded,
  };
}
