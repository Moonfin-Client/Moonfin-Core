import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/calendar_entry.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/date_format_util.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focus_theme.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/request_initial_focus.dart';
import 'calendar_common.dart';
import 'calendar_controller.dart';

/// The day by day list. Phones get one column, TV and desktop a list with a
/// preview of the focused entry beside it.
class CalendarAgendaView extends StatefulWidget {
  const CalendarAgendaView({super.key, required this.controller});

  final CalendarController controller;

  @override
  State<CalendarAgendaView> createState() => _CalendarAgendaViewState();
}

class _CalendarAgendaViewState extends State<CalendarAgendaView> {
  bool _recent = false;
  CalendarEntry? _focused;
  final _firstRow = FocusNode(debugLabel: 'CalendarAgendaFirstRow');
  final _rowNodes = <String, FocusNode>{};

  CalendarController get _c => widget.controller;

  @override
  void dispose() {
    _firstRow.dispose();
    for (final n in _rowNodes.values) {
      n.dispose();
    }
    super.dispose();
  }

  List<CalendarEntry> get _list => _recent ? _c.recent : _c.upcoming;

  FocusNode _nodeFor(CalendarEntry e, bool first) => first
      ? _firstRow
      : _rowNodes.putIfAbsent(e.key, () => FocusNode(debugLabel: e.key));

  void _setTab(bool recent) {
    if (recent == _recent) return;
    setState(() {
      _recent = recent;
      _focused = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = PlatformDetection.useMobileUi;
    final insets = calendarChromeInsets(context);
    final l10n = AppLocalizations.of(context);
    final list = _list;
    final state = calendarStateView(
      context,
      _c,
      empty: list.isEmpty,
      emptyText: _recent
          ? l10n.calendarNothingRecent
          : l10n.calendarNothingUpcoming,
    );
    final header = _Header(recent: _recent, onTab: _setTab, mobile: mobile);
    if (mobile) {
      return Padding(
        padding: EdgeInsets.only(top: insets.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: header,
            ),
            const SizedBox(height: 8),
            Expanded(child: state ?? _buildList(context, list, mobile: true)),
          ],
        ),
      );
    }
    final focused = _focused != null && list.contains(_focused)
        ? _focused
        : null;
    final preview = focused ?? (list.isEmpty ? null : list.first);
    return Padding(
      padding: insets.copyWith(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                const SizedBox(height: 12),
                Expanded(
                  child:
                      state ??
                      RequestInitialFocus(
                        key: ValueKey('agenda-$_recent-${list.length}'),
                        targetNode: _firstRow,
                        child: _buildList(context, list, mobile: false),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: preview == null
                ? const SizedBox.shrink()
                : _Preview(
                    entry: preview,
                    controller: _c,
                    onBackToList: () => _nodeFor(
                      preview,
                      identical(preview, list.first),
                    ).requestFocus(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    List<CalendarEntry> list, {
    required bool mobile,
  }) {
    final rows = <Object>[];
    DateTime? day;
    for (final e in list) {
      if (e.day != day) {
        day = e.day;
        rows.add(day);
      }
      rows.add(e);
    }
    return RefreshIndicator(
      onRefresh: () => _c.load(refresh: true),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(
          mobile ? 16 : 0,
          0,
          mobile ? 16 : 8,
          mobile ? bottomNavContentPadding(context, 24) : 24,
        ),
        itemCount: rows.length,
        itemBuilder: (context, i) {
          final row = rows[i];
          if (row is DateTime) {
            return _DayHeader(day: row, today: _c.today, first: i == 0);
          }
          final e = row as CalendarEntry;
          final first = identical(e, list.first);
          return CalendarAgendaRow(
            entry: e,
            controller: _c,
            mobile: mobile,
            focusNode: mobile ? null : _nodeFor(e, first),
            onFocused: mobile
                ? null
                : () {
                    if (!identical(_focused, e)) setState(() => _focused = e);
                  },
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.recent,
    required this.onTab,
    required this.mobile,
  });

  final bool recent;
  final ValueChanged<bool> onTab;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final title = Text(
      l10n.calendar,
      style: TextStyle(
        color: AppColorScheme.onSurface,
        fontSize: mobile ? 28 : 30,
        fontWeight: FontWeight.w700,
      ),
    );
    final full = mobile
        ? IconButton(
            tooltip: l10n.calendarFullCalendar,
            icon: Icon(
              Icons.calendar_month_rounded,
              color: AppColorScheme.onSurface,
            ),
            onPressed: () => context.push(Destinations.calendarMonth),
          )
        : CalendarButton(
            key: const ValueKey('calendar-full-calendar'),
            label: l10n.calendarFullCalendar,
            icon: Icons.calendar_month_rounded,
            compact: true,
            // The end of the row. Without this, Right jumps up to the top bar.
            onNavigateRight: () {},
            onPressed: () => context.push(Destinations.calendarMonth),
          );
    final tabs = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TabChip(
          label: l10n.calendarUpcoming,
          selected: !recent,
          onTap: () => onTab(false),
        ),
        const SizedBox(width: 8),
        _TabChip(
          label: l10n.calendarRecentlyAired,
          selected: recent,
          onTap: () => onTab(true),
        ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: title),
            if (mobile) full,
          ],
        ),
        const SizedBox(height: 10),
        // On TV the button shares the tabs' row, so Right from the tabs
        // reaches it instead of skipping up to the top bar.
        if (mobile) tabs else Row(children: [tabs, const Spacer(), full]),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FocusableWrapper(
      onSelect: onTap,
      borderRadius: 18,
      disableScale: true,
      useBackgroundFocus: true,
      descendantsAreFocusable: false,
      semanticLabel: label,
      child: Builder(
        builder: (context) {
          final highlighted = FocusableWrapper.isHighlighted(context);
          final fg = highlighted
              ? FocusTheme.solidFocusForeground
              : selected
              ? AppColorScheme.onAccent
              : AppColorScheme.onSurface.withValues(alpha: 0.85);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: highlighted
                  ? Colors.transparent
                  : selected
                  ? AppColorScheme.accent
                  : AppColorScheme.onSurface.withValues(alpha: 0.1),
              borderRadius: AppRadius.circular(18),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: fg,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({
    required this.day,
    required this.today,
    required this.first,
  });

  final DateTime day;
  final DateTime today;
  final bool first;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final name = calendarDayName(context, day, today);
    final date = DateFormat.MMMMd(l10n.localeName).format(day);
    final isToday = day == today;
    return Padding(
      padding: EdgeInsets.only(top: first ? 4 : 20, bottom: 8),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              color: isToday ? AppColorScheme.accent : AppColorScheme.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (name != formatShortDayName(day, locale: l10n.localeName)) ...[
            const SizedBox(width: 8),
            Text(
              date,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CalendarAgendaRow extends StatelessWidget {
  const CalendarAgendaRow({
    super.key,
    required this.entry,
    required this.controller,
    required this.mobile,
    this.focusNode,
    this.onFocused,
    this.onNavigateLeft,
    this.compact = false,
  });

  final CalendarEntry entry;
  final CalendarController controller;
  final bool mobile;
  final FocusNode? focusNode;
  final VoidCallback? onFocused;
  final VoidCallback? onNavigateLeft;

  /// For the month grid's side panel, which is narrower than the list.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = controller;
    final e = entry;
    final spoilers = c.hidesSpoilers(e);
    final color = calendarColor(context, e, c.now);
    final tags = calendarTags(context, e, c.now);
    final subtitle = calendarSubtitle(l10n, e, hideSpoilers: spoilers);
    final thumbWidth = compact ? 88.0 : (mobile ? 112.0 : 128.0);
    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Row(
        children: [
          SizedBox(
            width: compact ? 56 : (mobile ? 58 : 72),
            child: Text(
              calendarTime(context, e),
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: 3,
            height: thumbWidth * 9 / 16,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: AppRadius.circular(2),
            ),
          ),
          SizedBox(
            width: thumbWidth,
            child: CalendarArt(
              url: calendarThumbUrl(e, hideSpoilers: spoilers),
              aspectRatio: 16 / 9,
              icon: e.isMovie ? Icons.movie_outlined : Icons.tv_rounded,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.65),
                      fontSize: 13,
                    ),
                  ),
                if (tags.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Wrap(spacing: 6, runSpacing: 4, children: tags),
                ],
              ],
            ),
          ),
          if (mobile && calendarCanRemind(c, e))
            IconButton(
              tooltip: c.hasReminder(e)
                  ? l10n.calendarReminderSet
                  : l10n.calendarRemindMe,
              icon: Icon(
                c.hasReminder(e)
                    ? Icons.notifications_active_rounded
                    : Icons.notifications_none_rounded,
                color: c.hasReminder(e)
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
              onPressed: () => calendarToggleReminder(context, c, e),
            ),
        ],
      ),
    );
    return FocusableWrapper(
      focusNode: focusNode,
      onSelect: () => calendarSelect(context, e),
      onNavigateLeft: onNavigateLeft,
      onFocusChange: (f) {
        if (f) onFocused?.call();
      },
      borderRadius: 10,
      disableScale: true,
      autoScroll: !mobile,
      highlightOnHover: !mobile,
      semanticLabel: '${e.title}, $subtitle',
      child: MouseRegion(
        onEnter: mobile ? null : (_) => onFocused?.call(),
        child: row,
      ),
    );
  }
}

/// The TV and desktop pane beside the list, for the focused entry.
class _Preview extends StatelessWidget {
  const _Preview({
    required this.entry,
    required this.controller,
    required this.onBackToList,
  });

  final CalendarEntry entry;
  final CalendarController controller;
  final VoidCallback onBackToList;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final e = entry;
    final c = controller;
    final spoilers = c.hidesSpoilers(e);
    final badge = calendarShowsBadges
        ? calendarBadgeLabel(l10n, e.badge)
        : null;
    final kicker = [?badge, calendarWhen(context, e, c.today)].join(' · ');
    final subtitle = calendarSubtitle(l10n, e, hideSpoilers: spoilers);
    final art = (!spoilers ? e.stillUrl : null) ?? e.backdropUrl;
    final buttons = <CalendarButton>[
      if (e.inLibrary)
        CalendarButton(
          label: l10n.play,
          icon: Icons.play_arrow_rounded,
          primary: true,
          onPressed: () => calendarPlay(context, e),
        ),
      if (calendarShowsRequest(e))
        CalendarButton(
          label: l10n.request,
          icon: Icons.add_rounded,
          primary: true,
          onPressed: () => calendarRequest(context, e),
        ),
      if (calendarCanOpen(e))
        CalendarButton(
          label: e.isEpisode ? l10n.goToSeries : l10n.calendarMovieDetails,
          icon: e.isEpisode ? Icons.tv_rounded : Icons.info_outline_rounded,
          onPressed: () => e.isEpisode
              ? calendarOpenSeries(context, e)
              : calendarOpenDetails(context, e),
        ),
    ];
    if (buttons.isNotEmpty) {
      final first = buttons.first;
      buttons[0] = CalendarButton(
        label: first.label,
        icon: first.icon,
        primary: first.primary,
        onPressed: first.onPressed,
        onNavigateLeft: onBackToList,
      );
    }
    return ClipRRect(
      borderRadius: AppRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (art != null)
            BoundedNetworkImage(
              key: ValueKey(art),
              imageUrl: art,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) =>
                  ColoredBox(color: AppColorScheme.surface),
            )
          else
            ColoredBox(color: AppColorScheme.surface),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColorScheme.background.withValues(alpha: 0.1),
                  AppColorScheme.background.withValues(alpha: 0.75),
                  AppColorScheme.background.withValues(alpha: 0.97),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  kicker.toUpperCase(),
                  style: TextStyle(
                    color: calendarColor(context, e, c.now),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  e.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    if (e.network != null)
                      CalendarTag(
                        e.network!,
                        color: AppColorScheme.onSurface.withValues(alpha: 0.75),
                      ),
                    if (e.runtimeMinutes != null && e.runtimeMinutes! > 0)
                      CalendarTag(
                        l10n.minutesShort(e.runtimeMinutes!),
                        color: AppColorScheme.onSurface.withValues(alpha: 0.75),
                      ),
                    ...calendarTags(context, e, c.now),
                  ],
                ),
                if (!spoilers && e.overview != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    e.overview!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.75),
                      fontSize: 15,
                      height: 1.35,
                    ),
                  ),
                ],
                if (buttons.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Wrap(spacing: 12, runSpacing: 12, children: buttons),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
