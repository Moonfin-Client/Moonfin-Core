import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../data/services/seerr/seerr_download_progress.dart';
import '../../l10n/app_localizations.dart';

/// Thin decorative progress bar for an active Seerr download. Not focusable,
/// so d-pad traversal is unaffected wherever it is placed.
class SeerrDownloadProgressBar extends StatelessWidget {
  final SeerrDownloadSummary summary;
  final String? prefixLabel;
  final double scale;

  const SeerrDownloadProgressBar({
    super.key,
    required this.summary,
    this.prefixLabel,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;
    final label = summary.isImporting
        ? l10n.seerrImportingStatus
        : l10n.seerrDownloadingPercent(summary.percent);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          prefixLabel != null ? '$prefixLabel · $label' : label,
          style: TextStyle(
            color: onSurface.withValues(alpha: 0.7),
            fontSize: 11 * scale,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 3 * scale),
        ClipRRect(
          borderRadius: AppRadius.circular(2),
          child: LinearProgressIndicator(
            value: summary.fraction,
            backgroundColor: onSurface.withValues(alpha: 0.12),
            color: AppColorScheme.accent,
            minHeight: 3 * scale,
          ),
        ),
      ],
    );
  }
}
