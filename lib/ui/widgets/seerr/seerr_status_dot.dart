import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../media_badge.dart';
import 'seerr_status_pill.dart';

export '../../../data/services/seerr/seerr_api_models.dart'
    show SeerrMediaStatus;
export '../../../preference/preference_constants.dart' show SeerrBadgeStyle;

/// How posters show a Seerr status, or null when the user turned the badges off.
SeerrBadgeStyle? seerrBadgeStyle([UserPreferences? prefs]) {
  prefs ??= GetIt.instance.isRegistered<UserPreferences>()
      ? GetIt.instance<UserPreferences>()
      : null;
  if (prefs == null) return SeerrBadgeStyle.badge;
  if (!prefs.get(UserPreferences.showSeerrAvailabilityBadges)) return null;
  return prefs.get(UserPreferences.seerrBadgeStyle);
}

/// How far a [SeerrStatusBanner] reaches down the poster, so the badges that
/// share its top edge can sit under it.
const double kSeerrStatusBannerHeight = 20;

/// The Seerr status written across the top of a poster, in its own color.
class SeerrStatusBanner extends StatelessWidget {
  final int? status;

  const SeerrStatusBanner({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = seerrStatusColor(status);
    // Light fills like Pending's yellow need dark text to stay readable.
    final ink = color.computeLuminance() > 0.45
        ? AppColors.black
        : AppColorScheme.onBadge;
    return Container(
      height: kSeerrStatusBannerHeight,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          seerrMediaStatusLabel(status, AppLocalizations.of(context))
              .toUpperCase(),
          maxLines: 1,
          style: TextStyle(
            color: ink,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
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
        boxShadow: kMediaBadgeShadow,
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }
}
