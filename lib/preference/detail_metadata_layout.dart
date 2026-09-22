import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../data/services/plugin_sync_service.dart';
import '../l10n/app_localizations.dart';
import 'button_layout.dart';
import 'user_preferences.dart';

/// One metadata item shown on the Details screen's primary metadata line.
enum DetailMetadataItem {
  year('year', Icons.calendar_today_outlined),
  parentalRating('parentalRating', Icons.verified_user_outlined),
  runtimeAndSeasons('runtimeAndSeasons', Icons.schedule_outlined),
  status('status', Icons.timelapse_outlined),
  genres('genres', Icons.category_outlined),
  seerrAvailability('seerrAvailability', Icons.cloud_download_outlined),
  upcomingEpisodeDate('upcomingEpisodeDate', Icons.event_available_outlined);

  const DetailMetadataItem(this.id, this.icon);

  final String id;
  final IconData icon;

  String label(AppLocalizations l10n) => switch (this) {
    DetailMetadataItem.year => l10n.detailMetadataYear,
    DetailMetadataItem.parentalRating => l10n.detailMetadataParentalRating,
    DetailMetadataItem.runtimeAndSeasons =>
      l10n.detailMetadataRuntimeAndSeasons,
    DetailMetadataItem.status => l10n.detailMetadataStatus,
    DetailMetadataItem.genres => l10n.detailMetadataGenres,
    DetailMetadataItem.seerrAvailability =>
      l10n.detailMetadataSeerrAvailability,
    DetailMetadataItem.upcomingEpisodeDate =>
      l10n.detailMetadataUpcomingEpisodeDate,
  };

  String? subtitle(AppLocalizations l10n) => switch (this) {
    DetailMetadataItem.upcomingEpisodeDate =>
      l10n.detailMetadataUpcomingEpisodeDateSubtitle,
    DetailMetadataItem.status => l10n.detailMetadataStatusSubtitle,
    DetailMetadataItem.seerrAvailability =>
      l10n.detailMetadataSeerrAvailabilitySubtitle,
    _ => null,
  };

  /// Whether this item is offered on this device / server configuration.
  bool get isOffered => switch (this) {
    DetailMetadataItem.seerrAvailability =>
      GetIt.instance.isRegistered<PluginSyncService>() &&
          GetIt.instance<PluginSyncService>().seerrAvailable,
    _ => true,
  };
}

/// The layout definition for the Details screen metadata row across device types.
final detailMetadataLayout = ButtonLayout(
  hiddenTv: UserPreferences.hiddenDetailMetadataTv,
  hiddenMobile: UserPreferences.hiddenDetailMetadataMobile,
  hiddenDesktop: UserPreferences.hiddenDetailMetadataDesktop,
  orderTv: UserPreferences.detailMetadataOrderTv,
  orderMobile: UserPreferences.detailMetadataOrderMobile,
  orderDesktop: UserPreferences.detailMetadataOrderDesktop,
);
