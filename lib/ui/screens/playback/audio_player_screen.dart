import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../widgets/offline_aware_image.dart';
import 'package:flutter/material.dart' hide RepeatMode;
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/lyrics.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/cast/cast_target.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/input_mode_tracker.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/remote_play_to_session_dialog.dart';
import '../../widgets/playback/audio_quality_badge.dart';
import '../../widgets/playback/lyrics_view.dart';
import '../../../l10n/app_localizations.dart';
import 'audiobook_player_view.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

enum _TvAudioFocusArea { favorite, viewTabs, panelBody, progress, transport }

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  static const _tvSeekStepMs = 10000;
  static const _tvBackPopSuppressDuration = Duration(milliseconds: 280);

  final _manager = GetIt.instance<PlaybackManager>();
  final _castService = GetIt.instance<CastService>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _mutations = GetIt.instance<ItemMutationRepository>();
  final _subs = <StreamSubscription>[];
  final _tvOverlayFocus = FocusNode(debugLabel: 'AudioPlayerTvOverlay');
  final _queueScrollController = ScrollController();
  bool _isExitingPlayback = false;
  bool _showQueue = false;
  bool _showLyrics = false;
  bool? _localFavorite;
  String? _favoriteItemId;
  LyricsData? _lyrics;
  String? _lyricsItemId;
  _TvAudioFocusArea _tvFocusArea = _TvAudioFocusArea.transport;
  int _tvTransportActionIndex = 2;
  int _tvQueueFocusIndex = 0;
  int _tvLyricCursor = 0;
  // Which panel the TV right column shows: 0 = Up Next, 1 = Lyrics.
  int _tvViewTab = 0;
  int? _hoveredQueueIndex;
  final _tvLyricScrollController = ScrollController();
  DateTime? _tvBackPopSuppressedUntil;
  Timer? _sleepTimer;
  bool _radioFetchInFlight = false;
  String? _radioSeededItemId;

  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;
  Media3PlayerBackend? get _activeMedia3Backend {
    final backend = _manager.backend;
    return backend is Media3PlayerBackend ? backend : null;
  }

  MediaServerClient _clientForItem(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  @override
  void initState() {
    super.initState();
    _tvQueueFocusIndex = _initialTvQueueFocusIndex();
    _subs.addAll([
      _manager.backendChangedStream.listen((_) => _rebuild()),
      _state.playingStream.listen((_) => _rebuild()),
      _state.positionStream.listen((_) => _rebuild()),
      _state.durationStream.listen((_) => _rebuild()),
      _state.repeatModeStream.listen((_) => _rebuild()),
      _state.shuffleStream.listen((_) => _rebuild()),
      _queue.queueChangedStream.listen((_) {
        _syncTvQueueFocusIndex();
        _rebuild();
        _loadLyricsIfNeeded();
        unawaited(_maybeExtendWithRadio());
      }),
      _manager.sessionEndedStream.listen((_) {
        if (!mounted || _isExitingPlayback) return;
        unawaited(_exitPlayback());
      }),
    ]);
    if (PlatformDetection.useNativeVideoSurface) {
      unawaited(_activeMedia3Backend?.setVolume(100.0));
    }
    if (_isWidePlayer) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _tvOverlayFocus.requestFocus();
        _scrollTvQueueIntoView(_tvQueueFocusIndex, animate: false);
      });
    }
    _loadLyricsIfNeeded();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  // Mobile only: toggles the full-screen queue panel. The wide player
  // (desktop/TV) uses the two-column view switcher instead.
  void _toggleQueuePanel() {
    setState(() {
      _showQueue = !_showQueue;
      if (_showQueue) _showLyrics = false;
    });
  }

  void _seekTvRelative(int deltaMs) {
    final totalMs = _state.duration.inMilliseconds;
    if (totalMs <= 0) return;
    final currentMs = _state.position.inMilliseconds;
    final targetMs = (currentMs + deltaMs).clamp(0, totalMs).toInt();
    unawaited(_manager.seekTo(Duration(milliseconds: targetMs)));
  }

  bool get _isWidePlayer =>
      PlatformDetection.isTV || PlatformDetection.useDesktopUi;

  bool get _tvLyricsAvailable => _lyrics?.isNotEmpty ?? false;
  int get _tvTabCount => _tvLyricsAvailable ? 2 : 1;
  bool get _tvPanelIsLyrics => _tvViewTab == 1 && _tvLyricsAvailable;

  int _currentLyricLineIndex() {
    final lyrics = _lyrics;
    if (lyrics == null || !lyrics.isSynced) return 0;
    final pos = _state.position;
    var idx = 0;
    for (var i = lyrics.lines.length - 1; i >= 0; i--) {
      if (pos >= lyrics.lines[i].start) {
        idx = i;
        break;
      }
    }
    return idx;
  }

  void _moveTvHorizontalFocus(int delta) {
    switch (_tvFocusArea) {
      case _TvAudioFocusArea.viewTabs:
        {
          final next = (_tvViewTab + delta).clamp(0, _tvTabCount - 1);
          if (next != _tvViewTab) setState(() => _tvViewTab = next);
        }
        break;
      case _TvAudioFocusArea.transport:
        {
          final next = (_tvTransportActionIndex + delta).clamp(0, 4);
          if (next != _tvTransportActionIndex) {
            setState(() => _tvTransportActionIndex = next);
          }
        }
        break;
      case _TvAudioFocusArea.progress:
        _seekTvRelative(delta < 0 ? -_tvSeekStepMs : _tvSeekStepMs);
        break;
      case _TvAudioFocusArea.panelBody:
        if (delta < 0) {
          setState(() => _tvFocusArea = _TvAudioFocusArea.viewTabs);
        }
        break;
      case _TvAudioFocusArea.favorite:
        break;
    }
  }

  // panelBody is entered via SELECT on the switcher and left via LEFT/BACK, so
  // it is not part of this vertical chain.
  void _moveTvVerticalFocus(int delta) {
    final current = _tvFocusArea;
    final next = delta < 0
        ? switch (current) {
            _TvAudioFocusArea.transport => _TvAudioFocusArea.progress,
            _TvAudioFocusArea.progress => _TvAudioFocusArea.viewTabs,
            _TvAudioFocusArea.viewTabs => _TvAudioFocusArea.favorite,
            _ => current,
          }
        : switch (current) {
            _TvAudioFocusArea.favorite => _TvAudioFocusArea.viewTabs,
            _TvAudioFocusArea.viewTabs => _TvAudioFocusArea.progress,
            _TvAudioFocusArea.progress => _TvAudioFocusArea.transport,
            _ => current,
          };
    if (next != current) setState(() => _tvFocusArea = next);
  }

  void _enterTvPanel() {
    setState(() {
      _tvFocusArea = _TvAudioFocusArea.panelBody;
      if (_tvPanelIsLyrics) {
        _tvLyricCursor = _currentLyricLineIndex();
      } else {
        _tvQueueFocusIndex = _initialTvQueueFocusIndex();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_tvPanelIsLyrics) {
        _scrollTvLyricIntoView(_tvLyricCursor);
      } else {
        _scrollTvQueueIntoView(_tvQueueFocusIndex);
      }
    });
  }

  void _setTvLyricCursor(int index) {
    final count = _lyrics?.lines.length ?? 0;
    if (count <= 0) return;
    final clamped = index.clamp(0, count - 1);
    if (clamped == _tvLyricCursor) return;
    setState(() => _tvLyricCursor = clamped);
    _scrollTvLyricIntoView(clamped);
  }

  void _scrollTvLyricIntoView(int index, {bool animate = true}) {
    if (!_tvLyricScrollController.hasClients) return;
    final target = (index * 44.0).clamp(
      _tvLyricScrollController.position.minScrollExtent,
      _tvLyricScrollController.position.maxScrollExtent,
    );
    if (animate) {
      unawaited(
        _tvLyricScrollController.animateTo(
          target,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
        ),
      );
    } else {
      _tvLyricScrollController.jumpTo(target);
    }
  }

  void _activateTvTransportAction() {
    switch (_tvTransportActionIndex) {
      case 0:
        _manager.toggleShuffle();
        return;
      case 1:
        unawaited(_manager.previous());
        return;
      case 2:
        if (_state.isPlaying) {
          unawaited(_manager.pause());
        } else {
          unawaited(_manager.resume());
        }
        return;
      case 3:
        unawaited(_manager.next());
        return;
      case 4:
        _manager.toggleRepeat();
        return;
    }
  }

  Widget _tvFocusShell({
    required bool focused,
    required Widget child,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) {
    if (!_isWidePlayer) {
      return child;
    }

    // Only paint the focus ring when actually navigating by keyboard/D-pad, so
    // desktop mouse users don't see a persistent glow 
    final showFocus = InputModeTracker.showFocusVisuals(context, focused);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: showFocus
              ? AppColorScheme.accent
              : AppColorScheme.onSurface.withValues(alpha: 0.0),
          width: 2.4,
        ),
        color: showFocus
            ? AppColorScheme.onSurface.withValues(alpha: 0.24)
            : Colors.transparent,
        boxShadow: showFocus
            ? [
                BoxShadow(
                  color: AppColorScheme.accent.withValues(alpha: 0.45),
                  blurRadius: 14,
                  spreadRadius: 1.4,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }

  int _initialTvQueueFocusIndex() {
    final count = _queue.items.length;
    if (count <= 0) return 0;
    final current = _queue.currentIndex;
    if (current < 0) return 0;
    if (current >= count) return count - 1;
    return current;
  }

  void _syncTvQueueFocusIndex() {
    if (!_isWidePlayer || _tvPanelIsLyrics) return;
    final count = _queue.items.length;
    if (count <= 0) {
      if (_tvQueueFocusIndex != 0) {
        setState(() => _tvQueueFocusIndex = 0);
      }
      return;
    }

    final clamped = _tvQueueFocusIndex.clamp(0, count - 1);
    if (clamped != _tvQueueFocusIndex) {
      setState(() => _tvQueueFocusIndex = clamped);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _scrollTvQueueIntoView(_tvQueueFocusIndex, animate: false);
      });
    }
  }

  void _setTvQueueFocusIndex(int index) {
    final count = _queue.items.length;
    if (count <= 0) {
      if (_tvQueueFocusIndex != 0) {
        setState(() => _tvQueueFocusIndex = 0);
      }
      return;
    }

    final clamped = index.clamp(0, count - 1);
    if (clamped == _tvQueueFocusIndex) return;

    setState(() => _tvQueueFocusIndex = clamped);
    _scrollTvQueueIntoView(clamped);
  }

  void _scrollTvQueueIntoView(int index, {bool animate = true}) {
    if (!_queueScrollController.hasClients) return;
    final targetOffset = (index * 72.0).clamp(
      _queueScrollController.position.minScrollExtent,
      _queueScrollController.position.maxScrollExtent,
    );
    if (animate) {
      unawaited(
        _queueScrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
        ),
      );
    } else {
      _queueScrollController.jumpTo(targetOffset);
    }
  }

  bool _isTvBackPopSuppressed() {
    final until = _tvBackPopSuppressedUntil;
    if (!PlatformDetection.isTV || until == null) return false;
    if (DateTime.now().isAfter(until)) {
      _tvBackPopSuppressedUntil = null;
      return false;
    }
    return true;
  }

  void _suppressTvBackPop() {
    if (!PlatformDetection.isTV) return;
    _tvBackPopSuppressedUntil = DateTime.now().add(_tvBackPopSuppressDuration);
  }

  KeyEventResult _handleTvKeyEvent(FocusNode node, KeyEvent event) {
    if (!_isWidePlayer || !event.isActionable) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    // Back: when inside the panel, step out to the switcher; otherwise let the
    // framework handle it (exit playback).
    if (key.isBackKey) {
      if (_tvFocusArea == _TvAudioFocusArea.panelBody) {
        if (event is KeyRepeatEvent) return KeyEventResult.handled;
        setState(() => _tvFocusArea = _TvAudioFocusArea.viewTabs);
        return KeyEventResult.handled;
      }
      if (event is KeyRepeatEvent) return KeyEventResult.handled;
      return KeyEventResult.ignored;
    }

    // Panel body captures up/down for its cursor, select acts on the item.
    if (_tvFocusArea == _TvAudioFocusArea.panelBody) {
      if (_tvPanelIsLyrics) {
        if (key.isUpKey) {
          _setTvLyricCursor(_tvLyricCursor - 1);
          return KeyEventResult.handled;
        }
        if (key.isDownKey) {
          _setTvLyricCursor(_tvLyricCursor + 1);
          return KeyEventResult.handled;
        }
        if (key.isSelectKey) {
          final lines = _lyrics?.lines ?? const <LyricLine>[];
          if (_tvLyricCursor >= 0 && _tvLyricCursor < lines.length) {
            unawaited(_manager.seekTo(lines[_tvLyricCursor].start));
          }
          return KeyEventResult.handled;
        }
      } else {
        if (key.isUpKey) {
          _setTvQueueFocusIndex(_tvQueueFocusIndex - 1);
          return KeyEventResult.handled;
        }
        if (key.isDownKey) {
          _setTvQueueFocusIndex(_tvQueueFocusIndex + 1);
          return KeyEventResult.handled;
        }
        if (key.isSelectKey) {
          final count = _queue.items.length;
          if (count > 0) {
            unawaited(
              _manager.playFromQueue(_tvQueueFocusIndex.clamp(0, count - 1)),
            );
          }
          return KeyEventResult.handled;
        }
      }
      if (key.isLeftKey) {
        setState(() => _tvFocusArea = _TvAudioFocusArea.viewTabs);
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    if (key.isLeftKey) {
      _moveTvHorizontalFocus(-1);
      return KeyEventResult.handled;
    }
    if (key.isRightKey) {
      _moveTvHorizontalFocus(1);
      return KeyEventResult.handled;
    }
    if (key.isUpKey) {
      _moveTvVerticalFocus(-1);
      return KeyEventResult.handled;
    }
    if (key.isDownKey) {
      _moveTvVerticalFocus(1);
      return KeyEventResult.handled;
    }
    if (key.isSelectKey) {
      if (_tvFocusArea == _TvAudioFocusArea.favorite) {
        final item = _resolveCurrentItem();
        if (item != null) unawaited(_toggleFavorite(item));
      } else if (_tvFocusArea == _TvAudioFocusArea.viewTabs) {
        _enterTvPanel();
      } else if (_tvFocusArea == _TvAudioFocusArea.transport) {
        _activateTvTransportAction();
      }
      return KeyEventResult.handled;
    }
    if (key.isContextMenuKey) {
      _enterTvPanel();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  bool _getIsFavorite(AggregatedItem item) {
    if (_favoriteItemId == item.id) return _localFavorite ?? item.isFavorite;
    return item.isFavorite;
  }

  Future<void> _toggleFavorite(AggregatedItem item) async {
    final current = _getIsFavorite(item);
    final newVal = !current;
    setState(() {
      _favoriteItemId = item.id;
      _localFavorite = newVal;
    });
    try {
      await _mutations.setFavorite(item.id, isFavorite: newVal);
    } catch (_) {
      if (mounted) setState(() => _localFavorite = current);
    }
  }

  /// When the queue is nearing its end (and repeat is off, online), seeds an
  /// Instant Mix "radio" off the current track and appends fresh tracks so the
  /// queue never dead-ends. Guarded so each seed only extends the queue once.
  Future<void> _maybeExtendWithRadio() async {
    if (_radioFetchInFlight || _manager.isOfflinePlayback) return;
    if (_queue.repeatMode != RepeatMode.none) return;
    final items = _queue.items;
    final idx = _queue.currentIndex;
    if (idx < 0 || items.isEmpty) return;
    if (items.length - 1 - idx > 2) return; // only near the end
    final seed = _resolveCurrentItem();
    if (seed == null || _radioSeededItemId == seed.id) return;

    _radioFetchInFlight = true;
    _radioSeededItemId = seed.id;
    try {
      final client = _clientForItem(seed);
      final data = await client.instantMixApi.getInstantMix(seed.id, limit: 25);
      final rawList = (data['Items'] as List?) ?? const [];
      final existingIds =
          items.whereType<AggregatedItem>().map((e) => e.id).toSet();
      final additions = <AggregatedItem>[];
      for (final raw in rawList) {
        if (raw is! Map) continue;
        final map = Map<String, dynamic>.from(raw);
        final id = map['Id']?.toString();
        if (id == null || existingIds.contains(id)) continue;
        existingIds.add(id);
        additions.add(
          AggregatedItem(
            id: id,
            serverId: map['ServerId']?.toString() ?? seed.serverId,
            rawData: map,
          ),
        );
      }
      if (additions.isNotEmpty && mounted) {
        _queue.addItems(additions);
      }
    } catch (_) {
      _radioSeededItemId = null; // allow a later retry
    } finally {
      _radioFetchInFlight = false;
    }
  }

  void _setSleepTimer(Duration? duration) {
    _sleepTimer?.cancel();
    _sleepTimer = null;
    if (duration != null && duration > Duration.zero) {
      _sleepTimer = Timer(duration, () {
        _sleepTimer = null;
        unawaited(_manager.pause());
        if (mounted) setState(() {});
      });
    }
    if (mounted) setState(() {});
  }

  Future<void> _showOverflowSheet(AggregatedItem item) async {
    const speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
    const sleepOptions = <String, Duration?>{
      'Off': null,
      '15 min': Duration(minutes: 15),
      '30 min': Duration(minutes: 30),
      '60 min': Duration(minutes: 60),
    };

    await showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) {
          Widget sectionTitle(String t) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
            child: Text(
              t,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          );

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('PLAYBACK SPEED'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      spacing: 8,
                      children: [
                        for (final s in speeds)
                          ChoiceChip(
                            label: Text('${s}x'),
                            selected: (_state.playbackSpeed - s).abs() < 0.01,
                            onSelected: (_) {
                              unawaited(_manager.setPlaybackSpeed(s));
                              setSheet(() {});
                              if (mounted) setState(() {});
                            },
                          ),
                      ],
                    ),
                  ),
                  sectionTitle('SLEEP TIMER'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      spacing: 8,
                      children: [
                        for (final entry in sleepOptions.entries)
                          ChoiceChip(
                            label: Text(entry.key),
                            selected: entry.value == null && _sleepTimer == null,
                            onSelected: (_) {
                              _setSleepTimer(entry.value);
                              setSheet(() {});
                            },
                          ),
                        ChoiceChip(
                          label: const Text('End of track'),
                          selected: false,
                          onSelected: (_) {
                            _setSleepTimer(_state.duration - _state.position);
                            setSheet(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: AdaptiveIcon(
                      Icons.playlist_add_rounded,
                      color: AppColorScheme.onSurface,
                    ),
                    title: Text(
                      'Save queue as playlist',
                      style: TextStyle(color: AppColorScheme.onSurface),
                    ),
                    onTap: () {
                      Navigator.of(ctx).pop();
                      unawaited(_saveQueueAsPlaylist(item));
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveQueueAsPlaylist(AggregatedItem item) async {
    if (_manager.isOfflinePlayback) return;
    final ids = _queue.items
        .whereType<AggregatedItem>()
        .map((e) => e.id)
        .toList();
    if (ids.isEmpty) return;
    final name = await _promptPlaylistName();
    if (name == null || name.trim().isEmpty || !mounted) return;
    try {
      final client = _clientForItem(item);
      await client.itemsApi.createPlaylist(name: name.trim(), itemIds: ids);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Saved "${name.trim()}"')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not save playlist: $e')));
      }
    }
  }

  Future<String?> _promptPlaylistName() {
    final controller = TextEditingController(
      text: _resolveCurrentItem()?.album ?? 'My Playlist',
    );
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColorScheme.surface,
        title: Text(
          'Save queue as playlist',
          style: TextStyle(color: AppColorScheme.onSurface),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: TextStyle(color: AppColorScheme.onSurface),
          decoration: const InputDecoration(hintText: 'Playlist name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _exitPlayback() async {
    if (_isExitingPlayback || !mounted) return;
    _isExitingPlayback = true;
    try {
      await _manager.stop(userInitiated: false);
    } catch (_) {}
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    _sleepTimer?.cancel();
    _tvOverlayFocus.dispose();
    _queueScrollController.dispose();
    _tvLyricScrollController.dispose();
    super.dispose();
  }

  AggregatedItem? _resolveCurrentItem() {
    final currentItem = _queue.currentItem;
    if (currentItem is AggregatedItem) return currentItem;
    final meta = _manager.currentOfflineMetadata;
    if (meta == null) return null;
    final id = meta['Id']?.toString() ?? '';
    final serverId = meta['ServerId']?.toString() ?? '';
    return AggregatedItem(id: id, serverId: serverId, rawData: meta);
  }

  String? _offlinePosterPath() {
    final meta = _manager.currentOfflineMetadata;
    return meta?['_localPosterPath'] as String?;
  }

  Future<void> _loadLyricsIfNeeded() async {
    final resolved = _resolveCurrentItem();
    if (resolved == null) return;
    if (resolved.id == _lyricsItemId) return;
    _lyricsItemId = resolved.id;

    final meta = _manager.currentOfflineMetadata;
    final lyricsPath = meta?['_localLyricsPath'] as String?;
    if (lyricsPath != null) {
      try {
        final file = File(lyricsPath);
        if (await file.exists()) {
          final data =
              jsonDecode(await file.readAsString()) as Map<String, dynamic>;
          if (mounted && _lyricsItemId == resolved.id) {
            setState(() => _lyrics = LyricsData.fromJson(data));
          }
          return;
        }
      } catch (_) {}
    }

    if (_manager.isOfflinePlayback) {
      if (mounted) setState(() => _lyrics = LyricsData.empty);
      return;
    }
    try {
      final client = _clientForItem(resolved);
      final data = await client.itemsApi.getLyrics(resolved.id);
      if (mounted && _lyricsItemId == resolved.id) {
        setState(() => _lyrics = LyricsData.fromJson(data));
      }
    } catch (_) {
      if (mounted) setState(() => _lyrics = LyricsData.empty);
    }
  }

  String? _getArtUrl(AggregatedItem item) {
    final client = _clientForItem(item);
    final albumTag = item.albumPrimaryImageTag;
    final albumId = item.albumId;
    if (item.type == 'Audio' && albumTag != null && albumId != null) {
      return client.imageApi.getPrimaryImageUrl(
        albumId,
        maxHeight: 600,
        tag: albumTag,
      );
    }
    if (item.primaryImageTag != null) {
      return client.imageApi.getPrimaryImageUrl(
        item.id,
        maxHeight: 600,
        tag: item.primaryImageTag,
      );
    }
    return null;
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  bool _shouldUseSplitLyricsLayout(BuildContext context) {
    if (_showQueue || _lyrics == null || _lyrics!.isEmpty) {
      return false;
    }
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;
    return !PlatformDetection.useMobileUi || isLandscape;
  }

  @override
  Widget build(BuildContext context) {
    final item = _resolveCurrentItem();
    final attachMedia3View =
        PlatformDetection.useNativeVideoSurface && _activeMedia3Backend != null;
    final isAudiobookRoute = GoRouterState.of(context).uri.queryParameters['isAudiobook'] == 'true';
    final isAudiobook = (item != null && item.isAudiobook) || isAudiobookRoute;
    if (isAudiobook) {
      if (!attachMedia3View) {
        return const AudiobookPlayerView();
      }
      return const Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -2,
            top: -2,
            width: 1,
            height: 1,
            child: IgnorePointer(
              child: Media3VideoView(fill: Color(0x00000000)),
            ),
          ),
          AudiobookPlayerView(),
        ],
      );
    }
    final localPoster = _offlinePosterPath();
    final artUrl = item != null && !_manager.isOfflinePlayback
        ? _getArtUrl(item)
        : null;
    final useSplitLyricsLayout = _shouldUseSplitLyricsLayout(context);

    final ImageProvider? ambientImage =
        (localPoster != null && File(localPoster).existsSync())
        ? FileImage(File(localPoster))
        : (artUrl != null ? offlineAwareImageProvider(artUrl) : null);

    final content = Stack(
      fit: StackFit.expand,
      children: [
        if (attachMedia3View)
          const Positioned(
            left: -2,
            top: -2,
            width: 1,
            height: 1,
            child: IgnorePointer(
              child: Media3VideoView(fill: Color(0x00000000)),
            ),
          ),
        Positioned.fill(
          child: AmbientBackground(
            image: ambientImage,
            child: SafeArea(
              child: _isWidePlayer
                  ? _buildTvBody(item, artUrl, localPoster: localPoster)
                  : Column(
                children: [
                  _buildTopBar(context, item),
                  Expanded(
                    child: _showQueue
                        ? _buildQueueList()
                        : useSplitLyricsLayout
                        ? _buildNowPlayingWithLyrics(
                            item,
                            artUrl,
                            localPoster: localPoster,
                          )
                        : _showLyrics && _lyrics != null && _lyrics!.isNotEmpty
                        ? LyricsView(
                            lyrics: _lyrics!,
                            positionStream: _state.positionStream,
                            position: _state.position,
                            onSeekToLine: (d) => unawaited(_manager.seekTo(d)),
                          )
                        : _buildNowPlaying(
                            item,
                            artUrl,
                            localPoster: localPoster,
                          ),
                  ),
                  if (item != null && !_showQueue && !_showLyrics)
                    _buildFavoriteRow(item),
                  _buildProgressBar(),
                  _buildTransportControls(),
                  if (!useSplitLyricsLayout) _buildMobileViewSwitcher(),
                  const SizedBox(height: AppSpacing.spaceLg),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final tvWrappedContent = _isWidePlayer
        ? Focus(
            focusNode: _tvOverlayFocus,
            autofocus: true,
            onKeyEvent: _handleTvKeyEvent,
            child: content,
          )
        : content;

    return PopScope(
      canPop: !_showQueue,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_isTvBackPopSuppressed()) return;
        if (_showQueue) {
          _suppressTvBackPop();
          _toggleQueuePanel();
        }
      },
      child: Scaffold(
        backgroundColor: AppColorScheme.background,
        body: tvWrappedContent,
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, AggregatedItem? item) {
    final isTv = PlatformDetection.isTV;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceSm,
        vertical: AppSpacing.spaceXs,
      ),
      child: Row(
        children: [
          if (!isTv)
            IconButton(
              icon: const AdaptiveIcon(Icons.arrow_back, size: 24),
              onPressed: () => Navigator.of(context).pop(),
            ),
          const Spacer(),
          if (item != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.spaceSm),
              child: AudioQualityBadge(item: item),
            ),
          const Spacer(),
          if (!isTv && item != null)
            ValueListenableBuilder<CastTargetKind?>(
              valueListenable: _castService.activeKindNotifier,
              builder: (context, kind, _) => IconButton(
                icon: AdaptiveIcon(
                  _castIcon(kind),
                  size: 24,
                  color: kind != null ? AppColorScheme.accent : null,
                ),
                onPressed: () => _castToDevice(item),
              ),
            ),
          if (!isTv)
            ValueListenableBuilder<CastTargetKind?>(
              valueListenable: _castService.activeKindNotifier,
              builder: (context, kind, _) {
                if (kind == null) return const SizedBox.shrink();
                return IconButton(
                  icon: const AdaptiveIcon(Icons.settings_remote_rounded, size: 24),
                  onPressed: _showCastControls,
                );
              },
            ),
          if (!isTv && item != null)
            IconButton(
              icon: const AdaptiveIcon(Icons.more_vert, size: 24),
              onPressed: () => _showOverflowSheet(item),
            ),
        ],
      ),
    );
  }

  Widget _buildNowPlayingWithLyrics(
    AggregatedItem? item,
    String? artUrl, {
    String? localPoster,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: _buildNowPlaying(item, artUrl, localPoster: localPoster),
          ),
          const SizedBox(width: AppSpacing.spaceLg),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceSm),
              child: LyricsView(
                lyrics: _lyrics!,
                positionStream: _state.positionStream,
                position: _state.position,
                onSeekToLine: (d) => unawaited(_manager.seekTo(d)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNowPlaying(
    AggregatedItem? item,
    String? artUrl, {
    String? localPoster,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxArtByWidth = (constraints.maxWidth - (AppSpacing.space2xl * 2))
            .clamp(160.0, 560.0);
        final maxArtByHeight = (constraints.maxHeight * 0.62).clamp(
          160.0,
          560.0,
        );
        final artSize = maxArtByWidth < maxArtByHeight
            ? maxArtByWidth
            : maxArtByHeight;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space2xl),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: artSize,
                  height: artSize,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.black,
                          blurRadius: 30,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: localPoster != null && File(localPoster).existsSync()
                        ? Image.file(
                            File(localPoster),
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => _artPlaceholder(),
                          )
                        : artUrl != null
                        ? OfflineAwareImage(
                            imageUrl: artUrl,
                            fit: BoxFit.cover,
                            placeholder: (_, _) => _artPlaceholder(),
                            errorWidget: (_, _, _) => _artPlaceholder(),
                          )
                        : _artPlaceholder(),
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceXl),
                Text(
                  item?.name ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.spaceXs),
                Text(
                  _artistLine(item),
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (item?.album != null) ...[
                  const SizedBox(height: AppSpacing.space2xs),
                  Text(
                    item!.album!,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _artPlaceholder() {
    return Container(
      color: AppColorScheme.surfaceVariant,
      child: Center(
        child: AdaptiveIcon(
          Icons.music_note,
          size: 64,
          color: AppColorScheme.onSurface.withValues(alpha: 0.38),
        ),
      ),
    );
  }

  Widget _queueArtPlaceholder() {
    return Container(
      color: AppColorScheme.surfaceVariant,
      child: AdaptiveIcon(
        Icons.music_note,
        size: 24,
        color: AppColorScheme.onSurface.withValues(alpha: 0.38),
      ),
    );
  }

  String _artistLine(AggregatedItem? item) {
    if (item == null) return '';
    if (item.artists.isNotEmpty) return item.artists.join(', ');
    if (item.albumArtist != null) return item.albumArtist!;
    return '';
  }

  Future<void> _castToDevice(AggregatedItem item) async {
    if (_manager.isOfflinePlayback) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.castingUnavailableOffline)));
      return;
    }

    final positionTicks = _state.position.inMicroseconds * 10;
    final startIndex = _queue.currentIndex < 0 ? 0 : _queue.currentIndex;
    final queueItems = _queue.items
        .skip(startIndex)
        .whereType<AggregatedItem>()
        .toList(growable: false);

    await showRemotePlayToSessionDialog(
      context,
      item: item,
      queueItems: queueItems.length > 1 ? queueItems : null,
      startPositionTicks: positionTicks,
      audioStreamIndex: _manager.audioStreamIndex,
      subtitleStreamIndex: _manager.subtitleStreamIndex,
    );
  }

  IconData _castIcon(CastTargetKind? kind) => switch (kind) {
    CastTargetKind.googleCast => Icons.cast_connected,
    CastTargetKind.airPlay => Icons.airplay,
    CastTargetKind.dlna => Icons.router,
    CastTargetKind.jellyfinSession => Icons.devices,
    null => Icons.cast,
  };

  Future<void> _runCastAction(
    Future<void> Function(CastTargetKind kind) action,
  ) async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    try {
      await action(kind);
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      final label = switch (kind) {
        CastTargetKind.googleCast => 'Google Cast',
        CastTargetKind.airPlay => 'AirPlay',
        CastTargetKind.dlna => 'DLNA',
        CastTargetKind.jellyfinSession => l10n.remotePlayback,
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.castActionFailed(label, '$e'))),
      );
    }
  }

  Future<void> _refreshRemoteVolume() async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    try {
      _castService.remoteVolumeNotifier.value = await _castService.getVolume(
        kind,
      );
    } catch (_) {
      _castService.remoteVolumeNotifier.value = null;
    }
  }

  Future<void> _setRemoteVolume(double volume) async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    _castService.remoteVolumeNotifier.value = volume;
    try {
      await _castService.setVolume(kind, volume: volume);
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.failedToSetCastVolume('$e'))));
    }
  }

  void _showCastControls() {
    final kind = _castService.activeKind;
    if (kind == null) return;

    _refreshRemoteVolume();

    final l10n = AppLocalizations.of(context);
    final label = switch (kind) {
      CastTargetKind.googleCast => 'Google Cast',
      CastTargetKind.airPlay => 'AirPlay',
      CastTargetKind.dlna => 'DLNA',
      CastTargetKind.jellyfinSession => l10n.remotePlayback,
    };

    showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<String?>(
              valueListenable: _castService.remoteStateNotifier,
              builder: (context, stateVal, _) {
                return ValueListenableBuilder<int>(
                  valueListenable: _castService.remotePositionNotifier,
                  builder: (context, ticks, _) => ListTile(
                    title: Text(
                      l10n.castControlsTitle(label),
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: stateVal != null
                        ? Text(
                            '${stateVal[0].toUpperCase()}${stateVal.substring(1)}'
                            ' · ${_formatDuration(Duration(microseconds: ticks ~/ 10))}',
                            style: TextStyle(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.54,
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
            if (kind == CastTargetKind.googleCast ||
                kind == CastTargetKind.dlna)
              ListTile(
                leading: AdaptiveIcon(
                  Icons.volume_up_rounded,
                  color: AppColorScheme.onSurface,
                ),
                title: Text(
                  l10n.deviceVolume,
                  style: TextStyle(color: AppColorScheme.onSurface),
                ),
                subtitle: ValueListenableBuilder<double?>(
                  valueListenable: _castService.remoteVolumeNotifier,
                  builder: (context, vol, _) => vol == null
                      ? Text(
                          l10n.unavailable,
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.54,
                            ),
                          ),
                        )
                      : SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColorScheme.accent,
                            inactiveTrackColor: AppColorScheme.onSurface
                                .withValues(alpha: 0.24),
                            thumbColor: AppColorScheme.onSurface,
                            overlayColor: AppColorScheme.onSurface.withValues(
                              alpha: 0.24,
                            ),
                          ),
                          child: Slider(
                            value: vol.clamp(0.0, 1.0),
                            min: 0,
                            max: 1,
                            onChanged: _setRemoteVolume,
                          ),
                        ),
                ),
                trailing: ValueListenableBuilder<double?>(
                  valueListenable: _castService.remoteVolumeNotifier,
                  builder: (context, vol, _) => vol == null
                      ? const SizedBox.shrink()
                      : Text(
                          '${(vol * 100).round()}%',
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                ),
              ),
            ListTile(
              leading: AdaptiveIcon(
                Icons.play_arrow_rounded,
                color: AppColorScheme.onSurface,
              ),
              title: Text(
                l10n.play,
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                _runCastAction((k) => _castService.play(k));
              },
            ),
            ListTile(
              leading: AdaptiveIcon(
                Icons.pause_rounded,
                color: AppColorScheme.onSurface,
              ),
              title: Text(
                l10n.pause,
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                _runCastAction((k) => _castService.pause(k));
              },
            ),
            ListTile(
              leading: AdaptiveIcon(
                Icons.sync_rounded,
                color: AppColorScheme.onSurface,
              ),
              title: Text(
                l10n.syncPosition,
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                final positionTicks = _state.position.inMicroseconds * 10;
                _runCastAction(
                  (k) => _castService.seek(k, positionTicks: positionTicks),
                );
              },
            ),
            ListTile(
              leading: AdaptiveIcon(
                Icons.stop_rounded,
                color: AppColorScheme.onSurface,
              ),
              title: Text(
                l10n.stopCast(label),
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                _runCastAction((k) => _castService.stop(k));
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Mobile bottom switcher: `[ Lyrics | Up Next ]` pills that toggle the
  /// centre view, mirroring the wide player's view switcher.
  Widget _buildMobileViewSwitcher() {
    final hasLyrics = _lyrics?.isNotEmpty ?? false;

    Widget chip(String label, bool active, VoidCallback onTap) => Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppColorScheme.accent : Colors.transparent,
            borderRadius: AppRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: active
                  ? AppColorScheme.onAccent
                  : AppColorScheme.onSurface.withValues(alpha: 0.8),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceLg,
        AppSpacing.spaceSm,
        AppSpacing.spaceLg,
        0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: AppRadius.circular(24),
        ),
        child: Row(
          children: [
            if (hasLyrics)
              chip('Lyrics', _showLyrics, () {
                setState(() {
                  _showLyrics = !_showLyrics;
                  if (_showLyrics) _showQueue = false;
                });
              }),
            chip('Up Next', _showQueue, _toggleQueuePanel),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteRow(AggregatedItem item) {
    final isFav = _getIsFavorite(item);
    return IconButton(
      icon: AdaptiveIcon(
        isFav ? Icons.favorite : Icons.favorite_border,
        size: 28,
        color: isFav
            ? AppColorScheme.accent
            : AppColorScheme.onSurface.withValues(alpha: 0.7),
      ),
      onPressed: () => _toggleFavorite(item),
    );
  }

  Widget _tvFavoriteButton(AggregatedItem item) {
    return _tvFocusShell(
      focused: _tvFocusArea == _TvAudioFocusArea.favorite,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: _buildFavoriteRow(item),
    );
  }

  /// TV/leanback two-column player: album art + metadata on the left, and a
  /// D-pad-driven `[Up Next | Lyrics]` panel on the right, with full-width
  /// progress + transport below.
  Widget _buildTvBody(
    AggregatedItem? item,
    String? artUrl, {
    String? localPoster,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.spaceLg,
            AppSpacing.spaceSm,
            AppSpacing.spaceLg,
            0,
          ),
          child: Row(
            children: [
              if (!PlatformDetection.isTV)
                IconButton(
                  icon: const AdaptiveIcon(Icons.arrow_back, size: 24),
                  onPressed: () => Navigator.of(context).pop(),
                )
              else
                const SizedBox(width: 48),
              Expanded(
                child: Center(
                  child: item != null
                      ? AudioQualityBadge(item: item)
                      : const SizedBox.shrink(),
                ),
              ),
              if (item != null)
                _tvFavoriteButton(item)
              else
                const SizedBox(width: 48),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _buildNowPlaying(
                    item,
                    artUrl,
                    localPoster: localPoster,
                  ),
                ),
                const SizedBox(width: AppSpacing.spaceXl),
                Expanded(
                  child: Column(
                    children: [
                      _buildTvViewTabs(),
                      const SizedBox(height: AppSpacing.spaceSm),
                      Expanded(
                        child: _tvPanelIsLyrics
                            ? _buildTvLyricsPanel()
                            : _buildQueueList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildProgressBar(),
        _buildTransportControls(),
        const SizedBox(height: AppSpacing.spaceLg),
      ],
    );
  }

  Widget _buildTvViewTabs() {
    final focused = _tvFocusArea == _TvAudioFocusArea.viewTabs;
    final showLyricsTab = _tvLyricsAvailable;

    Widget tab(String label, int index, bool active) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() {
        _tvViewTab = index;
        _tvFocusArea = _TvAudioFocusArea.viewTabs;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColorScheme.accent : Colors.transparent,
          borderRadius: AppRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active
                ? AppColorScheme.onAccent
                : AppColorScheme.onSurface.withValues(alpha: 0.8),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tvFocusShell(
          focused: focused,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColorScheme.onSurface.withValues(alpha: 0.08),
              borderRadius: AppRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                tab('Up Next', 0, _tvViewTab == 0 || !showLyricsTab),
                if (showLyricsTab) tab('Lyrics', 1, _tvViewTab == 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTvLyricsPanel() {
    final lyrics = _lyrics;
    if (lyrics == null || lyrics.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).lyricsNotAvailable,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      );
    }

    final inPanel = _tvFocusArea == _TvAudioFocusArea.panelBody;
    // When not actively cursoring, fall back to the auto-scrolling view so the
    // lyrics still follow playback.
    if (!inPanel) {
      return LyricsView(
        lyrics: lyrics,
        positionStream: _state.positionStream,
        position: _state.position,
        onSeekToLine: (d) => unawaited(_manager.seekTo(d)),
      );
    }

    final lines = lyrics.lines;
    return ListView.builder(
      controller: _tvLyricScrollController,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceLg),
      itemCount: lines.length,
      itemBuilder: (context, index) {
        final isCursor = index == _tvLyricCursor;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: isCursor
                ? AppColorScheme.accent.withValues(alpha: 0.22)
                : Colors.transparent,
            borderRadius: AppRadius.circular(10),
            border: isCursor
                ? Border.all(color: AppColorScheme.accent, width: 2)
                : null,
          ),
          child: Text(
            lines[index].text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isCursor
                  ? AppColorScheme.onSurface
                  : AppColorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: 18,
              fontWeight: isCursor ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressBar() {
    final pos = _state.position;
    final dur = _state.duration;
    final maxMs = dur.inMilliseconds.toDouble();
    final isTvFocused =
        _isWidePlayer &&
        !_showQueue &&
        _tvFocusArea == _TvAudioFocusArea.progress &&
        InputModeTracker.showFocusVisuals(context, true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceXl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: AppColorScheme.rangeProgress,
              inactiveTrackColor: AppColorScheme.rangeTrack,
              thumbColor: isTvFocused
                  ? Colors.white
                  : AppColorScheme.rangeThumb,
              overlayColor: AppColorScheme.rangeThumb.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: maxMs > 0
                  ? pos.inMilliseconds.toDouble().clamp(0, maxMs)
                  : 0,
              max: maxMs > 0 ? maxMs : 1,
              onChanged: (v) {
                _manager.seekTo(Duration(milliseconds: v.toInt()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(pos),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  _formatDuration(dur),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportControls() {
    final isPlaying = _state.isPlaying;
    final repeatMode = _queue.repeatMode;
    final isShuffled = _queue.isShuffled;

    Widget wrapTvTransport({
      required int index,
      required Widget child,
      BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    }) {
      final focused =
          _isWidePlayer &&
          !_showQueue &&
          _tvFocusArea == _TvAudioFocusArea.transport &&
          _tvTransportActionIndex == index;
      return _tvFocusShell(
        focused: focused,
        borderRadius: borderRadius,
        child: child,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          wrapTvTransport(
            index: 0,
            child: IconButton(
              icon: AdaptiveIcon(
                Icons.shuffle,
                size: 24,
                color: isShuffled
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
              onPressed: () => _manager.toggleShuffle(),
            ),
          ),
          wrapTvTransport(
            index: 1,
            child: IconButton(
              icon: AdaptiveIcon(
                Icons.skip_previous,
                size: 36,
                color: AppColorScheme.onSurface,
              ),
              onPressed: () => _manager.previous(),
            ),
          ),
          wrapTvTransport(
            index: 2,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.accent,
              ),
              child: IconButton(
                icon: AdaptiveIcon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: AppColorScheme.onSurface,
                ),
                onPressed: () {
                  if (isPlaying) {
                    _manager.pause();
                  } else {
                    _manager.resume();
                  }
                },
              ),
            ),
          ),
          wrapTvTransport(
            index: 3,
            child: IconButton(
              icon: AdaptiveIcon(
                Icons.skip_next,
                size: 36,
                color: AppColorScheme.onSurface,
              ),
              onPressed: () => _manager.next(),
            ),
          ),
          wrapTvTransport(
            index: 4,
            child: IconButton(
              icon: AdaptiveIcon(
                repeatMode == RepeatMode.repeatOne
                    ? Icons.repeat_one
                    : Icons.repeat,
                size: 24,
                color: repeatMode != RepeatMode.none
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
              onPressed: () => _manager.toggleRepeat(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueueList() {
    final items = _queue.items;
    final currentIdx = _queue.currentIndex;
    final isWide = _isWidePlayer;
    final keyboardFocus = InputModeTracker.showFocusVisuals(context, true);

    if (items.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).queueIsEmpty,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
          ),
        ),
      );
    }

    Widget buildTile(int index) {
      final raw = items[index];
      final item = raw is AggregatedItem ? raw : null;
      final isCurrent = index == currentIdx;
      final isDpadFocused =
          isWide && index == _tvQueueFocusIndex && keyboardFocus;
      final highlighted = isDpadFocused || index == _hoveredQueueIndex;
      final artUrl = item != null ? _getArtUrl(item) : null;

      return MouseRegion(
        key: ValueKey('queue-$index'),
        onEnter: (_) => setState(() => _hoveredQueueIndex = index),
        onExit: (_) {
          if (_hoveredQueueIndex == index) {
            setState(() => _hoveredQueueIndex = null);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: highlighted
                ? AppColorScheme.accent.withValues(alpha: 0.22)
                : Colors.transparent,
            borderRadius: AppRadius.circular(16),
            border: Border.all(
              color: highlighted ? AppColorScheme.accent : Colors.transparent,
              width: 2,
            ),
            boxShadow: isDpadFocused
                ? [
                    BoxShadow(
                      color: AppColorScheme.accent.withValues(alpha: 0.40),
                      blurRadius: 14,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(16)),
            leading: SizedBox(
              width: 48,
              height: 48,
              child: ClipRRect(
                borderRadius: AppRadius.circular(4),
                child: artUrl != null
                    ? OfflineAwareImage(
                        imageUrl: artUrl,
                        fit: BoxFit.cover,
                        placeholder: (_, _) => _queueArtPlaceholder(),
                        errorWidget: (_, _, _) => _queueArtPlaceholder(),
                      )
                    : _queueArtPlaceholder(),
              ),
            ),
            title: Text(
              item?.name ?? AppLocalizations.of(context).trackNumber(index + 1),
              style: TextStyle(
                color: isCurrent
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              _artistLine(item),
              style: TextStyle(
                fontSize: 12,
                color: AppColorScheme.onSurface.withValues(alpha: 0.5),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: isCurrent
                ? AdaptiveIcon(
                    Icons.equalizer,
                    color: AppColorScheme.accent,
                    size: 20,
                  )
                : null,
            onTap: () {
              if (isWide) {
                _setTvQueueFocusIndex(index);
              }
              _manager.playFromQueue(index);
            },
          ),
        ),
      );
    }

    if (isWide) {
      return ListView.builder(
        controller: _queueScrollController,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
        itemCount: items.length,
        itemBuilder: (context, index) => buildTile(index),
      );
    }

    // Mobile / desktop: drag to reorder the queue.
    return ReorderableListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      itemCount: items.length,
      onReorder: (oldIndex, newIndex) {
        setState(() => _queue.reorder(oldIndex, newIndex));
      },
      itemBuilder: (context, index) => buildTile(index),
    );
  }
}
