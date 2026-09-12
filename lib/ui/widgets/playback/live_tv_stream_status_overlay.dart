import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../playback/live_tv_stream_status.dart';
import '../focus/focusable_button.dart';

/// What the live player shows over the video for a [LiveTvStreamStatus].
///
/// Waiting states get a spinner with a line under it that says what is
/// being waited for. The two failure states get a card with Retry and Back,
/// since by then the tuner has already given up and a spinner would only
/// hide that. [compact] is for the mini-player box behind the in-player
/// guide, where there is no room for the card.
class LiveTvStreamStatusOverlay extends StatelessWidget {
  const LiveTvStreamStatusOverlay({
    super.key,
    required this.status,
    required this.onRetry,
    required this.onExit,
    required this.retryFocusNode,
    this.compact = false,
  });

  final LiveTvStreamStatus status;
  final VoidCallback onRetry;
  final VoidCallback onExit;

  /// The owning screen moves the remote's focus onto this node when the card
  /// appears. Autofocus alone loses to whatever player control already holds
  /// focus in the same scope.
  final FocusNode retryFocusNode;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (status) {
      case LiveTvStreamStatus.idle:
      case LiveTvStreamStatus.playing:
        return const SizedBox.shrink();
      case LiveTvStreamStatus.buffering:
        return _spinner(null);
      case LiveTvStreamStatus.connecting:
        return _spinner(compact ? null : l10n.liveTvConnecting);
      case LiveTvStreamStatus.stillTrying:
        return _spinner(l10n.liveTvTunerStillTrying);
      case LiveTvStreamStatus.reconnecting:
        return _spinner(l10n.liveTvReconnecting);
      case LiveTvStreamStatus.unavailable:
        return _failure(
          context,
          title: l10n.liveTvChannelUnavailableTitle,
          body: l10n.liveTvChannelUnavailableBody,
        );
      case LiveTvStreamStatus.lost:
        return _failure(
          context,
          title: l10n.liveTvChannelLostTitle,
          body: l10n.liveTvChannelLostBody,
        );
    }
  }

  Widget _spinner(String? label) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: AppColorScheme.accent),
          if (label != null) ...[
            const SizedBox(height: AppSpacing.spaceLg),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spaceLg,
                vertical: AppSpacing.spaceSm,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius: AppRadius.circular(8),
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppTypography.fontSizeMd,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _failure(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.7),
      child: Center(
        child: compact
            ? Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppTypography.fontSizeSm,
                  fontWeight: FontWeight.w600,
                ),
              )
            : _card(title: title, body: body),
      ),
    );
  }

  Widget _card({required String title, required String body}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Container(
        margin: const EdgeInsets.all(AppSpacing.spaceXl),
        padding: const EdgeInsets.all(AppSpacing.spaceXl),
        decoration: BoxDecoration(
          color: AppColorScheme.surface,
          borderRadius: AppRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.tv_off_rounded,
              size: 40,
              color: AppColorScheme.onSurface.withValues(alpha: 0.8),
            ),
            const SizedBox(height: AppSpacing.spaceMd),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onSurface,
                fontSize: AppTypography.fontSizeXl,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceSm),
            Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.62),
                fontSize: AppTypography.fontSizeSm,
                height: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceXl),
            _FailureActions(
              retryFocusNode: retryFocusNode,
              onRetry: onRetry,
              onExit: onExit,
            ),
          ],
        ),
      ),
    );
  }
}

/// Retry over Back, on the app's own focusable buttons. Material buttons
/// never fire from a TV remote here: the select key is consumed by the
/// focus wrapper layer, so the buttons have to be that layer. Up and down
/// move between the two, and the remote's back key leaves the player.
class _FailureActions extends StatefulWidget {
  const _FailureActions({
    required this.retryFocusNode,
    required this.onRetry,
    required this.onExit,
  });

  final FocusNode retryFocusNode;
  final VoidCallback onRetry;
  final VoidCallback onExit;

  @override
  State<_FailureActions> createState() => _FailureActionsState();
}

class _FailureActionsState extends State<_FailureActions> {
  final _backFocus = FocusNode(debugLabel: 'LiveTvBack');

  @override
  void dispose() {
    _backFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final retryFocus = widget.retryFocusNode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FocusableButton(
          focusNode: retryFocus,
          borderRadius: 14,
          padding: EdgeInsets.zero,
          onPressed: widget.onRetry,
          onNavigateDown: _backFocus.requestFocus,
          onBack: widget.onExit,
          semanticLabel: l10n.retry,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13),
            decoration: BoxDecoration(
              color: AppColorScheme.accent,
              borderRadius: AppRadius.circular(14),
            ),
            child: Text(
              l10n.retry,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spaceSm),
        FocusableButton(
          focusNode: _backFocus,
          borderRadius: 14,
          padding: EdgeInsets.zero,
          onPressed: widget.onExit,
          onNavigateUp: retryFocus.requestFocus,
          onBack: widget.onExit,
          semanticLabel: l10n.back,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(
              l10n.back,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.75),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
