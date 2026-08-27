import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/services/seerr/seerr_download_progress.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/download_utils.dart';
import '../../util/platform_detection.dart';

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

  const SeerrDownloadProgressBar({
    super.key,
    required this.summary,
    this.prefixLabel,
    this.scale,
  });

  /// Past this the track is mostly empty and stops reading as a bar. Also
  /// about the width of the detail screen's action row, so the two line up.
  static const double _maxWidth = 320;

  /// Width the full "Downloading · 1.4 GB / 15.2 GB" form needs.
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final onSurface = AppColorScheme.onSurface;
    final scale = this.scale ?? _barScale();

    final role = theme.textTheme.labelMedium ?? const TextStyle();
    final labelStyle = role.copyWith(
      color: onSurface.withValues(alpha: 0.7),
      fontSize: (role.fontSize ?? 12) * scale,
      fontWeight: FontWeight.w500,
    );

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
                  _label(l10n, labelStyle, constraints.maxWidth),
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
                  color: AppColorScheme.accent,
                  minHeight: 6 * scale,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Label row: what is happening on the left, how far along on the right.
  /// The left side drops detail as the space shrinks so the percentage on the
  /// right always survives.
  Widget _label(AppLocalizations l10n, TextStyle style, double width) {
    if (summary.isImporting) {
      return Text(
        _withPrefix(l10n.seerrImportingStatus),
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    final leading = _leadingLabel(l10n, width);
    final trailing = Text(
      l10n.seerrPercentValue(summary.percent),
      style: style,
      maxLines: 1,
    );

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

  /// Null when the bar is too narrow to say anything but the percentage.
  String? _leadingLabel(AppLocalizations l10n, double width) {
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
