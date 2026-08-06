import 'package:flutter/material.dart';

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
  admin('admin');

  const DetailButton(this.id, {this.canHide = true});

  final String id;

  /// A button the row always keeps. It still moves, it just has no switch.
  final bool canHide;

  /// Whether this device can put the button on screen at all. A button that
  /// never gets drawn here isn't worth offering a switch for.
  bool get isOffered => switch (this) {
    DetailButton.cast ||
    DetailButton.download ||
    DetailButton.deleteFiles => !PlatformDetection.isTV,
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
