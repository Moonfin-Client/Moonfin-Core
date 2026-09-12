import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:server_core/server_core.dart';

import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../screens/livetv/epg/epg_genre.dart';
import '../../screens/livetv/guide/guide_window.dart';
import 'channel_carousel.dart';
import 'channel_carousel_card.dart';

/// How long the strip takes to slide up into place.
const Duration kCarouselEnterDuration = Duration(milliseconds: 180);

/// The way out is a touch quicker than the way in, so dismissal never feels
/// like it is holding the picture back.
const Duration kCarouselExitDuration = Duration(milliseconds: 140);

/// Viewport capacity assumed before the strip has been laid out once.
const int _defaultVisibleCards = 5;

/// The run of channels around [centeredId] the strip can show, wrapping at
/// both ends. Shared so a warm fetch asks for exactly what an open one would.
List<String> carouselNeighborhood(
  List<GuideChannel> channels,
  String centeredId,
  int visibleCards,
) {
  if (channels.isEmpty) return const [];
  final center = math.max(
    0,
    channels.indexWhere((channel) => channel.id == centeredId),
  );
  final radius = (visibleCards / 2).ceil() + 1;
  return {
    for (var offset = -radius; offset <= radius; offset++)
      channels[(center + offset) % channels.length].id,
  }.toList();
}

/// Keeps the channel changer's guide data loaded while the overlay is closed,
/// so the first UP press opens onto real cards instead of skeletons.
///
/// Data only: presentation entries are still built from `build`, where the
/// localisations `TimeOfDay.format` needs are available. Warming them here
/// would mean formatting off a context the holder does not have, and the
/// entries a closed overlay could produce are mostly placeholders that the
/// neighbourhood fetch invalidates a moment later anyway.
class ChannelCarouselPrewarm {
  /// A tune is often one step of channel surfing, so the neighbourhood fetch
  /// waits for the lineup to settle rather than firing once per step.
  static const Duration settleDelay = Duration(seconds: 1);

  final LiveTvGuideViewModel viewModel;

  Timer? _timer;
  Future<void>? _inFlight;
  bool _disposed = false;

  /// True while an overlay is mounted on this view model. It drives its own
  /// neighbourhood loads then, and a warm fetch underneath could reset them.
  bool _inUse = false;

  ChannelCarouselPrewarm(
    MediaServerClient client, {
    LiveTvGuideViewModel Function(MediaServerClient)? viewModelFactory,
  }) : viewModel =
           viewModelFactory?.call(client) ?? LiveTvGuideViewModel(client);

  /// True once the lineup and the tuned channel's neighbourhood are resident,
  /// which is what lets the overlay mount already showing cards.
  bool get isWarm => viewModel.state == GuideState.ready;

  /// Called by the overlay around its own lifetime, so warming stands aside
  /// while the open changer owns the fetching.
  void adopt() => _inUse = true;

  void release() => _inUse = false;

  /// Called when a channel is tuned. Idempotent: an already-cached
  /// neighbourhood costs nothing beyond the set arithmetic.
  void tuned(List<GuideChannel> channels, String channelId) {
    if (_disposed || channels.isEmpty) return;
    _timer?.cancel();
    _timer = Timer(settleDelay, () => unawaited(_warm(channels, channelId)));
  }

  Future<void> _warm(List<GuideChannel> channels, String channelId) async {
    if (_disposed || _inUse || _inFlight != null) return;
    final sorted = List.of(channels)
      ..sort(LiveTvGuideViewModel.comparatorFor(viewModel.sortBy));
    final ids = carouselNeighborhood(sorted, channelId, _defaultVisibleCards);
    if (ids.isEmpty) return;
    // A first warm fetches the lineup too; later ones only top up the
    // programmes the shifted neighbourhood is missing.
    final work = isWarm
        ? viewModel.ensureProgramsForChannels(ids)
        : viewModel.load(
            initialChannelIds: ids,
            windowStart: guideLeftEdge(DateTime.now()),
            livePosition: true,
          );
    _inFlight = work;
    try {
      await work;
    } catch (_) {
      // A warm that fails simply leaves the overlay to load on open.
    } finally {
      _inFlight = null;
    }
  }

  void dispose() {
    _disposed = true;
    _timer?.cancel();
    viewModel.cancelBoundaryRefresh();
    viewModel.dispose();
  }
}

/// Owns the carousel's guide data and timers while video remains behind it.
class ChannelCarouselOverlay extends StatefulWidget {
  final MediaServerClient client;
  final List<GuideChannel> channels;
  final String currentChannelId;
  final int selectionRevision;
  final ValueChanged<String> onChannelSelected;
  final VoidCallback onDismiss;
  final VoidCallback onShowControls;
  final Duration inactivityDuration;
  final LiveTvGuideViewModel Function(MediaServerClient)? viewModelFactory;

  /// Guide data warmed at tune time. When supplied the overlay adopts it and
  /// does not dispose it; the host that warmed it owns its lifetime.
  final ChannelCarouselPrewarm? prewarm;

  const ChannelCarouselOverlay({
    super.key,
    required this.client,
    required this.channels,
    required this.currentChannelId,
    this.selectionRevision = 0,
    required this.onChannelSelected,
    required this.onDismiss,
    required this.onShowControls,
    this.inactivityDuration = const Duration(minutes: 2),
    this.viewModelFactory,
    this.prewarm,
  });

  @override
  State<ChannelCarouselOverlay> createState() => _ChannelCarouselOverlayState();
}

class _ChannelCarouselOverlayState extends State<ChannelCarouselOverlay>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  static const _debounce = Duration(milliseconds: 200);

  /// How often live progress and the current programme are re-evaluated.
  static const _clockTick = Duration(seconds: 20);

  /// The header reserves room for its four lines whether or not the centred
  /// programme fills them, so the strip never shifts as the selection moves.
  /// Measuring the lines rather than guessing a fixed height keeps that
  /// promise without leaving a band of empty scrim above the cards.
  static const EdgeInsets _headerPadding = EdgeInsets.fromLTRB(16, 6, 16, 0);
  static const double _titleGap = 2;
  static const double _overviewGap = 4;
  static const int _overviewLines = 2;

  static const TextStyle _titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _metaStyle = TextStyle(
    color: Colors.white70,
    fontSize: 13,
  );
  static const TextStyle _overviewStyle = TextStyle(
    color: Colors.white60,
    fontSize: 13,
    height: 1.2,
  );
  late final LiveTvGuideViewModel _vm;

  /// False when the view model came from a prewarm holder, which owns it.
  late final bool _ownsViewModel;
  late final AnimationController _slide;
  late final Animation<Offset> _offset;
  late List<GuideChannel> _channels;

  /// Presentation entries, recomputed only when the guide data or the clock
  /// moves. Building them per frame made every debounced `setState` walk the
  /// whole lineup, reformatting times and image URLs it already had.
  List<ChannelCarouselEntry> _entries = const [];
  bool _entriesDirty = true;
  late String _centeredId;
  Timer? _headerTimer;
  Timer? _loadTimer;
  Timer? _hideTimer;
  Timer? _clockTimer;
  Timer? _quarterTimer;
  GuideProgram? _headerProgram;
  GuideChannel? _headerChannel;
  int _visibleCards = _defaultVisibleCards;
  bool _scrolling = false;
  bool _ready = false;
  bool _dismissed = false;
  bool _loadingVisible = false;
  bool _loadAgain = false;
  final FocusNode _overlayFocus = FocusNode(
    debugLabel: 'ChannelCarouselOverlay',
  );

  @override
  void initState() {
    super.initState();
    final warm = widget.prewarm;
    _ownsViewModel = warm == null;
    _vm =
        warm?.viewModel ??
        widget.viewModelFactory?.call(widget.client) ??
        LiveTvGuideViewModel(widget.client);
    _slide = AnimationController(
      vsync: this,
      duration: kCarouselEnterDuration,
      reverseDuration: kCarouselExitDuration,
    );
    _offset = Tween(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _slide,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      ),
    );
    _slide.addStatusListener(_onSlideStatus);
    _slide.forward();
    _channels = List.of(widget.channels)
      ..sort(LiveTvGuideViewModel.comparatorFor(_vm.sortBy));
    _centeredId = widget.currentChannelId;
    if (_channels.isNotEmpty &&
        !_channels.any((channel) => channel.id == _centeredId)) {
      _centeredId = _channels.first.id;
    }
    // Warm data is adopted by assignment only. Nothing here builds entries, so
    // no localised formatting runs before the first build has a context.
    if (warm?.isWarm == true) _adoptWarmChannels();
    warm?.adopt();
    _vm.addListener(_onDataChanged);
    WidgetsBinding.instance.addObserver(this);
    _resetInactivity();
    _vm.scheduleBoundaryRefresh();
    _clockTimer = Timer.periodic(_clockTick, (_) {
      if (mounted) setState(_invalidateEntries);
    });
    _scheduleQuarterRefresh();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _overlayFocus.canRequestFocus) {
        _overlayFocus.requestFocus();
      }
    });
    if (_ready) {
      // Already warm: top up only what the neighbourhood is missing.
      _scheduleHeader();
      _scheduleVisibleLoad();
    } else {
      unawaited(_load());
    }
  }

  /// Takes the lineup straight off the warmed view model so the first frame
  /// renders real cards. Field assignment only, so it is safe in `initState`.
  void _adoptWarmChannels() {
    final playbackIds = widget.channels.map((channel) => channel.id).toSet();
    final warmed = _vm.filteredChannels
        .where((channel) => playbackIds.contains(channel.id))
        .toList();
    if (warmed.isEmpty) return;
    _channels = warmed;
    if (!_channels.any((channel) => channel.id == _centeredId)) {
      _centeredId = _channels.first.id;
    }
    // Both lookups are context-free, so the header is on screen from the
    // first frame instead of after the debounce.
    _headerChannel = _vm.channelForId(_centeredId);
    _headerProgram = _currentProgram(_centeredId);
    _ready = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _invalidateEntries();
  }

  @override
  void didUpdateWidget(covariant ChannelCarouselOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentChannelId == widget.currentChannelId &&
        oldWidget.selectionRevision == widget.selectionRevision) {
      return;
    }
    if (!_channels.any((channel) => channel.id == widget.currentChannelId)) {
      return;
    }
    _centeredId = widget.currentChannelId;
    _scheduleHeader();
    _scheduleVisibleLoad();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _headerTimer?.cancel();
    _loadTimer?.cancel();
    _hideTimer?.cancel();
    _clockTimer?.cancel();
    _quarterTimer?.cancel();
    _vm.removeListener(_onDataChanged);
    _vm.cancelBoundaryRefresh();
    widget.prewarm?.release();
    if (_ownsViewModel) _vm.dispose();
    _slide.dispose();
    _overlayFocus.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _vm.scheduleBoundaryRefresh();
      _scheduleQuarterRefresh();
      _scheduleHeader();
      setState(_invalidateEntries);
    }
  }

  Future<void> _load() async {
    await _vm.load(
      initialChannelIds: _neighborhood(),
      windowStart: guideLeftEdge(DateTime.now()),
      livePosition: true,
    );
    if (!mounted) return;
    final playbackIds = widget.channels.map((channel) => channel.id).toSet();
    setState(() {
      _channels = _vm.filteredChannels
          .where((channel) => playbackIds.contains(channel.id))
          .toList();
      _ready = true;
      if (_channels.isNotEmpty &&
          !_channels.any((channel) => channel.id == _centeredId)) {
        _centeredId = _channels.first.id;
      }
      _invalidateEntries();
    });
    if (_channels.isEmpty) {
      _dismiss();
      return;
    }
    _vm.scheduleBoundaryRefresh();
    _scheduleHeader();
    _scheduleVisibleLoad();
  }

  List<String> _neighborhood() =>
      carouselNeighborhood(_channels, _centeredId, _visibleCards);

  void _onDataChanged() {
    if (!mounted) return;
    setState(_invalidateEntries);
    if (_ready) _scheduleHeader();
  }

  void _invalidateEntries() => _entriesDirty = true;

  /// Rebuilt lazily from `build`, where localisations are available, with one
  /// `now` for the whole lineup. The list identity is stable between data
  /// changes, which is what lets the strip reuse its card widgets.
  List<ChannelCarouselEntry> get _currentEntries {
    if (!_entriesDirty) return _entries;
    _entriesDirty = false;
    // Quantised to the clock tick that is meant to refresh the strip, so a
    // rebuild between ticks produces entries equal to the ones it replaces.
    final now = _tickAlignedNow();
    var changed = _entries.length != _channels.length;
    final next = <ChannelCarouselEntry>[];
    for (var i = 0; i < _channels.length; i++) {
      final fresh = _entry(_channels[i], now);
      final previous = i < _entries.length ? _entries[i] : null;
      if (previous != null && previous == fresh) {
        next.add(previous);
      } else {
        changed = true;
        next.add(fresh);
      }
    }
    // An unchanged lineup keeps its list identity, which is what lets the
    // strip reuse every built card instead of rebuilding the visible run.
    if (changed) _entries = next;
    return _entries;
  }

  static DateTime _tickAlignedNow() {
    final now = DateTime.now();
    final seconds = now.second - now.second % _clockTick.inSeconds;
    return DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
      seconds,
    );
  }

  void _centered(int index) {
    _centeredId = _channels[index].id;
    _clearHeader();
    _scheduleHeader();
    _scheduleVisibleLoad();
  }

  void _clearHeader() {
    if (!mounted || (_headerChannel == null && _headerProgram == null)) return;
    setState(() {
      _headerChannel = null;
      _headerProgram = null;
    });
  }

  /// A hold repeats faster than [_debounce], so a sustained one would never
  /// let the debounce fire and would scroll into permanently unloaded
  /// territory. Landing on a channel with nothing cached forces a fetch
  /// instead, at most this often.
  static const _blindThrottle = Duration(milliseconds: 500);
  DateTime? _lastBlindLoad;

  void _scheduleVisibleLoad() {
    _loadTimer?.cancel();
    if (_ready && _vm.unfilteredProgramsForChannel(_centeredId).isEmpty) {
      final now = DateTime.now();
      final last = _lastBlindLoad;
      if (last == null || now.difference(last) >= _blindThrottle) {
        _lastBlindLoad = now;
        unawaited(_loadVisible());
        return;
      }
    }
    _loadTimer = Timer(_debounce, () => unawaited(_loadVisible()));
  }

  Future<void> _loadVisible() async {
    if (!_ready || !mounted) return;
    if (_loadingVisible) {
      _loadAgain = true;
      return;
    }
    _loadingVisible = true;
    try {
      await _vm.ensureProgramsForChannels(_neighborhood());
      if (mounted) _vm.scheduleBoundaryRefresh();
    } catch (_) {
      // Keep cached cards when a newly visible channel cannot be loaded.
    } finally {
      _loadingVisible = false;
      if (mounted && _loadAgain) {
        _loadAgain = false;
        _scheduleVisibleLoad();
      }
    }
  }

  void _scheduleQuarterRefresh() {
    _quarterTimer?.cancel();
    final now = DateTime.now();
    final next = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      (now.minute ~/ 15 + 1) * 15,
    );
    _quarterTimer = Timer(next.difference(now), () {
      unawaited(_vm.refreshAtQuarterHour());
      _scheduleQuarterRefresh();
    });
  }

  void _scheduleHeader() {
    _headerTimer?.cancel();
    _headerTimer = Timer(_debounce, () {
      if (_scrolling) {
        _scheduleHeader();
        return;
      }
      setState(() {
        _headerChannel = _vm.channelForId(_centeredId);
        _headerProgram = _currentProgram(_centeredId);
      });
    });
  }

  bool _onScroll(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.horizontal) return false;
    if (notification is ScrollStartNotification) {
      _scrolling = true;
      _clearHeader();
      _scheduleHeader();
    } else if (notification is ScrollEndNotification) {
      _scrolling = false;
      _scheduleHeader();
    }
    return false;
  }

  void _resetInactivity() {
    _hideTimer?.cancel();
    if (!_dismissed) _hideTimer = Timer(widget.inactivityDuration, _dismiss);
  }

  /// Reverses the entrance before handing back to the host. The overlay stays
  /// mounted and focused throughout, so the back key-up that follows the
  /// key-down it consumed is swallowed here rather than reaching the route;
  /// the host's own suppression window then covers the unmounted case.
  void _dismiss() {
    if (_dismissed) return;
    _dismissed = true;
    _hideTimer?.cancel();
    _slide.reverse();
  }

  /// The host is told only once the strip has left the screen, so the overlay
  /// keeps focus — and keeps eating the trailing back key-up — until then.
  void _onSlideStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed && _dismissed && mounted) {
      widget.onDismiss();
    }
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    _resetInactivity();
    if (event.logicalKey.isBackKey) {
      if (event is KeyDownEvent) _dismiss();
      return KeyEventResult.handled;
    }
    if (event.logicalKey.isDownKey) {
      if (event is KeyDownEvent) {
        _dismissed = true;
        _hideTimer?.cancel();
        widget.onShowControls();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  GuideProgram? _currentProgram(String channelId, [DateTime? at]) {
    final now = at ?? DateTime.now();
    for (final program in _vm.unfilteredProgramsForChannel(channelId)) {
      if (!now.isBefore(program.startDate) && now.isBefore(program.endDate)) {
        return program;
      }
    }
    return null;
  }

  /// [GuideFilter] is localised here, at the UI edge, so the data layer stays
  /// language-free.
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

  List<String> _categoryLabels(GuideProgram program) => [
    for (final tag in program.categoryTags) _filterLabel(tag),
  ];

  String _timeRange(GuideProgram program) =>
      '${TimeOfDay.fromDateTime(program.startDate).format(context)} - '
      '${TimeOfDay.fromDateTime(program.endDate).format(context)}';

  ChannelCarouselEntry _entry(GuideChannel channel, DateTime now) {
    final program = _currentProgram(channel.id, now);
    return ChannelCarouselEntry(
      channelId: channel.id,
      channelNumber: channel.number,
      channelName: channel.name,
      logoUrl: channel.imageTag == null
          ? null
          : _vm.imageApi.getPrimaryImageUrl(
              channel.id,
              maxHeight: 80,
              tag: channel.imageTag,
            ),
      isFavorite: channel.isFavorite,
      programTitle: program?.name,
      timeLabel: program == null ? null : _timeRange(program),
      rating: program?.officialRating,
      tags: program == null ? const [] : _categoryLabels(program),
      genre: program == null ? null : epgGenreFor(program),
      isLive: program != null,
      progress: program?.progressAt(now) ?? 0,
      hasTimer: program?.hasTimer == true || program?.hasSeriesTimer == true,
      programLoading:
          program == null &&
          _vm.loadStateFor(channel.id) != GuideChannelLoadState.loaded,
    );
  }

  /// Height the four header lines occupy. The header styles name no font, so
  /// the theme's family decides the line boxes and belongs in the key: a pixel
  /// theme lays out taller than the default one. Cached because laying out
  /// three `TextPainter`s on every debounced rebuild would cost more than the
  /// header does.
  static final Map<(TextScaler, TextStyle, TextStyle, TextStyle), double>
  _headerExtents = {};

  static double _headerExtent(BuildContext context) {
    final base = DefaultTextStyle.of(context).style;
    final scaler = MediaQuery.textScalerOf(context);
    final title = base.merge(_titleStyle);
    final meta = base.merge(_metaStyle);
    final overview = base.merge(_overviewStyle);
    return _headerExtents[(scaler, title, meta, overview)] ??=
        _headerPadding.vertical +
        _lineHeight(title, scaler) +
        _titleGap +
        _lineHeight(meta, scaler) +
        _overviewGap +
        _overviewLines * _lineHeight(overview, scaler);
  }

  static double _lineHeight(TextStyle style, TextScaler scaler) {
    final painter = TextPainter(
      text: TextSpan(text: 'Ag', style: style),
      textDirection: TextDirection.ltr,
      textScaler: scaler,
      maxLines: 1,
    )..layout();
    final height = painter.height.ceilToDouble();
    painter.dispose();
    return height;
  }

  Widget _header() {
    final channel = _headerChannel;
    final program = _headerProgram;
    if (channel == null) return const SizedBox.shrink();
    final season = program?.rawData['ParentIndexNumber'];
    final episode = program?.rawData['IndexNumber'];
    final suffix = season != null && episode != null
        ? ' (S$season:E$episode)'
        : '';
    // Some sources repeat the programme name as the episode title; showing it
    // twice reads as a glitch.
    final episodeTitle = program?.episodeTitle;
    final episodeName =
        episodeTitle != null &&
            episodeTitle.isNotEmpty &&
            episodeTitle != program?.name
        ? ' - $episodeTitle'
        : '';
    // No panel of its own: the description and the strip read as one block
    // over the overlay scrim, which is what carries legibility here.
    return Container(
      key: const ValueKey('carousel-program-header'),
      width: double.infinity,
      padding: _headerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${program?.name ?? channel.name}$episodeName$suffix',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _titleStyle,
          ),
          const SizedBox(height: _titleGap),
          Text(
            [
              // Channel number and call sign are on the focused card already.
              if (program != null) _timeRange(program),
              if (program?.officialRating?.trim() case final String rating
                  when rating.isNotEmpty)
                rating,
              if (program != null) ..._categoryLabels(program),
            ].join(' · '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _metaStyle,
          ),
          if (program?.overview case final String overview) ...[
            const SizedBox(height: _overviewGap),
            Text(
              overview,
              maxLines: _overviewLines,
              overflow: TextOverflow.ellipsis,
              style: _overviewStyle,
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Focus(
    focusNode: _overlayFocus,
    onKeyEvent: _onKey,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _offset,
        child: Container(
          // 24 dp of bottom margin sits inside the 5% TV overscan allowance
          // (27 dp of a 540 dp viewport) while dropping the whole overlay
          // closer to the screen edge.
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          decoration: BoxDecoration(
            // Reaches most of its darkness by the time it is behind the
            // description, which no longer carries a panel of its own.
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.28, 1.0],
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.82),
                Colors.black.withValues(alpha: 0.94),
              ],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final visible = ChannelCarouselCard.layoutFor(
                constraints.maxWidth,
              ).count;
              if (_visibleCards != visible) {
                _visibleCards = visible;
                _scheduleVisibleLoad();
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: _headerExtent(context), child: _header()),
                  const SizedBox(height: 12),
                  if (_ready && _channels.isNotEmpty)
                    NotificationListener<ScrollNotification>(
                      onNotification: _onScroll,
                      child: ChannelCarousel(
                        channels: _currentEntries,
                        selectionRevision: widget.selectionRevision,
                        initialIndex: math.max(
                          0,
                          _channels.indexWhere(
                            (channel) => channel.id == _centeredId,
                          ),
                        ),
                        onChannelCentered: _centered,
                        onChannelSelected: (entry) =>
                            widget.onChannelSelected(entry.channelId),
                        onBack: _dismiss,
                        onKeyInteraction: _resetInactivity,
                      ),
                    )
                  else
                    const SizedBox(height: ChannelCarousel.stripHeight),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
}
