import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/bottom_nav_tabs.dart';
import '../../../preference/preference_constants.dart';
import '../../screens/settings/settings_side_panel.dart';
import '../adaptive/sf_symbol.dart';
import '../server_messages_dialog.dart';
import '../settings/settings_panel.dart';
import '../user_menu_dialog.dart';
import 'bottom_nav_controller.dart';
import 'bottom_nav_destinations.dart';
import 'bottom_nav_model.dart';
import 'bottom_nav_sheet.dart';
import 'bottom_nav_tab.dart';
import 'bottom_nav_theme.dart';
import 'libraries_sheet.dart';

/// The You tab: who is signed in, everything that isn't on the bar, and the
/// way into settings.
Future<void> showYouHub({
  required BuildContext context,
  required BottomNavController controller,
  required BottomNavTheme theme,
  required BottomNavbarStyle style,
  required double barHeight,
}) async {
  controller.hubOpen = true;
  try {
    await showBottomNavSheet(
      context: context,
      theme: theme,
      style: style,
      barHeight: barHeight,
      builder: (sheetContext) {
        // The sheet outlives nothing it opens, so each action closes it first
        // and then runs against the bar's context.
        void then(void Function() action) {
          Navigator.of(sheetContext).pop();
          if (context.mounted) action();
        }

        return ListenableBuilder(
          listenable: controller,
          builder: (_, _) => _YouHub(
            controller: controller,
            theme: theme,
            onAccount: () => then(() => showUserMenu(context)),
            onTile: (tile) => then(() {
              final tab = tile.tab;
              if (tab == BottomNavTab.libraries) {
                showBottomNavLibrariesSheet(
                  context: context,
                  controller: controller,
                  theme: theme,
                  style: style,
                  barHeight: barHeight,
                );
              } else if (tab != null) {
                openBottomNavTab(context, tab);
              } else {
                runBottomNavHubAction(context, tile.action!);
              }
            }),
            onMessages: () => then(() => showServerMessagesDialog(context)),
            onSettings: () => then(
              () => SettingsPanel.open(context, const SettingsSidePanel()),
            ),
          ),
        );
      },
    );
  } finally {
    controller.hubOpen = false;
  }
}

class _YouHub extends StatelessWidget {
  final BottomNavController controller;
  final BottomNavTheme theme;
  final VoidCallback onAccount;
  final ValueChanged<BottomNavHubTile> onTile;
  final VoidCallback onMessages;
  final VoidCallback onSettings;

  const _YouHub({
    required this.controller,
    required this.theme,
    required this.onAccount,
    required this.onTile,
    required this.onMessages,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onBar = theme.onBar;
    final tiles = controller.hubTiles();
    final serverName = controller.serverName;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BottomNavSheetGrabber(color: onBar),
          Row(
            children: [
              BottomNavAvatar(
                imageUrl: controller.userImageUrl,
                name: controller.userName,
                size: 52,
                ring: theme.activeColor(0),
                fallbackColor: onBar,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.labelStyle.copyWith(
                        color: onBar,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (serverName != null && serverName.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        serverName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.labelStyle.copyWith(
                          color: onBar.withValues(alpha: 0.6),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: onAccount,
                icon: AdaptiveIcon(
                  Icons.manage_accounts_rounded,
                  size: 18,
                  color: onBar,
                ),
                label: Text(l10n.account),
                style: OutlinedButton.styleFrom(
                  foregroundColor: onBar,
                  side: BorderSide(color: onBar.withValues(alpha: 0.16)),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.circular(18),
                  ),
                ),
              ),
            ],
          ),
          if (tiles.isNotEmpty) ...[
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
              children: [
                for (var i = 0; i < tiles.length; i++)
                  _HubTile(
                    tile: tiles[i],
                    slot: i,
                    theme: theme,
                    onTap: () => onTile(tiles[i]),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Material(
            color: onBar.withValues(alpha: 0.05),
            borderRadius: AppRadius.circular(18),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                if (controller.messagesVisible)
                  _HubRow(
                    icon: Icons.info_outline_rounded,
                    label: l10n.serverMessages,
                    theme: theme,
                    trailing: _countBadge(),
                    onTap: onMessages,
                  ),
                _HubRow(
                  icon: Icons.settings_rounded,
                  label: l10n.settings,
                  theme: theme,
                  onTap: onSettings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget? _countBadge() {
    final unread = controller.unreadMessages;
    if (unread <= 0) return null;
    return Container(
      constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE03B36),
        borderRadius: AppRadius.circular(11),
      ),
      child: Text(
        unread > 9 ? '9+' : '$unread',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _HubTile extends StatelessWidget {
  final BottomNavHubTile tile;
  final int slot;
  final BottomNavTheme theme;
  final VoidCallback onTap;

  const _HubTile({
    required this.tile,
    required this.slot,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onBar = theme.onBar;
    final iconColor = theme.activeColor(slot);
    final tab = tile.tab;
    final label = tab != null
        ? bottomNavTabLabel(l10n, tab)
        : bottomNavHubActionLabel(l10n, tile.action!);
    final icon = tab != null
        ? bottomNavTabIconWidget(tab, active: false, size: 22, color: iconColor)
        : AdaptiveIcon(
            bottomNavHubActionIcon(tile.action!),
            size: 22,
            color: iconColor,
          );

    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.circular(18),
          child: Ink(
            decoration: BoxDecoration(
              color: onBar.withValues(alpha: 0.06),
              borderRadius: AppRadius.circular(18),
              border: Border.all(color: onBar.withValues(alpha: 0.06)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelStyle.copyWith(
                    color: onBar,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HubRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final BottomNavTheme theme;
  final Widget? trailing;
  final VoidCallback onTap;

  const _HubRow({
    required this.icon,
    required this.label,
    required this.theme,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final onBar = theme.onBar;
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.circular(18)),
      leading: AdaptiveIcon(icon, size: 22, color: onBar.withValues(alpha: 0.8)),
      title: Text(
        label,
        style: TextStyle(color: onBar, fontWeight: FontWeight.w600),
      ),
      trailing: trailing ??
          AdaptiveIcon(
            Icons.chevron_right_rounded,
            size: 20,
            color: onBar.withValues(alpha: 0.4),
          ),
    );
  }
}
