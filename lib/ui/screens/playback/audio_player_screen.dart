import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import '../../widgets/offline_aware_image.dart';
import 'package:flutter/material.dart' hide RepeatMode;
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/lyrics.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/cast/cast_target.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../util/audio_artwork_url.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/input_mode_tracker.dart';
import '../../../util/platform_detection.dart';
import '../../../util/playback_time_label.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/add_to_playlist_dialog.dart';
import '../../widgets/marquee_text.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/player_volume_control.dart';
import '../../widgets/remote_play_to_session_dialog.dart';
import '../../widgets/playback/audio_quality_badge.dart';
import '../../widgets/playback/lyrics_view.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';
import 'audiobook_player_view.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

enum _TvAudioFocusArea { panelBody, progress, dock }

enum _DockAction {
  favorite,
  addToPlaylist,
  shuffle,
  previous,
  playPause,
  next,
  repeat,
  lyrics,
  queue,
  cast,
}

const _transportActions = [
  _DockAction.shuffle,
  _DockAction.previous,
  _DockAction.playPause,
  _DockAction.next,
  _DockAction.repeat,
];

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  static const _tvSeekStepMs = 10000;

  final _manager = GetIt.instance<PlaybackManager>();
  final _castService = GetIt.instance<CastService>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _mutations = GetIt.instance<ItemMutationRepository>();
  final _prefs = GetIt.instance<UserPreferences>();
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
  _TvAudioFocusArea _tvFocusArea = _TvAudioFocusArea.dock;
  _DockAction _tvDockFocus = _DockAction.playPause;
  int _tvQueueFocusIndex = 0;
  int _tvLyricCursor = 0;
  bool _wideShowQueue = false;
  int? _hoveredQueueIndex;
  final _tvLyricScrollController = ScrollController();
  Timer? _sleepTimer;
  Timer? _persistVolumeTimer;
  double _playerVolume = 100.0;
  double _volumeBeforeMute = 100.0;
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
    _tvQueueFocusIndex = _queueCurrentRow;
    _subs.addAll([
      _manager.backendChangedStream.listen((_) {
        _applyPlayerVolume();
        _rebuild();
      }),
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
    unawaited(_activeMedia3Backend?.setVolume(100.0));
    if (PlatformDetection.isDesktop || PlatformDetection.isWeb) {
      _playerVolume = _prefs
          .get(UserPreferences.playerVolume)
          .clamp(0.0, 100.0)
          .toDouble();
      _volumeBeforeMute = _playerVolume > 0 ? _playerVolume : 100.0;
      _applyPlayerVolume();
    }
    if (_isWidePlayer) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _tvOverlayFocus.requestFocus();
      });
    }
    _loadLyricsIfNeeded();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  // Phone only. The wide layout switches its panel with _wideShowQueue.
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
  bool get _tvPanelIsLyrics => !_wideShowQueue && _tvLyricsAvailable;

  List<_DockAction> _dockActions(AggregatedItem? item) => [
    if (item != null) _DockAction.favorite,
    if (item != null && !_manager.isOfflinePlayback) _DockAction.addToPlaylist,
    ..._transportActions,
    // Without lyrics Up Next is the only panel, so there's nothing to toggle.
    if (_tvLyricsAvailable) ...[_DockAction.lyrics, _DockAction.queue],
    if (item != null && !PlatformDetection.isTV) _DockAction.cast,
  ];

  // Falls back to play/pause when the focused button goes away, for example
  // the lyrics toggle on a track without lyrics.
  _DockAction _dockFocusIn(List<_DockAction> actions) =>
      actions.contains(_tvDockFocus) ? _tvDockFocus : _DockAction.playPause;

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
    if (_tvFocusArea == _TvAudioFocusArea.progress) {
      _seekTvRelative(delta < 0 ? -_tvSeekStepMs : _tvSeekStepMs);
      return;
    }
    final actions = _dockActions(_resolveCurrentItem());
    final next = actions[(actions.indexOf(_dockFocusIn(actions)) + delta).clamp(
      0,
      actions.length - 1,
    )];
    if (next != _tvDockFocus) setState(() => _tvDockFocus = next);
  }

  void _moveTvVerticalFocus(int delta) {
    if (delta > 0) {
      if (_tvFocusArea == _TvAudioFocusArea.progress) {
        setState(() => _tvFocusArea = _TvAudioFocusArea.dock);
      }
    } else if (_tvFocusArea == _TvAudioFocusArea.dock) {
      setState(() => _tvFocusArea = _TvAudioFocusArea.progress);
    } else if (_tvFocusArea == _TvAudioFocusArea.progress) {
      _enterTvPanel();
    }
  }

  // Back pops this route before the focus tree sees the key, so the panel
  // claims it through the interceptor while it has focus.
  bool _exitTvPanelFromBack() {
    _exitTvPanel();
    return true;
  }

  void _exitTvPanel() {
    InlineBackInterceptor.remove(_exitTvPanelFromBack);
    setState(() => _tvFocusArea = _TvAudioFocusArea.progress);
  }

  void _enterTvPanel() {
    InlineBackInterceptor.push(_exitTvPanelFromBack);
    setState(() {
      _tvFocusArea = _TvAudioFocusArea.panelBody;
      if (_tvPanelIsLyrics) {
        _tvLyricCursor = _currentLyricLineIndex();
      } else {
        _tvQueueFocusIndex = _queueCurrentRow;
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

  void _activateDockAction(
    _DockAction action,
    AggregatedItem? item, {
    bool fromDpad = false,
  }) {
    switch (action) {
      case _DockAction.favorite:
        if (item != null) unawaited(_toggleFavorite(item));
      case _DockAction.addToPlaylist:
        if (item != null) {
          unawaited(
            AddToPlaylistDialog.show(
              context,
              itemIds: [item.id],
              serverId: item.serverId,
            ),
          );
        }
      case _DockAction.shuffle:
        _manager.toggleShuffle();
      case _DockAction.previous:
        unawaited(_manager.previous());
      case _DockAction.playPause:
        unawaited(_state.isPlaying ? _manager.pause() : _manager.resume());
      case _DockAction.next:
        unawaited(_manager.next());
      case _DockAction.repeat:
        _manager.toggleRepeat();
      // Selecting the toggle that is already showing moves D-pad focus into
      // its panel.
      case _DockAction.lyrics:
        if (fromDpad && _tvPanelIsLyrics) {
          _enterTvPanel();
        } else {
          setState(() => _wideShowQueue = false);
        }
      case _DockAction.queue:
        if (fromDpad && !_tvPanelIsLyrics) {
          _enterTvPanel();
        } else {
          setState(() => _wideShowQueue = _tvPanelIsLyrics);
        }
      case _DockAction.cast:
        if (item != null) _onCastPressed(item);
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

  // The whole queue stays listed, and it opens on the playing track.
  int get _queueCurrentRow =>
      math.max(0, math.min(_queue.currentIndex, _queue.items.length - 1));

  void _syncTvQueueFocusIndex() {
    if (!_isWidePlayer || _tvPanelIsLyrics) return;
    final count = _queue.items.length;
    if (count <= 0) {
      if (_tvQueueFocusIndex != 0) {
        setState(() => _tvQueueFocusIndex = 0);
      }
      return;
    }

    // Outside the panel the list follows playback to the new track.
    final target = _tvFocusArea == _TvAudioFocusArea.panelBody
        ? _tvQueueFocusIndex.clamp(0, count - 1)
        : _queueCurrentRow;
    if (target != _tvQueueFocusIndex) {
      setState(() => _tvQueueFocusIndex = target);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _scrollTvQueueIntoView(_tvQueueFocusIndex, animate: false);
    });
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
    // A two-line ListTile is 72 high, plus the tile's margin and border.
    final targetOffset = (index * 82.0).clamp(
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

  KeyEventResult _handleTvKeyEvent(FocusNode node, KeyEvent event) {
    if (!_isWidePlayer || !event.isActionable) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    // Back leaves the panel through _exitTvPanelFromBack, so only repeats are
    // swallowed here.
    if (key.isBackKey) {
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
          if (_tvLyricCursor >= (_lyrics?.lines.length ?? 0) - 1) {
            _exitTvPanel();
          } else {
            _setTvLyricCursor(_tvLyricCursor + 1);
          }
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
          if (_tvQueueFocusIndex >= _queue.items.length - 1) {
            _exitTvPanel();
          } else {
            _setTvQueueFocusIndex(_tvQueueFocusIndex + 1);
          }
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
        _exitTvPanel();
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
      if (_tvFocusArea == _TvAudioFocusArea.dock) {
        final item = _resolveCurrentItem();
        _activateDockAction(
          _dockFocusIn(_dockActions(item)),
          item,
          fromDpad: true,
        );
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
    const speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0];
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
        final detail = describeError(e, AppLocalizations.of(context));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not save playlist: $detail')));
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
    _persistVolumeTimer?.cancel();
    InlineBackInterceptor.remove(_exitTvPanelFromBack);
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

  String? _getArtUrl(AggregatedItem item, {int maxHeight = 600}) =>
      audioArtUrl(item, clientFactory: _clientFactory, maxHeight: maxHeight);

  @override
  Widget build(BuildContext context) {
    final item = _resolveCurrentItem();
    // Media3 audio plays on a player the native bridge owns, so car and lock
    // screen playback never wait on this screen mounting a view.
    final isAudiobookRoute = GoRouterState.of(context).uri.queryParameters['isAudiobook'] == 'true';
    final isAudiobook = (item != null && item.isAudiobook) || isAudiobookRoute;
    if (isAudiobook) {
      return const AudiobookPlayerView();
    }
    final localPoster = _offlinePosterPath();
    final size = MediaQuery.sizeOf(context);
    // Phones in landscape get the wide layout, without the D-pad handling.
    final wideLayout = _isWidePlayer || size.width > size.height;
    final mobilePanelOpen =
        !wideLayout && (_showQueue || (_showLyrics && _tvLyricsAvailable));
    // The phone hero fills the whole width, so it needs a larger image.
    final artUrl = item != null && !_manager.isOfflinePlayback
        ? _getArtUrl(item, maxHeight: wideLayout ? 600 : 1200)
        : null;

    final ImageProvider? ambientImage =
        (localPoster != null && File(localPoster).existsSync())
        ? FileImage(File(localPoster))
        : (artUrl != null ? offlineAwareImageProvider(artUrl) : null);

    final content = Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: AmbientBackground(
            image: ambientImage,
            // The phone hero bleeds under the status bar.
            child: SafeArea(
              top: wideLayout,
              child: wideLayout
                  ? _buildWideBody(item, artUrl, localPoster: localPoster)
                  : _buildMobileBody(item, artUrl, localPoster: localPoster),
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
      canPop: !mobilePanelOpen,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        setState(() {
          _showQueue = false;
          _showLyrics = false;
        });
      },
      child: Scaffold(
        backgroundColor: AppColorScheme.background,
        body: tvWrappedContent,
      ),
    );
  }

  /// Phone portrait: full-bleed art that fades into the ambient background,
  /// with the title row on top of the fade. Lyrics and Up Next replace the art.
  Widget _buildMobileBody(
    AggregatedItem? item,
    String? artUrl, {
    String? localPoster,
  }) {
    final topInset = MediaQuery.paddingOf(context).top;
    final Widget? panel = _showQueue
        ? _buildQueueList()
        : _showLyrics && _tvLyricsAvailable
        ? LyricsView(
            lyrics: _lyrics!,
            positionStream: _state.positionStream,
            position: _state.position,
            onSeekToLine: (d) => unawaited(_manager.seekTo(d)),
          )
        : null;

    return Column(
      children: [
        Expanded(
          child: panel != null
              ? Padding(
                  padding: EdgeInsets.only(top: topInset),
                  child: Column(
                    children: [
                      _buildMobileTopBar(item),
                      Expanded(child: panel),
                    ],
                  ),
                )
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) => const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.62, 1.0],
                      ).createShader(rect),
                      blendMode: BlendMode.dstIn,
                      child: _artImage(artUrl, localPoster),
                    ),
                    Positioned(
                      top: topInset,
                      left: 0,
                      right: 0,
                      child: _buildMobileTopBar(item),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _buildMobileMeta(item),
                    ),
                  ],
                ),
        ),
        _buildProgressBar(),
        _buildTransportControls(item),
        _buildMobileActions(item),
        const SizedBox(height: AppSpacing.spaceLg),
      ],
    );
  }

  Widget _buildMobileTopBar(AggregatedItem? item) {
    Widget scrimmed(Widget child) => DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withValues(alpha: 0.28),
      ),
      child: child,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceSm,
        vertical: AppSpacing.spaceXs,
      ),
      child: Row(
        children: [
          scrimmed(
            IconButton(
              icon: const AdaptiveIcon(Icons.keyboard_arrow_down, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Expanded(
            child: Center(
              child: item != null
                  ? AudioQualityBadge(item: item)
                  : const SizedBox.shrink(),
            ),
          ),
          if (item != null)
            scrimmed(
              IconButton(
                icon: const AdaptiveIcon(Icons.more_vert, size: 24),
                onPressed: () => _showOverflowSheet(item),
              ),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildMobileMeta(AggregatedItem? item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceXl,
        0,
        AppSpacing.spaceLg,
        0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _buildTitleBlock(item, titleSize: 28)),
          if (item != null)
            _dockButton(_DockAction.favorite, item, mobile: true),
        ],
      ),
    );
  }

  Widget _buildTitleBlock(AggregatedItem? item, {double titleSize = 32}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarqueeText(
          text: item?.name ?? '',
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
            color: AppColorScheme.onSurface,
          ),
        ),
        Text(
          _artistLine(item),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColorScheme.accent,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (item?.album != null)
          MarqueeText(
            text: item!.album!,
            style: TextStyle(
              fontSize: 16,
              color: AppColorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileActions(AggregatedItem? item) {
    final l10n = AppLocalizations.of(context);

    Widget action(
      IconData icon,
      String label,
      VoidCallback onTap, {
      bool on = false,
    }) => Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceXs),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: on
                      ? AppColorScheme.accent.withValues(alpha: 0.22)
                      : AppColorScheme.onSurface.withValues(alpha: 0.09),
                ),
                child: Center(
                  child: AdaptiveIcon(
                    icon,
                    size: 22,
                    color: on
                        ? AppColorScheme.accent
                        : AppColorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.spaceMd,
        AppSpacing.spaceMd,
        AppSpacing.spaceMd,
        0,
      ),
      child: Row(
        children: [
          if (_tvLyricsAvailable)
            action(
              Icons.lyrics_outlined,
              l10n.audiobookLyrics,
              () => setState(() {
                _showLyrics = !_showLyrics;
                if (_showLyrics) _showQueue = false;
              }),
              on: _showLyrics,
            ),
          action(
            Icons.queue_music,
            l10n.upNext,
            _toggleQueuePanel,
            on: _showQueue,
          ),
          if (item != null && !_manager.isOfflinePlayback)
            action(
              Icons.playlist_add,
              l10n.addToPlaylist,
              () => _activateDockAction(_DockAction.addToPlaylist, item),
            ),
          if (item != null)
            ValueListenableBuilder<CastTargetKind?>(
              valueListenable: _castService.activeKindNotifier,
              builder: (context, kind, _) => action(
                _castIcon(kind),
                l10n.cast,
                () => _onCastPressed(item),
                on: kind != null,
              ),
            ),
        ],
      ),
    );
  }

  /// Desktop, TV and phone landscape: art and metadata on the left, lyrics
  /// (or Up Next) filling the right, and every control in one dock row so the
  /// D-pad only needs left/right.
  Widget _buildWideBody(
    AggregatedItem? item,
    String? artUrl, {
    String? localPoster,
  }) {
    final isTv = PlatformDetection.isTV;
    final actions = _dockActions(item);
    final focus = _dockFocusIn(actions);
    List<Widget> slots(List<_DockAction> group) => [
      for (final action in group)
        if (actions.contains(action)) _dockSlot(action, item, focus),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.spaceLg,
            AppSpacing.spaceSm,
            AppSpacing.spaceLg,
            0,
          ),
          child: SizedBox(
            height: 48,
            child: Row(
              children: [
                if (!isTv)
                  IconButton(
                    icon: const AdaptiveIcon(Icons.arrow_back, size: 24),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                const Spacer(),
                if (item != null) AudioQualityBadge(item: item),
                if (!_isWidePlayer && item != null)
                  IconButton(
                    icon: const AdaptiveIcon(Icons.more_vert, size: 24),
                    onPressed: () => _showOverflowSheet(item),
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space2xl,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Leaves room for the three text lines under the art.
                final artSize = math
                    .min(
                      constraints.maxHeight - 112,
                      constraints.maxWidth * 0.32,
                    )
                    .clamp(72.0, 420.0);
                return Row(
                  children: [
                    SizedBox(
                      width: artSize,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: artSize,
                            height: artSize,
                            decoration: BoxDecoration(
                              borderRadius: AppRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.black,
                                  blurRadius: 30,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: _artImage(artUrl, localPoster),
                          ),
                          const SizedBox(height: 14),
                          _buildTitleBlock(item),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: _tvPanelIsLyrics
                          ? _buildTvLyricsPanel()
                          : _buildQueueList(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.spaceSm,
            0,
            AppSpacing.spaceSm,
            AppSpacing.spaceMd,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProgressBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.spaceLg,
                ),
                child: Row(
                  children: [
                    // In a narrow window the side groups shrink to fit
                    // instead of overflowing the dock.
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: slots([
                              _DockAction.favorite,
                              _DockAction.addToPlaylist,
                            ]),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: AppSpacing.spaceMd,
                      children: slots(_transportActions),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              ...slots([
                                _DockAction.lyrics,
                                _DockAction.queue,
                                _DockAction.cast,
                              ]),
                              if (_isWidePlayer && !isTv)
                                PlayerVolumeControl(
                                  volume: _playerVolume / 100.0,
                                  onChanged: (v) =>
                                      _setPlayerVolume(v * 100.0),
                                  onToggleMute: () => _setPlayerVolume(
                                    _playerVolume > 0
                                        ? 0.0
                                        : _volumeBeforeMute,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _artImage(String? artUrl, String? localPoster) {
    if (localPoster != null && File(localPoster).existsSync()) {
      return Image.file(
        File(localPoster),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _artPlaceholder(),
      );
    }
    if (artUrl != null) {
      return OfflineAwareImage(
        imageUrl: artUrl,
        fit: BoxFit.cover,
        placeholder: (_, _) => _artPlaceholder(),
        errorWidget: (_, _, _) => _artPlaceholder(),
      );
    }
    return _artPlaceholder();
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

  void _onCastPressed(AggregatedItem item) {
    if (_castService.activeKind != null) {
      _showCastControls();
    } else {
      unawaited(_castToDevice(item));
    }
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
    await pauseLocalPlaybackForCastHandoff();
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
        SnackBar(content: Text(l10n.castActionFailed(label, describeError(e, l10n)))),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.failedToSetCastVolume(describeError(e, l10n))),
        ),
      );
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
                            ' · ${formatPlaybackDuration(Duration(microseconds: ticks ~/ 10))}',
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

  void _applyPlayerVolume() {
    if (!PlatformDetection.isDesktop && !PlatformDetection.isWeb) return;
    unawaited(_manager.backend?.setVolume(_playerVolume));
  }

  void _setPlayerVolume(double volume) {
    final clamped = volume.clamp(0.0, 100.0).toDouble();
    if (clamped > 0) _volumeBeforeMute = clamped;
    setState(() => _playerVolume = clamped);
    _applyPlayerVolume();
    _persistVolumeTimer?.cancel();
    _persistVolumeTimer = Timer(const Duration(milliseconds: 400), () {
      unawaited(_prefs.set(UserPreferences.playerVolume, _playerVolume));
    });
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
        textAlign: TextAlign.start,
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
            textAlign: TextAlign.start,
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
                  formatPlaybackDuration(pos),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  formatPlaybackTrailingTime(
                    context,
                    position: pos,
                    duration: dur,
                    mode: _prefs.get(UserPreferences.musicPlaybackTimeDisplay),
                    use24Hour: _prefs.get(UserPreferences.use24HourClock),
                    playbackSpeed: _state.playbackSpeed,
                  ),
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

  Widget _buildTransportControls(AggregatedItem? item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final action in _transportActions)
            _dockButton(action, item, mobile: true),
        ],
      ),
    );
  }

  Widget _dockSlot(
    _DockAction action,
    AggregatedItem? item,
    _DockAction focus,
  ) {
    return _tvFocusShell(
      focused: _tvFocusArea == _TvAudioFocusArea.dock && focus == action,
      borderRadius: BorderRadius.all(
        Radius.circular(action == _DockAction.playPause ? 30 : 24),
      ),
      child: _dockButton(action, item),
    );
  }

  Widget _dockButton(
    _DockAction action,
    AggregatedItem? item, {
    bool mobile = false,
  }) {
    final l10n = AppLocalizations.of(context);
    final accent = AppColorScheme.accent;
    final dim = AppColorScheme.onSurface.withValues(alpha: 0.7);

    Widget button(
      IconData icon, {
      Color? color,
      double size = 24,
      String? tooltip,
      bool on = false,
    }) => IconButton(
      tooltip: tooltip,
      style: on
          ? IconButton.styleFrom(
              backgroundColor: accent.withValues(alpha: 0.18),
            )
          : null,
      icon: AdaptiveIcon(
        icon,
        size: size,
        color: on ? accent : color ?? AppColorScheme.onSurface,
      ),
      onPressed: () => _activateDockAction(action, item),
    );

    final isFav = item != null && _getIsFavorite(item);
    final repeatMode = _queue.repeatMode;
    final playSize = mobile ? 68.0 : 52.0;

    return switch (action) {
      _DockAction.favorite => button(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: isFav ? accent : dim,
        size: mobile ? 30 : 24,
        tooltip: l10n.favorite,
      ),
      _DockAction.addToPlaylist => button(
        Icons.playlist_add,
        tooltip: l10n.addToPlaylist,
      ),
      _DockAction.shuffle => button(
        Icons.shuffle,
        color: _queue.isShuffled ? accent : dim,
      ),
      _DockAction.previous => button(Icons.skip_previous, size: 36),
      _DockAction.playPause => Container(
        width: playSize,
        height: playSize,
        decoration: BoxDecoration(shape: BoxShape.circle, color: accent),
        child: button(
          _state.isPlaying ? Icons.pause : Icons.play_arrow,
          size: playSize * 0.62,
        ),
      ),
      _DockAction.next => button(Icons.skip_next, size: 36),
      _DockAction.repeat => button(
        repeatMode == RepeatMode.repeatOne ? Icons.repeat_one : Icons.repeat,
        color: repeatMode != RepeatMode.none ? accent : dim,
      ),
      _DockAction.lyrics => button(
        Icons.lyrics_outlined,
        color: dim,
        tooltip: l10n.audiobookLyrics,
        on: _tvPanelIsLyrics,
      ),
      _DockAction.queue => button(
        Icons.queue_music,
        color: dim,
        tooltip: l10n.upNext,
        on: !_tvPanelIsLyrics,
      ),
      _DockAction.cast => ValueListenableBuilder<CastTargetKind?>(
        valueListenable: _castService.activeKindNotifier,
        builder: (context, kind, _) => button(
          _castIcon(kind),
          color: kind != null ? accent : dim,
          tooltip: l10n.cast,
        ),
      ),
    };
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

    // A list that's about to appear opens on the playing track.
    if (!_queueScrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _scrollTvQueueIntoView(_queueCurrentRow, animate: false);
      });
    }

    Widget buildTile(int index) {
      final raw = items[index];
      final item = raw is AggregatedItem ? raw : null;
      final isCurrent = index == currentIdx;
      final isDpadFocused =
          isWide &&
          _tvFocusArea == _TvAudioFocusArea.panelBody &&
          index == _tvQueueFocusIndex &&
          keyboardFocus;
      final highlighted = isDpadFocused || index == _hoveredQueueIndex;
      final title =
          item?.name ?? AppLocalizations.of(context).trackNumber(index + 1);
      final titleStyle = TextStyle(
        fontSize: 18,
        color: isCurrent ? AppColorScheme.accent : AppColorScheme.onSurface,
        fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
      );
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
              width: 56,
              height: 56,
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
            // The focused or hovered row scrolls a name too long to fit.
            title: highlighted
                ? MarqueeText(text: title, style: titleStyle)
                : Text(
                    title,
                    style: titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            subtitle: Text(
              _artistLine(item),
              style: TextStyle(
                fontSize: 14,
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
      scrollController: _queueScrollController,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      itemCount: items.length,
      onReorder: (oldIndex, newIndex) {
        setState(() => _queue.reorder(oldIndex, newIndex));
      },
      itemBuilder: (context, index) => buildTile(index),
    );
  }
}
