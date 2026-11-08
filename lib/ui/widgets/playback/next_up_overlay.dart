import 'dart:async';

import '../offline_aware_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/calendar_entry.dart';
import '../../../data/models/upcoming_episode_info.dart';
import '../../../data/repositories/calendar_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/calendar_days.dart';
import '../../../util/date_format_util.dart';
import '../../../util/platform_detection.dart';
import '../adaptive/adaptive_glass.dart';
import '../anime_marker_badge.dart';

class NextUpOverlay extends StatefulWidget {
  final AggregatedItem? nextItem;
  final String? imageUrl;
  final int timeoutMs;
  final VoidCallback? onPlayNext;
  final VoidCallback onDismiss;
  final VoidCallback? onTimeout;
  final FocusNode? focusNode;
  final FocusNode? dismissFocusNode;
  final bool isMinimal;

  /// When the next episode airs, for the card shown when the library has no
  /// next episode yet.
  final UpcomingEpisodeInfo? airDate;
  final String? airDateTitle;

  /// Offers Remind me on the air date card.
  final CalendarEntry? reminder;

  const NextUpOverlay({
    super.key,
    required AggregatedItem this.nextItem,
    this.imageUrl,
    required this.timeoutMs,
    required VoidCallback this.onPlayNext,
    required this.onDismiss,
    this.onTimeout,
    this.focusNode,
    this.dismissFocusNode,
    this.isMinimal = false,
  }) : airDate = null,
       airDateTitle = null,
       reminder = null;

  /// Says when the next episode airs. With no [reminder] the close button is
  /// the only one and takes [focusNode].
  const NextUpOverlay.airDate({
    super.key,
    required UpcomingEpisodeInfo this.airDate,
    required String this.airDateTitle,
    this.reminder,
    required this.timeoutMs,
    required this.onDismiss,
    this.onTimeout,
    this.focusNode,
    this.dismissFocusNode,
    this.isMinimal = false,
  }) : nextItem = null,
       imageUrl = null,
       onPlayNext = null;

  @override
  State<NextUpOverlay> createState() => _NextUpOverlayState();
}

class _NextUpOverlayState extends State<NextUpOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _countdownController;
  Timer? _timer;
  bool _playFocused = false;
  bool _dismissFocused = false;
  bool _reminderSet = false;
  bool _reminderBusy = false;

  @override
  void initState() {
    super.initState();
    final reminder = widget.reminder;
    if (reminder != null) unawaited(_readReminder(reminder));
    _countdownController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.timeoutMs),
      animationBehavior: AnimationBehavior.preserve,
    )..forward();

    if (widget.timeoutMs > 0) {
      _timer = Timer(
        Duration(milliseconds: widget.timeoutMs),
        widget.onTimeout ?? widget.onDismiss,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _countdownController.dispose();
    super.dispose();
  }

  Future<void> _readReminder(CalendarEntry reminder) async {
    if (!GetIt.instance.isRegistered<CalendarRepository>()) return;
    try {
      final keys = await GetIt.instance<CalendarRepository>().reminderKeys();
      if (mounted && keys.contains(reminder.reminderKey)) {
        setState(() => _reminderSet = true);
      }
    } catch (e) {
      debugPrint('[NextUpOverlay] Reading reminders failed: $e');
    }
  }

  Future<void> _toggleReminder() async {
    final reminder = widget.reminder;
    if (reminder == null || _reminderBusy) return;
    if (!GetIt.instance.isRegistered<CalendarRepository>()) return;
    setState(() => _reminderBusy = true);
    try {
      final set = await GetIt.instance<CalendarRepository>().setReminder(
        reminder,
        !_reminderSet,
      );
      if (mounted) setState(() => _reminderSet = set);
    } catch (e) {
      debugPrint('[NextUpOverlay] Reminder failed: $e');
      if (mounted) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).calendarReminderFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _reminderBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final item = widget.nextItem;
    final airDate = widget.airDate;
    final tvFocusMode =
        widget.focusNode != null || widget.dismissFocusNode != null;
    final epInfo = airDate != null
        ? 'S${airDate.seasonNumber}:E${airDate.episodeNumber}'
        : item!.indexNumber != null
        ? 'S${item.parentIndexNumber ?? '?'}:E${item.indexNumber}'
        : null;

    final prefs = GetIt.instance<UserPreferences>();
    final mediaSegmentCountdown = prefs.get(
      UserPreferences.mediaSegmentCountdown,
    );
    final showProgressBar =
        mediaSegmentCountdown == MediaSegmentCountdown.progressBar ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;
    final showTimer =
        mediaSegmentCountdown == MediaSegmentCountdown.timer ||
        mediaSegmentCountdown == MediaSegmentCountdown.both;

    final bool hasThumb = widget.imageUrl != null && !widget.isMinimal;

    final countdownText = (showTimer && widget.timeoutMs > 0)
        ? AnimatedBuilder(
            animation: _countdownController,
            builder: (context, _) {
              final remainingMs =
                  widget.timeoutMs * (1.0 - _countdownController.value);
              final remainingSeconds = (remainingMs / 1000).ceil();
              final int minutes = remainingSeconds ~/ 60;
              final int secs = remainingSeconds % 60;
              final timerText = remainingSeconds >= 60
                  ? '$minutes:${secs.toString().padLeft(2, '0')}'
                  : ':${secs.toString().padLeft(2, '0')}';
              return Text(
                l10n.endsIn(timerText),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: widget.isMinimal ? 11 : 12,
                  fontWeight: FontWeight.w600,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              );
            },
          )
        : null;

    final eyebrow = Text(
      l10n.upNext,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.85),
        fontSize: widget.isMinimal ? 11 : 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );

    final episodePill = (epInfo != null && epInfo.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColorScheme.accent.withValues(alpha: 0.22),
              borderRadius: AppRadius.circular(6),
              border: Border.all(
                color: AppColorScheme.accent.withValues(alpha: 0.4),
                width: 0.5,
              ),
            ),
            child: Text(
              epInfo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : null;

    final title = Text(
      item?.name ?? widget.airDateTitle ?? '',
      style: TextStyle(
        color: Colors.white,
        fontSize: widget.isMinimal ? 14 : 16,
        fontWeight: FontWeight.w600,
      ),
      maxLines: widget.isMinimal ? 1 : 2,
      overflow: TextOverflow.ellipsis,
    );

    final headerRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [eyebrow, ?countdownText],
    );

    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (episodePill != null) ...[episodePill, const SizedBox(height: 6)],
        title,
        if (airDate != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _airsText(context, l10n, airDate),
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: widget.isMinimal ? 12 : 13,
              ),
            ),
          ),
        if (item != null)
          AnimeMarkerBadge(
            seriesId: item.seriesId,
            episodeId: item.id,
            scale: widget.isMinimal ? 0.8 : 0.9,
            padding: const EdgeInsets.only(top: 6),
          ),
      ],
    );

    final hasPrimary = item != null || widget.reminder != null;
    final primaryAction = item != null ? widget.onPlayNext! : _toggleReminder;
    // A lone close button takes the primary node, which is the one the player
    // focuses when the card comes up.
    final closeFocusNode = hasPrimary
        ? widget.dismissFocusNode
        : widget.focusNode;

    final cardRadius = AppColorScheme.isPixel ? 0.0 : 18.0;
    final cardBorder = ThemeRegistry.active.borders.cardBorder;
    final hasCardBorder =
        cardBorder.style != BorderStyle.none &&
        cardBorder.color != Colors.transparent &&
        cardBorder.width > 0;

    final card = Container(
      width: widget.isMinimal ? 300 : 340,
      // The solid glass tier is a plain DecoratedBox that doesn't clip, so
      // without this the thumbnail squares off the card's rounded corners on
      // every theme that isn't Glass or Apple.
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(cardRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          adaptiveGlass(
            context: context,
            cornerRadius: cardRadius,
            blur: 18,
            fallbackColor: AppColorScheme.surface.withValues(alpha: 0.55),
            tint: AppColorScheme.surface.withValues(alpha: 0.22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (hasThumb)
                  Stack(
                    children: [
                      OfflineAwareImage(
                        imageUrl: widget.imageUrl!,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        placeholder: (context, url) => const AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        ),
                        errorWidget: (_, _, _) => AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            color: AppColorScheme.surfaceVariant,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black87, Colors.transparent],
                              stops: [0.04, 0.55],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 12,
                        right: 14,
                        child: headerRow,
                      ),
                      Positioned(
                        left: 14,
                        right: 14,
                        bottom: 10,
                        child: titleBlock,
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.all(widget.isMinimal ? 10 : 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!hasThumb) ...[
                        headerRow,
                        SizedBox(height: widget.isMinimal ? 6 : 8),
                        titleBlock,
                        SizedBox(height: widget.isMinimal ? 10 : 14),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (hasPrimary) ...[
                            Expanded(
                              child: Focus(
                                focusNode: widget.focusNode,
                                onFocusChange: (focused) {
                                  if (_playFocused != focused) {
                                    setState(() => _playFocused = focused);
                                  }
                                },
                                onKeyEvent: (_, event) {
                                  if (event is KeyDownEvent &&
                                      (event.logicalKey ==
                                              LogicalKeyboardKey.select ||
                                          event.logicalKey ==
                                              LogicalKeyboardKey.enter)) {
                                    primaryAction();
                                    return KeyEventResult.handled;
                                  }
                                  return KeyEventResult.ignored;
                                },
                                child: ElevatedButton(
                                  autofocus: widget.focusNode == null,
                                  onPressed: primaryAction,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: tvFocusMode
                                        ? (_playFocused
                                              ? AppColorScheme.accent
                                              : AppColorScheme.surfaceVariant
                                                    .scaleAlpha(0.9))
                                        : AppColorScheme.accent,
                                    foregroundColor: Colors.white,
                                    side: _playFocused
                                        ? ThemeRegistry
                                              .active
                                              .borders
                                              .focusBorder
                                        : BorderSide.none,
                                    padding: EdgeInsets.symmetric(
                                      vertical: widget.isMinimal ? 8 : 11,
                                      horizontal: widget.isMinimal ? 10 : 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: AppRadius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (showProgressBar &&
                                          widget.timeoutMs > 0 &&
                                          item != null)
                                        AnimatedBuilder(
                                          animation: _countdownController,
                                          builder: (context, _) =>
                                              _PlayButtonRing(
                                                progress:
                                                    1.0 -
                                                    _countdownController.value,
                                              ),
                                        )
                                      else
                                        Icon(
                                          item != null
                                              ? Icons.play_arrow_rounded
                                              : _reminderSet
                                              ? Icons.notifications_active_rounded
                                              : Icons.notifications_none_rounded,
                                          size: 20,
                                        ),
                                      const SizedBox(width: 9),
                                      Text(
                                        item != null
                                            ? l10n.playNext
                                            : _reminderSet
                                            ? l10n.calendarReminderSet
                                            : l10n.calendarRemindMe,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                          Focus(
                            focusNode: closeFocusNode,
                            onFocusChange: (focused) {
                              if (_dismissFocused != focused) {
                                setState(() => _dismissFocused = focused);
                              }
                            },
                            onKeyEvent: (_, event) {
                              if (event is KeyDownEvent &&
                                  (event.logicalKey ==
                                          LogicalKeyboardKey.select ||
                                      event.logicalKey ==
                                          LogicalKeyboardKey.enter)) {
                                widget.onDismiss();
                                return KeyEventResult.handled;
                              }
                              return KeyEventResult.ignored;
                            },
                            child: Tooltip(
                              message: l10n.close,
                              child: OutlinedButton(
                                onPressed: widget.onDismiss,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: _dismissFocused
                                      ? AppColorScheme.accent.withValues(
                                          alpha: 0.24,
                                        )
                                      : Colors.white.withValues(alpha: 0.08),
                                  side: _dismissFocused
                                      ? ThemeRegistry.active.borders.focusBorder
                                      : ThemeRegistry.active.borders.chipBorder,
                                  padding: EdgeInsets.all(
                                    widget.isMinimal ? 8 : 11,
                                  ),
                                  minimumSize: const Size(44, 44),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: AppRadius.circular(12),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (hasCardBorder)
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.circular(cardRadius),
                    border: Border.fromBorderSide(cardBorder),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    // A landscape phone has no room above the bottom controls, so the card
    // sits centered on the right edge there.
    if (PlatformDetection.useMobileUi) {
      return Positioned(
        top: 0,
        bottom: 0,
        right: 24,
        child: Center(widthFactor: 1, child: card),
      );
    }
    return Positioned(right: 24, bottom: 120, child: card);
  }
}

/// "Today (Nov 3)", "In 3 days (Nov 6)", the wording the Upcoming rows use.
String _airsText(
  BuildContext context,
  AppLocalizations l10n,
  UpcomingEpisodeInfo airDate,
) {
  final local = airDate.airDate.toLocal();
  return l10n.calendarReleaseIn(
    calendarDaysBetween(DateTime.now(), local),
    formatShortDate(local, locale: Localizations.localeOf(context).toString()),
  );
}

class _PlayButtonRing extends StatelessWidget {
  const _PlayButtonRing({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              strokeWidth: 2.5,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const Icon(Icons.play_arrow_rounded, size: 12, color: Colors.white),
        ],
      ),
    );
  }
}
