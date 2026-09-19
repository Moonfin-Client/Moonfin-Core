import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';
import '../../../util/platform_detection.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/horizontal_scroll_section.dart';
import '../../widgets/live_tv/live_tv_mini_player.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/key_event_utils.dart';
import '../../../preference/user_preferences.dart';
import '../../../preference/preference_constants.dart';
import '../../../util/clock_format.dart';
import 'epg/epg_genre.dart';
import 'epg/widgets/epg_channel_cell.dart';
import 'epg/widgets/epg_filter_rail.dart';
import 'epg/widgets/epg_hero_preview.dart';
import 'epg/widgets/epg_now_next_card.dart';
import 'epg/widgets/epg_program_cell.dart';
import 'guide/guide_cell.dart';
import 'guide/guide_layout_profile.dart';
import 'guide/guide_selection.dart';
import 'guide/guide_window.dart';

// Start fetching the next batch of channel programs this many rows before the
// lazily-loaded edge, so rows are usually populated by the time they're visible.
const _kProgramPrefetchRows = 12;
const _kGuideScrollLead = 24.0;
const _kGuideLogoPrecacheRows = 24;
// Extra rows of slack above/below the viewport carried into the artwork
// prefetch window, so a small scroll doesn't immediately fall outside it.
const _kArtworkPrefetchRowMargin = 5;

/// How far back the guide will page. Most EPG sources keep little history,
/// so beyond this the grid would only ever show empty cells.
const _kMaxGuideHistory = Duration(hours: 24);

const _kMiniPlayerWidth = 300.0;
const _kMiniPlayerHeight = 168.0;
// A re-anchor waits this long after the last d-pad event, so the window
// never moves under an in-progress navigation.
const _kReanchorInputQuiet = Duration(seconds: 1);

/// The transport keys a TV remote offers for paging; `lib/util/focus/` has no
/// shared helper for them.
final Set<LogicalKeyboardKey> _kPageForwardKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.mediaFastForward,
  LogicalKeyboardKey.mediaTrackNext,
  LogicalKeyboardKey.pageDown,
};

final Set<LogicalKeyboardKey> _kPageBackKeys = <LogicalKeyboardKey>{
  LogicalKeyboardKey.mediaRewind,
  LogicalKeyboardKey.mediaTrackPrevious,
  LogicalKeyboardKey.pageUp,
};

/// Indices of the controls row's buttons, left to right. LEFT/RIGHT walk this
/// range, so a button added to the row must take the next index in order.
const int _kWindowBarPrevious = 0;
const int _kWindowBarNow = 1;
const int _kWindowBarNext = 2;
const int _kWindowBarSort = 3;
const int _kWindowBarDate = 4;
const int _kWindowBarRecordings = 5;
const int _kWindowBarLast = _kWindowBarRecordings;

/// 1 pages a viewport of rows forward, -1 back, 0 when the key doesn't page.
int _pageRowDirection(LogicalKeyboardKey key) {
  if (_kPageForwardKeys.contains(key)) return 1;
  if (_kPageBackKeys.contains(key)) return -1;
  return 0;
}

/// Handed to an embedded [LiveTvGuideScreen] so its host's [PopScope] can
/// offer it a back press before closing the guide outright.
class LiveTvGuideBackController {
  bool Function()? _onBackPressed;

  /// True when the guide consumed the press (it reset itself); false when
  /// the host should proceed with its own close/exit handling.
  bool consumeBackPress() => _onBackPressed?.call() ?? false;
}

class LiveTvGuideScreen extends StatefulWidget {
  final bool miniPlayerMode;
  final GuideChannel? currentChannel;
  final ValueListenable<int?>? appleTvTextureId;

  /// When true the guide is embedded inside another screen's widget tree (the
  /// in-player Live TV overlay in this case) rather than pushed as its own route.
  /// In this mode the [Scaffold]/[SafeArea] chrome is dropped, the mini-player
  /// frame is transparent (the host draws the real video behind it), and channel
  /// selection / close are reported via [onChannelSelected] / [onClose] instead
  /// of [Navigator] pops.
  final bool embedded;

  /// Called with the selected channel id instead of `Navigator.pop(channelId)`
  /// when [embedded]. Required for the in-player overlay; null on the standalone
  /// route (where the pop result is used).
  final ValueChanged<String>? onChannelSelected;

  /// Called when the user dismisses the embedded guide (activates the
  /// mini-player frame) instead of `Navigator.pop()`.
  final VoidCallback? onClose;

  /// Lets an [embedded] host, which owns the only [PopScope] in its route,
  /// give this screen first refusal on a back press so it can reset to its
  /// entry state instead of always closing. Unused on the standalone route,
  /// which handles this itself.
  final LiveTvGuideBackController? backController;

  const LiveTvGuideScreen({
    super.key,
    this.miniPlayerMode = false,
    this.currentChannel,
    this.appleTvTextureId,
    this.embedded = false,
    this.onChannelSelected,
    this.onClose,
    this.backController,
  });

  /// Geometry of the mini-player video box in [embedded] mode, in the host
  /// overlay's coordinate space. Single source of truth shared with the host
  /// player so the real video surface it draws lines up with this frame:
  /// content padding (top [_contentTopInset]=20 / left [_contentLeftInset]=24)
  /// plus the program-info header container padding (top 12 / left 16).
  static const double miniPlayerVideoLeft = 24 + 16;
  static const double miniPlayerVideoTop = 20 + 12;
  static const double miniPlayerVideoWidth = _kMiniPlayerWidth;
  static const double miniPlayerVideoHeight = _kMiniPlayerHeight;

  @override
  State<LiveTvGuideScreen> createState() => _LiveTvGuideScreenState();
}

/// A vertical move that couldn't be resolved when the key was pressed. At
/// most one is held. It is superseded by the next navigation key and cancelled
/// outright by anything that invalidates the destination.
class _PendingVerticalMove {
  final int targetRowIndex;
  final DateTime anchorTime;

  const _PendingVerticalMove({
    required this.targetRowIndex,
    required this.anchorTime,
  });
}

class _LiveTvGuideScreenState extends State<LiveTvGuideScreen>
    with WidgetsBindingObserver {
  late final LiveTvGuideViewModel _vm;
  final _client = GetIt.instance<MediaServerClient>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _channelScrollController = ScrollController();
  final _programScrollController = ScrollController();
  final _timeHeaderHorizontalScrollController = ScrollController();
  final _guideHorizontalScrollController = ScrollController();
  final _miniPlayerFocusNode = FocusNode(debugLabel: 'GuideMiniPlayer');
  final Map<int, FocusNode> _channelFocusNodes = {};
  final Map<int, FocusNode> _filterFocusNodes = {};
  final Map<int, FocusNode> _windowBarFocusNodes = {};

  /// Where the controls row was left, so returning to it from either
  /// direction lands where the user last was.
  int _lastWindowBarIndex = _kWindowBarPrevious;

  bool _syncingScroll = false;
  bool _syncingHorizontalScroll = false;
  bool _isShowingDatePicker = false;
  bool _isOpeningRecordings = false;
  int? _lastFocusedRowIndex;
  final ValueNotifier<GuideProgram?> _focusedProgram = ValueNotifier(null);
  final ValueNotifier<GuideChannel?> _focusedChannel = ValueNotifier(null);
  final ValueNotifier<bool> _channelRailFocused = ValueNotifier(false);

  /// Debounces the hero's per-program artwork lookup (see
  /// [LiveTvGuideViewModel.artworkSourceFor]) so scrolling through the
  /// channel column doesn't fire a request per row passed through.
  Timer? _artworkLookupDebounce;

  /// Debounces re-submitting the bounded artwork prefetch window on scroll, so
  /// a fling doesn't resubmit on every frame.
  Timer? _artworkPrefetchScrollDebounce;
  bool _didInitializeMiniPlayerMode = false;
  bool _didRestoreInitialChannelFocus = false;

  late EpgMobileView _mobileView;
  GuideLayoutProfile _layoutProfile = GuideLayoutProfile.fromAvailableArea(
    availableWidth: 960,
    availableHeight: 540,
  );
  Duration? _pendingGuideWindow;

  /// Whether the current layout actually renders the hero band, the only
  /// widget that consumes per-program artwork.
  bool _heroVisible = false;

  /// The grid's selection model. Vertical navigation resolves against its
  /// anchor time instead of focus geometry. Seeded on the first cell focus.
  GuideSelection? _selection;

  /// The single deferred vertical move, or null when nothing is pending.
  _PendingVerticalMove? _pendingVerticalMove;

  /// One-shot timer to the next half hour. Rescheduled when it fires.
  Timer? _reanchorTimer;
  Timer? _displayClockTimer;

  /// When the last d-pad event arrived, or null before the first one.
  DateTime? _lastDpadEventAt;

  /// Mounted program rows by row index, so the screen can focus a cell in a
  /// row whose focus nodes are private to that row's state.
  final Map<int, _GuideProgramRowState> _rowStates = {};
  List<String> _visibleChannelIds = const [];
  final Set<String> _precachedGuideLogoUrls = <String>{};

  bool get _apple => AppUiIdiomResolver.isApple;

  // Standalone landscape guides can reclaim the route's top breathing room.
  // Mobile and embedded guides keep their existing inset.
  double _contentTopInset({bool landscape = false}) =>
      landscape && !widget.miniPlayerMode ? 8.0 : 20.0;

  double _contentLeftInset() => 24.0;

  @override
  void initState() {
    super.initState();
    _vm = LiveTvGuideViewModel(
      GetIt.instance<MediaServerClient>(),
      initialSortBy: _prefs.get(UserPreferences.liveTvChannelSortBy),
    );
    _vm.addListener(_onChanged);
    widget.backController?._onBackPressed = _consumeBackIfExploring;
    WidgetsBinding.instance.addObserver(this);
    _mobileView = _prefs.get(UserPreferences.epgMobileView);
    _focusedProgram.addListener(_scheduleArtworkLookup);
    _focusedChannel.addListener(_scheduleArtworkLookup);
    _channelRailFocused.addListener(_scheduleArtworkLookup);

    _channelScrollController.addListener(_syncVerticalScroll);
    _programScrollController.addListener(_syncVerticalScroll);
    _timeHeaderHorizontalScrollController.addListener(
      _syncHorizontalFromHeader,
    );
    _guideHorizontalScrollController.addListener(_syncHorizontalFromGuide);
    _scheduleReanchor();
    _displayClockTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (mounted) setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final mediaQuery = MediaQuery.of(context);
      final landscape = _isLandscapeSize(mediaQuery.size);
      final topInset = _contentTopInset(landscape: landscape);
      final width =
          mediaQuery.size.width - _contentLeftInset() - (landscape ? 24 : 16);
      final profile = GuideLayoutProfile.fromAvailableArea(
        availableWidth: width,
        availableHeight: mediaQuery.size.height - topInset - 16,
        textScaleFactor: mediaQuery.textScaler.scale(1),
      );
      _layoutProfile = profile;
      unawaited(
        _vm.load(
          window: profile.guideWindow,
          windowStart: guideLeftEdge(DateTime.now()),
          livePosition: true,
        ),
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final now = DateTime.now();
    _scheduleReanchor();
    unawaited(_resumeGuide(now));
  }

  Future<void> _resumeGuide(DateTime now) async {
    await _vm.reloadIfStale(
      window: _layoutProfile.guideWindow,
      windowStart: guideLeftEdge(now),
    );
    if (!mounted) return;
    _vm.scheduleBoundaryRefresh();
    await _vm.refreshAtQuarterHour();
  }

  void _syncVerticalScroll() {
    _scheduleArtworkPrefetch();
    if (_syncingScroll) return;
    if (!_channelScrollController.hasClients ||
        !_programScrollController.hasClients) {
      return;
    }

    _syncingScroll = true;
    try {
      final source = _channelScrollController.position.isScrollingNotifier.value
          ? _channelScrollController
          : _programScrollController;
      final target = source == _channelScrollController
          ? _programScrollController
          : _channelScrollController;
      if (target.hasClients) {
        target.jumpTo(source.offset);
      }
    } catch (_) {}
    _syncingScroll = false;
  }

  void _syncHorizontalFromHeader() {
    _syncHorizontalScroll(
      _timeHeaderHorizontalScrollController,
      _guideHorizontalScrollController,
    );
  }

  void _syncHorizontalFromGuide() {
    _syncHorizontalScroll(
      _guideHorizontalScrollController,
      _timeHeaderHorizontalScrollController,
    );
  }

  void _syncHorizontalScroll(ScrollController source, ScrollController target) {
    if (_syncingHorizontalScroll) return;
    if (!source.hasClients || !target.hasClients) return;

    _syncingHorizontalScroll = true;
    try {
      final targetOffset = source.offset.clamp(
        0.0,
        target.position.maxScrollExtent,
      );
      if ((target.offset - targetOffset).abs() > 0.5) {
        target.jumpTo(targetOffset);
      }
    } catch (_) {}
    _syncingHorizontalScroll = false;
  }

  void _onChanged() {
    if (!mounted) return;
    if (_vm.state == GuideState.ready) _vm.scheduleBoundaryRefresh();
    final channelIds = _vm.filteredChannels
        .map((channel) => channel.id)
        .toList();
    _precacheGuideLogos(_vm.filteredChannels);
    // The whole lineup is submitted on ordinary lineups; only large ones
    // are bounded to the rows around the current viewport.
    _queueArtworkPrefetch();
    final lineupChanged = !listEquals(channelIds, _visibleChannelIds);
    _visibleChannelIds = channelIds;
    setState(_initializeMiniPlayerMode);
    if (lineupChanged) {
      _refreshFocusedChannelAfterLineupChange();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _rebindSelectionAfterLineupChange();
      });
    }
    _scheduleInitialChannelFocus();
    if (_pendingVerticalMove == null) return;
    // The target row can only be focused once the notification's rebuild has
    // mounted it, so resolve the intent after this frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _applyPendingVerticalMove();
    });
  }

  void _precacheGuideLogos(Iterable<GuideChannel> channels) {
    if (!mounted) return;
    if (_precachedGuideLogoUrls.length > 512) {
      _precachedGuideLogoUrls.clear();
    }
    for (final channel in channels.take(_kGuideLogoPrecacheRows)) {
      final tag = channel.imageTag;
      if (tag == null) continue;
      final url = _vm.imageApi.getPrimaryImageUrl(
        channel.id,
        maxHeight: _layoutProfile.rowHeight.toInt(),
        tag: tag,
      );
      if (url.isEmpty || !_precachedGuideLogoUrls.add(url)) continue;
      unawaited(
        BoundedNetworkImage.precache(
          context,
          url,
          layoutWidth: 34,
          maxWidth: 128,
        ).catchError((_) {
          _precachedGuideLogoUrls.remove(url);
        }),
      );
    }
  }

  void _scheduleArtworkPrefetch() {
    _artworkPrefetchScrollDebounce?.cancel();
    if (!_heroVisible) return;
    _artworkPrefetchScrollDebounce = Timer(
      const Duration(milliseconds: 250),
      () {
        if (mounted) _queueArtworkPrefetch();
      },
    );
  }

  /// Submits artwork prefetch for the channel rows near the current viewport,
  /// plus [_kArtworkPrefetchRowMargin] rows of slack above and below. Falls
  /// back to the first screenful of channels before the scroll controller has
  /// attached. Every submission replaces the pending queue, so a filter change
  /// can't leave requests for channels that are no longer shown ahead of the
  /// new work.
  ///
  /// The bound applies to every lineup, not just large ones. Submitting a
  /// whole lineup queued a request per program, which is the same load issue
  /// #666 was about spread across many small requests, and a submission
  /// bigger than the view model's artwork cache made each pass evict entries
  /// the next pass then re-fetched. Since [_onChanged] resubmits on every
  /// notification and each resolved fetch notifies, that fed itself. A
  /// viewport-sized submission stays well under the cache cap, so once its
  /// rows resolve a resubmission does nothing.
  void _queueArtworkPrefetch() {
    // The hero band is the only consumer of per-program artwork.
    if (!_heroVisible) return;
    final channels = _vm.filteredChannels;
    if (channels.isEmpty) {
      // A filter matching nothing must still drop work queued for the
      // lineup it replaced.
      _vm.queueArtworkPrefetch(const [], replace: true);
      return;
    }

    final rowHeight = _layoutProfile.rowHeight;

    var firstRow = 0;
    var visibleCount = _kGuideLogoPrecacheRows;
    if (_channelScrollController.hasClients) {
      final offset = _channelScrollController.offset;
      final viewport = _channelScrollController.position.viewportDimension;
      firstRow = (offset / rowHeight).floor();
      visibleCount = (viewport / rowHeight).ceil();
    }

    final start = (firstRow - _kArtworkPrefetchRowMargin).clamp(
      0,
      channels.length,
    );
    final end = (firstRow + visibleCount + _kArtworkPrefetchRowMargin).clamp(
      0,
      channels.length,
    );
    if (start >= end) return;

    _vm.queueArtworkPrefetch([
      for (final channel in channels.sublist(start, end))
        ..._vm.programsForChannel(channel.id),
    ], replace: true);
  }

  /// True unless focus is sitting on one of this screen's non-grid controls.
  /// A genre filter switch changes the lineup and would otherwise yank focus
  /// back into the grid while the user is still on a filter chip or the
  /// window bar.
  bool get _gridHasFocus {
    final focus = FocusManager.instance.primaryFocus;
    if (focus == null) return false;
    return !_filterFocusNodes.containsValue(focus) &&
        !_windowBarFocusNodes.containsValue(focus) &&
        focus != _miniPlayerFocusNode;
  }

  /// A channel row's FocusNode is cached by row index, so a filter that swaps
  /// which channel sits in a focused row fires no focus change and leaves the
  /// tracked channel naming the old one. Re-derive it from whichever row's
  /// node actually holds focus; this only updates tracked state, never real
  /// focus, so it stays safe to call while the guide is covered.
  void _refreshFocusedChannelAfterLineupChange() {
    final channels = _vm.filteredChannels;
    for (final entry in _channelFocusNodes.entries) {
      if (!entry.value.hasFocus) continue;
      final index = entry.key;
      if (index >= channels.length) return;
      final channel = channels[index];
      if (_focusedChannel.value?.id == channel.id) return;
      _channelRailFocused.value = true;
      _focusedProgram.value = null;
      _focusedChannel.value = channel;
      return;
    }
  }

  void _rebindSelectionAfterLineupChange() {
    final selection = _selection;
    final channels = _vm.filteredChannels;
    if (selection == null || channels.isEmpty) return;

    var rowIndex = channels.indexWhere(
      (channel) => channel.id == selection.channelId,
    );
    if (rowIndex < 0) {
      rowIndex = (_lastFocusedRowIndex ?? 0).clamp(0, channels.length - 1);
      final channelId = channels[rowIndex].id;
      final cells = _cellsForChannel(channelId);
      if (cells.isEmpty) return;
      final cell = cells[resolveCellIndexAt(cells, selection.anchorTime)];
      _selection = GuideSelection(
        channelId: channelId,
        anchorTime: clampAnchorInto(cell, selection.anchorTime),
        programId: cell.program?.id,
      );
    }
    final rebound = _selection!;
    final cells = _cellsForChannel(rebound.channelId);
    if (cells.isEmpty) return;
    _scrollToRow(rowIndex);
    // Keep the selection and scroll position correct either way, so the
    // grid is ready if the user comes back to it — just don't steal focus
    // away from wherever they actually are (a filter chip, the window bar).
    if (_gridHasFocus) _focusSelectedCell(rebound, cells);
  }

  void _initializeMiniPlayerMode() {
    if (!widget.miniPlayerMode ||
        _didInitializeMiniPlayerMode ||
        _vm.state != GuideState.ready) {
      return;
    }

    final channels = _vm.filteredChannels;
    if (channels.isEmpty) return;

    var initialIndex = 0;
    final currentChannelId = widget.currentChannel?.id;
    if (currentChannelId != null) {
      final matchedIndex = channels.indexWhere(
        (channel) => channel.id == currentChannelId,
      );
      if (matchedIndex >= 0) {
        initialIndex = matchedIndex;
      }
    }

    _didInitializeMiniPlayerMode = true;
    final channel = channels[initialIndex];
    _focusedChannel.value = channel;
    _focusedProgram.value = _currentProgramForChannel(channel.id);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusChannelRow(initialIndex, animate: false);
    });
  }

  void _scheduleInitialChannelFocus() {
    if (widget.miniPlayerMode ||
        _didRestoreInitialChannelFocus ||
        _vm.state != GuideState.ready ||
        _vm.filteredChannels.isEmpty) {
      return;
    }

    final preferredId = _prefs.get(UserPreferences.liveTvLastChannelId).trim();
    final preferredIndex = _vm.filteredChannels.indexWhere(
      (channel) => channel.id == preferredId,
    );
    final index = preferredIndex >= 0 ? preferredIndex : 0;
    _didRestoreInitialChannelFocus = true;

    // RequestInitialFocus also schedules a post-frame focus. Defer one extra
    // frame so the restored row wins that initial traversal race.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _focusChannelRow(index, animate: false);
      });
    });
  }

  /// [animate] is false for jumps that reposition the whole grid to a
  /// channel that may be nowhere near the current viewport -- entering the
  /// guide, or the back-to-entry reset -- where animating the tween across a
  /// long lineup is pure wasted paint on slower hardware. Ordinary vertical
  /// navigation keeps the animated version so a one-row move still reads as
  /// a scroll.
  void _scrollToRow(int index, {bool animate = true}) {
    final offset = index * _layoutProfile.rowHeight;
    final targetRow = index;
    if (_lastFocusedRowIndex == targetRow) {
      return;
    }
    _lastFocusedRowIndex = targetRow;
    if (_channelScrollController.hasClients) {
      final max = _channelScrollController.position.maxScrollExtent;
      final clamped = offset.clamp(0.0, max);
      if (animate) {
        _channelScrollController.animateTo(
          clamped,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      } else {
        _channelScrollController.jumpTo(clamped);
      }
    }
    if (_programScrollController.hasClients) {
      final max = _programScrollController.position.maxScrollExtent;
      final clamped = offset.clamp(0.0, max);
      if (animate) {
        _programScrollController.animateTo(
          clamped,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      } else {
        _programScrollController.jumpTo(clamped);
      }
    }
  }

  FocusNode _channelFocusNodeFor(int index) {
    return _channelFocusNodes.putIfAbsent(
      index,
      () => FocusNode(debugLabel: 'GuideChannel:$index'),
    );
  }

  /// Whether focus is this screen's to take right now.
  ///
  /// Several of these requests are deferred to a post-frame callback, and a
  /// route pushed on top of the guide does NOT unmount it -- the guide stays
  /// alive underneath. So `mounted` alone is not enough: a callback landing
  /// after the viewer opened a channel would pull focus out of the player and
  /// back onto a row nobody can see, leaving the remote apparently dead
  /// because every key goes to the hidden screen. Measured on a Shield with
  /// primaryFocus stranded on `GuideFilter:0` while the player was on top.
  ///
  /// A null route means the guide is embedded rather than pushed, and then
  /// nothing is on top of it to protect.
  bool get _mayTakeFocus {
    if (!mounted) return false;
    final route = ModalRoute.of(context);
    return route == null || route.isCurrent;
  }

  void _focusChannelRow(int index, {bool animate = true}) {
    if (!_mayTakeFocus) return;
    _cancelPendingVerticalMove();
    _scrollToRow(index, animate: animate);
    _channelFocusNodeFor(index).requestFocus();
  }

  void _focusMiniPlayer() {
    if (!widget.miniPlayerMode || !_mayTakeFocus) return;
    _cancelPendingVerticalMove();
    _miniPlayerFocusNode.requestFocus();
  }

  void _focusFilterRail() {
    if (!_mayTakeFocus) return;
    _cancelPendingVerticalMove();
    _filterFocusNodeFor(0).requestFocus();
  }

  /// Moves within the controls row, refusing a move off either end.
  void _focusWindowBar(int index) {
    if (index < _kWindowBarPrevious || index > _kWindowBarLast) return;
    if (!_mayTakeFocus) return;
    _cancelPendingVerticalMove();
    _lastWindowBarIndex = index;
    _windowBarFocusNodeFor(index).requestFocus();
  }

  /// UP out of the grid or channel column. The mini-player surface has no
  /// controls row, so it keeps going straight to the player.
  void _focusWindowBarFromGrid() {
    if (widget.miniPlayerMode) {
      _focusMiniPlayer();
      return;
    }
    _focusWindowBar(_lastWindowBarIndex);
  }

  /// DOWN out of the genre rail lands on the same button UP left behind.
  void _focusWindowBarFromGenres() => _focusWindowBar(_lastWindowBarIndex);

  void _focusRowFromMiniPlayer() {
    final channels = _vm.filteredChannels;
    if (channels.isEmpty) return;

    var targetIndex = _lastFocusedRowIndex ?? 0;
    final focusedChannelId = _focusedChannel.value?.id;
    if (focusedChannelId != null) {
      final channelIndex = channels.indexWhere(
        (channel) => channel.id == focusedChannelId,
      );
      if (channelIndex >= 0) {
        targetIndex = channelIndex;
      }
    }

    _focusChannelRow(targetIndex.clamp(0, channels.length - 1));
  }

  Future<void> _openDatePicker() async {
    if (_isShowingDatePicker) return;
    _cancelPendingVerticalMove();
    _isShowingDatePicker = true;
    try {
      final picked = await showDatePicker(
        context: context,
        initialDate: _vm.guideDate,
        firstDate: DateTime.now().subtract(const Duration(days: 7)),
        lastDate: DateTime.now().add(const Duration(days: 14)),
        builder: (context, child) {
          return FocusTraversalGroup(
            policy: OrderedTraversalPolicy(),
            child: child ?? const SizedBox.shrink(),
          );
        },
      );
      if (picked != null) {
        await _vm.setDate(picked);
        if (mounted) _anchorToWindowStart();
      }
    } finally {
      _isShowingDatePicker = false;
    }
  }

  void _openSortDialog() {
    _cancelPendingVerticalMove();
    final l10n = AppLocalizations.of(context);
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(l10n.sortBy, style: const TextStyle(color: Colors.white)),
        content: RadioGroup<ChannelSortBy>(
          groupValue: _vm.sortBy,
          onChanged: (value) {
            if (value == null) return;
            _prefs.set(UserPreferences.liveTvChannelSortBy, value);
            _cancelPendingVerticalMove();
            _vm.setSortBy(value);
            Navigator.of(dialogContext).pop();
          },
          // RadioGroup binds the arrow keys to "select the adjacent radio", so
          // on a d-pad the first move commits a sort and closes the dialog.
          // Restore plain directional focus. Centre-press still picks.
          child: Shortcuts(
            shortcuts: const <ShortcutActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.arrowUp):
                  DirectionalFocusIntent(TraversalDirection.up),
              SingleActivator(LogicalKeyboardKey.arrowDown):
                  DirectionalFocusIntent(TraversalDirection.down),
              SingleActivator(LogicalKeyboardKey.arrowLeft):
                  DirectionalFocusIntent(TraversalDirection.left),
              SingleActivator(LogicalKeyboardKey.arrowRight):
                  DirectionalFocusIntent(TraversalDirection.right),
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final option in ChannelSortBy.values)
                  RadioListTile<ChannelSortBy>(
                    value: option,
                    autofocus: option == _vm.sortBy,
                    title: Text(
                      option.displayName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openRecordings() async {
    if (_isOpeningRecordings) return;
    _cancelPendingVerticalMove();
    _isOpeningRecordings = true;
    try {
      await context.push(Destinations.liveTvRecordings);
    } finally {
      _isOpeningRecordings = false;
    }
  }

  @override
  void dispose() {
    widget.backController?._onBackPressed = null;
    _reanchorTimer?.cancel();
    _displayClockTimer?.cancel();
    _artworkLookupDebounce?.cancel();
    _artworkPrefetchScrollDebounce?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _vm.cancelBoundaryRefresh();
    _vm.removeListener(_onChanged);
    _vm.dispose();
    _focusedProgram.removeListener(_scheduleArtworkLookup);
    _focusedChannel.removeListener(_scheduleArtworkLookup);
    _channelRailFocused.removeListener(_scheduleArtworkLookup);
    _channelScrollController.dispose();
    _programScrollController.dispose();
    _timeHeaderHorizontalScrollController.dispose();
    _guideHorizontalScrollController.dispose();
    _miniPlayerFocusNode.dispose();
    for (final node in _channelFocusNodes.values) {
      node.dispose();
    }
    _channelFocusNodes.clear();
    for (final node in _filterFocusNodes.values) {
      node.dispose();
    }
    _filterFocusNodes.clear();
    for (final node in _windowBarFocusNodes.values) {
      node.dispose();
    }
    _windowBarFocusNodes.clear();
    _focusedProgram.dispose();
    _focusedChannel.dispose();
    _channelRailFocused.dispose();
    super.dispose();
  }

  String _formatTime(DateTime dt) {
    return formatClockTime(
      dt,
      use24Hour: _prefs.get(UserPreferences.use24HourClock),
    );
  }

  String _formatDate(DateTime dt) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${days[dt.weekday - 1]}, ${months[dt.month - 1]} ${dt.day}';
  }

  GuideProgram? _currentProgramForChannel(String channelId) {
    final programs = _vm.programsForChannel(channelId);
    if (programs.isEmpty) return null;

    final now = DateTime.now();
    for (final program in programs) {
      if (!now.isBefore(program.startDate) && now.isBefore(program.endDate)) {
        return program;
      }
    }

    return programs.first;
  }

  double _totalGuideWidth() {
    final minutes = _vm.windowEnd.difference(_vm.windowStart).inMinutes;
    return minutes * _layoutProfile.pixelsPerMinute;
  }

  // Called from row itemBuilders: as the guide scrolls toward the lazily-loaded
  // edge, request the next batch of programs (the VM guards against re-entry).
  void _maybeLoadMore(int index) {
    if (_vm.hasMorePrograms &&
        index + _kProgramPrefetchRows >= _vm.programsHighWater) {
      _vm.loadMorePrograms();
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = RequestInitialFocus(child: _buildContent(context));
    // The embedded overlay shares its host's single route and its PopScope;
    // the host asks widget.backController instead. The standalone route owns
    // its own pop attempts, so it needs its own PopScope here.
    if (widget.embedded) return content;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_consumeBackIfExploring()) return;
        Navigator.of(context).pop();
      },
      child: content,
    );
  }

  Widget _buildContent(BuildContext context) {
    final body = LayoutBuilder(
      builder: (context, constraints) {
        final landscape = _isLandscapeConstraints(constraints);
        final topInset = _contentTopInset(landscape: landscape);
        final availableWidth =
            constraints.maxWidth -
            _contentLeftInset() -
            (constraints.maxWidth >= constraints.maxHeight ? 24 : 16);
        final profile = GuideLayoutProfile.fromAvailableArea(
          availableWidth: availableWidth,
          availableHeight: constraints.maxHeight - topInset - 16,
          textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
        );
        _layoutProfile = profile;
        final heroVisible = landscape && !widget.miniPlayerMode;
        if (heroVisible != _heroVisible) {
          _heroVisible = heroVisible;
          // Deferred because this runs during build: gaining the hero has
          // to start artwork work that nothing else will trigger until the
          // next notification, and losing it has to drop work already
          // queued for a band that is no longer on screen.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            if (_heroVisible) {
              _queueArtworkPrefetch();
              _scheduleArtworkLookup();
            } else {
              _artworkPrefetchScrollDebounce?.cancel();
              _artworkLookupDebounce?.cancel();
              _vm.queueArtworkPrefetch(const [], replace: true);
            }
          });
        }
        if (landscape) _scheduleGuideWindowUpdate(profile.guideWindow);
        return Padding(
          padding: EdgeInsets.only(
            top: topInset,
            left: landscape ? _contentLeftInset() : 8,
            right: landscape ? 24 : 8,
            bottom: 16,
          ),
          child: landscape ? _buildLandscape() : _buildMobile(),
        );
      },
    );

    if (widget.embedded) {
      return body;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        left: !PlatformDetection.isAppleTV,
        top: !PlatformDetection.isAppleTV,
        right: !PlatformDetection.isAppleTV,
        bottom: !PlatformDetection.isAppleTV,
        child: body,
      ),
    );
  }

  bool _isLandscapeSize(Size size) =>
      widget.miniPlayerMode ||
      PlatformDetection.isTV ||
      PlatformDetection.useDesktopUi ||
      size.width >= size.height;

  bool _isLandscapeConstraints(BoxConstraints constraints) =>
      widget.miniPlayerMode ||
      PlatformDetection.isTV ||
      PlatformDetection.useDesktopUi ||
      constraints.maxWidth >= constraints.maxHeight;

  void _scheduleGuideWindowUpdate(Duration window) {
    if (_vm.state != GuideState.ready ||
        window == _vm.guideWindow ||
        window == _pendingGuideWindow) {
      return;
    }
    _pendingGuideWindow = window;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || _pendingGuideWindow != window) return;
      try {
        await _vm.setWindow(window);
      } finally {
        if (mounted && _pendingGuideWindow == window) {
          _pendingGuideWindow = null;
        }
      }
    });
  }

  Widget _buildLandscape() {
    return Column(
      children: [
        _buildTopSection(),
        SizedBox(height: widget.miniPlayerMode ? 8 : 2),
        // The window control sits directly above the grid. The tick strip's
        // left region is only channel-column wide and 22-24 px tall, so it
        // can't hold the chevrons and the range text at the narrowest size.
        if (!widget.miniPlayerMode) _buildGuideWindowBar(),
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _buildMobileHeader(),
        _buildFilterRail(),
        const SizedBox(height: 8),
        Expanded(child: _buildMobileBody()),
      ],
    );
  }

  Widget _buildTopSection() {
    if (widget.miniPlayerMode) {
      return ListenableBuilder(
        listenable: Listenable.merge([
          _focusedProgram,
          _focusedChannel,
          _channelRailFocused,
        ]),
        builder: (context, _) {
          final focusedProgram = _focusedProgram.value;
          final focusedChannel =
              !_channelRailFocused.value && focusedProgram != null
              ? _vm.channelForId(focusedProgram.channelId)
              : (widget.currentChannel ?? _focusedChannel.value);
          return _buildProgramInfoHeader(
            program: focusedProgram,
            channel: focusedChannel,
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildToolbar(), const SizedBox(height: 2), _buildHero()],
    );
  }

  /// The program the hero (and its artwork lookup) is currently previewing:
  /// the focused program cell, or — when focus is on the channel column
  /// instead — whatever that channel is airing now.
  GuideProgram? _currentPreviewProgram() {
    final program = _focusedProgram.value;
    final channel = !_channelRailFocused.value && program != null
        ? _vm.channelForId(program.channelId)
        : _focusedChannel.value;
    return program ??
        (channel == null ? null : _vm.nowNextForChannel(channel.id).now);
  }

  /// The bulk guide fetch disables images to keep its payload small (issue
  /// #666), so it never carries a program's own `ImageTags` even when the
  /// server has one on file. This debounces a per-program re-fetch (see
  /// [LiveTvGuideViewModel.artworkSourceFor]) so scrolling through the
  /// channel column doesn't fire a request per row passed through, and skips
  /// it entirely once cached. Not limited to currently-airing programs —
  /// future programs carry artwork just as often as live ones.
  void _scheduleArtworkLookup() {
    _artworkLookupDebounce?.cancel();
    if (!_heroVisible) return;
    final preview = _currentPreviewProgram();
    if (preview == null ||
        preview.artworkSource != null ||
        _vm.hasArtworkResult(preview.id)) {
      return;
    }
    final programId = preview.id;
    _artworkLookupDebounce = Timer(const Duration(milliseconds: 500), () async {
      // Nothing came back, so the hero has nothing new to paint. Rebuilding
      // the whole guide anyway would cost a frame per focus move on any
      // server whose programs carry no artwork.
      if (await _vm.artworkSourceFor(preview) == null) return;
      if (mounted && _currentPreviewProgram()?.id == programId) {
        setState(() {});
      }
    });
  }

  Widget _buildHero() {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _focusedProgram,
        _focusedChannel,
        _channelRailFocused,
      ]),
      builder: (context, _) {
        final program = _focusedProgram.value;
        final channel = !_channelRailFocused.value && program != null
            ? _vm.channelForId(program.channelId)
            : _focusedChannel.value;
        final preview = _currentPreviewProgram();
        final now = DateTime.now();
        final isLive =
            preview != null &&
            now.isAfter(preview.startDate) &&
            now.isBefore(preview.endDate);
        final channelWithLogo = channel;
        final channelLogoUrl =
            channelWithLogo != null && channelWithLogo.imageTag != null
            ? _vm.imageApi.getPrimaryImageUrl(
                channelWithLogo.id,
                maxHeight: EpgHeroPreview.compactHeight.toInt(),
                tag: channelWithLogo.imageTag,
              )
            : null;
        final artwork = preview == null
            ? null
            : preview.artworkSource ?? _vm.cachedArtworkFor(preview.id);
        // A thumb tag names the parent's Thumb image, so asking for its
        // Primary with that tag serves the wrong image or nothing at all.
        final programImageUrl = artwork == null
            ? null
            : artwork.isThumb
            ? _vm.imageApi.getThumbImageUrl(
                artwork.itemId,
                maxWidth: EpgHeroPreview.plateWidth.toInt(),
                tag: artwork.tag,
              )
            : _vm.imageApi.getPrimaryImageUrl(
                artwork.itemId,
                maxHeight: EpgHeroPreview.compactHeight.toInt(),
                maxWidth: EpgHeroPreview.plateWidth.toInt(),
                tag: artwork.tag,
              );
        for (final url in [channelLogoUrl, programImageUrl]) {
          if (url != null) {
            _precacheGuideLogoUrl(url, layoutWidth: EpgHeroPreview.plateWidth);
          }
        }
        final episodeTitle = preview?.episodeTitle;
        final episodeSuffix =
            episodeTitle != null &&
                episodeTitle.isNotEmpty &&
                episodeTitle != preview?.name
            ? ' - $episodeTitle'
            : '';
        final seasonEpisodeSuffix = preview?.seasonEpisodeLabel != null
            ? ' (${preview!.seasonEpisodeLabel})'
            : '';
        final l10n = AppLocalizations.of(context);
        final badgeLabel = preview == null
            ? null
            : preview.isPremiere
            ? l10n.premiere
            : preview.isRepeat
            ? l10n.guideRepeatBadge
            : null;
        return EpgHeroPreview(
          title: channel?.name ?? preview?.name ?? l10n.guideTimeline,
          programTitle: channel == null ? null : preview?.name,
          programSubtitle: '$episodeSuffix$seasonEpisodeSuffix',
          channelLogoUrl: channelLogoUrl,
          programImageUrl: programImageUrl,
          timeLabel: preview == null
              ? null
              : '${_formatTime(preview.startDate)} - ${_formatTime(preview.endDate)}',
          genreLabel: preview == null ? null : epgGenreFor(preview).label,
          officialRating: preview?.officialRating,
          communityRating: preview?.communityRating,
          badgeLabel: badgeLabel,
          synopsis: preview?.overview,
          isLive: isLive,
          apple: _apple,
          compact: true,
        );
      },
    );
  }

  void _precacheGuideLogoUrl(String url, {required double layoutWidth}) {
    if (!mounted || url.isEmpty || !_precachedGuideLogoUrls.add(url)) return;
    unawaited(
      BoundedNetworkImage.precache(
        context,
        url,
        layoutWidth: layoutWidth,
        maxWidth: 256,
      ).catchError((_) {
        _precachedGuideLogoUrls.remove(url);
      }),
    );
  }

  Widget _buildFilterRail({
    EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16, 6, 16, 6),
    VoidCallback? onNavigateDown,
  }) {
    final filters = GuideFilter.values;
    return Padding(
      padding: padding,
      child: EpgFilterRail(
        labels: [for (final f in filters) _filterLabel(f)],
        selectedIndex: filters.indexOf(_vm.filter),
        onSelect: (i) {
          _cancelPendingVerticalMove();
          _vm.setFilter(filters[i]);
        },
        apple: _apple,
        focusNodeFor: _filterFocusNodeFor,
        onNavigateDown: onNavigateDown ?? () => _focusChannelRow(0),
      ),
    );
  }

  FocusNode _filterFocusNodeFor(int index) {
    return _filterFocusNodes.putIfAbsent(
      index,
      () => FocusNode(debugLabel: 'GuideFilter:$index'),
    );
  }

  FocusNode _windowBarFocusNodeFor(int index) {
    return _windowBarFocusNodes.putIfAbsent(
      index,
      () => FocusNode(debugLabel: 'GuideWindowBar:$index'),
    );
  }

  Widget _buildMobileHeader() {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Row(
        children: [
          _GuidePillButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.guideTimeline,
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppTypography.fontSizeLg,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _GuidePillButton(icon: Icons.sort, onPressed: _openSortDialog),
          const SizedBox(width: 6),
          _GuidePillButton(
            icon: Icons.calendar_today,
            onPressed: _openDatePicker,
          ),
          const SizedBox(width: 6),
          _GuidePillButton(
            icon: _mobileView == EpgMobileView.grid
                ? Icons.view_agenda
                : Icons.grid_view,
            onPressed: _toggleMobileView,
          ),
        ],
      ),
    );
  }

  void _toggleMobileView() {
    final next = _mobileView == EpgMobileView.list
        ? EpgMobileView.grid
        : EpgMobileView.list;
    setState(() => _mobileView = next);
    _prefs.set(UserPreferences.epgMobileView, next);
  }

  Widget _buildMobileBody() {
    switch (_vm.state) {
      case GuideState.loading:
        return const Center(child: CircularProgressIndicator());
      case GuideState.error:
        final l10n = AppLocalizations.of(context);
        return Center(
          child: Text(
            l10n.failedToLoadGuide(describeError(_vm.error!, l10n)),
            style: TextStyle(color: Colors.white.withAlpha(179)),
          ),
        );
      case GuideState.ready:
        final channels = _vm.filteredChannels;
        if (channels.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context).noChannelsFound,
              style: TextStyle(color: Colors.white.withAlpha(179)),
            ),
          );
        }
        return _mobileView == EpgMobileView.grid
            ? _buildGuideGrid(channels)
            : _buildNowNextList(channels);
    }
  }

  Widget _buildNowNextList(List<GuideChannel> channels) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 16),
      itemCount: channels.length,
      itemBuilder: (context, index) {
        _maybeLoadMore(index);
        final channel = channels[index];
        final nowNext = _vm.nowNextForChannel(channel.id);
        final now = nowNext.now;
        final next = nowNext.next;
        final t = DateTime.now();
        final logoUrl = channel.imageTag == null
            ? null
            : _vm.imageApi.getPrimaryImageUrl(
                channel.id,
                maxHeight: 112,
                tag: channel.imageTag,
              );
        final isLive =
            now != null && t.isAfter(now.startDate) && t.isBefore(now.endDate);
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: EpgNowNextCard(
            logoUrl: logoUrl,
            channelName: channel.name,
            channelNumber: channel.number,
            nowTitle: now?.name,
            nowProgress: now?.progressAt(t) ?? 0,
            remainingLabel: now == null
                ? null
                : _remainingLabel(now.endDate, t),
            nextLabel: next == null
                ? null
                : AppLocalizations.of(context)
                      .guideNextProgram(_formatTime(next.startDate), next.name),
            isLive: isLive,
            apple: _apple,
            onTap: () => _watchChannel(channel.id),
            focusNode: _channelFocusNodeFor(index),
          ),
        );
      },
    );
  }

  String? _remainingLabel(DateTime end, DateTime now) {
    final mins = end.difference(now).inMinutes;
    if (mins <= 0) return null;
    final l10n = AppLocalizations.of(context);
    if (mins < 60) return l10n.guideMinutesLeft(mins);
    final h = mins ~/ 60;
    final m = mins % 60;
    return m == 0 ? l10n.guideHoursLeft(h) : l10n.guideHoursMinutesLeft(h, m);
  }

  Widget _buildProgramInfoHeader({
    required GuideProgram? program,
    required GuideChannel? channel,
  }) {
    final l10n = AppLocalizations.of(context);
    final title = program?.name ?? channel?.name ?? l10n.guideTimeline;
    final episodeTitle = program?.episodeTitle;
    final timeRange = program == null
        ? null
        : '${_formatTime(program.startDate)} - ${_formatTime(program.endDate)}';
    final overview = program?.overview;
    final channelLabel = channel == null
        ? null
        : channel.number == null || channel.number!.isEmpty
        ? channel.name
        : '${channel.number}  ${channel.name}';

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: AppRadius.circular(12),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.cardBorder,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.miniPlayerMode) ...[
                SizedBox(
                  width: _kMiniPlayerWidth,
                  height: _kMiniPlayerHeight,
                  child: _buildMiniPlayerCard(),
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppTypography.fontSizeXl,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (timeRange != null || channelLabel != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        [?timeRange, ?channelLabel].join('   '),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: AppTypography.fontSizeSm,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (episodeTitle != null && episodeTitle.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        episodeTitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: AppTypography.fontSizeSm,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (overview != null && overview.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        overview,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: AppTypography.fontSizeSm,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        // Back-only dismissal is a TV rule. Desktop and web need a clickable exit.
        if (!PlatformDetection.isTV)
          Positioned(
            top: 4,
            right: 4,
            child: _GuidePillButton(
              icon: Icons.close,
              onPressed: widget.embedded && widget.onClose != null
                  ? widget.onClose!
                  : () => Navigator.of(context).pop(),
            ),
          ),
      ],
    );
  }

  Widget _buildMiniPlayerCard() {
    final l10n = AppLocalizations.of(context);
    final currentChannel = widget.currentChannel;
    final currentProgram = currentChannel == null
        ? null
        : _currentProgramForChannel(currentChannel.id);
    final imageUrl = currentChannel?.imageTag == null
        ? null
        : _vm.imageApi.getPrimaryImageUrl(
            currentChannel!.id,
            maxHeight: 80,
            tag: currentChannel.imageTag,
          );

    return LiveTvMiniPlayer(
      imageUrl: imageUrl,
      channelName: currentChannel?.name ?? l10n.channels,
      channelNumber: currentChannel?.number,
      programTitle: currentProgram?.name,
      showLiveVideo: true,
      transparentPreview: widget.embedded,
      appleTvTextureId: widget.appleTvTextureId,
      onActivate: widget.embedded && widget.onClose != null
          ? widget.onClose!
          : () => Navigator.of(context).pop(),
      focusNode: _miniPlayerFocusNode,
      onKeyEvent: (_, event) {
        if (!event.isActionable) return KeyEventResult.ignored;
        if (event.logicalKey.isDownKey) {
          _focusRowFromMiniPlayer();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
    );
  }

  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        children: [
          if (!PlatformDetection.isTV) ...[
            _GuidePillButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: _buildFilterRail(
              padding: EdgeInsets.zero,
              onNavigateDown: _focusWindowBarFromGenres,
            ),
          ),
        ],
      ),
    );
  }

  /// Window paging and the rendered range on the left, the filter, calendar
  /// and recordings controls on the right. Every button in the row is one
  /// continuous LEFT/RIGHT run between the genre rail and the channel column.
  Widget _buildGuideWindowBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
      child: Row(
        children: [
          _windowBarButton(
            _kWindowBarPrevious,
            icon: Icons.chevron_left,
            onPressed: () => _shiftGuideWindow(
              -_vm.guideWindow,
              focusGrid: false,
              allowPast: true,
            ),
          ),
          const SizedBox(width: 2),
          _windowBarButton(
            _kWindowBarNow,
            label: AppLocalizations.of(context).now,
            onPressed: _goToNow,
          ),
          const SizedBox(width: 2),
          _windowBarButton(
            _kWindowBarNext,
            icon: Icons.chevron_right,
            onPressed: () =>
                _shiftGuideWindow(_vm.guideWindow, focusGrid: false),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${_formatDate(_vm.guideDate)}  ${_formatTime(_vm.windowStart)} – ${_formatTime(_vm.windowEnd)}',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          _windowBarButton(
            _kWindowBarSort,
            icon: Icons.sort,
            onPressed: _openSortDialog,
          ),
          const SizedBox(width: 4),
          _windowBarButton(
            _kWindowBarDate,
            icon: Icons.calendar_today,
            onPressed: _openDatePicker,
          ),
          const SizedBox(width: 4),
          _windowBarButton(
            _kWindowBarRecordings,
            icon: Icons.fiber_dvr,
            label: AppLocalizations.of(context).recordings,
            onPressed: _openRecordings,
          ),
        ],
      ),
    );
  }

  /// One button of the controls row, wired into its horizontal run and into
  /// the genre rail above and the channel column below.
  Widget _windowBarButton(
    int index, {
    IconData? icon,
    String? label,
    required VoidCallback onPressed,
  }) {
    return _GuidePillButton(
      icon: icon,
      label: label,
      compact: true,
      focusNode: _windowBarFocusNodeFor(index),
      onPressed: onPressed,
      onKeyEvent: (_, event) {
        if (!event.isActionable) return KeyEventResult.ignored;
        final key = event.logicalKey;
        if (key.isLeftKey) {
          _focusWindowBar(index - 1);
          return KeyEventResult.handled;
        }
        if (key.isRightKey) {
          _focusWindowBar(index + 1);
          return KeyEventResult.handled;
        }
        if (key.isUpKey) {
          _focusFilterRail();
          return KeyEventResult.handled;
        }
        if (key.isDownKey) {
          _focusChannelRow(0);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
    );
  }

  String _filterLabel(GuideFilter filter) {
    final l10n = AppLocalizations.of(context);
    return switch (filter) {
      GuideFilter.all => l10n.all,
      GuideFilter.movies => l10n.movies,
      GuideFilter.series => l10n.series,
      GuideFilter.sports => l10n.sports,
      GuideFilter.news => l10n.news,
      GuideFilter.kids => l10n.kids,
      GuideFilter.premiere => l10n.premiere,
      GuideFilter.favorites => l10n.favorites,
    };
  }

  Widget _buildBody() {
    switch (_vm.state) {
      case GuideState.loading:
        return const Center(child: CircularProgressIndicator());
      case GuideState.error:
        final l10n = AppLocalizations.of(context);
        return Center(
          child: Text(
            l10n.failedToLoadGuide(describeError(_vm.error!, l10n)),
            style: TextStyle(color: Colors.white.withAlpha(179)),
          ),
        );
      case GuideState.ready:
        final channels = _vm.filteredChannels;
        if (channels.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context).noChannelsFound,
              style: TextStyle(color: Colors.white.withAlpha(179)),
            ),
          );
        }
        return _buildGuideGrid(channels);
    }
  }

  Widget _buildGuideGrid(List<GuideChannel> channels) {
    final guideWidth = _totalGuideWidth();
    final profile = _layoutProfile;

    return Column(
      children: [
        HorizontalScrollSection(
          title: '',
          scrollController: _timeHeaderHorizontalScrollController,
          onScrollPastStart: () =>
              _shiftGuideWindow(const Duration(minutes: -30), focusGrid: false),
          onScrollPastEnd: () =>
              _shiftGuideWindow(const Duration(minutes: 30), focusGrid: false),
          showControls: false,
          builder: (_, controller) => SizedBox(
            height: profile.timeHeaderHeight,
            child: Row(
              children: [
                SizedBox(width: profile.channelColumnWidth),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    child: _buildTimeHeader(guideWidth),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: ThemeRegistry.active.borders.chipBorder.color,
          height: 1,
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: profile.channelColumnWidth,
                child: ListView.builder(
                  controller: _channelScrollController,
                  itemCount: channels.length,
                  itemExtent: profile.rowHeight,
                  itemBuilder: (context, index) {
                    _maybeLoadMore(index);
                    return _buildChannelCell(channels[index], index);
                  },
                ),
              ),
              VerticalDivider(
                width: 1,
                color: ThemeRegistry.active.borders.chipBorder.color,
              ),
              Expanded(
                child: _GuideGridView(
                  channels: channels,
                  guideWidth: guideWidth,
                  rowHeight: profile.rowHeight,
                  verticalController: _programScrollController,
                  horizontalController: _guideHorizontalScrollController,
                  buildProgramRow: _buildProgramRow,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeHeader(double totalWidth) {
    final profile = _layoutProfile;
    final slots = <Widget>[];
    var time = _vm.windowStart;
    while (time.isBefore(_vm.windowEnd)) {
      final slotWidth = 30 * profile.pixelsPerMinute;
      slots.add(
        SizedBox(
          width: slotWidth,
          height: profile.timeHeaderHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                _formatTime(time),
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
        ),
      );
      time = time.add(const Duration(minutes: 30));
    }
    return SizedBox(
      width: totalWidth,
      height: profile.timeHeaderHeight,
      child: Row(children: slots),
    );
  }

  Widget _buildChannelCell(GuideChannel channel, int index) {
    final imageUrl = channel.imageTag != null
        ? _vm.imageApi.getPrimaryImageUrl(
            channel.id,
            maxHeight: _layoutProfile.rowHeight.toInt(),
            tag: channel.imageTag,
          )
        : null;
    if (imageUrl != null) {
      _precacheGuideLogoUrl(imageUrl, layoutWidth: 34);
    }

    return _GuideFocusableSurface(
      focusNode: _channelFocusNodeFor(index),
      onPressed: () => _watchChannel(channel.id),
      onKeyEvent: (_, event) {
        if (!event.isActionable) return KeyEventResult.ignored;
        final pageDirection = _pageRowDirection(event.logicalKey);
        if (pageDirection != 0) {
          _onNavigationKey();
          _focusChannelRow(
            (index + pageDirection * _rowsPerViewport()).clamp(
              0,
              _vm.filteredChannels.length - 1,
            ),
          );
          return KeyEventResult.handled;
        }
        final key = event.logicalKey;
        if (key.isUpKey) {
          _onNavigationKey();
          if (index == 0) {
            _focusWindowBarFromGrid();
          } else {
            _focusChannelRow(index - 1);
          }
          return KeyEventResult.handled;
        }
        if (key.isDownKey) {
          _onNavigationKey();
          if (index < _vm.filteredChannels.length - 1) {
            _focusChannelRow(index + 1);
          }
          return KeyEventResult.handled;
        }
        if (key.isRightKey) {
          _onNavigationKey();
          _focusProgramFromChannel(index);
          return KeyEventResult.handled;
        }
        if (key.isLeftKey) {
          _onNavigationKey();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      onFocusChange: (focused) {
        if (!focused) return;
        _scrollToRow(index);
        _channelRailFocused.value = true;
        _focusedProgram.value = null;
        _focusedChannel.value = channel;
      },
      builder: (focused) => Container(
        height: _layoutProfile.rowHeight,
        // The cell brings its own vertical padding. Doubling it here starved
        // the number chip and name of height and overflowed the row.
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          border: Border(bottom: ThemeRegistry.active.borders.cardBorder),
        ),
        child: EpgChannelCell(
          logoUrl: imageUrl,
          name: channel.name,
          number: channel.number,
          focused: focused,
          apple: _apple,
          isFavorite: channel.isFavorite,
        ),
      ),
    );
  }

  /// The cell timeline for one channel. The single place `buildRowCells` is
  /// called, so a row the screen navigates to is built the same way it renders.
  List<GuideCell> _cellsForChannel(String channelId) => buildRowCells(
    visible: _vm.programsForChannel(channelId),
    unfiltered: _vm.unfilteredProgramsForChannel(channelId),
    windowStart: _vm.windowStart,
    windowEnd: _vm.windowEnd,
    loadState: _vm.loadStateFor(channelId),
  );

  List<GuideCell> _cellsForRow(int rowIndex) {
    final channels = _vm.filteredChannels;
    if (rowIndex < 0 || rowIndex >= channels.length) return const [];
    return _cellsForChannel(channels[rowIndex].id);
  }

  /// True while a row's cells are nothing but the placeholder the loading
  /// state produces, so there is no real cell to land on yet.
  static bool _cellsAreLoading(List<GuideCell> cells) =>
      cells.length == 1 && cells.first.kind == GuideCellKind.loading;

  /// Enters the program row at the same timeline anchor the viewer last
  /// used, falling back to now when focus arrived through the channel rail.
  void _focusProgramFromChannel(int rowIndex) {
    final channels = _vm.filteredChannels;
    if (rowIndex < 0 || rowIndex >= channels.length) return;
    final cells = _cellsForChannel(channels[rowIndex].id);
    final rowState = _rowStates[rowIndex];
    if (cells.isEmpty || rowState == null || _cellsAreLoading(cells)) return;

    final current = _selection;
    final rawAnchor = current?.anchorTime ?? DateTime.now();
    final anchor = rawAnchor.isBefore(_vm.windowStart)
        ? _vm.windowStart
        : rawAnchor.isAfter(_vm.windowEnd)
        ? _vm.windowEnd.subtract(const Duration(microseconds: 1))
        : rawAnchor;
    final index = resolveCellIndexAt(cells, anchor);
    final cell = cells[index];
    _selection = GuideSelection(
      channelId: channels[rowIndex].id,
      anchorTime: clampAnchorInto(cell, anchor),
      programId: cell.program?.id,
    );
    rowState.focusCellAt(index);
  }

  /// Moves one row while holding [GuideSelection.anchorTime], so the selection
  /// keeps its place in time instead of following the nearest rectangle. An
  /// unresolvable row defers the move instead of landing arbitrarily.
  void _moveSelectionVertically(int fromRowIndex, int delta) {
    final selection = _selection;
    if (selection == null) return;
    final target = fromRowIndex + delta;
    if (target < 0 || target >= _vm.filteredChannels.length) return;
    final cells = _cellsForRow(target);
    if (cells.isEmpty) return;

    final rowState = _rowStates[target];
    if (rowState == null || _cellsAreLoading(cells)) {
      _pendingVerticalMove = _PendingVerticalMove(
        targetRowIndex: target,
        anchorTime: selection.anchorTime,
      );
      return;
    }
    rowState.focusCellAt(resolveCellIndexAt(cells, selection.anchorTime));
  }

  /// Completes the deferred move once its row is mounted and loaded. The
  /// intent survives until then or until something clears it.
  void _applyPendingVerticalMove() {
    final pending = _pendingVerticalMove;
    if (pending == null) return;
    // Deferred to a later frame, so the viewer may have opened a channel in
    // the meantime. The move is theirs to finish when they come back, not
    // something to take the remote for now.
    if (!_mayTakeFocus) return;
    final cells = _cellsForRow(pending.targetRowIndex);
    if (cells.isEmpty || _cellsAreLoading(cells)) return;
    final rowState = _rowStates[pending.targetRowIndex];
    if (rowState == null) return;

    _pendingVerticalMove = null;
    rowState.focusCellAt(resolveCellIndexAt(cells, pending.anchorTime));
  }

  /// Defers the apply to after the current frame. Rows report themselves while
  /// building, when focus must not be requested.
  void _scheduleApplyPendingVerticalMove() {
    if (_pendingVerticalMove == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _applyPendingVerticalMove();
    });
  }

  /// Records the input so a re-anchor can stay out of the way, then drops the
  /// deferred move.
  void _onNavigationKey() {
    _lastDpadEventAt = DateTime.now();
    _cancelPendingVerticalMove();
  }

  /// Arms a single timer for the next :00/:30 rather than polling. The window
  /// only moves on the half hour [guideLeftEdge] floors to.
  void _scheduleReanchor() {
    _reanchorTimer?.cancel();
    final now = DateTime.now();
    final next = floorToHalfHour(now).add(const Duration(minutes: 30));
    _reanchorTimer = Timer(next.difference(now), _onReanchorTick);
  }

  void _onReanchorTick() {
    if (!mounted) return;
    final now = DateTime.now();
    final lastInput = _lastDpadEventAt;
    if (lastInput != null) {
      final quiet = _kReanchorInputQuiet - now.difference(lastInput);
      if (quiet > Duration.zero) {
        // Mid-input: wait out the quiet period instead of moving under the user.
        _reanchorTimer = Timer(quiet, _onReanchorTick);
        return;
      }
    }
    _scheduleReanchor();
    unawaited(_reanchor(now));
  }

  /// Re-resolves the selection against the window as the clock moves it, and
  /// puts focus back on the cell the new anchor lands on.
  Future<void> _reanchor(DateTime now) async {
    if (!_vm.atLivePosition) return;
    try {
      await _vm.setWindowStart(guideLeftEdge(now), livePosition: true);
    } catch (_) {
      if (mounted) _vm.scheduleBoundaryRefresh();
      return;
    }
    if (!mounted) return;
    await _vm.refreshAtQuarterHour();
    if (!mounted) return;
    final selection = _selection;
    if (selection == null) return;
    final cells = _cellsForChannel(selection.channelId);
    if (cells.isEmpty) return;

    final updated = reanchorSelection(
      current: selection,
      cells: cells,
      now: now,
    );
    if (updated.anchorTime == selection.anchorTime &&
        updated.programId == selection.programId) {
      return;
    }

    _cancelPendingVerticalMove();
    _selection = updated;
    _focusSelectedCell(updated, cells);
  }

  void _focusSelectedCell(GuideSelection selection, List<GuideCell> cells) {
    // The reanchor timer reaches here on its own, driven by the clock rather
    // than by the viewer: when a programme boundary passes it re-resolves the
    // selection and puts focus on the new cell. If the viewer has since opened
    // a channel, that focus lands on a cell behind the player and every remote
    // key goes to a screen nobody can see -- watching fine for a while, then
    // the remote stops answering, with nothing the viewer did to cause it.
    // Keep re-resolving the selection so the guide is correct when they come
    // back; just do not take the remote to do it.
    if (!_mayTakeFocus) return;
    if (_cellsAreLoading(cells)) return;
    final rowIndex = _vm.filteredChannels.indexWhere(
      (channel) => channel.id == selection.channelId,
    );
    if (rowIndex < 0) return;
    _rowStates[rowIndex]?.focusCellAt(
      resolveCellIndexAt(cells, selection.anchorTime),
    );
  }

  /// Drops the deferred move: the destination it referred to is no longer what
  /// the user is asking for.
  void _cancelPendingVerticalMove() {
    _pendingVerticalMove = null;
  }

  /// [focusGrid] is false when a control drove the shift, so pressing a
  /// chevron doesn't yank focus down into the grid. [allowPast] is true only
  /// for the back chevron, the one way to browse earlier than the live window.
  Future<void> _shiftGuideWindow(
    Duration amount, {
    bool focusGrid = true,
    bool allowPast = false,
  }) async {
    _cancelPendingVerticalMove();
    final oldStart = _vm.windowStart;
    final oldEnd = _vm.windowEnd;
    final target = oldStart.add(amount);
    final liveStart = guideLeftEdge(DateTime.now());
    // Only the back chevron may look at history, and only as far as the
    // server realistically keeps it. Every other backward path exists to
    // return toward live after paging ahead.
    final backFloor = liveStart.subtract(_kMaxGuideHistory);
    final floor = allowPast ? backFloor : liveStart;
    final clamped = amount.isNegative && target.isBefore(floor)
        ? floor
        : target;
    if (clamped == oldStart) return;

    try {
      await _vm.setWindowStart(clamped, livePosition: clamped == liveStart);
    } catch (_) {
      return;
    }
    if (!mounted) return;
    final selection = _selection;
    if (selection == null) return;
    final cells = _cellsForChannel(selection.channelId);
    if (cells.isEmpty) return;
    final edgeAnchor = amount.isNegative
        ? oldStart.subtract(const Duration(microseconds: 1))
        : oldEnd;
    final index = resolveCellIndexAt(cells, edgeAnchor);
    final cell = cells[index];
    final updated = selection.copyWith(
      anchorTime: clampAnchorInto(cell, edgeAnchor),
      programId: cell.program?.id,
      clearProgramId: cell.program == null,
    );
    _selection = updated;
    if (focusGrid) _focusSelectedCell(updated, cells);
  }

  /// Whole rows the grid shows at once, so a page key moves exactly one screen.
  int _rowsPerViewport() {
    if (!_programScrollController.hasClients) return 1;
    final rows =
        (_programScrollController.position.viewportDimension /
                _layoutProfile.rowHeight)
            .floor();
    return rows < 1 ? 1 : rows;
  }

  /// Pages channel rows by one viewport. This is vertical movement, so it runs
  /// through the same resolver and leaves the anchor time untouched.
  void _pageChannelRows(int fromRowIndex, int direction) {
    final channels = _vm.filteredChannels;
    if (channels.isEmpty) return;
    final target = (fromRowIndex + direction * _rowsPerViewport()).clamp(
      0,
      channels.length - 1,
    );
    if (target == fromRowIndex) return;
    _moveSelectionVertically(fromRowIndex, target - fromRowIndex);
    // A row a viewport away is usually unbuilt. Scrolling mounts it so the
    // deferred move can complete.
    if (_pendingVerticalMove != null) _scrollToRow(target);
  }

  /// Puts the anchor on the new window start after a jump, so it addresses the
  /// first cell of every row instead of a time the window no longer covers.
  void _anchorToWindowStart() {
    final selection = _selection;
    if (selection == null) return;
    final cells = _cellsForChannel(selection.channelId);
    if (cells.isEmpty) {
      _selection = selection.copyWith(
        anchorTime: _vm.windowStart,
        clearProgramId: true,
      );
      return;
    }
    final cell = cells[resolveCellIndexAt(cells, _vm.windowStart)];
    final updated = selection.copyWith(
      anchorTime: clampAnchorInto(cell, _vm.windowStart),
      programId: cell.program?.id,
      clearProgramId: cell.program == null,
    );
    _selection = updated;
    _focusSelectedCell(updated, cells);
  }

  Future<void> _goToNow() async {
    _cancelPendingVerticalMove();
    await _vm.goToNow(windowStart: guideLeftEdge(DateTime.now()));
    if (!mounted) return;
    _anchorToWindowStart();
  }

  /// The channel the guide considers "home": the last one the user actually
  /// tuned, read live off the always-current preference rather than a copy
  /// cached at some earlier point.
  String? get _homeChannelId {
    final id = _prefs.get(UserPreferences.liveTvLastChannelId).trim();
    return id.isEmpty ? null : id;
  }

  /// True once the user has paged the window off live or moved focus onto a
  /// channel other than [_homeChannelId] -- anywhere in the grid, channel
  /// column included. When nothing has ever been tuned, row 0 stands in for
  /// home, since that is where [_scheduleInitialChannelFocus] falls back to
  /// on first use; checked by real focus on that row's node rather than
  /// channel identity, since a genre filter can swap which channel sits at
  /// row 0 without moving focus off a node that was already focused there.
  bool _isExploringAwayFromEntry() {
    final homeId = _homeChannelId;
    if (homeId != null) {
      return !_vm.atLivePosition || _focusedChannel.value?.id != homeId;
    }
    if (_vm.filteredChannels.isEmpty) return false;
    return !_vm.atLivePosition || !_channelFocusNodeFor(0).hasFocus;
  }

  /// True while [_resetToEntryState] is awaiting its reload, so a second back
  /// press in that window doesn't start the reset over.
  bool _resettingToEntryState = false;

  /// Resets to [_homeChannelId], re-resolving it into
  /// [LiveTvGuideViewModel.filteredChannels] AFTER [_goToNow] reloads the
  /// lineup, since a genre filter can change which channels are present
  /// during that reload -- resolving before it would risk landing on
  /// whatever channel now sits at a stale index. With nothing ever tuned,
  /// resets to row 0 instead, the same first-use fallback as
  /// [_scheduleInitialChannelFocus].
  Future<void> _resetToEntryState() async {
    _resettingToEntryState = true;
    try {
      await _goToNow();
    } finally {
      _resettingToEntryState = false;
    }
    if (!mounted) return;
    final homeId = _homeChannelId;
    final channels = _vm.filteredChannels;
    int index;
    if (homeId != null) {
      index = channels.indexWhere((channel) => channel.id == homeId);
      if (index < 0) return;
    } else {
      if (channels.isEmpty) return;
      index = 0;
    }
    // Set the tracked focus target directly instead of waiting on the
    // channel row's own focus-change callback: the row can be scrolled many
    // screens away, so its FocusNode isn't attached until the list has
    // scrolled and rebuilt that far, which the requestFocus() below can't
    // wait for. Without this, _isExploringAwayFromEntry() kept seeing the old
    // focused channel after a "reset" that never visually landed, so every
    // later back press re-triggered the same no-op reset instead of ever
    // exiting.
    _channelRailFocused.value = true;
    _focusedProgram.value = null;
    _focusedChannel.value = channels[index];
    // Neither the field assignments above nor the reload behind _goToNow()
    // are guaranteed to have scheduled a frame, and addPostFrameCallback
    // only runs on a frame that actually happens -- so without an explicit
    // scheduleFrame() the row can sit waiting for whatever unrelated widget
    // (e.g. the guide's own clock) next triggers one. Schedule both frames
    // this needs explicitly: one for the callback below to fire at all, and
    // a second because the target row may still be off-screen with its
    // FocusNode not yet attached, exactly as in _scheduleInitialChannelFocus.
    final binding = WidgetsBinding.instance;
    binding.addPostFrameCallback((_) {
      if (!mounted) return;
      binding.scheduleFrame();
      binding.addPostFrameCallback((_) {
        if (mounted) _focusChannelRow(index, animate: false);
      });
    });
    binding.scheduleFrame();
  }

  /// A back press resolves here first: if the grid has drifted from where the
  /// user would have landed opening the guide fresh, back re-homes it instead
  /// of exiting. Returns true when it handled the press. Resolves the entry
  /// channel's index before committing to consume the press, so a genre
  /// filter that excludes the entry channel falls through to the normal
  /// close/exit path instead of consuming back presses forever. With no
  /// channel ever tuned, the target is row 0 as long as the lineup is
  /// non-empty.
  bool _consumeBackIfExploring() {
    // A reset already running owns this press. Consuming it keeps the guide
    // from closing out from under a reset that is about to land.
    if (_resettingToEntryState) return true;
    if (!_isExploringAwayFromEntry()) return false;
    final homeId = _homeChannelId;
    if (homeId != null) {
      final index = _vm.filteredChannels.indexWhere(
        (channel) => channel.id == homeId,
      );
      if (index < 0) return false;
    } else if (_vm.filteredChannels.isEmpty) {
      return false;
    }
    unawaited(_resetToEntryState());
    return true;
  }

  /// Anchor for the first focused cell: now while the window covers it, and
  /// the window start otherwise.
  DateTime _seedAnchorInto(GuideCell cell) {
    final now = DateTime.now();
    final base = !now.isBefore(_vm.windowStart) && now.isBefore(_vm.windowEnd)
        ? now
        : _vm.windowStart;
    return clampAnchorInto(cell, base);
  }

  /// A horizontal move is the only navigation that rewrites the anchor.
  void _onHorizontalMove(GuideCell cell, double left, double width) {
    final selection = _selection;
    if (selection != null) {
      _selection = selection.copyWith(
        anchorTime: clampAnchorInto(cell, cell.start),
      );
    }
    _ensureProgramVisible(left, width);
  }

  Widget _buildProgramRow(String channelId, int rowIndex) {
    return _GuideProgramRow(
      cells: _cellsForChannel(channelId),
      rowIndex: rowIndex,
      rowStates: _rowStates,
      selection: _selection,
      onVerticalMove: _moveSelectionVertically,
      onPageRows: _pageChannelRows,
      onNavigationKey: _onNavigationKey,
      onRowMounted: _scheduleApplyPendingVerticalMove,
      windowStart: _vm.windowStart,
      windowEnd: _vm.windowEnd,
      pixelsPerMinute: _layoutProfile.pixelsPerMinute,
      rowHeight: _layoutProfile.rowHeight,
      horizontalController: _guideHorizontalScrollController,
      apple: _apple,
      onLeftEdge: () => _onProgramLeftEdge(rowIndex),
      onRightEdge: () =>
          unawaited(_shiftGuideWindow(const Duration(minutes: 30))),
      noProgramDataLabel: AppLocalizations.of(context).noProgramData,
      filterLabel: _filterLabel,
      // Per A3: a gap or filtered hole tunes live, never opens the recording
      // dialog. Loading is inert. Failed has no retry producer yet.
      onProgramSelected: (cell) {
        switch (cell.kind) {
          case GuideCellKind.program:
            final program = cell.program;
            if (program == null) return;
            if (widget.miniPlayerMode) {
              _watchChannel(channelId);
            } else {
              _showProgramDetails(program);
            }
          case GuideCellKind.gap:
          case GuideCellKind.filtered:
            _watchChannel(channelId);
          case GuideCellKind.loading:
          case GuideCellKind.failed:
            break;
        }
      },
      onTopEdge: rowIndex == 0 ? _focusWindowBarFromGrid : null,
      onProgramFocused: (cell, _, _) {
        _channelRailFocused.value = false;
        _focusedProgram.value = cell.program;
        _focusedChannel.value = _vm.channelForId(channelId);
        _scrollToRow(rowIndex);
        final current = _selection;
        _selection = current == null
            ? GuideSelection(
                channelId: channelId,
                anchorTime: _seedAnchorInto(cell),
                programId: cell.program?.id,
              )
            : current.copyWith(
                channelId: channelId,
                programId: cell.program?.id,
                clearProgramId: cell.program == null,
              );
      },
      onHorizontalMove: _onHorizontalMove,
    );
  }

  void _onProgramLeftEdge(int rowIndex) {
    final liveStart = guideLeftEdge(DateTime.now());
    if (_vm.windowStart.isAfter(liveStart)) {
      unawaited(_shiftGuideWindow(const Duration(minutes: -30)));
      return;
    }
    _focusChannelRow(rowIndex);
  }

  /// Scrolls the guide the minimum distance needed to bring a cell on screen.
  void _ensureProgramVisible(double left, double width) {
    if (!_guideHorizontalScrollController.hasClients) return;
    final position = _guideHorizontalScrollController.position;
    final offset = position.pixels;
    final viewport = position.viewportDimension;
    final right = left + width;

    double? target;
    if (left < offset) {
      target = left - _kGuideScrollLead;
    } else if (right > offset + viewport) {
      // A cell wider than the viewport aligns on its leading edge instead.
      target = width > viewport
          ? left - _kGuideScrollLead
          : right + _kGuideScrollLead - viewport;
    }
    if (target == null) return;

    final clamped = target.clamp(0.0, position.maxScrollExtent);
    if (clamped == offset) return;
    _guideHorizontalScrollController.animateTo(
      clamped,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
    );
  }

  Future<void> _watchChannel(String channelId, {String? mediaSourceId}) async {
    unawaited(_prefs.set(UserPreferences.liveTvLastChannelId, channelId));
    if (widget.embedded && widget.onChannelSelected != null) {
      widget.onChannelSelected!(channelId);
      return;
    }
    if (widget.miniPlayerMode) {
      Navigator.of(context).pop(channelId);
      return;
    }

    final channels = _vm.filteredChannels;
    final index = channels.indexWhere((channel) => channel.id == channelId);
    if (index < 0) return;
    _vm.resetWindowOnExit(windowStart: guideLeftEdge(DateTime.now()));
    await context.push(
      Destinations.liveTvPlayer,
      extra: {
        'channels': channels,
        'startIndex': index,
        if (mediaSourceId != null) 'mediaSourceId': mediaSourceId,
      },
    );
    if (!mounted) return;
    await _vm.reloadIfStale(
      window: _layoutProfile.guideWindow,
      windowStart: guideLeftEdge(DateTime.now()),
    );
    if (!mounted) return;
    _vm.scheduleBoundaryRefresh();
    // The player may have switched channels (carousel) while it was up, so
    // the preference it kept current names the channel to restore focus to,
    // not the one this call originally launched.
    final restoredChannels = _vm.filteredChannels;
    var restoredIndex = restoredChannels.indexWhere(
      (channel) => channel.id == _homeChannelId,
    );
    if (restoredIndex < 0) {
      restoredIndex = restoredChannels.indexWhere(
        (channel) => channel.id == channelId,
      );
    }
    if (restoredIndex >= 0) _focusChannelRow(restoredIndex);
  }

  /// Fetches the channel's MediaSources on demand (guide rows don't carry
  /// them) and, if there's more than one, lets the user pick before tuning
  /// in. Falls back to a normal watch when there's nothing to choose from.
  Future<void> _pickVersionAndWatch(String channelId) async {
    List<Map<String, dynamic>> sources;
    try {
      final data = await _client.itemsApi.getItem(channelId);
      sources = AggregatedItem(
        id: channelId,
        serverId: _client.baseUrl,
        rawData: data,
      ).mediaSources;
    } catch (_) {
      sources = const [];
    }
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    if (sources.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.noAlternateVersions)),
      );
      return;
    }
    final result = await TrackSelectorDialog.show(
      context,
      title: l10n.selectVersion,
      options: sources.asMap().entries.map((entry) {
        final s = entry.value;
        final name =
            s['Name'] as String? ?? l10n.versionNumber(entry.key + 1);
        final bitrate = s['Bitrate'] as int?;
        final container = s['Container'] as String?;
        final subtitle = [
          if (container != null) container.toUpperCase(),
          if (bitrate != null) '${(bitrate / 1000000).toStringAsFixed(1)} Mbps',
        ].join(' | ');
        return TrackOption(
          label: name,
          subtitle: subtitle.isNotEmpty ? subtitle : null,
          labelMaxLines: null,
        );
      }).toList(),
      selectedIndex: 0,
    );
    if (result == null || result >= sources.length || !mounted) return;
    _watchChannel(channelId, mediaSourceId: sources[result]['Id']?.toString());
  }

  void _showProgramDetails(GuideProgram program) {
    _cancelPendingVerticalMove();
    final pageContext = context;
    final channel = _vm.channelForId(program.channelId);
    final isFavoriteChannel = channel?.isFavorite ?? false;
    final hasTimer = program.hasTimer;
    final hasSeriesTimer = program.hasSeriesTimer;
    final now = DateTime.now();
    // That airing is over. Only a future or currently-airing showing can still be recorded.
    final isEnded = now.isAfter(program.endDate);
    final isFuture = now.isBefore(program.startDate);
    // Airing right now with a timer set: the recording is in progress, so
    // cancelling it is the action the dialog was almost certainly opened for.
    final isRecordingNow = hasTimer && !isEnded && !isFuture;
    final l10n = AppLocalizations.of(context);
    var dialogActionInProgress = false;
    final defaultActionFocusNode = FocusNode(
      debugLabel: 'GuideProgramDialogDefaultAction',
    );
    var defaultActionFocusRequested = false;

    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) {
        if (!defaultActionFocusRequested) {
          defaultActionFocusRequested = true;
          // On TV a navigator observer hands a freshly pushed route's first
          // focusable the focus from a post-frame callback registered at push
          // time, which lands after `autofocus` resolves. Re-assert from a
          // later callback so the intended action keeps it.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (defaultActionFocusNode.context != null) {
              defaultActionFocusNode.requestFocus();
            }
          });
        }
        return AlertDialog.adaptive(
          backgroundColor: AppColorScheme.surface,
          title: Text(
            program.name,
            style: const TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${_formatTime(program.startDate)} – ${_formatTime(program.endDate)}',
                  style: const TextStyle(color: Colors.white70),
                ),
                if (program.episodeTitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    program.episodeTitle!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
                if (program.overview != null &&
                    program.overview!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    program.overview!,
                    style: const TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    if (program.isMovie)
                      Chip(
                        label: Text(l10n.movie),
                        visualDensity: VisualDensity.compact,
                      ),
                    if (program.isSeries)
                      Chip(
                        label: Text(l10n.series),
                        visualDensity: VisualDensity.compact,
                      ),
                    if (program.isSports)
                      Chip(
                        label: Text(l10n.sports),
                        visualDensity: VisualDensity.compact,
                      ),
                    if (program.isNews)
                      Chip(
                        label: Text(l10n.news),
                        visualDensity: VisualDensity.compact,
                      ),
                    if (program.isKids)
                      Chip(
                        label: Text(l10n.kids),
                        visualDensity: VisualDensity.compact,
                      ),
                    if (program.isPremiere)
                      Chip(
                        label: Text(l10n.premiere),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            // That airing is over. Single-episode recording no longer applies.
            if (!isEnded)
              adaptiveDialogAction(
                autofocus: isRecordingNow,
                focusNode: isRecordingNow ? defaultActionFocusNode : null,
                onPressed: () async {
                  if (dialogActionInProgress) return;
                  dialogActionInProgress = true;
                  try {
                    await _vm.toggleProgramRecording(program);
                    if (!pageContext.mounted || !dialogContext.mounted) return;
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(pageContext).showSnackBar(
                      SnackBar(
                        content: Text(
                          hasTimer
                              ? l10n.recordingCancelled
                              : l10n.programSetToRecord,
                        ),
                      ),
                    );
                  } catch (_) {
                    dialogActionInProgress = false;
                    if (!pageContext.mounted) return;
                    ScaffoldMessenger.of(pageContext).showSnackBar(
                      SnackBar(
                        content: Text(
                          hasTimer
                              ? l10n.failedToCancelRecording
                              : l10n.unableToCreateRecording,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  hasTimer ? l10n.cancelRecordingAction : l10n.record,
                ),
              ),
            if (program.isSeries)
              adaptiveDialogAction(
                onPressed: () async {
                  if (dialogActionInProgress) return;
                  dialogActionInProgress = true;
                  try {
                    await _vm.toggleSeriesRecording(program);
                    if (!pageContext.mounted || !dialogContext.mounted) return;
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(pageContext).showSnackBar(
                      SnackBar(
                        content: Text(
                          hasSeriesTimer
                              ? l10n.seriesRecordingCancelled
                              : l10n.seriesSetToRecord,
                        ),
                      ),
                    );
                  } catch (_) {
                    dialogActionInProgress = false;
                    if (!pageContext.mounted) return;
                    ScaffoldMessenger.of(pageContext).showSnackBar(
                      SnackBar(
                        content: Text(
                          hasSeriesTimer
                              ? l10n.failedToCancelSeriesRecording
                              : l10n.unableToCreateSeriesRecording,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  hasSeriesTimer
                      ? l10n.cancelSeriesRecording
                      : l10n.recordSeries,
                ),
              ),
            adaptiveDialogAction(
              onPressed: channel == null
                  ? null
                  : () async {
                      if (dialogActionInProgress) return;
                      dialogActionInProgress = true;
                      try {
                        await _vm.toggleChannelFavorite(program.channelId);
                        if (!pageContext.mounted || !dialogContext.mounted) {
                          return;
                        }
                        Navigator.of(dialogContext).pop();
                        ScaffoldMessenger.of(pageContext).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFavoriteChannel
                                  ? l10n.removedFromFavoriteChannels
                                  : l10n.addedToFavoriteChannels,
                            ),
                          ),
                        );
                      } catch (_) {
                        dialogActionInProgress = false;
                        if (!pageContext.mounted) return;
                        ScaffoldMessenger.of(pageContext).showSnackBar(
                          SnackBar(
                            content: Text(l10n.failedToUpdateFavoriteChannel),
                          ),
                        );
                      }
                    },
              child: Text(
                isFavoriteChannel
                    ? l10n.unfavoriteChannel
                    : l10n.favoriteChannel,
              ),
            ),
            adaptiveDialogAction(
              onPressed: () {
                if (dialogActionInProgress) return;
                dialogActionInProgress = true;
                Navigator.of(dialogContext).pop();
                unawaited(_pickVersionAndWatch(program.channelId));
              },
              child: Text(l10n.version),
            ),
            adaptiveDialogAction(
              autofocus: !isRecordingNow,
              focusNode: isRecordingNow ? null : defaultActionFocusNode,
              onPressed: () {
                if (dialogActionInProgress) return;
                dialogActionInProgress = true;
                Navigator.of(dialogContext).pop();
                _watchChannel(program.channelId);
              },
              // A future or ended showing won't itself play. The label says so.
              child: Text(
                isEnded || isFuture ? l10n.watchChannelLive : l10n.watch,
              ),
            ),
            adaptiveDialogAction(
              onPressed: () {
                if (dialogActionInProgress) return;
                dialogActionInProgress = true;
                Navigator.of(dialogContext).pop();
              },
              child: Text(l10n.close),
            ),
          ],
        );
      },
    ).whenComplete(defaultActionFocusNode.dispose);
  }
}

class _GuideGridView extends StatelessWidget {
  final List<GuideChannel> channels;
  final double guideWidth;
  final double rowHeight;
  final ScrollController verticalController;
  final ScrollController horizontalController;
  final Widget Function(String channelId, int rowIndex) buildProgramRow;

  const _GuideGridView({
    required this.channels,
    required this.guideWidth,
    required this.rowHeight,
    required this.verticalController,
    required this.horizontalController,
    required this.buildProgramRow,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: horizontalController,
      child: SizedBox(
        width: guideWidth,
        child: ListView.builder(
          controller: verticalController,
          itemCount: channels.length,
          itemExtent: rowHeight,
          itemBuilder: (context, index) {
            // Always the real row. An unloaded channel's `loading` cell carries
            // the loading treatment and stays focusable.
            return SizedBox(
              key: ValueKey(channels[index].id),
              width: guideWidth,
              height: rowHeight,
              child: buildProgramRow(channels[index].id, index),
            );
          },
        ),
      ),
    );
  }
}

class _GuidePillButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;
  final bool compact;

  const _GuidePillButton({
    this.label,
    this.icon,
    this.onPressed,
    this.focusNode,
    this.onKeyEvent,
    this.compact = false,
  });

  @override
  State<_GuidePillButton> createState() => _GuidePillButtonState();
}

class _GuidePillButtonState extends State<_GuidePillButton> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final active = _focused;
    return _GuideFocusableSurface(
      focusNode: widget.focusNode,
      onKeyEvent: widget.onKeyEvent,
      onPressed: widget.onPressed,
      onFocusChange: (focused) {
        if (_focused != focused) setState(() => _focused = focused);
      },
      borderRadius: AppRadius.circular(20),
      builder: (_) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: widget.compact
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 5)
            : const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: active
              ? AppColorScheme.accent.withValues(alpha: _focused ? 1.0 : 0.7)
              : Colors.white.withValues(alpha: 0.10),
          borderRadius: AppRadius.circular(20),
        ),
        child: _buildChild(active),
      ),
    );
  }

  Widget _buildChild(bool active) {
    final color = Colors.white.withValues(alpha: active ? 1.0 : 0.8);
    if (widget.icon != null && widget.label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(widget.label!, style: TextStyle(color: color, fontSize: 13)),
        ],
      );
    }
    if (widget.icon != null) {
      return Icon(widget.icon, color: color, size: 18);
    }
    return Text(
      widget.label ?? '',
      style: TextStyle(color: color, fontSize: 13),
    );
  }
}

class _GuideFocusableSurface extends StatefulWidget {
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onFocusChange;
  final Widget Function(bool focused) builder;
  final BorderRadiusGeometry? borderRadius;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;

  const _GuideFocusableSurface({
    required this.builder,
    this.onPressed,
    this.onFocusChange,
    this.borderRadius,
    this.focusNode,
    this.onKeyEvent,
  });

  @override
  State<_GuideFocusableSurface> createState() => _GuideFocusableSurfaceState();
}

class _GuideFocusableSurfaceState extends State<_GuideFocusableSurface> {
  FocusNode? _ownedFocusNode;
  bool _focused = false;

  FocusNode get _focusNode =>
      widget.focusNode ?? (_ownedFocusNode ??= FocusNode());

  @override
  void dispose() {
    _ownedFocusNode?.dispose();
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final override = widget.onKeyEvent?.call(node, event);
    if (override != null && override != KeyEventResult.ignored) {
      return override;
    }
    final onPressed = widget.onPressed;
    if (onPressed == null) return KeyEventResult.ignored;
    return handleOneShotSelect(event, onPressed);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.builder(_focused);
    if (widget.borderRadius != null) {
      child = ClipRRect(borderRadius: widget.borderRadius!, child: child);
    }

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      onFocusChange: (focused) {
        if (_focused != focused) {
          setState(() => _focused = focused);
        }
        widget.onFocusChange?.call(focused);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onPressed,
        child: child,
      ),
    );
  }
}

class _GuideProgramRow extends StatefulWidget {
  final List<GuideCell> cells;
  final int rowIndex;

  /// The screen's registry of mounted rows. This row adds and removes itself.
  final Map<int, _GuideProgramRowState> rowStates;

  /// Null until the first cell takes focus.
  final GuideSelection? selection;
  final void Function(int fromRowIndex, int delta) onVerticalMove;

  /// Pages whole channel rows. Like any vertical move it preserves the anchor.
  final void Function(int fromRowIndex, int direction) onPageRows;

  /// Fired before any arrow key is acted on, so a deferred move the user has
  /// moved past can be dropped.
  final VoidCallback onNavigationKey;

  /// Fired when this row registers itself, so a move deferred on an unmounted
  /// row can complete.
  final VoidCallback onRowMounted;
  final DateTime windowStart;
  final DateTime windowEnd;
  final double pixelsPerMinute;
  final double rowHeight;
  final ScrollController horizontalController;
  final bool apple;
  final VoidCallback? onLeftEdge;
  final VoidCallback? onRightEdge;
  final VoidCallback? onTopEdge;
  final ValueChanged<GuideCell> onProgramSelected;
  final void Function(GuideCell cell, double left, double width)
  onProgramFocused;
  final void Function(GuideCell cell, double left, double width)?
  onHorizontalMove;

  /// Label for a real schedule gap. A genre-filtered hole never shows it.
  final String noProgramDataLabel;
  final String Function(GuideFilter) filterLabel;

  const _GuideProgramRow({
    required this.cells,
    required this.rowIndex,
    required this.rowStates,
    required this.selection,
    required this.onVerticalMove,
    required this.onPageRows,
    required this.onNavigationKey,
    required this.onRowMounted,
    required this.windowStart,
    required this.windowEnd,
    required this.pixelsPerMinute,
    required this.rowHeight,
    required this.horizontalController,
    required this.apple,
    this.onLeftEdge,
    this.onRightEdge,
    this.onTopEdge,
    required this.onProgramSelected,
    required this.onProgramFocused,
    this.onHorizontalMove,
    required this.noProgramDataLabel,
    required this.filterLabel,
  });

  @override
  State<_GuideProgramRow> createState() => _GuideProgramRowState();
}

class _GuideProgramRowState extends State<_GuideProgramRow> {
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _syncFocusNodes();
    widget.rowStates[widget.rowIndex] = this;
    widget.onRowMounted();
  }

  @override
  void didUpdateWidget(covariant _GuideProgramRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    final focused = _focusNodes.indexWhere((node) => node.hasFocus);
    if (oldWidget.rowIndex != widget.rowIndex) {
      if (widget.rowStates[oldWidget.rowIndex] == this) {
        widget.rowStates.remove(oldWidget.rowIndex);
      }
      widget.rowStates[widget.rowIndex] = this;
    }
    if (oldWidget.cells.length != widget.cells.length) {
      _syncFocusNodes();
    }
    if (_cellsDiffer(oldWidget.cells, widget.cells)) {
      _reresolveFocus(focused);
    }
  }

  /// Re-binds focus to the selected program after a data change, so a
  /// same-length refresh can't leave focus on a different show.
  void _reresolveFocus(int focused) {
    if (focused < 0) return;
    final selection = widget.selection;
    if (selection == null || widget.cells.isEmpty) return;

    final programId = selection.programId;
    var target = programId == null
        ? -1
        : widget.cells.indexWhere((cell) => cell.program?.id == programId);
    if (target < 0) {
      target = resolveCellIndexAt(widget.cells, selection.anchorTime);
    }
    if (target == focused) return;
    _focusNodes[target].requestFocus();
  }

  static bool _cellsDiffer(List<GuideCell> a, List<GuideCell> b) {
    if (a.length != b.length) return true;
    for (var i = 0; i < a.length; i++) {
      if (a[i].start != b[i].start ||
          a[i].end != b[i].end ||
          a[i].program?.id != b[i].program?.id) {
        return true;
      }
    }
    return false;
  }

  /// Focuses one of this row's cells on the screen's behalf. The nodes are
  /// private to this state.
  void focusCellAt(int index) {
    if (index < 0 || index >= _focusNodes.length) return;
    _focusNodes[index].requestFocus();
  }

  void _syncFocusNodes() {
    while (_focusNodes.length < widget.cells.length) {
      _focusNodes.add(
        FocusNode(
          debugLabel: 'GuideProgramRow${widget.rowIndex}:${_focusNodes.length}',
        ),
      );
    }
    while (_focusNodes.length > widget.cells.length) {
      _focusNodes.removeLast().dispose();
    }
  }

  @override
  void dispose() {
    if (widget.rowStates[widget.rowIndex] == this) {
      widget.rowStates.remove(widget.rowIndex);
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  KeyEventResult _handleProgramKeyEvent(
    int index,
    FocusNode node,
    KeyEvent event,
  ) {
    final selected = handleOneShotSelect(event, () {
      widget.onProgramSelected(widget.cells[index]);
    });
    if (selected != KeyEventResult.ignored) return selected;
    if (!event.isActionable) return KeyEventResult.ignored;

    final key = event.logicalKey;
    final pageDirection = _pageRowDirection(key);
    if (pageDirection != 0) {
      widget.onNavigationKey();
      widget.onPageRows(widget.rowIndex, pageDirection);
      return KeyEventResult.handled;
    }
    if (key.isLeftKey || key.isRightKey || key.isUpKey || key.isDownKey) {
      widget.onNavigationKey();
    }
    if (key.isLeftKey) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
        _notifyHorizontalMove(index - 1);
        return KeyEventResult.handled;
      }
      if (widget.onLeftEdge != null) {
        widget.onLeftEdge!();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    if (key.isRightKey) {
      if (index < _focusNodes.length - 1) {
        _focusNodes[index + 1].requestFocus();
        _notifyHorizontalMove(index + 1);
        return KeyEventResult.handled;
      }
      if (widget.onRightEdge != null) {
        widget.onRightEdge!();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    if (key.isUpKey) {
      // The row-0 exit takes precedence over the vertical move.
      if (widget.onTopEdge != null) {
        widget.onTopEdge!();
        return KeyEventResult.handled;
      }
      widget.onVerticalMove(widget.rowIndex, -1);
      return KeyEventResult.handled;
    }
    if (key.isDownKey) {
      // Consumed even when refused, so directional traversal can't pick a
      // cell by geometry and drift the selection in time.
      widget.onVerticalMove(widget.rowIndex, 1);
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _notifyHorizontalMove(int index) {
    final geometry = _cellGeometry(index);
    widget.onHorizontalMove?.call(
      widget.cells[index],
      geometry.left,
      geometry.width,
    );
  }

  /// The single source of a cell's timeline geometry. `buildRowCells` already
  /// clips every cell to the window, so no clamping is needed here.
  ({double left, double width}) _cellGeometry(int index) {
    final cell = widget.cells[index];
    final startMinutes =
        cell.start.difference(widget.windowStart).inMicroseconds /
        Duration.microsecondsPerMinute;
    final endMinutes =
        cell.end.difference(widget.windowStart).inMicroseconds /
        Duration.microsecondsPerMinute;
    return (
      left: startMinutes * widget.pixelsPerMinute,
      width: (endMinutes - startMinutes) * widget.pixelsPerMinute,
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: ThemeRegistry.active.borders.cardBorder),
      ),
      child: Stack(
        children: [
          for (var index = 0; index < widget.cells.length; index++)
            _buildProgramCell(index, widget.cells[index], now),
        ],
      ),
    );
  }

  Widget _buildProgramCell(int index, GuideCell cell, DateTime now) {
    final geometry = _cellGeometry(index);
    final left = geometry.left;
    final width = geometry.width;

    if (width <= 0) return const SizedBox.shrink();

    final program = cell.program;
    final isLive =
        program != null &&
        now.isAfter(program.startDate) &&
        now.isBefore(program.endDate);

    final cellWidget = _GuideFocusableSurface(
      focusNode: _focusNodes[index],
      onPressed: () => widget.onProgramSelected(cell),
      onKeyEvent: (node, event) => _handleProgramKeyEvent(index, node, event),
      onFocusChange: (focused) {
        if (!focused) return;
        widget.onProgramFocused(cell, left, width);
      },
      builder: (focused) => ListenableBuilder(
        listenable: widget.horizontalController,
        builder: (_, _) => EpgProgramCell(
          title: program?.name ?? '',
          rating: program?.officialRating,
          tags:
              program?.categoryTags.map(widget.filterLabel).toList() ??
              const [],
          // The geometry clips a cell to the window, so the program's own
          // start is the only thing that says it began before the left edge.
          startsBeforeWindow:
              program != null && program.startDate.isBefore(widget.windowStart),
          genre: program == null
              ? EpgGenre('', AppColorScheme.onSurface.withValues(alpha: 0.18))
              : epgGenreFor(program),
          isLive: isLive,
          isPast: program != null && program.endDate.isBefore(now),
          progress: isLive ? program.progressAt(now) : 0,
          hasTimer: program?.hasTimer ?? false,
          focused: focused,
          apple: widget.apple,
          placeholderLabel: cell.kind == GuideCellKind.gap
              ? widget.noProgramDataLabel
              : null,
          loading: cell.kind == GuideCellKind.loading,
          failed: cell.kind == GuideCellKind.failed,
          textLeftPadding: _textLeftPadding(left, width),
        ),
      ),
    );

    return Positioned(
      left: left,
      width: width,
      top: 2,
      bottom: 2,
      child: Padding(
        padding: const EdgeInsets.only(right: 1),
        child: cellWidget,
      ),
    );
  }

  double _textLeftPadding(double left, double width) {
    if (!widget.horizontalController.hasClients) return 0;
    final maxInset = (width - 20).clamp(0.0, width);
    return (widget.horizontalController.offset - left).clamp(0.0, maxInset);
  }
}
