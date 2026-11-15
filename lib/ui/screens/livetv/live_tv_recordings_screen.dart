import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/live_tv_recording_state.dart';
import '../../../data/services/recording_owners_service.dart';
import '../../../data/viewmodels/recordings_view_model.dart';
import '../../../data/viewmodels/schedule_view_model.dart';
import '../../../data/viewmodels/series_recordings_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/focus_scroll.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/live_tv/incomplete_recording.dart';
import '../../widgets/live_tv/recording_owner_badge.dart';
import '../../widgets/live_tv/series_recording_dialog.dart';
import '../../widgets/live_tv/shared_recording_warning.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/offline_aware_image.dart';

class LiveTvRecordingsScreen extends StatefulWidget {
  const LiveTvRecordingsScreen({super.key});

  @override
  State<LiveTvRecordingsScreen> createState() => _LiveTvRecordingsScreenState();
}

enum _RecordingsTab { recordings, scheduled, series }

/// Whose recordings the screen lists, when the server's plugin keeps owners.
enum _RecordingsScope { mine, everyone }

class _LiveTvRecordingsScreenState extends State<LiveTvRecordingsScreen> {
  late final RecordingsViewModel _vm;
  late final ScheduleViewModel _scheduleVm;
  late final SeriesRecordingsViewModel _seriesVm;
  _RecordingsTab _activeTab = _RecordingsTab.recordings;

  // Owner data is only there with the plugin. Without it [_mine] stays null
  // and the screen is exactly what it was: no switch, no row, no badges.
  RecordingOwnersService? _ownersService;
  bool _ownersSupported = false;
  MineIds? _mine;
  _RecordingsScope _scope = _RecordingsScope.everyone;
  int _loads = 0;

  // The first visit lands on My Recordings once it arrives, unless the user
  // has already moved off the header.
  bool _pendingRowFocus = true;
  final FocusNode _headerFocus = FocusNode(
    debugLabel: 'recordingsHeader',
    canRequestFocus: false,
    skipTraversal: true,
  );
  final FocusNode _myRowFocus = FocusNode(debugLabel: 'myRecordingsFirst');

  @override
  void initState() {
    super.initState();
    _vm = RecordingsViewModel(GetIt.instance<MediaServerClient>());
    _scheduleVm = ScheduleViewModel(GetIt.instance<MediaServerClient>());
    _seriesVm = SeriesRecordingsViewModel(GetIt.instance<MediaServerClient>());
    _vm.addListener(_onChanged);
    _scheduleVm.addListener(_onChanged);
    _seriesVm.addListener(_onChanged);
    if (GetIt.instance.isRegistered<RecordingOwnersService>()) {
      _ownersService = GetIt.instance<RecordingOwnersService>()
        ..addListener(_onOwnersChanged);
    }
    _load();
    liveTvRecordingRevision.addListener(_onRecordingsChanged);
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  void _onOwnersChanged() {
    if (!mounted) return;
    // The plugin's support is learned after sign in, so it can arrive late.
    if ((supportedRecordingOwners() != null) != _ownersSupported) {
      _load();
      return;
    }
    setState(() {});
  }

  Future<MineIds?> _readMine(RecordingOwnersService owners) async {
    try {
      return await owners.mine().timeout(const Duration(seconds: 8));
    } catch (_) {
      return null;
    }
  }

  Future<void> _load() async {
    final load = ++_loads;
    final owners = supportedRecordingOwners();
    _ownersSupported = owners != null;
    if (owners == null) {
      _mine = null;
      _scope = _RecordingsScope.everyone;
      _scheduleVm.applyOwnerFilter(null);
      _seriesVm.applyOwnerFilter(null);
      _vm.load();
      _scheduleVm.load();
      _seriesVm.load();
      return;
    }
    final saved = GetIt.instance<UserPreferences>().get(
      UserPreferences.recordingsScope,
    );
    // The timer lists don't depend on the scope (it only filters them), and
    // a saved Everyone needs nothing from the plugin for its rows, so those
    // start alongside the owners read rather than behind it.
    final scheduleLoad = _scheduleVm.load();
    final seriesLoad = _seriesVm.load();
    final everyoneRows = saved == 'everyone' ? _vm.load() : null;
    final mine = await _readMine(owners);
    if (!mounted || load != _loads) return;
    if (mine == null) {
      _mine = null;
      _scope = _RecordingsScope.everyone;
      _applyOwnerFilters();
      await (everyoneRows ?? _vm.load());
      return;
    }
    if (saved == 'mine') {
      _scope = _RecordingsScope.mine;
    } else if (saved == 'everyone') {
      _scope = _RecordingsScope.everyone;
    } else {
      // First visit: Mine only when the user owns something that is still
      // there, so stale timer and rule ids don't count.
      await Future.wait([scheduleLoad, seriesLoad]);
      if (!mounted || load != _loads) return;
      _scope = _ownsAnything(mine)
          ? _RecordingsScope.mine
          : _RecordingsScope.everyone;
    }
    // Only now does the switch show, so it can't be used before the scope
    // is decided.
    _mine = mine;
    _applyOwnerFilters();
    if (everyoneRows != null && _scope == _RecordingsScope.everyone) {
      await Future.wait([everyoneRows, _vm.loadMyRecordings(mine)]);
      _focusRowOnFirstLoad();
    } else {
      await _loadRecordings();
    }
    await Future.wait([scheduleLoad, seriesLoad]);
    if (!mounted || load != _loads) return;
    _lookupOwners();
  }

  static String _normalizeId(String id) => id.replaceAll('-', '').toLowerCase();

  /// Whether the user owns a recording, or a timer or rule the server still
  /// has. The plugin's timer ids can outlive the timers.
  bool _ownsAnything(MineIds mine) {
    if (mine.itemIds.isNotEmpty) return true;
    bool anyIn(Iterable<String> loaded, Set<String> owned) {
      if (owned.isEmpty) return false;
      final normalized = {for (final id in owned) _normalizeId(id)};
      return loaded.any((id) => normalized.contains(_normalizeId(id)));
    }

    return anyIn(_scheduleVm.loadedTimerIds, mine.timerIds) ||
        anyIn(_seriesVm.loadedSeriesTimerIds, mine.seriesTimerIds);
  }

  bool get _mineOnly => _mine != null && _scope == _RecordingsScope.mine;

  void _applyOwnerFilters() {
    final mine = _mineOnly ? _mine : null;
    _scheduleVm.applyOwnerFilter(mine?.timerIds);
    _seriesVm.applyOwnerFilter(mine?.seriesTimerIds);
  }

  Future<void> _loadRecordings() async {
    final mine = _mine;
    if (mine != null && _scope == _RecordingsScope.mine) {
      _pendingRowFocus = false;
      await _vm.loadMine(mine);
      return;
    }
    await _vm.load(mine: mine);
    _focusRowOnFirstLoad();
  }

  void _focusRowOnFirstLoad() {
    if (_pendingRowFocus && _vm.state == RecordingsState.ready) {
      _pendingRowFocus = false;
      if (_vm.myRecordings.isNotEmpty) _focusMyRecordingsRow();
    }
  }

  void _focusMyRecordingsRow() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _myRowFocus.context == null) return;
      final primary = FocusManager.instance.primaryFocus;
      final untouched = primary == null ||
          _headerFocus.hasFocus ||
          !FocusScope.of(context).hasFocus;
      if (untouched) _myRowFocus.requestFocus();
    });
  }

  Future<void> _setScope(_RecordingsScope scope) async {
    if (_mine == null || scope == _scope) return;
    setState(() => _scope = scope);
    GetIt.instance<UserPreferences>().set(
      UserPreferences.recordingsScope,
      scope == _RecordingsScope.mine ? 'mine' : 'everyone',
    );
    final load = ++_loads;
    _applyOwnerFilters();
    await _loadRecordings();
    if (!mounted || load != _loads) return;
    _lookupOwners();
  }

  /// One owners read for everything on screen.
  void _lookupOwners() {
    final owners = supportedRecordingOwners();
    if (owners == null) return;
    final itemIds = <String>{};
    final timerIds = <String>{};
    void add(Iterable<RecordingItem> items) {
      for (final item in items) {
        final timerId = item.timerId;
        if (timerId != null) {
          timerIds.add(timerId);
        } else if (item.id.isNotEmpty) {
          itemIds.add(item.id);
        }
      }
    }

    add(_vm.myRecordings);
    add(_vm.scheduledNext24h);
    add(_vm.recentRecordings);
    add(_vm.seriesRecordings);
    add(_vm.movieRecordings);
    add(_vm.sportsRecordings);
    add(_vm.kidsRecordings);
    for (final group in _scheduleVm.groups) {
      add(group.items);
    }
    owners.lookup(
      timerIds: timerIds,
      seriesTimerIds: [for (final t in _seriesVm.seriesTimers) t.id],
      itemIds: itemIds,
    );
  }

  /// The owners a card shows: all of them in Everyone, only the others in
  /// Mine so cards that are only yours stay clean. Null without the plugin.
  List<RecordingOwner> Function(OwnedKind, String)? get _ownersFor {
    final owners = supportedRecordingOwners();
    if (owners == null || _mine == null) return null;
    return _mineOnly ? owners.othersOf : owners.ownersOf;
  }

  List<RecordingOwner> Function(RecordingItem)? get _itemOwners {
    final ownersFor = _ownersFor;
    if (ownersFor == null) return null;
    return (item) => item.timerId != null
        ? ownersFor(OwnedKind.timer, item.timerId!)
        : ownersFor(OwnedKind.item, item.id);
  }

  /// Cancelling a series rule also cancels its scheduled showings, and a rule
  /// can be added or changed from a screen opened over this one, so every tab
  /// re-reads rather than keep the old list.
  Future<void> _onRecordingsChanged() async {
    if (!mounted) return;
    final scheduleRefresh = _scheduleVm.refresh();
    final seriesRefresh = _seriesVm.refresh();
    final owners = supportedRecordingOwners();
    if (owners == null || _mine == null) {
      _vm.refreshScheduled();
      return;
    }
    // What the user owns may have changed with it. The filters follow
    // whichever scope is showing once the ids are back, so a switch made
    // meanwhile still gets them.
    final mine = await _readMine(owners);
    if (!mounted || _mine == null) return;
    if (mine != null) _mine = mine;
    _applyOwnerFilters();
    await Future.wait([
      scheduleRefresh,
      seriesRefresh,
      _vm.refreshScheduled(mine: _mine),
    ]);
    if (!mounted) return;
    _lookupOwners();
  }

  @override
  void dispose() {
    liveTvRecordingRevision.removeListener(_onRecordingsChanged);
    _ownersService?.removeListener(_onOwnersChanged);
    _headerFocus.dispose();
    _myRowFocus.dispose();
    _vm.removeListener(_onChanged);
    _scheduleVm.removeListener(_onChanged);
    _seriesVm.removeListener(_onChanged);
    _vm.dispose();
    _scheduleVm.dispose();
    _seriesVm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildScreenContent(context));

  Widget _buildScreenContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        // Lets the screen tell whether focus is still on the header.
        Focus(
          focusNode: _headerFocus,
          canRequestFocus: false,
          skipTraversal: true,
          child: _buildHeader(),
        ),
        Expanded(child: _buildBody()),
      ],
    );
  }

  int get _recordingsCount =>
      _vm.recentRecordings.length +
      _vm.seriesRecordings.length +
      _vm.movieRecordings.length +
      _vm.sportsRecordings.length +
      _vm.kidsRecordings.length;

  int get _scheduledCount =>
      _scheduleVm.groups.fold(0, (sum, g) => sum + g.items.length);

  Widget _buildHeader() {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
      child: Row(
        children: [
          Text(
            l10n.recordings,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          // A phone is too narrow for every pill beside the title, so there
          // they wrap onto another line instead of running off the edge.
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                if (_mine != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: _ScopeSwitch(
                      mineLabel: l10n.recordingsScopeMine,
                      everyoneLabel: l10n.recordingsScopeEveryone,
                      mineActive: _scope == _RecordingsScope.mine,
                      onChanged: (mine) => _setScope(
                        mine ? _RecordingsScope.mine : _RecordingsScope.everyone,
                      ),
                    ),
                  ),
                _RecordingsPillButton(
                  label: '${l10n.recordings} ($_recordingsCount)',
                  isActive: _activeTab == _RecordingsTab.recordings,
                  onPressed: () =>
                      setState(() => _activeTab = _RecordingsTab.recordings),
                ),
                _RecordingsPillButton(
                  label: '${l10n.schedule} ($_scheduledCount)',
                  isActive: _activeTab == _RecordingsTab.scheduled,
                  onPressed: () =>
                      setState(() => _activeTab = _RecordingsTab.scheduled),
                ),
                _RecordingsPillButton(
                  label:
                      '${l10n.seriesRecordings} (${_seriesVm.seriesTimers.length})',
                  isActive: _activeTab == _RecordingsTab.series,
                  onPressed: () =>
                      setState(() => _activeTab = _RecordingsTab.series),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 4),
                  child: _RecordingsPillButton(
                    icon: Icons.arrow_back,
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return switch (_activeTab) {
      _RecordingsTab.recordings => _buildRecordingsTab(),
      _RecordingsTab.scheduled => _buildScheduledTab(),
      _RecordingsTab.series => _buildSeriesTab(),
    };
  }

  Widget _buildRecordingsTab() {
    if (_vm.state == RecordingsState.loading) {
      return Center(child: CircularProgressIndicator(color: AppColorScheme.accent));
    }
    if (_vm.state == RecordingsState.error) {
      return Center(
        child: Text(
          AppLocalizations.of(context).failedToLoadRecordings,
          style: const TextStyle(color: Colors.white54),
        ),
      );
    }
    final l10n = AppLocalizations.of(context);
    final rows = <Widget>[];
    final itemOwners = _itemOwners;
    void addRow(
      String title,
      List<RecordingItem> items, {
      FocusNode? firstItemFocusNode,
    }) {
      if (items.isEmpty) {
        return;
      }
      rows.add(
        _RecordingRow(
          title: title,
          items: items,
          imageApi: _vm.imageApi,
          onItemFocused: _vm.setFocusedItem,
          onItemTap: _onItemTap,
          ownersOf: itemOwners,
          highlightCurrentUser: !_mineOnly,
          firstItemFocusNode: firstItemFocusNode,
        ),
      );
    }

    // Everyone's view starts with the user's own, so they come first. In
    // Mine every row is already theirs.
    if (_mine != null && !_mineOnly) {
      addRow(
        l10n.myRecordings,
        _vm.myRecordings,
        firstItemFocusNode: _myRowFocus,
      );
    }
    addRow(l10n.scheduledInNext24Hours, _vm.scheduledNext24h);
    addRow(l10n.recentRecordings, _vm.recentRecordings);
    addRow(l10n.tvSeries, _vm.seriesRecordings);
    addRow(l10n.movies, _vm.movieRecordings);
    addRow(l10n.sports, _vm.sportsRecordings);
    addRow(l10n.kids, _vm.kidsRecordings);
    if (rows.isEmpty) {
      return Center(
        child: Text(
          _mineOnly ? l10n.myRecordingsEmpty : l10n.noRecordingsFound,
          style: TextStyle(
            color: AppColorScheme.onBackground.withValues(alpha: 0.5),
          ),
        ),
      );
    }
    return ListView(padding: const EdgeInsets.only(bottom: 24), children: rows);
  }

  Widget _buildScheduledTab() {
    if (_scheduleVm.state == ScheduleState.loading) {
      return Center(child: CircularProgressIndicator(color: AppColorScheme.accent));
    }
    if (_scheduleVm.state == ScheduleState.error) {
      return Center(
        child: Text(
          AppLocalizations.of(context).failedToLoadSchedule,
          style: const TextStyle(color: Colors.white54),
        ),
      );
    }
    if (_scheduleVm.groups.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noScheduledRecordings,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        for (final group in _scheduleVm.groups)
          _RecordingRow(
            title: group.dateLabel,
            items: group.items,
            imageApi: _scheduleVm.imageApi,
            onItemFocused: _scheduleVm.setFocusedItem,
            onItemTap: (item) => _cancelTimer(item),
            ownersOf: _itemOwners,
            highlightCurrentUser: !_mineOnly,
          ),
      ],
    );
  }

  Widget _buildSeriesTab() {
    if (_seriesVm.state == SeriesRecordingsState.loading) {
      return Center(child: CircularProgressIndicator(color: AppColorScheme.accent));
    }
    if (_seriesVm.state == SeriesRecordingsState.error) {
      return Center(
        child: Text(
          AppLocalizations.of(context).failedToLoadSeriesRecordings,
          style: const TextStyle(color: Colors.white54),
        ),
      );
    }
    if (_seriesVm.seriesTimers.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noSeriesRecordings,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        ),
      );
    }
    final seriesOwners = _ownersFor;
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        _SeriesTimerRow(
          timers: _seriesVm.seriesTimers,
          onItemFocused: _seriesVm.setFocusedTimer,
          onItemTap: (timer) => _showSeriesTimerOptions(timer),
          ownersOf: seriesOwners == null
              ? null
              : (timer) => seriesOwners(OwnedKind.series, timer.id),
          highlightCurrentUser: !_mineOnly,
        ),
      ],
    );
  }

  Future<void> _cancelTimer(RecordingItem item) async {
    final l10n = AppLocalizations.of(context);
    // Other owners get the shared warning in place of this question.
    final confirmed = await confirmRecordingCancel(
      context,
      OwnedKind.timer,
      item.timerId,
      confirm: () async => await _askCancelTimer(item) == true,
    );
    if (confirmed && mounted) {
      try {
        await _scheduleVm.cancelTimer(
          item.timerId ?? (throw StateError('No timer for ${item.name}')),
        );
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.failedToCancelRecording)),
          );
        }
      }
    }
  }

  Future<bool?> _askCancelTimer(RecordingItem item) {
    final l10n = AppLocalizations.of(context);
    return showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(l10n.cancelRecording, style: const TextStyle(color: Colors.white)),
        content: Text(
          l10n.cancelScheduledRecordingOf(item.name),
          style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(false),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.yesCancel),
          ),
        ],
      ),
    );
  }

  Future<void> _showSeriesTimerOptions(SeriesTimerItem timer) async {
    final option = await showSeriesTimerOptionsDialog(
      context: context,
      name: timer.name,
      subtitle: timer.subtitle,
      seriesTimerId: timer.id,
    );
    if (!mounted) return;
    switch (option) {
      case SeriesTimerOption.changeSettings:
        await _changeSeriesTimer(timer);
      case SeriesTimerOption.join:
        await _joinSeriesTimer(timer);
      case SeriesTimerOption.cancel:
        await _cancelSeriesTimer(timer);
      case null:
        break;
    }
  }

  Future<void> _changeSeriesTimer(SeriesTimerItem timer) async {
    final l10n = AppLocalizations.of(context);
    try {
      final changed = await changeSeriesRecordingEpisodes(
        context: context,
        liveTvApi: GetIt.instance<MediaServerClient>().liveTvApi,
        seriesTimerId: timer.id,
      );
      if (!changed || !mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.seriesRecordingUpdated)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.failedToUpdateSeriesRecording)),
      );
    }
  }

  Future<void> _joinSeriesTimer(SeriesTimerItem timer) async {
    final l10n = AppLocalizations.of(context);
    try {
      await joinRecording(OwnedKind.series, timer.id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.seriesSetToRecord)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.unableToCreateSeriesRecording)),
      );
    }
  }

  Future<void> _cancelSeriesTimer(SeriesTimerItem timer) async {
    final l10n = AppLocalizations.of(context);
    // Other owners get the shared warning in place of this question.
    final confirmed = await confirmRecordingCancel(
      context,
      OwnedKind.series,
      timer.id,
      confirm: () async => await _askCancelSeriesTimer(timer) == true,
    );
    if (confirmed && mounted) {
      try {
        await _seriesVm.cancelSeriesTimer(timer.id);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.failedToCancelSeriesRecording)),
          );
        }
      }
    }
  }

  Future<bool?> _askCancelSeriesTimer(SeriesTimerItem timer) {
    final l10n = AppLocalizations.of(context);
    return showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(l10n.cancelSeriesRecordingQuestion, style: const TextStyle(color: Colors.white)),
        content: Text(
          l10n.stopRecordingName(timer.name),
          style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
        ),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(false),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx, rootNavigator: true).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.yesCancel),
          ),
        ],
      ),
    );
  }

  void _onItemTap(RecordingItem item) {
    // Opened from Mine, a series lists only the user's own episodes.
    final mine = _mineOnly && item.timerId == null ? _mine : null;
    context.push(
      Destinations.itemDetail.replaceFirst(':itemId', item.id),
      extra: mine,
    );
  }
}

class _SeriesTimerRow extends StatelessWidget {
  final List<SeriesTimerItem> timers;
  final ValueChanged<SeriesTimerItem> onItemFocused;
  final ValueChanged<SeriesTimerItem> onItemTap;

  /// The owners each card's badge shows, or null for no badges.
  final List<RecordingOwner> Function(SeriesTimerItem)? ownersOf;
  final bool highlightCurrentUser;

  const _SeriesTimerRow({
    required this.timers,
    required this.onItemFocused,
    required this.onItemTap,
    this.ownersOf,
    this.highlightCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: _rowStripHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: _rowStripPadding,
          itemCount: timers.length,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final timer = timers[index];
            return _SeriesTimerCard(
              timer: timer,
              owners: ownersOf?.call(timer),
              highlightCurrentUser: highlightCurrentUser,
              onFocused: () => onItemFocused(timer),
              onTap: () => onItemTap(timer),
            );
          },
        ),
      ),
    );
  }
}

class _SeriesTimerCard extends StatefulWidget {
  final SeriesTimerItem timer;
  /// Null without the plugin: no badge, and the card as it always was.
  final List<RecordingOwner>? owners;
  final bool highlightCurrentUser;
  final VoidCallback onFocused;
  final VoidCallback onTap;

  const _SeriesTimerCard({
    required this.timer,
    this.owners,
    this.highlightCurrentUser = false,
    required this.onFocused,
    required this.onTap,
  });

  @override
  State<_SeriesTimerCard> createState() => _SeriesTimerCardState();
}

class _SeriesTimerCardState extends State<_SeriesTimerCard> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final cardExpansion =
        GetIt.instance<UserPreferences>().get(UserPreferences.cardFocusExpansion);
    final scale = cardExpansion && showFocusBorder ? 1.08 : 1.0;
    final alpha = showFocusBorder ? 1.0 : 0.75;
    final focusColor = Color(
      GetIt.instance<UserPreferences>().get(UserPreferences.focusColor).colorValue,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        onFocusChange: (focused) {
          setFocused(focused);
          if (focused) widget.onFocused();
        },
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 150),
            child: Opacity(
              opacity: alpha,
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 112,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: AppRadius.circular(4),
                        border: showFocusBorder
                            ? Border.fromBorderSide(
                                ThemeRegistry.active.borders.focusBorder.copyWith(
                                  color: focusColor,
                                ),
                              )
                            : null,
                      ),
                      child: _withOwnerBadge(
                        owners: widget.owners,
                        highlightCurrentUser: widget.highlightCurrentUser,
                        child: Center(
                          child: Icon(
                            Icons.fiber_smart_record,
                            size: 48,
                            color: showFocusBorder
                                ? AppColorScheme.onBackground.withValues(alpha: 0.4)
                                : AppColorScheme.onBackground.withValues(alpha: 0.15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.timer.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.timer.subtitle.isNotEmpty)
                      Text(
                        widget.timer.subtitle,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The owner badge in the thumbnail's bottom-right corner, clear of the
/// incomplete badge top-left, sized from the thumbnail's actual width.
/// [owners] is null without the plugin, which leaves [child] as it was; the
/// layout is otherwise the same with or without owners, so the artwork isn't
/// rebuilt when they arrive.
Widget _withOwnerBadge({
  required List<RecordingOwner>? owners,
  required bool highlightCurrentUser,
  required Widget child,
}) {
  if (owners == null) return child;
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;
      final inset = width * 0.03;
      return Stack(
        fit: StackFit.expand,
        children: [
          child,
          if (owners.isNotEmpty)
            Positioned(
              right: inset,
              bottom: inset,
              child: RecordingOwnerBadge(
                owners: owners,
                cardWidth: width,
                highlightCurrentUser: highlightCurrentUser,
              ),
            ),
        ],
      );
    },
  );
}

/// Mine | Everyone, styled as a pair of pills on one track so it reads as a
/// switch rather than two more tabs. Each half takes focus on its own.
class _ScopeSwitch extends StatelessWidget {
  final String mineLabel;
  final String everyoneLabel;
  final bool mineActive;
  final ValueChanged<bool> onChanged;

  const _ScopeSwitch({
    required this.mineLabel,
    required this.everyoneLabel,
    required this.mineActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColorScheme.onBackground.withValues(alpha: 0.10),
        borderRadius: AppRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RecordingsPillButton(
            label: mineLabel,
            isActive: mineActive,
            quiet: true,
            onPressed: () => onChanged(true),
          ),
          _RecordingsPillButton(
            label: everyoneLabel,
            isActive: !mineActive,
            quiet: true,
            onPressed: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _RecordingsPillButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback? onPressed;

  /// No fill while inactive, for a half of [_ScopeSwitch] on its track.
  final bool quiet;

  const _RecordingsPillButton({
    this.label,
    this.icon,
    this.isActive = false,
    this.onPressed,
    this.quiet = false,
  });

  @override
  State<_RecordingsPillButton> createState() => _RecordingsPillButtonState();
}

class _RecordingsPillButtonState extends State<_RecordingsPillButton> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final active = _focused || widget.isActive;
    return Material(
      color: Colors.transparent,
      borderRadius: AppRadius.circular(20),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: AppRadius.circular(20),
        focusColor: Colors.transparent,
        hoverColor: Colors.white.withValues(alpha: 0.05),
        splashColor: Colors.white24,
        highlightColor: Colors.transparent,
        onFocusChange: (f) {
          if (_focused != f) setState(() => _focused = f);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: active
                ? AppColorScheme.accent.withValues(alpha: _focused ? 1.0 : 0.7)
                : widget.quiet
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.10),
            borderRadius: AppRadius.circular(20),
          ),
          child: widget.icon != null
              ? Icon(widget.icon, color: Colors.white.withValues(alpha: active ? 1.0 : 0.8), size: 18)
              : Text(
                  widget.label ?? '',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: active ? 1.0 : 0.8),
                    fontSize: 13,
                  ),
                ),
        ),
      ),
    );
  }
}

// A focused card grows by its focus expansion (about 8%), so the strip leaves
// room above and below it; without it the list clips the card's top edge and
// focus outline.
const double _rowStripFocusRoom = 8;
const double _rowStripHeight = 160 + 2 * _rowStripFocusRoom;
const EdgeInsets _rowStripPadding = EdgeInsets.symmetric(
  horizontal: 60,
  vertical: _rowStripFocusRoom,
);

class _RecordingRow extends StatelessWidget {
  final String title;
  final List<RecordingItem> items;
  final ImageApi imageApi;
  final ValueChanged<RecordingItem> onItemFocused;
  final ValueChanged<RecordingItem> onItemTap;

  /// The owners each card's badge shows, or null for no badges.
  final List<RecordingOwner> Function(RecordingItem)? ownersOf;
  final bool highlightCurrentUser;

  /// Given to the first card, so the screen can land focus on this row.
  final FocusNode? firstItemFocusNode;

  const _RecordingRow({
    required this.title,
    required this.items,
    required this.imageApi,
    required this.onItemFocused,
    required this.onItemTap,
    this.ownersOf,
    this.highlightCurrentUser = false,
    this.firstItemFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return RevealOnFocus(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60, bottom: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: _rowStripHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: _rowStripPadding,
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _RecordingCard(
                    item: item,
                    imageUrl: item.imageUrl(imageApi),
                    owners: ownersOf?.call(item),
                    highlightCurrentUser: highlightCurrentUser,
                    focusNode: index == 0 ? firstItemFocusNode : null,
                    onFocused: () => onItemFocused(item),
                    onTap: () => onItemTap(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordingCard extends StatefulWidget {
  final RecordingItem item;
  final String? imageUrl;
  /// Null without the plugin: no badge, and the card as it always was.
  final List<RecordingOwner>? owners;
  final bool highlightCurrentUser;
  final FocusNode? focusNode;
  final VoidCallback onFocused;
  final VoidCallback onTap;

  const _RecordingCard({
    required this.item,
    required this.imageUrl,
    this.owners,
    this.highlightCurrentUser = false,
    this.focusNode,
    required this.onFocused,
    required this.onTap,
  });

  @override
  State<_RecordingCard> createState() => _RecordingCardState();
}

class _RecordingCardState extends State<_RecordingCard> with FocusStateMixin {

  @override
  Widget build(BuildContext context) {
    final cardExpansion =
        GetIt.instance<UserPreferences>().get(UserPreferences.cardFocusExpansion);
    final scale = cardExpansion && showFocusBorder ? 1.08 : 1.0;
    final alpha = showFocusBorder ? 1.0 : 0.75;
    final focusColor = Color(
      GetIt.instance<UserPreferences>().get(UserPreferences.focusColor).colorValue,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (focused) {
          setFocused(focused);
          if (focused) widget.onFocused();
        },
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 150),
            child: Opacity(
              opacity: alpha,
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 112,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: AppRadius.circular(4),
                        border: showFocusBorder
                            ? Border.fromBorderSide(
                                ThemeRegistry.active.borders.focusBorder.copyWith(
                                  color: focusColor,
                                ),
                              )
                            : null,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: _withOwnerBadge(
                        owners: widget.owners,
                        highlightCurrentUser: widget.highlightCurrentUser,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            _buildImage(),
                            Positioned(
                              top: 6,
                              left: 6,
                              child: IncompleteRecordingBadge(
                                itemId: widget.item.id,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.item.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.item.subtitle.isNotEmpty)
                      Text(
                        widget.item.subtitle,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (widget.imageUrl != null) {
      return OfflineAwareImage(
        imageUrl: widget.imageUrl!,
        fit: BoxFit.cover,
        width: 200,
        height: 112,
      );
    }
    return Center(
      child: Icon(
        Icons.fiber_dvr,
        size: 48,
        color: Colors.white.withValues(alpha: 0.2),
      ),
    );
  }
}
