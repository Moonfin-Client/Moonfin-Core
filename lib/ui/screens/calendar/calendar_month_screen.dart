import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/calendar_entry.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/date_format_util.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/settings/settings_preview_scope.dart';
import 'calendar_agenda_view.dart';
import 'calendar_common.dart';
import 'calendar_controller.dart';

/// The full calendar behind both styles: a month grid with the picked day's
/// entries under it on phones and beside it on TV and desktop.
class CalendarMonthScreen extends StatefulWidget {
  const CalendarMonthScreen({super.key});

  @override
  State<CalendarMonthScreen> createState() => _CalendarMonthScreenState();
}

class _CalendarMonthScreenState extends State<CalendarMonthScreen> {
  final _c = CalendarController();
  late DateTime _selected;
  late DateTime _month;
  // One node per grid slot, so picking a day never moves a node from one
  // cell to another under the focus.
  final _cellNodes = List.generate(
    42,
    (i) => FocusNode(debugLabel: 'CalendarMonthCell$i'),
  );
  final _firstPanelRow = FocusNode(debugLabel: 'CalendarMonthPanel');

  @override
  void initState() {
    super.initState();
    _selected = _c.today;
    _month = DateTime(_selected.year, _selected.month);
    _c.load();
  }

  @override
  void dispose() {
    for (final n in _cellNodes) {
      n.dispose();
    }
    _firstPanelRow.dispose();
    _c.dispose();
    super.dispose();
  }

  int _weekStart(BuildContext context) =>
      switch (previewValue(context, UserPreferences.calendarWeekStart)) {
        CalendarWeekStart.sunday => DateTime.sunday,
        CalendarWeekStart.monday => DateTime.monday,
        // Material counts from Sunday as 0, DateTime from Monday as 1.
        CalendarWeekStart.locale =>
          MaterialLocalizations.of(context).firstDayOfWeekIndex == 0
              ? DateTime.sunday
              : MaterialLocalizations.of(context).firstDayOfWeekIndex,
      };

  bool get _canGoBack =>
      DateTime(_month.year, _month.month).isAfter(_c.windowStart);
  bool get _canGoForward =>
      DateTime(_month.year, _month.month + 1).isBefore(_c.windowEnd);

  void _shiftMonth(int by) {
    setState(() {
      _month = DateTime(_month.year, _month.month + by);
      final today = _c.today;
      _selected = _month.year == today.year && _month.month == today.month
          ? today
          : _month;
    });
  }

  void _goToday() {
    final today = _c.today;
    setState(() {
      _selected = today;
      _month = DateTime(today.year, today.month);
    });
  }

  void _select(DateTime day) {
    if (day == _selected) return;
    final newMonth = day.month != _month.month || day.year != _month.year;
    setState(() {
      _selected = day;
      if (newMonth) _month = DateTime(day.year, day.month);
    });
    if (!newMonth) return;
    // The new month lays its days out in other slots, so focus follows the
    // day to wherever it landed.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final i = _gridDays(context).indexOf(day);
      if (i < 0) return;
      final node = _cellNodes[i];
      // Directional focus walks back through the slots it came from, which
      // hold other days now.
      final scope = node.nearestScope;
      if (scope != null) {
        FocusTraversalGroup.maybeOfNode(node)?.invalidateScopeData(scope);
      }
      node.requestFocus();
    });
  }

  List<DateTime> _gridDays(BuildContext context) {
    final first = DateTime(_month.year, _month.month);
    final lead = (first.weekday - _weekStart(context) + 7) % 7;
    final start = first.subtract(Duration(days: lead));
    final daysInMonth = DateTime(_month.year, _month.month + 1, 0).day;
    final rows = ((lead + daysInMonth) / 7).ceil();
    return [
      for (var i = 0; i < rows * 7; i++)
        DateTime(start.year, start.month, start.day + i),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final body = ListenableBuilder(
      listenable: _c,
      builder: (context, _) => PlatformDetection.useMobileUi
          ? _buildMobile(context)
          : _buildWide(context),
    );
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      // The settings preview draws its own navbar around the grid.
      body: inSettingsPreview(context)
          ? body
          : NavigationLayout(
              activeRoute: Destinations.calendar,
              showBackButton: true,
              pinTopToolbar: true,
              child: body,
            ),
    );
  }

  Widget _header(BuildContext context, {required bool mobile}) {
    final l10n = AppLocalizations.of(context);
    final title = DateFormat.yMMMM(l10n.localeName).format(_month);
    final arrow = mobile
        ? (IconData icon, bool enabled, VoidCallback onTap) => IconButton(
            icon: Icon(icon, color: AppColorScheme.onSurface),
            onPressed: enabled ? onTap : null,
          )
        : (IconData icon, bool enabled, VoidCallback onTap) => Opacity(
            opacity: enabled ? 1 : 0.35,
            child: CalendarButton(
              label: '',
              icon: icon,
              compact: true,
              onPressed: enabled ? onTap : null,
            ),
          );
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppColorScheme.onSurface,
              fontSize: mobile ? 24 : 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        arrow(Icons.chevron_left_rounded, _canGoBack, () => _shiftMonth(-1)),
        const SizedBox(width: 6),
        arrow(Icons.chevron_right_rounded, _canGoForward, () => _shiftMonth(1)),
        const SizedBox(width: 10),
        if (mobile)
          TextButton(
            onPressed: _goToday,
            child: Text(l10n.upcomingEpisodeToday),
          )
        else
          CalendarButton(
            label: l10n.upcomingEpisodeToday,
            icon: Icons.today_rounded,
            compact: true,
            onPressed: _goToday,
          ),
      ],
    );
  }

  Widget _weekdays(BuildContext context, List<DateTime> days) {
    final locale = AppLocalizations.of(context).localeName;
    return Row(
      children: [
        for (final d in days.take(7))
          Expanded(
            child: Center(
              child: Text(
                DateFormat.E(locale).format(d),
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final days = _gridDays(context);
    final dayEntries = _c.on(_selected);
    // The bottom bar layout floats the back button over the content.
    final top =
        calendarChromeInsets(context).top +
        (NavigationLayout.usesBottomNavbar ? 48 : 0);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        16,
        top,
        16,
        bottomNavContentPadding(context, 24),
      ),
      children: [
        _header(context, mobile: true),
        const SizedBox(height: 8),
        _weekdays(context, days),
        const SizedBox(height: 6),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 0.9,
          children: [
            for (final d in days)
              _MobileCell(
                day: d,
                inMonth: d.month == _month.month,
                selected: d == _selected,
                today: d == _c.today,
                entries: _c.on(d),
                now: _c.now,
                onTap: () => _select(d),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          calendarDayName(context, _selected, _c.today),
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        if (calendarStateView(context, _c, empty: false, emptyText: '')
            case final state?)
          SizedBox(height: 200, child: state)
        else if (dayEntries.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              l10n.calendarEmptyDay,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          )
        else
          for (final e in dayEntries)
            CalendarAgendaRow(entry: e, controller: _c, mobile: true),
      ],
    );
  }

  Widget _buildWide(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final insets = calendarChromeInsets(context);
    final days = _gridDays(context);
    final dayEntries = _c.on(_selected);
    final dayName = calendarDayName(context, _selected, _c.today);
    final fullDate = formatFullCalendarDate(_selected, locale: l10n.localeName);
    // Today, tomorrow and yesterday keep their word above the date. Any other
    // day's name would only repeat the date.
    final relativeDay =
        dayName != formatShortDayName(_selected, locale: l10n.localeName);
    final state = calendarStateView(context, _c, empty: false, emptyText: '');
    final rows = days.length ~/ 7;
    final selectedNode =
        _cellNodes[days.indexOf(_selected).clamp(0, days.length - 1)];
    return Padding(
      padding: insets.copyWith(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(context, mobile: false),
                const SizedBox(height: 12),
                _weekdays(context, days),
                const SizedBox(height: 6),
                Expanded(
                  child:
                      state ??
                      RequestInitialFocus(
                        key: ValueKey('month-${_month.year}-${_month.month}'),
                        targetNode: selectedNode,
                        child: Column(
                          children: [
                            for (var r = 0; r < rows; r++)
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    for (final (c, d)
                                        in days
                                            .sublist(r * 7, r * 7 + 7)
                                            .indexed)
                                      Expanded(
                                        child: _WideCell(
                                          day: d,
                                          inMonth: d.month == _month.month,
                                          selected: d == _selected,
                                          today: d == _c.today,
                                          entries: _c.on(d),
                                          now: _c.now,
                                          focusNode: _cellNodes[r * 7 + c],
                                          onFocus: () => _select(d),
                                          onOpen: () {
                                            if (_c.on(d).isNotEmpty) {
                                              _firstPanelRow.requestFocus();
                                            }
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  relativeDay ? dayName : fullDate,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (relativeDay) ...[
                  const SizedBox(height: 2),
                  Text(
                    fullDate,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                      fontSize: 14,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Expanded(
                  child: dayEntries.isEmpty
                      ? Center(
                          child: Text(
                            l10n.calendarEmptyDay,
                            style: TextStyle(
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        )
                      : ListView(
                          children: [
                            for (final (i, e) in dayEntries.indexed)
                              CalendarAgendaRow(
                                entry: e,
                                controller: _c,
                                mobile: false,
                                compact: true,
                                focusNode: i == 0 ? _firstPanelRow : null,
                                // Back to the picked day, not the cell nearest the panel.
                                onNavigateLeft: selectedNode.requestFocus,
                              ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool _hasPremiere(List<CalendarEntry> entries) =>
    calendarShowsBadges &&
    entries.any(
      (e) =>
          e.badge == CalendarBadge.seriesPremiere ||
          e.badge == CalendarBadge.seasonPremiere,
    );

class _MobileCell extends StatelessWidget {
  const _MobileCell({
    required this.day,
    required this.inMonth,
    required this.selected,
    required this.today,
    required this.entries,
    required this.now,
    required this.onTap,
  });

  final DateTime day;
  final bool inMonth;
  final bool selected;
  final bool today;
  final List<CalendarEntry> entries;
  final DateTime now;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dots = entries
        .take(3)
        .map((e) => calendarColor(context, e, now))
        .toList();
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: selected
              ? AppColorScheme.accent.withValues(alpha: 0.22)
              : Colors.transparent,
          border: today
              ? Border.all(color: AppColorScheme.accent, width: 1.5)
              : null,
          borderRadius: AppRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${day.day}',
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(
                  alpha: inMonth ? 1 : 0.3,
                ),
                fontSize: 15,
                fontWeight: today || selected
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            if (_hasPremiere(entries))
              Text(
                l10n.calendarBadgeNew,
                style: TextStyle(
                  color: AppColorScheme.accent,
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final c in dots)
                    Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                      decoration: BoxDecoration(
                        color: c,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _WideCell extends StatelessWidget {
  const _WideCell({
    required this.day,
    required this.inMonth,
    required this.selected,
    required this.today,
    required this.entries,
    required this.now,
    required this.onFocus,
    required this.onOpen,
    this.focusNode,
  });

  final DateTime day;
  final bool inMonth;
  final bool selected;
  final bool today;
  final List<CalendarEntry> entries;
  final DateTime now;
  final VoidCallback onFocus;
  final VoidCallback onOpen;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final shown = entries.take(2).toList();
    final more = entries.length - shown.length;
    return Padding(
      padding: const EdgeInsets.all(3),
      child: FocusableWrapper(
        focusNode: focusNode,
        onSelect: () {
          onFocus();
          onOpen();
        },
        onFocusChange: (f) {
          if (f) onFocus();
        },
        borderRadius: 10,
        disableScale: true,
        highlightOnHover: true,
        semanticLabel: DateFormat.yMMMMd(l10n.localeName).format(day),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
          decoration: BoxDecoration(
            color: selected
                ? AppColorScheme.accent.withValues(alpha: 0.2)
                : AppColorScheme.onSurface.withValues(
                    alpha: inMonth ? 0.05 : 0.02,
                  ),
            border: today
                ? Border.all(color: AppColorScheme.accent, width: 1.5)
                : null,
            borderRadius: AppRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${day.day}',
                    style: TextStyle(
                      // The picked cell is tinted with the accent already.
                      color: today && !selected
                          ? AppColorScheme.accent
                          : AppColorScheme.onSurface.withValues(
                              alpha: inMonth ? 0.95 : 0.3,
                            ),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  if (_hasPremiere(entries))
                    CalendarTag(
                      l10n.calendarBadgeNew,
                      color: AppColorScheme.accent,
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ClipRect(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final e in shown)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Row(
                            children: [
                              Container(
                                width: 3,
                                height: 14,
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  color: calendarColor(context, e, now),
                                  borderRadius: AppRadius.circular(2),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  e.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColorScheme.onSurface.withValues(
                                      alpha: inMonth ? 0.85 : 0.35,
                                    ),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (more > 0)
                        Text(
                          l10n.studioMoreCount(more),
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.55,
                            ),
                            fontSize: 11,
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
    );
  }
}
