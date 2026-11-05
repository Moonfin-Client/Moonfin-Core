import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/calendar_entry.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/bounded_network_image.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/focus/request_initial_focus.dart';
import 'calendar_common.dart';
import 'calendar_controller.dart';

/// A hero for the next thing to air, with a countdown, over rows of what's
/// coming this week and what's ready now. With nothing coming up, the newest
/// ready item takes the hero and the timer goes away.
class CalendarCountdownView extends StatefulWidget {
  const CalendarCountdownView({super.key, required this.controller});

  final CalendarController controller;

  @override
  State<CalendarCountdownView> createState() => _CalendarCountdownViewState();
}

class _CalendarCountdownViewState extends State<CalendarCountdownView> {
  final _heroButton = FocusNode(debugLabel: 'CalendarCountdownHero');
  final _scroll = ScrollController();
  Timer? _tick;

  CalendarController get _c => widget.controller;

  @override
  void initState() {
    super.initState();
    // Minutes are the smallest unit shown, so a tick every 20 s keeps the
    // display within a third of a minute.
    _tick = Timer.periodic(const Duration(seconds: 20), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    _heroButton.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _openFull() => context.push(Destinations.calendarMonth);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final mobile = PlatformDetection.useMobileUi;
    final insets = calendarChromeInsets(context);
    final next = _c.next;
    final ready = _c.readyToWatch;
    final hero = next ?? (ready.isEmpty ? null : ready.first);
    final state = calendarStateView(
      context,
      _c,
      empty: hero == null,
      emptyText: l10n.calendarNothingUpcoming,
    );
    if (state != null) {
      return Padding(
        padding: EdgeInsets.only(top: insets.top),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: insets.left, right: insets.right),
              child: _TitleRow(onFull: _openFull, mobile: mobile),
            ),
            Expanded(child: state),
          ],
        ),
      );
    }
    final week = [
      for (final e in _c.thisWeek)
        if (!identical(e, hero)) e,
    ];
    final readyRow = [
      for (final e in ready)
        if (!identical(e, hero)) e,
    ];
    final poster =
        GetIt.instance<UserPreferences>().get(
          UserPreferences.calendarImageType,
        ) ==
        CalendarImageType.poster;
    final children = <Widget>[
      if (mobile) _TitleRow(onFull: _openFull, mobile: true),
      if (mobile) const SizedBox(height: 12),
      Focus(
        canRequestFocus: false,
        skipTraversal: true,
        // Moving up from the rows only scrolls far enough to show the
        // buttons, so the whole hero is brought back into view.
        onFocusChange: (focused) {
          if (focused && !mobile && _scroll.hasClients && _scroll.offset > 0) {
            _scroll.animateTo(
              0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }
        },
        child: _Hero(
          entry: hero!,
          controller: _c,
          counting: next != null,
          mobile: mobile,
          buttonNode: _heroButton,
          onFull: _openFull,
        ),
      ),
      if (week.isNotEmpty)
        _Row(
          title: l10n.calendarComingUpThisWeek,
          entries: week,
          controller: _c,
          poster: poster,
          mobile: mobile,
          trailing: mobile
              ? TextButton(
                  onPressed: _openFull,
                  child: Text(l10n.calendarFullCalendar),
                )
              : null,
        ),
      if (readyRow.isNotEmpty)
        _Row(
          title: l10n.calendarReadyToWatch,
          entries: readyRow,
          controller: _c,
          poster: false,
          mobile: mobile,
        ),
    ];
    final list = RefreshIndicator(
      onRefresh: () => _c.load(refresh: true),
      child: ListView(
        controller: _scroll,
        padding: EdgeInsets.fromLTRB(
          insets.left,
          insets.top,
          insets.right,
          mobile ? bottomNavContentPadding(context, 24) : 32,
        ),
        children: children,
      ),
    );
    if (mobile) return list;
    return RequestInitialFocus(
      key: ValueKey('countdown-${hero.key}'),
      targetNode: _heroButton,
      child: list,
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.onFull, required this.mobile});

  final VoidCallback onFull;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.calendar,
            style: TextStyle(
              color: AppColorScheme.onSurface,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (mobile)
          IconButton(
            tooltip: l10n.calendarFullCalendar,
            icon: Icon(
              Icons.calendar_month_rounded,
              color: AppColorScheme.onSurface,
            ),
            onPressed: onFull,
          )
        else
          CalendarButton(
            label: l10n.calendarFullCalendar,
            icon: Icons.calendar_month_rounded,
            compact: true,
            onPressed: onFull,
          ),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({
    required this.entry,
    required this.controller,
    required this.counting,
    required this.mobile,
    required this.buttonNode,
    required this.onFull,
  });

  final CalendarEntry entry;
  final CalendarController controller;

  /// False when the hero is a ready item standing in for nothing upcoming.
  final bool counting;
  final bool mobile;
  final FocusNode buttonNode;
  final VoidCallback onFull;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final e = entry;
    final c = controller;
    final spoilers = c.hidesSpoilers(e);
    final badge = calendarShowsBadges
        ? calendarBadgeLabel(l10n, e.badge)
        : null;
    final kicker = counting
        ? [?badge, calendarWhen(context, e, c.today)].join(' · ')
        : l10n.calendarReadyToWatch;
    final subtitle = calendarSubtitle(l10n, e, hideSpoilers: spoilers);
    final art = e.backdropUrl ?? (!spoilers ? e.stillUrl : null);
    final buttons = <CalendarButton>[
      if (!counting && e.inLibrary)
        CalendarButton(
          label: l10n.play,
          icon: Icons.play_arrow_rounded,
          primary: true,
          onPressed: () => calendarPlay(context, e),
        ),
      if (counting && calendarCanRemind(c, e))
        CalendarButton(
          label: c.hasReminder(e)
              ? l10n.calendarReminderSet
              : l10n.calendarRemindMe,
          icon: c.hasReminder(e)
              ? Icons.notifications_active_rounded
              : Icons.notifications_none_rounded,
          primary: !c.hasReminder(e),
          onPressed: () => calendarToggleReminder(context, c, e),
        ),
      if (calendarShowsRequest(e))
        CalendarButton(
          label: l10n.request,
          icon: Icons.add_rounded,
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
      if (!mobile)
        CalendarButton(
          label: l10n.calendarFullCalendar,
          icon: Icons.calendar_month_rounded,
          onPressed: onFull,
        ),
    ];
    // The first button takes the initial focus whichever one it is.
    if (buttons.isNotEmpty) {
      final first = buttons.first;
      buttons[0] = CalendarButton(
        label: first.label,
        icon: first.icon,
        primary: first.primary,
        focusNode: buttonNode,
        onPressed: first.onPressed,
      );
    }
    final info = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kicker.toUpperCase(),
          style: TextStyle(
            color: counting ? calendarColor(e, c.now) : calendarReadyColor,
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
            fontSize: mobile ? 28 : 40,
            fontWeight: FontWeight.w800,
            height: 1.1,
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.8),
              fontSize: mobile ? 15 : 18,
            ),
          ),
        ],
        if (counting) ...[
          const SizedBox(height: 16),
          _Countdown(target: e.hasTime ? e.date : e.day, now: c.now),
        ],
        if (!mobile && !spoilers && e.overview != null) ...[
          const SizedBox(height: 14),
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
        const SizedBox(height: 18),
        Wrap(spacing: 12, runSpacing: 12, children: buttons),
      ],
    );
    final image = art == null
        ? ColoredBox(color: AppColorScheme.surface)
        : BoundedNetworkImage(
            key: ValueKey(art),
            imageUrl: art,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) =>
                ColoredBox(color: AppColorScheme.surface),
          );
    if (mobile) {
      return ClipRRect(
        borderRadius: AppRadius.circular(18),
        child: Stack(
          children: [
            Positioned.fill(child: image),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColorScheme.background.withValues(alpha: 0.05),
                      AppColorScheme.background.withValues(alpha: 0.7),
                      AppColorScheme.background.withValues(alpha: 0.96),
                    ],
                    stops: const [0.0, 0.45, 1.0],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 180, 18, 18),
              child: info,
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 420,
      child: ClipRRect(
        borderRadius: AppRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(widthFactor: 0.68, child: image),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColorScheme.background,
                    AppColorScheme.background.withValues(alpha: 0.92),
                    AppColorScheme.background.withValues(alpha: 0.15),
                  ],
                  stops: const [0.0, 0.38, 0.75],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(width: 560, child: info),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Countdown extends StatelessWidget {
  const _Countdown({required this.target, required this.now});

  final DateTime target;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    var left = target.difference(now);
    if (left.isNegative) left = Duration.zero;
    // Round up so the last minute reads 1, not 0.
    final total = (left.inSeconds / 60).ceil();
    final days = total ~/ (24 * 60);
    final hours = total ~/ 60 % 24;
    final minutes = total % 60;
    Widget cell(int value, String unit) => Container(
      constraints: const BoxConstraints(minWidth: 64),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: AppRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            value.toString().padLeft(2, '0'),
            style: TextStyle(
              color: AppColorScheme.onSurface,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.calendarStartsIn,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.6),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (days > 0) ...[
              cell(days, l10n.calendarUnitDays),
              const SizedBox(width: 8),
            ],
            cell(hours, l10n.calendarUnitHours),
            const SizedBox(width: 8),
            cell(minutes, l10n.calendarUnitMinutes),
          ],
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.title,
    required this.entries,
    required this.controller,
    required this.poster,
    required this.mobile,
    this.trailing,
  });

  final String title;
  final List<CalendarEntry> entries;
  final CalendarController controller;
  final bool poster;
  final bool mobile;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final width = poster ? (mobile ? 118.0 : 150.0) : (mobile ? 220.0 : 280.0);
    final aspect = poster ? 2 / 3 : 16 / 9;
    final height = width / aspect + 52;
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: mobile ? 18 : 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ?trailing,
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: height,
            child: ClipRect(
              // Cards scrolled past the left edge would cover the nav rail.
              clipper: mobile ? null : const _LeftEdgeClipper(),
              clipBehavior: mobile ? Clip.none : Clip.hardEdge,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: entries.length,
                separatorBuilder: (_, _) => const SizedBox(width: 14),
                itemBuilder: (context, i) => _Card(
                  entry: entries[i],
                  controller: controller,
                  width: width,
                  poster: poster,
                  mobile: mobile,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.entry,
    required this.controller,
    required this.width,
    required this.poster,
    required this.mobile,
  });

  final CalendarEntry entry;
  final CalendarController controller;
  final double width;
  final bool poster;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final e = entry;
    final c = controller;
    final spoilers = c.hidesSpoilers(e);
    final url = poster
        ? e.posterUrl
        : calendarThumbUrl(e, hideSpoilers: spoilers);
    final line = e.inLibrary
        ? calendarSubtitle(l10n, e, hideSpoilers: spoilers)
        : calendarWhen(context, e, c.today);
    return SizedBox(
      width: width,
      child: FocusableWrapper(
        onSelect: () => calendarSelect(context, e),
        autoScroll: !mobile,
        borderRadius: 10,
        highlightOnHover: !mobile,
        semanticLabel: '${e.title}, $line',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarArt(
              url: url,
              aspectRatio: poster ? 2 / 3 : 16 / 9,
              radius: 10,
              icon: e.isMovie ? Icons.movie_outlined : Icons.tv_rounded,
            ),
            const SizedBox(height: 6),
            Text(
              e.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColorScheme.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              line,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: calendarColor(e, c.now).withValues(alpha: 0.9),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Open on every side but the left, so a focused card can still grow.
class _LeftEdgeClipper extends CustomClipper<Rect> {
  const _LeftEdgeClipper();

  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(-16, -size.height, size.width + 2000, size.height * 2);

  @override
  bool shouldReclip(_LeftEdgeClipper oldClipper) => false;
}
