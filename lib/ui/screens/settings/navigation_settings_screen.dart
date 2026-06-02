import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/overlay_color_palette.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../../l10n/app_localizations.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class NavigationSettingsScreen extends StatefulWidget {
  const NavigationSettingsScreen({super.key});

  @override
  State<NavigationSettingsScreen> createState() =>
      _NavigationSettingsScreenState();
}

class _NavigationSettingsScreenState extends State<NavigationSettingsScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  bool _navbarNormalizeQueued = false;

  void _pushSync() {
    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  String _navbarPositionLabel(NavbarPosition pos, AppLocalizations l10n) =>
      switch (pos) {
        NavbarPosition.top => l10n.topBar,
        NavbarPosition.left => l10n.leftSidebar,
        NavbarPosition.bottom => 'Bottom Bar',
      };

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final positions = NavigationLayout.availableNavbarPositions;
    final storedPosition = _prefs.get(UserPreferences.navbarPosition);
    final navbarPosition = positions.contains(storedPosition)
        ? storedPosition
        : NavbarPosition.top;
    if (storedPosition != navbarPosition && !_navbarNormalizeQueued) {
      _navbarNormalizeQueued = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navbarNormalizeQueued = false;
        if (!mounted) return;
        _prefs.set(UserPreferences.navbarPosition, navbarPosition);
        NavigationLayout.positionNotifier.value = navbarPosition;
        _pushSync();
      });
    }
    final l10n = AppLocalizations.of(context);

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.navigation)),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.view_sidebar),
              title: Text(l10n.navigationStyle),
              subtitle: Text(_navbarPositionLabel(navbarPosition, l10n)),
              onTap: () {
                var index = positions.indexOf(navbarPosition);
                if (index < 0) index = 0;
                final newPos = positions[(index + 1) % positions.length];
                _prefs.set(UserPreferences.navbarPosition, newPos);
                _pushSync();
                NavigationLayout.positionNotifier.value = newPos;
                setState(() {});
              },
            ),
            const Divider(),
            SwitchPreferenceTile(
              preference: UserPreferences.showShuffleButton,
              title: l10n.showShuffleButton,
              icon: Icons.shuffle,
              onChanged: _pushSync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showGenresButton,
              title: l10n.showGenresButton,
              icon: Icons.category,
              onChanged: _pushSync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showFavoritesButton,
              title: l10n.showFavoritesButton,
              icon: Icons.favorite,
              onChanged: _pushSync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showLibrariesInToolbar,
              title: l10n.showLibrariesInToolbar,
              iconBuilder: (size, color) => Image.asset(
                'assets/icons/clapperboard.png',
                width: size,
                height: size,
                color: color,
                fit: BoxFit.contain,
              ),
              onChanged: _pushSync,
            ),
            const Divider(),
            SliderPreferenceTile(
              preference: UserPreferences.navbarOpacity,
              title: l10n.navbarOpacity,
              icon: Icons.opacity,
              min: 0,
              max: 100,
              divisions: 20,
              labelOf: (v) => l10n.percentValue(v),
              onChangeEnd: _pushSync,
            ),
            StringPickerPreferenceTile(
              preference: UserPreferences.navbarColor,
              title: l10n.navbarColor,
              icon: Icons.color_lens,
              options: OverlayColorPalette.localizedOptions(l10n),
              onChanged: _pushSync,
            ),
          ],
        ),
      ),
    );
  }
}
