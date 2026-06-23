import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/services/audiobook_bookmarks_service.dart';
import '../../../data/services/audiobook_notes_service.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/cast/cast_target.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/sleep_timer_controller.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/remote_play_to_session_dialog.dart';

enum _DrawerTab { chapters, bookmarks, notes, queue }

enum _AudiobookFocusArea {
  header,
  progress,
  transport,
  actionRail,
  drawerTabs,
  drawerContent,
}

/// Audiobook playback experience. Replaces the music-style audio player when
/// the playing item is an audiobook. Visually distinct: cinematic split layout
/// on desktop/TV, stacked card on mobile, with a chapter context strip and a
/// pill-segmented drawer for chapters / bookmarks / notes / queue.
class AudiobookPlayerView extends StatefulWidget {
  const AudiobookPlayerView({super.key});

  @override
  State<AudiobookPlayerView> createState() => _AudiobookPlayerViewState();
}

class _AudiobookPlayerViewState extends State<AudiobookPlayerView> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _castService = GetIt.instance<CastService>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _mutations = GetIt.instance<ItemMutationRepository>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _bookmarks = GetIt.instance<AudiobookBookmarksService>();
  final _notes = GetIt.instance<AudiobookNotesService>();
  final _sleep = GetIt.instance<SleepTimerController>();

  final _subs = <StreamSubscription>[];
  final _tvFocus = FocusNode(debugLabel: 'AudiobookTvFocus');

  _DrawerTab _drawerTab = _DrawerTab.chapters;
  bool _drawerOpen = false;
  bool _showRemaining = false;
  bool? _localFavorite;
  String? _favoriteItemId;

  // TV navigation state.
  _AudiobookFocusArea _tvArea = _AudiobookFocusArea.transport;
  int _tvHeaderIndex = 0;
  int _tvTransportIndex = 2;
  int _tvRailIndex = 0;
  int _tvTabIndex = 0;

  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;

  @override
  void initState() {
    super.initState();
    _showRemaining = _prefs.get(UserPreferences.audiobookShowRemaining);
    final savedTab = _prefs.get(UserPreferences.audiobookDrawerTab);
    _drawerTab = _DrawerTab.values.firstWhere(
      (t) => t.name == savedTab,
      orElse: () => _DrawerTab.chapters,
    );

    _subs.addAll([
      _manager.backendChangedStream.listen((_) => _rebuild()),
      _state.playingStream.listen((_) => _rebuild()),
      _state.positionStream.listen((_) => _rebuild()),
      _state.durationStream.listen((_) => _rebuild()),
      _queue.queueChangedStream.listen((_) => _rebuild()),
    ]);
    _sleep.addListener(_rebuild);

    if (PlatformDetection.useNativeVideoSurface) {
      unawaited(_manager.backend?.setVolume(100.0));
    }

    // Apply the user's default speed when they enter an audiobook.
    final defaultSpeed = _prefs.get(UserPreferences.audiobookDefaultSpeed);
    if (defaultSpeed > 0 && (defaultSpeed - _state.playbackSpeed).abs() > 0.01) {
      unawaited(_manager.setPlaybackSpeed(defaultSpeed));
    }

    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _tvFocus.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    for (final s in _subs) {
      s.cancel();
    }
    _sleep.removeListener(_rebuild);
    _tvFocus.dispose();
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  // ---------------------------------------------------------------------------
  // Data helpers
  // ---------------------------------------------------------------------------

  AggregatedItem? _resolveItem() {
    final current = _queue.currentItem;
    if (current is AggregatedItem) return current;
    final meta = _manager.currentOfflineMetadata;
    if (meta == null) return null;
    return AggregatedItem(
      id: meta['Id'] as String? ?? '',
      serverId: meta['ServerId'] as String? ?? '',
      rawData: meta,
    );
  }

  MediaServerClient _clientForItem(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  String? _coverUrl(AggregatedItem item) {
    final client = _clientForItem(item);
    if (item.primaryImageTag != null) {
      return client.imageApi
          .getPrimaryImageUrl(item.id, maxHeight: 720, tag: item.primaryImageTag);
    }
    final albumTag = item.albumPrimaryImageTag;
    final albumId = item.albumId;
    if (albumTag != null && albumId != null) {
      return client.imageApi
          .getPrimaryImageUrl(albumId, maxHeight: 720, tag: albumTag);
    }
    return null;
  }

  String? _offlinePosterPath() =>
      _manager.currentOfflineMetadata?['_localPosterPath'] as String?;

  List<_Chapter> _chapters(AggregatedItem? item) {
    if (item == null) return const [];
    final out = <_Chapter>[];
    for (var i = 0; i < item.chapters.length; i++) {
      final chapter = item.chapters[i];
      final ticks = (chapter['StartPositionTicks'] as num?)?.toInt() ?? 0;
      final title = (chapter['Name'] as String?)?.trim();
      out.add(_Chapter(
        index: i,
        title: (title != null && title.isNotEmpty)
            ? title
            : 'Chapter ${i + 1}',
        startMs: ticks ~/ 10000,
      ));
    }
    return out;
  }

  int _currentChapterIndex(List<_Chapter> chapters, Duration position) {
    if (chapters.isEmpty) return -1;
    final ms = position.inMilliseconds;
    var idx = 0;
    for (var i = 0; i < chapters.length; i++) {
      if (chapters[i].startMs <= ms) {
        idx = i;
      } else {
        break;
      }
    }
    return idx;
  }

  bool _isFavoriteCurrent(AggregatedItem item) {
    if (_favoriteItemId != item.id) {
      _localFavorite = null;
      _favoriteItemId = item.id;
    }
    return _localFavorite ?? item.isFavorite;
  }

  Future<void> _toggleFavorite(AggregatedItem item) async {
    final next = !_isFavoriteCurrent(item);
    setState(() {
      _localFavorite = next;
      _favoriteItemId = item.id;
    });
    try {
      await _mutations.setFavorite(item.id, isFavorite: next);
    } catch (_) {
      setState(() => _localFavorite = !next);
    }
  }

  String _formatPosition(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60).abs();
    if (h > 0) {
      return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  String _formatRemaining(Duration position, Duration total) {
    final remaining = total - position;
    final speed = _state.playbackSpeed;
    if (speed <= 0) return '-${_formatPosition(remaining)}';
    final scaled = Duration(
      milliseconds: (remaining.inMilliseconds / speed).round(),
    );
    return '-${_formatPosition(scaled)}';
  }

  Future<void> _setDrawerTab(_DrawerTab tab) async {
    setState(() => _drawerTab = tab);
    await _prefs.set(UserPreferences.audiobookDrawerTab, tab.name);
  }

  Future<void> _setShowRemaining(bool value) async {
    setState(() => _showRemaining = value);
    await _prefs.set(UserPreferences.audiobookShowRemaining, value);
  }

  // ---------------------------------------------------------------------------
  // Transport
  // ---------------------------------------------------------------------------

  Future<void> _skipBack() async {
    final ms = _prefs.get(UserPreferences.skipBackLength);
    final target = _state.position - Duration(milliseconds: ms);
    await _manager.seekTo(target < Duration.zero ? Duration.zero : target);
  }

  Future<void> _skipForward() async {
    final ms = _prefs.get(UserPreferences.skipForwardLength);
    await _manager.seekTo(_state.position + Duration(milliseconds: ms));
  }

  Future<void> _jumpToChapter(_Chapter chapter) async {
    await _manager.seekTo(Duration(milliseconds: chapter.startMs));
  }

  Future<void> _previousChapter(List<_Chapter> chapters) async {
    if (chapters.isEmpty) {
      await _manager.previous();
      return;
    }
    final current = _currentChapterIndex(chapters, _state.position);
    final pos = _state.position;
    final currentStart = current >= 0 ? chapters[current].startMs : 0;
    // If more than 3s into the current chapter, restart it; otherwise go back one.
    if (pos.inMilliseconds - currentStart > 3000 || current <= 0) {
      await _jumpToChapter(chapters[current < 0 ? 0 : current]);
      return;
    }
    await _jumpToChapter(chapters[current - 1]);
  }

  Future<void> _nextChapter(List<_Chapter> chapters) async {
    if (chapters.isEmpty) {
      await _manager.next();
      return;
    }
    final current = _currentChapterIndex(chapters, _state.position);
    if (current < 0 || current >= chapters.length - 1) {
      await _manager.next();
      return;
    }
    await _jumpToChapter(chapters[current + 1]);
  }

  // ---------------------------------------------------------------------------
  // Bookmark / Note actions
  // ---------------------------------------------------------------------------

  Future<void> _addBookmark(AggregatedItem item) async {
    final pos = _state.position;
    final l10n = AppLocalizations.of(context);
    await _bookmarks.add(
      item.serverId,
      item.id,
      positionMs: pos.inMilliseconds,
      label: _formatPosition(pos),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.audiobookBookmarkAdded(_formatPosition(pos)),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _openNoteEditor(AggregatedItem item, {AudiobookNote? existing}) async {
    final wasPlaying = _state.isPlaying;
    if (wasPlaying) await _manager.pause();
    if (!mounted) return;
    final pos = existing?.positionMs ?? _state.position.inMilliseconds;
    final result = await showFocusRestoringModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => _NoteEditorSheet(
        initialText: existing?.body ?? '',
        positionLabel: _formatPosition(Duration(milliseconds: pos)),
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      if (existing == null) {
        await _notes.add(
          item.serverId,
          item.id,
          positionMs: pos,
          body: result.trim(),
        );
      } else {
        await _notes.update(
          item.serverId,
          item.id,
          existing.id,
          body: result.trim(),
        );
      }
    }
    if (wasPlaying && mounted) await _manager.resume();
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final item = _resolveItem();
    final coverUrl = item != null && !_manager.isOfflinePlayback
        ? _coverUrl(item)
        : null;
    final localPoster = _offlinePosterPath();
    final chapters = _chapters(item);

    final layout = LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 760;
        return Stack(
          fit: StackFit.expand,
          children: [
            _BlurredBackdrop(
              coverUrl: coverUrl,
              localPosterPath: localPoster,
            ),
            SafeArea(
              child: isWide
                  ? _buildSplitLayout(context, item, coverUrl, localPoster,
                      chapters)
                  : _buildStackedLayout(context, item, coverUrl, localPoster,
                      chapters),
            ),
          ],
        );
      },
    );

    final body = PlatformDetection.isTV
        ? Focus(
            focusNode: _tvFocus,
            autofocus: true,
            onKeyEvent: _handleTvKey,
            child: layout,
          )
        : layout;

    return PopScope(
      canPop: !_drawerOpen,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_drawerOpen) setState(() => _drawerOpen = false);
      },
      child: Scaffold(
        backgroundColor: AppColorScheme.background,
        body: body,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Stacked (mobile portrait) layout
  // ---------------------------------------------------------------------------

  Widget _buildStackedLayout(
    BuildContext context,
    AggregatedItem? item,
    String? coverUrl,
    String? localPoster,
    List<_Chapter> chapters,
  ) {
    return Column(
      children: [
        _Header(
          item: item,
          castService: _castService,
          isTv: PlatformDetection.isTV,
          onClose: () => Navigator.of(context).pop(),
          onCast: item != null ? () => _castToDevice(item) : null,
          onCastSettings: _showCastControls,
          onToggleDrawer: () => setState(() => _drawerOpen = !_drawerOpen),
          drawerOpen: _drawerOpen,
          tvFocusIndex: _tvArea == _AudiobookFocusArea.header ? _tvHeaderIndex : -1,
        ),
        Expanded(
          child: _drawerOpen
              ? _buildDrawer(context, item, chapters)
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceLg),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.spaceMd),
                      _CoverArt(
                        coverUrl: coverUrl,
                        localPosterPath: localPoster,
                        size: 260,
                      ),
                      const SizedBox(height: AppSpacing.spaceLg),
                      _TitleBlock(item: item, centered: true),
                      const SizedBox(height: AppSpacing.spaceMd),
                      _ChapterContextStrip(
                        chapters: chapters,
                        position: _state.position,
                        onTap: () => setState(() {
                          _drawerOpen = true;
                          _drawerTab = _DrawerTab.chapters;
                        }),
                      ),
                    ],
                  ),
                ),
        ),
        _buildBottomControls(context, item, chapters),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Split (desktop / tablet / TV) layout
  // ---------------------------------------------------------------------------

  Widget _buildSplitLayout(
    BuildContext context,
    AggregatedItem? item,
    String? coverUrl,
    String? localPoster,
    List<_Chapter> chapters,
  ) {
    final coverSize = PlatformDetection.isTV ? 360.0 : 300.0;
    return Column(
      children: [
        _Header(
          item: item,
          castService: _castService,
          isTv: PlatformDetection.isTV,
          onClose: () => Navigator.of(context).pop(),
          onCast: item != null ? () => _castToDevice(item) : null,
          onCastSettings: _showCastControls,
          onToggleDrawer: () => setState(() => _drawerOpen = !_drawerOpen),
          drawerOpen: _drawerOpen,
          tvFocusIndex: _tvArea == _AudiobookFocusArea.header ? _tvHeaderIndex : -1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceXl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left: cover + metadata.
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.spaceLg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _CoverArt(
                          coverUrl: coverUrl,
                          localPosterPath: localPoster,
                          size: coverSize,
                        ),
                        const SizedBox(height: AppSpacing.spaceLg),
                        _TitleBlock(item: item, centered: true),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.spaceXl),
                // Right: context strip + drawer or empty space; drawer is
                // optional here.
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.spaceLg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _ChapterContextStrip(
                          chapters: chapters,
                          position: _state.position,
                          onTap: () => setState(() {
                            _drawerOpen = true;
                            _drawerTab = _DrawerTab.chapters;
                          }),
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        Expanded(
                          child: _drawerOpen
                              ? _buildDrawer(context, item, chapters)
                              : _ActiveTimersPanel(
                                  sleep: _sleep,
                                  onCancelSleep: _sleep.cancel,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildBottomControls(context, item, chapters),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Shared bottom controls (progress + transport + action rail)
  // ---------------------------------------------------------------------------

  Widget _buildBottomControls(
    BuildContext context,
    AggregatedItem? item,
    List<_Chapter> chapters,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceXl,
        AppSpacing.spaceSm,
        AppSpacing.spaceXl,
        AppSpacing.spaceLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AudiobookProgressBar(
            position: _state.position,
            duration: _state.duration,
            chapters: chapters,
            showRemaining: _showRemaining,
            isTvFocused: PlatformDetection.isTV &&
                _tvArea == _AudiobookFocusArea.progress,
            speed: _state.playbackSpeed,
            onSeek: (d) => _manager.seekTo(d),
            onToggleRemaining: () => _setShowRemaining(!_showRemaining),
            formatPosition: _formatPosition,
            formatRemaining: _formatRemaining,
          ),
          const SizedBox(height: AppSpacing.spaceSm),
          _TransportRow(
            isPlaying: _state.isPlaying,
            tvFocusIndex: PlatformDetection.isTV &&
                    _tvArea == _AudiobookFocusArea.transport
                ? _tvTransportIndex
                : -1,
            skipBackSeconds:
                _prefs.get(UserPreferences.skipBackLength) ~/ 1000,
            skipForwardSeconds:
                _prefs.get(UserPreferences.skipForwardLength) ~/ 1000,
            onPrevChapter: () => _previousChapter(chapters),
            onSkipBack: _skipBack,
            onPlayPause: () =>
                _state.isPlaying ? _manager.pause() : _manager.resume(),
            onSkipForward: _skipForward,
            onNextChapter: () => _nextChapter(chapters),
          ),
          const SizedBox(height: AppSpacing.spaceSm),
          _ActionRail(
            speed: _state.playbackSpeed,
            sleepActive: _sleep.isActive,
            sleepRemaining: _sleep.remaining,
            isFavorite: item != null && _isFavoriteCurrent(item),
            tvFocusIndex: PlatformDetection.isTV &&
                    _tvArea == _AudiobookFocusArea.actionRail
                ? _tvRailIndex
                : -1,
            onOpenSpeed: () => _showSpeedSheet(),
            onOpenSleep: () => _showSleepSheet(chapters),
            onAddBookmark: item == null ? null : () => _addBookmark(item),
            onAddNote: item == null ? null : () => _openNoteEditor(item),
            onToggleFavorite: item == null ? null : () => _toggleFavorite(item),
            onOpenDrawer: () => setState(() => _drawerOpen = !_drawerOpen),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Drawer
  // ---------------------------------------------------------------------------

  Widget _buildDrawer(
    BuildContext context,
    AggregatedItem? item,
    List<_Chapter> chapters,
  ) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceMd),
      child: Column(
        children: [
          _DrawerTabBar(
            current: _drawerTab,
            tvFocused: PlatformDetection.isTV &&
                _tvArea == _AudiobookFocusArea.drawerTabs,
            tvIndex: _tvTabIndex,
            onChanged: _setDrawerTab,
            labels: {
              _DrawerTab.chapters: l10n.audiobookChapters,
              _DrawerTab.bookmarks: l10n.audiobookBookmarks,
              _DrawerTab.notes: l10n.audiobookNotes,
              _DrawerTab.queue: l10n.audiobookQueue,
            },
          ),
          const SizedBox(height: AppSpacing.spaceSm),
          Expanded(
            child: switch (_drawerTab) {
              _DrawerTab.chapters => _ChaptersList(
                  chapters: chapters,
                  position: _state.position,
                  onTap: (c) => _jumpToChapter(c),
                ),
              _DrawerTab.bookmarks => _BookmarksList(
                  item: item,
                  service: _bookmarks,
                  onJump: (b) =>
                      _manager.seekTo(Duration(milliseconds: b.positionMs)),
                ),
              _DrawerTab.notes => _NotesList(
                  item: item,
                  service: _notes,
                  onJump: (n) =>
                      _manager.seekTo(Duration(milliseconds: n.positionMs)),
                  onEdit: (n) =>
                      item != null ? _openNoteEditor(item, existing: n) : null,
                ),
              _DrawerTab.queue => _QueueList(
                  queue: _queue,
                  onPlay: (i) => _manager.playFromQueue(i),
                ),
            },
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Sheets
  // ---------------------------------------------------------------------------

  Future<void> _showSpeedSheet() async {
    await showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => _SpeedSheet(
        current: _state.playbackSpeed,
        onChanged: (v) async {
          await _manager.setPlaybackSpeed(v);
          await _prefs.set(UserPreferences.audiobookDefaultSpeed, v);
          if (mounted) setState(() {});
        },
      ),
    );
  }

  Future<void> _showSleepSheet(List<_Chapter> chapters) async {
    await showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => _SleepSheet(
        controller: _sleep,
        defaultMinutes: _prefs.get(UserPreferences.audiobookSleepPresetMin),
        onPickPreset: (minutes) async {
          await _prefs.set(UserPreferences.audiobookSleepPresetMin, minutes);
          _sleep.startDuration(Duration(minutes: minutes));
        },
        onPickEndOfChapter: () {
          _sleep.startEndOfChapter(
            chapterStartMsAscending: chapters.map((c) => c.startMs).toList(),
            currentPositionMs: _state.position.inMilliseconds,
            totalDurationMs: _state.duration.inMilliseconds,
          );
        },
        onCancel: _sleep.cancel,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Cast
  // ---------------------------------------------------------------------------

  Future<void> _castToDevice(AggregatedItem item) async {
    await showRemotePlayToSessionDialog(context, item: item);
  }

  Future<void> _showCastControls() async {
    // Placeholder: existing flow uses session controls; nothing to do here.
  }

  // ---------------------------------------------------------------------------
  // TV navigation
  // ---------------------------------------------------------------------------

  KeyEventResult _handleTvKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;

    if (key.isBackKey) {
      if (_drawerOpen) {
        setState(() => _drawerOpen = false);
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    if (key.isDirectional) {
      if (key.isUpKey) {
        _moveVertical(-1);
        return KeyEventResult.handled;
      }
      if (key.isDownKey) {
        _moveVertical(1);
        return KeyEventResult.handled;
      }
      if (key.isLeftKey) {
        _moveHorizontal(-1);
        return KeyEventResult.handled;
      }
      if (key.isRightKey) {
        _moveHorizontal(1);
        return KeyEventResult.handled;
      }
    }

    if (key.isSelectKey) {
      _activate();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _moveVertical(int delta) {
    final all = _AudiobookFocusArea.values;
    var idx = all.indexOf(_tvArea);
    final wantsDrawer = _drawerOpen;
    while (true) {
      idx += delta;
      if (idx < 0 || idx >= all.length) return;
      final candidate = all[idx];
      if ((candidate == _AudiobookFocusArea.drawerTabs ||
              candidate == _AudiobookFocusArea.drawerContent) &&
          !wantsDrawer) {
        continue;
      }
      setState(() => _tvArea = candidate);
      return;
    }
  }

  void _moveHorizontal(int delta) {
    setState(() {
      switch (_tvArea) {
        case _AudiobookFocusArea.header:
          _tvHeaderIndex = (_tvHeaderIndex + delta).clamp(0, 2);
          break;
        case _AudiobookFocusArea.progress:
          // Use as scrub.
          final step = Duration(milliseconds: 10000 * delta);
          final next = _state.position + step;
          _manager.seekTo(next < Duration.zero ? Duration.zero : next);
          break;
        case _AudiobookFocusArea.transport:
          _tvTransportIndex = (_tvTransportIndex + delta).clamp(0, 4);
          break;
        case _AudiobookFocusArea.actionRail:
          _tvRailIndex = (_tvRailIndex + delta).clamp(0, 4);
          break;
        case _AudiobookFocusArea.drawerTabs:
          _tvTabIndex =
              (_tvTabIndex + delta).clamp(0, _DrawerTab.values.length - 1);
          _drawerTab = _DrawerTab.values[_tvTabIndex];
          unawaited(_prefs.set(
              UserPreferences.audiobookDrawerTab, _drawerTab.name));
          break;
        case _AudiobookFocusArea.drawerContent:
          // delegated to the drawer itself: we don't track focus per row yet.
          break;
      }
    });
  }

  void _activate() {
    final item = _resolveItem();
    final chapters = _chapters(item);
    switch (_tvArea) {
      case _AudiobookFocusArea.header:
        if (_tvHeaderIndex == 0) {
          Navigator.of(context).pop();
        } else if (_tvHeaderIndex == 1 && item != null) {
          _castToDevice(item);
        } else if (_tvHeaderIndex == 2) {
          setState(() => _drawerOpen = !_drawerOpen);
        }
        break;
      case _AudiobookFocusArea.progress:
        break;
      case _AudiobookFocusArea.transport:
        switch (_tvTransportIndex) {
          case 0:
            _previousChapter(chapters);
            break;
          case 1:
            _skipBack();
            break;
          case 2:
            _state.isPlaying ? _manager.pause() : _manager.resume();
            break;
          case 3:
            _skipForward();
            break;
          case 4:
            _nextChapter(chapters);
            break;
        }
        break;
      case _AudiobookFocusArea.actionRail:
        switch (_tvRailIndex) {
          case 0:
            _showSpeedSheet();
            break;
          case 1:
            _showSleepSheet(chapters);
            break;
          case 2:
            if (item != null) _addBookmark(item);
            break;
          case 3:
            if (item != null) _openNoteEditor(item);
            break;
          case 4:
            if (item != null) _toggleFavorite(item);
            break;
        }
        break;
      case _AudiobookFocusArea.drawerTabs:
        setState(() => _drawerOpen = true);
        break;
      case _AudiobookFocusArea.drawerContent:
        break;
    }
  }
}

// =============================================================================
// Subordinate widgets
// =============================================================================

class _Chapter {
  final int index;
  final String title;
  final int startMs;
  const _Chapter({
    required this.index,
    required this.title,
    required this.startMs,
  });
}

class _BlurredBackdrop extends StatelessWidget {
  const _BlurredBackdrop({this.coverUrl, this.localPosterPath});
  final String? coverUrl;
  final String? localPosterPath;

  @override
  Widget build(BuildContext context) {
    Widget? bg;
    if (localPosterPath != null && File(localPosterPath!).existsSync()) {
      bg = Image.file(
        File(localPosterPath!),
        fit: BoxFit.cover,
        color: AppColorScheme.scrim.withValues(alpha: 0.6),
        colorBlendMode: BlendMode.darken,
      );
    } else if (coverUrl != null) {
      bg = CachedNetworkImage(
        imageUrl: coverUrl!,
        fit: BoxFit.cover,
        color: AppColorScheme.scrim.withValues(alpha: 0.6),
        colorBlendMode: BlendMode.darken,
      );
    }
    if (bg == null) return const SizedBox.shrink();
    return Positioned.fill(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: bg,
      ),
    );
  }
}

class _CoverArt extends StatelessWidget {
  const _CoverArt({
    this.coverUrl,
    this.localPosterPath,
    required this.size,
  });

  final String? coverUrl;
  final String? localPosterPath;
  final double size;

  @override
  Widget build(BuildContext context) {
    const bookAspectRatio = 0.68;
    final width = size * bookAspectRatio;
    final height = size;

    Widget child;
    if (localPosterPath != null && File(localPosterPath!).existsSync()) {
      child = Image.file(File(localPosterPath!), fit: BoxFit.cover);
    } else if (coverUrl != null) {
      child = CachedNetworkImage(
        imageUrl: coverUrl!,
        fit: BoxFit.cover,
        placeholder: (_, _) => _placeholder(),
        errorWidget: (_, _, _) => _placeholder(),
      );
    } else {
      child = _placeholder();
    }

    // Asymmetric offset shadow to visually distinguish from reference designs
    // that center a square cover with subtle shadow.
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 8,
            top: 12,
            right: -4,
            bottom: -8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColorScheme.accent.withValues(alpha: 0.18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 38,
                    offset: const Offset(6, 14),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(width: width, height: height, child: child),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() => Container(
        color: AppColorScheme.surfaceVariant,
        child: Icon(
          Icons.menu_book,
          size: size * 0.28,
          color: AppColorScheme.onSurface.withValues(alpha: 0.4),
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.item,
    required this.castService,
    required this.isTv,
    required this.onClose,
    required this.onCast,
    required this.onCastSettings,
    required this.onToggleDrawer,
    required this.drawerOpen,
    required this.tvFocusIndex,
  });

  final AggregatedItem? item;
  final CastService castService;
  final bool isTv;
  final VoidCallback onClose;
  final VoidCallback? onCast;
  final VoidCallback onCastSettings;
  final VoidCallback onToggleDrawer;
  final bool drawerOpen;
  final int tvFocusIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceSm,
        vertical: AppSpacing.spaceXs,
      ),
      child: Row(
        children: [
          if (!isTv)
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 28),
              onPressed: onClose,
            )
          else
            _TvFocusRing(
              focused: tvFocusIndex == 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 26),
                onPressed: onClose,
              ),
            ),
          const SizedBox(width: AppSpacing.spaceSm),
          Expanded(
            child: Text(
              item?.album ?? item?.seriesName ?? '',
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                fontSize: 12,
                letterSpacing: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (item != null && onCast != null)
            ValueListenableBuilder<CastTargetKind?>(
              valueListenable: castService.activeKindNotifier,
              builder: (context, kind, _) {
                final btn = IconButton(
                  icon: Icon(
                    kind != null ? Icons.cast_connected : Icons.cast,
                    color: kind != null ? AppColorScheme.accent : null,
                  ),
                  onPressed: kind != null ? onCastSettings : onCast,
                );
                if (!isTv) return btn;
                return _TvFocusRing(focused: tvFocusIndex == 1, child: btn);
              },
            ),
          IconButton(
            icon: Icon(drawerOpen ? Icons.close : Icons.menu_open),
            onPressed: onToggleDrawer,
          ),
        ],
      ),
    );
  }
}

class _TitleBlock extends StatelessWidget {
  const _TitleBlock({required this.item, this.centered = false});
  final AggregatedItem? item;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final title = item?.name ?? '';
    final author = item?.seriesName ??
        ((item?.rawData['AlbumArtist'] as String?) ??
            (item?.rawData['Artists'] as List?)?.cast<String>().firstOrNull ??
            '');
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (author.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            author,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}

class _ChapterContextStrip extends StatelessWidget {
  const _ChapterContextStrip({
    required this.chapters,
    required this.position,
    required this.onTap,
  });

  final List<_Chapter> chapters;
  final Duration position;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (chapters.isEmpty) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    var current = 0;
    for (var i = 0; i < chapters.length; i++) {
      if (chapters[i].startMs <= position.inMilliseconds) {
        current = i;
      } else {
        break;
      }
    }
    final chapter = chapters[current];
    final nextStart = current + 1 < chapters.length
        ? chapters[current + 1].startMs
        : null;
    final progressInChapter = nextStart != null
        ? ((position.inMilliseconds - chapter.startMs) /
                (nextStart - chapter.startMs))
            .clamp(0.0, 1.0)
        : 0.0;

    return Material(
      color: AppColorScheme.surface.withValues(alpha: 0.55),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spaceLg, vertical: AppSpacing.spaceMd),
          child: Row(
            children: [
              Icon(
                Icons.bookmark_outline,
                size: 18,
                color: AppColorScheme.accent,
              ),
              const SizedBox(width: AppSpacing.spaceSm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.audiobookChapterIndicator(
                          current + 1, chapters.length),
                      style: TextStyle(
                        color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: 11,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      chapter.title,
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (nextStart != null) ...[
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progressInChapter,
                          minHeight: 3,
                          backgroundColor:
                              AppColorScheme.onSurface.withValues(alpha: 0.18),
                          valueColor: AlwaysStoppedAnimation(
                              AppColorScheme.accent),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.spaceSm),
              Icon(
                Icons.chevron_right,
                color: AppColorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AudiobookProgressBar extends StatelessWidget {
  const _AudiobookProgressBar({
    required this.position,
    required this.duration,
    required this.chapters,
    required this.showRemaining,
    required this.isTvFocused,
    required this.speed,
    required this.onSeek,
    required this.onToggleRemaining,
    required this.formatPosition,
    required this.formatRemaining,
  });

  final Duration position;
  final Duration duration;
  final List<_Chapter> chapters;
  final bool showRemaining;
  final bool isTvFocused;
  final double speed;
  final ValueChanged<Duration> onSeek;
  final VoidCallback onToggleRemaining;
  final String Function(Duration) formatPosition;
  final String Function(Duration position, Duration total) formatRemaining;

  @override
  Widget build(BuildContext context) {
    final maxMs = duration.inMilliseconds.toDouble();
    final groupChapters = chapters.length > 40;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (chapters.isNotEmpty)
          SizedBox(
            height: 8,
            child: CustomPaint(
              painter: _ChapterTicksPainter(
                chapters: chapters,
                durationMs: maxMs.toInt(),
                grouped: groupChapters,
                color: AppColorScheme.onSurface.withValues(alpha: 0.5),
              ),
              size: Size.infinite,
            ),
          ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            activeTrackColor: AppColorScheme.rangeProgress,
            inactiveTrackColor: AppColorScheme.rangeTrack,
            thumbColor: isTvFocused ? Colors.white : AppColorScheme.rangeThumb,
            overlayColor: AppColorScheme.rangeThumb.withValues(alpha: 0.2),
          ),
          child: Slider(
            value: maxMs > 0
                ? position.inMilliseconds.toDouble().clamp(0, maxMs)
                : 0,
            max: maxMs > 0 ? maxMs : 1,
            onChanged: (v) => onSeek(Duration(milliseconds: v.toInt())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatPosition(position),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              GestureDetector(
                onTap: onToggleRemaining,
                behavior: HitTestBehavior.opaque,
                child: Text(
                  showRemaining
                      ? formatRemaining(position, duration)
                      : formatPosition(duration),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChapterTicksPainter extends CustomPainter {
  _ChapterTicksPainter({
    required this.chapters,
    required this.durationMs,
    required this.grouped,
    required this.color,
  });

  final List<_Chapter> chapters;
  final int durationMs;
  final bool grouped;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (durationMs <= 0) return;
    final paint = Paint()..color = color..strokeWidth = 1.4;
    if (grouped) {
      // Render group markers every ~10th chapter to avoid visual noise.
      final step = (chapters.length / 10).ceil();
      for (var i = 0; i < chapters.length; i += step) {
        final x = (chapters[i].startMs / durationMs) * size.width;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      }
    } else {
      for (final c in chapters) {
        final x = (c.startMs / durationMs) * size.width;
        canvas.drawLine(Offset(x, 1), Offset(x, size.height - 1), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_ChapterTicksPainter old) =>
      old.chapters != chapters || old.durationMs != durationMs;
}

class _TransportRow extends StatelessWidget {
  const _TransportRow({
    required this.isPlaying,
    required this.tvFocusIndex,
    required this.skipBackSeconds,
    required this.skipForwardSeconds,
    required this.onPrevChapter,
    required this.onSkipBack,
    required this.onPlayPause,
    required this.onSkipForward,
    required this.onNextChapter,
  });

  final bool isPlaying;
  final int tvFocusIndex;
  final int skipBackSeconds;
  final int skipForwardSeconds;
  final VoidCallback onPrevChapter;
  final VoidCallback onSkipBack;
  final VoidCallback onPlayPause;
  final VoidCallback onSkipForward;
  final VoidCallback onNextChapter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TvFocusRing(
          focused: tvFocusIndex == 0,
          child: IconButton(
            icon: const Icon(Icons.first_page, size: 28),
            onPressed: onPrevChapter,
          ),
        ),
        _TvFocusRing(
          focused: tvFocusIndex == 1,
          child: _SkipButton(
            seconds: skipBackSeconds,
            forward: false,
            onTap: onSkipBack,
          ),
        ),
        _TvFocusRing(
          focused: tvFocusIndex == 2,
          borderRadius: BorderRadius.circular(34),
          child: SizedBox(
            width: 68,
            height: 68,
            child: Material(
              color: AppColorScheme.accent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onPlayPause,
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: AppColorScheme.onAccent,
                ),
              ),
            ),
          ),
        ),
        _TvFocusRing(
          focused: tvFocusIndex == 3,
          child: _SkipButton(
            seconds: skipForwardSeconds,
            forward: true,
            onTap: onSkipForward,
          ),
        ),
        _TvFocusRing(
          focused: tvFocusIndex == 4,
          child: IconButton(
            icon: const Icon(Icons.last_page, size: 28),
            onPressed: onNextChapter,
          ),
        ),
      ],
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({
    required this.seconds,
    required this.forward,
    required this.onTap,
  });

  final int seconds;
  final bool forward;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                forward ? Icons.forward_30 : Icons.replay_30,
                size: 40,
                color: AppColorScheme.onSurface,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  seconds.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionRail extends StatelessWidget {
  const _ActionRail({
    required this.speed,
    required this.sleepActive,
    required this.sleepRemaining,
    required this.isFavorite,
    required this.tvFocusIndex,
    required this.onOpenSpeed,
    required this.onOpenSleep,
    required this.onAddBookmark,
    required this.onAddNote,
    required this.onToggleFavorite,
    required this.onOpenDrawer,
  });

  final double speed;
  final bool sleepActive;
  final Duration sleepRemaining;
  final bool isFavorite;
  final int tvFocusIndex;
  final VoidCallback onOpenSpeed;
  final VoidCallback onOpenSleep;
  final VoidCallback? onAddBookmark;
  final VoidCallback? onAddNote;
  final VoidCallback? onToggleFavorite;
  final VoidCallback onOpenDrawer;

  String _fmt(Duration d) {
    if (d.inHours > 0) return '${d.inHours}h${d.inMinutes.remainder(60)}m';
    if (d.inMinutes > 0) return '${d.inMinutes}m';
    return '${d.inSeconds}s';
  }

  @override
  Widget build(BuildContext context) {
    final items = <_RailItem>[
      _RailItem(
        icon: Icons.speed,
        label: '${speed.toStringAsFixed(speed == speed.toInt() ? 1 : 2)}x',
        accent: (speed - 1.0).abs() > 0.01,
        onTap: onOpenSpeed,
      ),
      _RailItem(
        icon: sleepActive ? Icons.bedtime : Icons.bedtime_outlined,
        label: sleepActive ? _fmt(sleepRemaining) : null,
        accent: sleepActive,
        onTap: onOpenSleep,
      ),
      _RailItem(
        icon: Icons.bookmark_add_outlined,
        onTap: onAddBookmark,
      ),
      _RailItem(
        icon: Icons.edit_note,
        onTap: onAddNote,
      ),
      _RailItem(
        icon: isFavorite ? Icons.favorite : Icons.favorite_border,
        accent: isFavorite,
        onTap: onToggleFavorite,
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < items.length; i++)
          _TvFocusRing(
            focused: tvFocusIndex == i,
            child: items[i].build(context),
          ),
      ],
    );
  }
}

class _RailItem {
  _RailItem({
    required this.icon,
    this.label,
    this.accent = false,
    this.onTap,
  });

  final IconData icon;
  final String? label;
  final bool accent;
  final VoidCallback? onTap;

  Widget build(BuildContext context) {
    final color = accent
        ? AppColorScheme.accent
        : AppColorScheme.onSurface.withValues(alpha: 0.85);
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            if (label != null) ...[
              const SizedBox(height: 2),
              Text(
                label!,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TvFocusRing extends StatelessWidget {
  const _TvFocusRing({
    required this.focused,
    required this.child,
    this.borderRadius,
  });

  final bool focused;
  final Widget child;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: focused ? AppColorScheme.accent : Colors.transparent,
          width: 2.4,
        ),
        color: focused
            ? AppColorScheme.accent.withValues(alpha: 0.18)
            : Colors.transparent,
      ),
      child: child,
    );
  }
}

class _DrawerTabBar extends StatelessWidget {
  const _DrawerTabBar({
    required this.current,
    required this.onChanged,
    required this.labels,
    required this.tvFocused,
    required this.tvIndex,
  });

  final _DrawerTab current;
  final ValueChanged<_DrawerTab> onChanged;
  final Map<_DrawerTab, String> labels;
  final bool tvFocused;
  final int tvIndex;

  @override
  Widget build(BuildContext context) {
    final tabs = _DrawerTab.values;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < tabs.length; i++) ...[
            _PillSegment(
              label: labels[tabs[i]] ?? tabs[i].name,
              selected: tabs[i] == current,
              tvFocused: tvFocused && tvIndex == i,
              onTap: () => onChanged(tabs[i]),
            ),
            if (i < tabs.length - 1) const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}

class _PillSegment extends StatelessWidget {
  const _PillSegment({
    required this.label,
    required this.selected,
    required this.tvFocused,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool tvFocused;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected
        ? AppColorScheme.accent
        : AppColorScheme.surface.withValues(alpha: 0.6);
    final fg = selected
        ? AppColorScheme.onAccent
        : AppColorScheme.onSurface.withValues(alpha: 0.85);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 140),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: tvFocused ? Colors.white : Colors.transparent,
          width: 2.2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: fg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChaptersList extends StatelessWidget {
  const _ChaptersList({
    required this.chapters,
    required this.position,
    required this.onTap,
  });

  final List<_Chapter> chapters;
  final Duration position;
  final ValueChanged<_Chapter> onTap;

  @override
  Widget build(BuildContext context) {
    if (chapters.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).audiobookNoChapters,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      );
    }
    var current = 0;
    for (var i = 0; i < chapters.length; i++) {
      if (chapters[i].startMs <= position.inMilliseconds) {
        current = i;
      } else {
        break;
      }
    }
    return ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final c = chapters[index];
        final isCurrent = index == current;
        return ListTile(
          dense: true,
          onTap: () => onTap(c),
          leading: SizedBox(
            width: 36,
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFeatures: const [FontFeature.tabularFigures()],
                color: isCurrent
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.6),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          title: Text(
            c.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isCurrent ? AppColorScheme.accent : null,
              fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          trailing: Text(
            _fmt(Duration(milliseconds: c.startMs)),
            style: TextStyle(
              fontFeatures: const [FontFeature.tabularFigures()],
              color: AppColorScheme.onSurface.withValues(alpha: 0.5),
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }

  String _fmt(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) {
      return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}

class _BookmarksList extends StatelessWidget {
  const _BookmarksList({
    required this.item,
    required this.service,
    required this.onJump,
  });

  final AggregatedItem? item;
  final AudiobookBookmarksService service;
  final ValueChanged<AudiobookBookmark> onJump;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox.shrink();
    return StreamBuilder<List<AudiobookBookmark>>(
      stream: service.watch(item!.serverId, item!.id),
      initialData: const [],
      builder: (context, snapshot) {
        final list = snapshot.data ?? const [];
        if (list.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context).audiobookNoBookmarks,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final b = list[index];
            return ListTile(
              leading: Icon(Icons.bookmark, color: AppColorScheme.accent),
              title: Text(b.label),
              subtitle: Text(
                b.createdAt.toLocal().toString().split('.').first,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () =>
                    service.removeAt(item!.serverId, item!.id, b.positionMs),
              ),
              onTap: () => onJump(b),
            );
          },
        );
      },
    );
  }
}

class _NotesList extends StatelessWidget {
  const _NotesList({
    required this.item,
    required this.service,
    required this.onJump,
    required this.onEdit,
  });

  final AggregatedItem? item;
  final AudiobookNotesService service;
  final ValueChanged<AudiobookNote> onJump;
  final ValueChanged<AudiobookNote> onEdit;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox.shrink();
    return StreamBuilder<List<AudiobookNote>>(
      stream: service.watch(item!.serverId, item!.id),
      initialData: const [],
      builder: (context, snapshot) {
        final list = snapshot.data ?? const [];
        if (list.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context).audiobookNoNotes,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 4),
          itemCount: list.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final n = list[index];
            return ListTile(
              isThreeLine: true,
              title: Text(
                _fmt(Duration(milliseconds: n.positionMs)),
                style: TextStyle(
                  color: AppColorScheme.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  n.body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () => onJump(n),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, size: 20),
                    onPressed: () => onEdit(n),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 20),
                    onPressed: () =>
                        service.remove(item!.serverId, item!.id, n.id),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _fmt(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) {
      return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}

class _QueueList extends StatelessWidget {
  const _QueueList({required this.queue, required this.onPlay});

  final QueueService queue;
  final ValueChanged<int> onPlay;

  @override
  Widget build(BuildContext context) {
    final items = queue.items;
    final current = queue.currentIndex;
    if (items.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).queueIsEmpty,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final raw = items[index];
        final item = raw is AggregatedItem ? raw : null;
        final isCurrent = index == current;
        return ListTile(
          title: Text(
            item?.name ?? AppLocalizations.of(context).trackNumber(index + 1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isCurrent ? AppColorScheme.accent : null,
              fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          onTap: () => onPlay(index),
        );
      },
    );
  }
}

class _ActiveTimersPanel extends StatelessWidget {
  const _ActiveTimersPanel({required this.sleep, required this.onCancelSleep});

  final SleepTimerController sleep;
  final VoidCallback onCancelSleep;

  @override
  Widget build(BuildContext context) {
    if (!sleep.isActive) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    return Card(
      color: AppColorScheme.surface.withValues(alpha: 0.55),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.spaceLg),
        child: Row(
          children: [
            Icon(Icons.bedtime, color: AppColorScheme.accent),
            const SizedBox(width: AppSpacing.spaceSm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.audiobookSleepTimer,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(l10n.audiobookSleepRemaining(
                      _fmt(sleep.remaining))),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: onCancelSleep,
            ),
          ],
        ),
      ),
    );
  }

  String _fmt(Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds.remainder(60);
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

// =============================================================================
// Sheets
// =============================================================================

class _SpeedSheet extends StatefulWidget {
  const _SpeedSheet({required this.current, required this.onChanged});
  final double current;
  final ValueChanged<double> onChanged;

  @override
  State<_SpeedSheet> createState() => _SpeedSheetState();
}

class _SpeedSheetState extends State<_SpeedSheet> {
  late double _value = widget.current;
  static const _presets = [0.8, 1.0, 1.25, 1.5, 1.75, 2.0, 3.0];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.audiobookPlaybackSpeed,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.spaceMd),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final p in _presets)
                ChoiceChip(
                  label: Text(p.toString()),
                  selected: (_value - p).abs() < 0.01,
                  onSelected: (_) {
                    setState(() => _value = p);
                    widget.onChanged(p);
                  },
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.spaceMd),
          Row(
            children: [
              Text('${_value.toStringAsFixed(2)}x'),
              Expanded(
                child: Slider(
                  value: _value,
                  min: 0.5,
                  max: 3.5,
                  divisions: 30,
                  onChanged: (v) => setState(() => _value = v),
                  onChangeEnd: widget.onChanged,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() => _value = 1.0);
                  widget.onChanged(1.0);
                },
                child: Text(l10n.audiobookSpeedReset),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SleepSheet extends StatelessWidget {
  const _SleepSheet({
    required this.controller,
    required this.defaultMinutes,
    required this.onPickPreset,
    required this.onPickEndOfChapter,
    required this.onCancel,
  });

  final SleepTimerController controller;
  final int defaultMinutes;
  final ValueChanged<int> onPickPreset;
  final VoidCallback onPickEndOfChapter;
  final VoidCallback onCancel;

  static const _presets = [5, 15, 30, 45, 60];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.audiobookSleepTimer,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.spaceMd),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ChoiceChip(
                label: Text(l10n.audiobookSleepOff),
                selected: controller.mode == SleepTimerMode.off,
                onSelected: (_) {
                  onCancel();
                  Navigator.of(context).maybePop();
                },
              ),
              for (final m in _presets)
                ChoiceChip(
                  label: Text(l10n.audiobookSleepMinutes(m)),
                  selected: controller.mode == SleepTimerMode.duration &&
                      (controller.totalRequested.inMinutes - m).abs() < 1,
                  onSelected: (_) {
                    onPickPreset(m);
                    Navigator.of(context).maybePop();
                  },
                ),
              ChoiceChip(
                label: Text(l10n.audiobookSleepEndOfChapter),
                selected: controller.mode == SleepTimerMode.endOfChapter,
                onSelected: (_) {
                  onPickEndOfChapter();
                  Navigator.of(context).maybePop();
                },
              ),
            ],
          ),
          if (controller.isActive) ...[
            const SizedBox(height: AppSpacing.spaceMd),
            Text(
              l10n.audiobookSleepRemaining(_fmt(controller.remaining)),
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _fmt(Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds.remainder(60);
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

class _NoteEditorSheet extends StatefulWidget {
  const _NoteEditorSheet({
    required this.initialText,
    required this.positionLabel,
  });
  final String initialText;
  final String positionLabel;

  @override
  State<_NoteEditorSheet> createState() => _NoteEditorSheetState();
}

class _NoteEditorSheetState extends State<_NoteEditorSheet> {
  late final _controller = TextEditingController(text: widget.initialText);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg,
        AppSpacing.spaceLg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.edit_note, color: AppColorScheme.accent),
              const SizedBox(width: 8),
              Text(l10n.audiobookEditNote,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              const Spacer(),
              Text(
                widget.positionLabel,
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.spaceMd),
          TextField(
            controller: _controller,
            autofocus: true,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: l10n.audiobookNoteHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spaceMd),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.audiobookCancel),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () =>
                    Navigator.of(context).pop(_controller.text.trim()),
                child: Text(l10n.audiobookSave),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
