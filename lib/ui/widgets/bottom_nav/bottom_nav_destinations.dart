import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/bottom_nav_tabs.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
import '../../navigation/destinations.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../screens/downloads/downloads_panel.dart';
import '../../screens/syncplay/syncplay_screen.dart';
import '../adaptive/sf_symbol.dart';
import '../seerr_icons.dart';
import '../shuffle_overlay.dart';
import 'bottom_nav_model.dart';
import 'bottom_nav_tab.dart';

String bottomNavTabLabel(AppLocalizations l10n, BottomNavTab tab) =>
    switch (tab) {
      BottomNavTab.search => l10n.search,
      BottomNavTab.libraries => l10n.libraries,
      BottomNavTab.favorites => l10n.favorites,
      BottomNavTab.genres => l10n.genres,
      BottomNavTab.liveTv => l10n.liveTv,
      BottomNavTab.discover => GetIt.instance.isRegistered<SeerrPreferences>()
          ? GetIt.instance<SeerrPreferences>().labelOrDefault(l10n.seerr)
          : l10n.seerr,
      BottomNavTab.folders => l10n.folders,
    };

String bottomNavHubActionLabel(
  AppLocalizations l10n,
  BottomNavHubAction action,
) =>
    switch (action) {
      BottomNavHubAction.saved => l10n.savedMedia,
      BottomNavHubAction.shuffle => l10n.shuffle,
      BottomNavHubAction.syncPlay => l10n.syncPlay,
    };

String bottomNavbarStyleLabel(
  AppLocalizations l10n,
  BottomNavbarStyle style,
) =>
    switch (style) {
      BottomNavbarStyle.dock => l10n.bottomNavbarStyleDock,
      BottomNavbarStyle.split => l10n.bottomNavbarStyleSplit,
      BottomNavbarStyle.strip => l10n.bottomNavbarStyleStrip,
    };

String bottomNavbarStyleHint(AppLocalizations l10n, BottomNavbarStyle style) =>
    switch (style) {
      BottomNavbarStyle.dock => l10n.setupNavbarStyleDockHint,
      BottomNavbarStyle.split => l10n.setupNavbarStyleSplitHint,
      BottomNavbarStyle.strip => l10n.setupNavbarStyleStripHint,
    };

IconData bottomNavHubActionIcon(BottomNavHubAction action) => switch (action) {
      BottomNavHubAction.saved => Icons.download_for_offline,
      BottomNavHubAction.shuffle => Icons.shuffle_rounded,
      BottomNavHubAction.syncPlay => Icons.groups_rounded,
    };

/// Filled when active and outlined when not, the way both platforms mark
/// the current tab. Genres keeps the artwork the other navbars use, so only
/// its colour changes.
Widget bottomNavTabIconWidget(
  BottomNavTab tab, {
  required bool active,
  required double size,
  required Color color,
}) {
  Widget adaptive(IconData filled, IconData outlined) =>
      AdaptiveIcon(active ? filled : outlined, size: size, color: color);

  return switch (tab) {
    BottomNavTab.search =>
      adaptive(Icons.search_rounded, Icons.search_rounded),
    BottomNavTab.libraries =>
      adaptive(Icons.video_library_rounded, Icons.video_library_outlined),
    BottomNavTab.favorites =>
      adaptive(Icons.favorite_rounded, Icons.favorite_border_rounded),
    BottomNavTab.liveTv =>
      adaptive(Icons.live_tv_rounded, Icons.live_tv_outlined),
    BottomNavTab.folders =>
      adaptive(Icons.folder_rounded, Icons.folder_outlined),
    BottomNavTab.genres => Image.asset(
        'assets/icons/genres.png',
        width: size,
        height: size,
        color: color,
        fit: BoxFit.contain,
      ),
    BottomNavTab.discover => SeerrIcon(size: size, color: color, solid: active),
  };
}

/// What a bar style draws for [item]. The bar and the setup wizard's
/// previews share it, so the previews show the real tabs.
BottomNavItemView bottomNavItemView(
  BottomNavBarItem item,
  AppLocalizations l10n, {
  required Widget Function(bool active, double size, Color color) avatar,
  int badge = 0,
}) {
  return switch (item.kind) {
    BottomNavItemKind.home => BottomNavItemView(
        id: item.id,
        label: l10n.home,
        slot: item.slot,
        icon: (active, size, color) => AdaptiveIcon(
          active ? Icons.home_rounded : Icons.home_outlined,
          size: size,
          color: color,
        ),
      ),
    BottomNavItemKind.tab => BottomNavItemView(
        id: item.id,
        label: bottomNavTabLabel(l10n, item.tab!),
        slot: item.slot,
        icon: (active, size, color) => bottomNavTabIconWidget(
          item.tab!,
          active: active,
          size: size,
          color: color,
        ),
      ),
    BottomNavItemKind.you => BottomNavItemView(
        id: item.id,
        label: l10n.navYou,
        slot: item.slot,
        badge: badge,
        icon: avatar,
      ),
  };
}

/// Opens [tab]'s screen. Libraries has no screen of its own and is handled by
/// the caller, which owns the library list.
void openBottomNavTab(BuildContext context, BottomNavTab tab) {
  final route = switch (tab) {
    BottomNavTab.search => Destinations.search,
    BottomNavTab.favorites => Destinations.allFavorites,
    BottomNavTab.genres => Destinations.allGenres,
    BottomNavTab.liveTv => Destinations.liveTvGuide,
    BottomNavTab.discover => Destinations.seerrDiscover,
    BottomNavTab.folders => Destinations.folderView,
    BottomNavTab.libraries => null,
  };
  if (route == null) return;
  context.navigateTopLevel(route);
}

/// Home refreshes when tapped where it already is, and asks for a refresh on
/// arrival otherwise.
void openBottomNavHome(BuildContext context, {required bool alreadyHome}) {
  if (alreadyHome) {
    homeRefreshBus.request();
    return;
  }
  homeRefreshBus.requestAfterNavigation();
  context.go(Destinations.home);
}

void runBottomNavHubAction(BuildContext context, BottomNavHubAction action) {
  switch (action) {
    case BottomNavHubAction.saved:
      showDownloadsDialog(context);
    case BottomNavHubAction.shuffle:
      showShuffleOverlay(context);
    case BottomNavHubAction.syncPlay:
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => const SyncPlayScreen()),
      );
  }
}
