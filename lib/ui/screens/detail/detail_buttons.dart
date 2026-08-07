import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/button_layout.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';

/// The details screen action buttons a user can arrange. Play is absent on
/// purpose, it always leads the row because it renders as the primary button
/// and anchors the focus the screen hands out.
///
/// Ids are what gets stored, so renaming one drops whatever the user had
/// arranged for it.
enum DetailButton {
  // Declared first so they land beside the primary button for everyone who
  // already arranged this row.
  seerrRequest('seerrRequest'),
  seerrRequest4k('seerrRequest4k'),
  shuffle('shuffle'),
  restart('restart', canHide: false),
  playOffline('playOffline', canHide: false),
  audio('audio'),
  subtitles('subtitles'),
  version('version'),
  cast('cast'),
  trailer('trailer'),
  watchWithGroup('watchWithGroup'),
  watched('watched'),
  favorite('favorite'),
  playlist('playlist'),
  download('download'),
  deleteFiles('deleteFiles'),
  goToSeries('goToSeries'),
  seerrWatchlist('seerrWatchlist'),
  seerrReportIssue('seerrReportIssue'),
  seerrManage('seerrManage'),
  admin('admin');

  const DetailButton(this.id, {this.canHide = true});

  final String id;

  /// A button the row always keeps. It still moves, it just has no switch.
  final bool canHide;

  /// Whether the button means anything for a title that is not in the library.
  /// Everything else needs something to play, mark or download.
  bool get availableInSeerrOnly => switch (this) {
    DetailButton.seerrRequest ||
    DetailButton.seerrRequest4k ||
    DetailButton.seerrWatchlist ||
    DetailButton.seerrReportIssue ||
    DetailButton.seerrManage ||
    DetailButton.trailer => true,
    _ => false,
  };

  /// Whether this device can put the button on screen at all. A button that
  /// never gets drawn here isn't worth offering a switch for.
  bool get isOffered => switch (this) {
    DetailButton.cast ||
    DetailButton.download ||
    DetailButton.deleteFiles => !PlatformDetection.isTV,
    DetailButton.seerrRequest ||
    DetailButton.seerrRequest4k ||
    DetailButton.seerrWatchlist ||
    DetailButton.seerrReportIssue ||
    DetailButton.seerrManage =>
      GetIt.instance<PluginSyncService>().seerrAvailable,
    _ => true,
  };

  IconData get icon => switch (this) {
    DetailButton.shuffle => Icons.shuffle_rounded,
    DetailButton.restart => Icons.restart_alt,
    DetailButton.playOffline => Icons.offline_pin,
    DetailButton.audio => Icons.audiotrack,
    DetailButton.subtitles => Icons.subtitles,
    DetailButton.version => Icons.video_file,
    DetailButton.cast => Icons.cast,
    DetailButton.trailer => Icons.movie_outlined,
    DetailButton.watchWithGroup => Icons.groups_rounded,
    DetailButton.watched => Icons.check_circle_outline,
    DetailButton.favorite => Icons.favorite_border,
    DetailButton.playlist => Icons.playlist_add,
    DetailButton.download => Icons.download,
    DetailButton.deleteFiles => Icons.delete_outline,
    DetailButton.goToSeries => Icons.tv,
    DetailButton.seerrRequest || DetailButton.seerrRequest4k => Icons.add,
    DetailButton.seerrWatchlist => Icons.bookmark_border,
    DetailButton.seerrReportIssue => Icons.report_problem_outlined,
    DetailButton.seerrManage => Icons.rule,
    DetailButton.admin => Icons.settings,
  };

  String label(AppLocalizations l10n) => switch (this) {
    DetailButton.shuffle => l10n.shuffle,
    DetailButton.restart => l10n.restart,
    DetailButton.playOffline => l10n.playOffline,
    DetailButton.audio => l10n.audio,
    DetailButton.subtitles => l10n.subtitles,
    DetailButton.version => l10n.version,
    DetailButton.cast => l10n.cast,
    DetailButton.trailer => l10n.trailer,
    DetailButton.watchWithGroup => l10n.watchWithGroup,
    DetailButton.watched => l10n.watched,
    DetailButton.favorite => l10n.favorite,
    DetailButton.playlist => l10n.playlist,
    DetailButton.download => l10n.download,
    DetailButton.deleteFiles => l10n.deleteFiles,
    DetailButton.goToSeries => l10n.goToSeries,
    DetailButton.seerrRequest => l10n.request,
    DetailButton.seerrRequest4k => l10n.request4k,
    DetailButton.seerrWatchlist => l10n.watchlist,
    DetailButton.seerrReportIssue => l10n.reportIssue,
    DetailButton.seerrManage => l10n.manageRequests,
    DetailButton.admin => l10n.admin,
  };
}

final detailButtonLayout = ButtonLayout(
  hiddenTv: UserPreferences.hiddenDetailButtonsTv,
  hiddenMobile: UserPreferences.hiddenDetailButtonsMobile,
  hiddenDesktop: UserPreferences.hiddenDetailButtonsDesktop,
  orderTv: UserPreferences.detailButtonOrderTv,
  orderMobile: UserPreferences.detailButtonOrderMobile,
  orderDesktop: UserPreferences.detailButtonOrderDesktop,
);
