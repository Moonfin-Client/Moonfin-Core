part of '../settings_side_panel.dart';

class _NavigationCategoryScreen extends StatefulWidget {
  const _NavigationCategoryScreen();

  @override
  State<_NavigationCategoryScreen> createState() =>
      _NavigationCategoryScreenState();
}

class _NavigationCategoryScreenState extends State<_NavigationCategoryScreen> {
  late final PluginSyncService _syncService;
  bool _navbarNormalizeQueued = false;

  @override
  void initState() {
    super.initState();
    _syncService = GetIt.instance<PluginSyncService>();
    _syncService.addListener(_onSyncChanged);
  }

  @override
  void dispose() {
    _syncService.removeListener(_onSyncChanged);
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
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.navigation)),
      body: ListView(
        children: [
          _SectionHeader(l10n.appearance),
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
                preference: UserPreferences.navbarAlwaysExpanded,
                title: l10n.navbarAlwaysExpanded,
                subtitle: l10n.settingsAlwaysExpandNavbarLabels,
                icon: Icons.unfold_more,
                onChanged: _pushPersonalizationSync,
              ),
            ],
          ),
          _SectionHeader(l10n.navButtons),
          adaptiveListSection(
            children: [
              SwitchPreferenceTile(
                preference: UserPreferences.showShuffleButton,
                title: l10n.showShuffleButton,
                subtitle: l10n.settingsShowShuffleButtonInNavigation,
                icon: Icons.shuffle,
                onChanged: _pushPersonalizationSync,
              ),
              // The switch above writes through its own binding, so this watches
              // the preferences directly and shows the picker the moment it's on.
              ListenableBuilder(
                listenable: prefs,
                builder: (context, _) =>
                    prefs.get(UserPreferences.showShuffleButton)
                    ? _ShuffleContentTypePickerTile(
                        onChanged: _pushPersonalizationSync,
                      )
                    : const SizedBox.shrink(),
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
              SwitchPreferenceTile(
                preference: UserPreferences.enableFolderView,
                title: l10n.enableFolderView,
                subtitle: l10n.showFolderBrowsingOption,
                icon: Icons.folder,
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
              if (PlatformDetection.supportsOfflineDownloads &&
                  !PlatformDetection.isWeb)
                SwitchPreferenceTile(
                  preference: UserPreferences.showDownloadsButton,
                  title: l10n.showDownloadsButton,
                  icon: Icons.download_for_offline,
                  onChanged: _pushPersonalizationSync,
                ),
              SwitchPreferenceTile(
                preference: UserPreferences.showServerMessagesButton,
                title: l10n.serverMessagesShowButton,
                subtitle: l10n.serverMessagesShowButtonSubtitle,
                icon: Icons.info_outline_rounded,
                onChanged: _pushPersonalizationSync,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
