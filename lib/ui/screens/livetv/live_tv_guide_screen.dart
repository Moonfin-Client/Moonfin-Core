import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/horizontal_scroll_section.dart';
import '../../widgets/live_tv/live_tv_mini_player.dart';
import '../../widgets/overlay_sheet.dart';
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

const _kChannelColumnWidth = 160.0;
const _kRowHeight = 84.0;
// Start fetching the next batch of channel programs this many rows before the
// lazily-loaded edge, so rows are usually populated by the time they're visible.
const _kProgramPrefetchRows = 12;
const _kTimeHeaderHeight = 40.0;
const _kPixelsPerMinute = 6.0;
const _kMinGuideHours = 3;
const _kMaxGuideHours = 12;
const _kMiniPlayerWidth = 300.0;
const _kMiniPlayerHeight = 168.0;

int _guideHoursForWidth(double availableWidth) {
  final guideWidth = availableWidth - _kChannelColumnWidth;
  if (guideWidth <= 0) return _kMinGuideHours;
  final hours = (guideWidth / (_kPixelsPerMinute * 60)).floor();
  return hours.clamp(_kMinGuideHours, _kMaxGuideHours);
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

  const LiveTvGuideScreen({
    super.key,
    this.miniPlayerMode = false,
    this.currentChannel,
    this.appleTvTextureId,
    this.embedded = false,
    this.onChannelSelected,
    this.onClose,
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

class _LiveTvGuideScreenState extends State<LiveTvGuideScreen> {
  late final LiveTvGuideViewModel _vm;
  final _prefs = GetIt.instance<UserPreferences>();
  final _channelScrollController = ScrollController();
  final _programScrollController = ScrollController();
  final _timeHeaderHorizontalScrollController = ScrollController();
  final _guideHorizontalScrollController = ScrollController();
  final _miniPlayerFocusNode = FocusNode(debugLabel: 'GuideMiniPlayer');
  final Map<int, FocusNode> _channelFocusNodes = {};
  final Map<int, FocusNode> _filterFocusNodes = {};

  bool _syncingScroll = false;
  bool _syncingHorizontalScroll = false;
  int _lastComputedHours = _kMinGuideHours;
  bool _isShowingDatePicker = false;
  bool _isOpeningRecordings = false;
  int? _lastFocusedRowIndex;
  final ValueNotifier<GuideProgram?> _focusedProgram = ValueNotifier(null);
  final ValueNotifier<GuideChannel?> _focusedChannel = ValueNotifier(null);
  bool _didInitializeMiniPlayerMode = false;
  late EpgMobileView _mobileView;

  bool get _apple => AppUiIdiomResolver.isApple;

  double _contentTopInset() => 20.0;

  double _contentLeftInset() => 24.0;

  @override
  void initState() {
    super.initState();
    _vm = LiveTvGuideViewModel(
      GetIt.instance<MediaServerClient>(),
      initialSortBy: _prefs.get(UserPreferences.liveTvChannelSortBy),
    );
    _vm.addListener(_onChanged);
    _mobileView = _prefs.get(UserPreferences.epgMobileView);

    _channelScrollController.addListener(_syncVerticalScroll);
    _programScrollController.addListener(_syncVerticalScroll);
    _timeHeaderHorizontalScrollController.addListener(_syncHorizontalFromHeader);
    _guideHorizontalScrollController.addListener(_syncHorizontalFromGuide);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final width = MediaQuery.sizeOf(context).width - _contentLeftInset();
      _vm.load(windowHours: _guideHoursForWidth(width));
    });
  }

  void _syncVerticalScroll() {
    if (_syncingScroll) return;
    if (!_channelScrollController.hasClients || !_programScrollController.hasClients) {
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
    } catch (_) {
    }
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
    } catch (_) {
    }
    _syncingHorizontalScroll = false;
  }

  void _onChanged() {
    if (!mounted) return;
    setState(_initializeMiniPlayerMode);
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
      _focusChannelRow(initialIndex);
    });
  }

  void _scrollToRow(int index) {
    final offset = index * _kRowHeight;
    final targetRow = index;
    if (_lastFocusedRowIndex == targetRow) {
      return;
    }
    _lastFocusedRowIndex = targetRow;
    if (_channelScrollController.hasClients) {
      final max = _channelScrollController.position.maxScrollExtent;
      _channelScrollController.animateTo(
        offset.clamp(0.0, max),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
    if (_programScrollController.hasClients) {
      final max = _programScrollController.position.maxScrollExtent;
      _programScrollController.animateTo(
        offset.clamp(0.0, max),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  FocusNode _channelFocusNodeFor(int index) {
    return _channelFocusNodes.putIfAbsent(
      index,
      () => FocusNode(debugLabel: 'GuideChannel:$index'),
    );
  }

  void _focusChannelRow(int index) {
    _scrollToRow(index);
    _channelFocusNodeFor(index).requestFocus();
  }

  void _focusMiniPlayer() {
    if (!widget.miniPlayerMode) return;
    _miniPlayerFocusNode.requestFocus();
  }

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
        _vm.setDate(picked);
      }
    } finally {
      _isShowingDatePicker = false;
    }
  }

  void _openSortDialog() {
    final l10n = AppLocalizations.of(context);
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(
          l10n.sortBy,
          style: const TextStyle(color: Colors.white),
        ),
        content: RadioGroup<ChannelSortBy>(
          groupValue: _vm.sortBy,
          onChanged: (value) {
            if (value == null) return;
            _prefs.set(UserPreferences.liveTvChannelSortBy, value);
            _vm.setSortBy(value);
            Navigator.of(dialogContext).pop();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final option in ChannelSortBy.values)
                RadioListTile<ChannelSortBy>(
                  value: option,
                  title: Text(
                    option.displayName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openRecordings() async {
    if (_isOpeningRecordings) return;
    _isOpeningRecordings = true;
    try {
      await context.push(Destinations.liveTvRecordings);
    } finally {
      _isOpeningRecordings = false;
    }
  }

  @override
  void dispose() {
    _vm.removeListener(_onChanged);
    _vm.dispose();
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
    _focusedProgram.dispose();
    _focusedChannel.dispose();
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
    return minutes * _kPixelsPerMinute;
  }

  // Called from row itemBuilders: as the guide scrolls toward the lazily-loaded
  // edge, request the next batch of programs (the VM guards against re-entry).
  void _maybeLoadMore(int index) {
    if (_vm.hasMorePrograms &&
        index + _kProgramPrefetchRows >= _vm.programsHighWater) {
      _vm.loadMorePrograms();
    }
  }

  // A faint skeleton bar shown in a program row whose channel hasn't been
  // fetched yet. Channel logos still render; they load with the channel list.
  Widget _buildProgramPlaceholderRow() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x0FFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final body = LayoutBuilder(
      builder: (context, constraints) {
        final hours = _guideHoursForWidth(
          constraints.maxWidth - _contentLeftInset(),
        );
        if (hours != _lastComputedHours && _vm.state == GuideState.ready) {
          _lastComputedHours = hours;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _vm.setWindowHours(hours);
          });
        }
        final landscape = widget.miniPlayerMode ||
            PlatformDetection.isTV ||
            PlatformDetection.useDesktopUi ||
            constraints.maxWidth >= constraints.maxHeight;
        return Padding(
          padding: EdgeInsets.only(
            top: _contentTopInset(),
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

  Widget _buildLandscape() {
    return Column(
      children: [
        _buildTopSection(),
        const SizedBox(height: 8),
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
        listenable: Listenable.merge([_focusedProgram, _focusedChannel]),
        builder: (context, _) {
          final focusedProgram = _focusedProgram.value;
          final focusedChannel = focusedProgram == null
              ? (widget.currentChannel ?? _focusedChannel.value)
              : _vm.channelForId(focusedProgram.channelId);
          return _buildProgramInfoHeader(
            program: focusedProgram,
            channel: focusedChannel,
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildToolbar(),
        _buildFilterRail(),
        const SizedBox(height: 8),
        _buildHero(),
      ],
    );
  }

  Widget _buildHero() {
    return ListenableBuilder(
      listenable: Listenable.merge([_focusedProgram, _focusedChannel]),
      builder: (context, _) {
        final program = _focusedProgram.value;
        final channel = program == null
            ? _focusedChannel.value
            : _vm.channelForId(program.channelId);
        final logoUrl = channel?.imageTag == null
            ? null
            : _vm.imageApi.getPrimaryImageUrl(
                channel!.id,
                maxHeight: 96,
                tag: channel.imageTag,
              );
        final now = DateTime.now();
        final isLive = program != null &&
            now.isAfter(program.startDate) &&
            now.isBefore(program.endDate);
        return EpgHeroPreview(
          title: program?.name ??
              channel?.name ??
              AppLocalizations.of(context).guideTimeline,
          timeLabel: program == null
              ? null
              : '${_formatTime(program.startDate)} - ${_formatTime(program.endDate)}',
          genreLabel: program == null ? null : epgGenreFor(program).label,
          synopsis: program?.overview,
          channelLogoUrl: logoUrl,
          channelName: channel?.name,
          channelNumber: channel?.number,
          isLive: isLive,
          apple: _apple,
        );
      },
    );
  }

  Widget _buildFilterRail() {
    final filters = GuideFilter.values;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: EpgFilterRail(
        labels: [for (final f in filters) _filterLabel(f)],
        selectedIndex: filters.indexOf(_vm.filter),
        onSelect: (i) => _vm.setFilter(filters[i]),
        apple: _apple,
        focusNodeFor: _filterFocusNodeFor,
        onNavigateDown: () => _focusChannelRow(0),
      ),
    );
  }

  FocusNode _filterFocusNodeFor(int index) {
    return _filterFocusNodes.putIfAbsent(
      index,
      () => FocusNode(debugLabel: 'GuideFilter:$index'),
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
          _GuidePillButton(
            icon: Icons.sort,
            onPressed: _openSortDialog,
          ),
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
        return Center(
          child: Text(
            AppLocalizations.of(context).failedToLoadGuide(_vm.errorMessage),
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
        final isLive = now != null &&
            t.isAfter(now.startDate) &&
            t.isBefore(now.endDate);
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: EpgNowNextCard(
            logoUrl: logoUrl,
            channelName: channel.name,
            channelNumber: channel.number,
            nowTitle: now?.name,
            nowProgress: now?.progressAt(t) ?? 0,
            remainingLabel:
                now == null ? null : _remainingLabel(now.endDate, t),
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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: AppRadius.circular(12),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.cardBorder),
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
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          if (!PlatformDetection.isTV) ...[
            _GuidePillButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 8),
          ],
          _GuidePillButton(
            icon: Icons.chevron_left,
            onPressed: () => _vm.shiftWindow(-_vm.guideWindowHours),
          ),
          const SizedBox(width: 4),
          _GuidePillButton(
            label: AppLocalizations.of(context).now,
            onPressed: () => _vm.goToNow(),
          ),
          const SizedBox(width: 4),
          _GuidePillButton(
            icon: Icons.chevron_right,
            onPressed: () => _vm.shiftWindow(_vm.guideWindowHours),
          ),
          const SizedBox(width: 12),
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
          _GuidePillButton(
            icon: Icons.sort,
            onPressed: _openSortDialog,
          ),
          const SizedBox(width: 8),
          _GuidePillButton(
            icon: Icons.calendar_today,
            onPressed: _openDatePicker,
          ),
          const SizedBox(width: 8),
          _GuidePillButton(
            icon: Icons.fiber_dvr,
            label: AppLocalizations.of(context).recordings,
            onPressed: _openRecordings,
          ),
        ],
      ),
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
        return Center(
          child: Text(
            AppLocalizations.of(context).failedToLoadGuide(_vm.errorMessage),
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

    return Column(
      children: [
        HorizontalScrollSection(
          title: AppLocalizations.of(context).guideTimeline,
          scrollController: _timeHeaderHorizontalScrollController,
          onScrollPastStart: () => _vm.shiftWindow(-1),
          onScrollPastEnd: () => _vm.shiftWindow(1),
          titleStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          headerPadding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
          contentSpacing: 2,
          builder: (_, controller) => SizedBox(
            height: _kTimeHeaderHeight,
            child: Row(
              children: [
                const SizedBox(width: _kChannelColumnWidth),
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
                width: _kChannelColumnWidth,
                child: ListView.builder(
                  controller: _channelScrollController,
                  itemCount: channels.length,
                  itemExtent: _kRowHeight,
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
                  verticalController: _programScrollController,
                  horizontalController: _guideHorizontalScrollController,
                  buildProgramRow: _buildProgramRow,
                  programsForChannel: _vm.programsForChannel,
                  hasProgramsFor: _vm.hasProgramsFor,
                  buildPlaceholderRow: _buildProgramPlaceholderRow,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeHeader(double totalWidth) {
    final slots = <Widget>[];
    var time = _vm.windowStart;
    while (time.isBefore(_vm.windowEnd)) {
      final slotWidth = 30 * _kPixelsPerMinute;
      slots.add(
        SizedBox(
          width: slotWidth,
          height: _kTimeHeaderHeight,
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
      height: _kTimeHeaderHeight,
      child: Row(children: slots),
    );
  }

  Widget _buildChannelCell(GuideChannel channel, int index) {
    final imageUrl = channel.imageTag != null
        ? _vm.imageApi.getPrimaryImageUrl(
            channel.id,
            maxHeight: _kRowHeight.toInt(),
            tag: channel.imageTag,
          )
        : null;

    return _GuideFocusableSurface(
      focusNode: _channelFocusNodeFor(index),
      onPressed: () => _watchChannel(channel.id),
      onKeyEvent: (_, event) {
        if (index != 0 || !event.isActionable) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey.isUpKey) {
          if (widget.miniPlayerMode) {
            _focusMiniPlayer();
          } else {
            _filterFocusNodeFor(0).requestFocus();
          }
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      onFocusChange: (focused) {
        if (!focused) return;
        _scrollToRow(index);
        _focusedProgram.value = null;
        _focusedChannel.value = channel;
      },
      builder: (focused) => Container(
        height: _kRowHeight,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: ThemeRegistry.active.borders.cardBorder,
          ),
        ),
        child: EpgChannelCell(
          logoUrl: imageUrl,
          name: channel.name,
          number: channel.number,
          focused: focused,
          apple: _apple,
        ),
      ),
    );
  }

  Widget _buildProgramRow(List<GuideProgram> programs, int rowIndex) {
    if (programs.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: ThemeRegistry.active.borders.cardBorder,
          ),
        ),
      );
    }

    return _GuideProgramRow(
      programs: programs,
      rowIndex: rowIndex,
      windowStart: _vm.windowStart,
      windowEnd: _vm.windowEnd,
      apple: _apple,
      onLeftEdge: () => _focusChannelRow(rowIndex),
      onProgramSelected: widget.miniPlayerMode
          ? (program) => _watchChannel(program.channelId)
          : _showProgramDetails,
      onTopEdge: rowIndex == 0
          ? (widget.miniPlayerMode
              ? _focusMiniPlayer
              : () => _filterFocusNodeFor(0).requestFocus())
          : null,
      onProgramFocused: (program, left, width) {
        _focusedProgram.value = program;
        _focusedChannel.value = _vm.channelForId(program.channelId);
        _scrollToRow(rowIndex);
        if (_guideHorizontalScrollController.hasClients) {
          final viewport = _guideHorizontalScrollController.position.viewportDimension;
          final max = _guideHorizontalScrollController.position.maxScrollExtent;
          final target = (left + (width / 2) - (viewport / 2)).clamp(0.0, max);
          _guideHorizontalScrollController.animateTo(
            target,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
          );
        }
      },
      formatTime: _formatTime,
    );
  }

  void _watchChannel(String channelId) {
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
    context.push(Destinations.liveTvPlayer, extra: {
      'channels': channels,
      'startIndex': index,
    });
  }

  void _showProgramDetails(GuideProgram program) {
    final pageContext = context;
    final channel = _vm.channelForId(program.channelId);
    final isFavoriteChannel = channel?.isFavorite ?? false;
    final hasTimer = program.hasTimer;
    final l10n = AppLocalizations.of(context);
    var dialogActionInProgress = false;

    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(program.name, style: const TextStyle(color: Colors.white)),
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
                Text(program.episodeTitle!, style: const TextStyle(color: Colors.white70)),
              ],
              if (program.overview != null && program.overview!.isNotEmpty) ...[
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
                    Chip(label: Text(l10n.movie), visualDensity: VisualDensity.compact),
                  if (program.isSeries)
                    Chip(label: Text(l10n.series), visualDensity: VisualDensity.compact),
                  if (program.isSports)
                    Chip(label: Text(l10n.sports), visualDensity: VisualDensity.compact),
                  if (program.isNews)
                    Chip(label: Text(l10n.news), visualDensity: VisualDensity.compact),
                  if (program.isKids)
                    Chip(label: Text(l10n.kids), visualDensity: VisualDensity.compact),
                  if (program.isPremiere)
                    Chip(label: Text(l10n.premiere), visualDensity: VisualDensity.compact),
                ],
              ),
            ],
          ),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () async {
              if (dialogActionInProgress) return;
              dialogActionInProgress = true;
              try {
                await _vm.toggleProgramRecording(program);
                if (!pageContext.mounted) return;
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
            child: Text(hasTimer ? l10n.cancelRecordingAction : l10n.record),
          ),
          adaptiveDialogAction(
            onPressed: channel == null
                ? null
                : () async {
                    if (dialogActionInProgress) return;
                    dialogActionInProgress = true;
                    try {
                      await _vm.toggleChannelFavorite(program.channelId);
                      if (!pageContext.mounted) return;
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
              isFavoriteChannel ? l10n.unfavoriteChannel : l10n.favoriteChannel,
            ),
          ),
          adaptiveDialogAction(
            onPressed: () {
              if (dialogActionInProgress) return;
              dialogActionInProgress = true;
              Navigator.of(dialogContext).pop();
              _watchChannel(program.channelId);
            },
            child: Text(l10n.watch),
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
      ),
    );
  }
}

class _GuideGridView extends StatefulWidget {
  final List<GuideChannel> channels;
  final double guideWidth;
  final ScrollController verticalController;
  final ScrollController horizontalController;
  final Widget Function(List<GuideProgram>, int rowIndex) buildProgramRow;
  final List<GuideProgram> Function(String channelId) programsForChannel;
  final bool Function(String channelId) hasProgramsFor;
  final Widget Function() buildPlaceholderRow;

  const _GuideGridView({
    required this.channels,
    required this.guideWidth,
    required this.verticalController,
    required this.horizontalController,
    required this.buildProgramRow,
    required this.programsForChannel,
    required this.hasProgramsFor,
    required this.buildPlaceholderRow,
  });

  @override
  State<_GuideGridView> createState() => _GuideGridViewState();
}

class _GuideGridViewState extends State<_GuideGridView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: widget.horizontalController,
      child: SizedBox(
        width: widget.guideWidth,
        child: ListView.builder(
          controller: widget.verticalController,
          itemCount: widget.channels.length,
          itemExtent: _kRowHeight,
          itemBuilder: (context, index) {
            final channel = widget.channels[index];
            final loaded = widget.hasProgramsFor(channel.id);
            return SizedBox(
              width: widget.guideWidth,
              height: _kRowHeight,
              child: loaded
                  ? widget.buildProgramRow(
                      widget.programsForChannel(channel.id),
                      index,
                    )
                  : widget.buildPlaceholderRow(),
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

  const _GuidePillButton({
    this.label,
    this.icon,
    this.onPressed,
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
      onPressed: widget.onPressed,
      onFocusChange: (focused) {
        if (_focused != focused) setState(() => _focused = focused);
      },
      borderRadius: AppRadius.circular(20),
      builder: (_) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
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
    return Text(widget.label ?? '', style: TextStyle(color: color, fontSize: 13));
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

  FocusNode get _focusNode => widget.focusNode ?? (_ownedFocusNode ??= FocusNode());

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
  final List<GuideProgram> programs;
  final int rowIndex;
  final DateTime windowStart;
  final DateTime windowEnd;
  final bool apple;
  final VoidCallback? onLeftEdge;
  final VoidCallback? onTopEdge;
  final ValueChanged<GuideProgram> onProgramSelected;
  final void Function(GuideProgram program, double left, double width)
  onProgramFocused;
  final String Function(DateTime) formatTime;

  const _GuideProgramRow({
    required this.programs,
    required this.rowIndex,
    required this.windowStart,
    required this.windowEnd,
    required this.apple,
    this.onLeftEdge,
    this.onTopEdge,
    required this.onProgramSelected,
    required this.onProgramFocused,
    required this.formatTime,
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
  }

  @override
  void didUpdateWidget(covariant _GuideProgramRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.programs.length != widget.programs.length) {
      _syncFocusNodes();
    }
  }

  void _syncFocusNodes() {
    while (_focusNodes.length < widget.programs.length) {
      _focusNodes.add(FocusNode(debugLabel: 'GuideProgramRow${widget.rowIndex}:${_focusNodes.length}'));
    }
    while (_focusNodes.length > widget.programs.length) {
      _focusNodes.removeLast().dispose();
    }
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  KeyEventResult _handleProgramKeyEvent(int index, FocusNode node, KeyEvent event) {
    final selected = handleOneShotSelect(event, () {
      widget.onProgramSelected(widget.programs[index]);
    });
    if (selected != KeyEventResult.ignored) return selected;
    if (!event.isActionable) return KeyEventResult.ignored;

    final key = event.logicalKey;
    if (key.isLeftKey) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
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
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    if (key.isUpKey && widget.onTopEdge != null) {
      widget.onTopEdge!();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final totalMinutes = widget.windowEnd.difference(widget.windowStart).inMinutes.toDouble();
    final now = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: ThemeRegistry.active.borders.cardBorder,
        ),
      ),
      child: Stack(
        children: [
          for (var index = 0; index < widget.programs.length; index++)
            _buildProgramCell(index, widget.programs[index], totalMinutes, now),
        ],
      ),
    );
  }

  Widget _buildProgramCell(
    int index,
    GuideProgram program,
    double totalMinutes,
    DateTime now,
  ) {
    final offsetMinutes = program.startDate.difference(widget.windowStart).inMinutes.toDouble();
    final clampedStart = offsetMinutes < 0 ? 0.0 : offsetMinutes;
    final endOffset = program.endDate.difference(widget.windowStart).inMinutes.toDouble();
    final clampedEnd = endOffset > totalMinutes ? totalMinutes : endOffset;
    final left = clampedStart * _kPixelsPerMinute;
    final width = (clampedEnd - clampedStart) * _kPixelsPerMinute;

    if (width <= 0) return const SizedBox.shrink();

    final isLive = now.isAfter(program.startDate) && now.isBefore(program.endDate);

    return Positioned(
      left: left,
      width: width,
      top: 2,
      bottom: 2,
      child: Padding(
        padding: const EdgeInsets.only(right: 1),
        child: _GuideFocusableSurface(
          focusNode: _focusNodes[index],
          onPressed: () => widget.onProgramSelected(program),
          onKeyEvent: (node, event) =>
              _handleProgramKeyEvent(index, node, event),
          onFocusChange: (focused) {
            if (!focused) return;
            widget.onProgramFocused(program, left, width);
          },
          builder: (focused) => EpgProgramCell(
            title: program.name,
            timeLabel:
                '${widget.formatTime(program.startDate)} - ${widget.formatTime(program.endDate)}',
            genre: epgGenreFor(program),
            isLive: isLive,
            progress: isLive ? program.progressAt(now) : 0,
            hasTimer: program.hasTimer,
            focused: focused,
            apple: widget.apple,
            showMeta: width > 80,
          ),
        ),
      ),
    );
  }
}
