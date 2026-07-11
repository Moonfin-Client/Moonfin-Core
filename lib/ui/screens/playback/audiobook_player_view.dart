import 'dart:async';
import 'dart:io';
import 'dart:ui';

import '../../widgets/offline_aware_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/services/audiobook_bookmarks_service.dart';
import '../../../data/services/audiobook_notes_service.dart';
import '../../../data/services/audiobook_resume_service.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/services/storage_path_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/sleep_timer_controller.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/audiobook/audiobook_action_rail.dart';
import '../../widgets/audiobook/audiobook_chapter_strip.dart';
import '../../widgets/audiobook/audiobook_drawer.dart';
import '../../widgets/audiobook/audiobook_header.dart';
import '../../widgets/audiobook/audiobook_progress_bar.dart';
import '../../widgets/audiobook/audiobook_sheets.dart';
import '../../widgets/audiobook/audiobook_time.dart';
import '../../widgets/audiobook/audiobook_transport_row.dart';
import '../../widgets/audiobook/chapter.dart';
import '../../widgets/remote_play_to_session_dialog.dart';

enum _AudiobookFocusArea {
  header,
  progress,
  transport,
  actionRail,
  drawerTabs,
  drawerContent,
}

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
  final _resume = GetIt.instance<AudiobookResumeService>();
  final _sleep = GetIt.instance<SleepTimerController>();

  Timer? _resumeTimer;
  String? _resumeAppliedForItemId;
  bool _resumeRestored = false;

  final _subs = <StreamSubscription>[];
  final _tvFocus = FocusNode(debugLabel: 'AudiobookTvFocus');
  // Position ticks arrive several times a second; drive them through a notifier
  // so only the scrubbers and chapter strip repaint, not the whole view.
  final ValueNotifier<Duration> _positionNotifier =
      ValueNotifier(Duration.zero);

  AudiobookDrawerTab _drawerTab = AudiobookDrawerTab.chapters;
  bool _drawerOpen = false;
  bool? _localFavorite;
  String? _favoriteItemId;

  _AudiobookFocusArea _tvArea = _AudiobookFocusArea.transport;
  int _tvHeaderIndex = 0;
  int _tvTransportIndex = 2;
  int _tvRailIndex = 0;
  int _tvTabIndex = 0;
  bool _drawerContentActive = false;
  int _tvListIndex = 0;
  int _tvSubIndex = 0;
  List<AudiobookBookmark> _bookmarksList = [];
  List<AudiobookNote> _notesList = [];
  String? _lastSubscribedItemId;
  StreamSubscription? _bookmarkSub;
  StreamSubscription? _noteSub;
  bool _dialogOpen = false;
  AggregatedItem? _fullItem;

  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;

  bool get _dpadNav => !PlatformDetection.useMobileUi;

  @override
  void initState() {
    super.initState();
    _drawerOpen = _dpadNav;
    final savedTab = _prefs.get(UserPreferences.audiobookDrawerTab);
    _drawerTab = AudiobookDrawerTab.values.firstWhere(
      (t) => t.name == savedTab,
      orElse: () => AudiobookDrawerTab.chapters,
    );

    _subs.addAll([
      _manager.backendChangedStream.listen((_) => _rebuild()),
      _state.playingStream.listen((_) {
        _rebuild();
        if (!_state.isPlaying) _saveResume();
      }),
      _state.positionStream.listen((_) => _positionNotifier.value = _state.position),
      _state.durationStream.listen((_) => _rebuild()),
      _queue.queueChangedStream.listen((_) => _rebuild()),
      _sleep.onExpired.listen((_) => _onSleepTimerExpired()),
    ]);
    _sleep.addListener(_rebuild);
    _positionNotifier.value = _state.position;
    _resumeTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_state.isPlaying) _saveResume();
    });

    if (PlatformDetection.useNativeVideoSurface) {
      unawaited(_manager.backend?.setVolume(100.0));
    }

    final defaultSpeed = _prefs.get(UserPreferences.audiobookDefaultSpeed);
    if (defaultSpeed > 0 && (defaultSpeed - _state.playbackSpeed).abs() > 0.01) {
      unawaited(_manager.setPlaybackSpeed(defaultSpeed));
    }

    if (_dpadNav) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _tvFocus.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _saveResume();
    _resumeTimer?.cancel();
    _bookmarkSub?.cancel();
    _noteSub?.cancel();
    for (final s in _subs) {
      s.cancel();
    }
    _sleep.removeListener(_rebuild);
    _tvFocus.dispose();
    _positionNotifier.dispose();
    super.dispose();
  }

  void _updateStreamSubscriptions() {
    final item = _resolveItem();
    if (item == null) return;
    if (_lastSubscribedItemId == item.id) return;
    _lastSubscribedItemId = item.id;
    _fullItem = null;

    if (!_manager.isOfflinePlayback) {
      unawaited(() async {
        try {
          final client = _clientForItem(item);
          final fullData = await client.itemsApi.getItem(item.id);
          if (mounted && _lastSubscribedItemId == item.id) {
            setState(() {
              _fullItem = AggregatedItem(
                id: item.id,
                serverId: item.serverId,
                rawData: fullData,
              );
            });
          }
        } catch (e) {
          // Ignore background fetch failure
        }
      }());
    }

    _bookmarkSub?.cancel();
    _bookmarkSub = _bookmarks.watch(item.serverId, item.id).listen((list) {
      if (mounted) setState(() => _bookmarksList = list);
    });

    _noteSub?.cancel();
    _noteSub = _notes.watch(item.serverId, item.id).listen((list) {
      if (mounted) setState(() => _notesList = list);
    });
  }

  void _rebuild() {
    _updateStreamSubscriptions();
    unawaited(_maybeApplyResume());
    if (mounted) setState(() {});
  }

  // Restore the locally storedd resume position once playback is ready, seeking
  // only if it is ahead of where the server already resumed us to. Saving is
  // gated until this runs so the initial position never overwrites the store.
  Future<void> _maybeApplyResume() async {
    final item = _resolveItem();
    if (item == null) return;
    if (_resumeAppliedForItemId == item.id) return;
    if (_state.duration <= Duration.zero) return;
    _resumeAppliedForItemId = item.id;
    _resumeRestored = false;
    final ms = await _resume.load(item.serverId, item.id);
    if (!mounted || _resumeAppliedForItemId != item.id) return;
    final currentMs = _state.position.inMilliseconds;
    if (ms != null && ms > currentMs + 1500) {
      await _manager.seekTo(Duration(milliseconds: ms));
    }
    _resumeRestored = true;
  }

  void _saveResume() {
    final item = _resolveItem();
    if (item == null ||
        !_resumeRestored ||
        _resumeAppliedForItemId != item.id) {
      return;
    }
    unawaited(
        _resume.save(item.serverId, item.id, _state.position.inMilliseconds));
  }

  void _onSleepTimerExpired() {
    if (!mounted) return;

    final lastMode = _sleep.lastActiveMode;
    final lastDuration = _sleep.lastActiveDuration;
    final item = _resolveItem();
    final chapters = _chapters(item);

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String label = 'chosen timer';
        if (lastMode == SleepTimerMode.duration) {
          label = '${lastDuration.inMinutes} min';
        } else if (lastMode == SleepTimerMode.endOfChapter) {
          final l10n = AppLocalizations.of(context);
          label = l10n.audiobookSleepEndOfChapter;
        }

        return AlertDialog(
          backgroundColor: AppColorScheme.surface,
          title: const Text('Sleep Timer Finished'),
          content: Text('Your sleep timer ($label) has finished. What would you like to do?'),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    if (lastMode == SleepTimerMode.duration) {
                      _sleep.startDuration(lastDuration);
                    } else if (lastMode == SleepTimerMode.endOfChapter) {
                      _sleep.startEndOfChapter(
                        chapterStartMsAscending: chapters.map((c) => c.startMs).toList(),
                        currentPositionMs: _state.position.inMilliseconds,
                        totalDurationMs: _state.duration.inMilliseconds,
                      );
                    }
                    await _manager.resume();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorScheme.accent,
                    foregroundColor: AppColorScheme.onAccent,
                  ),
                  child: const Text('Restart Sleep Timer'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Stop Playback'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showSleepSheet(chapters, resumeOnSelect: true);
                  },
                  child: const Text('Add Custom Value to Timer'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  AggregatedItem? _resolveItem() {
    if (_fullItem != null && _fullItem!.id == _queue.currentItem?.id) {
      return _fullItem;
    }
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

  List<AudiobookDrawerTab> _getAvailableTabs(List<Chapter> chapters) {
    final list = <AudiobookDrawerTab>[];
    list.add(AudiobookDrawerTab.timeline);
    if (chapters.isNotEmpty) {
      list.add(AudiobookDrawerTab.chapters);
    }
    list.add(AudiobookDrawerTab.bookmarks);
    list.add(AudiobookDrawerTab.notes);
    list.add(AudiobookDrawerTab.queue);
    return list;
  }

  bool _tabHasExport(AudiobookDrawerTab tab) {
    if (PlatformDetection.isTV) return false;
    return tab == AudiobookDrawerTab.timeline ||
        tab == AudiobookDrawerTab.bookmarks ||
        tab == AudiobookDrawerTab.notes;
  }

  List<TimelineEvent> _getTimelineEvents(List<Chapter> chapters) {
    final events = <TimelineEvent>[];
    for (var i = 0; i < chapters.length; i++) {
      final c = chapters[i];
      events.add(TimelineEvent(
        id: 'chapter_$i',
        type: TimelineEventType.chapter,
        title: c.title,
        positionMs: c.startMs,
        date: DateTime.fromMillisecondsSinceEpoch(0),
        originalObject: c,
      ));
    }
    for (var i = 0; i < _bookmarksList.length; i++) {
      final b = _bookmarksList[i];
      events.add(TimelineEvent(
        id: 'bookmark_${b.positionMs}',
        type: TimelineEventType.bookmark,
        title: 'Bookmark ${i + 1}: ${b.label}',
        positionMs: b.positionMs,
        date: b.createdAt,
        originalObject: b,
      ));
    }
    for (var i = 0; i < _notesList.length; i++) {
      final n = _notesList[i];
      events.add(TimelineEvent(
        id: 'note_${n.id}',
        type: TimelineEventType.note,
        title: 'Note: ${n.body}',
        content: n.body,
        positionMs: n.positionMs,
        date: n.updatedAt,
        originalObject: n,
      ));
    }
    events.sort((a, b) {
      final cmp = a.positionMs.compareTo(b.positionMs);
      if (cmp != 0) return cmp;
      return a.type.index.compareTo(b.type.index);
    });
    return events;
  }

  Future<void> _exportToCsv(String label, List<TimelineEvent> events) async {
    final item = _resolveItem();
    final csv = StringBuffer();
    csv.writeln('Timestamp,Type,Content');
    for (final e in events) {
      final typeStr = e.type == TimelineEventType.chapter
          ? 'Chapter'
          : e.type == TimelineEventType.bookmark
              ? 'Bookmark'
              : 'Note';
      final timestamp = formatAudiobookClock(Duration(milliseconds: e.positionMs));
      final content = e.content ?? '';
      
      String escapeCsv(String val) {
        if (val.contains(',') || val.contains('"') || val.contains('\n')) {
          return '"' + val.replaceAll('"', '""') + '"';
        }
        return val;
      }
      csv.writeln('${escapeCsv(timestamp)},${escapeCsv(typeStr)},${escapeCsv(content)}');
    }
    try {
      final storagePathService = GetIt.instance<StoragePathService>();
      final baseDir = await storagePathService.getOfflineRoot();
      final exportDir = Directory('${baseDir.path}/Exports');
      if (!await exportDir.exists()) {
        await exportDir.create(recursive: true);
      }
      final cleanTitle = (item?.name ?? 'audiobook').replaceAll(RegExp(r'[^\w\s\-]'), '').replaceAll(' ', '_');
      final dateStr = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
      final file = File('${exportDir.path}/${cleanTitle}_${label.toLowerCase()}_$dateStr.csv');
      await file.writeAsString(csv.toString());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).audiobookExportSuccess(file.path)),
            backgroundColor: AppColorScheme.accent,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).audiobookExportFailed('$e')),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
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

  List<Chapter> _chapters(AggregatedItem? item) {
    if (item == null) return const [];
    


    final out = <Chapter>[];
    for (var i = 0; i < item.chapters.length; i++) {
      final chapter = item.chapters[i];
      final ticks = (chapter['StartPositionTicks'] as num?)?.toInt() ?? 0;
      final title = (chapter['Name'] as String?)?.trim();
      out.add(Chapter(
        title: (title != null && title.isNotEmpty)
            ? title
            : 'Chapter ${i + 1}',
        startMs: ticks ~/ 10000,
      ));
    }
    return out;
  }

  int _currentChapterIndex(List<Chapter> chapters, Duration position) {
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

  Future<void> _setDrawerTab(AudiobookDrawerTab tab) async {
    setState(() {
      _drawerTab = tab;
      _tvSubIndex = 0;
    });
    await _prefs.set(UserPreferences.audiobookDrawerTab, tab.name);
  }

  Future<void> _skipBack() async {
    final ms = _prefs.get(UserPreferences.skipBackLength);
    final target = _state.position - Duration(milliseconds: ms);
    await _manager.seekTo(target < Duration.zero ? Duration.zero : target);
  }

  Future<void> _skipForward() async {
    final ms = _prefs.get(UserPreferences.skipForwardLength);
    await _manager.seekTo(_state.position + Duration(milliseconds: ms));
  }

  Future<void> _jumpToChapter(Chapter chapter) async {
    await _manager.seekTo(Duration(milliseconds: chapter.startMs));
  }

  Future<void> _previousChapter(List<Chapter> chapters) async {
    if (chapters.isEmpty) {
      await _manager.previous();
      return;
    }
    final current = _currentChapterIndex(chapters, _state.position);
    final pos = _state.position;
    final currentStart = current >= 0 ? chapters[current].startMs : 0;

    if (pos.inMilliseconds - currentStart > 3000 || current <= 0) {
      await _jumpToChapter(chapters[current < 0 ? 0 : current]);
      return;
    }
    await _jumpToChapter(chapters[current - 1]);
  }

  Future<void> _nextChapter(List<Chapter> chapters) async {
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

  Future<void> _addBookmark(AggregatedItem item) async {
    final pos = _state.position;
    final l10n = AppLocalizations.of(context);
    await _bookmarks.add(
      item.serverId,
      item.id,
      positionMs: pos.inMilliseconds,
      label: formatAudiobookClock(pos),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.audiobookBookmarkAdded(formatAudiobookClock(pos)),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _openNoteEditor(AggregatedItem item, {AudiobookNote? existing}) async {
    if (_dialogOpen) {
      return;
    }
    _dialogOpen = true;

    final wasPlaying = _state.isPlaying;
    if (wasPlaying) await _manager.pause();
    if (!mounted) {
      _dialogOpen = false;
      return;
    }
    final pos = existing?.positionMs ?? _state.position.inMilliseconds;
    final result = await showAudiobookNoteEditor(
      context: context,
      initialText: existing?.body ?? '',
      positionLabel: formatAudiobookClock(Duration(milliseconds: pos)),
    );

    // Hold the lock long enough to cover the dialog route exit animation
    // and clear any trailing key events. The Select-KeyDownOnly fix in
    // _handleTvKey already prevents KeyRepeat from re-triggering; 300ms
    // is enough buffer without making the player feel frozen.
    await Future.delayed(const Duration(milliseconds: 300));
    _dialogOpen = false;

    final noteText = result is String ? result.trim() : null;
    if (noteText != null && noteText.isNotEmpty) {
      if (existing == null) {
        await _notes.add(
          item.serverId,
          item.id,
          positionMs: pos,
          body: noteText,
        );
      } else {
        await _notes.update(
          item.serverId,
          item.id,
          existing.id,
          body: noteText,
        );
      }
    }
    if (wasPlaying && mounted) await _manager.resume();
  }

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

    final body = _dpadNav
        ? Focus(
            focusNode: _tvFocus,
            autofocus: true,
            onKeyEvent: _handleTvKey,
            child: ExcludeFocus(child: layout),
          )
        : layout;

    return PopScope(
      canPop: !_drawerOpen && !_drawerContentActive,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_drawerContentActive) {
          setState(() => _drawerContentActive = false);
        } else if (_drawerOpen) {
          setState(() => _drawerOpen = false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColorScheme.background,
        body: body,
      ),
    );
  }

  Widget _buildStackedLayout(
    BuildContext context,
    AggregatedItem? item,
    String? coverUrl,
    String? localPoster,
    List<Chapter> chapters,
  ) {
    return Column(
      children: [
        AudiobookHeader(
          item: item,
          castService: _castService,
          isTv: PlatformDetection.isTV,
          onClose: () => Navigator.of(context).pop(),
          onCast: item != null ? () => _castToDevice(item) : null,
          onCastSettings: _showCastControls,
          onToggleDrawer: () => _openDrawerSheet(context, item, chapters),
          drawerOpen: false,
          tvFocusIndex: _tvArea == _AudiobookFocusArea.header ? _tvHeaderIndex : -1,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
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
                ValueListenableBuilder<Duration>(
                  valueListenable: _positionNotifier,
                  builder: (context, pos, _) => AudiobookChapterContextStrip(
                    chapters: chapters,
                    position: pos,
                    onTap: () {
                      _setDrawerTab(AudiobookDrawerTab.chapters);
                      _openDrawerSheet(context, item, chapters);
                    },
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

  Widget _buildSplitLayout(
    BuildContext context,
    AggregatedItem? item,
    String? coverUrl,
    String? localPoster,
    List<Chapter> chapters,
  ) {
    final coverSize = PlatformDetection.isTV ? 240.0 : 200.0;
    return Column(
      children: [
        AudiobookHeader(
          item: item,
          castService: _castService,
          isTv: PlatformDetection.isTV,
          onClose: () => Navigator.of(context).pop(),
          onCast: item != null ? () => _castToDevice(item) : null,
          onCastSettings: _showCastControls,
          onToggleDrawer: () {
            setState(() {
              _drawerOpen = !_drawerOpen;
              if (_dpadNav && !_drawerOpen) {
                _drawerContentActive = false;
                _tvArea = _AudiobookFocusArea.header;
                _tvHeaderIndex = 1;
              }
            });
          },
          drawerOpen: _drawerOpen,
          tvFocusIndex: _tvArea == _AudiobookFocusArea.header ? _tvHeaderIndex : -1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceXl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.spaceLg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ValueListenableBuilder<Duration>(
                          valueListenable: _positionNotifier,
                          builder: (context, pos, _) =>
                              AudiobookChapterContextStrip(
                            chapters: chapters,
                            position: pos,
                            onTap: () => setState(() {
                              _drawerOpen = true;
                              _drawerTab = AudiobookDrawerTab.chapters;
                            }),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        Expanded(
                          child: _drawerOpen
                              ? _buildDrawer(context, item, chapters)
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        _buildBottomControls(context, item, chapters, splitLayout: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomControls(
    BuildContext context,
    AggregatedItem? item,
    List<Chapter> chapters, {
    bool splitLayout = false,
  }) {
    return Padding(
      padding: splitLayout
          ? EdgeInsets.zero
          : const EdgeInsets.fromLTRB(
              AppSpacing.spaceXl,
              AppSpacing.spaceSm,
              AppSpacing.spaceXl,
              AppSpacing.spaceLg,
            ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder<Duration>(
            valueListenable: _positionNotifier,
            builder: (context, pos, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AudiobookZoomedProgressBar(
                  position: pos,
                  duration: _state.duration,
                  chapters: chapters,
                  bookmarks: _bookmarksList,
                  notes: _notesList,
                  isTvFocused: _dpadNav &&
                      _tvArea == _AudiobookFocusArea.progress,
                  onSeek: (d) => _manager.seekTo(d),
                ),
                const SizedBox(height: AppSpacing.spaceXs),
                AudiobookBookOverview(
                  position: pos,
                  duration: _state.duration,
                  chapters: chapters,
                  bookmarks: _bookmarksList,
                  notes: _notesList,
                ),
              ],
            ),
          ),
          if (PlatformDetection.useMobileUi) ...[
            const SizedBox(height: AppSpacing.spaceMd),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColorScheme.onSurface.withValues(alpha: 0.06),
            ),
            const SizedBox(height: AppSpacing.spaceMd),
          ] else
            const SizedBox(height: AppSpacing.spaceSm),
          AudiobookTransportRow(
            isPlaying: _state.isPlaying,
            tvFocusIndex: _dpadNav &&
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
          SizedBox(
            height: PlatformDetection.useMobileUi
                ? AppSpacing.spaceLg
                : AppSpacing.spaceSm,
          ),
          AudiobookActionRail(
            speed: _state.playbackSpeed,
            sleepActive: _sleep.isActive,
            sleepRemaining: _sleep.remaining,
            isFavorite: item != null && _isFavoriteCurrent(item),
            tvFocusIndex: _dpadNav &&
                    _tvArea == _AudiobookFocusArea.actionRail
                ? _tvRailIndex
                : -1,
            onOpenSpeed: () => _showSpeedSheet(),
            onOpenSleep: () => _showSleepSheet(chapters),
            onAddBookmark: item == null ? null : () => _addBookmark(item),
            onAddNote: item == null ? null : () => _openNoteEditor(item),
            onToggleFavorite: item == null ? null : () => _toggleFavorite(item),
          ),
        ],
      ),
    );
  }

  Widget _drawerTabContent(
    AudiobookDrawerTab tab,
    AggregatedItem? item,
    List<Chapter> chapters, {
    required bool tv,
  }) {
    final tvIdx = (tv &&
            _dpadNav &&
            _tvArea == _AudiobookFocusArea.drawerContent &&
            _drawerContentActive)
        ? _tvListIndex
        : -1;
    final subIdx = tv ? _tvSubIndex : 0;

    return switch (tab) {
      AudiobookDrawerTab.timeline => AudiobookTimelineList(
          events: _getTimelineEvents(chapters),
          onJump: (ev) {
            if (ev.type == TimelineEventType.chapter) {
              _jumpToChapter(ev.originalObject as Chapter);
            } else if (ev.type == TimelineEventType.bookmark) {
              _manager.seekTo(Duration(
                  milliseconds: (ev.originalObject as AudiobookBookmark).positionMs));
            } else if (ev.type == TimelineEventType.note) {
              _manager.seekTo(Duration(
                  milliseconds: (ev.originalObject as AudiobookNote).positionMs));
            }
          },
          onEditNote: (n) =>
              item != null ? _openNoteEditor(item, existing: n) : null,
          onDeleteBookmark: (b) =>
              unawaited(_bookmarks.removeAt(item!.serverId, item.id, b.positionMs)),
          onDeleteNote: (n) =>
              unawaited(_notes.remove(item!.serverId, item.id, n.id)),
          tvFocusedIndex: tvIdx,
          tvSubIndex: subIdx,
          onExport: () => _exportToCsv('All', _getTimelineEvents(chapters)),
        ),
      AudiobookDrawerTab.chapters => AudiobookChaptersList(
          chapters: chapters,
          position: _state.position,
          onTap: (c) => _jumpToChapter(c),
          tvFocusedIndex: tvIdx,
        ),
      AudiobookDrawerTab.bookmarks => AudiobookBookmarksList(
          item: item,
          service: _bookmarks,
          onJump: (b) => _manager.seekTo(Duration(milliseconds: b.positionMs)),
          tvFocusedIndex: tvIdx,
          tvSubIndex: subIdx,
          onExport: () {
            final bEvents = _bookmarksList
                .map((b) => TimelineEvent(
                      id: 'bookmark_${b.positionMs}',
                      type: TimelineEventType.bookmark,
                      title: b.label,
                      positionMs: b.positionMs,
                      date: b.createdAt,
                      originalObject: b,
                    ))
                .toList();
            _exportToCsv('Bookmarks', bEvents);
          },
        ),
      AudiobookDrawerTab.notes => AudiobookNotesList(
          item: item,
          service: _notes,
          onJump: (n) => _manager.seekTo(Duration(milliseconds: n.positionMs)),
          onEdit: (n) =>
              item != null ? _openNoteEditor(item, existing: n) : null,
          tvFocusedIndex: tvIdx,
          tvSubIndex: subIdx,
          onExport: () {
            final nEvents = _notesList
                .map((n) => TimelineEvent(
                      id: 'note_${n.id}',
                      type: TimelineEventType.note,
                      title: 'Note: ${n.body}',
                      content: n.body,
                      positionMs: n.positionMs,
                      date: n.updatedAt,
                      originalObject: n,
                    ))
                .toList();
            _exportToCsv('Notes', nEvents);
          },
        ),
      AudiobookDrawerTab.queue => AudiobookQueueList(
          queue: _queue,
          onPlay: (i) => _manager.playFromQueue(i),
          tvFocusedIndex: tvIdx,
        ),
    };
  }

  Widget _buildDrawer(
    BuildContext context,
    AggregatedItem? item,
    List<Chapter> chapters,
  ) {
    final l10n = AppLocalizations.of(context);
    final availableTabs = _getAvailableTabs(chapters);
    if (!availableTabs.contains(_drawerTab)) {
      _drawerTab = AudiobookDrawerTab.timeline;
    }
    _tvTabIndex = availableTabs.indexOf(_drawerTab).clamp(0, availableTabs.length - 1);

    final labels = {
      AudiobookDrawerTab.timeline: l10n.audiobookTimeline,
      AudiobookDrawerTab.chapters: l10n.audiobookChapters,
      AudiobookDrawerTab.bookmarks: l10n.audiobookBookmarks,
      AudiobookDrawerTab.notes: l10n.audiobookNotes,
      AudiobookDrawerTab.queue: l10n.audiobookQueue,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceMd),
      child: Column(
        children: [
          AudiobookDrawerTabBar(
            current: _drawerTab,
            tvFocused: _dpadNav &&
                _tvArea == _AudiobookFocusArea.drawerTabs,
            tvIndex: _tvTabIndex,
            onChanged: _setDrawerTab,
            labels: labels,
            tabs: availableTabs,
          ),
          const SizedBox(height: AppSpacing.spaceSm),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: (_dpadNav && _tvArea == _AudiobookFocusArea.drawerContent)
                      ? AppColorScheme.accent
                      : Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: AppRadius.circular(16),
              ),
              child: GlassSurface(
                cornerRadius: 14,
                fallbackColor: AppColorScheme.surface.withValues(alpha: 0.5),
                padding: const EdgeInsets.all(6),
                child: _drawerTabContent(_drawerTab, item, chapters, tv: true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openDrawerSheet(
    BuildContext context,
    AggregatedItem? item,
    List<Chapter> chapters,
  ) {
    final l10n = AppLocalizations.of(context);
    final availableTabs = _getAvailableTabs(chapters);
    if (availableTabs.isEmpty) return;
    final labels = {
      AudiobookDrawerTab.timeline: l10n.audiobookTimeline,
      AudiobookDrawerTab.chapters: l10n.audiobookChapters,
      AudiobookDrawerTab.bookmarks: l10n.audiobookBookmarks,
      AudiobookDrawerTab.notes: l10n.audiobookNotes,
      AudiobookDrawerTab.queue: l10n.audiobookQueue,
    };
    final initial =
        availableTabs.contains(_drawerTab) ? _drawerTab : availableTabs.first;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AudiobookDrawerSheet(
        initialTab: initial,
        tabs: availableTabs,
        labels: labels,
        onTabChanged: _setDrawerTab,
        contentBuilder: (tab) => _drawerTabContent(tab, item, chapters, tv: false),
      ),
    );
  }

  Future<void> _showSpeedSheet() async {
    await showAudiobookSpeedSheet(
      context: context,
      current: _state.playbackSpeed,
      onChanged: (v) async {
        await _manager.setPlaybackSpeed(v);
        await _prefs.set(UserPreferences.audiobookDefaultSpeed, v);
        if (mounted) setState(() {});
      },
    );
  }

  Future<void> _showSleepSheet(List<Chapter> chapters, {bool resumeOnSelect = false}) async {
    await showAudiobookSleepSheet(
      context: context,
      controller: _sleep,
      onPickPreset: (minutes) async {
        await _prefs.set(UserPreferences.audiobookSleepPresetMin, minutes);
        _sleep.startDuration(Duration(minutes: minutes));
        if (resumeOnSelect) {
          await _manager.resume();
        }
      },
      onPickEndOfChapter: () async {
        _sleep.startEndOfChapter(
          chapterStartMsAscending: chapters.map((c) => c.startMs).toList(),
          currentPositionMs: _state.position.inMilliseconds,
          totalDurationMs: _state.duration.inMilliseconds,
        );
        if (resumeOnSelect) {
          await _manager.resume();
        }
      },
      onCancel: _sleep.cancel,
    );
  }

  Future<void> _castToDevice(AggregatedItem item) async {
    await showRemotePlayToSessionDialog(context, item: item);
  }

  Future<void> _showCastControls() async {

  }

  KeyEventResult _handleTvKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    // Consume ALL events while a dialog is open. This prevents KeyRepeat events
    // that were not handled inside the dialog's focus scope from bubbling up
    // through the focus node tree to this handler and triggering _activate().
    if (_dialogOpen) return KeyEventResult.handled;
    final key = event.logicalKey;



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

    // Select/Enter must only activate ONCE per physical key press (KeyDown only).
    // KeyRepeat on a select key must NOT re-trigger _activate() — doing so would
    // open multiple dialogs while the user holds the remote button.
    // Directional keys remain repeat-enabled for smooth continuous scrolling.
    if (key.isSelectKey && event is KeyDownEvent) {
      _activate();
      return KeyEventResult.handled;
    }
    // Consume (but ignore) select KeyRepeat events so they don't bubble further.
    if (key.isSelectKey) return KeyEventResult.handled;

    return KeyEventResult.ignored;
  }

  void _moveVertical(int delta) {
    if (_tvArea == _AudiobookFocusArea.drawerContent && _drawerContentActive) {
      final item = _resolveItem();
      final chapters = _chapters(item);
      int count = 0;
      switch (_drawerTab) {
        case AudiobookDrawerTab.timeline:
          count = _getTimelineEvents(chapters).length;
          break;
        case AudiobookDrawerTab.chapters:
          count = chapters.length;
          break;
        case AudiobookDrawerTab.bookmarks:
          count = _bookmarksList.length;
          break;
        case AudiobookDrawerTab.notes:
          count = _notesList.length;
          break;
        case AudiobookDrawerTab.queue:
          count = _queue.items.length;
          break;
      }
      final hasExport = _tabHasExport(_drawerTab);
      final minIdx = hasExport ? -1 : 0;
      if (count > 0 || hasExport) {
        final nextListIdx = _tvListIndex + delta;
        if (nextListIdx >= minIdx && nextListIdx < count) {
          setState(() {
            _tvListIndex = nextListIdx;
            _tvSubIndex = 0;
          });
          return;
        }
      }
      setState(() => _drawerContentActive = false);
    }

    final List<_AudiobookFocusArea> list;
    if (_drawerOpen) {
      list = [
        _AudiobookFocusArea.header,
        _AudiobookFocusArea.drawerTabs,
        _AudiobookFocusArea.drawerContent,
        _AudiobookFocusArea.progress,
        _AudiobookFocusArea.transport,
        _AudiobookFocusArea.actionRail,
      ];
    } else {
      list = [
        _AudiobookFocusArea.header,
        _AudiobookFocusArea.progress,
        _AudiobookFocusArea.transport,
        _AudiobookFocusArea.actionRail,
      ];
    }

    var idx = list.indexOf(_tvArea);
    if (idx == -1) idx = 0;

    final nextIdx = idx + delta;
    if (nextIdx < 0 || nextIdx >= list.length) return;

    final candidate = list[nextIdx];

    if (candidate == _AudiobookFocusArea.transport && _tvArea == _AudiobookFocusArea.actionRail) {
      _tvTransportIndex = _tvRailIndex;
    } else if (candidate == _AudiobookFocusArea.transport && _tvArea == _AudiobookFocusArea.progress) {
      _tvTransportIndex = 2;
    } else if (candidate == _AudiobookFocusArea.actionRail && _tvArea == _AudiobookFocusArea.transport) {
      _tvRailIndex = _tvTransportIndex;
    } else if (candidate == _AudiobookFocusArea.header && _tvArea == _AudiobookFocusArea.progress) {
      _tvHeaderIndex = 1;
    } else if (candidate == _AudiobookFocusArea.header && _tvArea == _AudiobookFocusArea.drawerTabs) {
      _tvHeaderIndex = 1;
    }

    if (candidate == _AudiobookFocusArea.drawerContent) {
      _drawerContentActive = true;
      _tvListIndex = _tabHasExport(_drawerTab) ? -1 : 0;
      _tvSubIndex = 0;
    }

    setState(() => _tvArea = candidate);
  }

  int _maxSubIndex() {
    final item = _resolveItem();
    final chapters = _chapters(item);
    switch (_drawerTab) {
      case AudiobookDrawerTab.timeline:
        final events = _getTimelineEvents(chapters);
        if (_tvListIndex >= 0 && _tvListIndex < events.length) {
          final ev = events[_tvListIndex];
          if (ev.type == TimelineEventType.note) return 2;
          if (ev.type == TimelineEventType.bookmark) return 1;
        }
        return 0;
      case AudiobookDrawerTab.chapters:
      case AudiobookDrawerTab.queue:
        return 0;
      case AudiobookDrawerTab.bookmarks:
        return 1;
      case AudiobookDrawerTab.notes:
        return 2;
    }
  }

  void _moveHorizontal(int delta) {
    setState(() {
      switch (_tvArea) {
        case _AudiobookFocusArea.header:
          _tvHeaderIndex = (_tvHeaderIndex + delta).clamp(0, 1);
          break;
        case _AudiobookFocusArea.progress:
          final ms = delta < 0
              ? _prefs.get(UserPreferences.skipBackLength)
              : _prefs.get(UserPreferences.skipForwardLength);
          final step = Duration(milliseconds: ms * delta);
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
          final item = _resolveItem();
          final chapters = _chapters(item);
          final availableTabs = _getAvailableTabs(chapters);
          _tvTabIndex =
              (_tvTabIndex + delta).clamp(0, availableTabs.length - 1);
          _drawerTab = availableTabs[_tvTabIndex];
          unawaited(_prefs.set(
              UserPreferences.audiobookDrawerTab, _drawerTab.name));
          break;
        case _AudiobookFocusArea.drawerContent:
          if (_drawerContentActive) {
            final maxIdx = _maxSubIndex();
            if (maxIdx > 0) {
              _tvSubIndex = (_tvSubIndex + delta).clamp(0, maxIdx);
            }
          }
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
        } else if (_tvHeaderIndex == 1) {
          setState(() {
            _drawerOpen = !_drawerOpen;
            if (!_drawerOpen) {
              _drawerContentActive = false;
            }
          });
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
        if (!_drawerContentActive) {
          setState(() {
            _drawerContentActive = true;
            _tvSubIndex = 0;
            _tvListIndex = 0;
          });
        } else {
          switch (_drawerTab) {
            case AudiobookDrawerTab.timeline:
              final events = _getTimelineEvents(chapters);
              if (_tvListIndex >= 0 && _tvListIndex < events.length) {
                final ev = events[_tvListIndex];
                if (ev.type == TimelineEventType.chapter) {
                  _jumpToChapter(ev.originalObject as Chapter);
                } else if (ev.type == TimelineEventType.bookmark) {
                  final b = ev.originalObject as AudiobookBookmark;
                  if (_tvSubIndex == 0) {
                    _manager.seekTo(Duration(milliseconds: b.positionMs));
                  } else if (_tvSubIndex == 1) {
                    unawaited(_bookmarks.removeAt(item!.serverId, item.id, b.positionMs));
                    setState(() {
                      _tvSubIndex = 0;
                    });
                  }
                } else if (ev.type == TimelineEventType.note) {
                  final n = ev.originalObject as AudiobookNote;
                  if (_tvSubIndex == 0) {
                    _manager.seekTo(Duration(milliseconds: n.positionMs));
                  } else if (_tvSubIndex == 1) {
                    _openNoteEditor(item!, existing: n);
                  } else if (_tvSubIndex == 2) {
                    unawaited(_notes.remove(item!.serverId, item.id, n.id));
                    setState(() {
                      _tvSubIndex = 0;
                    });
                  }
                }
              }
              break;
            case AudiobookDrawerTab.chapters:
              if (_tvListIndex >= 0 && _tvListIndex < chapters.length) {
                _jumpToChapter(chapters[_tvListIndex]);
              }
              break;
            case AudiobookDrawerTab.bookmarks:
              if (_tvListIndex >= 0 && _tvListIndex < _bookmarksList.length) {
                final b = _bookmarksList[_tvListIndex];
                if (_tvSubIndex == 0) {
                  _manager.seekTo(Duration(milliseconds: b.positionMs));
                } else if (_tvSubIndex == 1) {
                  unawaited(_bookmarks.removeAt(item!.serverId, item.id, b.positionMs));
                  setState(() {
                    _tvSubIndex = 0;
                  });
                }
              }
              break;
            case AudiobookDrawerTab.notes:
              if (_tvListIndex >= 0 && _tvListIndex < _notesList.length) {
                final n = _notesList[_tvListIndex];
                if (_tvSubIndex == 0) {
                  _manager.seekTo(Duration(milliseconds: n.positionMs));
                } else if (_tvSubIndex == 1) {
                  _openNoteEditor(item!, existing: n);
                } else if (_tvSubIndex == 2) {
                  unawaited(_notes.remove(item!.serverId, item.id, n.id));
                  setState(() {
                    _tvSubIndex = 0;
                  });
                }
              }
              break;
            case AudiobookDrawerTab.queue:
              if (_tvListIndex >= 0 && _tvListIndex < _queue.items.length) {
                _manager.playFromQueue(_tvListIndex);
              }
              break;
          }
        }
        break;
    }
  }
}

class _AudiobookDrawerSheet extends StatefulWidget {
  const _AudiobookDrawerSheet({
    required this.initialTab,
    required this.tabs,
    required this.labels,
    required this.onTabChanged,
    required this.contentBuilder,
  });

  final AudiobookDrawerTab initialTab;
  final List<AudiobookDrawerTab> tabs;
  final Map<AudiobookDrawerTab, String> labels;
  final ValueChanged<AudiobookDrawerTab> onTabChanged;
  final Widget Function(AudiobookDrawerTab) contentBuilder;

  @override
  State<_AudiobookDrawerSheet> createState() => _AudiobookDrawerSheetState();
}

class _AudiobookDrawerSheetState extends State<_AudiobookDrawerSheet> {
  late AudiobookDrawerTab _tab = widget.initialTab;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.82;
    return Container(
      height: height,
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: GlassSurface(
        cornerRadius: 24,
        fallbackColor: AppColorScheme.surface.withValues(alpha: 0.98),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AudiobookDrawerTabBar(
                  current: _tab,
                  tvFocused: false,
                  tvIndex: 0,
                  onChanged: (t) {
                    setState(() => _tab = t);
                    widget.onTabChanged(t);
                  },
                  labels: widget.labels,
                  tabs: widget.tabs,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: widget.contentBuilder(_tab),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      bg = OfflineAwareImage(
        imageUrl: coverUrl!,
        fit: BoxFit.cover,
        color: AppColorScheme.scrim.withValues(alpha: 0.6),
        colorBlendMode: BlendMode.darken,
      );
    }
    if (bg == null) return const SizedBox.shrink();
    final sigma = GlassSettings.capSigma(50);
    if (sigma <= 0) {
      return Positioned.fill(
        child: Stack(
          fit: StackFit.expand,
          children: [bg, const ColoredBox(color: Color(0xB3000000))],
        ),
      );
    }
    return Positioned.fill(
      child: RepaintBoundary(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: bg,
        ),
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
    Widget child;
    if (localPosterPath != null && File(localPosterPath!).existsSync()) {
      child = Image.file(
        File(localPosterPath!),
        height: size,
        fit: BoxFit.contain,
      );
    } else if (coverUrl != null) {
      child = OfflineAwareImage(
        imageUrl: coverUrl!,
        height: size,
        fit: BoxFit.contain,
        placeholder: (_, _) => _placeholder(),
        errorWidget: (_, _, _) => _placeholder(),
      );
    } else {
      child = _placeholder();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 38,
            offset: const Offset(6, 14),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child,
      ),
    );
  }

  Widget _placeholder() => Container(
        height: size,
        width: size * 0.68,
        color: AppColorScheme.surfaceVariant,
        child: Icon(
          Icons.menu_book,
          size: size * 0.28,
          color: AppColorScheme.onSurface.withValues(alpha: 0.4),
        ),
      );
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
