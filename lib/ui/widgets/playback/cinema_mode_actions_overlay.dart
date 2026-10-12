import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/media_segment.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/cinema_mode_controller.dart';
import '../../../preference/preference_constants.dart';
import '../../../util/platform_detection.dart';
import 'skip_segment_overlay.dart';

String? cinemaRequestLabel(
  CinemaModeController controller,
  AppLocalizations l10n,
) => switch (controller.seerrState) {
  CinemaSeerrState.hidden => null,
  CinemaSeerrState.request =>
    controller.isSeries && controller.isTvRequestMore
        ? (controller.only4kRequestable ? l10n.requestMore4k : l10n.requestMore)
        : controller.only4kRequestable
            ? l10n.requestSeriesOrMovie4k(
                controller.isSeries ? l10n.series : l10n.movie,
              )
            : l10n.requestSeriesOrMovie(
                controller.isSeries ? l10n.series : l10n.movie,
              ),
  CinemaSeerrState.requested => l10n.seerrRequestedStatus,
  CinemaSeerrState.pending => l10n.pendingStatus,
  CinemaSeerrState.processing => l10n.processing,
  CinemaSeerrState.partiallyAvailable => l10n.partiallyAvailable,
  CinemaSeerrState.available => l10n.seerrAvailableStatus,
};

/// Shows Skip and Request in the Flutter player. The controller decides when they appear and
/// what they do.
class CinemaModeActionsOverlay extends StatelessWidget {
  const CinemaModeActionsOverlay({
    super.key,
    required this.controller,
    required this.skipFocus,
    required this.requestFocus,
    required this.positionStream,
    required this.position,
    required this.countdownStyle,
    required this.onDismiss,
  });

  final CinemaModeController controller;
  final FocusNode skipFocus;
  final FocusNode requestFocus;
  final Stream<Duration> positionStream;
  final Duration position;
  final MediaSegmentCountdown countdownStyle;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final safe = MediaQuery.viewPaddingOf(context);
    final isTv = PlatformDetection.isTV;
    final mobile = PlatformDetection.isMobile && !isTv;
    final skipLabel = l10n.skipSegment(l10n.trailer);
    final status = cinemaRequestLabel(controller, l10n);
    final requestFocused = isTv &&
        controller.canRequest &&
        controller.focusedAction == CinemaAction.request;
    final right = 24.0 + (mobile ? safe.right : 0);
    return Positioned(
      right: right,
      bottom: safe.bottom + (mobile ? 16 : 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width - right - safe.left - 24,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (status != null) ...[
              Flexible(
                child: _seerrAction(
                  context,
                  label: status,
                  focusNode: requestFocus,
                  enabled: controller.canRequest,
                  focused: requestFocused,
                  onPressed: () => controller.request(),
                ),
              ),
              const SizedBox(width: 12),
            ],
            // Keep the close button above Skip, even when the Request label changes.
            SkipSegmentOverlay(
              key: const ValueKey('cinema-skip'),
              inline: true,
              segment: MediaSegment(
                id: '__preroll__${controller.generation}',
                itemId: '',
                type: MediaSegmentType.preview,
                start: Duration.zero,
                end: controller.duration,
              ),
              actionLabel: controller.media == null
                  ? l10n.settingsSkip
                  : skipLabel,
              labelAlternatives: [l10n.settingsSkip, skipLabel],
              countdownStyle: countdownStyle,
              focusNode: skipFocus,
              handleActivationKeys: false,
              outlineColor: requestFocused
                  ? AppColorScheme.onSurface
                  : AppColorScheme.accent,
              onSkip: controller.skip,
              onDismiss: onDismiss,
              positionStream: positionStream,
              initialPosition: position,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _seerrAction(
  BuildContext context, {
  required String label,
  required FocusNode focusNode,
  required bool enabled,
  required bool focused,
  required VoidCallback onPressed,
}) {
  final isTv = PlatformDetection.isTV;
  return Semantics(
    button: true,
    enabled: enabled,
    label: label,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        focusNode: focusNode,
        canRequestFocus: enabled,
        onTap: enabled ? onPressed : null,
        borderRadius: AppRadius.circular(28),
        child: playbackGlassAction(
          context: context,
          outlineKey: const ValueKey('cinema-request-outline'),
          outlineColor: !enabled
              ? null
              : focused
                  ? AppColorScheme.accent
                  : (isTv ? AppColorScheme.onSurface : AppColorScheme.accent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(
                  alpha: enabled ? 1 : 0.65,
                ),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
