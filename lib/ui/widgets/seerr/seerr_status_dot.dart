import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// Seerr media status codes, as the server reports them on `mediaInfo.status`
/// and `mediaInfo.status4k`.
abstract final class SeerrMediaStatus {
  static const unknown = 1;
  static const pending = 2;
  static const processing = 3;
  static const partiallyAvailable = 4;
  static const available = 5;
  static const blocklisted = 6;
  static const deleted = 7;

  /// The statuses [SeerrStatusDot] draws. Anything else has nothing useful to
  /// say on a card corner.
  static bool hasDot(int? status) =>
      status == pending ||
      status == processing ||
      status == partiallyAvailable ||
      status == available;
}

/// The colour a Seerr status carries wherever it is shown, so a card corner, a
/// season marker and a header pill never disagree about what a status means.
Color seerrStatusColor(int? status) => switch (status) {
      SeerrMediaStatus.available ||
      SeerrMediaStatus.partiallyAvailable =>
        AppColorScheme.statusAvailable,
      SeerrMediaStatus.processing => AppColorScheme.statusRequested,
      SeerrMediaStatus.pending => AppColorScheme.statusPending,
      SeerrMediaStatus.blocklisted || SeerrMediaStatus.deleted =>
        AppColorScheme.statusError,
      _ => AppColorScheme.onSurface.withValues(alpha: 0.54),
    };

/// The small circular Seerr status marker that sits on card corners.
///
/// Available is an outlined check, partially available is a filled dash, and
/// anything still on its way is an outlined clock in its own colour.
class SeerrStatusDot extends StatelessWidget {
  final int? status;
  final double size;

  const SeerrStatusDot({super.key, required this.status, this.size = 20});

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.6;

    if (status == SeerrMediaStatus.available) {
      return _circle(
        borderColor: AppColorScheme.statusAvailable,
        icon: Icon(
          Icons.check_rounded,
          size: iconSize,
          color: AppColorScheme.statusAvailable,
        ),
      );
    }

    if (status == SeerrMediaStatus.partiallyAvailable) {
      return _circle(
        fillColor: AppColorScheme.statusAvailable,
        icon: Icon(
          Icons.remove_rounded,
          size: size * 0.65,
          color: AppColorScheme.onBadge,
        ),
      );
    }

    final color = status == SeerrMediaStatus.processing
        ? AppColorScheme.statusRequested
        : AppColorScheme.statusPending;
    return _circle(
      borderColor: color,
      icon: Icon(Icons.schedule_rounded, size: iconSize, color: color),
    );
  }

  Widget _circle({
    required Widget icon,
    Color? fillColor,
    Color? borderColor,
  }) {
    final effectiveFillColor = fillColor ?? AppColorScheme.onBadge;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: effectiveFillColor,
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: borderColor ?? effectiveFillColor,
            width: 1.5,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }
}
