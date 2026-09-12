import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../util/focus/dpad_keys.dart';
import '../../screens/livetv/epg/epg_genre.dart';
import 'channel_carousel_card.dart';
import 'channel_carousel_controller.dart';

/// First hold-repeat fires this long after key-down, so a deliberate single
/// press moves exactly one channel.
const Duration kCarouselHoldStartDelay = Duration(milliseconds: 350);

/// Subsequent hold-repeats fire at this interval — roughly nine channels a
/// second, which reads as fast continuous scrolling rather than stepping.
const Duration kCarouselHoldRepeatInterval = Duration(milliseconds: 110);

/// Watchdog window. Refreshed by each *incoming* key event only, so a hold
/// whose repeats stop arriving (a missed key-up) cannot scroll forever.
const Duration kCarouselHoldSafety = Duration(milliseconds: 900);

const double _cardHeight = ChannelCarouselCard.cardHeight;
const double _cardSpacing = ChannelCarouselCard.cardSpacing;

/// How many lineups the raw index space is seeded into. Larger than the
/// controller's recentre threshold so drift can build in either direction.
const int _seedLineups = 500;
const int _totalLineups = _seedLineups * 2;

/// One card's travel takes exactly one repeat interval, on a linear curve, so
/// a repeat that lands mid-flight continues the same velocity instead of
/// restarting the motion.
const Duration _scrollDuration = kCarouselHoldRepeatInterval;

/// One channel's already-resolved presentation data. The strip does no
/// fetching and no formatting: the host precomputes every field.
@immutable
class ChannelCarouselEntry {
  final String channelId;
  final String? channelNumber;
  final String channelName;
  final String? logoUrl;
  final bool isFavorite;
  final String? programTitle;
  final String? timeLabel;
  final String? rating;
  final List<String> tags;
  final EpgGenre? genre;
  final bool isLive;
  final double progress;
  final bool hasTimer;

  /// No programme yet because the channel's schedule is still unfetched, as
  /// opposed to a channel whose schedule is loaded and simply has no entry.
  final bool programLoading;

  const ChannelCarouselEntry({
    required this.channelId,
    required this.channelName,
    this.channelNumber,
    this.logoUrl,
    this.isFavorite = false,
    this.programTitle,
    this.timeLabel,
    this.rating,
    this.tags = const [],
    this.genre,
    this.isLive = false,
    this.progress = 0,
    this.hasTimer = false,
    this.programLoading = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelCarouselEntry &&
          other.channelId == channelId &&
          other.channelNumber == channelNumber &&
          other.channelName == channelName &&
          other.logoUrl == logoUrl &&
          other.isFavorite == isFavorite &&
          other.programTitle == programTitle &&
          other.timeLabel == timeLabel &&
          other.rating == rating &&
          other.genre == genre &&
          other.isLive == isLive &&
          other.progress == progress &&
          other.hasTimer == hasTimer &&
          other.programLoading == programLoading &&
          listEquals(other.tags, tags);

  @override
  int get hashCode => Object.hash(
    channelId,
    channelNumber,
    channelName,
    logoUrl,
    isFavorite,
    programTitle,
    timeLabel,
    rating,
    genre,
    isLive,
    progress,
    hasTimer,
    programLoading,
    Object.hashAll(tags),
  );
}

/// Centre-locked horizontal channel strip: the selected card is pinned at the
/// viewport centre and the strip animates beneath it. Rendering and key input
/// only — the host owns data, chrome, and dismissal.
class ChannelCarousel extends StatefulWidget {
  final List<ChannelCarouselEntry> channels;

  /// Index into [channels] to open on.
  final int initialIndex;

  /// Forces restoration even when the requested index has not changed.
  final int selectionRevision;

  /// Fires whenever the centred channel changes, with its [channels] index.
  final ValueChanged<int>? onChannelCentered;

  /// Centre-press on the centred channel.
  final ValueChanged<ChannelCarouselEntry>? onChannelSelected;

  /// Back key. Handled here only when supplied.
  final VoidCallback? onBack;

  /// Every incoming key event, for the host's inactivity timer.
  final VoidCallback? onKeyInteraction;

  /// Reported once, after the first frame, when [channels] is empty — the
  /// strip cannot open on an empty lineup and the host must dismiss it.
  final VoidCallback? onEmpty;

  final FocusNode? focusNode;
  final bool autofocus;

  const ChannelCarousel({
    super.key,
    required this.channels,
    this.initialIndex = 0,
    this.selectionRevision = 0,
    this.onChannelCentered,
    this.onChannelSelected,
    this.onBack,
    this.onKeyInteraction,
    this.onEmpty,
    this.focusNode,
    this.autofocus = true,
  });

  /// Gate for the host: an empty lineup must not open the carousel.
  static bool canOpen(int channelCount) => channelCount > 0;

  /// Vertical space the strip needs.
  static const double stripHeight = _cardHeight;

  @override
  State<ChannelCarousel> createState() => _ChannelCarouselState();
}

class _ChannelCarouselState extends State<ChannelCarousel> {
  late FocusNode _focusNode;
  bool _ownsFocusNode = false;
  ScrollController? _scrollController;

  int _seedIndex = 0;
  int _rawIndex = 0;

  /// Last measured viewport capacity; 1 until the first layout.
  int _visibleCards = 1;

  /// Strip geometry, derived from the viewport so a whole odd number of cards
  /// always fits. The card's own constants stand in until the first layout.
  double _cardExtent = ChannelCarouselCard.cardPitch;
  double _cardWidth = ChannelCarouselCard.cardWidth;

  Timer? _pageStartTimer;
  Timer? _pageRepeatTimer;
  Timer? _watchdogTimer;
  int _holdDirection = 0;

  int get _channelCount => widget.channels.length;

  int get _centredChannelIndex =>
      _channelCount == 0 ? 0 : channelIndexFor(_rawIndex, _channelCount);

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode(debugLabel: 'ChannelCarousel');
    _ownsFocusNode = widget.focusNode == null;
    _seedFromChannels();
    _reportEmptyIfNeeded();
    _requestInitialFocus();
  }

  @override
  void didUpdateWidget(covariant ChannelCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      if (_ownsFocusNode) _focusNode.dispose();
      _focusNode = widget.focusNode ?? FocusNode(debugLabel: 'ChannelCarousel');
      _ownsFocusNode = widget.focusNode == null;
      _requestInitialFocus();
    }
    if (oldWidget.channels.length != widget.channels.length) {
      _endHold();
      _seedFromChannels(preferredChannelIndex: _centredChannelIndex);
      _reportEmptyIfNeeded();
    } else if ((oldWidget.initialIndex != widget.initialIndex ||
            oldWidget.selectionRevision != widget.selectionRevision) &&
        widget.initialIndex != _centredChannelIndex) {
      _endHold();
      _resetToInitialIndex();
    }
  }

  @override
  void dispose() {
    _endHold();
    _scrollController?.dispose();
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  void _seedFromChannels({int? preferredChannelIndex}) {
    if (_channelCount == 0) {
      _seedIndex = 0;
      _rawIndex = 0;
      _scrollController?.dispose();
      _scrollController = null;
      return;
    }
    final start = (preferredChannelIndex ?? widget.initialIndex).clamp(
      0,
      _channelCount - 1,
    );
    _seedIndex = _channelCount * _seedLineups;
    _rawIndex = _seedIndex + start;
    _scrollController?.dispose();
    _scrollController = ScrollController(
      initialScrollOffset: _offsetFor(_rawIndex),
    );
  }

  void _resetToInitialIndex() {
    if (_channelCount == 0) return;
    final start = widget.initialIndex.clamp(0, _channelCount - 1);
    _rawIndex = _seedIndex + start;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = _scrollController;
      if (mounted && controller?.hasClients == true) {
        controller!.jumpTo(_offsetFor(_rawIndex));
      }
    });
  }

  void _reportEmptyIfNeeded() {
    if (_channelCount != 0) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.onEmpty?.call();
    });
  }

  void _requestInitialFocus() {
    if (!widget.autofocus || _channelCount == 0) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _focusNode.canRequestFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  double _offsetFor(int rawIndex) => rawIndex * _cardExtent;

  // ---------------------------------------------------------------------
  // Key input. This is the ONLY path that may refresh the watchdog.
  // ---------------------------------------------------------------------

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    widget.onKeyInteraction?.call();

    if (widget.onBack != null && event.logicalKey.isBackKey) {
      if (event is KeyDownEvent) {
        _endHold();
        widget.onBack!();
      }
      return KeyEventResult.handled;
    }

    if (widget.onChannelSelected != null &&
        event is KeyDownEvent &&
        event.logicalKey.isSelectKey) {
      _endHold();
      if (_channelCount > 0) {
        widget.onChannelSelected!(widget.channels[_centredChannelIndex]);
      }
      return KeyEventResult.handled;
    }

    final key = event.logicalKey;
    if (!key.isLeftKey && !key.isRightKey) return KeyEventResult.ignored;

    if (event is KeyUpEvent) {
      _endHold();
      return KeyEventResult.handled;
    }
    if (!event.isActionable) return KeyEventResult.ignored;

    final direction = key.isRightKey ? 1 : -1;

    // A physical key event — down or repeat — is the only thing that keeps the
    // hold alive. `_pageFromTimer` deliberately never reaches this line.
    _refreshWatchdog();

    if (event is KeyDownEvent) {
      _beginHold(direction);
    } else if (direction != _holdDirection) {
      // Direction reversed mid-hold without an intervening key-down.
      _beginHold(direction);
    }
    return KeyEventResult.handled;
  }

  /// Refreshed by incoming key events only. Firing it ends the hold, which is
  /// what stops paging when repeats stop arriving and no key-up ever lands.
  void _refreshWatchdog() {
    _watchdogTimer?.cancel();
    _watchdogTimer = Timer(kCarouselHoldSafety, _endHold);
  }

  /// One card per discrete press, then the hold timers take over.
  void _beginHold(int direction) {
    _pageStartTimer?.cancel();
    _pageRepeatTimer?.cancel();
    _holdDirection = direction;
    _moveBy(direction);
    _pageStartTimer = Timer(kCarouselHoldStartDelay, () {
      _stepFromTimer();
      _pageRepeatTimer = Timer.periodic(
        kCarouselHoldRepeatInterval,
        (_) => _stepFromTimer(),
      );
    });
  }

  void _endHold() {
    _pageStartTimer?.cancel();
    _pageStartTimer = null;
    _pageRepeatTimer?.cancel();
    _pageRepeatTimer = null;
    _watchdogTimer?.cancel();
    _watchdogTimer = null;
    _holdDirection = 0;
  }

  /// Timer-driven movement. It must never touch [_refreshWatchdog].
  void _stepFromTimer() {
    if (!mounted || _holdDirection == 0) return;
    _moveBy(_holdDirection * holdStep(_channelCount));
  }

  // ---------------------------------------------------------------------
  // Motion
  // ---------------------------------------------------------------------

  void _moveBy(int delta) {
    if (_channelCount <= 1 || delta == 0) return;
    final before = _centredChannelIndex;
    var target = _rawIndex + delta;

    if (needsRecentre(target, _channelCount, _seedIndex)) {
      final recentred = recentre(target, _channelCount, _seedIndex);
      // A whole multiple of the lineup: the mapped channel is unchanged, so
      // shifting the live position by the same amount is not visible.
      final shift = recentred - target;
      _rawIndex += shift;
      final controller = _scrollController;
      if (controller?.hasClients == true) {
        controller!.jumpTo(_offsetFor(_rawIndex));
      }
      target = recentred;
    }

    setState(() => _rawIndex = target);
    _animateToCentred();
    if (_centredChannelIndex != before) {
      widget.onChannelCentered?.call(_centredChannelIndex);
    }
  }

  void _animateToCentred() {
    final controller = _scrollController;
    if (controller == null || !controller.hasClients) return;
    controller.animateTo(
      _offsetFor(_rawIndex),
      duration: _scrollDuration,
      curve: Curves.linear,
    );
  }

  // ---------------------------------------------------------------------
  // Rendering
  // ---------------------------------------------------------------------

  /// Card widgets are cached per channel so that paging rebuilds only the two
  /// cards whose centred state actually flipped; the rest are handed back the
  /// identical instance and their elements skip the rebuild entirely. The
  /// cache is dropped whenever the host hands over a new entry list.
  List<ChannelCarouselEntry>? _cachedFor;
  final Map<int, Widget> _plainCards = {};
  final Map<int, Widget> _centredCards = {};

  double? _cachedWidth;

  Widget _cardFor(int channelIndex, {required bool centered}) {
    _syncCardCache();
    if (_cachedWidth != _cardWidth) {
      _cachedWidth = _cardWidth;
      _plainCards.clear();
      _centredCards.clear();
    }
    final cache = centered ? _centredCards : _plainCards;
    return cache[channelIndex] ??= _buildCard(channelIndex, centered);
  }

  /// Drops only the entries that actually changed. One channel's programme
  /// data arriving must not cost a rebuild of every other card.
  void _syncCardCache() {
    final channels = widget.channels;
    final previous = _cachedFor;
    if (identical(previous, channels)) return;
    _cachedFor = channels;
    if (previous == null || previous.length != channels.length) {
      _plainCards.clear();
      _centredCards.clear();
      return;
    }
    for (var i = 0; i < channels.length; i++) {
      if (previous[i] != channels[i]) {
        _plainCards.remove(i);
        _centredCards.remove(i);
      }
    }
  }

  Widget _buildCard(int channelIndex, bool centered) {
    final entry = widget.channels[channelIndex];
    return ChannelCarouselCard(
      channelNumber: entry.channelNumber,
      channelName: entry.channelName,
      logoUrl: entry.logoUrl,
      isFavorite: entry.isFavorite,
      programTitle: entry.programTitle,
      timeLabel: entry.timeLabel,
      rating: entry.rating,
      tags: entry.tags,
      genre: entry.genre,
      isLive: entry.isLive,
      progress: entry.progress,
      hasTimer: entry.hasTimer,
      programLoading: entry.programLoading,
      centered: centered,
      width: _cardWidth,
    );
  }

  /// Adopts the pitch the viewport implies. A changed pitch invalidates the
  /// scroll offset, so the strip is jumped back onto the centred card.
  void _applyLayout(double viewportWidth) {
    final layout = ChannelCarouselCard.layoutFor(viewportWidth);
    _visibleCards = layout.count;
    if (layout.pitch == _cardExtent) return;
    _cardExtent = layout.pitch;
    _cardWidth = layout.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = _scrollController;
      if (mounted && controller?.hasClients == true) {
        controller!.jumpTo(_offsetFor(_rawIndex));
      }
    });
  }

  /// A lineup that fits the viewport renders its real count, centred, with no
  /// scrolling; selection still wraps across the short list.
  Widget _buildFittingStrip(double viewportWidth) {
    final selected = _centredChannelIndex;
    final middle = _channelCount ~/ 2;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (var i = 0; i < _channelCount; i++)
          Positioned(
            left: (viewportWidth - _cardWidth) / 2 + (i - middle) * _cardExtent,
            width: _cardWidth,
            height: _cardHeight,
            child: _cardFor(
              channelIndexFor(selected + i - middle, _channelCount),
              centered: i == middle,
            ),
          ),
      ],
    );
  }

  Widget _buildScrollingStrip(double viewportWidth) {
    final leading = math.max(0.0, (viewportWidth - _cardWidth) / 2);
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: leading),
      itemExtent: _cardExtent,
      itemCount: _channelCount * _totalLineups,
      itemBuilder: (context, index) {
        final channelIndex = channelIndexFor(index, _channelCount);
        final centered = index == _rawIndex;
        return Padding(
          padding: const EdgeInsets.only(right: _cardSpacing),
          child: _cardFor(channelIndex, centered: centered),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_channelCount == 0) return const SizedBox.shrink();
    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: _onKeyEvent,
      child: SizedBox(
        height: ChannelCarousel.stripHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            _applyLayout(width);
            // The derived count is always odd, so an equal run sits
            // symmetrically around the centred card.
            return _channelCount <= _visibleCards
                ? _buildFittingStrip(width)
                : _buildScrollingStrip(width);
          },
        ),
      ),
    );
  }
}
