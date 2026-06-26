part of '../settings_side_panel.dart';

class _NavigationCategoryScreen extends StatefulWidget {
  const _NavigationCategoryScreen();

  @override
  State<_NavigationCategoryScreen> createState() =>
      _NavigationCategoryScreenState();
}

class _NavigationCategoryScreenState extends State<_NavigationCategoryScreen> {
  late final PreferenceBinding<bool> _showShuffleButtonBinding;
  late final PluginSyncService _syncService;
  bool _navbarNormalizeQueued = false;

  @override
  void initState() {
    super.initState();
    _syncService = GetIt.instance<PluginSyncService>();
    _syncService.addListener(_onSyncChanged);
    _showShuffleButtonBinding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.showShuffleButton,
    );
  }

  @override
  void dispose() {
    _syncService.removeListener(_onSyncChanged);
    _showShuffleButtonBinding.dispose();
    super.dispose();
  }

  void _onSyncChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final seerrEnabledOnAccount = GetIt.instance<SeerrPreferences>().enabled;
    final availableNavbarPositions = NavigationLayout.availableNavbarPositions;
    final prefs = GetIt.instance<UserPreferences>();
    final currentNavbarPosition = prefs.get(UserPreferences.navbarPosition);
    if (!NavigationLayout.allowBottomNavbar &&
        currentNavbarPosition == NavbarPosition.bottom &&
        !_navbarNormalizeQueued) {
      _navbarNormalizeQueued = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navbarNormalizeQueued = false;
        if (!mounted) return;
        prefs.set(UserPreferences.navbarPosition, NavbarPosition.top);
        NavigationLayout.positionNotifier.value = NavbarPosition.top;
        _pushPersonalizationSync();
      });
    }
    return ValueListenableBuilder<bool>(
      valueListenable: _showShuffleButtonBinding,
      builder: (context, showShuffleButton, _) => Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.navigation)),
        body: ListView(
          children: [
            adaptiveListSection(
              children: [
                EnumPreferenceTile<NavbarPosition>(
                  preference: UserPreferences.navbarPosition,
                  title: l10n.navigationStyle,
                  icon: Icons.view_sidebar,
                  values: availableNavbarPositions,
                  labelOf: (v) => switch (v) {
                    NavbarPosition.top => l10n.topBar,
                    NavbarPosition.left => l10n.leftSidebar,
                    NavbarPosition.bottom => l10n.bottomBar,
                  },
                  onChanged: () {
                    final pos = GetIt.instance<UserPreferences>().get(
                      UserPreferences.navbarPosition,
                    );
                    NavigationLayout.positionNotifier.value = pos;
                    _pushPersonalizationSync();
                  },
                ),
                _NavbarColorPickerTile(onChanged: _pushPersonalizationSync),
                SliderPreferenceTile(
                  preference: UserPreferences.navbarOpacity,
                  title: l10n.navbarOpacity,
                  icon: Icons.opacity,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  labelOf: (v) => '$v%',
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.showShuffleButton,
                  title: l10n.showShuffleButton,
                  subtitle: l10n.settingsShowShuffleButtonInNavigation,
                  icon: Icons.shuffle,
                  onChanged: _pushPersonalizationSync,
                ),
                if (showShuffleButton)
                  _ShuffleContentTypePickerTile(
                    onChanged: _pushPersonalizationSync,
                  ),
                SwitchPreferenceTile(
                  preference: UserPreferences.showGenresButton,
                  title: l10n.showGenresButton,
                  subtitle: l10n.settingsShowGenresButtonInNavigation,
                  icon: Icons.theater_comedy,
                  onChanged: _pushPersonalizationSync,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.showFavoritesButton,
                  title: l10n.showFavoritesButton,
                  subtitle: l10n.settingsShowFavoritesButtonInNavigation,
                  icon: Icons.favorite,
                  onChanged: _pushPersonalizationSync,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.showLibrariesInToolbar,
                  title: l10n.showLibrariesInToolbar,
                  subtitle: l10n.settingsShowLibrariesButtonInNavigation,
                  icon: Icons.video_library,
                  onChanged: _pushPersonalizationSync,
                ),
                if (seerrEnabledOnAccount && _syncService.seerrAvailable)
                  SwitchPreferenceTile(
                    preference: UserPreferences.showSeerrButton,
                    title: l10n.showSeerrButton,
                    subtitle: l10n.settingsShowSeerrButtonInNavigation,
                    iconBuilder: (size, color) => Image.asset(
                      'assets/icons/seerr.png',
                      width: size,
                      height: size,
                    ),
                    onChanged: _pushPersonalizationSync,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
