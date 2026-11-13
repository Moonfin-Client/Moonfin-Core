import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/services/seerr/arr_queue.dart';
import '../../data/services/seerr/seerr_download_progress.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/date_format_util.dart';
import '../../util/download_utils.dart';
import '../../util/platform_detection.dart';
import '../../util/relative_time_label.dart';

/// Progress bar for an active Seerr download. Not focusable, so d-pad
/// traversal is unaffected.
///
/// Capped rather than stretched: across a full desktop pane a thin bar reads
/// as a divider, not as progress.
class SeerrDownloadProgressBar extends StatelessWidget {
  final SeerrDownloadSummary summary;
  final String? prefixLabel;

  /// Overrides the platform scale. A poster tile passes its own caption scale,
  /// since the TV bump below is sized for the detail screen.
  final double? scale;

  /// How many lines the arr's reason may take under the bar. A card keeps it
  /// to one, while the detail screen has room for the whole message. Zero
  /// leaves it out, for a poster tile that shows it in its caption instead.
  final int reasonMaxLines;

  const SeerrDownloadProgressBar({
    super.key,
    required this.summary,
    this.prefixLabel,
    this.scale,
    this.reasonMaxLines = 1,
  });

  /// Past this the track is mostly empty and stops reading as a bar. Also
  /// about the width of the detail screen's action row, so the two line up.
  static const double _maxWidth = 320;

  /// Width the full "Downloading · 1.4 GB / 15.2 GB" form needs. The time
  /// left only shows from here too, since it pushes the sizes aside.
  static const double _fullLabelWidth = 260;

  /// Low enough for a TV tile, which leaves about 111px. The sizes are
  /// Flexible and ellipsize while the percentage stays, so a narrow tile
  /// truncates them rather than dropping them. Below this the percentage
  /// stands alone.
  static const double _sizeLabelWidth = 90;

  /// Posters shrink on TV because they are large artwork. The bar and its
  /// label sit at the legibility floor instead, so they scale up.
  static double _barScale() {
    // Readable at three metres without outweighing the metadata line above.
    if (PlatformDetection.isTV) return 1.1;
    if (!PlatformDetection.useDesktopUi) return 1.0;
    if (!GetIt.instance.isRegistered<UserPreferences>()) return 1.0;
    return GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;
  }

  /// The label's look, shared with [SeerrArrWaitLabel] so the two read as
  /// the same line.
  static TextStyle _labelStyle(BuildContext context, double scale) {
    final role = Theme.of(context).textTheme.labelMedium ?? const TextStyle();
    return role.copyWith(
      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
      fontSize: (role.fontSize ?? 12) * scale,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;
    final scale = this.scale ?? _barScale();
    final labelStyle = _labelStyle(context, scale);
    final reason = summary.reason;

    // Mobile fills the width to match the full-width action button above it.
    //
    // Not scaled: the height and label scale for distance but the buttons do
    // not. Fixed rather than measured off the row, since the row grows when a
    // button expands on focus.
    final cap = PlatformDetection.useMobileUi ? double.infinity : _maxWidth;

    // Align first: a ConstrainedBox alone cannot shrink under a tight width
    // from the parent, and callers do place this inside sized boxes.
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: cap),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LayoutBuilder(
              builder: (context, constraints) =>
                  _label(context, l10n, labelStyle, constraints.maxWidth),
            ),
            SizedBox(height: 4 * scale),
            ClipRRect(
              borderRadius: AppRadius.circular(4),
              child: TweenAnimationBuilder<double>(
                // The poll is every 15s. Without a tween the bar looks
                // frozen between ticks.
                tween: Tween<double>(end: summary.fraction),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                builder: (context, value, _) => LinearProgressIndicator(
                  value: value,
                  backgroundColor: onSurface.withValues(alpha: 0.12),
                  color: _barColor(onSurface),
                  minHeight: 6 * scale,
                ),
              ),
            ),
            if (reason != null && reasonMaxLines > 0) ...[
              SizedBox(height: 4 * scale),
              // The arr's own words, as its Activity view shows them. They
              // aren't translated, since the arr sends them in English.
              Text(
                reason,
                style: labelStyle.copyWith(
                  color: onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                ),
                maxLines: reasonMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Amber for a stalled download or a blocked import and red for a failed
  /// one, so a stuck bar stands out from a slow one. Dimmed while waiting its
  /// turn or paused.
  Color _barColor(Color onSurface) => switch (summary.state) {
    SeerrDownloadState.stalled ||
    SeerrDownloadState.importBlocked => AppColorScheme.statusPending,
    SeerrDownloadState.failed => AppColorScheme.statusError,
    SeerrDownloadState.paused ||
    SeerrDownloadState.queued => onSurface.withValues(alpha: 0.38),
    SeerrDownloadState.downloading ||
    SeerrDownloadState.waitingForImport => AppColorScheme.accent,
  };

  /// Label row: what is happening on the left, how far along on the right.
  /// The left side drops detail as the space shrinks so the percentage on the
  /// right always survives.
  Widget _label(
    BuildContext context,
    AppLocalizations l10n,
    TextStyle style,
    double width,
  ) {
    if (summary.isWaitingForImport) {
      // A tile can't fit the full phrase, and "Downloaded, wai…" loses the
      // point, so a bar it doesn't fit says just the first word.
      final full = _withPrefix(l10n.seerrWaitingForImport);
      return Text(
        width >= _fullLabelWidth && _fits(context, full, style, width)
            ? full
            : _withPrefix(l10n.downloaded),
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    if (summary.state == SeerrDownloadState.importBlocked) {
      // Always fully downloaded, so a percentage only crowds out the words.
      return Text(
        _withPrefix(l10n.seerrImportBlocked),
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    final leading = _leadingLabel(l10n, width);
    final timeLeft = summary.timeLeft;
    final percent = l10n.seerrPercentValue(summary.percent);
    var trailingText = percent;
    if (width >= _fullLabelWidth &&
        timeLeft != null &&
        timeLeft > Duration.zero) {
      final withEta = '$percent \u00b7 ${_timeLeftLabel(l10n, timeLeft)}';
      // Large text can make the time left outgrow the row, which the width
      // check above can't see. It drops out unless the left side keeps at
      // least 40% of the row.
      if (_fits(context, withEta, style, width * 0.6)) trailingText = withEta;
    }
    final trailing = Text(trailingText, style: style, maxLines: 1);

    if (leading == null) {
      return Align(alignment: AlignmentDirectional.centerEnd, child: trailing);
    }

    return Row(
      children: [
        Flexible(
          child: Text(
            leading,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(' \u00b7 ', style: style),
        trailing,
      ],
    );
  }

  /// Whether [text] fits in [budget] on one line, as this context renders it.
  /// Bold text from the accessibility settings isn't measured, which the
  /// leading label's slack absorbs.
  static bool _fits(
    BuildContext context,
    String text,
    TextStyle style,
    double budget,
  ) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      locale: Localizations.maybeLocaleOf(context),
      maxLines: 1,
    )..layout();
    final fits = painter.width <= budget;
    painter.dispose();
    return fits;
  }

  /// Null when the bar is too narrow to say anything but the percentage.
  String? _leadingLabel(AppLocalizations l10n, double width) {
    final stateLabel = _stateLabel(l10n);
    if (stateLabel != null) {
      // Saying why the bar isn't moving matters more than the sizes, so the
      // word stays down to the size label's width and ellipsizes if it must.
      // Below that the bar's colour still says it's stuck.
      if (width < _sizeLabelWidth) return null;
      if (summary.hasSize && width >= _fullLabelWidth) {
        final done = _sameUnitAs(summary.downloadedBytes, summary.totalBytes);
        final total = _sameUnitAs(summary.totalBytes, summary.totalBytes);
        return _withPrefix(
          '$stateLabel \u00b7 ${l10n.seerrDownloadedOfTotal(done, total)}',
        );
      }
      return _withPrefix(stateLabel);
    }
    if (!summary.hasSize) {
      return width >= _sizeLabelWidth
          ? _withPrefix(l10n.seerrDownloading)
          : null;
    }
    final done = _sameUnitAs(summary.downloadedBytes, summary.totalBytes);
    final total = _sameUnitAs(summary.totalBytes, summary.totalBytes);
    if (width >= _fullLabelWidth) {
      return _withPrefix(l10n.seerrDownloadingSize(done, total));
    }
    if (width >= _sizeLabelWidth) {
      return _withPrefix(l10n.seerrDownloadedOfTotal(done, total));
    }
    return null;
  }

  /// The word for a download that isn't simply progressing, or null for one
  /// that is.
  String? _stateLabel(AppLocalizations l10n) => switch (summary.state) {
    SeerrDownloadState.stalled => l10n.seerrDownloadStalled,
    SeerrDownloadState.importBlocked => l10n.seerrImportBlocked,
    SeerrDownloadState.failed => l10n.seerrDownloadFailed,
    SeerrDownloadState.paused => l10n.paused,
    SeerrDownloadState.queued => l10n.queuedDownload,
    SeerrDownloadState.downloading ||
    SeerrDownloadState.waitingForImport => null,
  };

  /// "12m left", "2h left" or "1h 5m left". A download days out reads in
  /// hours, which is still plain enough.
  static String _timeLeftLabel(AppLocalizations l10n, Duration eta) {
    // Rounded up, so the last minute reads "1m left" rather than "0m left".
    final mins = (eta.inSeconds + 59) ~/ 60;
    if (mins < 60) return l10n.guideMinutesLeft(mins);
    final h = mins ~/ 60;
    final m = mins % 60;
    return m == 0 ? l10n.guideHoursLeft(h) : l10n.guideHoursMinutesLeft(h, m);
  }

  /// Both halves in the total's unit, so it reads "1.6 GB / 4.4 GB" and not
  /// "330.9 MB / 12.4 GB". Local to this label because formatBytes is shared
  /// with other screens.
  static String _sameUnitAs(int bytes, int reference) {
    const gb = 1024 * 1024 * 1024;
    if (reference < gb) return formatBytes(bytes);
    return '${(bytes / gb).toStringAsFixed(1)} GB';
  }

  String _withPrefix(String label) =>
      prefixLabel != null ? '$prefixLabel \u00b7 $label' : label;
}

/// What the arr is waiting on, where the download bar would be: a search
/// running now, a title it hasn't found, or one that isn't out yet. No bar,
/// since an empty one would read as a download stuck at 0%.
class SeerrArrWaitLabel extends StatelessWidget {
  final ArrWait wait;
  final double? scale;

  /// "HD" when a 4K bar sits under it, as the bars label themselves.
  final String? prefixLabel;

  /// Whether Not found yet says when the arr last searched. A poster tile
  /// has no room for it.
  final bool showLastSearch;

  const SeerrArrWaitLabel({
    super.key,
    required this.wait,
    this.scale,
    this.prefixLabel,
    this.showLastSearch = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final scale = this.scale ?? SeerrDownloadProgressBar._barScale();
    final style = SeerrDownloadProgressBar._labelStyle(context, scale);
    final (icon, text) = switch (wait) {
      ArrSearching() => (Icons.travel_explore, l10n.seerrSearchingIndexers),
      ArrNotFoundYet(:final lastSearch) => (
        Icons.search_off,
        lastSearch != null && showLastSearch
            ? l10n.seerrNotFoundYetSearched(relativeTimeLabel(l10n, lastSearch))
            : l10n.seerrNotFoundYet,
      ),
      ArrNotReleased(:final date, :final nextEpisode) => (
        Icons.event,
        // A date already gone would read as wrong.
        switch (date != null && date.isAfter(clock.now()) ? date : null) {
          null => l10n.seerrNotAvailableYet,
          final date when nextEpisode => l10n.seerrNextEpisodeOn(
            formatShortDate(date, locale: locale),
          ),
          final date => l10n.seerrAvailableOn(
            formatShortDate(date, locale: locale),
          ),
        },
      ),
    };
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: (style.fontSize ?? 12) * 1.3, color: style.color),
        SizedBox(width: 6 * scale),
        Flexible(
          child: Text(
            [?prefixLabel, text].join(' \u00b7 '),
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
