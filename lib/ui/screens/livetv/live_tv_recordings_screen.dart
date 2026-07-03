import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/viewmodels/recordings_view_model.dart';
import '../../../data/viewmodels/schedule_view_model.dart';
import '../../../data/viewmodels/series_recordings_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/overlay_sheet.dart';

class LiveTvRecordingsScreen extends StatefulWidget {
  const LiveTvRecordingsScreen({super.key});

  @override
  State<LiveTvRecordingsScreen> createState() => _LiveTvRecordingsScreenState();
}

enum _RecordingsTab { recordings, scheduled, series }

class _LiveTvRecordingsScreenState extends State<LiveTvRecordingsScreen> {
  late final RecordingsViewModel _vm;
  late final ScheduleViewModel _scheduleVm;
  late final SeriesRecordingsViewModel _seriesVm;
  _RecordingsTab _activeTab = _RecordingsTab.recordings;

  @override
  void initState() {
    super.initState();
    _vm = RecordingsViewModel(GetIt.instance<MediaServerClient>());
    _scheduleVm = ScheduleViewModel(GetIt.instance<MediaServerClient>());
    _seriesVm = SeriesRecordingsViewModel(GetIt.instance<MediaServerClient>());
    _vm.addListener(_onChanged);
    _scheduleVm.addListener(_onChanged);
    _seriesVm.addListener(_onChanged);
    _vm.load();
    _scheduleVm.load();
    _seriesVm.load();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
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
        _buildHeader(),
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
          const Spacer(),
          _RecordingsPillButton(
            label: '${l10n.recordings} ($_recordingsCount)',
            isActive: _activeTab == _RecordingsTab.recordings,
            onPressed: () => setState(() => _activeTab = _RecordingsTab.recordings),
          ),
          const SizedBox(width: 8),
          _RecordingsPillButton(
            label: '${l10n.schedule} ($_scheduledCount)',
            isActive: _activeTab == _RecordingsTab.scheduled,
            onPressed: () => setState(() => _activeTab = _RecordingsTab.scheduled),
          ),
          const SizedBox(width: 8),
          _RecordingsPillButton(
            label: '${l10n.seriesRecordings} (${_seriesVm.seriesTimers.length})',
            isActive: _activeTab == _RecordingsTab.series,
            onPressed: () => setState(() => _activeTab = _RecordingsTab.series),
          ),
          const SizedBox(width: 12),
          _RecordingsPillButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).maybePop(),
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
    void addRow(String title, List<RecordingItem> items) {
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
        ),
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
          l10n.noRecordingsFound,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
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
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        _SeriesTimerRow(
          timers: _seriesVm.seriesTimers,
          onItemFocused: _seriesVm.setFocusedTimer,
          onItemTap: (timer) => _cancelSeriesTimer(timer),
        ),
      ],
    );
  }

  Future<void> _cancelTimer(RecordingItem item) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
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
    if (confirmed == true) {
      try {
        await _scheduleVm.cancelTimer(item.id);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.failedToCancelRecording)),
          );
        }
      }
    }
  }

  Future<void> _cancelSeriesTimer(SeriesTimerItem timer) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
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
    if (confirmed == true) {
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

  void _onItemTap(RecordingItem item) {
    context.push(Destinations.itemDetail.replaceFirst(':itemId', item.id));
  }
}

class _SeriesTimerRow extends StatelessWidget {
  final List<SeriesTimerItem> timers;
  final ValueChanged<SeriesTimerItem> onItemFocused;
  final ValueChanged<SeriesTimerItem> onItemTap;

  const _SeriesTimerRow({
    required this.timers,
    required this.onItemFocused,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 60),
          itemCount: timers.length,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final timer = timers[index];
            return _SeriesTimerCard(
              timer: timer,
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
  final VoidCallback onFocused;
  final VoidCallback onTap;

  const _SeriesTimerCard({
    required this.timer,
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
                      child: Center(
                        child: Icon(
                          Icons.fiber_smart_record,
                          size: 48,
                          color: showFocusBorder
                              ? Colors.white.withValues(alpha: 0.4)
                              : Colors.white.withValues(alpha: 0.15),
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

class _RecordingsPillButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback? onPressed;

  const _RecordingsPillButton({
    this.label,
    this.icon,
    this.isActive = false,
    this.onPressed,
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

class _RecordingRow extends StatelessWidget {
  final String title;
  final List<RecordingItem> items;
  final ImageApi imageApi;
  final ValueChanged<RecordingItem> onItemFocused;
  final ValueChanged<RecordingItem> onItemTap;

  const _RecordingRow({
    required this.title,
    required this.items,
    required this.imageApi,
    required this.onItemFocused,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 60),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = items[index];
                return _RecordingCard(
                  item: item,
                  imageUrl: item.imageUrl(imageApi),
                  onFocused: () => onItemFocused(item),
                  onTap: () => onItemTap(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RecordingCard extends StatefulWidget {
  final RecordingItem item;
  final String? imageUrl;
  final VoidCallback onFocused;
  final VoidCallback onTap;

  const _RecordingCard({
    required this.item,
    required this.imageUrl,
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
        onFocusChange: (focused) {
          setFocused(focused);
          if (focused) widget.onFocused();
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
                      child: _buildImage(),
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
      return CachedNetworkImage(
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
